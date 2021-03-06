module Lines.Dot exposing
  ( Shape, none
  , circle, triangle, square, diamond, plus, cross
  , Look, default, static, emphasizable
  , Style, bordered, disconnected, aura, full
  )

{-|

# Quick start
@docs none

# Customizing shape
@docs Shape, circle, triangle, square, diamond, plus, cross

# Customizing style
@docs Look, default, static, emphasizable

## Styles
@docs Style, full, bordered, disconnected, aura

-}

import Internal.Dot as Dot



-- QUICK START


{-| If you don't want a dot at all.

    humanChart : Html msg
    humanChart =
      Lines.view .age .income
        [ Lines.line Color.pink Dot.none "Alice" alice ]
-}
none : Shape
none =
  Dot.None



-- SHAPES


{-| The shapes in this section is the selection you have available to use as the
shape of your line's dot.

    humanChart : Html msg
    humanChart =
      Lines.view .age .income
        [ Lines.line Color.orange Dot.plus "Alice" alice
        , Lines.line Color.blue Dot.square "Bob" bob
        , Lines.line Color.pink Dot.diamond "Chuck" chuck
        ]
-}
type alias Shape =
  Dot.Shape


{-|
-}
circle : Shape
circle =
  Dot.Circle


{-| -}
triangle : Shape
triangle =
  Dot.Triangle


{-| -}
square : Shape
square =
  Dot.Square


{-| -}
diamond : Shape
diamond =
  Dot.Diamond


{-| -}
plus : Shape
plus =
  Dot.Plus


{-| -}
cross : Shape
cross =
  Dot.Cross



-- LOOK


{-| -}
type alias Look data =
  Dot.Look data


{-| -}
default : Look data
default =
  Dot.default


{-|

    dotLook : Dot.Look data
    dotLook =
      Dot.static (Dot.full 5)
-}
static : Style -> Look data
static =
  Dot.static


{-|

    dotLook : Dot.Look Info
    dotLook =
      Dot.emphasizable
        { normal = Dot.full 5
        , emphasized = Dot.aura 7 4 0.5
        , isEmphasized = isOverweight
        }

    isOverweight : Info -> Bool
    isOverweight info =
      bmi info > 25

-}
emphasizable :
  { normal : Style
  , emphasized : Style
  , isEmphasized : data -> Bool
  }
  -> Look data
emphasizable =
  Dot.emphasizable



-- STYLES


{-| -}
type alias Style =
  Dot.Style


{-| Makes dots plain and solid. Pass the radius.
-}
full : Float -> Style
full =
  Dot.full


{-| Makes dots with a white core and a colored border.
Pass the radius of the dot and the width of the border.
-}
bordered : Float -> Int -> Style
bordered =
  Dot.bordered


{-| Makes dots with a colored core and a white border (Inverse of `bordered`).
Pass the radius of the dot and the width of the border.
-}
disconnected : Float -> Int -> Style
disconnected =
  Dot.disconnected


{-| Makes dots with a colored core and a less colored, transparent border.
Pass the radius of the dot, the width of the border, and the opacity of the
border (A number between 0 and 1).
-}
aura : Float -> Int -> Float -> Style
aura =
  Dot.aura
