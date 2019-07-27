module SkillScores exposing (SkillScore(..), replaceSkill, viewSkillInput)

import Html exposing (Html, div, input, label, span, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


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


getSkillAbility : SkillScore -> String
getSkillAbility skillScore =
    case skillScore of
        Acrobatics _ _ ->
            "Dex"

        AnimalHandling _ _ ->
            "Wis"

        Arcana _ _ ->
            "Int"

        Athletics _ _ ->
            "Str"

        Deception _ _ ->
            "Cha"

        History _ _ ->
            "Int"

        Insight _ _ ->
            "Wis"

        Intimidation _ _ ->
            "Cha"

        Investigation _ _ ->
            "Int"

        Medicine _ _ ->
            "Wis"

        Nature _ _ ->
            "Int"

        Perception _ _ ->
            "Wis"

        Performance _ _ ->
            "Cha"

        Persuasion _ _ ->
            "Cha"

        Religion _ _ ->
            "Int"

        SleightOfHand _ _ ->
            "Dex"

        Stealth _ _ ->
            "Dex"

        Survival _ _ ->
            "Wis"


mergeNewSkillValue : SkillScore -> String -> SkillScore
mergeNewSkillValue skillScore newVal =
    case skillScore of
        Acrobatics isProficient _ ->
            Acrobatics isProficient (Maybe.withDefault 0 (String.toInt newVal))

        AnimalHandling isProficient _ ->
            AnimalHandling isProficient (Maybe.withDefault 0 (String.toInt newVal))

        Arcana isProficient _ ->
            Arcana isProficient (Maybe.withDefault 0 (String.toInt newVal))

        Athletics isProficient _ ->
            Athletics isProficient (Maybe.withDefault 0 (String.toInt newVal))

        Deception isProficient _ ->
            Deception isProficient (Maybe.withDefault 0 (String.toInt newVal))

        History isProficient _ ->
            History isProficient (Maybe.withDefault 0 (String.toInt newVal))

        Insight isProficient _ ->
            Insight isProficient (Maybe.withDefault 0 (String.toInt newVal))

        Intimidation isProficient _ ->
            Intimidation isProficient (Maybe.withDefault 0 (String.toInt newVal))

        Investigation isProficient _ ->
            Investigation isProficient (Maybe.withDefault 0 (String.toInt newVal))

        Medicine isProficient _ ->
            Medicine isProficient (Maybe.withDefault 0 (String.toInt newVal))

        Nature isProficient _ ->
            Nature isProficient (Maybe.withDefault 0 (String.toInt newVal))

        Perception isProficient _ ->
            Perception isProficient (Maybe.withDefault 0 (String.toInt newVal))

        Performance isProficient _ ->
            Performance isProficient (Maybe.withDefault 0 (String.toInt newVal))

        Persuasion isProficient _ ->
            Persuasion isProficient (Maybe.withDefault 0 (String.toInt newVal))

        Religion isProficient _ ->
            Religion isProficient (Maybe.withDefault 0 (String.toInt newVal))

        SleightOfHand isProficient _ ->
            SleightOfHand isProficient (Maybe.withDefault 0 (String.toInt newVal))

        Stealth isProficient _ ->
            Stealth isProficient (Maybe.withDefault 0 (String.toInt newVal))

        Survival isProficient _ ->
            Survival isProficient (Maybe.withDefault 0 (String.toInt newVal))


isSameSkill : SkillScore -> SkillScore -> Bool
isSameSkill newSkill oldSkill =
    getSkillLabel newSkill == getSkillLabel oldSkill


replaceSkill : String -> SkillScore -> SkillScore -> SkillScore
replaceSkill newSkillVal oldSkillScore skillScore =
    let
        newSkillScore =
            mergeNewSkillValue oldSkillScore newSkillVal
    in
    if isSameSkill newSkillScore skillScore then
        newSkillScore

    else
        skillScore


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


getProficiency : SkillScore -> Bool
getProficiency skillScore =
    case skillScore of
        Acrobatics isProficient _ ->
            isProficient

        AnimalHandling isProficient _ ->
            isProficient

        Arcana isProficient _ ->
            isProficient

        Athletics isProficient _ ->
            isProficient

        Deception isProficient _ ->
            isProficient

        History isProficient _ ->
            isProficient

        Insight isProficient _ ->
            isProficient

        Intimidation isProficient _ ->
            isProficient

        Investigation isProficient _ ->
            isProficient

        Medicine isProficient _ ->
            isProficient

        Nature isProficient _ ->
            isProficient

        Perception isProficient _ ->
            isProficient

        Performance isProficient _ ->
            isProficient

        Persuasion isProficient _ ->
            isProficient

        Religion isProficient _ ->
            isProficient

        SleightOfHand isProficient _ ->
            isProficient

        Stealth isProficient _ ->
            isProficient

        Survival isProficient _ ->
            isProficient


viewSkillInput : (SkillScore -> String -> msg) -> SkillScore -> Html msg
viewSkillInput updateSkill skillScore =
    div []
        [ input
            [ type_ "checkbox"
            , checked (getProficiency skillScore)
            ]
            []
        , label [] [ text (getSkillLabel skillScore) ]
        , input
            [ type_ "number"
            , value (String.fromInt (getSkillScore skillScore))
            , onInput (updateSkill skillScore)
            ]
            []
        , span [] [ text ("(" ++ getSkillAbility skillScore ++ ")") ]
        ]
