module Generated.Route exposing
    ( Route(..)
    , toPath
    )

import Generated.Params as Params


type Route
    = Docs Params.Docs
    | Guide Params.Guide
    | NotFound Params.NotFound
    | Top Params.Top


toPath : Route -> String
toPath route =
    case route of
        Docs _ ->
            "/docs"
        
        
        Guide _ ->
            "/guide"
        
        
        NotFound _ ->
            "/not-found"
        
        
        Top _ ->
            "/"