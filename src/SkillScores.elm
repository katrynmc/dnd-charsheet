module SkillScores exposing (SkillScore(..), viewSkillInput)

import Html exposing (Html, div, input, label, text)
import Html.Attributes exposing (..)


type SkillScore
    = Acrobatics Bool Int
    | AnimalHandling Bool Int
    | Arcana Bool Int
    | Athletics Bool Int
    | Deception Bool Int
    | History Bool Int
    | Insight Bool Int
    | Intimidation Bool Int
    | Investigation Bool Int
    | Medicine Bool Int
    | Nature Bool Int
    | Perception Bool Int
    | Performance Bool Int
    | Persuasion Bool Int
    | Religion Bool Int
    | SleightOfHand Bool Int
    | Stealth Bool Int
    | Survival Bool Int


getSkillLabel : SkillScore -> String
getSkillLabel skillScore =
    case skillScore of
        Acrobatics _ _ ->
            "Acrobatics"

        AnimalHandling _ _ ->
            "Animal Handling"

        Arcana _ _ ->
            "Arcana"

        Athletics _ _ ->
            "Athletics"

        Deception _ _ ->
            "Deception"

        History _ _ ->
            "History"

        Insight _ _ ->
            "Insight"

        Intimidation _ _ ->
            "Intimidation"

        Investigation _ _ ->
            "Investigation"

        Medicine _ _ ->
            "Medicine"

        Nature _ _ ->
            "Nature"

        Perception _ _ ->
            "Perception"

        Performance _ _ ->
            "Performance"

        Persuasion _ _ ->
            "Persuasion"

        Religion _ _ ->
            "Religion"

        SleightOfHand _ _ ->
            "Sleight of Hand"

        Stealth _ _ ->
            "Stealth"

        Survival _ _ ->
            "Survival"


getSkillScore : SkillScore -> Int
getSkillScore skillScore =
    case skillScore of
        Acrobatics _ score ->
            score

        AnimalHandling _ score ->
            score

        Arcana _ score ->
            score

        Athletics _ score ->
            score

        Deception _ score ->
            score

        History _ score ->
            score

        Insight _ score ->
            score

        Intimidation _ score ->
            score

        Investigation _ score ->
            score

        Medicine _ score ->
            score

        Nature _ score ->
            score

        Perception _ score ->
            score

        Performance _ score ->
            score

        Persuasion _ score ->
            score

        Religion _ score ->
            score

        SleightOfHand _ score ->
            score

        Stealth _ score ->
            score

        Survival _ score ->
            score


viewSkillInput : SkillScore -> Html msg
viewSkillInput skillScore =
    div []
        [ label [] [ text (getSkillLabel skillScore) ]
        , input
            [ type_ "number"
            , value (String.fromInt (getSkillScore skillScore))
            ]
            []
        ]
