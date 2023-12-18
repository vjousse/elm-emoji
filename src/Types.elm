module Types exposing (Category, Emoji)

import Dict exposing (Dict)



-- typedef for a category of emojis. in the
-- main file, we render emojis by category.


type alias Category =
    { id : String -- short name for category
    , name : String -- display name for category
    , emojis : List String -- list of emoji names in category
    }



-- final data structure for an emoji


type alias Emoji =
    { name : String -- name of emoji
    , native : String -- actual emoji (not codepoint)
    , skinVariations : Dict String String -- emojis of skin variations
    }
