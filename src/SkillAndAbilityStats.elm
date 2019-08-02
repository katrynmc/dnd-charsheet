module SkillAndAbilityStats exposing (viewSkillAndAbilityStats)

import AbilityScores exposing (AbilityScore, viewAbilityInput)
import Css exposing (..)
import Html
import Html.Styled exposing (Html, div, h2, input, label, span, text)
import Html.Styled.Attributes exposing (checked, css, for, id, name, type_, value)
import Html.Styled.Events exposing (onCheck, onInput)
import SavingThrows exposing (viewSavingThrow)
import SkillScores exposing (SkillScore, viewSkillInput)
import State exposing (CharacterModel)
import Styles exposing (theme)


viewSkillAndAbilityStats : (AbilityScore -> String -> msg) -> (AbilityScore -> Bool -> msg) -> (SkillScore -> String -> msg) -> (SkillScore -> Bool -> msg) -> (String -> msg) -> (String -> msg) -> CharacterModel -> Html msg
viewSkillAndAbilityStats updateAbility updateSavingThrowProficiency updateSkillValue updateSkillProficiency updateProficiencyBonus updateInspiration model =
    div [ css [ displayFlex ] ]
        [ div []
            (List.map (viewAbilityInput updateAbility) model.abilityScore)
        , div []
            [ div
                [ css
                    [ border3 (px 1) solid (rgb 120 120 120)
                    , borderRadius (px theme.borderRadius)
                    , margin (px (theme.gridBase * 0.5))
                    , padding (px theme.gridBase)
                    ]
                ]
                [ input
                    [ type_ "number"
                    , css
                        [ width (px theme.inputWidth.small)
                        ]
                    , name "inspiration"
                    , id "inspiration"
                    , value (String.fromInt model.inspiration)
                    , onInput updateInspiration
                    ]
                    []
                , label [ for "inspiration" ] [ text "Inspiration" ]
                ]
            , div
                [ css
                    [ border3 (px 1) solid (rgb 120 120 120)
                    , borderRadius (px theme.borderRadius)
                    , margin (px (theme.gridBase * 0.5))
                    , padding (px theme.gridBase)
                    ]
                ]
                [ input
                    [ type_ "number"
                    , css
                        [ width (px theme.inputWidth.small)
                        ]
                    , name "proficiency-bonus"
                    , id "proficiency-bonus"
                    , value (String.fromInt model.tempNum)
                    , onInput updateProficiencyBonus
                    ]
                    []
                , label [ for "proficiency-bonus" ] [ text "Proficiency Bonus" ]
                ]
            , div
                [ css
                    [ border3 (px 1) solid (rgb 120 120 120)
                    , borderRadius (px theme.borderRadius)
                    , margin (px (theme.gridBase * 0.5))
                    , padding (px theme.gridBase)
                    ]
                ]
                [ div []
                    (List.map (viewSavingThrow updateSavingThrowProficiency) model.abilityScore)
                , h2 [] [ text "Saving Throws" ]
                ]
            , div
                [ css
                    [ border3 (px 1) solid (rgb 120 120 120)
                    , borderRadius (px theme.borderRadius)
                    , margin (px (theme.gridBase * 0.5))
                    , padding (px theme.gridBase)
                    ]
                ]
                [ div
                    []
                    (List.map (viewSkillInput updateSkillValue updateSkillProficiency) model.skillScore)
                , h2 [] [ text "Skills" ]
                ]
            ]
        ]
