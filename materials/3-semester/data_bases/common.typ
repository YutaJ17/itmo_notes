#let quote(
  body,
  author: none,
  dark: false,
  width: 80%,
) = {
  let font-size = 1.1em
  let author-font-size = 0.9em
  let pad = 0.9em
  let gap = 1em
  let stroke-width = 1.5pt
  let corner = 0.7em

  let accent = blue.darken(20%)
  if dark {
    accent = accent.lighten(40%)
  }

  let body = if type(body) == function {
    body()
  } else {
    [#sym.quote.l.double#body#sym.quote.r.double]
  }

  align(center, block(
    width: width,
    inset: (top: gap),
  )[
    #block(
      width: 100%,
      inset: pad,
      radius: corner,
      stroke: stroke-width + accent,
    )[
      #set align(center)
      #set text(font-size, style: "italic", fill: accent)
      #body
      #if author != none [
        #align(right)[
          #set text(author-font-size, weight: "bold")
          --- #author
        ]
      ]
    ]
  ])
}