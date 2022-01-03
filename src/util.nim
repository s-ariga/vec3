# ベクトル演算のためのType定義

import math

type
  Vector2*[T] = object
    x*: T
    y*: T
    
  Vec2* = Vector2[float]

# テンプレートを使って、演算を定義するのが定石らしい
template lift_binary_vector2(op) =
  proc op*[T](a, b: Vector2[T]): Vector2[T] =
    Vector2[T](x: op(a.x, b.x), y: op(a.y, b.y))

lift_binary_vector2(`+`)
lift_binary_vector2(`-`)
lift_binary_vector2(`*`)
lift_binary_vector2(`/`)
lift_binary_vector2(`mod`)
lift_binary_vector2(`div`)
lift_binary_vector2(min)
lift_binary_vector2(max)

# TODO その他の演算子

# 3次元ベクトル
type
  Vector3*[T] = object
    x*: T
    y*: T
    z*: T
    
  Vec3* = Vector3[float]

func r*[T](a: Vector3[T]): T = a.x
func g*[T](a: Vector3[T]): T = a.y
func b*[T](a: Vector3[T]): T = a.z

template lift_binary_vector3(op) =
  func op*[T](a, b: Vector3[T]): Vector3[T] =
    Vector3[T](x: op(a.x, b.x), y: op(a.y, b.y), z: op(a.z, b.z))

lift_binary_vector3(`+`)
lift_binary_vector3(`-`)
lift_binary_vector3(`*`)
lift_binary_vector3(`/`)
lift_binary_vector3(`mod`)
lift_binary_vector3(`div`)
lift_binary_vector3(min)
lift_binary_vector3(max)

template lift_binary_scalar_vector3(op) =
  func op*[T](a: T, b: Vector3[T]): Vector3[T] =
    Vector3[T](x: op(a, b.x), y: op(a, b.y), z: op(a, b.z))
  func op*[T](a: Vector3[T], b: T): Vector3[T] =
    Vector3[T](x: op(a.x, b), y: op(a.y, b), z: op(a.z, b))

lift_binary_scalar_vector3(`*`)
lift_binary_scalar_vector3(`/`)

template lift_unary_vector3(op) =
  func op*[T](a: Vector3[T]): Vector3[T] =
    Vector3[T](x: op(a.x), y: op(a.y), z: op(a.z))

lift_unary_vector3(`-`)
lift_unary_vector3(abs)
lift_unary_vector3(floor)
lift_unary_vector3(round)
lift_unary_vector3(ceil)

func length*[T](vec:Vector3[T]): float =
  sqrt(float(vec.x * vec.x + vec.y * vec.y + vec.z * vec.z))

func normalize*[T](vec:Vector3[T]): Vector3[T] =
  vec / vec.length()

func dist*[T](a, b: Vector3[T]): float =
  length(b - a)

func dot*[T](a, b: Vector3[T]): float =
  a.x * b.x + a.y * b.y + a.z * b.z

func cross*[T](a, b: Vector3[T]): Vector3[T] =
  Vector3[T](
    x: a.y * b.z - a.z * b.y, 
    y: a.z * b.x - a.x * b.z, 
    z: a.x * b.y - a.y * b.x
  )

template lift_mutate_vector3(op) =
  func op*[T](a, b: Vector3[T]): Vector3[T] =
    op(a.x, b.x)
    op(a.y, b.y)
    op(a.z, b.z)

lift_mutate_vector3(`+=`)
lift_mutate_vector3(`-=`)
lift_mutate_vector3(`*=`)
lift_mutate_vector3(`/=`)

template lift_mutate_vector3_scalar(op) =
  func op*[T](a: Vector3[T], b: T): Vector3[T] =
    op(a.x, b)
    op(a.y, b)
    op(a.z, b)

lift_mutate_vector3_scalar(`*=`)
lift_mutate_vector3_scalar(`/=`)

# PPMとして出力するため
func `$`*[T](a: Vector3[T]): string =
  a.x + " " + a.y + " " + a.z