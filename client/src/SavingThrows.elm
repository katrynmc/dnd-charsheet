module SavingThrows exposing (viewSavingThrow)

import AbilityScores exposing (AbilityScore, getAbilityLabel, getAbilityModifier, getSavingThrowProficiency)
import Css exposing (..)
import Html
import Html.Styled exposing (Html, div, input, label, text)
import Html.Styled.Attributes exposing (checked, css, for, id, name, type_, value)
import Html.Styled.Events exposing (onCheck, onInput)
import Styles exposing (theme)


viewSavingProficiencyCheckbox : (AbilityScore -> Bool -> msg) -> AbilityScore -> Html msg
viewSavingProficiencyCheckbox updateSavingThrowProficiency abilityScore =
    input
        [ type_ "checkbox"
        , checked (getSavingThrowProficiency abilityScore)
        , onCheck (updateSavingThrowProficiency abilityScore)
        ]
        []


viewSavingThrow : (AbilityScore -> Bool -> msg) -> AbilityScore -> Html msg
viewSavingThrow updateSavingThrowProficiency abilityScore =
    div
        [ css
            [ displayFlex
            , marginBottom (px (theme.gridBase * 0.5))
            ]
        ]
        [ div
            [ css
                [ paddingRight (px (theme.gridBase * 0.5))
                ]
            ]
            [ viewSavingProficiencyCheckbox updateSavingThrowProficiency abilityScore
            ]
        , div
            [ css
                [ marginRight (px theme.gridBase)
                ]
            ]
            [ label
                [ for (getAbilityLabel abilityScore)
                , css
                    [ display inlineBlock
                    , width (px theme.labelWidth)
                    ]
                ]
                [ text (getAbilityLabel abilityScore) ]
            , input
                [ type_ "number"
                , css
                    [ border unset
                    , boxShadow none
                    , width (px theme.inputWidth.small)
                    ]
                , name (getAbilityLabel abilityScore)
                , id (getAbilityLabel abilityScore)
                , value (String.fromInt (getAbilityModifier abilityScore))
                ]
                []
            ]
        ]
