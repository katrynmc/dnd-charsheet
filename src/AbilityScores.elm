module AbilityScores exposing (AbilityScore(..), viewAbilityInput)

import Html exposing (Html, div, input, label, text)
import Html.Attributes exposing (..)


type AbilityScore
    = StrengthBase Int
    | DexBase Int
    | ConstBase Int
    | IntBase Int
    | WisBase Int
    | CharBase Int



-- type alias PersistedAbilityScore =
--     { strengthBase : Int
--     , dexBase : Int
--     , constBase : Int
--     , intBase : Int
--     , wisBase : Int
--     , charBase : Int
--     }


getAbilityScore : AbilityScore -> Int
getAbilityScore abilityScore =
    case abilityScore of
        StrengthBase val ->
            val

        DexBase val ->
            val

        ConstBase val ->
            val

        IntBase val ->
            val

        WisBase val ->
            val

        CharBase val ->
            val


getAbilityLabel : AbilityScore -> String
getAbilityLabel abilityScore =
    case abilityScore of
        StrengthBase _ ->
            "Strength"

        DexBase _ ->
            "Dexterity"

        ConstBase _ ->
            "Constitution"

        IntBase _ ->
            "Intelligence"

        WisBase _ ->
            "Wisdom"

        CharBase _ ->
            "Charisma"


getAbilityModifier : AbilityScore -> Int
getAbilityModifier abilityScore =
    case abilityScore of
        StrengthBase val ->
            0

        DexBase val ->
            0

        ConstBase val ->
            0

        IntBase val ->
            0

        WisBase val ->
            0

        CharBase val ->
            0



-- Todo implement parsing and persistance
-- defaultAbilityScore : PersistedAbilityScore
-- defaultAbilityScore =
--     { strengthBase = 0
--     , dexBase = 0
--     , constBase = 0
--     , intBase = 0
--     , wisBase = 0
--     , charBase = 0
--     }
-- parseAbilityScores : List AbilityScore -> PersistedAbilityScore
-- parseAbilityScores abilityScores =
--     List.foldl buildPersistedScore defaultAbilityScore abilityScores
-- buildPersistedScore : AbilityScore -> PersistedAbilityScore -> PersistedAbilityScore
-- buildPersistedScore score acc =
--     case score of
--         StrengthBase val ->
--             { acc | strengthBase = val }
--         DexBase val ->
--             { acc | dexBase = val }
--         ConstBase val ->
--             { acc | constBase = val }
--         IntBase val ->
--             { acc | intBase = val }
--         WisBase val ->
--             { acc | wisBase = val }
--         CharBase val ->
--             { acc | charBase = val }


viewAbilityInput : AbilityScore -> Html msg
viewAbilityInput abilityScore =
    div []
        [ label [] [ text (getAbilityLabel abilityScore) ]
        , input
            [ type_ "number"
            , value (String.fromInt (getAbilityScore abilityScore))
            ]
            []
        , div [] [ text (String.fromInt (getAbilityModifier abilityScore)) ]
        ]
