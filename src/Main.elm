module Main exposing (Model, Msg(..), init, main, update, view)

import AbilityScores exposing (AbilityScore(..), toAbilityScore, viewAbilityInput)
import Browser
import Html exposing (Html, button, div, h1, h2, input, label, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)


main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Model =
    { characterName : String
    , classAndLevel : String
    , background : String
    , playerName : String
    , race : String
    , alignment : String
    , experiencePoints : Int
    , abilityScore : List AbilityScore
    , tempNum : Int
    }


init : Model
init =
    { characterName = ""
    , classAndLevel = ""
    , background = ""
    , playerName = ""
    , race = ""
    , alignment = ""
    , experiencePoints = 0
    , abilityScore = [ StrengthBase "Strength Base" 0, DexBase "Dexterity Base" 0, ConstBase "Constitution Base" 0 ]
    , tempNum = 0
    }


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | tempNum = model.tempNum + 1 }

        Decrement ->
            { model | tempNum = model.tempNum - 1 }


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Dungeons & Dragons" ]
        , div []
            [ div []
                [ label [] [ text "Character Name" ]
                , input
                    [ type_ "text"
                    , value model.characterName
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
                    ]
                    []
                ]
            , div []
                [ label [] [ text "Race" ]
                , input
                    [ type_ "text"
                    , value model.race
                    ]
                    []
                ]
            , div []
                [ label [] [ text "Alignment" ]
                , input
                    [ type_ "text"
                    , value model.alignment
                    ]
                    []
                ]
            , div []
                [ label [] [ text "Experience Points" ]
                , input
                    [ type_ "number"
                    , value (String.fromInt model.experiencePoints)
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
        ]
