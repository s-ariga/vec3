## Hitableを継承した球(Sphere)オブジェクト
import math

import util
import hitable
import ray

type Sphere* = ref object of Hitable ## Hitableを継承、hit()を実装
  center*: Vec3
  radius*: float

method hit*(s:Sphere, r: Ray, t_min: float, t_max: float, rec: var HitRecord): bool =
  let oc = r.origin - s.center
  let a = dot(r.direction, r.direction)
  let b = dot(oc, r.direction)
  let c = dot(oc, oc) - s.radius*s.radius
  let discriminant = b*b - a*c
  if discriminant > 0:
    let temp = (-b - sqrt(discriminant)) / a
    if temp < t_max and temp > t_min:
      rec.t = temp
      rec.p = r.pointAtParameter(rec.t)
      rec.normal = (rec.p - s.center) / s.radius
      return true
  return false
  
