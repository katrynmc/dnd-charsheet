module Main exposing (CharacterModel, Msg(..), init, main, update, view)

import AbilityScores exposing (AbilityScore(..), replaceAbility, viewAbilityInput)
import Browser
import CharacterSummaries exposing (CharacterSummary(..), viewCharacterSummary)
import Html exposing (Html, button, div, h1, h2, input, label, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Maybe exposing (Maybe(..))
import SkillScores exposing (SkillScore(..), viewSkillInput)


main =
    Browser.sandbox { init = init, update = update, view = view }


type alias CharacterModel =
    { characterName : String
    , classAndLevel : String
    , background : String
    , playerName : String
    , race : String
    , alignment : String
    , experiencePoints : Int
    , characterSummary : List CharacterSummary
    , abilityScore : List AbilityScore
    , skillScore : List SkillScore
    , tempNum : Int
    }


init : CharacterModel
init =
    { characterName = ""
    , classAndLevel = ""
    , background = ""
    , playerName = ""
    , race = ""
    , alignment = ""
    , experiencePoints = 0
    , characterSummary = [ CharacterName "", ClassAndLevel "", Background "", PlayerName "", Race "", Alignment "", ExperiencePoints 0 ]
    , abilityScore =
        [ StrengthBase 0
        , DexBase 0
        , ConstBase 0
        , IntBase 0
        , WisBase 0
        , CharBase 0
        ]
    , skillScore =
        [ Acrobatics False 0
        , AnimalHandling False 0
        , Arcana False 0
        , Athletics False 0
        , Deception False 0
        , History False 0
        , Insight False 0
        , Intimidation False 0
        , Investigation False 0
        , Medicine False 0
        , Nature False 0
        , Perception False 0
        , Performance False 0
        , Persuasion False 0
        , Religion False 0
        , SleightOfHand False 0
        , Stealth False 0
        , Survival False 0
        ]
    , tempNum = 0
    }


type Msg
    = Increment
    | Decrement
    | UpdateAbility AbilityScore String


update : Msg -> CharacterModel -> CharacterModel
update msg model =
    case msg of
        Increment ->
            { model | tempNum = model.tempNum + 1 }

        Decrement ->
            { model | tempNum = model.tempNum - 1 }

        UpdateAbility abilityScore newAbilityVal ->
            { model | abilityScore = List.map (replaceAbility newAbilityVal abilityScore) model.abilityScore }


view : CharacterModel -> Html Msg
view model =
    div []
        [ h1 [] [ text "Dungeons & Dragons" ]
        , div []
            (List.map viewCharacterSummary model.characterSummary)
        , div []
            (List.map (viewAbilityInput UpdateAbility) model.abilityScore)
        , div []
            [ div [] [ text "Inspiration" ]
            , button [ onClick Decrement ] [ text "-" ]
            , div [] [ text (String.fromInt model.tempNum) ]
            , button [ onClick Increment ] [ text "+" ]
            ]
        , div []
            [ div [] [ text "Proficiency Bonus" ]
            , button [ onClick Decrement ] [ text "-" ]
            , div [] [ text (String.fromInt model.tempNum) ]
            , button [ onClick Increment ] [ text "+" ]
            ]
        , div []
            [ div []
                [ div [] [ text "Strength" ]
                , button [ onClick Decrement ] [ text "-" ]
                , div [] [ text (String.fromInt model.tempNum) ]
                , button [ onClick Increment ] [ text "+" ]
                ]
            , div []
                [ div [] [ text "Dexterity" ]
                , button [ onClick Decrement ] [ text "-" ]
                , div [] [ text (String.fromInt model.tempNum) ]
                , button [ onClick Increment ] [ text "+" ]
                ]
            , div []
                [ div [] [ text "Constitution" ]
                , button [ onClick Decrement ] [ text "-" ]
                , div [] [ text (String.fromInt model.tempNum) ]
                , button [ onClick Increment ] [ text "+" ]
                ]
            , div []
                [ div [] [ text "Intelligence" ]
                , button [ onClick Decrement ] [ text "-" ]
                , div [] [ text (String.fromInt model.tempNum) ]
                , button [ onClick Increment ] [ text "+" ]
                ]
            , div []
                [ div [] [ text "Wisdom" ]
                , button [ onClick Decrement ] [ text "-" ]
                , div [] [ text (String.fromInt model.tempNum) ]
                , button [ onClick Increment ] [ text "+" ]
                ]
            , div []
                [ div [] [ text "Charisma" ]
                , button [ onClick Decrement ] [ text "-" ]
                , div [] [ text (String.fromInt model.tempNum) ]
                , button [ onClick Increment ] [ text "+" ]
                ]
            , h2 [] [ text "Saving Throws" ]
            ]
        , div []
            (List.map viewSkillInput model.skillScore)
        , h2 [] [ text "Skills" ]
        ]
