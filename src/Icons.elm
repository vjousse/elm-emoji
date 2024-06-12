module Icons exposing (activity, flags, foods, iconList, nature, objects, people, places, symbols)

{-| This module provides emojis by category

@docs activity, flags, foods, iconList, nature, objects, people, places, symbols

-}

import Emojis exposing (Category, Emoji)
import Html exposing (Html)
import Styles exposing (categoryIcon)
import Svg exposing (Attribute, g, path, rect, svg)
import Svg.Attributes exposing (d, height, id, rx, transform, viewBox, width, x, xmlSpace, y)



{------------------------- ICONS -----------------------------

  Icons for use in the category selection bar. All icons were 
  taken from:

  https://github.com/missive/emoji-mart/tree/master/src/svgs

 -------------------------------------------------------------}


{-| get all icons by category
-}
iconList : List Emoji -> List ( Category, Attribute msg -> Html msg )
iconList customEmojis =
    [ people
    , nature
    , foods
    , activity
    , places
    , objects
    , symbols
    , flags
    ]
        ++ (if List.isEmpty customEmojis then
                []

            else
                [ custom customEmojis ]
           )


svgBaseStyles : List (Svg.Attribute msg)
svgBaseStyles =
    [ categoryIcon
    , xmlSpace "http://www.w3.org/2000/svg"
    , viewBox "0 0 24 24"
    , width "22"
    , height "22"
    ]


helperFun : List (Attribute msg) -> Attribute msg -> Html msg
helperFun d_attributes style =
    svg svgBaseStyles <|
        List.map (\path_attribute -> path [ path_attribute, style ] []) d_attributes


customSvg : Attribute msg -> Html msg
customSvg style =
    svg
        (style :: svgBaseStyles)
        [ g
            [ transform "translate(2.000000, 1.000000)"
            ]
            [ rect
                [ id "Rectangle"
                , x "8"
                , y "0"
                , width "3"
                , height "21"
                , rx "1.5"
                ]
                []
            , rect
                [ id "Rectangle"
                , transform "translate(9.843, 10.549) rotate(60) translate(-9.843, -10.549) "
                , x "8.343"
                , y "0.049"
                , width "3"
                , height "21"
                , rx "1.5"
                ]
                []
            , rect
                [ id "Rectangle"
                , transform "translate(9.843, 10.549) rotate(-60) translate(-9.843, -10.549) "
                , x "8.343"
                , y "0.049"
                , width "3"
                , height "21"
                , rx "1.5"
                ]
                []
            ]
        ]


{-| emojis in the activity category
-}
activity : ( Category, Attribute msg -> Html msg )
activity =
    ( { id = "activity"
      , name = "Activities"
      , emojis = [ "mahjong", "black_joker", "ribbon", "gift", "jack_o_lantern", "christmas_tree", "fireworks", "sparkler", "balloon", "tada", "confetti_ball", "tanabata_tree", "bamboo", "dolls", "flags", "wind_chime", "rice_scene", "medal", "reminder_ribbon", "admission_tickets", "fishing_pole_and_fish", "art", "ticket", "performing_arts", "video_game", "dart", "slot_machine", "8ball", "game_die", "bowling", "flower_playing_cards", "running_shirt_with_sash", "tennis", "ski", "basketball", "sports_medal", "trophy", "football", "rugby_football", "cricket_bat_and_ball", "volleyball", "field_hockey_stick_and_ball", "ice_hockey_stick_and_puck", "table_tennis_paddle_and_ball", "badminton_racquet_and_shuttlecock", "gun", "crystal_ball", "joystick", "frame_with_picture", "sled", "diving_mask", "goal_net", "first_place_medal", "second_place_medal", "third_place_medal", "boxing_glove", "martial_arts_uniform", "curling_stone", "lacrosse", "softball", "flying_disc", "red_envelope", "firecracker", "jigsaw", "thread", "yarn", "teddy_bear", "yo-yo", "kite", "magic_wand", "pinata", "nesting_dolls", "sewing_needle", "knot", "mirror_ball", "chess_pawn", "spades", "clubs", "hearts", "diamonds", "soccer", "baseball", "golf", "ice_skate", "sparkles" ]
      }
    , helperFun activity_path
    )


{-| custom emojis
-}
custom : List Emoji -> ( Category, Attribute msg -> Html msg )
custom customEmojis =
    ( { id = "custom"
      , name = "Custom"
      , emojis = customEmojis |> List.map .name
      }
    , customSvg
    )


