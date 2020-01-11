module Generated.Docs.Route exposing
    ( Route(..)
    , toPath
    )

import Generated.Docs.Params as Params


type Route
    = Dynamic String Params.Dynamic
    | Top Params.Top


toPath : Route -> String
toPath route =
    case route of
        Top _ ->
            "/"
        
        
        Dynamic value _ ->
            "/" ++ value