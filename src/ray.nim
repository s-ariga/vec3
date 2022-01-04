import util

# 光のtype
type Ray* = object
  origin*: Vec3
  direction*: Vec3

func pointAtParameter*(r: Ray, t: float): Vec3 =
  r.origin + r.direction * t

func hitSphere*(ray: Ray, center: Vec3, radius: float): bool =
  let oc = ray.origin - center
  let a = dot(ray.direction, ray.direction)
  let b = 2.0 * dot(oc, ray.direction)
  let c = dot(oc, oc) - radius * radius
  let discriminant = b * b - 4.0 * a * c
  discriminant > 0.0

func color*(ray: Ray): Vec3 =
  if(ray.hitSphere(Vec3(x: 0, y: 0, z: -1), 0.5)):
    return Vec3(x: 1, y: 0, z: 0)
  let unitDirection = normalize(ray.direction)
  let t = 0.5*(unitDirection.y + 1.0)
  return (1.0-t)*Vec3(x: 1.0, y: 1.0, z: 1.0)+t*Vec3(x: 0.5, y: 0.7, z: 1.0)