{-| emojis in the flags category
-}
flags : ( Category, Attribute msg -> Html msg )
flags =
    ( { id = "flags"
      , name = "Flags"
      , emojis = [ "flag-ac", "flag-ad", "flag-ae", "flag-af", "flag-ag", "flag-ai", "flag-al", "flag-am", "flag-ao", "flag-aq", "flag-ar", "flag-as", "flag-at", "flag-au", "flag-aw", "flag-ax", "flag-az", "flag-ba", "flag-bb", "flag-bd", "flag-be", "flag-bf", "flag-bg", "flag-bh", "flag-bi", "flag-bj", "flag-bl", "flag-bm", "flag-bn", "flag-bo", "flag-bq", "flag-br", "flag-bs", "flag-bt", "flag-bv", "flag-bw", "flag-by", "flag-bz", "flag-ca", "flag-cc", "flag-cd", "flag-cf", "flag-cg", "flag-ch", "flag-ci", "flag-ck", "flag-cl", "flag-cm", "cn", "flag-co", "flag-cp", "flag-cr", "flag-cu", "flag-cv", "flag-cw", "flag-cx", "flag-cy", "flag-cz", "de", "flag-dg", "flag-dj", "flag-dk", "flag-dm", "flag-do", "flag-dz", "flag-ea", "flag-ec", "flag-ee", "flag-eg", "flag-eh", "flag-er", "es", "flag-et", "flag-eu", "flag-fi", "flag-fj", "flag-fk", "flag-fm", "flag-fo", "fr", "flag-ga", "gb", "flag-gd", "flag-ge", "flag-gf", "flag-gg", "flag-gh", "flag-gi", "flag-gl", "flag-gm", "flag-gn", "flag-gp", "flag-gq", "flag-gr", "flag-gs", "flag-gt", "flag-gu", "flag-gw", "flag-gy", "flag-hk", "flag-hm", "flag-hn", "flag-hr", "flag-ht", "flag-hu", "flag-ic", "flag-id", "flag-ie", "flag-il", "flag-im", "flag-in", "flag-io", "flag-iq", "flag-ir", "flag-is", "it", "flag-je", "flag-jm", "flag-jo", "jp", "flag-ke", "flag-kg", "flag-kh", "flag-ki", "flag-km", "flag-kn", "flag-kp", "kr", "flag-kw", "flag-ky", "flag-kz", "flag-la", "flag-lb", "flag-lc", "flag-li", "flag-lk", "flag-lr", "flag-ls", "flag-lt", "flag-lu", "flag-lv", "flag-ly", "flag-ma", "flag-mc", "flag-md", "flag-me", "flag-mf", "flag-mg", "flag-mh", "flag-mk", "flag-ml", "flag-mm", "flag-mn", "flag-mo", "flag-mp", "flag-mq", "flag-mr", "flag-ms", "flag-mt", "flag-mu", "flag-mv", "flag-mw", "flag-mx", "flag-my", "flag-mz", "flag-na", "flag-nc", "flag-ne", "flag-nf", "flag-ng", "flag-ni", "flag-nl", "flag-no", "flag-np", "flag-nr", "flag-nu", "flag-nz", "flag-om", "flag-pa", "flag-pe", "flag-pf", "flag-pg", "flag-ph", "flag-pk", "flag-pl", "flag-pm", "flag-pn", "flag-pr", "flag-ps", "flag-pt", "flag-pw", "flag-py", "flag-qa", "flag-re", "flag-ro", "flag-rs", "ru", "flag-rw", "flag-sa", "flag-sb", "flag-sc", "flag-sd", "flag-se", "flag-sg", "flag-sh", "flag-si", "flag-sj", "flag-sk", "flag-sl", "flag-sm", "flag-sn", "flag-so", "flag-sr", "flag-ss", "flag-st", "flag-sv", "flag-sx", "flag-sy", "flag-sz", "flag-ta", "flag-tc", "flag-td", "flag-tf", "flag-tg", "flag-th", "flag-tj", "flag-tk", "flag-tl", "flag-tm", "flag-tn", "flag-to", "flag-tr", "flag-tt", "flag-tv", "flag-tw", "flag-tz", "flag-ua", "flag-ug", "flag-um", "flag-un", "us", "flag-uy", "flag-uz", "flag-va", "flag-vc", "flag-ve", "flag-vg", "flag-vi", "flag-vn", "flag-vu", "flag-wf", "flag-ws", "flag-xk", "flag-ye", "flag-yt", "flag-za", "flag-zm", "flag-zw", "crossed_flags", "checkered_flag", "rainbow-flag", "transgender_flag", "waving_white_flag", "pirate_flag", "flag-england", "flag-scotland", "flag-wales", "waving_black_flag", "triangular_flag_on_post" ]
      }
    , helperFun flags_path
    )


{-| emojis in the foods category
-}
foods : ( Category, Attribute msg -> Html msg )
foods =
    ( { id = "foods"
      , name = "Food & Drink"
      , emojis = [ "hotdog", "taco", "burrito", "chestnut", "hot_pepper", "corn", "tomato", "eggplant", "grapes", "melon", "watermelon", "tangerine", "lemon", "banana", "pineapple", "apple", "green_apple", "pear", "peach", "cherries", "strawberry", "hamburger", "pizza", "meat_on_bone", "poultry_leg", "rice_cracker", "rice_ball", "rice", "curry", "ramen", "spaghetti", "bread", "fries", "sweet_potato", "dango", "oden", "sushi", "fried_shrimp", "fish_cake", "icecream", "shaved_ice", "ice_cream", "doughnut", "cookie", "chocolate_bar", "candy", "lollipop", "custard", "honey_pot", "cake", "bento", "stew", "fried_egg", "fork_and_knife", "tea", "sake", "wine_glass", "cocktail", "tropical_drink", "beer", "beers", "baby_bottle", "knife_fork_plate", "champagne", "popcorn", "birthday", "amphora", "hocho", "clinking_glasses", "tumbler_glass", "spoon", "croissant", "avocado", "cucumber", "bacon", "potato", "carrot", "baguette_bread", "green_salad", "shallow_pan_of_food", "stuffed_flatbread", "egg", "glass_of_milk", "peanuts", "kiwifruit", "pancakes", "dumpling", "fortune_cookie", "takeout_box", "chopsticks", "bowl_with_spoon", "cup_with_straw", "coconut", "broccoli", "pie", "pretzel", "cut_of_meat", "sandwich", "canned_food", "leafy_green", "mango", "moon_cake", "bagel", "crab", "shrimp", "squid", "lobster", "oyster", "cheese_wedge", "cupcake", "salt", "beverage_box", "garlic", "onion", "falafel", "waffle", "butter", "mate_drink", "ice_cube", "bubble_tea", "blueberries", "bell_pepper", "olive", "flatbread", "tamale", "fondue", "teapot", "pouring_liquid", "beans", "jar", "ginger_root", "pea_pod", "coffee" ]
      }
    , helperFun foods_path
    )


