module Main exposing (CharacterModel, Msg(..), init, main, update, view)

import AbilityScores exposing (AbilityScore(..), replaceAbility, viewAbilityInput)
import Browser
import CharacterSummaries exposing (CharacterSummary(..), viewCharacterSummary)
import Css exposing (..)
import Html exposing (..)
import Html.Styled exposing (button, div, form, h1, h2, input, label, text, toUnstyled)
import Html.Styled.Attributes exposing (css, for, id, name, type_, value)
import Html.Styled.Events exposing (onClick, onInput)
import Maybe exposing (Maybe(..))
import SkillScores exposing (SkillScore(..), replaceSkillWithNewProficiency, replaceSkillWithNewValue, viewSkillInput)
import Styles exposing (theme)


main =
    Browser.element { init = init, update = update, subscriptions = subscriptions, view = view }


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
    , proficiencyBonus : Int
    , inspiration : Int
    }


characterModelInit : CharacterModel
characterModelInit =
    { characterName = ""
    , classAndLevel = ""
    , background = ""
    , playerName = ""
    , race = ""
    , alignment = ""
    , experiencePoints = 0
    , proficiencyBonus = 0
    , inspiration = 0
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


init : () -> ( CharacterModel, Cmd Msg )
init _ =
    ( characterModelInit
    , Cmd.none
    )


type Msg
    = Increment
    | Decrement
    | UpdateAbility AbilityScore String
    | UpdateSkillValue SkillScore String
    | UpdateSkillProficiency SkillScore Bool
    | UpdateProficiencyBonus String
    | UpdateInspiration String


update : Msg -> CharacterModel -> ( CharacterModel, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( { model | tempNum = model.tempNum + 1 }, Cmd.none )

        Decrement ->
            ( { model | tempNum = model.tempNum - 1 }, Cmd.none )

        UpdateAbility abilityScore newAbilityVal ->
            ( { model | abilityScore = List.map (replaceAbility newAbilityVal abilityScore) model.abilityScore }, Cmd.none )

        UpdateSkillValue skillScore newSkillVal ->
            ( { model | skillScore = List.map (replaceSkillWithNewValue newSkillVal skillScore) model.skillScore }, Cmd.none )

        UpdateSkillProficiency skillScore newSkillProficiency ->
            ( { model | skillScore = List.map (replaceSkillWithNewProficiency newSkillProficiency skillScore) model.skillScore }, Cmd.none )

        UpdateProficiencyBonus newProficiencyBonus ->
            ( { model | proficiencyBonus = Maybe.withDefault 0 (String.toInt newProficiencyBonus) }, Cmd.none )

        UpdateInspiration newInspiration ->
            ( { model | inspiration = Maybe.withDefault 0 (String.toInt newInspiration) }, Cmd.none )


subscriptions : CharacterModel -> Sub Msg
subscriptions model =
    Sub.none


view : CharacterModel -> Html Msg
view model =
    toUnstyled
        (form
            [ css [ fontFamilies [ "Helvetica", "sans-serif" ], backgroundColor theme.secondary, color theme.primary, borderRadius (px theme.borderRadius), padding (px theme.gridBase) ] ]
            [ h1 [] [ text "Dungeons & Dragons" ]
            , div []
                (List.map viewCharacterSummary model.characterSummary)
            , div [ css [ displayFlex ] ]
                [ div []
                    (List.map (viewAbilityInput UpdateAbility) model.abilityScore)
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
                            , value (String.fromInt model.tempNum)
                            , onInput UpdateProficiencyBonus
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
                            , onInput UpdateProficiencyBonus
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
                        [ h2 [] [ text "Saving Throws" ]
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
                            (List.map (viewSkillInput UpdateSkillValue UpdateSkillProficiency) model.skillScore)
                        , h2 [] [ text "Skills" ]
                        ]
                    ]
                ]
            ]
        )
