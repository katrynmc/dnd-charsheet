module CharacterSummaries exposing (CharacterSummary(..), viewCharacterSummary)

import Html exposing (Html, div, input, label, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


type CharacterSummary
    = CharacterName String
    | ClassAndLevel String
    | Background String
    | PlayerName String
    | Race String
    | Alignment String
    | ExperiencePoints Int


getSummaryLabel : CharacterSummary -> String
getSummaryLabel characterSummary =
    case characterSummary of
        CharacterName _ ->
            "Character Name"

        ClassAndLevel _ ->
            "Class and Level"

        Background _ ->
            "Background"

        PlayerName _ ->
            "Player Name"

        Race _ ->
            "Race"

        Alignment _ ->
            "Alignment"

        ExperiencePoints _ ->
            "Experience Points"


getSummaryValue : CharacterSummary -> String
getSummaryValue characterSummary =
    case characterSummary of
        CharacterName val ->
            val

        ClassAndLevel val ->
            val

        Background val ->
            val

        PlayerName val ->
            val

        Race val ->
            val

        Alignment val ->
            val

        ExperiencePoints val ->
            String.fromInt val


updateCharacterSummary : String -> CharacterSummary -> CharacterSummary
updateCharacterSummary newVal characterSummary =
    case characterSummary of
        CharacterName _ ->
            CharacterName newVal

        ClassAndLevel _ ->
            ClassAndLevel newVal

        Background _ ->
            Background newVal

        PlayerName _ ->
            PlayerName newVal

        Race _ ->
            Race newVal

        Alignment _ ->
            Alignment newVal

        ExperiencePoints _ ->
            ExperiencePoints (Maybe.withDefault 0 (String.toInt newVal))


viewCharacterSummary : CharacterSummary -> Html msg
viewCharacterSummary characterSummary =
    div []
        [ label [] [ text (getSummaryLabel characterSummary) ]
        , input
            [ type_ "text"
            , value (getSummaryValue characterSummary)
            ]
            []
        ]
