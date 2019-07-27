module Main exposing (CharacterModel, Msg(..), init, main, update, view)

import AbilityScores exposing (AbilityScore(..), viewAbilityInput)
import Browser
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
    , abilityScore = [ StrengthBase 0, DexBase 0, ConstBase 0, IntBase 0, WisBase 0, CharBase 0 ]
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
    | UpdateCharacterName String
    | UpdateClassAndLevel String
    | UpdateBackground String
    | UpdatePlayerName String
    | UpdateRace String
    | UpdateAlignment String
    | UpdateExperiencePoints String



-- Todo implement storage
-- updateWithStorage : Msg -> CharacterModel -> ( CharacterModel, Cmd Msg )
-- updateWithStorage msg characterModel =
--     let
--         ( newModel, commands ) =
--             update msg CharacterModel
--         parsedModel =
--             { newModel | abilityScore = parseAbilityScores newModel.abilityScore }
--     in
--     ( newModel
--     , Cmd.batch [ commands, storeCharacter parsedModel ]
--     )


update : Msg -> CharacterModel -> CharacterModel
update msg model =
    case msg of
        Increment ->
            { model | tempNum = model.tempNum + 1 }

        Decrement ->
            { model | tempNum = model.tempNum - 1 }

        UpdateCharacterName charName ->
            { model | characterName = charName }

        UpdateClassAndLevel classAndLevel ->
            { model | classAndLevel = classAndLevel }

        UpdateBackground background ->
            { model | background = background }

        UpdatePlayerName playerName ->
            { model | playerName = playerName }

        UpdateRace race ->
            { model | race = race }

        UpdateAlignment alignment ->
            { model | alignment = alignment }

        UpdateExperiencePoints exPoints ->
            { model | experiencePoints = Maybe.withDefault 0 (String.toInt exPoints) }


view : CharacterModel -> Html Msg
view model =
    div []
        [ h1 [] [ text "Dungeons & Dragons" ]
        , div []
            [ div []
                [ label [] [ text "Character Name" ]
                , input
                    [ type_ "text"
                    , value model.characterName
                    , onInput UpdateCharacterName
                    ]
                    []
                ]
            ]
        , div []
            [ div []
                [ label [] [ text "Class & Level" ]
                , input
                    [ type_ "text"
                    , value model.classAndLevel
                    , onInput UpdateClassAndLevel
                    ]
                    []
                ]
            , div []
                [ label [] [ text "Background" ]
                , input
                    [ type_ "text"
                    , value model.background
                    ]
                    []
                ]
            , div []
                [ label [] [ text "Player Name" ]
                , input
                    [ type_ "text"
                    , value model.playerName
                    , onInput UpdatePlayerName
                    ]
                    []
                ]
            , div []
                [ label [] [ text "Race" ]
                , input
                    [ type_ "text"
                    , value model.race
                    , onInput UpdateRace
                    ]
                    []
                ]
            , div []
                [ label [] [ text "Alignment" ]
                , input
                    [ type_ "text"
                    , value model.alignment
                    , onInput UpdateAlignment
                    ]
                    []
                ]
            , div []
                [ label [] [ text "Experience Points" ]
                , input
                    [ type_ "number"
                    , value (String.fromInt model.experiencePoints)
                    , onInput UpdateExperiencePoints
                    ]
                    []
                ]
            ]
        , div []
            (List.map viewAbilityInput model.abilityScore)
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
