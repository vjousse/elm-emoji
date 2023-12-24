module EmojiPicker exposing
    ( Model, Msg(..)
    , PickerConfig, init
    , view, update
    )

{-| This module provides a general-purpose emoji picker, with emojis
segregated by category. See [this file](https://github.com/Holmusk/elmoji/blob/master/examples/Main.elm)
for an example of how to use the picker in your application!


# Internals

@docs Model, Msg


# Config & Initialization

@docs PickerConfig, init


# Functions to use in integration

@docs view, update

-}

import Dict exposing (Dict, get, isEmpty)
import Emojis exposing (Category, Emoji, emojiDict)
import Html exposing (Attribute, Html, div, input, p, span, text)
import Html.Attributes exposing (autofocus, hidden, id, type_)
import Html.Events exposing (onClick, onInput)
import Icons exposing (..)
import Styles exposing (..)
import Tuple exposing (first)



----- MODEL -----


type alias SkinColor =
    String


{-| When initializing the emoji picker, you'll need to provide a few
configuration parameters.

`offsetX`: the horizontal offset from where the picker is declared
`offsetY`: the vertical offset from where the picker is declared
`closeOnSelect`: whether or not the close the picker after an emoji is selected

-}
type alias PickerConfig =
    { offsetX : Float
    , offsetY : Float
    , closeOnSelect : Bool
    }


{-| The internal state of the emoji picker.

Note: the `skinColor` field is not in use in the current version,
but a future release may include a skin tone selector to switch between
emoji variants.

-}
type alias Model =
    { skinColor : SkinColor -- for future use (some emojis have variants)
    , activeCategory : Category -- for displaying emojis
    , hidden : Bool -- for toggling the emoji picker
    , offsetX : Float -- control the x-positon of the picker
    , offsetY : Float -- control the y-positon of the picker
    , closeOnSelect : Bool -- whether or not to close after an emoji is picked
    , searchText : String
    }


{-| This is the function to call to initialize the emoji picker.

    pickerConfig : PickerConfig
    pickerConfig =
        { offsetX = -271
        , offsetY = -410
        , closeOnSelect = True
        }

    emojiModel : EmojiPicker.Model
    emojiModel =
        EmojiPicker.init pickerConfig

-}
init : PickerConfig -> Model
init config =
    { skinColor = "none"
    , activeCategory = first people
    , hidden = True
    , closeOnSelect = config.closeOnSelect
    , offsetX = config.offsetX
    , offsetY = config.offsetY
    , searchText = ""
    }



---- UPDATE ----


{-| Most of the messages are handled internally, but there are a couple that will
be of interest to the parent module:

`Toggle`: Use this message in the parent to toggle the emoji picker on and off
`Select`: Catch this message in the parent to retrieve the selected emoji

-}
type Msg
    = NoOp
    | ChooseSkinColor SkinColor
    | SelectCategory Category
    | Select String
    | Search String
    | Toggle


{-| You'll need to catch the `Select` message in your parent module to
obtain the emoji from the picker. However, don't forget to propagate the
messages down to this function, because some internal states will probably
need to be updated.
-}
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case Debug.log "msg" msg of
        -- currently this case is never called, but in the future we might
        -- add in a skin color selector for users to choose different emoji
        -- variants.
        ChooseSkinColor s ->
            ( { model | skinColor = s }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )

        Search text ->
            ( { model | searchText = text }, Cmd.none )

        SelectCategory cat ->
            ( { model | activeCategory = cat }, Cmd.none )

        -- catch this in the parent. 's' is the emoji.
        Select _ ->
            let
                newModel =
                    if model.closeOnSelect then
                        { model | hidden = not model.hidden }

                    else
                        model
            in
            ( newModel, Cmd.none )

        Toggle ->
            ( { model
                | hidden = not model.hidden
              }
            , Cmd.none
            )



---- VIEW ----
{- used to get a skin variation of an emoji (if it exists).

   INPUTS
       color : emoji skin tone
       emoji : the emoji object
-}


selectSkinVariation : SkinColor -> Emoji -> String
selectSkinVariation color emoji =
    let
        isDictEmpty =
            isEmpty emoji.skinVariations
    in
    case ( color, isDictEmpty ) of
        -- if there is no specified skin tone, return the yellow version of the emoji
        ( "none", _ ) ->
            emoji.native

        -- if there is a specified skin tone, try to get it
        ( skin, False ) ->
            Maybe.withDefault emoji.native <| get skin emoji.skinVariations

        -- if the dict is empty, then no variations are available
        _ ->
            emoji.native



{- used to display a single emoji. it wraps the literal emoji string in a
   <span class="emoji"> so it can be styled.

   INPUTS
       color : emoji skin tone (from model.skinColor)
       emoji : the emoji to be displayed
-}


displayEmoji : SkinColor -> Emoji -> Html Msg
displayEmoji color emoji =
    let
        native =
            selectSkinVariation color emoji

        -- "native" is the literal emoji string
    in
    span
        ((onClick <| Select native) :: Styles.emoji)
        [ text native ]



{- used to display emojis in a category.

   INPUTS
       names     : from category.emojis. this function takes a list of
                   emoji names and gets them from the emoji dict.
       emojiDict : the place where all the emojis are stored. from the
                   Emojis module.
-}


getEmojisFromList : List String -> String -> Dict String Emoji -> List Emoji
getEmojisFromList names filterString emojiDict =
    List.filterMap (\name -> get name emojiDict) names
        |> List.filter
            (\emoji ->
                -- Check in the emoji name or the keywords contain the filter string
                List.any (\s -> String.contains (String.toLower filterString) (String.toLower s))
                    (emoji.name :: emoji.keywords)
            )
        |> List.sortBy .sortOrder



{- used to display an entire category.

   INPUTS
       pickerId  : from model.id (see `categoryMapping`)
       emojiDict : the place where all the emojis are stored. from the
                   Emojis module.
       color     : from model.skinColor (see `displayEmoji`)
       cat       : category to be displayed
-}


displayCategory : Dict String Emoji -> String -> SkinColor -> Category -> Html Msg
displayCategory emojiDict filterString color cat =
    let
        -- get the emojis from cat.emojis
        catEmojis =
            getEmojisFromList cat.emojis filterString emojiDict

        -- render them all
        renderedEmojis =
            List.map (displayEmoji color) catEmojis
    in
    div
        Styles.category
    <|
        p Styles.categoryTitle [ text cat.name ]
            :: renderedEmojis



{- used to display a category icon at the bottom of the emoji picker

   INPUTS
       activeCat   : the active category (used to color the active icon blue)
       (cat, icon) : a tuple of (category, icon) from the Icons.elm file
-}


displayCategoryIcon : Category -> ( Category, Attribute Msg -> Html Msg ) -> Html Msg
displayCategoryIcon activeCat ( cat, icon ) =
    let
        updatedIcon =
            if activeCat.name == cat.name then
                icon Styles.pathActive
                -- adds "active" class

            else
                icon Styles.pathInactive

        -- adds "inactive" class
    in
    span [ onClick <| SelectCategory cat ] [ updatedIcon ]


{-| Use this function to instantiate the actual `Html msg` for the picker.
-}
view : Model -> Html.Html Msg
view model =
    let
        emojis =
            displayCategory emojiDict model.searchText model.skinColor model.activeCategory

        icons =
            List.map (displayCategoryIcon model.activeCategory) iconList
    in
    div
        [ hidden model.hidden ]
        [ div
            (hidden model.hidden :: Styles.emojiPicker model.offsetX model.offsetY)
            [ div Styles.emojisMain [ emojis ]
            , div Styles.searchPanel
                [ input (Styles.searchPanelText ++ [ type_ "text", id "search-text", onInput Search, autofocus True ]) []
                ]
            , div Styles.iconPanel icons
            ]
        , div
            (onClick Toggle :: Styles.emojiModalBackground)
            []
        ]
