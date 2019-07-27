module AbilityScores exposing (AbilityScore(..), toAbilityScore, viewAbilityInput)

import Html exposing (Html, div, input, label, text)
import Html.Attributes exposing (..)


type AbilityScore
    = StrengthBase String Int
    | DexBase String Int
    | ConstBase String Int
    | IntBase String Int
    | WisBase String Int
    | CharBase String Int


toAbilityScore : AbilityScore -> Int
toAbilityScore abilityScore =
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


toAbilityLabel : AbilityScore -> String
toAbilityLabel abilityScore =
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


viewAbilityInput : AbilityScore -> Html msg
viewAbilityInput a =
    div []
        [ label [] [ text (toAbilityLabel a) ]
        , input
            [ type_ "number"
            , value (String.fromInt (toAbilityScore a))
            ]
            []
        ]
