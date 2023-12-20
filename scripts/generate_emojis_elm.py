#!/bin/env python3
import ijson


def unified_to_char(code_point: str) -> str:
    return "".join([chr(int(code, 16)) for code in code_point.split("-")])


ELM_HEAD_STRING = """module Emojis exposing (Category, Emoji, emojiDict)

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
    , sortOrder : Int -- Global sorting index for all emoji, based on Unicode CLDR ordering
    , skinVariations : Dict String String -- emojis of skin variations
    }


emojiDict : Dict String Emoji
emojiDict =
    Dict.fromList
        [ """

ELM_TAIL_STRING = "]"

with open("emoji.json", "rb") as f:
    print(ELM_HEAD_STRING, end="")
    first = True
    for record in ijson.items(f, "item"):
        if not first:
            print("        , ", end="")

        first = False

        print(
            '( "{short_name}", {{ name = "{name}", native = "{unified_to_char}", sortOrder = {sort_order}, skinVariations = Dict.fromList [] }} )'.format(
                short_name=record["short_name"],
                name=record["name"],
                sort_order=record["sort_order"],
                unified_to_char=unified_to_char(record["unified"]),
            )
        )

    print(ELM_TAIL_STRING)
