import util
import hitable
import ray

type Sphere* = object of Hitable
  center*: Vec3
  radius*: float

method hit*(s:Sphere, r: Ray, t_min: float, t_max: float, rec: HitRecord): bool =
  discard()