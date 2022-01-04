import math

import util

# 光のtype
type Ray* = object
  origin*: Vec3
  direction*: Vec3

func pointAtParameter*(r: Ray, t: float): Vec3 =
  r.origin + r.direction * t

func hitSphere*(ray: Ray, center: Vec3, radius: float): float =
  let oc = ray.origin - center
  let a = dot(ray.direction, ray.direction)
  let b = 2.0 * dot(oc, ray.direction)
  let c = dot(oc, oc) - radius * radius
  let discriminant = b * b - 4.0 * a * c
  if (discriminant < 0):
    return -1.0
  else:
    return (-b - sqrt(discriminant)) / (2.0 * a)

func color*(ray: Ray): Vec3 =
  let t1 = ray.hitSphere(Vec3(x: 0, y: 0, z: -1), -0.5)
  if(t1 > 0.0):
    let N: Vec3 = normalize(ray.pointAtParameter(t1) - Vec3(x: 0, y: 0, z: -1))
    return 0.5 * Vec3(x: N.x + 1.0, y: N.y + 1.0, z: N.z + 1.0)
  let unitDirection = normalize(ray.direction)
  let t2 = 0.5*(unitDirection.y + 1.0)
  return (1.0 - t2) * Vec3(x: 1.0, y: 1.0, z: 1.0) + t2 * Vec3(x: 0.5, y: 0.7, z: 1.0)