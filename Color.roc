interface Color
    exposes [
        Color,
        ColorSpace,
        rgb255,
        rgb,
        hsv,
        hsl,
        cieluv,
        cielab,
        ciexyz,
        sRgb,
        sRgb255,
        cymk,
        toRgb255,
        toRgb,
        toHsv,
        toHsl,
        toCieluv,
        toCielab,
        toCiexyz,
        toSRgb,
        toSRgb255,
        toCymk,
        blend
    ]
    imports [
    ]

# Types

Color a := { red: Frac a , green: Frac a , blue: Frac a }

ColorSpace : [ Rgb, Hsv, Hsl, Cieluv, Cielab, Ciexyz, Cymk, SRgb ]

# Create from various color spaces

rgb255 : { red: Int a, green: Int a, blue: Int a } -> Color b
rgb255 = \{ red, green, blue } ->
    { red: Num.toFrac red / 255
    , green: Num.toFrac green / 255
    , blue: Num.toFrac blue / 255
    }
    |> rgb

rgb : { red: Frac a, green: Frac a, blue: Frac a } -> Color a
rgb = \color ->
    @Color color

hsv : { hue: Frac a, saturation: Frac a, value: Frac a } -> Color a

hsl : { hue: Frac a, saturation: Frac a, lightness: Frac a } -> Color a

cieluv : { l: Frac a, u: Frac a, v: Frac a } -> Color a

cielab : { l: Frac a, a: Frac a, b: Frac a } -> Color a

ciexyz : { x: Frac a, y: Frac a, z: Frac a } -> Color a

sRgb : { r: Frac a, g: Frac a, b: Frac a } -> Color a

sRgb255 : { sRed: Int a, sGreen: Int a, sBlue: Int a } -> Color a

cymk : { c: Frac a, y: Frac a, m: Frac a, k: Frac a } -> Color a

# Convert to various color spaces

toHsl : Color a -> { hue: Frac a, saturation: Frac a, lightness: Frac a }

toRgb255 : Color a -> { red: Int a, green: Int a, blue: Int a }

toRgb : Color a -> { red: Frac a, green: Frac a, blue: Frac a }

toHsv : Color a -> { hue: Frac a, saturation: Frac a, value: Frac a }

toCieluv : Color a -> { l: Frac a, u: Frac a, v: Frac a }

toCielab : Color a -> { l: Frac a, a: Frac a, b: Frac a }

toCiexyz : Color a -> { x: Frac a, y: Frac a, z: Frac a }

toSRgb : Color a -> { r: Frac a, g: Frac a, b: Frac a }

toSRgb255 : Color a -> { sRed: Int a, sGreen: Int a, sBlue: Int a }

toCymk : Color a -> { c: Frac a, y: Frac a, m: Frac a, k: Frac a }

# Color operations

## Interpolate between two colors in a chosen color space.
## 0 returns the first color
## 0.5 returns an even mix of the two colors
## 1 returns the second color
blend : Color a, Color a, Frac a, ColorSpace -> Color a