{-| emojis in the nature category
-}
nature : ( Category, Attribute msg -> Html msg )
nature =
    ( { id = "nature"
      , name = "Animals & Nature"
      , emojis = [ "seedling", "evergreen_tree", "deciduous_tree", "palm_tree", "cactus", "tulip", "cherry_blossom", "rose", "hibiscus", "sunflower", "blossom", "ear_of_rice", "herb", "four_leaf_clover", "maple_leaf", "fallen_leaf", "leaves", "mushroom", "rosette", "rat", "mouse2", "ox", "water_buffalo", "cow2", "tiger2", "leopard", "rabbit2", "black_cat", "cat2", "dragon", "crocodile", "whale2", "snail", "snake", "racehorse", "ram", "goat", "sheep", "monkey", "rooster", "chicken", "service_dog", "dog2", "pig2", "boar", "elephant", "octopus", "shell", "bug", "ant", "bee", "ladybug", "fish", "tropical_fish", "blowfish", "turtle", "hatching_chick", "baby_chick", "hatched_chick", "black_bird", "bird", "penguin", "koala", "poodle", "dromedary_camel", "camel", "dolphin", "mouse", "cow", "tiger", "rabbit", "cat", "dragon_face", "whale", "horse", "monkey_face", "dog", "pig", "frog", "hamster", "wolf", "polar_bear", "bear", "panda_face", "pig_nose", "feet", "chipmunk", "bouquet", "white_flower", "dove_of_peace", "spider", "spider_web", "wilted_flower", "lion_face", "scorpion", "turkey", "unicorn_face", "eagle", "duck", "bat", "shark", "owl", "fox_face", "butterfly", "deer", "gorilla", "lizard", "rhinoceros", "giraffe_face", "zebra_face", "hedgehog", "sauropod", "t-rex", "cricket", "kangaroo", "llama", "peacock", "hippopotamus", "parrot", "raccoon", "mosquito", "microbe", "badger", "swan", "mammoth", "dodo", "sloth", "otter", "orangutan", "skunk", "flamingo", "beaver", "bison", "seal", "guide_dog", "fly", "worm", "beetle", "cockroach", "potted_plant", "feather", "lotus", "coral", "empty_nest", "nest_with_eggs", "hyacinth", "jellyfish", "wing", "goose", "moose", "donkey", "shamrock" ]
      }
    , helperFun nature_path
    )


{-| emojis in the objects category
-}
objects : ( Category, Attribute msg -> Html msg )
objects =
    ( { id = "objects"
      , name = "Objects"
      , emojis = [ "school_satchel", "mortar_board", "studio_microphone", "level_slider", "control_knobs", "film_frames", "microphone", "movie_camera", "headphones", "tophat", "clapper", "musical_note", "notes", "saxophone", "guitar", "musical_keyboard", "trumpet", "violin", "musical_score", "izakaya_lantern", "label", "bow_and_arrow", "crown", "womans_hat", "eyeglasses", "necktie", "shirt", "jeans", "dress", "kimono", "bikini", "womans_clothes", "purse", "handbag", "pouch", "mans_shoe", "athletic_shoe", "high_heel", "sandal", "boot", "lipstick", "syringe", "pill", "ring", "gem", "bulb", "bomb", "moneybag", "credit_card", "yen", "dollar", "euro", "pound", "money_with_wings", "chart", "computer", "briefcase", "minidisc", "floppy_disk", "cd", "dvd", "file_folder", "open_file_folder", "page_with_curl", "page_facing_up", "date", "calendar", "card_index", "chart_with_upwards_trend", "chart_with_downwards_trend", "bar_chart", "clipboard", "pushpin", "round_pushpin", "paperclip", "straight_ruler", "triangular_ruler", "bookmark_tabs", "ledger", "notebook", "notebook_with_decorative_cover", "closed_book", "book", "green_book", "blue_book", "orange_book", "books", "scroll", "memo", "telephone_receiver", "pager", "fax", "satellite_antenna", "loudspeaker", "mega", "outbox_tray", "inbox_tray", "package", "e-mail", "incoming_envelope", "envelope_with_arrow", "mailbox_closed", "mailbox", "mailbox_with_mail", "mailbox_with_no_mail", "postbox", "postal_horn", "newspaper", "iphone", "calling", "camera", "camera_with_flash", "video_camera", "tv", "radio", "vhs", "film_projector", "prayer_beads", "mute", "speaker", "sound", "loud_sound", "battery", "electric_plug", "mag", "mag_right", "lock_with_ink_pen", "closed_lock_with_key", "key", "lock", "unlock", "bell", "no_bell", "bookmark", "link", "flashlight", "wrench", "hammer", "nut_and_bolt", "microscope", "telescope", "candle", "dark_sunglasses", "linked_paperclips", "lower_left_ballpoint_pen", "lower_left_fountain_pen", "lower_left_paintbrush", "lower_left_crayon", "desktop_computer", "printer", "three_button_mouse", "trackball", "card_index_dividers", "card_file_box", "file_cabinet", "wastebasket", "spiral_note_pad", "spiral_calendar_pad", "compression", "old_key", "rolled_up_newspaper", "dagger_knife", "ballot_box_with_ballot", "moyai", "door", "smoking", "toilet", "shower", "bathtub", "couch_and_lamp", "shopping_bags", "bed", "shopping_trolley", "elevator", "hammer_and_wrench", "shield", "drum_with_drumsticks", "sari", "lab_coat", "goggles", "hiking_boot", "womans_flat_shoe", "probing_cane", "safety_vest", "billed_cap", "scarf", "gloves", "coat", "socks", "test_tube", "petri_dish", "dna", "abacus", "fire_extinguisher", "toolbox", "magnet", "lotion_bottle", "safety_pin", "broom", "basket", "roll_of_paper", "soap", "sponge", "receipt", "nazar_amulet", "ballet_shoes", "one-piece_swimsuit", "briefs", "shorts", "thong_sandal", "drop_of_blood", "adhesive_bandage", "stethoscope", "x-ray", "crutch", "boomerang", "maracas", "flute", "chair", "razor", "axe", "diya_lamp", "banjo", "military_helmet", "accordion", "long_drum", "coin", "carpentry_saw", "screwdriver", "ladder", "hook", "mirror", "window", "plunger", "bucket", "mouse_trap", "toothbrush", "headstone", "placard", "identification_card", "low_battery", "hamsa", "folding_hand_fan", "hair_pick", "bubbles", "keyboard", "phone", "hammer_and_pick", "crossed_swords", "scales", "alembic", "gear", "coffin", "funeral_urn", "pick", "helmet_with_white_cross", "chains", "scissors", "email", "pencil2", "black_nib" ]
      }
    , helperFun objects_path
    )


