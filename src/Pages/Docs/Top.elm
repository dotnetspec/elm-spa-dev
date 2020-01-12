module Pages.Docs.Top exposing (Model, Msg, page)

import Element exposing (..)
import Element.Font as Font
import Generated.Docs.Params as Params
import Markdown
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
-- alignment appears to be important to get this markdown to render correctly


view : Element msg
view =
    markdown
        """
  ### header 3
  This is a paragraph. [Click me](/guide)
  This is a paragraph. [Click me](/guide)
  """


markdown : String -> Element msg
markdown content =
    Element.html <|
        Markdown.toHtml [] content
