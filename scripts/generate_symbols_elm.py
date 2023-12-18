#!/bin/env python3
import ijson

short_names_per_category: dict[str, list[str]] = {}

category_to_elm_id = {
    "activities": ("Activities", "activity"),
    "flags": ("Flags", "flags"),
    "food & drink": ("Food & Drink", "foods"),
    "animals & nature": ("Animals & Nature", "nature"),
    "objects": ("Objects", "objects"),
    "people & body": ("Smileys & People", "people"),
    "smileys & emotion": ("Smileys & People", "people"),
    "travel & places": ("Travel & Places", "places"),
    "symbols": ("Symbols & Components", "symbols"),
    "component": ("Symbols & Components", "symbols"),
}


elm_id_to_elm_name = {
    "activity": "Activities",
    "flags": "Flags",
    "foods": "Food & Drink",
    "nature": "Animals & Nature",
    "objects": "Objects",
    "people": "Smileys & People",
    "places": "Travel & Places",
    "symbols": "Symbols & Components",
}

with open("emoji.json", "rb") as f:
    for record in ijson.items(f, "item"):
        category = record["category"].lower()
        short_name = record["short_name"]

        if category in short_names_per_category:
            short_names_per_category[category].append(f'"{short_name}"')
        else:
            short_names_per_category[category] = [f'"{short_name}"']

elm_categories = {}

for category in short_names_per_category:
    short_names = short_names_per_category[category]
    elm_name, elm_id = category_to_elm_id[category]

    if elm_id in elm_categories:
        elm_categories[elm_id].extend(short_names)
    else:
        elm_categories[elm_id] = short_names


ELM_TEMPLATE = """{elm_id} : ( Category, Attribute msg -> Html msg )
{elm_id} =
    ( {{ id = "{elm_id}"
      , name = "{elm_name}"
      , emojis = [ {short_names} ]
      }}
    , helperFun {elm_id}_path
    )
"""
for elm_id in elm_categories:
    short_names = elm_categories[elm_id]

    print(
        ELM_TEMPLATE.format(
            elm_id=elm_id,
            elm_name=elm_id_to_elm_name[elm_id],
            short_names=", ".join(short_names),
        )
    )
