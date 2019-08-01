module Styles exposing (theme)

import Css exposing (..)


gridBase : number
gridBase =
    10


theme :
    { borderRadius : Float
    , secondary : Color
    , primary : Color
    , gridBase : number
    , labelWidth : number
    , inputWidth : { small : Float, med : Float }
    , font : { size : { med : Float } }
    , lineHeight : { med : Float }
    }
theme =
    { borderRadius = 5
    , primary = hex "#171817"
    , secondary = hex "#bcc2c3"
    , gridBase = gridBase
    , labelWidth = 14 * gridBase
    , inputWidth =
        { small = 4 * gridBase
        , med = 8 * gridBase
        }
    , font =
        { size = { med = 1.7 }
        }
    , lineHeight =
        { med = 3.4
        }
    }
