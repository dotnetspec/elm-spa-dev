module Pages.Top exposing (Model, Msg, page)

import Element exposing (..)
import Element.Font as Font
import Generated.Params as Params
import Spa.Page
import Utils.Spa exposing (Page)


type alias Model =
    ()


type alias Msg =
    Never


page : Page Params.Top Model Msg model msg appMsg
page =
    Spa.Page.static
        { title = always "homepage"
        , view = always view
        }



-- VIEW


view : Element Msg
view =
    column
        [ centerX
        , paddingXY 16 128
        , spacing 24
        ]
        [ column [ spacing 8 ]
            [ el [ centerX, Font.size 48, Font.semiBold ] (text "elm-spa")
            , el [ alpha 0.5 ] (text "(Hi Phil)")
            ]
        ]
