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


view : Element Msg
view =
    row
        [ width (fill |> maximum 720)
        , centerX
        , paddingEach
            { top = 32
            , left = 16
            , right = 16
            , bottom = 128
            }
        ]
        [ el [ width (px 200) ] viewSidebar
        , viewMainContent
        ]


viewSidebar : Element msg
viewSidebar =
    column
        [ spacing 32 ]
        [ el [ Font.semiBold, Font.size 24 ] (text "docs")
        , column [ spacing 16 ]
            [ viewSectionHeader "elm-spa"
            , viewLinks
                [ ( "elm-spa", "/docs/elm-spa" )
                , ( "elm-spa init", "/docs/elm-spa/init" )
                , ( "elm-spa add", "/docs/elm-spa/add" )
                , ( "elm-spa build", "/docs/elm-spa/build" )
                ]
            , viewSectionHeader "pages"
            , viewLinks
                [ ( "overview", "/docs/pages" )
                , ( "static", "/docs/pages/static" )
                , ( "sandbox", "/docs/pages/elm-spa/sandbox" )
                , ( "element", "/docs/pages/elm-spa/element" )
                , ( "component", "/docs/pages/elm-spa/component" )
                ]
            ]
        ]


viewSectionHeader : String -> Element msg
viewSectionHeader label =
    el [ Font.semiBold, Font.size 20, alpha 0.5 ]
        (text label)


viewLinks : List ( String, String ) -> Element msg
viewLinks links =
    column [ spacing 12, Font.color colors.coral ]
        (List.map viewLink links)


viewLink : ( String, String ) -> Element msg
viewLink ( label, url ) =
    link [ Font.underline, Font.size 16, mouseOver [ alpha 0.5 ] ]
        { url = url, label = text label }


viewMainContent : Element msg
viewMainContent =
    text "MainContent here"
