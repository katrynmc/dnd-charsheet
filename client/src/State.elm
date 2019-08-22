module State exposing (CharacterModel, characterModelInit)

import AbilityScores exposing (AbilityScore(..))
import CharacterSummaries exposing (CharacterSummary(..))
import SkillScores exposing (SkillScore(..))


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
        [ StrengthBase 0 False
        , DexBase 0 False
        , ConstBase 0 False
        , IntBase 0 False
        , WisBase 0 False
        , CharBase 0 False
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
