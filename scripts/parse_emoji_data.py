#!/bin/env python3
import ijson


def unified_to_char(code_point: str) -> str:
    return "".join([chr(int(code, 16)) for code in code_point.split("-")])


ELM_HEAD_STRING = """module Emojis exposing (emojiDict)

import Dict exposing (Dict)
import Types exposing (Emoji)


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
            '( "{short_name}", {{ name = "{name}", native = "{unified_to_char}", skinVariations = Dict.fromList [] }} )'.format(
                short_name=record["short_name"],
                name=record["name"],
                unified_to_char=unified_to_char(record["unified"]),
            )
        )

    print(ELM_TAIL_STRING)
