module Ui exposing (colors, hero)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font


colors : { coral : Element.Color, white : Element.Color }
colors =
    { coral = rgb255 204 75 75
    , white = rgb255 255 255 255
    }


hero : { title : String, description : String, buttons : List ( String, String ) } -> Element msg
hero options =
    column
        [ centerX
        , paddingXY 16 128
        , spacing 24
        ]
        (column [ spacing 12 ]
            [ el [ centerX, Font.size 64, Font.semiBold ]
                (text options.title)
            , el [ centerX, Font.size 24, alpha 0.5 ]
                (text options.description)
            ]
            :: (if List.isEmpty options.buttons then
                    []

                else
                    List.map viewButton options.buttons
               )
        )


viewButton : ( String, String ) -> Element msg
viewButton ( label, url ) =
    link
        [ Background.color colors.coral
        , Font.color colors.white
        , paddingXY 24 8
        ]
        { url = url, label = text label }
