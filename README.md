# Ursus Sigil

A library for generating Urbit sigils.

Based on [@dclelland's UrsusSigil CocoaPod](https://github.com/dclelland/UrsusSigil).

## Usage

Generating sigil images is a one-liner in `UrsusSigil`:

```swift
let sigilImage = Sigil(ship: "~lanrus-rinfep", color: .black).image(with: CGSize(width: 24, height: 24))
```

Use the optional `icon` parameter to generate a simplified sigil:

```swift
let sigilImage = Sigil(ship: "~lanrus-rinfep", color: .black).image(with: CGSize(width: 24, height: 24), icon: true)
```

Sigils render with a transparent background.

## Installation

Ursus Sigil can be installed using Swift Package Manager by adding this repository's URL to your project's packages:

```
https://github.com/alecananian/UrsusSigil
```

## Other utilities

- [sigil-js](https://github.com/urbit/sigil-js)
- [sigil-figma-plugin](https://github.com/urbit/sigil-figma-plugin)

## References

- [Creating Sigils](https://urbit.org/blog/creating-sigils/)
- [Sigil Generator](http://sigil.azimuth.network)
- [urbit.live/explore](https://urbit.live/explore) 

## Dependencies

- [SwiftSVG](https://github.com/mchoe/SwiftSVG)
- [UrsusAtom](https://github.com/alecananian/UrsusAtom)
