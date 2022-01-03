import util

# 光のtype
type Ray* = object
  origin*:    Vec3
  direction*: Vec3

func pointAtParameter*(r: Ray, t: float): Vec3 =
  r.origin + r.direction * t