{-| emojis in the people category
-}
people : ( Category, Attribute msg -> Html msg )
people =
    ( { id = "people"
      , name = "Smileys & People"
      , emojis = [ "eye-in-speech-bubble", "japanese_ogre", "japanese_goblin", "ghost", "alien", "space_invader", "imp", "skull", "kiss", "love_letter", "heartbeat", "broken_heart", "two_hearts", "sparkling_heart", "heartpulse", "cupid", "blue_heart", "green_heart", "yellow_heart", "purple_heart", "gift_heart", "revolving_hearts", "heart_decoration", "anger", "zzz", "boom", "sweat_drops", "dash", "hankey", "dizzy", "speech_balloon", "thought_balloon", "100", "hole", "black_heart", "left_speech_bubble", "right_anger_bubble", "grinning", "grin", "joy", "smiley", "smile", "sweat_smile", "laughing", "innocent", "smiling_imp", "wink", "blush", "yum", "relieved", "heart_eyes", "sunglasses", "smirk", "neutral_face", "expressionless", "unamused", "sweat", "pensive", "confused", "confounded", "kissing", "kissing_heart", "kissing_smiling_eyes", "kissing_closed_eyes", "stuck_out_tongue", "stuck_out_tongue_winking_eye", "stuck_out_tongue_closed_eyes", "disappointed", "worried", "angry", "rage", "cry", "persevere", "triumph", "disappointed_relieved", "frowning", "anguished", "fearful", "weary", "sleepy", "tired_face", "grimacing", "sob", "face_exhaling", "open_mouth", "hushed", "cold_sweat", "scream", "astonished", "flushed", "sleeping", "face_with_spiral_eyes", "dizzy_face", "face_in_clouds", "no_mouth", "mask", "smile_cat", "joy_cat", "smiley_cat", "heart_eyes_cat", "smirk_cat", "kissing_cat", "pouting_cat", "crying_cat_face", "scream_cat", "slightly_frowning_face", "slightly_smiling_face", "upside_down_face", "face_with_rolling_eyes", "see_no_evil", "hear_no_evil", "speak_no_evil", "white_heart", "brown_heart", "zipper_mouth_face", "money_mouth_face", "face_with_thermometer", "nerd_face", "thinking_face", "face_with_head_bandage", "robot_face", "hugging_face", "face_with_cowboy_hat", "clown_face", "nauseated_face", "rolling_on_the_floor_laughing", "drooling_face", "lying_face", "sneezing_face", "face_with_raised_eyebrow", "star-struck", "zany_face", "shushing_face", "face_with_symbols_on_mouth", "face_with_hand_over_mouth", "face_vomiting", "exploding_head", "smiling_face_with_3_hearts", "yawning_face", "smiling_face_with_tear", "partying_face", "woozy_face", "hot_face", "cold_face", "disguised_face", "face_holding_back_tears", "pleading_face", "face_with_monocle", "orange_heart", "light_blue_heart", "grey_heart", "pink_heart", "melting_face", "saluting_face", "face_with_open_eyes_and_hand_over_mouth", "face_with_peeking_eye", "face_with_diagonal_mouth", "dotted_line_face", "shaking_face", "skull_and_crossbones", "white_frowning_face", "relaxed", "heavy_heart_exclamation_mark_ornament", "heart_on_fire", "mending_heart", "heart", "santa", "snowboarder", "woman-running", "man-running", "runner", "woman-surfing", "man-surfing", "surfer", "horse_racing", "woman-swimming", "man-swimming", "swimmer", "woman-lifting-weights", "man-lifting-weights", "weight_lifter", "woman-golfing", "man-golfing", "golfer", "eyes", "eye", "ear", "nose", "lips", "tongue", "point_up_2", "point_down", "point_left", "point_right", "facepunch", "wave", "ok_hand", "+1", "-1", "clap", "open_hands", "footprints", "bust_in_silhouette", "busts_in_silhouette", "boy", "girl", "male-farmer", "male-cook", "man_feeding_baby", "male-student", "male-singer", "male-artist", "male-teacher", "male-factory-worker", "man-boy-boy", "man-boy", "man-girl-boy", "man-girl-girl", "man-girl", "man-man-boy", "man-man-boy-boy", "man-man-girl", "man-man-girl-boy", "man-man-girl-girl", "man-woman-boy", "man-woman-boy-boy", "man-woman-girl", "man-woman-girl-boy", "man-woman-girl-girl", "male-technologist", "male-office-worker", "male-mechanic", "male-scientist", "male-astronaut", "male-firefighter", "man_with_probing_cane", "red_haired_man", "curly_haired_man", "bald_man", "white_haired_man", "man_in_motorized_wheelchair", "man_in_manual_wheelchair", "male-doctor", "male-judge", "male-pilot", "man-heart-man", "man-kiss-man", "man", "female-farmer", "female-cook", "woman_feeding_baby", "female-student", "female-singer", "female-artist", "female-teacher", "female-factory-worker", "woman-boy-boy", "woman-boy", "woman-girl-boy", "woman-girl-girl", "woman-girl", "woman-woman-boy", "woman-woman-boy-boy", "woman-woman-girl", "woman-woman-girl-boy", "woman-woman-girl-girl", "female-technologist", "female-office-worker", "female-mechanic", "female-scientist", "female-astronaut", "female-firefighter", "woman_with_probing_cane", "red_haired_woman", "curly_haired_woman", "bald_woman", "white_haired_woman", "woman_in_motorized_wheelchair", "woman_in_manual_wheelchair", "female-doctor", "female-judge", "female-pilot", "woman-heart-man", "woman-heart-woman", "woman-kiss-man", "woman-kiss-woman", "woman", "family", "man_and_woman_holding_hands", "two_men_holding_hands", "two_women_holding_hands", "female-police-officer", "male-police-officer", "cop", "women-with-bunny-ears-partying", "men-with-bunny-ears-partying", "dancers", "woman_with_veil", "man_with_veil", "bride_with_veil", "blond-haired-woman", "blond-haired-man", "person_with_blond_hair", "man_with_gua_pi_mao", "woman-wearing-turban", "man-wearing-turban", "man_with_turban", "older_man", "older_woman", "baby", "female-construction-worker", "male-construction-worker", "construction_worker", "princess", "angel", "woman-tipping-hand", "man-tipping-hand", "information_desk_person", "female-guard", "male-guard", "guardsman", "dancer", "nail_care", "woman-getting-massage", "man-getting-massage", "massage", "woman-getting-haircut", "man-getting-haircut", "haircut", "couplekiss", "couple_with_heart", "muscle", "man_in_business_suit_levitating", "female-detective", "male-detective", "sleuth_or_spy", "man_dancing", "raised_hand_with_fingers_splayed", "middle_finger", "spock-hand", "speaking_head_in_silhouette", "woman-gesturing-no", "man-gesturing-no", "no_good", "woman-gesturing-ok", "man-gesturing-ok", "ok_woman", "woman-bowing", "man-bowing", "bow", "woman-raising-hand", "man-raising-hand", "raising_hand", "raised_hands", "woman-frowning", "man-frowning", "person_frowning", "woman-pouting", "man-pouting", "person_with_pouting_face", "pray", "woman-rowing-boat", "man-rowing-boat", "rowboat", "woman-biking", "man-biking", "bicyclist", "woman-mountain-biking", "man-mountain-biking", "mountain_bicyclist", "woman-walking", "man-walking", "walking", "bath", "sleeping_accommodation", "pinched_fingers", "pinching_hand", "the_horns", "call_me_hand", "raised_back_of_hand", "left-facing_fist", "right-facing_fist", "handshake", "crossed_fingers", "i_love_you_hand_sign", "woman-facepalming", "man-facepalming", "face_palm", "pregnant_woman", "breast-feeding", "palms_up_together", "selfie", "prince", "woman_in_tuxedo", "man_in_tuxedo", "person_in_tuxedo", "mrs_claus", "woman-shrugging", "man-shrugging", "shrug", "woman-cartwheeling", "man-cartwheeling", "person_doing_cartwheel", "woman-juggling", "man-juggling", "juggling", "fencer", "woman-wrestling", "man-wrestling", "wrestlers", "woman-playing-water-polo", "man-playing-water-polo", "water_polo", "woman-playing-handball", "man-playing-handball", "handball", "ninja", "bone", "leg", "foot", "tooth", "female_superhero", "male_superhero", "superhero", "female_supervillain", "male_supervillain", "supervillain", "ear_with_hearing_aid", "mechanical_arm", "mechanical_leg", "troll", "woman_standing", "man_standing", "standing_person", "woman_kneeling", "man_kneeling", "kneeling_person", "deaf_woman", "deaf_man", "deaf_person", "farmer", "cook", "person_feeding_baby", "mx_claus", "student", "singer", "artist", "teacher", "factory_worker", "technologist", "office_worker", "mechanic", "scientist", "astronaut", "firefighter", "people_holding_hands", "person_with_probing_cane", "red_haired_person", "curly_haired_person", "bald_person", "white_haired_person", "person_in_motorized_wheelchair", "person_in_manual_wheelchair", "health_worker", "judge", "pilot", "adult", "child", "older_adult", "woman_with_beard", "man_with_beard", "bearded_person", "person_with_headscarf", "woman_in_steamy_room", "man_in_steamy_room", "person_in_steamy_room", "woman_climbing", "man_climbing", "person_climbing", "woman_in_lotus_position", "man_in_lotus_position", "person_in_lotus_position", "female_mage", "male_mage", "mage", "female_fairy", "male_fairy", "fairy", "female_vampire", "male_vampire", "vampire", "mermaid", "merman", "merperson", "female_elf", "male_elf", "elf", "female_genie", "male_genie", "genie", "female_zombie", "male_zombie", "zombie", "brain", "anatomical_heart", "lungs", "people_hugging", "pregnant_man", "pregnant_person", "person_with_crown", "biting_lip", "hand_with_index_finger_and_thumb_crossed", "rightwards_hand", "leftwards_hand", "palm_down_hand", "palm_up_hand", "index_pointing_at_the_viewer", "heart_hands", "leftwards_pushing_hand", "rightwards_pushing_hand", "point_up", "skier", "woman-bouncing-ball", "man-bouncing-ball", "person_with_ball", "fist", "hand", "v", "writing_hand" ]
      }
    , helperFun people_path
    )


