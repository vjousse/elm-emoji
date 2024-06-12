#!/bin/env python3
import json
import xml.etree.ElementTree as ET


# Transform codepoint to string
def unified_to_char(code_point):
    return "".join([chr(int(code, 16)) for code in code_point.split("-")])


# Parse cldr annotations taken from https://github.com/unicode-org/cldr/releases
# The file is located at common/annotations/en.xml
tree = ET.parse("cldr-annotations-en.xml")
root = tree.getroot()

emojis_annotations = {}
for annotation in root.iter("annotation"):
    if "type" not in annotation.attrib:
        emojis_annotations[annotation.attrib["cp"]] = [
            '"{a}"'.format(a=a) for a in annotation.text.split(" | ")
        ]


ELM_HEAD_STRING = """module Emojis exposing (Category, Emoji, emojiDict)

{-| This module provides a list of emojis indexed by shortcode/names

@docs Category, Emoji, emojiDict

-}

import Dict exposing (Dict)



{-| typedef for a category of emojis. in the
main file, we render emojis by category.
-}
type alias Category =
    { id : String -- short name for category
    , name : String -- display name for category
    , emojis : List String -- list of emoji names in category
    }



{-| final data structure for an emoji
-}
type alias Emoji =
    { name : String -- name of emoji
    , native : String -- actual emoji (not codepoint)
    , sortOrder : Int -- Global sorting index for all emoji, based on Unicode CLDR ordering
    , skinVariations : Dict String String -- emojis of skin variations
    , keywords : List String -- keywords taken from the CLDR annotations
    , imgUrl : Maybe String -- The image of the emoji if any (used for custom emojis)
    }

{-| dict containing all the emojis indexed by shortcode
-}
emojiDict : Dict String Emoji
emojiDict =
    Dict.fromList
        [ """

ELM_TAIL_STRING = "]"

# Parse json file taken from https://github.com/iamcal/emoji-data
with open("emoji.json", "rb") as f:
    data = json.load(f)
    print(ELM_HEAD_STRING, end="")
    first = True

    for record in data:
        if not first:
            print("        , ", end="")

        first = False

        skin_variations_tuples = []

        if "skin_variations" in record:
            skin_variations = record["skin_variations"]

            # Old elmoji format
            # , ("girl", {name="Girl", native="👧", nativeNonQual="👧", keywords=["Girl", "female", "woman", "teenager"], skinVariations=(Dict.fromList [("dark", "👧🏿"), ("light", "👧🏻"), ("medium", "👧🏽"), ("mediumDark", "👧🏾"), ("mediumLight", "👧🏼")]), version=5})
            # color_mapping = {
            #    "1F3FB": "light",
            #    "1F3FC": "mediumLight",
            #    "1F3FD": "medium",
            #    "1F3FE": "mediumDark",
            #    "1F3FF": "dark",
            # }

            for skin_color in skin_variations:
                skin_variation = skin_variations[skin_color]["unified"]
                skin_variation_string = unified_to_char(skin_variation)

                skin_variations_tuples.append(
                    '("{variation_name}", "{skin_variation_string}")'.format(
                        variation_name=skin_color,
                        skin_variation_string=skin_variation_string,
                    )
                )

        native = unified_to_char(record["unified"])

        if native in emojis_annotations:
            keywords = emojis_annotations[native]
        else:
            keywords = []

        print(
            '( "{short_name}", {{ name = "{name}", native = "{native}", sortOrder = {sort_order}, skinVariations = Dict.fromList [{skin_variations}] , keywords = [{keywords}], imgUrl = Nothing }} )'.format(
                short_name=record["short_name"],
                name=record["name"],
                sort_order=record["sort_order"],
                native=native,
                skin_variations=", ".join(skin_variations_tuples),
                keywords=", ".join(keywords),
            )
        )

    print(ELM_TAIL_STRING)
