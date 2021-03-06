module Internal.Junk exposing (..)

{-| -}

import Svg exposing (Svg)
import Html exposing (Html)
import Lines.Coordinate as Coordinate



{-| -}
type Junk msg =
  Junk (Coordinate.System -> Layers msg)


{-| -}
none : Junk msg
none =
  Junk (\_ -> Layers [] [] [])


{-| -}
type alias Layers msg =
  { below : List (Svg msg)
  , above : List (Svg msg)
  , html : List (Html msg)
  }


{-| -}
getLayers : Coordinate.System -> Layers msg -> Junk msg -> Layers msg
getLayers system internalLayers (Junk toLayers) =
  let layers = toLayers system in
  { below = internalLayers.below ++ layers.below
  , above = internalLayers.above ++ layers.above
  , html = internalLayers.html ++ layers.html
  }


{-| -}
addGrid : List (Svg msg) -> Layers msg -> Layers msg
addGrid grid layers =
  { layers | below = grid ++ layers.below }
