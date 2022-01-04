import std/streams
import util
import ray

const nx = 200
const ny = 100

var strm = newFileStream("image.ppm", fmWrite)

if not isNil(strm):
  strm.writeLine("P3")
  strm.writeLine(nx, " ", ny)
  strm.writeLine("255")

  let lowerLeftCorner = Vec3(x: -2.0, y: -1.0, z: -1.0)
  let horizontal = Vec3(x: 4.0, y: 0.0, z: 0.0)
  let vertical = Vec3(x: 0.0, y: 2.0, z: 0.0)
  let origin = Vec3(x: 0.0, y: 0.0, z: 0.0)

  for j in 1..ny:
    for i in 1..nx:
      let u = float(i) / float(nx)
      let v = float(j) / float(ny)
      let r = Ray(origin: origin, direction: lowerLeftCorner + u * horizontal + v * vertical)
      let col = color(r)
      let ir = int(col.r*255.99)
      let ig = int(col.g*255.99)
      let ib = int(col.b*255.99)
      strm.writeLine(ir, " ", ig, " ", ib)