{-| emojis in the places category
-}
places : ( Category, Attribute msg -> Html msg )
places =
    ( { id = "places"
      , name = "Travel & Places"
      , emojis = [ "cyclone", "foggy", "closed_umbrella", "night_with_stars", "sunrise_over_mountains", "sunrise", "city_sunset", "city_sunrise", "rainbow", "bridge_at_night", "ocean", "volcano", "milky_way", "earth_africa", "earth_americas", "earth_asia", "globe_with_meridians", "new_moon", "waxing_crescent_moon", "first_quarter_moon", "moon", "full_moon", "waning_gibbous_moon", "last_quarter_moon", "waning_crescent_moon", "crescent_moon", "new_moon_with_face", "first_quarter_moon_with_face", "last_quarter_moon_with_face", "full_moon_with_face", "sun_with_face", "star2", "stars", "thermometer", "mostly_sunny", "barely_sunny", "partly_sunny_rain", "rain_cloud", "snow_cloud", "lightning", "tornado", "fog", "wind_blowing_face", "carousel_horse", "ferris_wheel", "roller_coaster", "circus_tent", "racing_motorcycle", "racing_car", "snow_capped_mountain", "camping", "beach_with_umbrella", "building_construction", "house_buildings", "cityscape", "derelict_house_building", "classical_building", "desert", "desert_island", "national_park", "stadium", "house", "house_with_garden", "office", "post_office", "european_post_office", "hospital", "bank", "hotel", "love_hotel", "convenience_store", "school", "department_store", "factory", "japanese_castle", "european_castle", "barber", "wedding", "droplet", "seat", "fire", "kaaba", "mosque", "synagogue", "clock1", "clock2", "clock3", "clock4", "clock5", "clock6", "clock7", "clock8", "clock9", "clock10", "clock11", "clock12", "clock130", "clock230", "clock330", "clock430", "clock530", "clock630", "clock730", "clock830", "clock930", "clock1030", "clock1130", "clock1230", "mantelpiece_clock", "world_map", "mount_fuji", "tokyo_tower", "statue_of_liberty", "japan", "rocket", "helicopter", "steam_locomotive", "railway_car", "bullettrain_side", "bullettrain_front", "train2", "metro", "light_rail", "station", "tram", "train", "bus", "oncoming_bus", "trolleybus", "busstop", "minibus", "ambulance", "fire_engine", "police_car", "oncoming_police_car", "taxi", "oncoming_taxi", "car", "oncoming_automobile", "blue_car", "truck", "articulated_lorry", "tractor", "monorail", "mountain_railway", "suspension_railway", "mountain_cableway", "aerial_tramway", "ship", "speedboat", "traffic_light", "vertical_traffic_light", "construction", "rotating_light", "bike", "bellhop_bell", "octagonal_sign", "hindu_temple", "hut", "playground_slide", "wheel", "ring_buoy", "oil_drum", "motorway", "railway_track", "motor_boat", "small_airplane", "airplane_departure", "airplane_arriving", "satellite", "passenger_ship", "scooter", "motor_scooter", "canoe", "flying_saucer", "skateboard", "auto_rickshaw", "pickup_truck", "roller_skate", "motorized_wheelchair", "manual_wheelchair", "compass", "bricks", "luggage", "parachute", "ringed_planet", "rock", "wood", "watch", "hourglass", "alarm_clock", "stopwatch", "timer_clock", "hourglass_flowing_sand", "sunny", "cloud", "umbrella", "snowman", "comet", "umbrella_with_rain_drops", "hotsprings", "anchor", "zap", "snowman_without_snow", "partly_sunny", "thunder_cloud_and_rain", "shinto_shrine", "church", "mountain", "umbrella_on_ground", "fountain", "ferry", "boat", "tent", "fuelpump", "airplane", "snowflake", "star" ]
      }
    , helperFun places_path
    )


