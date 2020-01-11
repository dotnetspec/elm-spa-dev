module Generated.Docs.Pages exposing
    ( Model
    , Msg
    , page
    , path
    )

import Spa.Page
import Spa.Path exposing (Path, static, dynamic)
import Layouts.Docs as Layout
import Utils.Spa as Spa
import Generated.Docs.Params as Params
import Generated.Docs.Route as Route exposing (Route)
import Pages.Docs.Dynamic
import Pages.Docs.Top
import Generated.Docs.Dynamic.Route
import Generated.Docs.Dynamic.Pages


type Model
    = DynamicModel Pages.Docs.Dynamic.Model
    | TopModel Pages.Docs.Top.Model
    | Dynamic_Folder_Model Generated.Docs.Dynamic.Pages.Model


type Msg
    = DynamicMsg Pages.Docs.Dynamic.Msg
    | TopMsg Pages.Docs.Top.Msg
    | Dynamic_Folder_Msg Generated.Docs.Dynamic.Pages.Msg


page : Spa.Page Route Model Msg layoutModel layoutMsg appMsg
page =
    Spa.layout
        { path = path
        , view = Layout.view
        , recipe =
            { init = init
            , update = update
            , bundle = bundle
            }
        }


path : Path
path =
    [ static "docs" ]


-- RECIPES


type alias Recipe flags model msg appMsg =
    Spa.Recipe flags model msg Model Msg appMsg


type alias Recipes msg =
    { dynamic : Recipe Params.Dynamic Pages.Docs.Dynamic.Model Pages.Docs.Dynamic.Msg msg
    , top : Recipe Params.Top Pages.Docs.Top.Model Pages.Docs.Top.Msg msg
    , dynamic_folder : Recipe Generated.Docs.Dynamic.Route.Route Generated.Docs.Dynamic.Pages.Model Generated.Docs.Dynamic.Pages.Msg msg
    }


recipes : Recipes msg
recipes =
    { dynamic =
        Spa.recipe
            { page = Pages.Docs.Dynamic.page
            , toModel = DynamicModel
            , toMsg = DynamicMsg
            }
    , top =
        Spa.recipe
            { page = Pages.Docs.Top.page
            , toModel = TopModel
            , toMsg = TopMsg
            }
    , dynamic_folder =
        Spa.recipe
            { page = Generated.Docs.Dynamic.Pages.page
            , toModel = Dynamic_Folder_Model
            , toMsg = Dynamic_Folder_Msg
            }
    }



-- INIT


init : Route -> Spa.Init Model Msg
init route_ =
    case route_ of
        Route.Top params ->
            recipes.top.init params
        
        Route.Dynamic _ params ->
            recipes.dynamic.init params
        
        Route.Dynamic_Folder _ route ->
            recipes.dynamic_folder.init route



-- UPDATE


update : Msg -> Model -> Spa.Update Model Msg
update bigMsg bigModel =
    case ( bigMsg, bigModel ) of
        ( TopMsg msg, TopModel model ) ->
            recipes.top.update msg model
        
        ( DynamicMsg msg, DynamicModel model ) ->
            recipes.dynamic.update msg model
        
        ( Dynamic_Folder_Msg msg, Dynamic_Folder_Model model ) ->
            recipes.dynamic_folder.update msg model
        _ ->
            Spa.Page.keep bigModel


-- BUNDLE


bundle : Model -> Spa.Bundle Msg msg
bundle bigModel =
    case bigModel of
        TopModel model ->
            recipes.top.bundle model
        
        DynamicModel model ->
            recipes.dynamic.bundle model
        
        Dynamic_Folder_Model model ->
            recipes.dynamic_folder.bundle model