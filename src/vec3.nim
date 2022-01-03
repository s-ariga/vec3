import std/streams
import util

const nx = 200
const ny = 100

var strm = newFileStream("image.ppm", fmWrite)

if not isNil(strm):
  strm.writeLine("P3")
  strm.writeLine(nx, " ", ny)
  strm.writeLine("255")
  for j in 1..ny:
    for i in 1..nx:
      let color = Vec3(x: i/nx, y: j/ny, z: 0.5)
      let ir = int(color.r*255)
      let ig = int(color.g*255)
      let ib = int(color.b*255)
      strm.writeLine(ir, " ", ig, " ", ib)