module Main exposing (Msg(..), init, main, update, view)

import AbilityScores exposing (AbilityScore(..), getAbilityModifier, replaceAbilityWithNewProficiency, replaceAbilityWithNewValue, viewAbilityInput)
import Browser
import CharacterSummaries exposing (CharacterSummary(..), viewCharacterSummary)
import Css exposing (..)
import Html exposing (..)
import Html.Styled exposing (button, div, form, h1, h2, input, label, text, toUnstyled)
import Html.Styled.Attributes exposing (css, for, id, name, type_, value)
import Html.Styled.Events exposing (onClick, onInput)
import Maybe exposing (Maybe(..))
import SkillAndAbilityStats exposing (viewSkillAndAbilityStats)
import SkillScores exposing (SkillScore(..), replaceSkillWithNewProficiency, replaceSkillWithNewValue, viewSkillInput)
import State exposing (CharacterModel, characterModelInit)
import Styles exposing (theme)


main =
    Browser.element { init = init, update = update, subscriptions = subscriptions, view = view }


init : () -> ( CharacterModel, Cmd Msg )
init _ =
    ( characterModelInit
    , Cmd.none
    )


type Msg
    = UpdateAbility AbilityScore String
    | UpdateSavingThrowProficiency AbilityScore Bool
    | UpdateSkillValue SkillScore String
    | UpdateSkillProficiency SkillScore Bool
    | UpdateProficiencyBonus String
    | UpdateInspiration String


update : Msg -> CharacterModel -> ( CharacterModel, Cmd Msg )
update msg model =
    case msg of
        UpdateAbility abilityScore newAbilityVal ->
            ( { model | abilityScore = List.map (replaceAbilityWithNewValue newAbilityVal abilityScore) model.abilityScore }, Cmd.none )

        UpdateSkillValue skillScore newSkillVal ->
            ( { model | skillScore = List.map (replaceSkillWithNewValue newSkillVal skillScore) model.skillScore }, Cmd.none )

        UpdateSkillProficiency skillScore newSkillProficiency ->
            ( { model | skillScore = List.map (replaceSkillWithNewProficiency newSkillProficiency skillScore) model.skillScore }, Cmd.none )

        UpdateProficiencyBonus newProficiencyBonus ->
            ( { model | proficiencyBonus = Maybe.withDefault 0 (String.toInt newProficiencyBonus) }, Cmd.none )

        UpdateInspiration newInspiration ->
            ( { model | inspiration = Maybe.withDefault 0 (String.toInt newInspiration) }, Cmd.none )

        UpdateSavingThrowProficiency abilityScore newProficiency ->
            ( { model | abilityScore = List.map (replaceAbilityWithNewProficiency newProficiency abilityScore) model.abilityScore }, Cmd.none )


subscriptions : CharacterModel -> Sub Msg
subscriptions model =
    Sub.none


view : CharacterModel -> Html Msg
view model =
    toUnstyled
        (form
            [ css [ fontFamilies [ "Helvetica", "sans-serif" ], backgroundColor theme.secondary, color theme.primary, borderRadius (px theme.borderRadius), padding (px theme.gridBase), width (pct 100) ] ]
            [ h1 [] [ text "Dungeons & Dragons" ]
            , div [ css [ displayFlex, flexWrap wrap ] ]
                (List.map viewCharacterSummary model.characterSummary)
            , viewSkillAndAbilityStats UpdateAbility UpdateSavingThrowProficiency UpdateSkillValue UpdateSkillProficiency UpdateProficiencyBonus UpdateInspiration model
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
                    , name "passive-wisdom"
                    , id "passive-wisdom"
                    , value (String.fromInt 0)
                    ]
                    []
                , label [ for "passive-wisdom" ] [ text "Passive Wisdom (Perception)" ]
                ]
            ]
        )
