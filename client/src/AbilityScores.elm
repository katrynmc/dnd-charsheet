module AbilityScores exposing (AbilityScore(..), getAbilityLabel, getAbilityModifier, getSavingThrowProficiency, replaceAbilityWithNewProficiency, replaceAbilityWithNewValue, updateSavingProficiency, viewAbilityInput)

import Css exposing (..)
import Html
import Html.Styled exposing (Html, div, input, label, text)
import Html.Styled.Attributes exposing (css, for, id, name, type_, value)
import Html.Styled.Events exposing (onInput)
import Styles exposing (theme)


type AbilityScore
    = StrengthBase Int Bool
    | DexBase Int Bool
    | ConstBase Int Bool
    | IntBase Int Bool
    | WisBase Int Bool
    | CharBase Int Bool


getAbilityScore : AbilityScore -> Int
getAbilityScore abilityScore =
    case abilityScore of
        StrengthBase val _ ->
            val

        DexBase val _ ->
            val

        ConstBase val _ ->
            val

        IntBase val _ ->
            val

        WisBase val _ ->
            val

        CharBase val _ ->
            val


getSavingThrowProficiency : AbilityScore -> Bool
getSavingThrowProficiency abilityScore =
    case abilityScore of
        StrengthBase _ isProficientInSaves ->
            isProficientInSaves

        DexBase _ isProficientInSaves ->
            isProficientInSaves

        ConstBase _ isProficientInSaves ->
            isProficientInSaves

        IntBase _ isProficientInSaves ->
            isProficientInSaves

        WisBase _ isProficientInSaves ->
            isProficientInSaves

        CharBase _ isProficientInSaves ->
            isProficientInSaves


getAbilityLabel : AbilityScore -> String
getAbilityLabel abilityScore =
    case abilityScore of
        StrengthBase _ _ ->
            "Strength"

        DexBase _ _ ->
            "Dexterity"

        ConstBase _ _ ->
            "Constitution"

        IntBase _ _ ->
            "Intelligence"

        WisBase _ _ ->
            "Wisdom"

        CharBase _ _ ->
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
        StrengthBase val _ ->
            calculateModifier val

        DexBase val _ ->
            calculateModifier val

        ConstBase val _ ->
            calculateModifier val

        IntBase val _ ->
            calculateModifier val

        WisBase val _ ->
            calculateModifier val

        CharBase val _ ->
            calculateModifier val


updateAbilityScore : AbilityScore -> String -> AbilityScore
updateAbilityScore abilityScore newVal =
    case abilityScore of
        StrengthBase _ isProficientInSaves ->
            StrengthBase (Maybe.withDefault 0 (String.toInt newVal)) isProficientInSaves

        DexBase _ isProficientInSaves ->
            DexBase (Maybe.withDefault 0 (String.toInt newVal)) isProficientInSaves

        ConstBase _ isProficientInSaves ->
            ConstBase (Maybe.withDefault 0 (String.toInt newVal)) isProficientInSaves

        IntBase _ isProficientInSaves ->
            IntBase (Maybe.withDefault 0 (String.toInt newVal)) isProficientInSaves

        WisBase _ isProficientInSaves ->
            WisBase (Maybe.withDefault 0 (String.toInt newVal)) isProficientInSaves

        CharBase _ isProficientInSaves ->
            CharBase (Maybe.withDefault 0 (String.toInt newVal)) isProficientInSaves


updateSavingProficiency : AbilityScore -> Bool -> AbilityScore
updateSavingProficiency abilityScore isProficientInSaves =
    case abilityScore of
        StrengthBase val _ ->
            StrengthBase val isProficientInSaves

        DexBase val _ ->
            DexBase val isProficientInSaves

        ConstBase val _ ->
            ConstBase val isProficientInSaves

        IntBase val _ ->
            IntBase val isProficientInSaves

        WisBase val _ ->
            WisBase val isProficientInSaves

        CharBase val _ ->
            CharBase val isProficientInSaves


isSameAbility : AbilityScore -> AbilityScore -> Bool
isSameAbility newAbility oldAbility =
    getAbilityLabel newAbility == getAbilityLabel oldAbility


replaceAbilityWithNewValue : String -> AbilityScore -> AbilityScore -> AbilityScore
replaceAbilityWithNewValue newAbilityVal oldAbilityScore abilityScore =
    let
        newAbilityScore =
            updateAbilityScore oldAbilityScore newAbilityVal
    in
    if isSameAbility newAbilityScore abilityScore then
        newAbilityScore

    else
        abilityScore


replaceAbilityWithNewProficiency : Bool -> AbilityScore -> AbilityScore -> AbilityScore
replaceAbilityWithNewProficiency newAbilityProficiency oldAbilityScore abilityScore =
    let
        newAbilityScore =
            updateSavingProficiency oldAbilityScore newAbilityProficiency
    in
    if isSameAbility newAbilityScore abilityScore then
        newAbilityScore

    else
        abilityScore


viewAbilityInput : (AbilityScore -> String -> msg) -> AbilityScore -> Html msg
viewAbilityInput updateAbility abilityScore =
    div
        [ css
            [ displayFlex
            , flexDirection column
            , alignItems center
            , border3 (px 1) solid (rgb 120 120 120)
            , borderRadius (px theme.borderRadius)
            , padding (px (theme.gridBase * 0.5))
            , marginTop (px (theme.gridBase * 0.5))
            , marginBottom (px theme.gridBase)
            , width (px (theme.gridBase * 10))
            ]
        ]
        [ label
            [ for (getAbilityLabel abilityScore)
            , css
                [ marginBottom (px theme.gridBase)
                ]
            ]
            [ text (getAbilityLabel abilityScore) ]
        , input
            [ type_ "number"
            , css
                [ border unset
                , boxShadow none
                , fontSize (rem theme.font.size.med)
                , lineHeight (rem theme.lineHeight.med)
                , paddingLeft (px (theme.gridBase * 1.5))
                , textAlign center
                , width (px theme.inputWidth.med)
                , marginBottom (px theme.gridBase)
                ]
            , name (getAbilityLabel abilityScore)
            , id (getAbilityLabel abilityScore)
            , value (String.fromInt (getAbilityScore abilityScore))
            , onInput (updateAbility abilityScore)
            ]
            []
        , div [] [ text (String.fromInt (getAbilityModifier abilityScore)) ]
        ]
