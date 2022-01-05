import util
import ray

type HitRecord* = object
  t: float
  p: Vec3
  normal: Vec3

type Hitable* = object of RootObj
method hit*(hitable: Hitable, r: Ray, t_min: float, t_max: float, rec: HitRecord):bool {.base.}=
  quit("Implement hit() in Hitable")