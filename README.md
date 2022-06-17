# GLSL-ENV 0.0.0
## What is this?
CLtL2 compatible environment protocol for GLSL.

## Alternatives and differences.
* [glsl-spec], actually, glsl-env depends on this.

## Usage

```lisp
* (eprot:in-environment :glsl)
#<EPROT:ENVIRONMENT :GLSL {1004154663}>

* (eprot:variable-information 'glsl-symbols:gl-position)
NIL
NIL
((NOTATION . "gl_Position") (STAGE :TESSELLATION-EVALUATION :GEOMETRY :VERTEX)
 (TYPE . :VEC4))

* (eprot:function-information 'glsl-symbols:texture)
:FUNCTION
NIL
((NOTATION . "texture")
 (FTYPE FUNCTION (("sampler" :SAMPLERCUBEARRAY) ("P" :VEC4)) :VEC4)
 (FTYPE FUNCTION (("sampler" :SAMPLERCUBEARRAY) ("P" :VEC4) ("bias" :FLOAT))
  :VEC4)
 (FTYPE FUNCTION (("sampler" :SAMPLERCUBE) ("P" :VEC3)) :VEC4)
 (FTYPE FUNCTION (("sampler" :SAMPLERCUBE) ("P" :VEC3) ("bias" :FLOAT)) :VEC4)
 (FTYPE FUNCTION (("sampler" :SAMPLER3D) ("P" :VEC3)) :VEC4)
 (FTYPE FUNCTION (("sampler" :SAMPLER3D) ("P" :VEC3) ("bias" :FLOAT)) :VEC4)
 (FTYPE FUNCTION (("sampler" :SAMPLER2DRECT) ("P" :VEC2)) :VEC4)
 (FTYPE FUNCTION (("sampler" :SAMPLER2DARRAY) ("P" :VEC3)) :VEC4)
 (FTYPE FUNCTION (("sampler" :SAMPLER2DARRAY) ("P" :VEC3) ("bias" :FLOAT))
  :VEC4)
 (FTYPE FUNCTION (("sampler" :SAMPLER2D) ("P" :VEC2)) :VEC4)
 (FTYPE FUNCTION (("sampler" :SAMPLER2D) ("P" :VEC2) ("bias" :FLOAT)) :VEC4)
 (FTYPE FUNCTION (("sampler" :SAMPLER1DARRAY) ("P" :VEC2)) :VEC4)
 (FTYPE FUNCTION (("sampler" :SAMPLER1DARRAY) ("P" :VEC2) ("bias" :FLOAT))
  :VEC4)
 (FTYPE FUNCTION (("sampler" :SAMPLER1D) ("P" :FLOAT)) :VEC4)
 (FTYPE FUNCTION (("sampler" :SAMPLER1D) ("P" :FLOAT) ("bias" :FLOAT)) :VEC4)
 (FTYPE FUNCTION (("sampler" :USAMPLERCUBEARRAY) ("P" :VEC4)) :UVEC4)
 (FTYPE FUNCTION (("sampler" :USAMPLERCUBEARRAY) ("P" :VEC4) ("bias" :FLOAT))
  :UVEC4)
 (FTYPE FUNCTION (("sampler" :USAMPLERCUBE) ("P" :VEC3)) :UVEC4)
 (FTYPE FUNCTION (("sampler" :USAMPLERCUBE) ("P" :VEC3) ("bias" :FLOAT))
  :UVEC4)
 (FTYPE FUNCTION (("sampler" :USAMPLER3D) ("P" :VEC3)) :UVEC4)
 (FTYPE FUNCTION (("sampler" :USAMPLER3D) ("P" :VEC3) ("bias" :FLOAT)) :UVEC4)
 (FTYPE FUNCTION (("sampler" :USAMPLER2DRECT) ("P" :VEC2)) :UVEC4)
 (FTYPE FUNCTION (("sampler" :USAMPLER2DARRAY) ("P" :VEC3)) :UVEC4)
 (FTYPE FUNCTION (("sampler" :USAMPLER2DARRAY) ("P" :VEC3) ("bias" :FLOAT))
  :UVEC4)
 (FTYPE FUNCTION (("sampler" :USAMPLER2D) ("P" :VEC2)) :UVEC4)
 (FTYPE FUNCTION (("sampler" :USAMPLER2D) ("P" :VEC2) ("bias" :FLOAT)) :UVEC4)
 (FTYPE FUNCTION (("sampler" :USAMPLER1DARRAY) ("P" :VEC2)) :UVEC4)
 (FTYPE FUNCTION (("sampler" :USAMPLER1DARRAY) ("P" :VEC2) ("bias" :FLOAT))
  :UVEC4)
 (FTYPE FUNCTION (("sampler" :USAMPLER1D) ("P" :FLOAT)) :UVEC4)
 (FTYPE FUNCTION (("sampler" :USAMPLER1D) ("P" :FLOAT) ("bias" :FLOAT)) :UVEC4)
 (FTYPE FUNCTION (("sampler" :ISAMPLERCUBEARRAY) ("P" :VEC4)) :IVEC4)
 (FTYPE FUNCTION (("sampler" :ISAMPLERCUBEARRAY) ("P" :VEC4) ("bias" :FLOAT))
  :IVEC4)
 (FTYPE FUNCTION (("sampler" :ISAMPLERCUBE) ("P" :VEC3)) :IVEC4)
 (FTYPE FUNCTION (("sampler" :ISAMPLERCUBE) ("P" :VEC3) ("bias" :FLOAT))
  :IVEC4)
 (FTYPE FUNCTION (("sampler" :ISAMPLER3D) ("P" :VEC3)) :IVEC4)
 (FTYPE FUNCTION (("sampler" :ISAMPLER3D) ("P" :VEC3) ("bias" :FLOAT)) :IVEC4)
 (FTYPE FUNCTION (("sampler" :ISAMPLER2DRECT) ("P" :VEC2)) :IVEC4)
 (FTYPE FUNCTION (("sampler" :ISAMPLER2DARRAY) ("P" :VEC3)) :IVEC4)
 (FTYPE FUNCTION (("sampler" :ISAMPLER2DARRAY) ("P" :VEC3) ("bias" :FLOAT))
  :IVEC4)
 (FTYPE FUNCTION (("sampler" :ISAMPLER2D) ("P" :VEC2)) :IVEC4)
 (FTYPE FUNCTION (("sampler" :ISAMPLER2D) ("P" :VEC2) ("bias" :FLOAT)) :IVEC4)
 (FTYPE FUNCTION (("sampler" :ISAMPLER1DARRAY) ("P" :VEC2)) :IVEC4)
 (FTYPE FUNCTION (("sampler" :ISAMPLER1DARRAY) ("P" :VEC2) ("bias" :FLOAT))
  :IVEC4)
 (FTYPE FUNCTION (("sampler" :ISAMPLER1D) ("P" :FLOAT)) :IVEC4)
 (FTYPE FUNCTION (("sampler" :ISAMPLER1D) ("P" :FLOAT) ("bias" :FLOAT)) :IVEC4)
 (FTYPE FUNCTION (("sampler" :SAMPLERCUBESHADOW) ("P" :VEC3)) :FLOAT)
 (FTYPE FUNCTION (("sampler" :SAMPLERCUBESHADOW) ("P" :VEC3) ("bias" :FLOAT))
  :FLOAT)
 (FTYPE FUNCTION
  (("sampler" :SAMPLERCUBEARRAYSHADOW) ("P" :VEC4) ("compare" :FLOAT)) :FLOAT)
 (FTYPE FUNCTION (("sampler" :SAMPLER2DSHADOW) ("P" :VEC3)) :FLOAT)
 (FTYPE FUNCTION (("sampler" :SAMPLER2DSHADOW) ("P" :VEC3) ("bias" :FLOAT))
  :FLOAT)
 (FTYPE FUNCTION (("sampler" :SAMPLER2DRECTSHADOW) ("P" :VEC3)) :FLOAT)
 (FTYPE FUNCTION (("sampler" :SAMPLER2DARRAYSHADOW) ("P" :VEC4)) :FLOAT)
 (FTYPE FUNCTION
  (("sampler" :SAMPLER2DARRAYSHADOW) ("P" :VEC4) ("bias" :FLOAT)) :FLOAT)
 (FTYPE FUNCTION (("sampler" :SAMPLER1DSHADOW) ("P" :VEC3)) :FLOAT)
 (FTYPE FUNCTION (("sampler" :SAMPLER1DSHADOW) ("P" :VEC3) ("bias" :FLOAT))
  :FLOAT)
 (FTYPE FUNCTION (("sampler" :SAMPLER1DARRAYSHADOW) ("P" :VEC3)) :FLOAT)
 (FTYPE FUNCTION
  (("sampler" :SAMPLER1DARRAYSHADOW) ("P" :VEC3) ("bias" :FLOAT)) :FLOAT))
```

## From developer

### Product's goal

### License

### Developed with

### Tested with

## Installation

<!-- Links -->
[glsl-spec]:https://github.com/cbaggers/glsl-spec
