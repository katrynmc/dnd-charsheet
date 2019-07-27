module AbilityScores exposing (AbilityScore(..), replaceAbility, viewAbilityInput)

import Html exposing (Html, div, input, label, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


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


calculateModifier : Int -> Int
calculateModifier base =
    if base == 1 then
        -5

    else if base > 1 && base < 4 then
        -4

    else if base > 3 && base < 6 then
        -3

    else if base > 5 && base < 8 then
        -2

    else if base > 7 && base < 10 then
        -1

    else if base > 9 && base < 12 then
        0

    else if base > 11 && base < 14 then
        1

    else if base > 13 && base < 16 then
        2

    else if base > 15 && base < 18 then
        3

    else if base > 17 && base < 20 then
        4

    else if base > 19 && base < 22 then
        5

    else if base > 21 && base < 24 then
        6

    else if base > 23 && base < 26 then
        7

    else if base > 25 && base < 28 then
        8

    else if base > 27 && base < 30 then
        9

    else if base > 29 then
        10

    else
        0


getAbilityModifier : AbilityScore -> Int
getAbilityModifier abilityScore =
    case abilityScore of
        StrengthBase val ->
            calculateModifier val

        DexBase val ->
            calculateModifier val

        ConstBase val ->
            calculateModifier val

        IntBase val ->
            calculateModifier val

        WisBase val ->
            calculateModifier val

        CharBase val ->
            calculateModifier val


wrapAbilityInput : AbilityScore -> String -> AbilityScore
wrapAbilityInput abilityScore newVal =
    case abilityScore of
        StrengthBase _ ->
            StrengthBase (Maybe.withDefault 0 (String.toInt newVal))

        DexBase _ ->
            DexBase (Maybe.withDefault 0 (String.toInt newVal))

        ConstBase _ ->
            ConstBase (Maybe.withDefault 0 (String.toInt newVal))

        IntBase _ ->
            IntBase (Maybe.withDefault 0 (String.toInt newVal))

        WisBase _ ->
            WisBase (Maybe.withDefault 0 (String.toInt newVal))

        CharBase _ ->
            CharBase (Maybe.withDefault 0 (String.toInt newVal))


isSameAbility : AbilityScore -> AbilityScore -> Bool
isSameAbility newAbility oldAbility =
    getAbilityLabel newAbility == getAbilityLabel oldAbility


replaceAbility : String -> AbilityScore -> AbilityScore -> AbilityScore
replaceAbility newAbilityVal oldAbilityScore abilityScore =
    let
        newAbilityScore =
            wrapAbilityInput oldAbilityScore newAbilityVal
    in
    if isSameAbility newAbilityScore abilityScore then
        newAbilityScore

    else
        abilityScore


viewAbilityInput : (AbilityScore -> String -> msg) -> AbilityScore -> Html msg
viewAbilityInput updateAbility abilityScore =
    div []
        [ label [] [ text (getAbilityLabel abilityScore) ]
        , input
            [ type_ "number"
            , value (String.fromInt (getAbilityScore abilityScore))
            , onInput (updateAbility abilityScore)
            ]
            []
        , div [] [ text (String.fromInt (getAbilityModifier abilityScore)) ]
        ]
