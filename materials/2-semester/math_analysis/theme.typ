#let term(body) = {
  underline(stroke: 1.5pt + rgb("43a047"), evade: true)[#body]
}


#let def(title: "", body) = {
  block(
    width: 100%,
    stroke: (left: 3pt + rgb("43a047")), 
    inset: (left: 12pt, y: 4pt),
    breakable: true,
    [
      #text(weight: "bold", fill: rgb("2e7d32"))[Def. #title]
      #v(4pt)
      #body
    ]
  )
}

#let th(title: "", body) = {
  block(
    width: 100%,
    stroke: (left: 3pt + rgb("1e88e5")),
    inset: (left: 12pt, y: 4pt),
    breakable: true,
    [
      #text(weight: "bold", fill: rgb("1565c0"))[Th. #title]
      #v(4pt)
      #body
    ]
  )
}

#let proof(body) = {
  block(
    width: 100%,
    stroke: (left: 3pt + rgb("9e9e9e")), 
    inset: (left: 12pt, y: 4pt),
    breakable: true,
    [
      #text(weight: "bold", fill: rgb("616161"))[Proof.]
      #v(4pt)
      $square$ #body #h(1fr) $square.filled$
    ]
  )
}


#let ex(body) = {
  block(
    width: 100%,
    stroke: (left: 3pt + rgb("ff9800")), 
    inset: (left: 12pt, y: 4pt),
    breakable: true,
    [
      #text(weight: "bold", fill: rgb("e65100"))[Ex]
      #v(4pt)
      #body
    ]
  )
}

#let eqlong(top: [], bottom: []) = {
  let format(content) = {
    if content != [] {
      set text(size: 14pt)
      content
    } else {
      []
    }
  }

  math.attach(
    math.stretch($=$),
    t: format(top),
    b: format(bottom)
  )
}


#let ash = math.op("ash")
#let ach = math.op("ach")

#let nota(body) = {
  block(
    width: 100%,
    stroke: (left: 3pt + rgb("b39ddb")),
    inset: (left: 12pt, y: 4pt),
    breakable: true,
    [
      #text(weight: "bold", fill: rgb("673ab7"))[Nota]
      #v(4pt)
      #body
    ]
  )
}

#let mem(body) = {
  block(
    width: 100%,
    stroke: (left: 3pt + rgb("ffca28")), 
    inset: (left: 12pt, y: 4pt),
    breakable: true,
    [
      #text(weight: "bold", fill: rgb("f57f17"))[Mem]
      #v(4pt)
      #body
    ]
  )
}

#let letsym = math.class("opening", scale(x: -100%)[$[$])


#let sh = math.op("sh")
#let ch = math.op("ch")

