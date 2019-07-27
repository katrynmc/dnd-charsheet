module AbilityScores exposing (AbilityScore(..), viewAbilityInput)

import Html exposing (Html, div, input, label, text)
import Html.Attributes exposing (..)


type AbilityScore
    = StrengthBase String Int
    | DexBase String Int
    | ConstBase String Int
    | IntBase String Int
    | WisBase String Int
    | CharBase String Int


getAbilityScore : AbilityScore -> Int
getAbilityScore abilityScore =
    case abilityScore of
        StrengthBase _ val ->
            val

        DexBase _ val ->
            val

        ConstBase _ val ->
            val

        IntBase _ val ->
            val

        WisBase _ val ->
            val

        CharBase _ val ->
            val


getAbilityLabel : AbilityScore -> String
getAbilityLabel abilityScore =
    case abilityScore of
        StrengthBase label _ ->
            label

        DexBase label _ ->
            label

        ConstBase label _ ->
            label

        IntBase label _ ->
            label

        WisBase label _ ->
            label

        CharBase label _ ->
            label


getAbilityModifier : AbilityScore -> Int
getAbilityModifier abilityScore =
    case abilityScore of
        StrengthBase _ val ->
            0

        DexBase _ val ->
            0

        ConstBase _ val ->
            0

        IntBase _ val ->
            0

        WisBase _ val ->
            0

        CharBase _ val ->
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
