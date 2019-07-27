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
