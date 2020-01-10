module Pages.Top exposing (Model, Msg, page)

import Element exposing (..)
import Element.Font as Font
import Generated.Params as Params
import Spa.Page
import Ui exposing (colors, hero)
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
    Ui.hero { title = "Phils Elm-Spa", description = "Getting to grips with elm-spa", buttons = [ ( "learn more", "/guide" ) ] }
