import std/streams

const nx = 200
const ny = 100

var strm = newFileStream("image.ppm", fmWrite)

if not isNil(strm):
  strm.writeLine("P3")
  strm.writeLine(nx, " ", ny)
  strm.writeLine("255")
  for j in 1..ny:
    for i in 1..nx:
      let r = float(i)/float(nx)
      let g = float(j)/float(ny)
      let b = 0.5
      let ir = int(r*255)
      let ig = int(g*255)
      let ib = int(b*255)
      strm.writeLine(ir, " ", ig, " ", ib)