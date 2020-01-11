module Pages.Docs.Top exposing (Model, Msg, page)

import Element exposing (..)
import Element.Font as Font
import Generated.Docs.Params as Params
import Spa.Page
import Ui exposing (colors)
import Utils.Spa exposing (Page)


type alias Model =
    ()


type alias Msg =
    Never


page : Page Params.Top Model Msg model msg appMsg
page =
    Spa.Page.static
        { title = always "Docs.Top"
        , view = always view
        }



-- VIEW


view : Element msg
view =
    text "docs"
