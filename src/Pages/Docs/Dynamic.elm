module Pages.Docs.Dynamic exposing (Model, Msg, page)

import Element exposing (..)
import Generated.Docs.Params as Params
import Spa.Page
import Utils.Spa exposing (Page)


page : Page Params.Dynamic Model Msg model msg appMsg
page =
    Spa.Page.element
        { title = always "Docs.Dynamic"
        , init = always init
        , update = always update
        , subscriptions = always subscriptions
        , view = always view
        }



-- INIT


type alias Model =
    { slug : String }


init : Params.Dynamic -> ( Model, Cmd Msg )
init { param1 } =
    ( { slug = param1 }
    , Cmd.none
    )



-- UPDATE


type Msg
    = Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model
    , Cmd.none
    )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW
-- display whatever is in the model


view : Model -> Element Msg
view model =
    text model.slug