{-| emojis in the symbols category
-}
symbols : ( Category, Attribute msg -> Html msg )
symbols =
    ( { id = "symbols"
      , name = "Symbols & Components"
      , emojis = [ "hash", "keycap_star", "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "copyright", "registered", "a", "b", "o2", "parking", "ab", "cl", "cool", "free", "id", "new", "ng", "ok", "sos", "up", "vs", "koko", "sa", "u7121", "u6307", "u7981", "u7a7a", "u5408", "u6e80", "u6709", "u6708", "u7533", "u5272", "u55b6", "ideograph_advantage", "accept", "cinema", "atm", "diamond_shape_with_a_dot_inside", "currency_exchange", "heavy_dollar_sign", "name_badge", "vibration_mode", "mobile_phone_off", "no_mobile_phones", "signal_strength", "twisted_rightwards_arrows", "repeat", "repeat_one", "arrows_clockwise", "arrows_counterclockwise", "low_brightness", "high_brightness", "radio_button", "back", "end", "on", "soon", "top", "underage", "keycap_ten", "capital_abcd", "abcd", "1234", "symbols", "abc", "six_pointed_star", "beginner", "trident", "black_square_button", "white_square_button", "red_circle", "large_blue_circle", "large_orange_diamond", "large_blue_diamond", "small_orange_diamond", "small_blue_diamond", "small_red_triangle", "small_red_triangle_down", "arrow_up_small", "arrow_down_small", "om_symbol", "menorah_with_nine_branches", "no_entry_sign", "no_smoking", "put_litter_in_its_place", "do_not_litter", "potable_water", "non-potable_water", "no_bicycles", "no_pedestrians", "children_crossing", "mens", "womens", "restroom", "baby_symbol", "wc", "passport_control", "customs", "baggage_claim", "left_luggage", "place_of_worship", "wireless", "large_orange_circle", "large_yellow_circle", "large_green_circle", "large_purple_circle", "large_brown_circle", "large_red_square", "large_blue_square", "large_orange_square", "large_yellow_square", "large_green_square", "large_purple_square", "large_brown_square", "heavy_equals_sign", "khanda", "bangbang", "interrobang", "tm", "information_source", "left_right_arrow", "arrow_up_down", "arrow_upper_left", "arrow_upper_right", "arrow_lower_right", "arrow_lower_left", "leftwards_arrow_with_hook", "arrow_right_hook", "eject", "fast_forward", "rewind", "arrow_double_up", "arrow_double_down", "black_right_pointing_double_triangle_with_vertical_bar", "black_left_pointing_double_triangle_with_vertical_bar", "black_right_pointing_triangle_with_double_vertical_bar", "double_vertical_bar", "black_square_for_stop", "black_circle_for_record", "m", "black_small_square", "white_small_square", "arrow_forward", "arrow_backward", "white_medium_square", "black_medium_square", "white_medium_small_square", "black_medium_small_square", "ballot_box_with_check", "radioactive_sign", "biohazard_sign", "orthodox_cross", "star_and_crescent", "peace_symbol", "yin_yang", "wheel_of_dharma", "female_sign", "male_sign", "aries", "taurus", "gemini", "cancer", "leo", "virgo", "libra", "scorpius", "sagittarius", "capricorn", "aquarius", "pisces", "recycle", "infinity", "wheelchair", "medical_symbol", "atom_symbol", "fleur_de_lis", "warning", "transgender_symbol", "white_circle", "black_circle", "ophiuchus", "no_entry", "white_check_mark", "heavy_check_mark", "heavy_multiplication_x", "latin_cross", "star_of_david", "eight_spoked_asterisk", "eight_pointed_black_star", "sparkle", "x", "negative_squared_cross_mark", "question", "grey_question", "grey_exclamation", "exclamation", "heavy_plus_sign", "heavy_minus_sign", "heavy_division_sign", "arrow_right", "curly_loop", "loop", "arrow_heading_up", "arrow_heading_down", "arrow_left", "arrow_up", "arrow_down", "black_large_square", "white_large_square", "o", "wavy_dash", "part_alternation_mark", "congratulations", "secret", "skin-tone-2", "skin-tone-3", "skin-tone-4", "skin-tone-5", "skin-tone-6" ]
      }
    , helperFun symbols_path
    )


activity_path : List (Attribute msg)
activity_path =
    [ d "M12 0C5.373 0 0 5.372 0 12c0 6.627 5.373 12 12 12 6.628 0 12-5.373 12-12 0-6.628-5.372-12-12-12m9.949 11H17.05c.224-2.527 1.232-4.773 1.968-6.113A9.966 9.966 0 0 1 21.949 11M13 11V2.051a9.945 9.945 0 0 1 4.432 1.564c-.858 1.491-2.156 4.22-2.392 7.385H13zm-2 0H8.961c-.238-3.165-1.536-5.894-2.393-7.385A9.95 9.95 0 0 1 11 2.051V11zm0 2v8.949a9.937 9.937 0 0 1-4.432-1.564c.857-1.492 2.155-4.221 2.393-7.385H11zm4.04 0c.236 3.164 1.534 5.893 2.392 7.385A9.92 9.92 0 0 1 13 21.949V13h2.04zM4.982 4.887C5.718 6.227 6.726 8.473 6.951 11h-4.9a9.977 9.977 0 0 1 2.931-6.113M2.051 13h4.9c-.226 2.527-1.233 4.771-1.969 6.113A9.972 9.972 0 0 1 2.051 13m16.967 6.113c-.735-1.342-1.744-3.586-1.968-6.113h4.899a9.961 9.961 0 0 1-2.931 6.113" ]


flags_path : List (Attribute msg)
flags_path =
    [ d "M0 0l6.084 24H8L1.916 0zM21 5h-4l-1-4H4l3 12h3l1 4h13L21 5zM6.563 3h7.875l2 8H8.563l-2-8zm8.832 10l-2.856 1.904L12.063 13h3.332zM19 13l-1.5-6h1.938l2 8H16l3-2z" ]


foods_path : List (Attribute msg)
foods_path =
    [ d "M17 4.978c-1.838 0-2.876.396-3.68.934.513-1.172 1.768-2.934 4.68-2.934a1 1 0 0 0 0-2c-2.921 0-4.629 1.365-5.547 2.512-.064.078-.119.162-.18.244C11.73 1.838 10.798.023 9.207.023 8.579.022 7.85.306 7 .978 5.027 2.54 5.329 3.902 6.492 4.999 3.609 5.222 0 7.352 0 12.969c0 4.582 4.961 11.009 9 11.009 1.975 0 2.371-.486 3-1 .629.514 1.025 1 3 1 4.039 0 9-6.418 9-11 0-5.953-4.055-8-7-8M8.242 2.546c.641-.508.943-.523.965-.523.426.169.975 1.405 1.357 3.055-1.527-.629-2.741-1.352-2.98-1.846.059-.112.241-.356.658-.686M15 21.978c-1.08 0-1.21-.109-1.559-.402l-.176-.146c-.367-.302-.816-.452-1.266-.452s-.898.15-1.266.452l-.176.146c-.347.292-.477.402-1.557.402-2.813 0-7-5.389-7-9.009 0-5.823 4.488-5.991 5-5.991 1.939 0 2.484.471 3.387 1.251l.323.276a1.995 1.995 0 0 0 2.58 0l.323-.276c.902-.78 1.447-1.251 3.387-1.251.512 0 5 .168 5 6 0 3.617-4.187 9-7 9" ]


nature_path : List (Attribute msg)
nature_path =
    [ d "M15.5 8a1.5 1.5 0 1 0 .001 3.001A1.5 1.5 0 0 0 15.5 8M8.5 8a1.5 1.5 0 1 0 .001 3.001A1.5 1.5 0 0 0 8.5 8"
    , d "M18.933 0h-.027c-.97 0-2.138.787-3.018 1.497-1.274-.374-2.612-.51-3.887-.51-1.285 0-2.616.133-3.874.517C7.245.79 6.069 0 5.093 0h-.027C3.352 0 .07 2.67.002 7.026c-.039 2.479.276 4.238 1.04 5.013.254.258.882.677 1.295.882.191 3.177.922 5.238 2.536 6.38.897.637 2.187.949 3.2 1.102C8.04 20.6 8 20.795 8 21c0 1.773 2.35 3 4 3 1.648 0 4-1.227 4-3 0-.201-.038-.393-.072-.586 2.573-.385 5.435-1.877 5.925-7.587.396-.22.887-.568 1.104-.788.763-.774 1.079-2.534 1.04-5.013C23.929 2.67 20.646 0 18.933 0M3.223 9.135c-.237.281-.837 1.155-.884 1.238-.15-.41-.368-1.349-.337-3.291.051-3.281 2.478-4.972 3.091-5.031.256.015.731.27 1.265.646-1.11 1.171-2.275 2.915-2.352 5.125-.133.546-.398.858-.783 1.313M12 22c-.901 0-1.954-.693-2-1 0-.654.475-1.236 1-1.602V20a1 1 0 1 0 2 0v-.602c.524.365 1 .947 1 1.602-.046.307-1.099 1-2 1m3-3.48v.02a4.752 4.752 0 0 0-1.262-1.02c1.092-.516 2.239-1.334 2.239-2.217 0-1.842-1.781-2.195-3.977-2.195-2.196 0-3.978.354-3.978 2.195 0 .883 1.148 1.701 2.238 2.217A4.8 4.8 0 0 0 9 18.539v-.025c-1-.076-2.182-.281-2.973-.842-1.301-.92-1.838-3.045-1.853-6.478l.023-.041c.496-.826 1.49-1.45 1.804-3.102 0-2.047 1.357-3.631 2.362-4.522C9.37 3.178 10.555 3 11.948 3c1.447 0 2.685.192 3.733.57 1 .9 2.316 2.465 2.316 4.48.313 1.651 1.307 2.275 1.803 3.102.035.058.068.117.102.178-.059 5.967-1.949 7.01-4.902 7.19m6.628-8.202c-.037-.065-.074-.13-.113-.195a7.587 7.587 0 0 0-.739-.987c-.385-.455-.648-.768-.782-1.313-.076-2.209-1.241-3.954-2.353-5.124.531-.376 1.004-.63 1.261-.647.636.071 3.044 1.764 3.096 5.031.027 1.81-.347 3.218-.37 3.235"
    ]


objects_path : List (Attribute msg)
objects_path =
    [ d "M12 0a9 9 0 0 0-5 16.482V21s2.035 3 5 3 5-3 5-3v-4.518A9 9 0 0 0 12 0zm0 2c3.86 0 7 3.141 7 7s-3.14 7-7 7-7-3.141-7-7 3.14-7 7-7zM9 17.477c.94.332 1.946.523 3 .523s2.06-.19 3-.523v.834c-.91.436-1.925.689-3 .689a6.924 6.924 0 0 1-3-.69v-.833zm.236 3.07A8.854 8.854 0 0 0 12 21c.965 0 1.888-.167 2.758-.451C14.155 21.173 13.153 22 12 22c-1.102 0-2.117-.789-2.764-1.453z"
    , d "M14.745 12.449h-.004c-.852-.024-1.188-.858-1.577-1.824-.421-1.061-.703-1.561-1.182-1.566h-.009c-.481 0-.783.497-1.235 1.537-.436.982-.801 1.811-1.636 1.791l-.276-.043c-.565-.171-.853-.691-1.284-1.794-.125-.313-.202-.632-.27-.913-.051-.213-.127-.53-.195-.634C7.067 9.004 7.039 9 6.99 9A1 1 0 0 1 7 7h.01c1.662.017 2.015 1.373 2.198 2.134.486-.981 1.304-2.058 2.797-2.075 1.531.018 2.28 1.153 2.731 2.141l.002-.008C14.944 8.424 15.327 7 16.979 7h.032A1 1 0 1 1 17 9h-.011c-.149.076-.256.474-.319.709a6.484 6.484 0 0 1-.311.951c-.429.973-.79 1.789-1.614 1.789"
    ]


people_path : List (Attribute msg)
people_path =
    [ d "M12 0C5.373 0 0 5.373 0 12s5.373 12 12 12 12-5.373 12-12S18.627 0 12 0m0 22C6.486 22 2 17.514 2 12S6.486 2 12 2s10 4.486 10 10-4.486 10-10 10"
    , d "M8 7a2 2 0 1 0-.001 3.999A2 2 0 0 0 8 7M16 7a2 2 0 1 0-.001 3.999A2 2 0 0 0 16 7M15.232 15c-.693 1.195-1.87 2-3.349 2-1.477 0-2.655-.805-3.347-2H15m3-2H6a6 6 0 1 0 12 0"
    ]


places_path : List (Attribute msg)
places_path =
    [ d "M6.5 12C5.122 12 4 13.121 4 14.5S5.122 17 6.5 17 9 15.879 9 14.5 7.878 12 6.5 12m0 3c-.275 0-.5-.225-.5-.5s.225-.5.5-.5.5.225.5.5-.225.5-.5.5M17.5 12c-1.378 0-2.5 1.121-2.5 2.5s1.122 2.5 2.5 2.5 2.5-1.121 2.5-2.5-1.122-2.5-2.5-2.5m0 3c-.275 0-.5-.225-.5-.5s.225-.5.5-.5.5.225.5.5-.225.5-.5.5"
    , d "M22.482 9.494l-1.039-.346L21.4 9h.6c.552 0 1-.439 1-.992 0-.006-.003-.008-.003-.008H23c0-1-.889-2-1.984-2h-.642l-.731-1.717C19.262 3.012 18.091 2 16.764 2H7.236C5.909 2 4.738 3.012 4.357 4.283L3.626 6h-.642C1.889 6 1 7 1 8h.003S1 8.002 1 8.008C1 8.561 1.448 9 2 9h.6l-.043.148-1.039.346a2.001 2.001 0 0 0-1.359 2.097l.751 7.508a1 1 0 0 0 .994.901H3v1c0 1.103.896 2 2 2h2c1.104 0 2-.897 2-2v-1h6v1c0 1.103.896 2 2 2h2c1.104 0 2-.897 2-2v-1h1.096a.999.999 0 0 0 .994-.901l.751-7.508a2.001 2.001 0 0 0-1.359-2.097M6.273 4.857C6.402 4.43 6.788 4 7.236 4h9.527c.448 0 .834.43.963.857L19.313 9H4.688l1.585-4.143zM7 21H5v-1h2v1zm12 0h-2v-1h2v1zm2.189-3H2.811l-.662-6.607L3 11h18l.852.393L21.189 18z"
    ]


symbols_path : List (Attribute msg)
symbols_path =
    [ d "M0 0h11v2H0zM4 11h3V6h4V4H0v2h4zM15.5 17c1.381 0 2.5-1.116 2.5-2.493s-1.119-2.493-2.5-2.493S13 13.13 13 14.507 14.119 17 15.5 17m0-2.986c.276 0 .5.222.5.493 0 .272-.224.493-.5.493s-.5-.221-.5-.493.224-.493.5-.493M21.5 19.014c-1.381 0-2.5 1.116-2.5 2.493S20.119 24 21.5 24s2.5-1.116 2.5-2.493-1.119-2.493-2.5-2.493m0 2.986a.497.497 0 0 1-.5-.493c0-.271.224-.493.5-.493s.5.222.5.493a.497.497 0 0 1-.5.493M22 13l-9 9 1.513 1.5 8.99-9.009zM17 11c2.209 0 4-1.119 4-2.5V2s.985-.161 1.498.949C23.01 4.055 23 6 23 6s1-1.119 1-3.135C24-.02 21 0 21 0h-2v6.347A5.853 5.853 0 0 0 17 6c-2.209 0-4 1.119-4 2.5s1.791 2.5 4 2.5M10.297 20.482l-1.475-1.585a47.54 47.54 0 0 1-1.442 1.129c-.307-.288-.989-1.016-2.045-2.183.902-.836 1.479-1.466 1.729-1.892s.376-.871.376-1.336c0-.592-.273-1.178-.818-1.759-.546-.581-1.329-.871-2.349-.871-1.008 0-1.79.293-2.344.879-.556.587-.832 1.181-.832 1.784 0 .813.419 1.748 1.256 2.805-.847.614-1.444 1.208-1.794 1.784a3.465 3.465 0 0 0-.523 1.833c0 .857.308 1.56.924 2.107.616.549 1.423.823 2.42.823 1.173 0 2.444-.379 3.813-1.137L8.235 24h2.819l-2.09-2.383 1.333-1.135zm-6.736-6.389a1.02 1.02 0 0 1 .73-.286c.31 0 .559.085.747.254a.849.849 0 0 1 .283.659c0 .518-.419 1.112-1.257 1.784-.536-.651-.805-1.231-.805-1.742a.901.901 0 0 1 .302-.669M3.74 22c-.427 0-.778-.116-1.057-.349-.279-.232-.418-.487-.418-.766 0-.594.509-1.288 1.527-2.083.968 1.134 1.717 1.946 2.248 2.438-.921.507-1.686.76-2.3.76" ]
