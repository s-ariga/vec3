## Rayが衝突しうるオブジェクトの親オブジェクト

import util
import ray

type HitRecord* = ref object
  t*: float
  p*: Vec3
  normal*: Vec3

type Hitable* = ref object of RootObj
method hit*(hitable: Hitable, r: Ray, t_min: float, t_max: float, rec: var HitRecord):bool {.base.} =
  quit("Implement hit() in Hitable child object")

type HitableList* = ref object
  list*: seq[Hitable]

proc hitAnything*(l: HitableList, r: Ray, t_min: float, t_max: float, rec: var HitRecord): bool =
  var tmpRec = new HitRecord
  var closest = t_max
  result = false
  
  for hitable in l.list:
    if hitable.hit(r, t_min, t_max, rec):
      result = true
      closest = rec.t
      tmpRec = rec


