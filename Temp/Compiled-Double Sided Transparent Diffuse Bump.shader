// Compiled shader for PC, Mac & Linux Standalone, uncompressed size: 689.6KB

// Skipping shader variants that would not be included into build of current scene.

Shader "Ciconia Studio/Double Sided/Transparent/Diffuse Bump" {
Properties {
 _Diffusecolor ("Diffuse color", Color) = (1.000000,1.000000,1.000000,1.000000)
 _DiffuseMapTransA ("Diffuse Map (Trans A)", 2D) = "white" { }
 _NormalMap ("Normal Map", 2D) = "bump" { }
 _NormalIntensity ("Normal Intensity", Range(0.000000,2.000000)) = 1.000000
 _SpecularMap ("Specular Map", 2D) = "white" { }
 _Speccolor ("Spec color", Color) = (1.000000,1.000000,1.000000,1.000000)
 _SpecIntensity ("Spec Intensity", Range(0.000000,2.000000)) = 0.500000
 _Gloss ("Gloss", Range(0.000000,1.000000)) = 0.300000
 _Transparency ("Transparency", Range(0.000000,1.000000)) = 0.500000
[HideInInspector]  _Cutoff ("Alpha cutoff", Range(0.000000,1.000000)) = 0.500000
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }


 // Stats for Vertex shader:
 //       metal : 17 math
 //      opengl : 122 math, 8 texture, 14 branch
 // Stats for Fragment shader:
 //       metal : 122 math, 8 texture, 14 branch
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "SHADOWSUPPORT"="true" "RenderType"="Transparent" }
  Cull Off
  Blend SrcAlpha OneMinusSrcAlpha
  GpuProgramID 65037
Program "vp" {
SubProgram "opengl " {
// Stats: 122 math, 8 textures, 14 branches
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"#version 120

#ifdef VERTEX

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
attribute vec4 TANGENT;
varying vec2 xlv_TEXCOORD0;
varying vec2 xlv_TEXCOORD1;
varying vec2 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec4 xlv_TEXCOORD8;
void main ()
{
  vec4 v_1;
  v_1.x = unity_WorldToObject[0].x;
  v_1.y = unity_WorldToObject[1].x;
  v_1.z = unity_WorldToObject[2].x;
  v_1.w = unity_WorldToObject[3].x;
  vec4 v_2;
  v_2.x = unity_WorldToObject[0].y;
  v_2.y = unity_WorldToObject[1].y;
  v_2.z = unity_WorldToObject[2].y;
  v_2.w = unity_WorldToObject[3].y;
  vec4 v_3;
  v_3.x = unity_WorldToObject[0].z;
  v_3.y = unity_WorldToObject[1].z;
  v_3.z = unity_WorldToObject[2].z;
  v_3.w = unity_WorldToObject[3].z;
  vec3 tmpvar_4;
  tmpvar_4 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = TANGENT.xyz;
  vec3 tmpvar_6;
  tmpvar_6 = normalize((unity_ObjectToWorld * tmpvar_5).xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = gl_MultiTexCoord0.xy;
  xlv_TEXCOORD1 = gl_MultiTexCoord1.xy;
  xlv_TEXCOORD2 = gl_MultiTexCoord2.xy;
  xlv_TEXCOORD3 = (unity_ObjectToWorld * gl_Vertex);
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * TANGENT.w));
  xlv_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform samplerCube unity_SpecCube0;
uniform samplerCube unity_SpecCube1;
uniform vec4 unity_SpecCube0_BoxMax;
uniform vec4 unity_SpecCube0_BoxMin;
uniform vec4 unity_SpecCube0_ProbePosition;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_SpecCube1_BoxMax;
uniform vec4 unity_SpecCube1_BoxMin;
uniform vec4 unity_SpecCube1_ProbePosition;
uniform vec4 unity_SpecCube1_HDR;
uniform sampler3D unity_ProbeVolumeSH;
uniform vec4 unity_ProbeVolumeParams;
uniform mat4 unity_ProbeVolumeWorldToObject;
uniform vec3 unity_ProbeVolumeSizeInv;
uniform vec3 unity_ProbeVolumeMin;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _LightColor0;
uniform sampler2D _DiffuseMapTransA;
uniform vec4 _DiffuseMapTransA_ST;
uniform vec4 _Diffusecolor;
uniform sampler2D _NormalMap;
uniform vec4 _NormalMap_ST;
uniform float _NormalIntensity;
uniform sampler2D _SpecularMap;
uniform vec4 _SpecularMap_ST;
uniform vec4 _Speccolor;
uniform float _SpecIntensity;
uniform float _Gloss;
uniform float _Transparency;
varying vec2 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec4 xlv_TEXCOORD8;
void main ()
{
  float tmpvar_1;
  if (gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD4;
  float tmpvar_3;
  vec3 tmpvar_4;
  int tmpvar_5;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_5 = 1;
  } else {
    tmpvar_5 = -1;
  };
  tmpvar_2 = (normalize(xlv_TEXCOORD4) * float(tmpvar_5));
  mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD5.x;
  tmpvar_6[0].y = xlv_TEXCOORD6.x;
  tmpvar_6[0].z = tmpvar_2.x;
  tmpvar_6[1].x = xlv_TEXCOORD5.y;
  tmpvar_6[1].y = xlv_TEXCOORD6.y;
  tmpvar_6[1].z = tmpvar_2.y;
  tmpvar_6[2].x = xlv_TEXCOORD5.z;
  tmpvar_6[2].y = xlv_TEXCOORD6.z;
  tmpvar_6[2].z = tmpvar_2.z;
  vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3.xyz));
  vec3 normal_8;
  normal_8.xy = ((texture2D (_NormalMap, (
    (xlv_TEXCOORD0 * _NormalMap_ST.xy)
   + _NormalMap_ST.zw)).wy * 2.0) - 1.0);
  normal_8.z = sqrt((1.0 - clamp (
    dot (normal_8.xy, normal_8.xy)
  , 0.0, 1.0)));
  vec3 tmpvar_9;
  tmpvar_9 = normalize((mix (vec3(0.0, 0.0, 1.0), normal_8, vec3(_NormalIntensity)) * tmpvar_6));
  vec3 tmpvar_10;
  vec3 I_11;
  I_11 = -(tmpvar_7);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_7 + tmpvar_12));
  float tmpvar_14;
  tmpvar_14 = exp2(((_Gloss * 10.0) + 1.0));
  tmpvar_4 = xlv_TEXCOORD3.xyz;
  tmpvar_3 = (1.0 - _Gloss);
  vec3 ambient_15;
  ambient_15 = xlv_TEXCOORD8.xyz;
  vec3 ambient_contrib_16;
  ambient_contrib_16 = vec3(0.0, 0.0, 0.0);
  if ((unity_ProbeVolumeParams.x == 1.0)) {
    vec4 tmpvar_17;
    tmpvar_17.w = 1.0;
    tmpvar_17.xyz = tmpvar_9;
    vec3 x1_18;
    vec3 texCoord_19;
    vec3 tmpvar_20;
    if ((unity_ProbeVolumeParams.y == 1.0)) {
      vec4 tmpvar_21;
      tmpvar_21.w = 1.0;
      tmpvar_21.xyz = tmpvar_4;
      tmpvar_20 = (unity_ProbeVolumeWorldToObject * tmpvar_21).xyz;
    } else {
      tmpvar_20 = tmpvar_4;
    };
    vec3 tmpvar_22;
    tmpvar_22 = ((tmpvar_20 - unity_ProbeVolumeMin) * unity_ProbeVolumeSizeInv);
    texCoord_19.yz = tmpvar_22.yz;
    texCoord_19.x = (tmpvar_22.x * 0.25);
    float tmpvar_23;
    float tmpvar_24;
    tmpvar_24 = (0.5 * unity_ProbeVolumeParams.z);
    tmpvar_23 = clamp (texCoord_19.x, tmpvar_24, (0.25 - tmpvar_24));
    texCoord_19.x = tmpvar_23;
    vec4 tmpvar_25;
    tmpvar_25 = texture3D (unity_ProbeVolumeSH, texCoord_19);
    texCoord_19.x = (tmpvar_23 + 0.25);
    vec4 tmpvar_26;
    tmpvar_26 = texture3D (unity_ProbeVolumeSH, texCoord_19);
    texCoord_19.x = (tmpvar_23 + 0.5);
    x1_18.x = dot (tmpvar_25, tmpvar_17);
    x1_18.y = dot (tmpvar_26, tmpvar_17);
    x1_18.z = dot (texture3D (unity_ProbeVolumeSH, texCoord_19), tmpvar_17);
    ambient_contrib_16 = x1_18;
  } else {
    vec4 tmpvar_27;
    tmpvar_27.w = 1.0;
    tmpvar_27.xyz = tmpvar_9;
    vec3 x_28;
    x_28.x = dot (unity_SHAr, tmpvar_27);
    x_28.y = dot (unity_SHAg, tmpvar_27);
    x_28.z = dot (unity_SHAb, tmpvar_27);
    ambient_contrib_16 = x_28;
  };
  vec3 tmpvar_29;
  tmpvar_29 = max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD8.xyz + ambient_contrib_16));
  ambient_15 = tmpvar_29;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_15 = max (((1.055 * 
      pow (max (tmpvar_29, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0));
  };
  vec3 specular_30;
  vec3 worldRefl_31;
  worldRefl_31 = tmpvar_10;
  vec3 worldPos_32;
  worldPos_32 = tmpvar_4;
  if ((unity_SpecCube0_ProbePosition.w > 0.0)) {
    vec3 tmpvar_33;
    tmpvar_33 = normalize(tmpvar_10);
    vec3 tmpvar_34;
    tmpvar_34 = ((unity_SpecCube0_BoxMax.xyz - xlv_TEXCOORD3.xyz) / tmpvar_33);
    vec3 tmpvar_35;
    tmpvar_35 = ((unity_SpecCube0_BoxMin.xyz - xlv_TEXCOORD3.xyz) / tmpvar_33);
    bvec3 tmpvar_36;
    tmpvar_36 = greaterThan (tmpvar_33, vec3(0.0, 0.0, 0.0));
    float tmpvar_37;
    if (tmpvar_36.x) {
      tmpvar_37 = tmpvar_34.x;
    } else {
      tmpvar_37 = tmpvar_35.x;
    };
    float tmpvar_38;
    if (tmpvar_36.y) {
      tmpvar_38 = tmpvar_34.y;
    } else {
      tmpvar_38 = tmpvar_35.y;
    };
    float tmpvar_39;
    if (tmpvar_36.z) {
      tmpvar_39 = tmpvar_34.z;
    } else {
      tmpvar_39 = tmpvar_35.z;
    };
    worldPos_32 = (xlv_TEXCOORD3.xyz - unity_SpecCube0_ProbePosition.xyz);
    worldRefl_31 = (worldPos_32 + (tmpvar_33 * min (
      min (tmpvar_37, tmpvar_38)
    , tmpvar_39)));
  };
  vec4 tmpvar_40;
  tmpvar_40.xyz = worldRefl_31;
  tmpvar_40.w = ((tmpvar_3 * (1.7 - 
    (0.7 * tmpvar_3)
  )) * 6.0);
  vec4 tmpvar_41;
  tmpvar_41 = textureCubeLod (unity_SpecCube0, worldRefl_31, tmpvar_40.w);
  vec3 tmpvar_42;
  tmpvar_42 = ((unity_SpecCube0_HDR.x * pow (tmpvar_41.w, unity_SpecCube0_HDR.y)) * tmpvar_41.xyz);
  if ((unity_SpecCube0_BoxMin.w < 0.99999)) {
    vec3 worldRefl_43;
    worldRefl_43 = tmpvar_10;
    vec3 worldPos_44;
    worldPos_44 = tmpvar_4;
    if ((unity_SpecCube1_ProbePosition.w > 0.0)) {
      vec3 tmpvar_45;
      tmpvar_45 = normalize(tmpvar_10);
      vec3 tmpvar_46;
      tmpvar_46 = ((unity_SpecCube1_BoxMax.xyz - xlv_TEXCOORD3.xyz) / tmpvar_45);
      vec3 tmpvar_47;
      tmpvar_47 = ((unity_SpecCube1_BoxMin.xyz - xlv_TEXCOORD3.xyz) / tmpvar_45);
      bvec3 tmpvar_48;
      tmpvar_48 = greaterThan (tmpvar_45, vec3(0.0, 0.0, 0.0));
      float tmpvar_49;
      if (tmpvar_48.x) {
        tmpvar_49 = tmpvar_46.x;
      } else {
        tmpvar_49 = tmpvar_47.x;
      };
      float tmpvar_50;
      if (tmpvar_48.y) {
        tmpvar_50 = tmpvar_46.y;
      } else {
        tmpvar_50 = tmpvar_47.y;
      };
      float tmpvar_51;
      if (tmpvar_48.z) {
        tmpvar_51 = tmpvar_46.z;
      } else {
        tmpvar_51 = tmpvar_47.z;
      };
      worldPos_44 = (xlv_TEXCOORD3.xyz - unity_SpecCube1_ProbePosition.xyz);
      worldRefl_43 = (worldPos_44 + (tmpvar_45 * min (
        min (tmpvar_49, tmpvar_50)
      , tmpvar_51)));
    };
    vec4 tmpvar_52;
    tmpvar_52.xyz = worldRefl_43;
    tmpvar_52.w = ((tmpvar_3 * (1.7 - 
      (0.7 * tmpvar_3)
    )) * 6.0);
    vec4 tmpvar_53;
    tmpvar_53 = textureCubeLod (unity_SpecCube1, worldRefl_43, tmpvar_52.w);
    specular_30 = mix (((unity_SpecCube1_HDR.x * 
      pow (tmpvar_53.w, unity_SpecCube1_HDR.y)
    ) * tmpvar_53.xyz), tmpvar_42, unity_SpecCube0_BoxMin.www);
  } else {
    specular_30 = tmpvar_42;
  };
  vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_SpecularMap, (
    (xlv_TEXCOORD0 * _SpecularMap_ST.xy)
   + _SpecularMap_ST.zw)).xyz * _SpecIntensity) * _Speccolor.xyz);
  vec4 tmpvar_55;
  tmpvar_55 = texture2D (_DiffuseMapTransA, ((xlv_TEXCOORD0 * _DiffuseMapTransA_ST.xy) + _DiffuseMapTransA_ST.zw));
  vec4 tmpvar_56;
  tmpvar_56.xyz = (((
    (max (0.0, dot (tmpvar_9, tmpvar_12)) * _LightColor0.xyz)
   + ambient_15) * (tmpvar_55.xyz * _Diffusecolor.xyz)) + ((
    pow (max (0.0, dot (tmpvar_13, tmpvar_9)), tmpvar_14)
   * tmpvar_54) + (specular_30 * tmpvar_54)));
  tmpvar_56.w = (tmpvar_55.w * _Transparency);
  gl_FragData[0] = tmpvar_56;
}


#endif
"
}
SubProgram "metal " {
// Stats: 17 math
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
Bind "texcoord2" ATTR5
ConstBuffer "$Globals" 192
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [unity_ObjectToWorld]
Matrix 128 [unity_WorldToObject]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
  float4 _glesMultiTexCoord2 [[attribute(5)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float4 xlv_TEXCOORD8;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4x4 unity_ObjectToWorld;
  float4x4 unity_WorldToObject;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 v_1 = 0;
  v_1.x = _mtl_u.unity_WorldToObject[0].x;
  v_1.y = _mtl_u.unity_WorldToObject[1].x;
  v_1.z = _mtl_u.unity_WorldToObject[2].x;
  v_1.w = _mtl_u.unity_WorldToObject[3].x;
  float4 v_2 = 0;
  v_2.x = _mtl_u.unity_WorldToObject[0].y;
  v_2.y = _mtl_u.unity_WorldToObject[1].y;
  v_2.z = _mtl_u.unity_WorldToObject[2].y;
  v_2.w = _mtl_u.unity_WorldToObject[3].y;
  float4 v_3 = 0;
  v_3.x = _mtl_u.unity_WorldToObject[0].z;
  v_3.y = _mtl_u.unity_WorldToObject[1].z;
  v_3.z = _mtl_u.unity_WorldToObject[2].z;
  v_3.w = _mtl_u.unity_WorldToObject[3].z;
  float3 tmpvar_4 = 0;
  tmpvar_4 = normalize(((
    (v_1.xyz * _mtl_i._glesNormal.x)
   + 
    (v_2.xyz * _mtl_i._glesNormal.y)
  ) + (v_3.xyz * _mtl_i._glesNormal.z)));
  float4 tmpvar_5 = 0;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _mtl_i._glesTANGENT.xyz;
  float3 tmpvar_6 = 0;
  tmpvar_6 = normalize((_mtl_u.unity_ObjectToWorld * tmpvar_5).xyz);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = _mtl_i._glesMultiTexCoord0.xy;
  _mtl_o.xlv_TEXCOORD1 = _mtl_i._glesMultiTexCoord1.xy;
  _mtl_o.xlv_TEXCOORD2 = _mtl_i._glesMultiTexCoord2.xy;
  _mtl_o.xlv_TEXCOORD3 = (_mtl_u.unity_ObjectToWorld * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD4 = tmpvar_4;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * _mtl_i._glesTANGENT.w));
  _mtl_o.xlv_TEXCOORD8 = float4(0.0, 0.0, 0.0, 0.0);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec2 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD3 = hlslcc_mtx4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD6.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DiffuseMapTransA_ST;
uniform 	vec4 _Diffusecolor;
uniform 	vec4 _NormalMap_ST;
uniform 	float _NormalIntensity;
uniform 	vec4 _SpecularMap_ST;
uniform 	vec4 _Speccolor;
uniform 	float _SpecIntensity;
uniform 	float _Gloss;
uniform 	float _Transparency;
uniform  sampler2D _NormalMap;
uniform  sampler2D _SpecularMap;
uniform  sampler2D _DiffuseMapTransA;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
in  vec4 vs_TEXCOORD8;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat5;
lowp vec4 u_xlat10_5;
vec3 u_xlat6;
lowp vec4 u_xlat10_6;
vec3 u_xlat7;
lowp vec4 u_xlat10_7;
vec3 u_xlat8;
bvec3 u_xlatb8;
vec3 u_xlat9;
bvec3 u_xlatb10;
vec3 u_xlat11;
float u_xlat15;
float u_xlat33;
float u_xlat34;
mediump float u_xlat16_34;
float u_xlat35;
mediump float u_xlat16_35;
bool u_xlatb35;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat0.x = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0u)) ? 1.0 : -1.0;
    u_xlat11.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat11.x = inversesqrt(u_xlat11.x);
    u_xlat11.xyz = u_xlat11.xxx * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat11.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_3 = texture(_NormalMap, u_xlat3.xy);
    u_xlat4.xy = u_xlat10_3.wy + u_xlat10_3.wy;
    u_xlat16_3.xy = u_xlat10_3.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_34 = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_34 = min(u_xlat16_34, 1.0);
    u_xlat16_34 = (-u_xlat16_34) + 1.0;
    u_xlat4.z = sqrt(u_xlat16_34);
    u_xlat3.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = vec3(_NormalIntensity) * u_xlat3.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat4.xyz = u_xlat3.yyy * vs_TEXCOORD6.xyz;
    u_xlat3.xyw = u_xlat3.xxx * vs_TEXCOORD5.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat3.zzz * u_xlat0.xyz + u_xlat3.xyw;
    u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat34);
    u_xlat0.x = dot((-u_xlat2.xyz), u_xlat3.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat3.xyz * (-u_xlat0.xxx) + (-u_xlat2.xyz);
    u_xlat34 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat2.xyz = vec3(u_xlat34) * _WorldSpaceLightPos0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat33) + u_xlat2.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = _Gloss * 10.0 + 1.0;
    u_xlat33 = exp2(u_xlat33);
    u_xlat34 = (-_Gloss) + 1.0;
    u_xlatb35 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb35){
        u_xlatb35 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD3.yyy * hlslcc_mtx4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD3.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD3.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb35)) ? u_xlat4.xyz : vs_TEXCOORD3.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat35 = u_xlat4.y * 0.25;
        u_xlat15 = unity_ProbeVolumeParams.z * 0.5;
        u_xlat5.x = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat35 = max(u_xlat35, u_xlat15);
        u_xlat4.x = min(u_xlat5.x, u_xlat35);
        u_xlat10_5 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
        u_xlat6.xyz = u_xlat4.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_6 = texture(unity_ProbeVolumeSH, u_xlat6.xyz);
        u_xlat4.xyz = u_xlat4.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_4 = texture(unity_ProbeVolumeSH, u_xlat4.xyz);
        u_xlat3.w = 1.0;
        u_xlat5.x = dot(u_xlat10_5, u_xlat3);
        u_xlat5.y = dot(u_xlat10_6, u_xlat3);
        u_xlat5.z = dot(u_xlat10_4, u_xlat3);
    } else {
        u_xlat3.w = 1.0;
        u_xlat5.x = dot(unity_SHAr, u_xlat3);
        u_xlat5.y = dot(unity_SHAg, u_xlat3);
        u_xlat5.z = dot(unity_SHAb, u_xlat3);
    //ENDIF
    }
    u_xlat4.xyz = u_xlat5.xyz + vs_TEXCOORD8.xyz;
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb35 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat5.xyz = log2(u_xlat4.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = (bool(u_xlatb35)) ? u_xlat5.xyz : u_xlat4.xyz;
    u_xlatb35 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb35){
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat5.xyz = u_xlat0.xyz * vec3(u_xlat35);
        u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
        u_xlat7.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
        u_xlat6.x = (u_xlatb8.x) ? u_xlat6.x : u_xlat7.x;
        u_xlat6.y = (u_xlatb8.y) ? u_xlat6.y : u_xlat7.y;
        u_xlat6.z = (u_xlatb8.z) ? u_xlat6.z : u_xlat7.z;
        u_xlat35 = min(u_xlat6.y, u_xlat6.x);
        u_xlat35 = min(u_xlat6.z, u_xlat35);
        u_xlat6.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat35) + u_xlat6.xyz;
    } else {
        u_xlat5.xyz = u_xlat0.xyz;
    //ENDIF
    }
    u_xlat35 = (-u_xlat34) * 0.699999988 + 1.70000005;
    u_xlat34 = u_xlat34 * u_xlat35;
    u_xlat34 = u_xlat34 * 6.0;
    u_xlat10_5 = textureLod(unity_SpecCube0, u_xlat5.xyz, u_xlat34);
    u_xlat16_35 = log2(u_xlat10_5.w);
    u_xlat35 = u_xlat16_35 * unity_SpecCube0_HDR.y;
    u_xlat35 = exp2(u_xlat35);
    u_xlat35 = u_xlat35 * unity_SpecCube0_HDR.x;
    u_xlat6.xyz = u_xlat10_5.xyz * vec3(u_xlat35);
    u_xlatb36 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb36){
        u_xlatb36 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb36){
            u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
            u_xlat36 = inversesqrt(u_xlat36);
            u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat36);
            u_xlat8.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
            u_xlat9.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
            u_xlat8.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
            u_xlat8.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
            u_xlat8.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
            u_xlat36 = min(u_xlat8.y, u_xlat8.x);
            u_xlat36 = min(u_xlat8.z, u_xlat36);
            u_xlat8.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat0.xyz = u_xlat7.xyz * vec3(u_xlat36) + u_xlat8.xyz;
        //ENDIF
        }
        u_xlat10_7 = textureLod(unity_SpecCube1, u_xlat0.xyz, u_xlat34);
        u_xlat16_0 = log2(u_xlat10_7.w);
        u_xlat0.x = u_xlat16_0 * unity_SpecCube1_HDR.y;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * unity_SpecCube1_HDR.x;
        u_xlat0.xyz = u_xlat10_7.xyz * u_xlat0.xxx;
        u_xlat5.xyz = vec3(u_xlat35) * u_xlat10_5.xyz + (-u_xlat0.xyz);
        u_xlat6.xyz = unity_SpecCube0_BoxMin.www * u_xlat5.xyz + u_xlat0.xyz;
    //ENDIF
    }
    u_xlat0.xy = vs_TEXCOORD0.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
    u_xlat10_5 = texture(_SpecularMap, u_xlat0.xy);
    u_xlat0.xyz = u_xlat10_5.xyz * vec3(_SpecIntensity);
    u_xlat0.xyz = u_xlat0.xyz * _Speccolor.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat33 = u_xlat33 * u_xlat1.x;
    u_xlat33 = exp2(u_xlat33);
    u_xlat1.xyz = u_xlat0.xyz * u_xlat6.xyz;
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat33 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat33 = max(u_xlat33, 0.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _DiffuseMapTransA_ST.xy + _DiffuseMapTransA_ST.zw;
    u_xlat10_1 = texture(_DiffuseMapTransA, u_xlat1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * _Diffusecolor.xyz;
    u_xlat2.xyz = vec3(u_xlat33) * _LightColor0.xyz + u_xlat4.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_1.w * _Transparency;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 122 math, 8 textures, 14 branches
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"#version 120

#ifdef VERTEX

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
attribute vec4 TANGENT;
varying vec2 xlv_TEXCOORD0;
varying vec2 xlv_TEXCOORD1;
varying vec2 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec4 xlv_TEXCOORD8;
void main ()
{
  vec4 v_1;
  v_1.x = unity_WorldToObject[0].x;
  v_1.y = unity_WorldToObject[1].x;
  v_1.z = unity_WorldToObject[2].x;
  v_1.w = unity_WorldToObject[3].x;
  vec4 v_2;
  v_2.x = unity_WorldToObject[0].y;
  v_2.y = unity_WorldToObject[1].y;
  v_2.z = unity_WorldToObject[2].y;
  v_2.w = unity_WorldToObject[3].y;
  vec4 v_3;
  v_3.x = unity_WorldToObject[0].z;
  v_3.y = unity_WorldToObject[1].z;
  v_3.z = unity_WorldToObject[2].z;
  v_3.w = unity_WorldToObject[3].z;
  vec3 tmpvar_4;
  tmpvar_4 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = TANGENT.xyz;
  vec3 tmpvar_6;
  tmpvar_6 = normalize((unity_ObjectToWorld * tmpvar_5).xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = gl_MultiTexCoord0.xy;
  xlv_TEXCOORD1 = gl_MultiTexCoord1.xy;
  xlv_TEXCOORD2 = gl_MultiTexCoord2.xy;
  xlv_TEXCOORD3 = (unity_ObjectToWorld * gl_Vertex);
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * TANGENT.w));
  xlv_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform samplerCube unity_SpecCube0;
uniform samplerCube unity_SpecCube1;
uniform vec4 unity_SpecCube0_BoxMax;
uniform vec4 unity_SpecCube0_BoxMin;
uniform vec4 unity_SpecCube0_ProbePosition;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_SpecCube1_BoxMax;
uniform vec4 unity_SpecCube1_BoxMin;
uniform vec4 unity_SpecCube1_ProbePosition;
uniform vec4 unity_SpecCube1_HDR;
uniform sampler3D unity_ProbeVolumeSH;
uniform vec4 unity_ProbeVolumeParams;
uniform mat4 unity_ProbeVolumeWorldToObject;
uniform vec3 unity_ProbeVolumeSizeInv;
uniform vec3 unity_ProbeVolumeMin;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _LightColor0;
uniform sampler2D _DiffuseMapTransA;
uniform vec4 _DiffuseMapTransA_ST;
uniform vec4 _Diffusecolor;
uniform sampler2D _NormalMap;
uniform vec4 _NormalMap_ST;
uniform float _NormalIntensity;
uniform sampler2D _SpecularMap;
uniform vec4 _SpecularMap_ST;
uniform vec4 _Speccolor;
uniform float _SpecIntensity;
uniform float _Gloss;
uniform float _Transparency;
varying vec2 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec4 xlv_TEXCOORD8;
void main ()
{
  float tmpvar_1;
  if (gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD4;
  float tmpvar_3;
  vec3 tmpvar_4;
  int tmpvar_5;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_5 = 1;
  } else {
    tmpvar_5 = -1;
  };
  tmpvar_2 = (normalize(xlv_TEXCOORD4) * float(tmpvar_5));
  mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD5.x;
  tmpvar_6[0].y = xlv_TEXCOORD6.x;
  tmpvar_6[0].z = tmpvar_2.x;
  tmpvar_6[1].x = xlv_TEXCOORD5.y;
  tmpvar_6[1].y = xlv_TEXCOORD6.y;
  tmpvar_6[1].z = tmpvar_2.y;
  tmpvar_6[2].x = xlv_TEXCOORD5.z;
  tmpvar_6[2].y = xlv_TEXCOORD6.z;
  tmpvar_6[2].z = tmpvar_2.z;
  vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3.xyz));
  vec3 normal_8;
  normal_8.xy = ((texture2D (_NormalMap, (
    (xlv_TEXCOORD0 * _NormalMap_ST.xy)
   + _NormalMap_ST.zw)).wy * 2.0) - 1.0);
  normal_8.z = sqrt((1.0 - clamp (
    dot (normal_8.xy, normal_8.xy)
  , 0.0, 1.0)));
  vec3 tmpvar_9;
  tmpvar_9 = normalize((mix (vec3(0.0, 0.0, 1.0), normal_8, vec3(_NormalIntensity)) * tmpvar_6));
  vec3 tmpvar_10;
  vec3 I_11;
  I_11 = -(tmpvar_7);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_7 + tmpvar_12));
  float tmpvar_14;
  tmpvar_14 = exp2(((_Gloss * 10.0) + 1.0));
  tmpvar_4 = xlv_TEXCOORD3.xyz;
  tmpvar_3 = (1.0 - _Gloss);
  vec3 ambient_15;
  ambient_15 = xlv_TEXCOORD8.xyz;
  vec3 ambient_contrib_16;
  ambient_contrib_16 = vec3(0.0, 0.0, 0.0);
  if ((unity_ProbeVolumeParams.x == 1.0)) {
    vec4 tmpvar_17;
    tmpvar_17.w = 1.0;
    tmpvar_17.xyz = tmpvar_9;
    vec3 x1_18;
    vec3 texCoord_19;
    vec3 tmpvar_20;
    if ((unity_ProbeVolumeParams.y == 1.0)) {
      vec4 tmpvar_21;
      tmpvar_21.w = 1.0;
      tmpvar_21.xyz = tmpvar_4;
      tmpvar_20 = (unity_ProbeVolumeWorldToObject * tmpvar_21).xyz;
    } else {
      tmpvar_20 = tmpvar_4;
    };
    vec3 tmpvar_22;
    tmpvar_22 = ((tmpvar_20 - unity_ProbeVolumeMin) * unity_ProbeVolumeSizeInv);
    texCoord_19.yz = tmpvar_22.yz;
    texCoord_19.x = (tmpvar_22.x * 0.25);
    float tmpvar_23;
    float tmpvar_24;
    tmpvar_24 = (0.5 * unity_ProbeVolumeParams.z);
    tmpvar_23 = clamp (texCoord_19.x, tmpvar_24, (0.25 - tmpvar_24));
    texCoord_19.x = tmpvar_23;
    vec4 tmpvar_25;
    tmpvar_25 = texture3D (unity_ProbeVolumeSH, texCoord_19);
    texCoord_19.x = (tmpvar_23 + 0.25);
    vec4 tmpvar_26;
    tmpvar_26 = texture3D (unity_ProbeVolumeSH, texCoord_19);
    texCoord_19.x = (tmpvar_23 + 0.5);
    x1_18.x = dot (tmpvar_25, tmpvar_17);
    x1_18.y = dot (tmpvar_26, tmpvar_17);
    x1_18.z = dot (texture3D (unity_ProbeVolumeSH, texCoord_19), tmpvar_17);
    ambient_contrib_16 = x1_18;
  } else {
    vec4 tmpvar_27;
    tmpvar_27.w = 1.0;
    tmpvar_27.xyz = tmpvar_9;
    vec3 x_28;
    x_28.x = dot (unity_SHAr, tmpvar_27);
    x_28.y = dot (unity_SHAg, tmpvar_27);
    x_28.z = dot (unity_SHAb, tmpvar_27);
    ambient_contrib_16 = x_28;
  };
  vec3 tmpvar_29;
  tmpvar_29 = max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD8.xyz + ambient_contrib_16));
  ambient_15 = tmpvar_29;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_15 = max (((1.055 * 
      pow (max (tmpvar_29, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0));
  };
  vec3 specular_30;
  vec3 worldRefl_31;
  worldRefl_31 = tmpvar_10;
  vec3 worldPos_32;
  worldPos_32 = tmpvar_4;
  if ((unity_SpecCube0_ProbePosition.w > 0.0)) {
    vec3 tmpvar_33;
    tmpvar_33 = normalize(tmpvar_10);
    vec3 tmpvar_34;
    tmpvar_34 = ((unity_SpecCube0_BoxMax.xyz - xlv_TEXCOORD3.xyz) / tmpvar_33);
    vec3 tmpvar_35;
    tmpvar_35 = ((unity_SpecCube0_BoxMin.xyz - xlv_TEXCOORD3.xyz) / tmpvar_33);
    bvec3 tmpvar_36;
    tmpvar_36 = greaterThan (tmpvar_33, vec3(0.0, 0.0, 0.0));
    float tmpvar_37;
    if (tmpvar_36.x) {
      tmpvar_37 = tmpvar_34.x;
    } else {
      tmpvar_37 = tmpvar_35.x;
    };
    float tmpvar_38;
    if (tmpvar_36.y) {
      tmpvar_38 = tmpvar_34.y;
    } else {
      tmpvar_38 = tmpvar_35.y;
    };
    float tmpvar_39;
    if (tmpvar_36.z) {
      tmpvar_39 = tmpvar_34.z;
    } else {
      tmpvar_39 = tmpvar_35.z;
    };
    worldPos_32 = (xlv_TEXCOORD3.xyz - unity_SpecCube0_ProbePosition.xyz);
    worldRefl_31 = (worldPos_32 + (tmpvar_33 * min (
      min (tmpvar_37, tmpvar_38)
    , tmpvar_39)));
  };
  vec4 tmpvar_40;
  tmpvar_40.xyz = worldRefl_31;
  tmpvar_40.w = ((tmpvar_3 * (1.7 - 
    (0.7 * tmpvar_3)
  )) * 6.0);
  vec4 tmpvar_41;
  tmpvar_41 = textureCubeLod (unity_SpecCube0, worldRefl_31, tmpvar_40.w);
  vec3 tmpvar_42;
  tmpvar_42 = ((unity_SpecCube0_HDR.x * pow (tmpvar_41.w, unity_SpecCube0_HDR.y)) * tmpvar_41.xyz);
  if ((unity_SpecCube0_BoxMin.w < 0.99999)) {
    vec3 worldRefl_43;
    worldRefl_43 = tmpvar_10;
    vec3 worldPos_44;
    worldPos_44 = tmpvar_4;
    if ((unity_SpecCube1_ProbePosition.w > 0.0)) {
      vec3 tmpvar_45;
      tmpvar_45 = normalize(tmpvar_10);
      vec3 tmpvar_46;
      tmpvar_46 = ((unity_SpecCube1_BoxMax.xyz - xlv_TEXCOORD3.xyz) / tmpvar_45);
      vec3 tmpvar_47;
      tmpvar_47 = ((unity_SpecCube1_BoxMin.xyz - xlv_TEXCOORD3.xyz) / tmpvar_45);
      bvec3 tmpvar_48;
      tmpvar_48 = greaterThan (tmpvar_45, vec3(0.0, 0.0, 0.0));
      float tmpvar_49;
      if (tmpvar_48.x) {
        tmpvar_49 = tmpvar_46.x;
      } else {
        tmpvar_49 = tmpvar_47.x;
      };
      float tmpvar_50;
      if (tmpvar_48.y) {
        tmpvar_50 = tmpvar_46.y;
      } else {
        tmpvar_50 = tmpvar_47.y;
      };
      float tmpvar_51;
      if (tmpvar_48.z) {
        tmpvar_51 = tmpvar_46.z;
      } else {
        tmpvar_51 = tmpvar_47.z;
      };
      worldPos_44 = (xlv_TEXCOORD3.xyz - unity_SpecCube1_ProbePosition.xyz);
      worldRefl_43 = (worldPos_44 + (tmpvar_45 * min (
        min (tmpvar_49, tmpvar_50)
      , tmpvar_51)));
    };
    vec4 tmpvar_52;
    tmpvar_52.xyz = worldRefl_43;
    tmpvar_52.w = ((tmpvar_3 * (1.7 - 
      (0.7 * tmpvar_3)
    )) * 6.0);
    vec4 tmpvar_53;
    tmpvar_53 = textureCubeLod (unity_SpecCube1, worldRefl_43, tmpvar_52.w);
    specular_30 = mix (((unity_SpecCube1_HDR.x * 
      pow (tmpvar_53.w, unity_SpecCube1_HDR.y)
    ) * tmpvar_53.xyz), tmpvar_42, unity_SpecCube0_BoxMin.www);
  } else {
    specular_30 = tmpvar_42;
  };
  vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_SpecularMap, (
    (xlv_TEXCOORD0 * _SpecularMap_ST.xy)
   + _SpecularMap_ST.zw)).xyz * _SpecIntensity) * _Speccolor.xyz);
  vec4 tmpvar_55;
  tmpvar_55 = texture2D (_DiffuseMapTransA, ((xlv_TEXCOORD0 * _DiffuseMapTransA_ST.xy) + _DiffuseMapTransA_ST.zw));
  vec4 tmpvar_56;
  tmpvar_56.xyz = (((
    (max (0.0, dot (tmpvar_9, tmpvar_12)) * _LightColor0.xyz)
   + ambient_15) * (tmpvar_55.xyz * _Diffusecolor.xyz)) + ((
    pow (max (0.0, dot (tmpvar_13, tmpvar_9)), tmpvar_14)
   * tmpvar_54) + (specular_30 * tmpvar_54)));
  tmpvar_56.w = (tmpvar_55.w * _Transparency);
  gl_FragData[0] = tmpvar_56;
}


#endif
"
}
SubProgram "metal " {
// Stats: 17 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
Bind "texcoord2" ATTR5
ConstBuffer "$Globals" 192
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [unity_ObjectToWorld]
Matrix 128 [unity_WorldToObject]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
  float4 _glesMultiTexCoord2 [[attribute(5)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float4 xlv_TEXCOORD8;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4x4 unity_ObjectToWorld;
  float4x4 unity_WorldToObject;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 v_1 = 0;
  v_1.x = _mtl_u.unity_WorldToObject[0].x;
  v_1.y = _mtl_u.unity_WorldToObject[1].x;
  v_1.z = _mtl_u.unity_WorldToObject[2].x;
  v_1.w = _mtl_u.unity_WorldToObject[3].x;
  float4 v_2 = 0;
  v_2.x = _mtl_u.unity_WorldToObject[0].y;
  v_2.y = _mtl_u.unity_WorldToObject[1].y;
  v_2.z = _mtl_u.unity_WorldToObject[2].y;
  v_2.w = _mtl_u.unity_WorldToObject[3].y;
  float4 v_3 = 0;
  v_3.x = _mtl_u.unity_WorldToObject[0].z;
  v_3.y = _mtl_u.unity_WorldToObject[1].z;
  v_3.z = _mtl_u.unity_WorldToObject[2].z;
  v_3.w = _mtl_u.unity_WorldToObject[3].z;
  float3 tmpvar_4 = 0;
  tmpvar_4 = normalize(((
    (v_1.xyz * _mtl_i._glesNormal.x)
   + 
    (v_2.xyz * _mtl_i._glesNormal.y)
  ) + (v_3.xyz * _mtl_i._glesNormal.z)));
  float4 tmpvar_5 = 0;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _mtl_i._glesTANGENT.xyz;
  float3 tmpvar_6 = 0;
  tmpvar_6 = normalize((_mtl_u.unity_ObjectToWorld * tmpvar_5).xyz);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = _mtl_i._glesMultiTexCoord0.xy;
  _mtl_o.xlv_TEXCOORD1 = _mtl_i._glesMultiTexCoord1.xy;
  _mtl_o.xlv_TEXCOORD2 = _mtl_i._glesMultiTexCoord2.xy;
  _mtl_o.xlv_TEXCOORD3 = (_mtl_u.unity_ObjectToWorld * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD4 = tmpvar_4;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * _mtl_i._glesTANGENT.w));
  _mtl_o.xlv_TEXCOORD8 = float4(0.0, 0.0, 0.0, 0.0);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec2 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD3 = hlslcc_mtx4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD6.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DiffuseMapTransA_ST;
uniform 	vec4 _Diffusecolor;
uniform 	vec4 _NormalMap_ST;
uniform 	float _NormalIntensity;
uniform 	vec4 _SpecularMap_ST;
uniform 	vec4 _Speccolor;
uniform 	float _SpecIntensity;
uniform 	float _Gloss;
uniform 	float _Transparency;
uniform  sampler2D _NormalMap;
uniform  sampler2D _SpecularMap;
uniform  sampler2D _DiffuseMapTransA;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
in  vec4 vs_TEXCOORD8;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat5;
lowp vec4 u_xlat10_5;
vec3 u_xlat6;
lowp vec4 u_xlat10_6;
vec3 u_xlat7;
lowp vec4 u_xlat10_7;
vec3 u_xlat8;
bvec3 u_xlatb8;
vec3 u_xlat9;
bvec3 u_xlatb10;
vec3 u_xlat11;
float u_xlat15;
float u_xlat33;
float u_xlat34;
mediump float u_xlat16_34;
float u_xlat35;
mediump float u_xlat16_35;
bool u_xlatb35;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat0.x = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0u)) ? 1.0 : -1.0;
    u_xlat11.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat11.x = inversesqrt(u_xlat11.x);
    u_xlat11.xyz = u_xlat11.xxx * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat11.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_3 = texture(_NormalMap, u_xlat3.xy);
    u_xlat4.xy = u_xlat10_3.wy + u_xlat10_3.wy;
    u_xlat16_3.xy = u_xlat10_3.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_34 = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_34 = min(u_xlat16_34, 1.0);
    u_xlat16_34 = (-u_xlat16_34) + 1.0;
    u_xlat4.z = sqrt(u_xlat16_34);
    u_xlat3.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = vec3(_NormalIntensity) * u_xlat3.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat4.xyz = u_xlat3.yyy * vs_TEXCOORD6.xyz;
    u_xlat3.xyw = u_xlat3.xxx * vs_TEXCOORD5.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat3.zzz * u_xlat0.xyz + u_xlat3.xyw;
    u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat34);
    u_xlat0.x = dot((-u_xlat2.xyz), u_xlat3.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat3.xyz * (-u_xlat0.xxx) + (-u_xlat2.xyz);
    u_xlat34 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat2.xyz = vec3(u_xlat34) * _WorldSpaceLightPos0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat33) + u_xlat2.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = _Gloss * 10.0 + 1.0;
    u_xlat33 = exp2(u_xlat33);
    u_xlat34 = (-_Gloss) + 1.0;
    u_xlatb35 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb35){
        u_xlatb35 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD3.yyy * hlslcc_mtx4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD3.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD3.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb35)) ? u_xlat4.xyz : vs_TEXCOORD3.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat35 = u_xlat4.y * 0.25;
        u_xlat15 = unity_ProbeVolumeParams.z * 0.5;
        u_xlat5.x = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat35 = max(u_xlat35, u_xlat15);
        u_xlat4.x = min(u_xlat5.x, u_xlat35);
        u_xlat10_5 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
        u_xlat6.xyz = u_xlat4.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_6 = texture(unity_ProbeVolumeSH, u_xlat6.xyz);
        u_xlat4.xyz = u_xlat4.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_4 = texture(unity_ProbeVolumeSH, u_xlat4.xyz);
        u_xlat3.w = 1.0;
        u_xlat5.x = dot(u_xlat10_5, u_xlat3);
        u_xlat5.y = dot(u_xlat10_6, u_xlat3);
        u_xlat5.z = dot(u_xlat10_4, u_xlat3);
    } else {
        u_xlat3.w = 1.0;
        u_xlat5.x = dot(unity_SHAr, u_xlat3);
        u_xlat5.y = dot(unity_SHAg, u_xlat3);
        u_xlat5.z = dot(unity_SHAb, u_xlat3);
    //ENDIF
    }
    u_xlat4.xyz = u_xlat5.xyz + vs_TEXCOORD8.xyz;
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb35 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat5.xyz = log2(u_xlat4.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = (bool(u_xlatb35)) ? u_xlat5.xyz : u_xlat4.xyz;
    u_xlatb35 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb35){
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat5.xyz = u_xlat0.xyz * vec3(u_xlat35);
        u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
        u_xlat7.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
        u_xlat6.x = (u_xlatb8.x) ? u_xlat6.x : u_xlat7.x;
        u_xlat6.y = (u_xlatb8.y) ? u_xlat6.y : u_xlat7.y;
        u_xlat6.z = (u_xlatb8.z) ? u_xlat6.z : u_xlat7.z;
        u_xlat35 = min(u_xlat6.y, u_xlat6.x);
        u_xlat35 = min(u_xlat6.z, u_xlat35);
        u_xlat6.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat35) + u_xlat6.xyz;
    } else {
        u_xlat5.xyz = u_xlat0.xyz;
    //ENDIF
    }
    u_xlat35 = (-u_xlat34) * 0.699999988 + 1.70000005;
    u_xlat34 = u_xlat34 * u_xlat35;
    u_xlat34 = u_xlat34 * 6.0;
    u_xlat10_5 = textureLod(unity_SpecCube0, u_xlat5.xyz, u_xlat34);
    u_xlat16_35 = log2(u_xlat10_5.w);
    u_xlat35 = u_xlat16_35 * unity_SpecCube0_HDR.y;
    u_xlat35 = exp2(u_xlat35);
    u_xlat35 = u_xlat35 * unity_SpecCube0_HDR.x;
    u_xlat6.xyz = u_xlat10_5.xyz * vec3(u_xlat35);
    u_xlatb36 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb36){
        u_xlatb36 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb36){
            u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
            u_xlat36 = inversesqrt(u_xlat36);
            u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat36);
            u_xlat8.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
            u_xlat9.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
            u_xlat8.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
            u_xlat8.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
            u_xlat8.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
            u_xlat36 = min(u_xlat8.y, u_xlat8.x);
            u_xlat36 = min(u_xlat8.z, u_xlat36);
            u_xlat8.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat0.xyz = u_xlat7.xyz * vec3(u_xlat36) + u_xlat8.xyz;
        //ENDIF
        }
        u_xlat10_7 = textureLod(unity_SpecCube1, u_xlat0.xyz, u_xlat34);
        u_xlat16_0 = log2(u_xlat10_7.w);
        u_xlat0.x = u_xlat16_0 * unity_SpecCube1_HDR.y;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * unity_SpecCube1_HDR.x;
        u_xlat0.xyz = u_xlat10_7.xyz * u_xlat0.xxx;
        u_xlat5.xyz = vec3(u_xlat35) * u_xlat10_5.xyz + (-u_xlat0.xyz);
        u_xlat6.xyz = unity_SpecCube0_BoxMin.www * u_xlat5.xyz + u_xlat0.xyz;
    //ENDIF
    }
    u_xlat0.xy = vs_TEXCOORD0.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
    u_xlat10_5 = texture(_SpecularMap, u_xlat0.xy);
    u_xlat0.xyz = u_xlat10_5.xyz * vec3(_SpecIntensity);
    u_xlat0.xyz = u_xlat0.xyz * _Speccolor.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat33 = u_xlat33 * u_xlat1.x;
    u_xlat33 = exp2(u_xlat33);
    u_xlat1.xyz = u_xlat0.xyz * u_xlat6.xyz;
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat33 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat33 = max(u_xlat33, 0.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _DiffuseMapTransA_ST.xy + _DiffuseMapTransA_ST.zw;
    u_xlat10_1 = texture(_DiffuseMapTransA, u_xlat1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * _Diffusecolor.xyz;
    u_xlat2.xyz = vec3(u_xlat33) * _LightColor0.xyz + u_xlat4.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_1.w * _Transparency;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 122 math, 8 textures, 14 branches
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "DIRLIGHTMAP_OFF" }
"#version 120

#ifdef VERTEX

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
attribute vec4 TANGENT;
varying vec2 xlv_TEXCOORD0;
varying vec2 xlv_TEXCOORD1;
varying vec2 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec4 xlv_TEXCOORD8;
void main ()
{
  vec4 v_1;
  v_1.x = unity_WorldToObject[0].x;
  v_1.y = unity_WorldToObject[1].x;
  v_1.z = unity_WorldToObject[2].x;
  v_1.w = unity_WorldToObject[3].x;
  vec4 v_2;
  v_2.x = unity_WorldToObject[0].y;
  v_2.y = unity_WorldToObject[1].y;
  v_2.z = unity_WorldToObject[2].y;
  v_2.w = unity_WorldToObject[3].y;
  vec4 v_3;
  v_3.x = unity_WorldToObject[0].z;
  v_3.y = unity_WorldToObject[1].z;
  v_3.z = unity_WorldToObject[2].z;
  v_3.w = unity_WorldToObject[3].z;
  vec3 tmpvar_4;
  tmpvar_4 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = TANGENT.xyz;
  vec3 tmpvar_6;
  tmpvar_6 = normalize((unity_ObjectToWorld * tmpvar_5).xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = gl_MultiTexCoord0.xy;
  xlv_TEXCOORD1 = gl_MultiTexCoord1.xy;
  xlv_TEXCOORD2 = gl_MultiTexCoord2.xy;
  xlv_TEXCOORD3 = (unity_ObjectToWorld * gl_Vertex);
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * TANGENT.w));
  xlv_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform samplerCube unity_SpecCube0;
uniform samplerCube unity_SpecCube1;
uniform vec4 unity_SpecCube0_BoxMax;
uniform vec4 unity_SpecCube0_BoxMin;
uniform vec4 unity_SpecCube0_ProbePosition;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_SpecCube1_BoxMax;
uniform vec4 unity_SpecCube1_BoxMin;
uniform vec4 unity_SpecCube1_ProbePosition;
uniform vec4 unity_SpecCube1_HDR;
uniform sampler3D unity_ProbeVolumeSH;
uniform vec4 unity_ProbeVolumeParams;
uniform mat4 unity_ProbeVolumeWorldToObject;
uniform vec3 unity_ProbeVolumeSizeInv;
uniform vec3 unity_ProbeVolumeMin;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _LightColor0;
uniform sampler2D _DiffuseMapTransA;
uniform vec4 _DiffuseMapTransA_ST;
uniform vec4 _Diffusecolor;
uniform sampler2D _NormalMap;
uniform vec4 _NormalMap_ST;
uniform float _NormalIntensity;
uniform sampler2D _SpecularMap;
uniform vec4 _SpecularMap_ST;
uniform vec4 _Speccolor;
uniform float _SpecIntensity;
uniform float _Gloss;
uniform float _Transparency;
varying vec2 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec4 xlv_TEXCOORD8;
void main ()
{
  float tmpvar_1;
  if (gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD4;
  float tmpvar_3;
  vec3 tmpvar_4;
  int tmpvar_5;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_5 = 1;
  } else {
    tmpvar_5 = -1;
  };
  tmpvar_2 = (normalize(xlv_TEXCOORD4) * float(tmpvar_5));
  mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD5.x;
  tmpvar_6[0].y = xlv_TEXCOORD6.x;
  tmpvar_6[0].z = tmpvar_2.x;
  tmpvar_6[1].x = xlv_TEXCOORD5.y;
  tmpvar_6[1].y = xlv_TEXCOORD6.y;
  tmpvar_6[1].z = tmpvar_2.y;
  tmpvar_6[2].x = xlv_TEXCOORD5.z;
  tmpvar_6[2].y = xlv_TEXCOORD6.z;
  tmpvar_6[2].z = tmpvar_2.z;
  vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3.xyz));
  vec3 normal_8;
  normal_8.xy = ((texture2D (_NormalMap, (
    (xlv_TEXCOORD0 * _NormalMap_ST.xy)
   + _NormalMap_ST.zw)).wy * 2.0) - 1.0);
  normal_8.z = sqrt((1.0 - clamp (
    dot (normal_8.xy, normal_8.xy)
  , 0.0, 1.0)));
  vec3 tmpvar_9;
  tmpvar_9 = normalize((mix (vec3(0.0, 0.0, 1.0), normal_8, vec3(_NormalIntensity)) * tmpvar_6));
  vec3 tmpvar_10;
  vec3 I_11;
  I_11 = -(tmpvar_7);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_7 + tmpvar_12));
  float tmpvar_14;
  tmpvar_14 = exp2(((_Gloss * 10.0) + 1.0));
  tmpvar_4 = xlv_TEXCOORD3.xyz;
  tmpvar_3 = (1.0 - _Gloss);
  vec3 ambient_15;
  ambient_15 = xlv_TEXCOORD8.xyz;
  vec3 ambient_contrib_16;
  ambient_contrib_16 = vec3(0.0, 0.0, 0.0);
  if ((unity_ProbeVolumeParams.x == 1.0)) {
    vec4 tmpvar_17;
    tmpvar_17.w = 1.0;
    tmpvar_17.xyz = tmpvar_9;
    vec3 x1_18;
    vec3 texCoord_19;
    vec3 tmpvar_20;
    if ((unity_ProbeVolumeParams.y == 1.0)) {
      vec4 tmpvar_21;
      tmpvar_21.w = 1.0;
      tmpvar_21.xyz = tmpvar_4;
      tmpvar_20 = (unity_ProbeVolumeWorldToObject * tmpvar_21).xyz;
    } else {
      tmpvar_20 = tmpvar_4;
    };
    vec3 tmpvar_22;
    tmpvar_22 = ((tmpvar_20 - unity_ProbeVolumeMin) * unity_ProbeVolumeSizeInv);
    texCoord_19.yz = tmpvar_22.yz;
    texCoord_19.x = (tmpvar_22.x * 0.25);
    float tmpvar_23;
    float tmpvar_24;
    tmpvar_24 = (0.5 * unity_ProbeVolumeParams.z);
    tmpvar_23 = clamp (texCoord_19.x, tmpvar_24, (0.25 - tmpvar_24));
    texCoord_19.x = tmpvar_23;
    vec4 tmpvar_25;
    tmpvar_25 = texture3D (unity_ProbeVolumeSH, texCoord_19);
    texCoord_19.x = (tmpvar_23 + 0.25);
    vec4 tmpvar_26;
    tmpvar_26 = texture3D (unity_ProbeVolumeSH, texCoord_19);
    texCoord_19.x = (tmpvar_23 + 0.5);
    x1_18.x = dot (tmpvar_25, tmpvar_17);
    x1_18.y = dot (tmpvar_26, tmpvar_17);
    x1_18.z = dot (texture3D (unity_ProbeVolumeSH, texCoord_19), tmpvar_17);
    ambient_contrib_16 = x1_18;
  } else {
    vec4 tmpvar_27;
    tmpvar_27.w = 1.0;
    tmpvar_27.xyz = tmpvar_9;
    vec3 x_28;
    x_28.x = dot (unity_SHAr, tmpvar_27);
    x_28.y = dot (unity_SHAg, tmpvar_27);
    x_28.z = dot (unity_SHAb, tmpvar_27);
    ambient_contrib_16 = x_28;
  };
  vec3 tmpvar_29;
  tmpvar_29 = max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD8.xyz + ambient_contrib_16));
  ambient_15 = tmpvar_29;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_15 = max (((1.055 * 
      pow (max (tmpvar_29, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0));
  };
  vec3 specular_30;
  vec3 worldRefl_31;
  worldRefl_31 = tmpvar_10;
  vec3 worldPos_32;
  worldPos_32 = tmpvar_4;
  if ((unity_SpecCube0_ProbePosition.w > 0.0)) {
    vec3 tmpvar_33;
    tmpvar_33 = normalize(tmpvar_10);
    vec3 tmpvar_34;
    tmpvar_34 = ((unity_SpecCube0_BoxMax.xyz - xlv_TEXCOORD3.xyz) / tmpvar_33);
    vec3 tmpvar_35;
    tmpvar_35 = ((unity_SpecCube0_BoxMin.xyz - xlv_TEXCOORD3.xyz) / tmpvar_33);
    bvec3 tmpvar_36;
    tmpvar_36 = greaterThan (tmpvar_33, vec3(0.0, 0.0, 0.0));
    float tmpvar_37;
    if (tmpvar_36.x) {
      tmpvar_37 = tmpvar_34.x;
    } else {
      tmpvar_37 = tmpvar_35.x;
    };
    float tmpvar_38;
    if (tmpvar_36.y) {
      tmpvar_38 = tmpvar_34.y;
    } else {
      tmpvar_38 = tmpvar_35.y;
    };
    float tmpvar_39;
    if (tmpvar_36.z) {
      tmpvar_39 = tmpvar_34.z;
    } else {
      tmpvar_39 = tmpvar_35.z;
    };
    worldPos_32 = (xlv_TEXCOORD3.xyz - unity_SpecCube0_ProbePosition.xyz);
    worldRefl_31 = (worldPos_32 + (tmpvar_33 * min (
      min (tmpvar_37, tmpvar_38)
    , tmpvar_39)));
  };
  vec4 tmpvar_40;
  tmpvar_40.xyz = worldRefl_31;
  tmpvar_40.w = ((tmpvar_3 * (1.7 - 
    (0.7 * tmpvar_3)
  )) * 6.0);
  vec4 tmpvar_41;
  tmpvar_41 = textureCubeLod (unity_SpecCube0, worldRefl_31, tmpvar_40.w);
  vec3 tmpvar_42;
  tmpvar_42 = ((unity_SpecCube0_HDR.x * pow (tmpvar_41.w, unity_SpecCube0_HDR.y)) * tmpvar_41.xyz);
  if ((unity_SpecCube0_BoxMin.w < 0.99999)) {
    vec3 worldRefl_43;
    worldRefl_43 = tmpvar_10;
    vec3 worldPos_44;
    worldPos_44 = tmpvar_4;
    if ((unity_SpecCube1_ProbePosition.w > 0.0)) {
      vec3 tmpvar_45;
      tmpvar_45 = normalize(tmpvar_10);
      vec3 tmpvar_46;
      tmpvar_46 = ((unity_SpecCube1_BoxMax.xyz - xlv_TEXCOORD3.xyz) / tmpvar_45);
      vec3 tmpvar_47;
      tmpvar_47 = ((unity_SpecCube1_BoxMin.xyz - xlv_TEXCOORD3.xyz) / tmpvar_45);
      bvec3 tmpvar_48;
      tmpvar_48 = greaterThan (tmpvar_45, vec3(0.0, 0.0, 0.0));
      float tmpvar_49;
      if (tmpvar_48.x) {
        tmpvar_49 = tmpvar_46.x;
      } else {
        tmpvar_49 = tmpvar_47.x;
      };
      float tmpvar_50;
      if (tmpvar_48.y) {
        tmpvar_50 = tmpvar_46.y;
      } else {
        tmpvar_50 = tmpvar_47.y;
      };
      float tmpvar_51;
      if (tmpvar_48.z) {
        tmpvar_51 = tmpvar_46.z;
      } else {
        tmpvar_51 = tmpvar_47.z;
      };
      worldPos_44 = (xlv_TEXCOORD3.xyz - unity_SpecCube1_ProbePosition.xyz);
      worldRefl_43 = (worldPos_44 + (tmpvar_45 * min (
        min (tmpvar_49, tmpvar_50)
      , tmpvar_51)));
    };
    vec4 tmpvar_52;
    tmpvar_52.xyz = worldRefl_43;
    tmpvar_52.w = ((tmpvar_3 * (1.7 - 
      (0.7 * tmpvar_3)
    )) * 6.0);
    vec4 tmpvar_53;
    tmpvar_53 = textureCubeLod (unity_SpecCube1, worldRefl_43, tmpvar_52.w);
    specular_30 = mix (((unity_SpecCube1_HDR.x * 
      pow (tmpvar_53.w, unity_SpecCube1_HDR.y)
    ) * tmpvar_53.xyz), tmpvar_42, unity_SpecCube0_BoxMin.www);
  } else {
    specular_30 = tmpvar_42;
  };
  vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_SpecularMap, (
    (xlv_TEXCOORD0 * _SpecularMap_ST.xy)
   + _SpecularMap_ST.zw)).xyz * _SpecIntensity) * _Speccolor.xyz);
  vec4 tmpvar_55;
  tmpvar_55 = texture2D (_DiffuseMapTransA, ((xlv_TEXCOORD0 * _DiffuseMapTransA_ST.xy) + _DiffuseMapTransA_ST.zw));
  vec4 tmpvar_56;
  tmpvar_56.xyz = (((
    (max (0.0, dot (tmpvar_9, tmpvar_12)) * _LightColor0.xyz)
   + ambient_15) * (tmpvar_55.xyz * _Diffusecolor.xyz)) + ((
    pow (max (0.0, dot (tmpvar_13, tmpvar_9)), tmpvar_14)
   * tmpvar_54) + (specular_30 * tmpvar_54)));
  tmpvar_56.w = (tmpvar_55.w * _Transparency);
  gl_FragData[0] = tmpvar_56;
}


#endif
"
}
SubProgram "metal " {
// Stats: 17 math
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "DIRLIGHTMAP_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
Bind "texcoord2" ATTR5
ConstBuffer "$Globals" 192
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [unity_ObjectToWorld]
Matrix 128 [unity_WorldToObject]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
  float4 _glesMultiTexCoord2 [[attribute(5)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float4 xlv_TEXCOORD8;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4x4 unity_ObjectToWorld;
  float4x4 unity_WorldToObject;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 v_1 = 0;
  v_1.x = _mtl_u.unity_WorldToObject[0].x;
  v_1.y = _mtl_u.unity_WorldToObject[1].x;
  v_1.z = _mtl_u.unity_WorldToObject[2].x;
  v_1.w = _mtl_u.unity_WorldToObject[3].x;
  float4 v_2 = 0;
  v_2.x = _mtl_u.unity_WorldToObject[0].y;
  v_2.y = _mtl_u.unity_WorldToObject[1].y;
  v_2.z = _mtl_u.unity_WorldToObject[2].y;
  v_2.w = _mtl_u.unity_WorldToObject[3].y;
  float4 v_3 = 0;
  v_3.x = _mtl_u.unity_WorldToObject[0].z;
  v_3.y = _mtl_u.unity_WorldToObject[1].z;
  v_3.z = _mtl_u.unity_WorldToObject[2].z;
  v_3.w = _mtl_u.unity_WorldToObject[3].z;
  float3 tmpvar_4 = 0;
  tmpvar_4 = normalize(((
    (v_1.xyz * _mtl_i._glesNormal.x)
   + 
    (v_2.xyz * _mtl_i._glesNormal.y)
  ) + (v_3.xyz * _mtl_i._glesNormal.z)));
  float4 tmpvar_5 = 0;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _mtl_i._glesTANGENT.xyz;
  float3 tmpvar_6 = 0;
  tmpvar_6 = normalize((_mtl_u.unity_ObjectToWorld * tmpvar_5).xyz);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = _mtl_i._glesMultiTexCoord0.xy;
  _mtl_o.xlv_TEXCOORD1 = _mtl_i._glesMultiTexCoord1.xy;
  _mtl_o.xlv_TEXCOORD2 = _mtl_i._glesMultiTexCoord2.xy;
  _mtl_o.xlv_TEXCOORD3 = (_mtl_u.unity_ObjectToWorld * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD4 = tmpvar_4;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * _mtl_i._glesTANGENT.w));
  _mtl_o.xlv_TEXCOORD8 = float4(0.0, 0.0, 0.0, 0.0);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "DIRLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec2 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD3 = hlslcc_mtx4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD6.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DiffuseMapTransA_ST;
uniform 	vec4 _Diffusecolor;
uniform 	vec4 _NormalMap_ST;
uniform 	float _NormalIntensity;
uniform 	vec4 _SpecularMap_ST;
uniform 	vec4 _Speccolor;
uniform 	float _SpecIntensity;
uniform 	float _Gloss;
uniform 	float _Transparency;
uniform  sampler2D _NormalMap;
uniform  sampler2D _SpecularMap;
uniform  sampler2D _DiffuseMapTransA;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
in  vec4 vs_TEXCOORD8;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat5;
lowp vec4 u_xlat10_5;
vec3 u_xlat6;
lowp vec4 u_xlat10_6;
vec3 u_xlat7;
lowp vec4 u_xlat10_7;
vec3 u_xlat8;
bvec3 u_xlatb8;
vec3 u_xlat9;
bvec3 u_xlatb10;
vec3 u_xlat11;
float u_xlat15;
float u_xlat33;
float u_xlat34;
mediump float u_xlat16_34;
float u_xlat35;
mediump float u_xlat16_35;
bool u_xlatb35;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat0.x = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0u)) ? 1.0 : -1.0;
    u_xlat11.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat11.x = inversesqrt(u_xlat11.x);
    u_xlat11.xyz = u_xlat11.xxx * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat11.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_3 = texture(_NormalMap, u_xlat3.xy);
    u_xlat4.xy = u_xlat10_3.wy + u_xlat10_3.wy;
    u_xlat16_3.xy = u_xlat10_3.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_34 = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_34 = min(u_xlat16_34, 1.0);
    u_xlat16_34 = (-u_xlat16_34) + 1.0;
    u_xlat4.z = sqrt(u_xlat16_34);
    u_xlat3.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = vec3(_NormalIntensity) * u_xlat3.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat4.xyz = u_xlat3.yyy * vs_TEXCOORD6.xyz;
    u_xlat3.xyw = u_xlat3.xxx * vs_TEXCOORD5.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat3.zzz * u_xlat0.xyz + u_xlat3.xyw;
    u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat34);
    u_xlat0.x = dot((-u_xlat2.xyz), u_xlat3.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat3.xyz * (-u_xlat0.xxx) + (-u_xlat2.xyz);
    u_xlat34 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat2.xyz = vec3(u_xlat34) * _WorldSpaceLightPos0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat33) + u_xlat2.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = _Gloss * 10.0 + 1.0;
    u_xlat33 = exp2(u_xlat33);
    u_xlat34 = (-_Gloss) + 1.0;
    u_xlatb35 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb35){
        u_xlatb35 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD3.yyy * hlslcc_mtx4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD3.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD3.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb35)) ? u_xlat4.xyz : vs_TEXCOORD3.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat35 = u_xlat4.y * 0.25;
        u_xlat15 = unity_ProbeVolumeParams.z * 0.5;
        u_xlat5.x = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat35 = max(u_xlat35, u_xlat15);
        u_xlat4.x = min(u_xlat5.x, u_xlat35);
        u_xlat10_5 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
        u_xlat6.xyz = u_xlat4.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_6 = texture(unity_ProbeVolumeSH, u_xlat6.xyz);
        u_xlat4.xyz = u_xlat4.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_4 = texture(unity_ProbeVolumeSH, u_xlat4.xyz);
        u_xlat3.w = 1.0;
        u_xlat5.x = dot(u_xlat10_5, u_xlat3);
        u_xlat5.y = dot(u_xlat10_6, u_xlat3);
        u_xlat5.z = dot(u_xlat10_4, u_xlat3);
    } else {
        u_xlat3.w = 1.0;
        u_xlat5.x = dot(unity_SHAr, u_xlat3);
        u_xlat5.y = dot(unity_SHAg, u_xlat3);
        u_xlat5.z = dot(unity_SHAb, u_xlat3);
    //ENDIF
    }
    u_xlat4.xyz = u_xlat5.xyz + vs_TEXCOORD8.xyz;
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb35 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat5.xyz = log2(u_xlat4.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = (bool(u_xlatb35)) ? u_xlat5.xyz : u_xlat4.xyz;
    u_xlatb35 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb35){
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat5.xyz = u_xlat0.xyz * vec3(u_xlat35);
        u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
        u_xlat7.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
        u_xlat6.x = (u_xlatb8.x) ? u_xlat6.x : u_xlat7.x;
        u_xlat6.y = (u_xlatb8.y) ? u_xlat6.y : u_xlat7.y;
        u_xlat6.z = (u_xlatb8.z) ? u_xlat6.z : u_xlat7.z;
        u_xlat35 = min(u_xlat6.y, u_xlat6.x);
        u_xlat35 = min(u_xlat6.z, u_xlat35);
        u_xlat6.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat35) + u_xlat6.xyz;
    } else {
        u_xlat5.xyz = u_xlat0.xyz;
    //ENDIF
    }
    u_xlat35 = (-u_xlat34) * 0.699999988 + 1.70000005;
    u_xlat34 = u_xlat34 * u_xlat35;
    u_xlat34 = u_xlat34 * 6.0;
    u_xlat10_5 = textureLod(unity_SpecCube0, u_xlat5.xyz, u_xlat34);
    u_xlat16_35 = log2(u_xlat10_5.w);
    u_xlat35 = u_xlat16_35 * unity_SpecCube0_HDR.y;
    u_xlat35 = exp2(u_xlat35);
    u_xlat35 = u_xlat35 * unity_SpecCube0_HDR.x;
    u_xlat6.xyz = u_xlat10_5.xyz * vec3(u_xlat35);
    u_xlatb36 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb36){
        u_xlatb36 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb36){
            u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
            u_xlat36 = inversesqrt(u_xlat36);
            u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat36);
            u_xlat8.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
            u_xlat9.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
            u_xlat8.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
            u_xlat8.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
            u_xlat8.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
            u_xlat36 = min(u_xlat8.y, u_xlat8.x);
            u_xlat36 = min(u_xlat8.z, u_xlat36);
            u_xlat8.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat0.xyz = u_xlat7.xyz * vec3(u_xlat36) + u_xlat8.xyz;
        //ENDIF
        }
        u_xlat10_7 = textureLod(unity_SpecCube1, u_xlat0.xyz, u_xlat34);
        u_xlat16_0 = log2(u_xlat10_7.w);
        u_xlat0.x = u_xlat16_0 * unity_SpecCube1_HDR.y;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * unity_SpecCube1_HDR.x;
        u_xlat0.xyz = u_xlat10_7.xyz * u_xlat0.xxx;
        u_xlat5.xyz = vec3(u_xlat35) * u_xlat10_5.xyz + (-u_xlat0.xyz);
        u_xlat6.xyz = unity_SpecCube0_BoxMin.www * u_xlat5.xyz + u_xlat0.xyz;
    //ENDIF
    }
    u_xlat0.xy = vs_TEXCOORD0.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
    u_xlat10_5 = texture(_SpecularMap, u_xlat0.xy);
    u_xlat0.xyz = u_xlat10_5.xyz * vec3(_SpecIntensity);
    u_xlat0.xyz = u_xlat0.xyz * _Speccolor.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat33 = u_xlat33 * u_xlat1.x;
    u_xlat33 = exp2(u_xlat33);
    u_xlat1.xyz = u_xlat0.xyz * u_xlat6.xyz;
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat33 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat33 = max(u_xlat33, 0.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _DiffuseMapTransA_ST.xy + _DiffuseMapTransA_ST.zw;
    u_xlat10_1 = texture(_DiffuseMapTransA, u_xlat1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * _Diffusecolor.xyz;
    u_xlat2.xyz = vec3(u_xlat33) * _LightColor0.xyz + u_xlat4.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_1.w * _Transparency;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 122 math, 8 textures, 14 branches
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "DIRLIGHTMAP_OFF" }
"#version 120

#ifdef VERTEX

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
attribute vec4 TANGENT;
varying vec2 xlv_TEXCOORD0;
varying vec2 xlv_TEXCOORD1;
varying vec2 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec4 xlv_TEXCOORD8;
void main ()
{
  vec4 v_1;
  v_1.x = unity_WorldToObject[0].x;
  v_1.y = unity_WorldToObject[1].x;
  v_1.z = unity_WorldToObject[2].x;
  v_1.w = unity_WorldToObject[3].x;
  vec4 v_2;
  v_2.x = unity_WorldToObject[0].y;
  v_2.y = unity_WorldToObject[1].y;
  v_2.z = unity_WorldToObject[2].y;
  v_2.w = unity_WorldToObject[3].y;
  vec4 v_3;
  v_3.x = unity_WorldToObject[0].z;
  v_3.y = unity_WorldToObject[1].z;
  v_3.z = unity_WorldToObject[2].z;
  v_3.w = unity_WorldToObject[3].z;
  vec3 tmpvar_4;
  tmpvar_4 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = TANGENT.xyz;
  vec3 tmpvar_6;
  tmpvar_6 = normalize((unity_ObjectToWorld * tmpvar_5).xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = gl_MultiTexCoord0.xy;
  xlv_TEXCOORD1 = gl_MultiTexCoord1.xy;
  xlv_TEXCOORD2 = gl_MultiTexCoord2.xy;
  xlv_TEXCOORD3 = (unity_ObjectToWorld * gl_Vertex);
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * TANGENT.w));
  xlv_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform samplerCube unity_SpecCube0;
uniform samplerCube unity_SpecCube1;
uniform vec4 unity_SpecCube0_BoxMax;
uniform vec4 unity_SpecCube0_BoxMin;
uniform vec4 unity_SpecCube0_ProbePosition;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_SpecCube1_BoxMax;
uniform vec4 unity_SpecCube1_BoxMin;
uniform vec4 unity_SpecCube1_ProbePosition;
uniform vec4 unity_SpecCube1_HDR;
uniform sampler3D unity_ProbeVolumeSH;
uniform vec4 unity_ProbeVolumeParams;
uniform mat4 unity_ProbeVolumeWorldToObject;
uniform vec3 unity_ProbeVolumeSizeInv;
uniform vec3 unity_ProbeVolumeMin;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _LightColor0;
uniform sampler2D _DiffuseMapTransA;
uniform vec4 _DiffuseMapTransA_ST;
uniform vec4 _Diffusecolor;
uniform sampler2D _NormalMap;
uniform vec4 _NormalMap_ST;
uniform float _NormalIntensity;
uniform sampler2D _SpecularMap;
uniform vec4 _SpecularMap_ST;
uniform vec4 _Speccolor;
uniform float _SpecIntensity;
uniform float _Gloss;
uniform float _Transparency;
varying vec2 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec4 xlv_TEXCOORD8;
void main ()
{
  float tmpvar_1;
  if (gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD4;
  float tmpvar_3;
  vec3 tmpvar_4;
  int tmpvar_5;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_5 = 1;
  } else {
    tmpvar_5 = -1;
  };
  tmpvar_2 = (normalize(xlv_TEXCOORD4) * float(tmpvar_5));
  mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD5.x;
  tmpvar_6[0].y = xlv_TEXCOORD6.x;
  tmpvar_6[0].z = tmpvar_2.x;
  tmpvar_6[1].x = xlv_TEXCOORD5.y;
  tmpvar_6[1].y = xlv_TEXCOORD6.y;
  tmpvar_6[1].z = tmpvar_2.y;
  tmpvar_6[2].x = xlv_TEXCOORD5.z;
  tmpvar_6[2].y = xlv_TEXCOORD6.z;
  tmpvar_6[2].z = tmpvar_2.z;
  vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3.xyz));
  vec3 normal_8;
  normal_8.xy = ((texture2D (_NormalMap, (
    (xlv_TEXCOORD0 * _NormalMap_ST.xy)
   + _NormalMap_ST.zw)).wy * 2.0) - 1.0);
  normal_8.z = sqrt((1.0 - clamp (
    dot (normal_8.xy, normal_8.xy)
  , 0.0, 1.0)));
  vec3 tmpvar_9;
  tmpvar_9 = normalize((mix (vec3(0.0, 0.0, 1.0), normal_8, vec3(_NormalIntensity)) * tmpvar_6));
  vec3 tmpvar_10;
  vec3 I_11;
  I_11 = -(tmpvar_7);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_7 + tmpvar_12));
  float tmpvar_14;
  tmpvar_14 = exp2(((_Gloss * 10.0) + 1.0));
  tmpvar_4 = xlv_TEXCOORD3.xyz;
  tmpvar_3 = (1.0 - _Gloss);
  vec3 ambient_15;
  ambient_15 = xlv_TEXCOORD8.xyz;
  vec3 ambient_contrib_16;
  ambient_contrib_16 = vec3(0.0, 0.0, 0.0);
  if ((unity_ProbeVolumeParams.x == 1.0)) {
    vec4 tmpvar_17;
    tmpvar_17.w = 1.0;
    tmpvar_17.xyz = tmpvar_9;
    vec3 x1_18;
    vec3 texCoord_19;
    vec3 tmpvar_20;
    if ((unity_ProbeVolumeParams.y == 1.0)) {
      vec4 tmpvar_21;
      tmpvar_21.w = 1.0;
      tmpvar_21.xyz = tmpvar_4;
      tmpvar_20 = (unity_ProbeVolumeWorldToObject * tmpvar_21).xyz;
    } else {
      tmpvar_20 = tmpvar_4;
    };
    vec3 tmpvar_22;
    tmpvar_22 = ((tmpvar_20 - unity_ProbeVolumeMin) * unity_ProbeVolumeSizeInv);
    texCoord_19.yz = tmpvar_22.yz;
    texCoord_19.x = (tmpvar_22.x * 0.25);
    float tmpvar_23;
    float tmpvar_24;
    tmpvar_24 = (0.5 * unity_ProbeVolumeParams.z);
    tmpvar_23 = clamp (texCoord_19.x, tmpvar_24, (0.25 - tmpvar_24));
    texCoord_19.x = tmpvar_23;
    vec4 tmpvar_25;
    tmpvar_25 = texture3D (unity_ProbeVolumeSH, texCoord_19);
    texCoord_19.x = (tmpvar_23 + 0.25);
    vec4 tmpvar_26;
    tmpvar_26 = texture3D (unity_ProbeVolumeSH, texCoord_19);
    texCoord_19.x = (tmpvar_23 + 0.5);
    x1_18.x = dot (tmpvar_25, tmpvar_17);
    x1_18.y = dot (tmpvar_26, tmpvar_17);
    x1_18.z = dot (texture3D (unity_ProbeVolumeSH, texCoord_19), tmpvar_17);
    ambient_contrib_16 = x1_18;
  } else {
    vec4 tmpvar_27;
    tmpvar_27.w = 1.0;
    tmpvar_27.xyz = tmpvar_9;
    vec3 x_28;
    x_28.x = dot (unity_SHAr, tmpvar_27);
    x_28.y = dot (unity_SHAg, tmpvar_27);
    x_28.z = dot (unity_SHAb, tmpvar_27);
    ambient_contrib_16 = x_28;
  };
  vec3 tmpvar_29;
  tmpvar_29 = max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD8.xyz + ambient_contrib_16));
  ambient_15 = tmpvar_29;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_15 = max (((1.055 * 
      pow (max (tmpvar_29, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0));
  };
  vec3 specular_30;
  vec3 worldRefl_31;
  worldRefl_31 = tmpvar_10;
  vec3 worldPos_32;
  worldPos_32 = tmpvar_4;
  if ((unity_SpecCube0_ProbePosition.w > 0.0)) {
    vec3 tmpvar_33;
    tmpvar_33 = normalize(tmpvar_10);
    vec3 tmpvar_34;
    tmpvar_34 = ((unity_SpecCube0_BoxMax.xyz - xlv_TEXCOORD3.xyz) / tmpvar_33);
    vec3 tmpvar_35;
    tmpvar_35 = ((unity_SpecCube0_BoxMin.xyz - xlv_TEXCOORD3.xyz) / tmpvar_33);
    bvec3 tmpvar_36;
    tmpvar_36 = greaterThan (tmpvar_33, vec3(0.0, 0.0, 0.0));
    float tmpvar_37;
    if (tmpvar_36.x) {
      tmpvar_37 = tmpvar_34.x;
    } else {
      tmpvar_37 = tmpvar_35.x;
    };
    float tmpvar_38;
    if (tmpvar_36.y) {
      tmpvar_38 = tmpvar_34.y;
    } else {
      tmpvar_38 = tmpvar_35.y;
    };
    float tmpvar_39;
    if (tmpvar_36.z) {
      tmpvar_39 = tmpvar_34.z;
    } else {
      tmpvar_39 = tmpvar_35.z;
    };
    worldPos_32 = (xlv_TEXCOORD3.xyz - unity_SpecCube0_ProbePosition.xyz);
    worldRefl_31 = (worldPos_32 + (tmpvar_33 * min (
      min (tmpvar_37, tmpvar_38)
    , tmpvar_39)));
  };
  vec4 tmpvar_40;
  tmpvar_40.xyz = worldRefl_31;
  tmpvar_40.w = ((tmpvar_3 * (1.7 - 
    (0.7 * tmpvar_3)
  )) * 6.0);
  vec4 tmpvar_41;
  tmpvar_41 = textureCubeLod (unity_SpecCube0, worldRefl_31, tmpvar_40.w);
  vec3 tmpvar_42;
  tmpvar_42 = ((unity_SpecCube0_HDR.x * pow (tmpvar_41.w, unity_SpecCube0_HDR.y)) * tmpvar_41.xyz);
  if ((unity_SpecCube0_BoxMin.w < 0.99999)) {
    vec3 worldRefl_43;
    worldRefl_43 = tmpvar_10;
    vec3 worldPos_44;
    worldPos_44 = tmpvar_4;
    if ((unity_SpecCube1_ProbePosition.w > 0.0)) {
      vec3 tmpvar_45;
      tmpvar_45 = normalize(tmpvar_10);
      vec3 tmpvar_46;
      tmpvar_46 = ((unity_SpecCube1_BoxMax.xyz - xlv_TEXCOORD3.xyz) / tmpvar_45);
      vec3 tmpvar_47;
      tmpvar_47 = ((unity_SpecCube1_BoxMin.xyz - xlv_TEXCOORD3.xyz) / tmpvar_45);
      bvec3 tmpvar_48;
      tmpvar_48 = greaterThan (tmpvar_45, vec3(0.0, 0.0, 0.0));
      float tmpvar_49;
      if (tmpvar_48.x) {
        tmpvar_49 = tmpvar_46.x;
      } else {
        tmpvar_49 = tmpvar_47.x;
      };
      float tmpvar_50;
      if (tmpvar_48.y) {
        tmpvar_50 = tmpvar_46.y;
      } else {
        tmpvar_50 = tmpvar_47.y;
      };
      float tmpvar_51;
      if (tmpvar_48.z) {
        tmpvar_51 = tmpvar_46.z;
      } else {
        tmpvar_51 = tmpvar_47.z;
      };
      worldPos_44 = (xlv_TEXCOORD3.xyz - unity_SpecCube1_ProbePosition.xyz);
      worldRefl_43 = (worldPos_44 + (tmpvar_45 * min (
        min (tmpvar_49, tmpvar_50)
      , tmpvar_51)));
    };
    vec4 tmpvar_52;
    tmpvar_52.xyz = worldRefl_43;
    tmpvar_52.w = ((tmpvar_3 * (1.7 - 
      (0.7 * tmpvar_3)
    )) * 6.0);
    vec4 tmpvar_53;
    tmpvar_53 = textureCubeLod (unity_SpecCube1, worldRefl_43, tmpvar_52.w);
    specular_30 = mix (((unity_SpecCube1_HDR.x * 
      pow (tmpvar_53.w, unity_SpecCube1_HDR.y)
    ) * tmpvar_53.xyz), tmpvar_42, unity_SpecCube0_BoxMin.www);
  } else {
    specular_30 = tmpvar_42;
  };
  vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_SpecularMap, (
    (xlv_TEXCOORD0 * _SpecularMap_ST.xy)
   + _SpecularMap_ST.zw)).xyz * _SpecIntensity) * _Speccolor.xyz);
  vec4 tmpvar_55;
  tmpvar_55 = texture2D (_DiffuseMapTransA, ((xlv_TEXCOORD0 * _DiffuseMapTransA_ST.xy) + _DiffuseMapTransA_ST.zw));
  vec4 tmpvar_56;
  tmpvar_56.xyz = (((
    (max (0.0, dot (tmpvar_9, tmpvar_12)) * _LightColor0.xyz)
   + ambient_15) * (tmpvar_55.xyz * _Diffusecolor.xyz)) + ((
    pow (max (0.0, dot (tmpvar_13, tmpvar_9)), tmpvar_14)
   * tmpvar_54) + (specular_30 * tmpvar_54)));
  tmpvar_56.w = (tmpvar_55.w * _Transparency);
  gl_FragData[0] = tmpvar_56;
}


#endif
"
}
SubProgram "metal " {
// Stats: 17 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "DIRLIGHTMAP_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
Bind "texcoord2" ATTR5
ConstBuffer "$Globals" 192
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [unity_ObjectToWorld]
Matrix 128 [unity_WorldToObject]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
  float4 _glesMultiTexCoord2 [[attribute(5)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float4 xlv_TEXCOORD8;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4x4 unity_ObjectToWorld;
  float4x4 unity_WorldToObject;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 v_1 = 0;
  v_1.x = _mtl_u.unity_WorldToObject[0].x;
  v_1.y = _mtl_u.unity_WorldToObject[1].x;
  v_1.z = _mtl_u.unity_WorldToObject[2].x;
  v_1.w = _mtl_u.unity_WorldToObject[3].x;
  float4 v_2 = 0;
  v_2.x = _mtl_u.unity_WorldToObject[0].y;
  v_2.y = _mtl_u.unity_WorldToObject[1].y;
  v_2.z = _mtl_u.unity_WorldToObject[2].y;
  v_2.w = _mtl_u.unity_WorldToObject[3].y;
  float4 v_3 = 0;
  v_3.x = _mtl_u.unity_WorldToObject[0].z;
  v_3.y = _mtl_u.unity_WorldToObject[1].z;
  v_3.z = _mtl_u.unity_WorldToObject[2].z;
  v_3.w = _mtl_u.unity_WorldToObject[3].z;
  float3 tmpvar_4 = 0;
  tmpvar_4 = normalize(((
    (v_1.xyz * _mtl_i._glesNormal.x)
   + 
    (v_2.xyz * _mtl_i._glesNormal.y)
  ) + (v_3.xyz * _mtl_i._glesNormal.z)));
  float4 tmpvar_5 = 0;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _mtl_i._glesTANGENT.xyz;
  float3 tmpvar_6 = 0;
  tmpvar_6 = normalize((_mtl_u.unity_ObjectToWorld * tmpvar_5).xyz);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = _mtl_i._glesMultiTexCoord0.xy;
  _mtl_o.xlv_TEXCOORD1 = _mtl_i._glesMultiTexCoord1.xy;
  _mtl_o.xlv_TEXCOORD2 = _mtl_i._glesMultiTexCoord2.xy;
  _mtl_o.xlv_TEXCOORD3 = (_mtl_u.unity_ObjectToWorld * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD4 = tmpvar_4;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * _mtl_i._glesTANGENT.w));
  _mtl_o.xlv_TEXCOORD8 = float4(0.0, 0.0, 0.0, 0.0);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "DIRLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec2 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD3 = hlslcc_mtx4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD6.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DiffuseMapTransA_ST;
uniform 	vec4 _Diffusecolor;
uniform 	vec4 _NormalMap_ST;
uniform 	float _NormalIntensity;
uniform 	vec4 _SpecularMap_ST;
uniform 	vec4 _Speccolor;
uniform 	float _SpecIntensity;
uniform 	float _Gloss;
uniform 	float _Transparency;
uniform  sampler2D _NormalMap;
uniform  sampler2D _SpecularMap;
uniform  sampler2D _DiffuseMapTransA;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
in  vec4 vs_TEXCOORD8;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat5;
lowp vec4 u_xlat10_5;
vec3 u_xlat6;
lowp vec4 u_xlat10_6;
vec3 u_xlat7;
lowp vec4 u_xlat10_7;
vec3 u_xlat8;
bvec3 u_xlatb8;
vec3 u_xlat9;
bvec3 u_xlatb10;
vec3 u_xlat11;
float u_xlat15;
float u_xlat33;
float u_xlat34;
mediump float u_xlat16_34;
float u_xlat35;
mediump float u_xlat16_35;
bool u_xlatb35;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat0.x = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0u)) ? 1.0 : -1.0;
    u_xlat11.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat11.x = inversesqrt(u_xlat11.x);
    u_xlat11.xyz = u_xlat11.xxx * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat11.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_3 = texture(_NormalMap, u_xlat3.xy);
    u_xlat4.xy = u_xlat10_3.wy + u_xlat10_3.wy;
    u_xlat16_3.xy = u_xlat10_3.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_34 = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_34 = min(u_xlat16_34, 1.0);
    u_xlat16_34 = (-u_xlat16_34) + 1.0;
    u_xlat4.z = sqrt(u_xlat16_34);
    u_xlat3.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = vec3(_NormalIntensity) * u_xlat3.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat4.xyz = u_xlat3.yyy * vs_TEXCOORD6.xyz;
    u_xlat3.xyw = u_xlat3.xxx * vs_TEXCOORD5.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat3.zzz * u_xlat0.xyz + u_xlat3.xyw;
    u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat34);
    u_xlat0.x = dot((-u_xlat2.xyz), u_xlat3.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat3.xyz * (-u_xlat0.xxx) + (-u_xlat2.xyz);
    u_xlat34 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat2.xyz = vec3(u_xlat34) * _WorldSpaceLightPos0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat33) + u_xlat2.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = _Gloss * 10.0 + 1.0;
    u_xlat33 = exp2(u_xlat33);
    u_xlat34 = (-_Gloss) + 1.0;
    u_xlatb35 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb35){
        u_xlatb35 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD3.yyy * hlslcc_mtx4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD3.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD3.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb35)) ? u_xlat4.xyz : vs_TEXCOORD3.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat35 = u_xlat4.y * 0.25;
        u_xlat15 = unity_ProbeVolumeParams.z * 0.5;
        u_xlat5.x = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat35 = max(u_xlat35, u_xlat15);
        u_xlat4.x = min(u_xlat5.x, u_xlat35);
        u_xlat10_5 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
        u_xlat6.xyz = u_xlat4.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_6 = texture(unity_ProbeVolumeSH, u_xlat6.xyz);
        u_xlat4.xyz = u_xlat4.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_4 = texture(unity_ProbeVolumeSH, u_xlat4.xyz);
        u_xlat3.w = 1.0;
        u_xlat5.x = dot(u_xlat10_5, u_xlat3);
        u_xlat5.y = dot(u_xlat10_6, u_xlat3);
        u_xlat5.z = dot(u_xlat10_4, u_xlat3);
    } else {
        u_xlat3.w = 1.0;
        u_xlat5.x = dot(unity_SHAr, u_xlat3);
        u_xlat5.y = dot(unity_SHAg, u_xlat3);
        u_xlat5.z = dot(unity_SHAb, u_xlat3);
    //ENDIF
    }
    u_xlat4.xyz = u_xlat5.xyz + vs_TEXCOORD8.xyz;
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb35 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat5.xyz = log2(u_xlat4.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = (bool(u_xlatb35)) ? u_xlat5.xyz : u_xlat4.xyz;
    u_xlatb35 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb35){
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat5.xyz = u_xlat0.xyz * vec3(u_xlat35);
        u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
        u_xlat7.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
        u_xlat6.x = (u_xlatb8.x) ? u_xlat6.x : u_xlat7.x;
        u_xlat6.y = (u_xlatb8.y) ? u_xlat6.y : u_xlat7.y;
        u_xlat6.z = (u_xlatb8.z) ? u_xlat6.z : u_xlat7.z;
        u_xlat35 = min(u_xlat6.y, u_xlat6.x);
        u_xlat35 = min(u_xlat6.z, u_xlat35);
        u_xlat6.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat35) + u_xlat6.xyz;
    } else {
        u_xlat5.xyz = u_xlat0.xyz;
    //ENDIF
    }
    u_xlat35 = (-u_xlat34) * 0.699999988 + 1.70000005;
    u_xlat34 = u_xlat34 * u_xlat35;
    u_xlat34 = u_xlat34 * 6.0;
    u_xlat10_5 = textureLod(unity_SpecCube0, u_xlat5.xyz, u_xlat34);
    u_xlat16_35 = log2(u_xlat10_5.w);
    u_xlat35 = u_xlat16_35 * unity_SpecCube0_HDR.y;
    u_xlat35 = exp2(u_xlat35);
    u_xlat35 = u_xlat35 * unity_SpecCube0_HDR.x;
    u_xlat6.xyz = u_xlat10_5.xyz * vec3(u_xlat35);
    u_xlatb36 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb36){
        u_xlatb36 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb36){
            u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
            u_xlat36 = inversesqrt(u_xlat36);
            u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat36);
            u_xlat8.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
            u_xlat9.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
            u_xlat8.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
            u_xlat8.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
            u_xlat8.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
            u_xlat36 = min(u_xlat8.y, u_xlat8.x);
            u_xlat36 = min(u_xlat8.z, u_xlat36);
            u_xlat8.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat0.xyz = u_xlat7.xyz * vec3(u_xlat36) + u_xlat8.xyz;
        //ENDIF
        }
        u_xlat10_7 = textureLod(unity_SpecCube1, u_xlat0.xyz, u_xlat34);
        u_xlat16_0 = log2(u_xlat10_7.w);
        u_xlat0.x = u_xlat16_0 * unity_SpecCube1_HDR.y;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * unity_SpecCube1_HDR.x;
        u_xlat0.xyz = u_xlat10_7.xyz * u_xlat0.xxx;
        u_xlat5.xyz = vec3(u_xlat35) * u_xlat10_5.xyz + (-u_xlat0.xyz);
        u_xlat6.xyz = unity_SpecCube0_BoxMin.www * u_xlat5.xyz + u_xlat0.xyz;
    //ENDIF
    }
    u_xlat0.xy = vs_TEXCOORD0.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
    u_xlat10_5 = texture(_SpecularMap, u_xlat0.xy);
    u_xlat0.xyz = u_xlat10_5.xyz * vec3(_SpecIntensity);
    u_xlat0.xyz = u_xlat0.xyz * _Speccolor.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat33 = u_xlat33 * u_xlat1.x;
    u_xlat33 = exp2(u_xlat33);
    u_xlat1.xyz = u_xlat0.xyz * u_xlat6.xyz;
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat33 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat33 = max(u_xlat33, 0.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _DiffuseMapTransA_ST.xy + _DiffuseMapTransA_ST.zw;
    u_xlat10_1 = texture(_DiffuseMapTransA, u_xlat1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * _Diffusecolor.xyz;
    u_xlat2.xyz = vec3(u_xlat33) * _LightColor0.xyz + u_xlat4.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_1.w * _Transparency;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 122 math, 8 textures, 14 branches
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"#version 120

#ifdef VERTEX

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
attribute vec4 TANGENT;
varying vec2 xlv_TEXCOORD0;
varying vec2 xlv_TEXCOORD1;
varying vec2 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec4 xlv_TEXCOORD8;
void main ()
{
  vec4 v_1;
  v_1.x = unity_WorldToObject[0].x;
  v_1.y = unity_WorldToObject[1].x;
  v_1.z = unity_WorldToObject[2].x;
  v_1.w = unity_WorldToObject[3].x;
  vec4 v_2;
  v_2.x = unity_WorldToObject[0].y;
  v_2.y = unity_WorldToObject[1].y;
  v_2.z = unity_WorldToObject[2].y;
  v_2.w = unity_WorldToObject[3].y;
  vec4 v_3;
  v_3.x = unity_WorldToObject[0].z;
  v_3.y = unity_WorldToObject[1].z;
  v_3.z = unity_WorldToObject[2].z;
  v_3.w = unity_WorldToObject[3].z;
  vec3 tmpvar_4;
  tmpvar_4 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = TANGENT.xyz;
  vec3 tmpvar_6;
  tmpvar_6 = normalize((unity_ObjectToWorld * tmpvar_5).xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = gl_MultiTexCoord0.xy;
  xlv_TEXCOORD1 = gl_MultiTexCoord1.xy;
  xlv_TEXCOORD2 = gl_MultiTexCoord2.xy;
  xlv_TEXCOORD3 = (unity_ObjectToWorld * gl_Vertex);
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * TANGENT.w));
  xlv_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform samplerCube unity_SpecCube0;
uniform samplerCube unity_SpecCube1;
uniform vec4 unity_SpecCube0_BoxMax;
uniform vec4 unity_SpecCube0_BoxMin;
uniform vec4 unity_SpecCube0_ProbePosition;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_SpecCube1_BoxMax;
uniform vec4 unity_SpecCube1_BoxMin;
uniform vec4 unity_SpecCube1_ProbePosition;
uniform vec4 unity_SpecCube1_HDR;
uniform sampler3D unity_ProbeVolumeSH;
uniform vec4 unity_ProbeVolumeParams;
uniform mat4 unity_ProbeVolumeWorldToObject;
uniform vec3 unity_ProbeVolumeSizeInv;
uniform vec3 unity_ProbeVolumeMin;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _LightColor0;
uniform sampler2D _DiffuseMapTransA;
uniform vec4 _DiffuseMapTransA_ST;
uniform vec4 _Diffusecolor;
uniform sampler2D _NormalMap;
uniform vec4 _NormalMap_ST;
uniform float _NormalIntensity;
uniform sampler2D _SpecularMap;
uniform vec4 _SpecularMap_ST;
uniform vec4 _Speccolor;
uniform float _SpecIntensity;
uniform float _Gloss;
uniform float _Transparency;
varying vec2 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec4 xlv_TEXCOORD8;
void main ()
{
  float tmpvar_1;
  if (gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD4;
  float tmpvar_3;
  vec3 tmpvar_4;
  int tmpvar_5;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_5 = 1;
  } else {
    tmpvar_5 = -1;
  };
  tmpvar_2 = (normalize(xlv_TEXCOORD4) * float(tmpvar_5));
  mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD5.x;
  tmpvar_6[0].y = xlv_TEXCOORD6.x;
  tmpvar_6[0].z = tmpvar_2.x;
  tmpvar_6[1].x = xlv_TEXCOORD5.y;
  tmpvar_6[1].y = xlv_TEXCOORD6.y;
  tmpvar_6[1].z = tmpvar_2.y;
  tmpvar_6[2].x = xlv_TEXCOORD5.z;
  tmpvar_6[2].y = xlv_TEXCOORD6.z;
  tmpvar_6[2].z = tmpvar_2.z;
  vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3.xyz));
  vec3 normal_8;
  normal_8.xy = ((texture2D (_NormalMap, (
    (xlv_TEXCOORD0 * _NormalMap_ST.xy)
   + _NormalMap_ST.zw)).wy * 2.0) - 1.0);
  normal_8.z = sqrt((1.0 - clamp (
    dot (normal_8.xy, normal_8.xy)
  , 0.0, 1.0)));
  vec3 tmpvar_9;
  tmpvar_9 = normalize((mix (vec3(0.0, 0.0, 1.0), normal_8, vec3(_NormalIntensity)) * tmpvar_6));
  vec3 tmpvar_10;
  vec3 I_11;
  I_11 = -(tmpvar_7);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_7 + tmpvar_12));
  float tmpvar_14;
  tmpvar_14 = exp2(((_Gloss * 10.0) + 1.0));
  tmpvar_4 = xlv_TEXCOORD3.xyz;
  tmpvar_3 = (1.0 - _Gloss);
  vec3 ambient_15;
  ambient_15 = xlv_TEXCOORD8.xyz;
  vec3 ambient_contrib_16;
  ambient_contrib_16 = vec3(0.0, 0.0, 0.0);
  if ((unity_ProbeVolumeParams.x == 1.0)) {
    vec4 tmpvar_17;
    tmpvar_17.w = 1.0;
    tmpvar_17.xyz = tmpvar_9;
    vec3 x1_18;
    vec3 texCoord_19;
    vec3 tmpvar_20;
    if ((unity_ProbeVolumeParams.y == 1.0)) {
      vec4 tmpvar_21;
      tmpvar_21.w = 1.0;
      tmpvar_21.xyz = tmpvar_4;
      tmpvar_20 = (unity_ProbeVolumeWorldToObject * tmpvar_21).xyz;
    } else {
      tmpvar_20 = tmpvar_4;
    };
    vec3 tmpvar_22;
    tmpvar_22 = ((tmpvar_20 - unity_ProbeVolumeMin) * unity_ProbeVolumeSizeInv);
    texCoord_19.yz = tmpvar_22.yz;
    texCoord_19.x = (tmpvar_22.x * 0.25);
    float tmpvar_23;
    float tmpvar_24;
    tmpvar_24 = (0.5 * unity_ProbeVolumeParams.z);
    tmpvar_23 = clamp (texCoord_19.x, tmpvar_24, (0.25 - tmpvar_24));
    texCoord_19.x = tmpvar_23;
    vec4 tmpvar_25;
    tmpvar_25 = texture3D (unity_ProbeVolumeSH, texCoord_19);
    texCoord_19.x = (tmpvar_23 + 0.25);
    vec4 tmpvar_26;
    tmpvar_26 = texture3D (unity_ProbeVolumeSH, texCoord_19);
    texCoord_19.x = (tmpvar_23 + 0.5);
    x1_18.x = dot (tmpvar_25, tmpvar_17);
    x1_18.y = dot (tmpvar_26, tmpvar_17);
    x1_18.z = dot (texture3D (unity_ProbeVolumeSH, texCoord_19), tmpvar_17);
    ambient_contrib_16 = x1_18;
  } else {
    vec4 tmpvar_27;
    tmpvar_27.w = 1.0;
    tmpvar_27.xyz = tmpvar_9;
    vec3 x_28;
    x_28.x = dot (unity_SHAr, tmpvar_27);
    x_28.y = dot (unity_SHAg, tmpvar_27);
    x_28.z = dot (unity_SHAb, tmpvar_27);
    ambient_contrib_16 = x_28;
  };
  vec3 tmpvar_29;
  tmpvar_29 = max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD8.xyz + ambient_contrib_16));
  ambient_15 = tmpvar_29;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_15 = max (((1.055 * 
      pow (max (tmpvar_29, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0));
  };
  vec3 specular_30;
  vec3 worldRefl_31;
  worldRefl_31 = tmpvar_10;
  vec3 worldPos_32;
  worldPos_32 = tmpvar_4;
  if ((unity_SpecCube0_ProbePosition.w > 0.0)) {
    vec3 tmpvar_33;
    tmpvar_33 = normalize(tmpvar_10);
    vec3 tmpvar_34;
    tmpvar_34 = ((unity_SpecCube0_BoxMax.xyz - xlv_TEXCOORD3.xyz) / tmpvar_33);
    vec3 tmpvar_35;
    tmpvar_35 = ((unity_SpecCube0_BoxMin.xyz - xlv_TEXCOORD3.xyz) / tmpvar_33);
    bvec3 tmpvar_36;
    tmpvar_36 = greaterThan (tmpvar_33, vec3(0.0, 0.0, 0.0));
    float tmpvar_37;
    if (tmpvar_36.x) {
      tmpvar_37 = tmpvar_34.x;
    } else {
      tmpvar_37 = tmpvar_35.x;
    };
    float tmpvar_38;
    if (tmpvar_36.y) {
      tmpvar_38 = tmpvar_34.y;
    } else {
      tmpvar_38 = tmpvar_35.y;
    };
    float tmpvar_39;
    if (tmpvar_36.z) {
      tmpvar_39 = tmpvar_34.z;
    } else {
      tmpvar_39 = tmpvar_35.z;
    };
    worldPos_32 = (xlv_TEXCOORD3.xyz - unity_SpecCube0_ProbePosition.xyz);
    worldRefl_31 = (worldPos_32 + (tmpvar_33 * min (
      min (tmpvar_37, tmpvar_38)
    , tmpvar_39)));
  };
  vec4 tmpvar_40;
  tmpvar_40.xyz = worldRefl_31;
  tmpvar_40.w = ((tmpvar_3 * (1.7 - 
    (0.7 * tmpvar_3)
  )) * 6.0);
  vec4 tmpvar_41;
  tmpvar_41 = textureCubeLod (unity_SpecCube0, worldRefl_31, tmpvar_40.w);
  vec3 tmpvar_42;
  tmpvar_42 = ((unity_SpecCube0_HDR.x * pow (tmpvar_41.w, unity_SpecCube0_HDR.y)) * tmpvar_41.xyz);
  if ((unity_SpecCube0_BoxMin.w < 0.99999)) {
    vec3 worldRefl_43;
    worldRefl_43 = tmpvar_10;
    vec3 worldPos_44;
    worldPos_44 = tmpvar_4;
    if ((unity_SpecCube1_ProbePosition.w > 0.0)) {
      vec3 tmpvar_45;
      tmpvar_45 = normalize(tmpvar_10);
      vec3 tmpvar_46;
      tmpvar_46 = ((unity_SpecCube1_BoxMax.xyz - xlv_TEXCOORD3.xyz) / tmpvar_45);
      vec3 tmpvar_47;
      tmpvar_47 = ((unity_SpecCube1_BoxMin.xyz - xlv_TEXCOORD3.xyz) / tmpvar_45);
      bvec3 tmpvar_48;
      tmpvar_48 = greaterThan (tmpvar_45, vec3(0.0, 0.0, 0.0));
      float tmpvar_49;
      if (tmpvar_48.x) {
        tmpvar_49 = tmpvar_46.x;
      } else {
        tmpvar_49 = tmpvar_47.x;
      };
      float tmpvar_50;
      if (tmpvar_48.y) {
        tmpvar_50 = tmpvar_46.y;
      } else {
        tmpvar_50 = tmpvar_47.y;
      };
      float tmpvar_51;
      if (tmpvar_48.z) {
        tmpvar_51 = tmpvar_46.z;
      } else {
        tmpvar_51 = tmpvar_47.z;
      };
      worldPos_44 = (xlv_TEXCOORD3.xyz - unity_SpecCube1_ProbePosition.xyz);
      worldRefl_43 = (worldPos_44 + (tmpvar_45 * min (
        min (tmpvar_49, tmpvar_50)
      , tmpvar_51)));
    };
    vec4 tmpvar_52;
    tmpvar_52.xyz = worldRefl_43;
    tmpvar_52.w = ((tmpvar_3 * (1.7 - 
      (0.7 * tmpvar_3)
    )) * 6.0);
    vec4 tmpvar_53;
    tmpvar_53 = textureCubeLod (unity_SpecCube1, worldRefl_43, tmpvar_52.w);
    specular_30 = mix (((unity_SpecCube1_HDR.x * 
      pow (tmpvar_53.w, unity_SpecCube1_HDR.y)
    ) * tmpvar_53.xyz), tmpvar_42, unity_SpecCube0_BoxMin.www);
  } else {
    specular_30 = tmpvar_42;
  };
  vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_SpecularMap, (
    (xlv_TEXCOORD0 * _SpecularMap_ST.xy)
   + _SpecularMap_ST.zw)).xyz * _SpecIntensity) * _Speccolor.xyz);
  vec4 tmpvar_55;
  tmpvar_55 = texture2D (_DiffuseMapTransA, ((xlv_TEXCOORD0 * _DiffuseMapTransA_ST.xy) + _DiffuseMapTransA_ST.zw));
  vec4 tmpvar_56;
  tmpvar_56.xyz = (((
    (max (0.0, dot (tmpvar_9, tmpvar_12)) * _LightColor0.xyz)
   + ambient_15) * (tmpvar_55.xyz * _Diffusecolor.xyz)) + ((
    pow (max (0.0, dot (tmpvar_13, tmpvar_9)), tmpvar_14)
   * tmpvar_54) + (specular_30 * tmpvar_54)));
  tmpvar_56.w = (tmpvar_55.w * _Transparency);
  gl_FragData[0] = tmpvar_56;
}


#endif
"
}
SubProgram "metal " {
// Stats: 17 math
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
Bind "texcoord2" ATTR5
ConstBuffer "$Globals" 192
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [unity_ObjectToWorld]
Matrix 128 [unity_WorldToObject]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
  float4 _glesMultiTexCoord2 [[attribute(5)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float4 xlv_TEXCOORD8;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4x4 unity_ObjectToWorld;
  float4x4 unity_WorldToObject;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 v_1 = 0;
  v_1.x = _mtl_u.unity_WorldToObject[0].x;
  v_1.y = _mtl_u.unity_WorldToObject[1].x;
  v_1.z = _mtl_u.unity_WorldToObject[2].x;
  v_1.w = _mtl_u.unity_WorldToObject[3].x;
  float4 v_2 = 0;
  v_2.x = _mtl_u.unity_WorldToObject[0].y;
  v_2.y = _mtl_u.unity_WorldToObject[1].y;
  v_2.z = _mtl_u.unity_WorldToObject[2].y;
  v_2.w = _mtl_u.unity_WorldToObject[3].y;
  float4 v_3 = 0;
  v_3.x = _mtl_u.unity_WorldToObject[0].z;
  v_3.y = _mtl_u.unity_WorldToObject[1].z;
  v_3.z = _mtl_u.unity_WorldToObject[2].z;
  v_3.w = _mtl_u.unity_WorldToObject[3].z;
  float3 tmpvar_4 = 0;
  tmpvar_4 = normalize(((
    (v_1.xyz * _mtl_i._glesNormal.x)
   + 
    (v_2.xyz * _mtl_i._glesNormal.y)
  ) + (v_3.xyz * _mtl_i._glesNormal.z)));
  float4 tmpvar_5 = 0;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _mtl_i._glesTANGENT.xyz;
  float3 tmpvar_6 = 0;
  tmpvar_6 = normalize((_mtl_u.unity_ObjectToWorld * tmpvar_5).xyz);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = _mtl_i._glesMultiTexCoord0.xy;
  _mtl_o.xlv_TEXCOORD1 = _mtl_i._glesMultiTexCoord1.xy;
  _mtl_o.xlv_TEXCOORD2 = _mtl_i._glesMultiTexCoord2.xy;
  _mtl_o.xlv_TEXCOORD3 = (_mtl_u.unity_ObjectToWorld * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD4 = tmpvar_4;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * _mtl_i._glesTANGENT.w));
  _mtl_o.xlv_TEXCOORD8 = float4(0.0, 0.0, 0.0, 0.0);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec2 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD3 = hlslcc_mtx4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD6.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DiffuseMapTransA_ST;
uniform 	vec4 _Diffusecolor;
uniform 	vec4 _NormalMap_ST;
uniform 	float _NormalIntensity;
uniform 	vec4 _SpecularMap_ST;
uniform 	vec4 _Speccolor;
uniform 	float _SpecIntensity;
uniform 	float _Gloss;
uniform 	float _Transparency;
uniform  sampler2D _NormalMap;
uniform  sampler2D _SpecularMap;
uniform  sampler2D _DiffuseMapTransA;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
in  vec4 vs_TEXCOORD8;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat5;
lowp vec4 u_xlat10_5;
vec3 u_xlat6;
lowp vec4 u_xlat10_6;
vec3 u_xlat7;
lowp vec4 u_xlat10_7;
vec3 u_xlat8;
bvec3 u_xlatb8;
vec3 u_xlat9;
bvec3 u_xlatb10;
vec3 u_xlat11;
float u_xlat15;
float u_xlat33;
float u_xlat34;
mediump float u_xlat16_34;
float u_xlat35;
mediump float u_xlat16_35;
bool u_xlatb35;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat0.x = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0u)) ? 1.0 : -1.0;
    u_xlat11.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat11.x = inversesqrt(u_xlat11.x);
    u_xlat11.xyz = u_xlat11.xxx * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat11.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_3 = texture(_NormalMap, u_xlat3.xy);
    u_xlat4.xy = u_xlat10_3.wy + u_xlat10_3.wy;
    u_xlat16_3.xy = u_xlat10_3.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_34 = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_34 = min(u_xlat16_34, 1.0);
    u_xlat16_34 = (-u_xlat16_34) + 1.0;
    u_xlat4.z = sqrt(u_xlat16_34);
    u_xlat3.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = vec3(_NormalIntensity) * u_xlat3.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat4.xyz = u_xlat3.yyy * vs_TEXCOORD6.xyz;
    u_xlat3.xyw = u_xlat3.xxx * vs_TEXCOORD5.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat3.zzz * u_xlat0.xyz + u_xlat3.xyw;
    u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat34);
    u_xlat0.x = dot((-u_xlat2.xyz), u_xlat3.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat3.xyz * (-u_xlat0.xxx) + (-u_xlat2.xyz);
    u_xlat34 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat2.xyz = vec3(u_xlat34) * _WorldSpaceLightPos0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat33) + u_xlat2.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = _Gloss * 10.0 + 1.0;
    u_xlat33 = exp2(u_xlat33);
    u_xlat34 = (-_Gloss) + 1.0;
    u_xlatb35 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb35){
        u_xlatb35 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD3.yyy * hlslcc_mtx4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD3.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD3.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb35)) ? u_xlat4.xyz : vs_TEXCOORD3.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat35 = u_xlat4.y * 0.25;
        u_xlat15 = unity_ProbeVolumeParams.z * 0.5;
        u_xlat5.x = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat35 = max(u_xlat35, u_xlat15);
        u_xlat4.x = min(u_xlat5.x, u_xlat35);
        u_xlat10_5 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
        u_xlat6.xyz = u_xlat4.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_6 = texture(unity_ProbeVolumeSH, u_xlat6.xyz);
        u_xlat4.xyz = u_xlat4.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_4 = texture(unity_ProbeVolumeSH, u_xlat4.xyz);
        u_xlat3.w = 1.0;
        u_xlat5.x = dot(u_xlat10_5, u_xlat3);
        u_xlat5.y = dot(u_xlat10_6, u_xlat3);
        u_xlat5.z = dot(u_xlat10_4, u_xlat3);
    } else {
        u_xlat3.w = 1.0;
        u_xlat5.x = dot(unity_SHAr, u_xlat3);
        u_xlat5.y = dot(unity_SHAg, u_xlat3);
        u_xlat5.z = dot(unity_SHAb, u_xlat3);
    //ENDIF
    }
    u_xlat4.xyz = u_xlat5.xyz + vs_TEXCOORD8.xyz;
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb35 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat5.xyz = log2(u_xlat4.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = (bool(u_xlatb35)) ? u_xlat5.xyz : u_xlat4.xyz;
    u_xlatb35 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb35){
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat5.xyz = u_xlat0.xyz * vec3(u_xlat35);
        u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
        u_xlat7.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
        u_xlat6.x = (u_xlatb8.x) ? u_xlat6.x : u_xlat7.x;
        u_xlat6.y = (u_xlatb8.y) ? u_xlat6.y : u_xlat7.y;
        u_xlat6.z = (u_xlatb8.z) ? u_xlat6.z : u_xlat7.z;
        u_xlat35 = min(u_xlat6.y, u_xlat6.x);
        u_xlat35 = min(u_xlat6.z, u_xlat35);
        u_xlat6.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat35) + u_xlat6.xyz;
    } else {
        u_xlat5.xyz = u_xlat0.xyz;
    //ENDIF
    }
    u_xlat35 = (-u_xlat34) * 0.699999988 + 1.70000005;
    u_xlat34 = u_xlat34 * u_xlat35;
    u_xlat34 = u_xlat34 * 6.0;
    u_xlat10_5 = textureLod(unity_SpecCube0, u_xlat5.xyz, u_xlat34);
    u_xlat16_35 = log2(u_xlat10_5.w);
    u_xlat35 = u_xlat16_35 * unity_SpecCube0_HDR.y;
    u_xlat35 = exp2(u_xlat35);
    u_xlat35 = u_xlat35 * unity_SpecCube0_HDR.x;
    u_xlat6.xyz = u_xlat10_5.xyz * vec3(u_xlat35);
    u_xlatb36 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb36){
        u_xlatb36 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb36){
            u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
            u_xlat36 = inversesqrt(u_xlat36);
            u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat36);
            u_xlat8.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
            u_xlat9.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
            u_xlat8.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
            u_xlat8.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
            u_xlat8.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
            u_xlat36 = min(u_xlat8.y, u_xlat8.x);
            u_xlat36 = min(u_xlat8.z, u_xlat36);
            u_xlat8.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat0.xyz = u_xlat7.xyz * vec3(u_xlat36) + u_xlat8.xyz;
        //ENDIF
        }
        u_xlat10_7 = textureLod(unity_SpecCube1, u_xlat0.xyz, u_xlat34);
        u_xlat16_0 = log2(u_xlat10_7.w);
        u_xlat0.x = u_xlat16_0 * unity_SpecCube1_HDR.y;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * unity_SpecCube1_HDR.x;
        u_xlat0.xyz = u_xlat10_7.xyz * u_xlat0.xxx;
        u_xlat5.xyz = vec3(u_xlat35) * u_xlat10_5.xyz + (-u_xlat0.xyz);
        u_xlat6.xyz = unity_SpecCube0_BoxMin.www * u_xlat5.xyz + u_xlat0.xyz;
    //ENDIF
    }
    u_xlat0.xy = vs_TEXCOORD0.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
    u_xlat10_5 = texture(_SpecularMap, u_xlat0.xy);
    u_xlat0.xyz = u_xlat10_5.xyz * vec3(_SpecIntensity);
    u_xlat0.xyz = u_xlat0.xyz * _Speccolor.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat33 = u_xlat33 * u_xlat1.x;
    u_xlat33 = exp2(u_xlat33);
    u_xlat1.xyz = u_xlat0.xyz * u_xlat6.xyz;
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat33 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat33 = max(u_xlat33, 0.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _DiffuseMapTransA_ST.xy + _DiffuseMapTransA_ST.zw;
    u_xlat10_1 = texture(_DiffuseMapTransA, u_xlat1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * _Diffusecolor.xyz;
    u_xlat2.xyz = vec3(u_xlat33) * _LightColor0.xyz + u_xlat4.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_1.w * _Transparency;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 122 math, 8 textures, 14 branches
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"#version 120

#ifdef VERTEX

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
attribute vec4 TANGENT;
varying vec2 xlv_TEXCOORD0;
varying vec2 xlv_TEXCOORD1;
varying vec2 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec4 xlv_TEXCOORD8;
void main ()
{
  vec4 v_1;
  v_1.x = unity_WorldToObject[0].x;
  v_1.y = unity_WorldToObject[1].x;
  v_1.z = unity_WorldToObject[2].x;
  v_1.w = unity_WorldToObject[3].x;
  vec4 v_2;
  v_2.x = unity_WorldToObject[0].y;
  v_2.y = unity_WorldToObject[1].y;
  v_2.z = unity_WorldToObject[2].y;
  v_2.w = unity_WorldToObject[3].y;
  vec4 v_3;
  v_3.x = unity_WorldToObject[0].z;
  v_3.y = unity_WorldToObject[1].z;
  v_3.z = unity_WorldToObject[2].z;
  v_3.w = unity_WorldToObject[3].z;
  vec3 tmpvar_4;
  tmpvar_4 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = TANGENT.xyz;
  vec3 tmpvar_6;
  tmpvar_6 = normalize((unity_ObjectToWorld * tmpvar_5).xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = gl_MultiTexCoord0.xy;
  xlv_TEXCOORD1 = gl_MultiTexCoord1.xy;
  xlv_TEXCOORD2 = gl_MultiTexCoord2.xy;
  xlv_TEXCOORD3 = (unity_ObjectToWorld * gl_Vertex);
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * TANGENT.w));
  xlv_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform samplerCube unity_SpecCube0;
uniform samplerCube unity_SpecCube1;
uniform vec4 unity_SpecCube0_BoxMax;
uniform vec4 unity_SpecCube0_BoxMin;
uniform vec4 unity_SpecCube0_ProbePosition;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_SpecCube1_BoxMax;
uniform vec4 unity_SpecCube1_BoxMin;
uniform vec4 unity_SpecCube1_ProbePosition;
uniform vec4 unity_SpecCube1_HDR;
uniform sampler3D unity_ProbeVolumeSH;
uniform vec4 unity_ProbeVolumeParams;
uniform mat4 unity_ProbeVolumeWorldToObject;
uniform vec3 unity_ProbeVolumeSizeInv;
uniform vec3 unity_ProbeVolumeMin;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _LightColor0;
uniform sampler2D _DiffuseMapTransA;
uniform vec4 _DiffuseMapTransA_ST;
uniform vec4 _Diffusecolor;
uniform sampler2D _NormalMap;
uniform vec4 _NormalMap_ST;
uniform float _NormalIntensity;
uniform sampler2D _SpecularMap;
uniform vec4 _SpecularMap_ST;
uniform vec4 _Speccolor;
uniform float _SpecIntensity;
uniform float _Gloss;
uniform float _Transparency;
varying vec2 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec4 xlv_TEXCOORD8;
void main ()
{
  float tmpvar_1;
  if (gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD4;
  float tmpvar_3;
  vec3 tmpvar_4;
  int tmpvar_5;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_5 = 1;
  } else {
    tmpvar_5 = -1;
  };
  tmpvar_2 = (normalize(xlv_TEXCOORD4) * float(tmpvar_5));
  mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD5.x;
  tmpvar_6[0].y = xlv_TEXCOORD6.x;
  tmpvar_6[0].z = tmpvar_2.x;
  tmpvar_6[1].x = xlv_TEXCOORD5.y;
  tmpvar_6[1].y = xlv_TEXCOORD6.y;
  tmpvar_6[1].z = tmpvar_2.y;
  tmpvar_6[2].x = xlv_TEXCOORD5.z;
  tmpvar_6[2].y = xlv_TEXCOORD6.z;
  tmpvar_6[2].z = tmpvar_2.z;
  vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3.xyz));
  vec3 normal_8;
  normal_8.xy = ((texture2D (_NormalMap, (
    (xlv_TEXCOORD0 * _NormalMap_ST.xy)
   + _NormalMap_ST.zw)).wy * 2.0) - 1.0);
  normal_8.z = sqrt((1.0 - clamp (
    dot (normal_8.xy, normal_8.xy)
  , 0.0, 1.0)));
  vec3 tmpvar_9;
  tmpvar_9 = normalize((mix (vec3(0.0, 0.0, 1.0), normal_8, vec3(_NormalIntensity)) * tmpvar_6));
  vec3 tmpvar_10;
  vec3 I_11;
  I_11 = -(tmpvar_7);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_7 + tmpvar_12));
  float tmpvar_14;
  tmpvar_14 = exp2(((_Gloss * 10.0) + 1.0));
  tmpvar_4 = xlv_TEXCOORD3.xyz;
  tmpvar_3 = (1.0 - _Gloss);
  vec3 ambient_15;
  ambient_15 = xlv_TEXCOORD8.xyz;
  vec3 ambient_contrib_16;
  ambient_contrib_16 = vec3(0.0, 0.0, 0.0);
  if ((unity_ProbeVolumeParams.x == 1.0)) {
    vec4 tmpvar_17;
    tmpvar_17.w = 1.0;
    tmpvar_17.xyz = tmpvar_9;
    vec3 x1_18;
    vec3 texCoord_19;
    vec3 tmpvar_20;
    if ((unity_ProbeVolumeParams.y == 1.0)) {
      vec4 tmpvar_21;
      tmpvar_21.w = 1.0;
      tmpvar_21.xyz = tmpvar_4;
      tmpvar_20 = (unity_ProbeVolumeWorldToObject * tmpvar_21).xyz;
    } else {
      tmpvar_20 = tmpvar_4;
    };
    vec3 tmpvar_22;
    tmpvar_22 = ((tmpvar_20 - unity_ProbeVolumeMin) * unity_ProbeVolumeSizeInv);
    texCoord_19.yz = tmpvar_22.yz;
    texCoord_19.x = (tmpvar_22.x * 0.25);
    float tmpvar_23;
    float tmpvar_24;
    tmpvar_24 = (0.5 * unity_ProbeVolumeParams.z);
    tmpvar_23 = clamp (texCoord_19.x, tmpvar_24, (0.25 - tmpvar_24));
    texCoord_19.x = tmpvar_23;
    vec4 tmpvar_25;
    tmpvar_25 = texture3D (unity_ProbeVolumeSH, texCoord_19);
    texCoord_19.x = (tmpvar_23 + 0.25);
    vec4 tmpvar_26;
    tmpvar_26 = texture3D (unity_ProbeVolumeSH, texCoord_19);
    texCoord_19.x = (tmpvar_23 + 0.5);
    x1_18.x = dot (tmpvar_25, tmpvar_17);
    x1_18.y = dot (tmpvar_26, tmpvar_17);
    x1_18.z = dot (texture3D (unity_ProbeVolumeSH, texCoord_19), tmpvar_17);
    ambient_contrib_16 = x1_18;
  } else {
    vec4 tmpvar_27;
    tmpvar_27.w = 1.0;
    tmpvar_27.xyz = tmpvar_9;
    vec3 x_28;
    x_28.x = dot (unity_SHAr, tmpvar_27);
    x_28.y = dot (unity_SHAg, tmpvar_27);
    x_28.z = dot (unity_SHAb, tmpvar_27);
    ambient_contrib_16 = x_28;
  };
  vec3 tmpvar_29;
  tmpvar_29 = max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD8.xyz + ambient_contrib_16));
  ambient_15 = tmpvar_29;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_15 = max (((1.055 * 
      pow (max (tmpvar_29, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0));
  };
  vec3 specular_30;
  vec3 worldRefl_31;
  worldRefl_31 = tmpvar_10;
  vec3 worldPos_32;
  worldPos_32 = tmpvar_4;
  if ((unity_SpecCube0_ProbePosition.w > 0.0)) {
    vec3 tmpvar_33;
    tmpvar_33 = normalize(tmpvar_10);
    vec3 tmpvar_34;
    tmpvar_34 = ((unity_SpecCube0_BoxMax.xyz - xlv_TEXCOORD3.xyz) / tmpvar_33);
    vec3 tmpvar_35;
    tmpvar_35 = ((unity_SpecCube0_BoxMin.xyz - xlv_TEXCOORD3.xyz) / tmpvar_33);
    bvec3 tmpvar_36;
    tmpvar_36 = greaterThan (tmpvar_33, vec3(0.0, 0.0, 0.0));
    float tmpvar_37;
    if (tmpvar_36.x) {
      tmpvar_37 = tmpvar_34.x;
    } else {
      tmpvar_37 = tmpvar_35.x;
    };
    float tmpvar_38;
    if (tmpvar_36.y) {
      tmpvar_38 = tmpvar_34.y;
    } else {
      tmpvar_38 = tmpvar_35.y;
    };
    float tmpvar_39;
    if (tmpvar_36.z) {
      tmpvar_39 = tmpvar_34.z;
    } else {
      tmpvar_39 = tmpvar_35.z;
    };
    worldPos_32 = (xlv_TEXCOORD3.xyz - unity_SpecCube0_ProbePosition.xyz);
    worldRefl_31 = (worldPos_32 + (tmpvar_33 * min (
      min (tmpvar_37, tmpvar_38)
    , tmpvar_39)));
  };
  vec4 tmpvar_40;
  tmpvar_40.xyz = worldRefl_31;
  tmpvar_40.w = ((tmpvar_3 * (1.7 - 
    (0.7 * tmpvar_3)
  )) * 6.0);
  vec4 tmpvar_41;
  tmpvar_41 = textureCubeLod (unity_SpecCube0, worldRefl_31, tmpvar_40.w);
  vec3 tmpvar_42;
  tmpvar_42 = ((unity_SpecCube0_HDR.x * pow (tmpvar_41.w, unity_SpecCube0_HDR.y)) * tmpvar_41.xyz);
  if ((unity_SpecCube0_BoxMin.w < 0.99999)) {
    vec3 worldRefl_43;
    worldRefl_43 = tmpvar_10;
    vec3 worldPos_44;
    worldPos_44 = tmpvar_4;
    if ((unity_SpecCube1_ProbePosition.w > 0.0)) {
      vec3 tmpvar_45;
      tmpvar_45 = normalize(tmpvar_10);
      vec3 tmpvar_46;
      tmpvar_46 = ((unity_SpecCube1_BoxMax.xyz - xlv_TEXCOORD3.xyz) / tmpvar_45);
      vec3 tmpvar_47;
      tmpvar_47 = ((unity_SpecCube1_BoxMin.xyz - xlv_TEXCOORD3.xyz) / tmpvar_45);
      bvec3 tmpvar_48;
      tmpvar_48 = greaterThan (tmpvar_45, vec3(0.0, 0.0, 0.0));
      float tmpvar_49;
      if (tmpvar_48.x) {
        tmpvar_49 = tmpvar_46.x;
      } else {
        tmpvar_49 = tmpvar_47.x;
      };
      float tmpvar_50;
      if (tmpvar_48.y) {
        tmpvar_50 = tmpvar_46.y;
      } else {
        tmpvar_50 = tmpvar_47.y;
      };
      float tmpvar_51;
      if (tmpvar_48.z) {
        tmpvar_51 = tmpvar_46.z;
      } else {
        tmpvar_51 = tmpvar_47.z;
      };
      worldPos_44 = (xlv_TEXCOORD3.xyz - unity_SpecCube1_ProbePosition.xyz);
      worldRefl_43 = (worldPos_44 + (tmpvar_45 * min (
        min (tmpvar_49, tmpvar_50)
      , tmpvar_51)));
    };
    vec4 tmpvar_52;
    tmpvar_52.xyz = worldRefl_43;
    tmpvar_52.w = ((tmpvar_3 * (1.7 - 
      (0.7 * tmpvar_3)
    )) * 6.0);
    vec4 tmpvar_53;
    tmpvar_53 = textureCubeLod (unity_SpecCube1, worldRefl_43, tmpvar_52.w);
    specular_30 = mix (((unity_SpecCube1_HDR.x * 
      pow (tmpvar_53.w, unity_SpecCube1_HDR.y)
    ) * tmpvar_53.xyz), tmpvar_42, unity_SpecCube0_BoxMin.www);
  } else {
    specular_30 = tmpvar_42;
  };
  vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_SpecularMap, (
    (xlv_TEXCOORD0 * _SpecularMap_ST.xy)
   + _SpecularMap_ST.zw)).xyz * _SpecIntensity) * _Speccolor.xyz);
  vec4 tmpvar_55;
  tmpvar_55 = texture2D (_DiffuseMapTransA, ((xlv_TEXCOORD0 * _DiffuseMapTransA_ST.xy) + _DiffuseMapTransA_ST.zw));
  vec4 tmpvar_56;
  tmpvar_56.xyz = (((
    (max (0.0, dot (tmpvar_9, tmpvar_12)) * _LightColor0.xyz)
   + ambient_15) * (tmpvar_55.xyz * _Diffusecolor.xyz)) + ((
    pow (max (0.0, dot (tmpvar_13, tmpvar_9)), tmpvar_14)
   * tmpvar_54) + (specular_30 * tmpvar_54)));
  tmpvar_56.w = (tmpvar_55.w * _Transparency);
  gl_FragData[0] = tmpvar_56;
}


#endif
"
}
SubProgram "metal " {
// Stats: 17 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
Bind "texcoord2" ATTR5
ConstBuffer "$Globals" 192
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [unity_ObjectToWorld]
Matrix 128 [unity_WorldToObject]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
  float4 _glesMultiTexCoord2 [[attribute(5)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float4 xlv_TEXCOORD8;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4x4 unity_ObjectToWorld;
  float4x4 unity_WorldToObject;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 v_1 = 0;
  v_1.x = _mtl_u.unity_WorldToObject[0].x;
  v_1.y = _mtl_u.unity_WorldToObject[1].x;
  v_1.z = _mtl_u.unity_WorldToObject[2].x;
  v_1.w = _mtl_u.unity_WorldToObject[3].x;
  float4 v_2 = 0;
  v_2.x = _mtl_u.unity_WorldToObject[0].y;
  v_2.y = _mtl_u.unity_WorldToObject[1].y;
  v_2.z = _mtl_u.unity_WorldToObject[2].y;
  v_2.w = _mtl_u.unity_WorldToObject[3].y;
  float4 v_3 = 0;
  v_3.x = _mtl_u.unity_WorldToObject[0].z;
  v_3.y = _mtl_u.unity_WorldToObject[1].z;
  v_3.z = _mtl_u.unity_WorldToObject[2].z;
  v_3.w = _mtl_u.unity_WorldToObject[3].z;
  float3 tmpvar_4 = 0;
  tmpvar_4 = normalize(((
    (v_1.xyz * _mtl_i._glesNormal.x)
   + 
    (v_2.xyz * _mtl_i._glesNormal.y)
  ) + (v_3.xyz * _mtl_i._glesNormal.z)));
  float4 tmpvar_5 = 0;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _mtl_i._glesTANGENT.xyz;
  float3 tmpvar_6 = 0;
  tmpvar_6 = normalize((_mtl_u.unity_ObjectToWorld * tmpvar_5).xyz);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = _mtl_i._glesMultiTexCoord0.xy;
  _mtl_o.xlv_TEXCOORD1 = _mtl_i._glesMultiTexCoord1.xy;
  _mtl_o.xlv_TEXCOORD2 = _mtl_i._glesMultiTexCoord2.xy;
  _mtl_o.xlv_TEXCOORD3 = (_mtl_u.unity_ObjectToWorld * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD4 = tmpvar_4;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * _mtl_i._glesTANGENT.w));
  _mtl_o.xlv_TEXCOORD8 = float4(0.0, 0.0, 0.0, 0.0);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec2 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD3 = hlslcc_mtx4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD6.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DiffuseMapTransA_ST;
uniform 	vec4 _Diffusecolor;
uniform 	vec4 _NormalMap_ST;
uniform 	float _NormalIntensity;
uniform 	vec4 _SpecularMap_ST;
uniform 	vec4 _Speccolor;
uniform 	float _SpecIntensity;
uniform 	float _Gloss;
uniform 	float _Transparency;
uniform  sampler2D _NormalMap;
uniform  sampler2D _SpecularMap;
uniform  sampler2D _DiffuseMapTransA;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
in  vec4 vs_TEXCOORD8;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat5;
lowp vec4 u_xlat10_5;
vec3 u_xlat6;
lowp vec4 u_xlat10_6;
vec3 u_xlat7;
lowp vec4 u_xlat10_7;
vec3 u_xlat8;
bvec3 u_xlatb8;
vec3 u_xlat9;
bvec3 u_xlatb10;
vec3 u_xlat11;
float u_xlat15;
float u_xlat33;
float u_xlat34;
mediump float u_xlat16_34;
float u_xlat35;
mediump float u_xlat16_35;
bool u_xlatb35;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat0.x = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0u)) ? 1.0 : -1.0;
    u_xlat11.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat11.x = inversesqrt(u_xlat11.x);
    u_xlat11.xyz = u_xlat11.xxx * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat11.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_3 = texture(_NormalMap, u_xlat3.xy);
    u_xlat4.xy = u_xlat10_3.wy + u_xlat10_3.wy;
    u_xlat16_3.xy = u_xlat10_3.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_34 = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_34 = min(u_xlat16_34, 1.0);
    u_xlat16_34 = (-u_xlat16_34) + 1.0;
    u_xlat4.z = sqrt(u_xlat16_34);
    u_xlat3.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = vec3(_NormalIntensity) * u_xlat3.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat4.xyz = u_xlat3.yyy * vs_TEXCOORD6.xyz;
    u_xlat3.xyw = u_xlat3.xxx * vs_TEXCOORD5.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat3.zzz * u_xlat0.xyz + u_xlat3.xyw;
    u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat34);
    u_xlat0.x = dot((-u_xlat2.xyz), u_xlat3.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat3.xyz * (-u_xlat0.xxx) + (-u_xlat2.xyz);
    u_xlat34 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat2.xyz = vec3(u_xlat34) * _WorldSpaceLightPos0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat33) + u_xlat2.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = _Gloss * 10.0 + 1.0;
    u_xlat33 = exp2(u_xlat33);
    u_xlat34 = (-_Gloss) + 1.0;
    u_xlatb35 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb35){
        u_xlatb35 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD3.yyy * hlslcc_mtx4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD3.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD3.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb35)) ? u_xlat4.xyz : vs_TEXCOORD3.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat35 = u_xlat4.y * 0.25;
        u_xlat15 = unity_ProbeVolumeParams.z * 0.5;
        u_xlat5.x = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat35 = max(u_xlat35, u_xlat15);
        u_xlat4.x = min(u_xlat5.x, u_xlat35);
        u_xlat10_5 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
        u_xlat6.xyz = u_xlat4.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_6 = texture(unity_ProbeVolumeSH, u_xlat6.xyz);
        u_xlat4.xyz = u_xlat4.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_4 = texture(unity_ProbeVolumeSH, u_xlat4.xyz);
        u_xlat3.w = 1.0;
        u_xlat5.x = dot(u_xlat10_5, u_xlat3);
        u_xlat5.y = dot(u_xlat10_6, u_xlat3);
        u_xlat5.z = dot(u_xlat10_4, u_xlat3);
    } else {
        u_xlat3.w = 1.0;
        u_xlat5.x = dot(unity_SHAr, u_xlat3);
        u_xlat5.y = dot(unity_SHAg, u_xlat3);
        u_xlat5.z = dot(unity_SHAb, u_xlat3);
    //ENDIF
    }
    u_xlat4.xyz = u_xlat5.xyz + vs_TEXCOORD8.xyz;
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb35 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat5.xyz = log2(u_xlat4.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = (bool(u_xlatb35)) ? u_xlat5.xyz : u_xlat4.xyz;
    u_xlatb35 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb35){
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat5.xyz = u_xlat0.xyz * vec3(u_xlat35);
        u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
        u_xlat7.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
        u_xlat6.x = (u_xlatb8.x) ? u_xlat6.x : u_xlat7.x;
        u_xlat6.y = (u_xlatb8.y) ? u_xlat6.y : u_xlat7.y;
        u_xlat6.z = (u_xlatb8.z) ? u_xlat6.z : u_xlat7.z;
        u_xlat35 = min(u_xlat6.y, u_xlat6.x);
        u_xlat35 = min(u_xlat6.z, u_xlat35);
        u_xlat6.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat35) + u_xlat6.xyz;
    } else {
        u_xlat5.xyz = u_xlat0.xyz;
    //ENDIF
    }
    u_xlat35 = (-u_xlat34) * 0.699999988 + 1.70000005;
    u_xlat34 = u_xlat34 * u_xlat35;
    u_xlat34 = u_xlat34 * 6.0;
    u_xlat10_5 = textureLod(unity_SpecCube0, u_xlat5.xyz, u_xlat34);
    u_xlat16_35 = log2(u_xlat10_5.w);
    u_xlat35 = u_xlat16_35 * unity_SpecCube0_HDR.y;
    u_xlat35 = exp2(u_xlat35);
    u_xlat35 = u_xlat35 * unity_SpecCube0_HDR.x;
    u_xlat6.xyz = u_xlat10_5.xyz * vec3(u_xlat35);
    u_xlatb36 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb36){
        u_xlatb36 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb36){
            u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
            u_xlat36 = inversesqrt(u_xlat36);
            u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat36);
            u_xlat8.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
            u_xlat9.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
            u_xlat8.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
            u_xlat8.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
            u_xlat8.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
            u_xlat36 = min(u_xlat8.y, u_xlat8.x);
            u_xlat36 = min(u_xlat8.z, u_xlat36);
            u_xlat8.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat0.xyz = u_xlat7.xyz * vec3(u_xlat36) + u_xlat8.xyz;
        //ENDIF
        }
        u_xlat10_7 = textureLod(unity_SpecCube1, u_xlat0.xyz, u_xlat34);
        u_xlat16_0 = log2(u_xlat10_7.w);
        u_xlat0.x = u_xlat16_0 * unity_SpecCube1_HDR.y;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * unity_SpecCube1_HDR.x;
        u_xlat0.xyz = u_xlat10_7.xyz * u_xlat0.xxx;
        u_xlat5.xyz = vec3(u_xlat35) * u_xlat10_5.xyz + (-u_xlat0.xyz);
        u_xlat6.xyz = unity_SpecCube0_BoxMin.www * u_xlat5.xyz + u_xlat0.xyz;
    //ENDIF
    }
    u_xlat0.xy = vs_TEXCOORD0.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
    u_xlat10_5 = texture(_SpecularMap, u_xlat0.xy);
    u_xlat0.xyz = u_xlat10_5.xyz * vec3(_SpecIntensity);
    u_xlat0.xyz = u_xlat0.xyz * _Speccolor.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat33 = u_xlat33 * u_xlat1.x;
    u_xlat33 = exp2(u_xlat33);
    u_xlat1.xyz = u_xlat0.xyz * u_xlat6.xyz;
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat33 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat33 = max(u_xlat33, 0.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _DiffuseMapTransA_ST.xy + _DiffuseMapTransA_ST.zw;
    u_xlat10_1 = texture(_DiffuseMapTransA, u_xlat1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * _Diffusecolor.xyz;
    u_xlat2.xyz = vec3(u_xlat33) * _LightColor0.xyz + u_xlat4.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_1.w * _Transparency;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 122 math, 8 textures, 14 branches
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#version 120

#ifdef VERTEX

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
attribute vec4 TANGENT;
varying vec2 xlv_TEXCOORD0;
varying vec2 xlv_TEXCOORD1;
varying vec2 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec4 xlv_TEXCOORD8;
void main ()
{
  vec4 v_1;
  v_1.x = unity_WorldToObject[0].x;
  v_1.y = unity_WorldToObject[1].x;
  v_1.z = unity_WorldToObject[2].x;
  v_1.w = unity_WorldToObject[3].x;
  vec4 v_2;
  v_2.x = unity_WorldToObject[0].y;
  v_2.y = unity_WorldToObject[1].y;
  v_2.z = unity_WorldToObject[2].y;
  v_2.w = unity_WorldToObject[3].y;
  vec4 v_3;
  v_3.x = unity_WorldToObject[0].z;
  v_3.y = unity_WorldToObject[1].z;
  v_3.z = unity_WorldToObject[2].z;
  v_3.w = unity_WorldToObject[3].z;
  vec3 tmpvar_4;
  tmpvar_4 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = TANGENT.xyz;
  vec3 tmpvar_6;
  tmpvar_6 = normalize((unity_ObjectToWorld * tmpvar_5).xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = gl_MultiTexCoord0.xy;
  xlv_TEXCOORD1 = gl_MultiTexCoord1.xy;
  xlv_TEXCOORD2 = gl_MultiTexCoord2.xy;
  xlv_TEXCOORD3 = (unity_ObjectToWorld * gl_Vertex);
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * TANGENT.w));
  xlv_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform samplerCube unity_SpecCube0;
uniform samplerCube unity_SpecCube1;
uniform vec4 unity_SpecCube0_BoxMax;
uniform vec4 unity_SpecCube0_BoxMin;
uniform vec4 unity_SpecCube0_ProbePosition;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_SpecCube1_BoxMax;
uniform vec4 unity_SpecCube1_BoxMin;
uniform vec4 unity_SpecCube1_ProbePosition;
uniform vec4 unity_SpecCube1_HDR;
uniform sampler3D unity_ProbeVolumeSH;
uniform vec4 unity_ProbeVolumeParams;
uniform mat4 unity_ProbeVolumeWorldToObject;
uniform vec3 unity_ProbeVolumeSizeInv;
uniform vec3 unity_ProbeVolumeMin;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _LightColor0;
uniform sampler2D _DiffuseMapTransA;
uniform vec4 _DiffuseMapTransA_ST;
uniform vec4 _Diffusecolor;
uniform sampler2D _NormalMap;
uniform vec4 _NormalMap_ST;
uniform float _NormalIntensity;
uniform sampler2D _SpecularMap;
uniform vec4 _SpecularMap_ST;
uniform vec4 _Speccolor;
uniform float _SpecIntensity;
uniform float _Gloss;
uniform float _Transparency;
varying vec2 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec4 xlv_TEXCOORD8;
void main ()
{
  float tmpvar_1;
  if (gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD4;
  float tmpvar_3;
  vec3 tmpvar_4;
  int tmpvar_5;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_5 = 1;
  } else {
    tmpvar_5 = -1;
  };
  tmpvar_2 = (normalize(xlv_TEXCOORD4) * float(tmpvar_5));
  mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD5.x;
  tmpvar_6[0].y = xlv_TEXCOORD6.x;
  tmpvar_6[0].z = tmpvar_2.x;
  tmpvar_6[1].x = xlv_TEXCOORD5.y;
  tmpvar_6[1].y = xlv_TEXCOORD6.y;
  tmpvar_6[1].z = tmpvar_2.y;
  tmpvar_6[2].x = xlv_TEXCOORD5.z;
  tmpvar_6[2].y = xlv_TEXCOORD6.z;
  tmpvar_6[2].z = tmpvar_2.z;
  vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3.xyz));
  vec3 normal_8;
  normal_8.xy = ((texture2D (_NormalMap, (
    (xlv_TEXCOORD0 * _NormalMap_ST.xy)
   + _NormalMap_ST.zw)).wy * 2.0) - 1.0);
  normal_8.z = sqrt((1.0 - clamp (
    dot (normal_8.xy, normal_8.xy)
  , 0.0, 1.0)));
  vec3 tmpvar_9;
  tmpvar_9 = normalize((mix (vec3(0.0, 0.0, 1.0), normal_8, vec3(_NormalIntensity)) * tmpvar_6));
  vec3 tmpvar_10;
  vec3 I_11;
  I_11 = -(tmpvar_7);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_7 + tmpvar_12));
  float tmpvar_14;
  tmpvar_14 = exp2(((_Gloss * 10.0) + 1.0));
  tmpvar_4 = xlv_TEXCOORD3.xyz;
  tmpvar_3 = (1.0 - _Gloss);
  vec3 ambient_15;
  ambient_15 = xlv_TEXCOORD8.xyz;
  vec3 ambient_contrib_16;
  ambient_contrib_16 = vec3(0.0, 0.0, 0.0);
  if ((unity_ProbeVolumeParams.x == 1.0)) {
    vec4 tmpvar_17;
    tmpvar_17.w = 1.0;
    tmpvar_17.xyz = tmpvar_9;
    vec3 x1_18;
    vec3 texCoord_19;
    vec3 tmpvar_20;
    if ((unity_ProbeVolumeParams.y == 1.0)) {
      vec4 tmpvar_21;
      tmpvar_21.w = 1.0;
      tmpvar_21.xyz = tmpvar_4;
      tmpvar_20 = (unity_ProbeVolumeWorldToObject * tmpvar_21).xyz;
    } else {
      tmpvar_20 = tmpvar_4;
    };
    vec3 tmpvar_22;
    tmpvar_22 = ((tmpvar_20 - unity_ProbeVolumeMin) * unity_ProbeVolumeSizeInv);
    texCoord_19.yz = tmpvar_22.yz;
    texCoord_19.x = (tmpvar_22.x * 0.25);
    float tmpvar_23;
    float tmpvar_24;
    tmpvar_24 = (0.5 * unity_ProbeVolumeParams.z);
    tmpvar_23 = clamp (texCoord_19.x, tmpvar_24, (0.25 - tmpvar_24));
    texCoord_19.x = tmpvar_23;
    vec4 tmpvar_25;
    tmpvar_25 = texture3D (unity_ProbeVolumeSH, texCoord_19);
    texCoord_19.x = (tmpvar_23 + 0.25);
    vec4 tmpvar_26;
    tmpvar_26 = texture3D (unity_ProbeVolumeSH, texCoord_19);
    texCoord_19.x = (tmpvar_23 + 0.5);
    x1_18.x = dot (tmpvar_25, tmpvar_17);
    x1_18.y = dot (tmpvar_26, tmpvar_17);
    x1_18.z = dot (texture3D (unity_ProbeVolumeSH, texCoord_19), tmpvar_17);
    ambient_contrib_16 = x1_18;
  } else {
    vec4 tmpvar_27;
    tmpvar_27.w = 1.0;
    tmpvar_27.xyz = tmpvar_9;
    vec3 x_28;
    x_28.x = dot (unity_SHAr, tmpvar_27);
    x_28.y = dot (unity_SHAg, tmpvar_27);
    x_28.z = dot (unity_SHAb, tmpvar_27);
    ambient_contrib_16 = x_28;
  };
  vec3 tmpvar_29;
  tmpvar_29 = max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD8.xyz + ambient_contrib_16));
  ambient_15 = tmpvar_29;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_15 = max (((1.055 * 
      pow (max (tmpvar_29, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0));
  };
  vec3 specular_30;
  vec3 worldRefl_31;
  worldRefl_31 = tmpvar_10;
  vec3 worldPos_32;
  worldPos_32 = tmpvar_4;
  if ((unity_SpecCube0_ProbePosition.w > 0.0)) {
    vec3 tmpvar_33;
    tmpvar_33 = normalize(tmpvar_10);
    vec3 tmpvar_34;
    tmpvar_34 = ((unity_SpecCube0_BoxMax.xyz - xlv_TEXCOORD3.xyz) / tmpvar_33);
    vec3 tmpvar_35;
    tmpvar_35 = ((unity_SpecCube0_BoxMin.xyz - xlv_TEXCOORD3.xyz) / tmpvar_33);
    bvec3 tmpvar_36;
    tmpvar_36 = greaterThan (tmpvar_33, vec3(0.0, 0.0, 0.0));
    float tmpvar_37;
    if (tmpvar_36.x) {
      tmpvar_37 = tmpvar_34.x;
    } else {
      tmpvar_37 = tmpvar_35.x;
    };
    float tmpvar_38;
    if (tmpvar_36.y) {
      tmpvar_38 = tmpvar_34.y;
    } else {
      tmpvar_38 = tmpvar_35.y;
    };
    float tmpvar_39;
    if (tmpvar_36.z) {
      tmpvar_39 = tmpvar_34.z;
    } else {
      tmpvar_39 = tmpvar_35.z;
    };
    worldPos_32 = (xlv_TEXCOORD3.xyz - unity_SpecCube0_ProbePosition.xyz);
    worldRefl_31 = (worldPos_32 + (tmpvar_33 * min (
      min (tmpvar_37, tmpvar_38)
    , tmpvar_39)));
  };
  vec4 tmpvar_40;
  tmpvar_40.xyz = worldRefl_31;
  tmpvar_40.w = ((tmpvar_3 * (1.7 - 
    (0.7 * tmpvar_3)
  )) * 6.0);
  vec4 tmpvar_41;
  tmpvar_41 = textureCubeLod (unity_SpecCube0, worldRefl_31, tmpvar_40.w);
  vec3 tmpvar_42;
  tmpvar_42 = ((unity_SpecCube0_HDR.x * pow (tmpvar_41.w, unity_SpecCube0_HDR.y)) * tmpvar_41.xyz);
  if ((unity_SpecCube0_BoxMin.w < 0.99999)) {
    vec3 worldRefl_43;
    worldRefl_43 = tmpvar_10;
    vec3 worldPos_44;
    worldPos_44 = tmpvar_4;
    if ((unity_SpecCube1_ProbePosition.w > 0.0)) {
      vec3 tmpvar_45;
      tmpvar_45 = normalize(tmpvar_10);
      vec3 tmpvar_46;
      tmpvar_46 = ((unity_SpecCube1_BoxMax.xyz - xlv_TEXCOORD3.xyz) / tmpvar_45);
      vec3 tmpvar_47;
      tmpvar_47 = ((unity_SpecCube1_BoxMin.xyz - xlv_TEXCOORD3.xyz) / tmpvar_45);
      bvec3 tmpvar_48;
      tmpvar_48 = greaterThan (tmpvar_45, vec3(0.0, 0.0, 0.0));
      float tmpvar_49;
      if (tmpvar_48.x) {
        tmpvar_49 = tmpvar_46.x;
      } else {
        tmpvar_49 = tmpvar_47.x;
      };
      float tmpvar_50;
      if (tmpvar_48.y) {
        tmpvar_50 = tmpvar_46.y;
      } else {
        tmpvar_50 = tmpvar_47.y;
      };
      float tmpvar_51;
      if (tmpvar_48.z) {
        tmpvar_51 = tmpvar_46.z;
      } else {
        tmpvar_51 = tmpvar_47.z;
      };
      worldPos_44 = (xlv_TEXCOORD3.xyz - unity_SpecCube1_ProbePosition.xyz);
      worldRefl_43 = (worldPos_44 + (tmpvar_45 * min (
        min (tmpvar_49, tmpvar_50)
      , tmpvar_51)));
    };
    vec4 tmpvar_52;
    tmpvar_52.xyz = worldRefl_43;
    tmpvar_52.w = ((tmpvar_3 * (1.7 - 
      (0.7 * tmpvar_3)
    )) * 6.0);
    vec4 tmpvar_53;
    tmpvar_53 = textureCubeLod (unity_SpecCube1, worldRefl_43, tmpvar_52.w);
    specular_30 = mix (((unity_SpecCube1_HDR.x * 
      pow (tmpvar_53.w, unity_SpecCube1_HDR.y)
    ) * tmpvar_53.xyz), tmpvar_42, unity_SpecCube0_BoxMin.www);
  } else {
    specular_30 = tmpvar_42;
  };
  vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_SpecularMap, (
    (xlv_TEXCOORD0 * _SpecularMap_ST.xy)
   + _SpecularMap_ST.zw)).xyz * _SpecIntensity) * _Speccolor.xyz);
  vec4 tmpvar_55;
  tmpvar_55 = texture2D (_DiffuseMapTransA, ((xlv_TEXCOORD0 * _DiffuseMapTransA_ST.xy) + _DiffuseMapTransA_ST.zw));
  vec4 tmpvar_56;
  tmpvar_56.xyz = (((
    (max (0.0, dot (tmpvar_9, tmpvar_12)) * _LightColor0.xyz)
   + ambient_15) * (tmpvar_55.xyz * _Diffusecolor.xyz)) + ((
    pow (max (0.0, dot (tmpvar_13, tmpvar_9)), tmpvar_14)
   * tmpvar_54) + (specular_30 * tmpvar_54)));
  tmpvar_56.w = (tmpvar_55.w * _Transparency);
  gl_FragData[0] = tmpvar_56;
}


#endif
"
}
SubProgram "metal " {
// Stats: 17 math
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
Bind "texcoord2" ATTR5
ConstBuffer "$Globals" 192
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [unity_ObjectToWorld]
Matrix 128 [unity_WorldToObject]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
  float4 _glesMultiTexCoord2 [[attribute(5)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float4 xlv_TEXCOORD8;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4x4 unity_ObjectToWorld;
  float4x4 unity_WorldToObject;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 v_1 = 0;
  v_1.x = _mtl_u.unity_WorldToObject[0].x;
  v_1.y = _mtl_u.unity_WorldToObject[1].x;
  v_1.z = _mtl_u.unity_WorldToObject[2].x;
  v_1.w = _mtl_u.unity_WorldToObject[3].x;
  float4 v_2 = 0;
  v_2.x = _mtl_u.unity_WorldToObject[0].y;
  v_2.y = _mtl_u.unity_WorldToObject[1].y;
  v_2.z = _mtl_u.unity_WorldToObject[2].y;
  v_2.w = _mtl_u.unity_WorldToObject[3].y;
  float4 v_3 = 0;
  v_3.x = _mtl_u.unity_WorldToObject[0].z;
  v_3.y = _mtl_u.unity_WorldToObject[1].z;
  v_3.z = _mtl_u.unity_WorldToObject[2].z;
  v_3.w = _mtl_u.unity_WorldToObject[3].z;
  float3 tmpvar_4 = 0;
  tmpvar_4 = normalize(((
    (v_1.xyz * _mtl_i._glesNormal.x)
   + 
    (v_2.xyz * _mtl_i._glesNormal.y)
  ) + (v_3.xyz * _mtl_i._glesNormal.z)));
  float4 tmpvar_5 = 0;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _mtl_i._glesTANGENT.xyz;
  float3 tmpvar_6 = 0;
  tmpvar_6 = normalize((_mtl_u.unity_ObjectToWorld * tmpvar_5).xyz);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = _mtl_i._glesMultiTexCoord0.xy;
  _mtl_o.xlv_TEXCOORD1 = _mtl_i._glesMultiTexCoord1.xy;
  _mtl_o.xlv_TEXCOORD2 = _mtl_i._glesMultiTexCoord2.xy;
  _mtl_o.xlv_TEXCOORD3 = (_mtl_u.unity_ObjectToWorld * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD4 = tmpvar_4;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * _mtl_i._glesTANGENT.w));
  _mtl_o.xlv_TEXCOORD8 = float4(0.0, 0.0, 0.0, 0.0);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec2 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD3 = hlslcc_mtx4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD6.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DiffuseMapTransA_ST;
uniform 	vec4 _Diffusecolor;
uniform 	vec4 _NormalMap_ST;
uniform 	float _NormalIntensity;
uniform 	vec4 _SpecularMap_ST;
uniform 	vec4 _Speccolor;
uniform 	float _SpecIntensity;
uniform 	float _Gloss;
uniform 	float _Transparency;
uniform  sampler2D _NormalMap;
uniform  sampler2D _SpecularMap;
uniform  sampler2D _DiffuseMapTransA;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
in  vec4 vs_TEXCOORD8;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat5;
lowp vec4 u_xlat10_5;
vec3 u_xlat6;
lowp vec4 u_xlat10_6;
vec3 u_xlat7;
lowp vec4 u_xlat10_7;
vec3 u_xlat8;
bvec3 u_xlatb8;
vec3 u_xlat9;
bvec3 u_xlatb10;
vec3 u_xlat11;
float u_xlat15;
float u_xlat33;
float u_xlat34;
mediump float u_xlat16_34;
float u_xlat35;
mediump float u_xlat16_35;
bool u_xlatb35;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat0.x = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0u)) ? 1.0 : -1.0;
    u_xlat11.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat11.x = inversesqrt(u_xlat11.x);
    u_xlat11.xyz = u_xlat11.xxx * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat11.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_3 = texture(_NormalMap, u_xlat3.xy);
    u_xlat4.xy = u_xlat10_3.wy + u_xlat10_3.wy;
    u_xlat16_3.xy = u_xlat10_3.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_34 = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_34 = min(u_xlat16_34, 1.0);
    u_xlat16_34 = (-u_xlat16_34) + 1.0;
    u_xlat4.z = sqrt(u_xlat16_34);
    u_xlat3.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = vec3(_NormalIntensity) * u_xlat3.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat4.xyz = u_xlat3.yyy * vs_TEXCOORD6.xyz;
    u_xlat3.xyw = u_xlat3.xxx * vs_TEXCOORD5.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat3.zzz * u_xlat0.xyz + u_xlat3.xyw;
    u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat34);
    u_xlat0.x = dot((-u_xlat2.xyz), u_xlat3.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat3.xyz * (-u_xlat0.xxx) + (-u_xlat2.xyz);
    u_xlat34 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat2.xyz = vec3(u_xlat34) * _WorldSpaceLightPos0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat33) + u_xlat2.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = _Gloss * 10.0 + 1.0;
    u_xlat33 = exp2(u_xlat33);
    u_xlat34 = (-_Gloss) + 1.0;
    u_xlatb35 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb35){
        u_xlatb35 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD3.yyy * hlslcc_mtx4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD3.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD3.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb35)) ? u_xlat4.xyz : vs_TEXCOORD3.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat35 = u_xlat4.y * 0.25;
        u_xlat15 = unity_ProbeVolumeParams.z * 0.5;
        u_xlat5.x = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat35 = max(u_xlat35, u_xlat15);
        u_xlat4.x = min(u_xlat5.x, u_xlat35);
        u_xlat10_5 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
        u_xlat6.xyz = u_xlat4.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_6 = texture(unity_ProbeVolumeSH, u_xlat6.xyz);
        u_xlat4.xyz = u_xlat4.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_4 = texture(unity_ProbeVolumeSH, u_xlat4.xyz);
        u_xlat3.w = 1.0;
        u_xlat5.x = dot(u_xlat10_5, u_xlat3);
        u_xlat5.y = dot(u_xlat10_6, u_xlat3);
        u_xlat5.z = dot(u_xlat10_4, u_xlat3);
    } else {
        u_xlat3.w = 1.0;
        u_xlat5.x = dot(unity_SHAr, u_xlat3);
        u_xlat5.y = dot(unity_SHAg, u_xlat3);
        u_xlat5.z = dot(unity_SHAb, u_xlat3);
    //ENDIF
    }
    u_xlat4.xyz = u_xlat5.xyz + vs_TEXCOORD8.xyz;
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb35 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat5.xyz = log2(u_xlat4.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = (bool(u_xlatb35)) ? u_xlat5.xyz : u_xlat4.xyz;
    u_xlatb35 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb35){
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat5.xyz = u_xlat0.xyz * vec3(u_xlat35);
        u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
        u_xlat7.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
        u_xlat6.x = (u_xlatb8.x) ? u_xlat6.x : u_xlat7.x;
        u_xlat6.y = (u_xlatb8.y) ? u_xlat6.y : u_xlat7.y;
        u_xlat6.z = (u_xlatb8.z) ? u_xlat6.z : u_xlat7.z;
        u_xlat35 = min(u_xlat6.y, u_xlat6.x);
        u_xlat35 = min(u_xlat6.z, u_xlat35);
        u_xlat6.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat35) + u_xlat6.xyz;
    } else {
        u_xlat5.xyz = u_xlat0.xyz;
    //ENDIF
    }
    u_xlat35 = (-u_xlat34) * 0.699999988 + 1.70000005;
    u_xlat34 = u_xlat34 * u_xlat35;
    u_xlat34 = u_xlat34 * 6.0;
    u_xlat10_5 = textureLod(unity_SpecCube0, u_xlat5.xyz, u_xlat34);
    u_xlat16_35 = log2(u_xlat10_5.w);
    u_xlat35 = u_xlat16_35 * unity_SpecCube0_HDR.y;
    u_xlat35 = exp2(u_xlat35);
    u_xlat35 = u_xlat35 * unity_SpecCube0_HDR.x;
    u_xlat6.xyz = u_xlat10_5.xyz * vec3(u_xlat35);
    u_xlatb36 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb36){
        u_xlatb36 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb36){
            u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
            u_xlat36 = inversesqrt(u_xlat36);
            u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat36);
            u_xlat8.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
            u_xlat9.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
            u_xlat8.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
            u_xlat8.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
            u_xlat8.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
            u_xlat36 = min(u_xlat8.y, u_xlat8.x);
            u_xlat36 = min(u_xlat8.z, u_xlat36);
            u_xlat8.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat0.xyz = u_xlat7.xyz * vec3(u_xlat36) + u_xlat8.xyz;
        //ENDIF
        }
        u_xlat10_7 = textureLod(unity_SpecCube1, u_xlat0.xyz, u_xlat34);
        u_xlat16_0 = log2(u_xlat10_7.w);
        u_xlat0.x = u_xlat16_0 * unity_SpecCube1_HDR.y;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * unity_SpecCube1_HDR.x;
        u_xlat0.xyz = u_xlat10_7.xyz * u_xlat0.xxx;
        u_xlat5.xyz = vec3(u_xlat35) * u_xlat10_5.xyz + (-u_xlat0.xyz);
        u_xlat6.xyz = unity_SpecCube0_BoxMin.www * u_xlat5.xyz + u_xlat0.xyz;
    //ENDIF
    }
    u_xlat0.xy = vs_TEXCOORD0.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
    u_xlat10_5 = texture(_SpecularMap, u_xlat0.xy);
    u_xlat0.xyz = u_xlat10_5.xyz * vec3(_SpecIntensity);
    u_xlat0.xyz = u_xlat0.xyz * _Speccolor.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat33 = u_xlat33 * u_xlat1.x;
    u_xlat33 = exp2(u_xlat33);
    u_xlat1.xyz = u_xlat0.xyz * u_xlat6.xyz;
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat33 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat33 = max(u_xlat33, 0.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _DiffuseMapTransA_ST.xy + _DiffuseMapTransA_ST.zw;
    u_xlat10_1 = texture(_DiffuseMapTransA, u_xlat1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * _Diffusecolor.xyz;
    u_xlat2.xyz = vec3(u_xlat33) * _LightColor0.xyz + u_xlat4.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_1.w * _Transparency;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 122 math, 8 textures, 14 branches
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#version 120

#ifdef VERTEX

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
attribute vec4 TANGENT;
varying vec2 xlv_TEXCOORD0;
varying vec2 xlv_TEXCOORD1;
varying vec2 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec4 xlv_TEXCOORD8;
void main ()
{
  vec4 v_1;
  v_1.x = unity_WorldToObject[0].x;
  v_1.y = unity_WorldToObject[1].x;
  v_1.z = unity_WorldToObject[2].x;
  v_1.w = unity_WorldToObject[3].x;
  vec4 v_2;
  v_2.x = unity_WorldToObject[0].y;
  v_2.y = unity_WorldToObject[1].y;
  v_2.z = unity_WorldToObject[2].y;
  v_2.w = unity_WorldToObject[3].y;
  vec4 v_3;
  v_3.x = unity_WorldToObject[0].z;
  v_3.y = unity_WorldToObject[1].z;
  v_3.z = unity_WorldToObject[2].z;
  v_3.w = unity_WorldToObject[3].z;
  vec3 tmpvar_4;
  tmpvar_4 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = TANGENT.xyz;
  vec3 tmpvar_6;
  tmpvar_6 = normalize((unity_ObjectToWorld * tmpvar_5).xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = gl_MultiTexCoord0.xy;
  xlv_TEXCOORD1 = gl_MultiTexCoord1.xy;
  xlv_TEXCOORD2 = gl_MultiTexCoord2.xy;
  xlv_TEXCOORD3 = (unity_ObjectToWorld * gl_Vertex);
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * TANGENT.w));
  xlv_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform samplerCube unity_SpecCube0;
uniform samplerCube unity_SpecCube1;
uniform vec4 unity_SpecCube0_BoxMax;
uniform vec4 unity_SpecCube0_BoxMin;
uniform vec4 unity_SpecCube0_ProbePosition;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_SpecCube1_BoxMax;
uniform vec4 unity_SpecCube1_BoxMin;
uniform vec4 unity_SpecCube1_ProbePosition;
uniform vec4 unity_SpecCube1_HDR;
uniform sampler3D unity_ProbeVolumeSH;
uniform vec4 unity_ProbeVolumeParams;
uniform mat4 unity_ProbeVolumeWorldToObject;
uniform vec3 unity_ProbeVolumeSizeInv;
uniform vec3 unity_ProbeVolumeMin;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _LightColor0;
uniform sampler2D _DiffuseMapTransA;
uniform vec4 _DiffuseMapTransA_ST;
uniform vec4 _Diffusecolor;
uniform sampler2D _NormalMap;
uniform vec4 _NormalMap_ST;
uniform float _NormalIntensity;
uniform sampler2D _SpecularMap;
uniform vec4 _SpecularMap_ST;
uniform vec4 _Speccolor;
uniform float _SpecIntensity;
uniform float _Gloss;
uniform float _Transparency;
varying vec2 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec4 xlv_TEXCOORD8;
void main ()
{
  float tmpvar_1;
  if (gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD4;
  float tmpvar_3;
  vec3 tmpvar_4;
  int tmpvar_5;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_5 = 1;
  } else {
    tmpvar_5 = -1;
  };
  tmpvar_2 = (normalize(xlv_TEXCOORD4) * float(tmpvar_5));
  mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD5.x;
  tmpvar_6[0].y = xlv_TEXCOORD6.x;
  tmpvar_6[0].z = tmpvar_2.x;
  tmpvar_6[1].x = xlv_TEXCOORD5.y;
  tmpvar_6[1].y = xlv_TEXCOORD6.y;
  tmpvar_6[1].z = tmpvar_2.y;
  tmpvar_6[2].x = xlv_TEXCOORD5.z;
  tmpvar_6[2].y = xlv_TEXCOORD6.z;
  tmpvar_6[2].z = tmpvar_2.z;
  vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3.xyz));
  vec3 normal_8;
  normal_8.xy = ((texture2D (_NormalMap, (
    (xlv_TEXCOORD0 * _NormalMap_ST.xy)
   + _NormalMap_ST.zw)).wy * 2.0) - 1.0);
  normal_8.z = sqrt((1.0 - clamp (
    dot (normal_8.xy, normal_8.xy)
  , 0.0, 1.0)));
  vec3 tmpvar_9;
  tmpvar_9 = normalize((mix (vec3(0.0, 0.0, 1.0), normal_8, vec3(_NormalIntensity)) * tmpvar_6));
  vec3 tmpvar_10;
  vec3 I_11;
  I_11 = -(tmpvar_7);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_7 + tmpvar_12));
  float tmpvar_14;
  tmpvar_14 = exp2(((_Gloss * 10.0) + 1.0));
  tmpvar_4 = xlv_TEXCOORD3.xyz;
  tmpvar_3 = (1.0 - _Gloss);
  vec3 ambient_15;
  ambient_15 = xlv_TEXCOORD8.xyz;
  vec3 ambient_contrib_16;
  ambient_contrib_16 = vec3(0.0, 0.0, 0.0);
  if ((unity_ProbeVolumeParams.x == 1.0)) {
    vec4 tmpvar_17;
    tmpvar_17.w = 1.0;
    tmpvar_17.xyz = tmpvar_9;
    vec3 x1_18;
    vec3 texCoord_19;
    vec3 tmpvar_20;
    if ((unity_ProbeVolumeParams.y == 1.0)) {
      vec4 tmpvar_21;
      tmpvar_21.w = 1.0;
      tmpvar_21.xyz = tmpvar_4;
      tmpvar_20 = (unity_ProbeVolumeWorldToObject * tmpvar_21).xyz;
    } else {
      tmpvar_20 = tmpvar_4;
    };
    vec3 tmpvar_22;
    tmpvar_22 = ((tmpvar_20 - unity_ProbeVolumeMin) * unity_ProbeVolumeSizeInv);
    texCoord_19.yz = tmpvar_22.yz;
    texCoord_19.x = (tmpvar_22.x * 0.25);
    float tmpvar_23;
    float tmpvar_24;
    tmpvar_24 = (0.5 * unity_ProbeVolumeParams.z);
    tmpvar_23 = clamp (texCoord_19.x, tmpvar_24, (0.25 - tmpvar_24));
    texCoord_19.x = tmpvar_23;
    vec4 tmpvar_25;
    tmpvar_25 = texture3D (unity_ProbeVolumeSH, texCoord_19);
    texCoord_19.x = (tmpvar_23 + 0.25);
    vec4 tmpvar_26;
    tmpvar_26 = texture3D (unity_ProbeVolumeSH, texCoord_19);
    texCoord_19.x = (tmpvar_23 + 0.5);
    x1_18.x = dot (tmpvar_25, tmpvar_17);
    x1_18.y = dot (tmpvar_26, tmpvar_17);
    x1_18.z = dot (texture3D (unity_ProbeVolumeSH, texCoord_19), tmpvar_17);
    ambient_contrib_16 = x1_18;
  } else {
    vec4 tmpvar_27;
    tmpvar_27.w = 1.0;
    tmpvar_27.xyz = tmpvar_9;
    vec3 x_28;
    x_28.x = dot (unity_SHAr, tmpvar_27);
    x_28.y = dot (unity_SHAg, tmpvar_27);
    x_28.z = dot (unity_SHAb, tmpvar_27);
    ambient_contrib_16 = x_28;
  };
  vec3 tmpvar_29;
  tmpvar_29 = max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD8.xyz + ambient_contrib_16));
  ambient_15 = tmpvar_29;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_15 = max (((1.055 * 
      pow (max (tmpvar_29, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0));
  };
  vec3 specular_30;
  vec3 worldRefl_31;
  worldRefl_31 = tmpvar_10;
  vec3 worldPos_32;
  worldPos_32 = tmpvar_4;
  if ((unity_SpecCube0_ProbePosition.w > 0.0)) {
    vec3 tmpvar_33;
    tmpvar_33 = normalize(tmpvar_10);
    vec3 tmpvar_34;
    tmpvar_34 = ((unity_SpecCube0_BoxMax.xyz - xlv_TEXCOORD3.xyz) / tmpvar_33);
    vec3 tmpvar_35;
    tmpvar_35 = ((unity_SpecCube0_BoxMin.xyz - xlv_TEXCOORD3.xyz) / tmpvar_33);
    bvec3 tmpvar_36;
    tmpvar_36 = greaterThan (tmpvar_33, vec3(0.0, 0.0, 0.0));
    float tmpvar_37;
    if (tmpvar_36.x) {
      tmpvar_37 = tmpvar_34.x;
    } else {
      tmpvar_37 = tmpvar_35.x;
    };
    float tmpvar_38;
    if (tmpvar_36.y) {
      tmpvar_38 = tmpvar_34.y;
    } else {
      tmpvar_38 = tmpvar_35.y;
    };
    float tmpvar_39;
    if (tmpvar_36.z) {
      tmpvar_39 = tmpvar_34.z;
    } else {
      tmpvar_39 = tmpvar_35.z;
    };
    worldPos_32 = (xlv_TEXCOORD3.xyz - unity_SpecCube0_ProbePosition.xyz);
    worldRefl_31 = (worldPos_32 + (tmpvar_33 * min (
      min (tmpvar_37, tmpvar_38)
    , tmpvar_39)));
  };
  vec4 tmpvar_40;
  tmpvar_40.xyz = worldRefl_31;
  tmpvar_40.w = ((tmpvar_3 * (1.7 - 
    (0.7 * tmpvar_3)
  )) * 6.0);
  vec4 tmpvar_41;
  tmpvar_41 = textureCubeLod (unity_SpecCube0, worldRefl_31, tmpvar_40.w);
  vec3 tmpvar_42;
  tmpvar_42 = ((unity_SpecCube0_HDR.x * pow (tmpvar_41.w, unity_SpecCube0_HDR.y)) * tmpvar_41.xyz);
  if ((unity_SpecCube0_BoxMin.w < 0.99999)) {
    vec3 worldRefl_43;
    worldRefl_43 = tmpvar_10;
    vec3 worldPos_44;
    worldPos_44 = tmpvar_4;
    if ((unity_SpecCube1_ProbePosition.w > 0.0)) {
      vec3 tmpvar_45;
      tmpvar_45 = normalize(tmpvar_10);
      vec3 tmpvar_46;
      tmpvar_46 = ((unity_SpecCube1_BoxMax.xyz - xlv_TEXCOORD3.xyz) / tmpvar_45);
      vec3 tmpvar_47;
      tmpvar_47 = ((unity_SpecCube1_BoxMin.xyz - xlv_TEXCOORD3.xyz) / tmpvar_45);
      bvec3 tmpvar_48;
      tmpvar_48 = greaterThan (tmpvar_45, vec3(0.0, 0.0, 0.0));
      float tmpvar_49;
      if (tmpvar_48.x) {
        tmpvar_49 = tmpvar_46.x;
      } else {
        tmpvar_49 = tmpvar_47.x;
      };
      float tmpvar_50;
      if (tmpvar_48.y) {
        tmpvar_50 = tmpvar_46.y;
      } else {
        tmpvar_50 = tmpvar_47.y;
      };
      float tmpvar_51;
      if (tmpvar_48.z) {
        tmpvar_51 = tmpvar_46.z;
      } else {
        tmpvar_51 = tmpvar_47.z;
      };
      worldPos_44 = (xlv_TEXCOORD3.xyz - unity_SpecCube1_ProbePosition.xyz);
      worldRefl_43 = (worldPos_44 + (tmpvar_45 * min (
        min (tmpvar_49, tmpvar_50)
      , tmpvar_51)));
    };
    vec4 tmpvar_52;
    tmpvar_52.xyz = worldRefl_43;
    tmpvar_52.w = ((tmpvar_3 * (1.7 - 
      (0.7 * tmpvar_3)
    )) * 6.0);
    vec4 tmpvar_53;
    tmpvar_53 = textureCubeLod (unity_SpecCube1, worldRefl_43, tmpvar_52.w);
    specular_30 = mix (((unity_SpecCube1_HDR.x * 
      pow (tmpvar_53.w, unity_SpecCube1_HDR.y)
    ) * tmpvar_53.xyz), tmpvar_42, unity_SpecCube0_BoxMin.www);
  } else {
    specular_30 = tmpvar_42;
  };
  vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_SpecularMap, (
    (xlv_TEXCOORD0 * _SpecularMap_ST.xy)
   + _SpecularMap_ST.zw)).xyz * _SpecIntensity) * _Speccolor.xyz);
  vec4 tmpvar_55;
  tmpvar_55 = texture2D (_DiffuseMapTransA, ((xlv_TEXCOORD0 * _DiffuseMapTransA_ST.xy) + _DiffuseMapTransA_ST.zw));
  vec4 tmpvar_56;
  tmpvar_56.xyz = (((
    (max (0.0, dot (tmpvar_9, tmpvar_12)) * _LightColor0.xyz)
   + ambient_15) * (tmpvar_55.xyz * _Diffusecolor.xyz)) + ((
    pow (max (0.0, dot (tmpvar_13, tmpvar_9)), tmpvar_14)
   * tmpvar_54) + (specular_30 * tmpvar_54)));
  tmpvar_56.w = (tmpvar_55.w * _Transparency);
  gl_FragData[0] = tmpvar_56;
}


#endif
"
}
SubProgram "metal " {
// Stats: 17 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
Bind "texcoord2" ATTR5
ConstBuffer "$Globals" 192
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [unity_ObjectToWorld]
Matrix 128 [unity_WorldToObject]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
  float4 _glesMultiTexCoord2 [[attribute(5)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float4 xlv_TEXCOORD8;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4x4 unity_ObjectToWorld;
  float4x4 unity_WorldToObject;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 v_1 = 0;
  v_1.x = _mtl_u.unity_WorldToObject[0].x;
  v_1.y = _mtl_u.unity_WorldToObject[1].x;
  v_1.z = _mtl_u.unity_WorldToObject[2].x;
  v_1.w = _mtl_u.unity_WorldToObject[3].x;
  float4 v_2 = 0;
  v_2.x = _mtl_u.unity_WorldToObject[0].y;
  v_2.y = _mtl_u.unity_WorldToObject[1].y;
  v_2.z = _mtl_u.unity_WorldToObject[2].y;
  v_2.w = _mtl_u.unity_WorldToObject[3].y;
  float4 v_3 = 0;
  v_3.x = _mtl_u.unity_WorldToObject[0].z;
  v_3.y = _mtl_u.unity_WorldToObject[1].z;
  v_3.z = _mtl_u.unity_WorldToObject[2].z;
  v_3.w = _mtl_u.unity_WorldToObject[3].z;
  float3 tmpvar_4 = 0;
  tmpvar_4 = normalize(((
    (v_1.xyz * _mtl_i._glesNormal.x)
   + 
    (v_2.xyz * _mtl_i._glesNormal.y)
  ) + (v_3.xyz * _mtl_i._glesNormal.z)));
  float4 tmpvar_5 = 0;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _mtl_i._glesTANGENT.xyz;
  float3 tmpvar_6 = 0;
  tmpvar_6 = normalize((_mtl_u.unity_ObjectToWorld * tmpvar_5).xyz);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = _mtl_i._glesMultiTexCoord0.xy;
  _mtl_o.xlv_TEXCOORD1 = _mtl_i._glesMultiTexCoord1.xy;
  _mtl_o.xlv_TEXCOORD2 = _mtl_i._glesMultiTexCoord2.xy;
  _mtl_o.xlv_TEXCOORD3 = (_mtl_u.unity_ObjectToWorld * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD4 = tmpvar_4;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * _mtl_i._glesTANGENT.w));
  _mtl_o.xlv_TEXCOORD8 = float4(0.0, 0.0, 0.0, 0.0);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec2 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD3 = hlslcc_mtx4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD6.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DiffuseMapTransA_ST;
uniform 	vec4 _Diffusecolor;
uniform 	vec4 _NormalMap_ST;
uniform 	float _NormalIntensity;
uniform 	vec4 _SpecularMap_ST;
uniform 	vec4 _Speccolor;
uniform 	float _SpecIntensity;
uniform 	float _Gloss;
uniform 	float _Transparency;
uniform  sampler2D _NormalMap;
uniform  sampler2D _SpecularMap;
uniform  sampler2D _DiffuseMapTransA;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
in  vec4 vs_TEXCOORD8;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat5;
lowp vec4 u_xlat10_5;
vec3 u_xlat6;
lowp vec4 u_xlat10_6;
vec3 u_xlat7;
lowp vec4 u_xlat10_7;
vec3 u_xlat8;
bvec3 u_xlatb8;
vec3 u_xlat9;
bvec3 u_xlatb10;
vec3 u_xlat11;
float u_xlat15;
float u_xlat33;
float u_xlat34;
mediump float u_xlat16_34;
float u_xlat35;
mediump float u_xlat16_35;
bool u_xlatb35;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat0.x = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0u)) ? 1.0 : -1.0;
    u_xlat11.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat11.x = inversesqrt(u_xlat11.x);
    u_xlat11.xyz = u_xlat11.xxx * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat11.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_3 = texture(_NormalMap, u_xlat3.xy);
    u_xlat4.xy = u_xlat10_3.wy + u_xlat10_3.wy;
    u_xlat16_3.xy = u_xlat10_3.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_34 = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_34 = min(u_xlat16_34, 1.0);
    u_xlat16_34 = (-u_xlat16_34) + 1.0;
    u_xlat4.z = sqrt(u_xlat16_34);
    u_xlat3.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = vec3(_NormalIntensity) * u_xlat3.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat4.xyz = u_xlat3.yyy * vs_TEXCOORD6.xyz;
    u_xlat3.xyw = u_xlat3.xxx * vs_TEXCOORD5.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat3.zzz * u_xlat0.xyz + u_xlat3.xyw;
    u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat34);
    u_xlat0.x = dot((-u_xlat2.xyz), u_xlat3.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat3.xyz * (-u_xlat0.xxx) + (-u_xlat2.xyz);
    u_xlat34 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat2.xyz = vec3(u_xlat34) * _WorldSpaceLightPos0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat33) + u_xlat2.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = _Gloss * 10.0 + 1.0;
    u_xlat33 = exp2(u_xlat33);
    u_xlat34 = (-_Gloss) + 1.0;
    u_xlatb35 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb35){
        u_xlatb35 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD3.yyy * hlslcc_mtx4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD3.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD3.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb35)) ? u_xlat4.xyz : vs_TEXCOORD3.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat35 = u_xlat4.y * 0.25;
        u_xlat15 = unity_ProbeVolumeParams.z * 0.5;
        u_xlat5.x = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat35 = max(u_xlat35, u_xlat15);
        u_xlat4.x = min(u_xlat5.x, u_xlat35);
        u_xlat10_5 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
        u_xlat6.xyz = u_xlat4.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_6 = texture(unity_ProbeVolumeSH, u_xlat6.xyz);
        u_xlat4.xyz = u_xlat4.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_4 = texture(unity_ProbeVolumeSH, u_xlat4.xyz);
        u_xlat3.w = 1.0;
        u_xlat5.x = dot(u_xlat10_5, u_xlat3);
        u_xlat5.y = dot(u_xlat10_6, u_xlat3);
        u_xlat5.z = dot(u_xlat10_4, u_xlat3);
    } else {
        u_xlat3.w = 1.0;
        u_xlat5.x = dot(unity_SHAr, u_xlat3);
        u_xlat5.y = dot(unity_SHAg, u_xlat3);
        u_xlat5.z = dot(unity_SHAb, u_xlat3);
    //ENDIF
    }
    u_xlat4.xyz = u_xlat5.xyz + vs_TEXCOORD8.xyz;
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb35 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat5.xyz = log2(u_xlat4.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = (bool(u_xlatb35)) ? u_xlat5.xyz : u_xlat4.xyz;
    u_xlatb35 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb35){
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat5.xyz = u_xlat0.xyz * vec3(u_xlat35);
        u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
        u_xlat7.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
        u_xlat6.x = (u_xlatb8.x) ? u_xlat6.x : u_xlat7.x;
        u_xlat6.y = (u_xlatb8.y) ? u_xlat6.y : u_xlat7.y;
        u_xlat6.z = (u_xlatb8.z) ? u_xlat6.z : u_xlat7.z;
        u_xlat35 = min(u_xlat6.y, u_xlat6.x);
        u_xlat35 = min(u_xlat6.z, u_xlat35);
        u_xlat6.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat35) + u_xlat6.xyz;
    } else {
        u_xlat5.xyz = u_xlat0.xyz;
    //ENDIF
    }
    u_xlat35 = (-u_xlat34) * 0.699999988 + 1.70000005;
    u_xlat34 = u_xlat34 * u_xlat35;
    u_xlat34 = u_xlat34 * 6.0;
    u_xlat10_5 = textureLod(unity_SpecCube0, u_xlat5.xyz, u_xlat34);
    u_xlat16_35 = log2(u_xlat10_5.w);
    u_xlat35 = u_xlat16_35 * unity_SpecCube0_HDR.y;
    u_xlat35 = exp2(u_xlat35);
    u_xlat35 = u_xlat35 * unity_SpecCube0_HDR.x;
    u_xlat6.xyz = u_xlat10_5.xyz * vec3(u_xlat35);
    u_xlatb36 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb36){
        u_xlatb36 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb36){
            u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
            u_xlat36 = inversesqrt(u_xlat36);
            u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat36);
            u_xlat8.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
            u_xlat9.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
            u_xlat8.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
            u_xlat8.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
            u_xlat8.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
            u_xlat36 = min(u_xlat8.y, u_xlat8.x);
            u_xlat36 = min(u_xlat8.z, u_xlat36);
            u_xlat8.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat0.xyz = u_xlat7.xyz * vec3(u_xlat36) + u_xlat8.xyz;
        //ENDIF
        }
        u_xlat10_7 = textureLod(unity_SpecCube1, u_xlat0.xyz, u_xlat34);
        u_xlat16_0 = log2(u_xlat10_7.w);
        u_xlat0.x = u_xlat16_0 * unity_SpecCube1_HDR.y;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * unity_SpecCube1_HDR.x;
        u_xlat0.xyz = u_xlat10_7.xyz * u_xlat0.xxx;
        u_xlat5.xyz = vec3(u_xlat35) * u_xlat10_5.xyz + (-u_xlat0.xyz);
        u_xlat6.xyz = unity_SpecCube0_BoxMin.www * u_xlat5.xyz + u_xlat0.xyz;
    //ENDIF
    }
    u_xlat0.xy = vs_TEXCOORD0.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
    u_xlat10_5 = texture(_SpecularMap, u_xlat0.xy);
    u_xlat0.xyz = u_xlat10_5.xyz * vec3(_SpecIntensity);
    u_xlat0.xyz = u_xlat0.xyz * _Speccolor.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat33 = u_xlat33 * u_xlat1.x;
    u_xlat33 = exp2(u_xlat33);
    u_xlat1.xyz = u_xlat0.xyz * u_xlat6.xyz;
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat33 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat33 = max(u_xlat33, 0.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _DiffuseMapTransA_ST.xy + _DiffuseMapTransA_ST.zw;
    u_xlat10_1 = texture(_DiffuseMapTransA, u_xlat1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * _Diffusecolor.xyz;
    u_xlat2.xyz = vec3(u_xlat33) * _LightColor0.xyz + u_xlat4.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_1.w * _Transparency;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 122 math, 8 textures, 14 branches
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"#version 120

#ifdef VERTEX

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
attribute vec4 TANGENT;
varying vec2 xlv_TEXCOORD0;
varying vec2 xlv_TEXCOORD1;
varying vec2 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec4 xlv_TEXCOORD8;
void main ()
{
  vec4 v_1;
  v_1.x = unity_WorldToObject[0].x;
  v_1.y = unity_WorldToObject[1].x;
  v_1.z = unity_WorldToObject[2].x;
  v_1.w = unity_WorldToObject[3].x;
  vec4 v_2;
  v_2.x = unity_WorldToObject[0].y;
  v_2.y = unity_WorldToObject[1].y;
  v_2.z = unity_WorldToObject[2].y;
  v_2.w = unity_WorldToObject[3].y;
  vec4 v_3;
  v_3.x = unity_WorldToObject[0].z;
  v_3.y = unity_WorldToObject[1].z;
  v_3.z = unity_WorldToObject[2].z;
  v_3.w = unity_WorldToObject[3].z;
  vec3 tmpvar_4;
  tmpvar_4 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = TANGENT.xyz;
  vec3 tmpvar_6;
  tmpvar_6 = normalize((unity_ObjectToWorld * tmpvar_5).xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = gl_MultiTexCoord0.xy;
  xlv_TEXCOORD1 = gl_MultiTexCoord1.xy;
  xlv_TEXCOORD2 = gl_MultiTexCoord2.xy;
  xlv_TEXCOORD3 = (unity_ObjectToWorld * gl_Vertex);
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * TANGENT.w));
  xlv_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform samplerCube unity_SpecCube0;
uniform samplerCube unity_SpecCube1;
uniform vec4 unity_SpecCube0_BoxMax;
uniform vec4 unity_SpecCube0_BoxMin;
uniform vec4 unity_SpecCube0_ProbePosition;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_SpecCube1_BoxMax;
uniform vec4 unity_SpecCube1_BoxMin;
uniform vec4 unity_SpecCube1_ProbePosition;
uniform vec4 unity_SpecCube1_HDR;
uniform sampler3D unity_ProbeVolumeSH;
uniform vec4 unity_ProbeVolumeParams;
uniform mat4 unity_ProbeVolumeWorldToObject;
uniform vec3 unity_ProbeVolumeSizeInv;
uniform vec3 unity_ProbeVolumeMin;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _LightColor0;
uniform sampler2D _DiffuseMapTransA;
uniform vec4 _DiffuseMapTransA_ST;
uniform vec4 _Diffusecolor;
uniform sampler2D _NormalMap;
uniform vec4 _NormalMap_ST;
uniform float _NormalIntensity;
uniform sampler2D _SpecularMap;
uniform vec4 _SpecularMap_ST;
uniform vec4 _Speccolor;
uniform float _SpecIntensity;
uniform float _Gloss;
uniform float _Transparency;
varying vec2 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec4 xlv_TEXCOORD8;
void main ()
{
  float tmpvar_1;
  if (gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD4;
  float tmpvar_3;
  vec3 tmpvar_4;
  int tmpvar_5;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_5 = 1;
  } else {
    tmpvar_5 = -1;
  };
  tmpvar_2 = (normalize(xlv_TEXCOORD4) * float(tmpvar_5));
  mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD5.x;
  tmpvar_6[0].y = xlv_TEXCOORD6.x;
  tmpvar_6[0].z = tmpvar_2.x;
  tmpvar_6[1].x = xlv_TEXCOORD5.y;
  tmpvar_6[1].y = xlv_TEXCOORD6.y;
  tmpvar_6[1].z = tmpvar_2.y;
  tmpvar_6[2].x = xlv_TEXCOORD5.z;
  tmpvar_6[2].y = xlv_TEXCOORD6.z;
  tmpvar_6[2].z = tmpvar_2.z;
  vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3.xyz));
  vec3 normal_8;
  normal_8.xy = ((texture2D (_NormalMap, (
    (xlv_TEXCOORD0 * _NormalMap_ST.xy)
   + _NormalMap_ST.zw)).wy * 2.0) - 1.0);
  normal_8.z = sqrt((1.0 - clamp (
    dot (normal_8.xy, normal_8.xy)
  , 0.0, 1.0)));
  vec3 tmpvar_9;
  tmpvar_9 = normalize((mix (vec3(0.0, 0.0, 1.0), normal_8, vec3(_NormalIntensity)) * tmpvar_6));
  vec3 tmpvar_10;
  vec3 I_11;
  I_11 = -(tmpvar_7);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_7 + tmpvar_12));
  float tmpvar_14;
  tmpvar_14 = exp2(((_Gloss * 10.0) + 1.0));
  tmpvar_4 = xlv_TEXCOORD3.xyz;
  tmpvar_3 = (1.0 - _Gloss);
  vec3 ambient_15;
  ambient_15 = xlv_TEXCOORD8.xyz;
  vec3 ambient_contrib_16;
  ambient_contrib_16 = vec3(0.0, 0.0, 0.0);
  if ((unity_ProbeVolumeParams.x == 1.0)) {
    vec4 tmpvar_17;
    tmpvar_17.w = 1.0;
    tmpvar_17.xyz = tmpvar_9;
    vec3 x1_18;
    vec3 texCoord_19;
    vec3 tmpvar_20;
    if ((unity_ProbeVolumeParams.y == 1.0)) {
      vec4 tmpvar_21;
      tmpvar_21.w = 1.0;
      tmpvar_21.xyz = tmpvar_4;
      tmpvar_20 = (unity_ProbeVolumeWorldToObject * tmpvar_21).xyz;
    } else {
      tmpvar_20 = tmpvar_4;
    };
    vec3 tmpvar_22;
    tmpvar_22 = ((tmpvar_20 - unity_ProbeVolumeMin) * unity_ProbeVolumeSizeInv);
    texCoord_19.yz = tmpvar_22.yz;
    texCoord_19.x = (tmpvar_22.x * 0.25);
    float tmpvar_23;
    float tmpvar_24;
    tmpvar_24 = (0.5 * unity_ProbeVolumeParams.z);
    tmpvar_23 = clamp (texCoord_19.x, tmpvar_24, (0.25 - tmpvar_24));
    texCoord_19.x = tmpvar_23;
    vec4 tmpvar_25;
    tmpvar_25 = texture3D (unity_ProbeVolumeSH, texCoord_19);
    texCoord_19.x = (tmpvar_23 + 0.25);
    vec4 tmpvar_26;
    tmpvar_26 = texture3D (unity_ProbeVolumeSH, texCoord_19);
    texCoord_19.x = (tmpvar_23 + 0.5);
    x1_18.x = dot (tmpvar_25, tmpvar_17);
    x1_18.y = dot (tmpvar_26, tmpvar_17);
    x1_18.z = dot (texture3D (unity_ProbeVolumeSH, texCoord_19), tmpvar_17);
    ambient_contrib_16 = x1_18;
  } else {
    vec4 tmpvar_27;
    tmpvar_27.w = 1.0;
    tmpvar_27.xyz = tmpvar_9;
    vec3 x_28;
    x_28.x = dot (unity_SHAr, tmpvar_27);
    x_28.y = dot (unity_SHAg, tmpvar_27);
    x_28.z = dot (unity_SHAb, tmpvar_27);
    ambient_contrib_16 = x_28;
  };
  vec3 tmpvar_29;
  tmpvar_29 = max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD8.xyz + ambient_contrib_16));
  ambient_15 = tmpvar_29;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_15 = max (((1.055 * 
      pow (max (tmpvar_29, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0));
  };
  vec3 specular_30;
  vec3 worldRefl_31;
  worldRefl_31 = tmpvar_10;
  vec3 worldPos_32;
  worldPos_32 = tmpvar_4;
  if ((unity_SpecCube0_ProbePosition.w > 0.0)) {
    vec3 tmpvar_33;
    tmpvar_33 = normalize(tmpvar_10);
    vec3 tmpvar_34;
    tmpvar_34 = ((unity_SpecCube0_BoxMax.xyz - xlv_TEXCOORD3.xyz) / tmpvar_33);
    vec3 tmpvar_35;
    tmpvar_35 = ((unity_SpecCube0_BoxMin.xyz - xlv_TEXCOORD3.xyz) / tmpvar_33);
    bvec3 tmpvar_36;
    tmpvar_36 = greaterThan (tmpvar_33, vec3(0.0, 0.0, 0.0));
    float tmpvar_37;
    if (tmpvar_36.x) {
      tmpvar_37 = tmpvar_34.x;
    } else {
      tmpvar_37 = tmpvar_35.x;
    };
    float tmpvar_38;
    if (tmpvar_36.y) {
      tmpvar_38 = tmpvar_34.y;
    } else {
      tmpvar_38 = tmpvar_35.y;
    };
    float tmpvar_39;
    if (tmpvar_36.z) {
      tmpvar_39 = tmpvar_34.z;
    } else {
      tmpvar_39 = tmpvar_35.z;
    };
    worldPos_32 = (xlv_TEXCOORD3.xyz - unity_SpecCube0_ProbePosition.xyz);
    worldRefl_31 = (worldPos_32 + (tmpvar_33 * min (
      min (tmpvar_37, tmpvar_38)
    , tmpvar_39)));
  };
  vec4 tmpvar_40;
  tmpvar_40.xyz = worldRefl_31;
  tmpvar_40.w = ((tmpvar_3 * (1.7 - 
    (0.7 * tmpvar_3)
  )) * 6.0);
  vec4 tmpvar_41;
  tmpvar_41 = textureCubeLod (unity_SpecCube0, worldRefl_31, tmpvar_40.w);
  vec3 tmpvar_42;
  tmpvar_42 = ((unity_SpecCube0_HDR.x * pow (tmpvar_41.w, unity_SpecCube0_HDR.y)) * tmpvar_41.xyz);
  if ((unity_SpecCube0_BoxMin.w < 0.99999)) {
    vec3 worldRefl_43;
    worldRefl_43 = tmpvar_10;
    vec3 worldPos_44;
    worldPos_44 = tmpvar_4;
    if ((unity_SpecCube1_ProbePosition.w > 0.0)) {
      vec3 tmpvar_45;
      tmpvar_45 = normalize(tmpvar_10);
      vec3 tmpvar_46;
      tmpvar_46 = ((unity_SpecCube1_BoxMax.xyz - xlv_TEXCOORD3.xyz) / tmpvar_45);
      vec3 tmpvar_47;
      tmpvar_47 = ((unity_SpecCube1_BoxMin.xyz - xlv_TEXCOORD3.xyz) / tmpvar_45);
      bvec3 tmpvar_48;
      tmpvar_48 = greaterThan (tmpvar_45, vec3(0.0, 0.0, 0.0));
      float tmpvar_49;
      if (tmpvar_48.x) {
        tmpvar_49 = tmpvar_46.x;
      } else {
        tmpvar_49 = tmpvar_47.x;
      };
      float tmpvar_50;
      if (tmpvar_48.y) {
        tmpvar_50 = tmpvar_46.y;
      } else {
        tmpvar_50 = tmpvar_47.y;
      };
      float tmpvar_51;
      if (tmpvar_48.z) {
        tmpvar_51 = tmpvar_46.z;
      } else {
        tmpvar_51 = tmpvar_47.z;
      };
      worldPos_44 = (xlv_TEXCOORD3.xyz - unity_SpecCube1_ProbePosition.xyz);
      worldRefl_43 = (worldPos_44 + (tmpvar_45 * min (
        min (tmpvar_49, tmpvar_50)
      , tmpvar_51)));
    };
    vec4 tmpvar_52;
    tmpvar_52.xyz = worldRefl_43;
    tmpvar_52.w = ((tmpvar_3 * (1.7 - 
      (0.7 * tmpvar_3)
    )) * 6.0);
    vec4 tmpvar_53;
    tmpvar_53 = textureCubeLod (unity_SpecCube1, worldRefl_43, tmpvar_52.w);
    specular_30 = mix (((unity_SpecCube1_HDR.x * 
      pow (tmpvar_53.w, unity_SpecCube1_HDR.y)
    ) * tmpvar_53.xyz), tmpvar_42, unity_SpecCube0_BoxMin.www);
  } else {
    specular_30 = tmpvar_42;
  };
  vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_SpecularMap, (
    (xlv_TEXCOORD0 * _SpecularMap_ST.xy)
   + _SpecularMap_ST.zw)).xyz * _SpecIntensity) * _Speccolor.xyz);
  vec4 tmpvar_55;
  tmpvar_55 = texture2D (_DiffuseMapTransA, ((xlv_TEXCOORD0 * _DiffuseMapTransA_ST.xy) + _DiffuseMapTransA_ST.zw));
  vec4 tmpvar_56;
  tmpvar_56.xyz = (((
    (max (0.0, dot (tmpvar_9, tmpvar_12)) * _LightColor0.xyz)
   + ambient_15) * (tmpvar_55.xyz * _Diffusecolor.xyz)) + ((
    pow (max (0.0, dot (tmpvar_13, tmpvar_9)), tmpvar_14)
   * tmpvar_54) + (specular_30 * tmpvar_54)));
  tmpvar_56.w = (tmpvar_55.w * _Transparency);
  gl_FragData[0] = tmpvar_56;
}


#endif
"
}
SubProgram "metal " {
// Stats: 17 math
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
Bind "texcoord2" ATTR5
ConstBuffer "$Globals" 192
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [unity_ObjectToWorld]
Matrix 128 [unity_WorldToObject]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
  float4 _glesMultiTexCoord2 [[attribute(5)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float4 xlv_TEXCOORD8;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4x4 unity_ObjectToWorld;
  float4x4 unity_WorldToObject;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 v_1 = 0;
  v_1.x = _mtl_u.unity_WorldToObject[0].x;
  v_1.y = _mtl_u.unity_WorldToObject[1].x;
  v_1.z = _mtl_u.unity_WorldToObject[2].x;
  v_1.w = _mtl_u.unity_WorldToObject[3].x;
  float4 v_2 = 0;
  v_2.x = _mtl_u.unity_WorldToObject[0].y;
  v_2.y = _mtl_u.unity_WorldToObject[1].y;
  v_2.z = _mtl_u.unity_WorldToObject[2].y;
  v_2.w = _mtl_u.unity_WorldToObject[3].y;
  float4 v_3 = 0;
  v_3.x = _mtl_u.unity_WorldToObject[0].z;
  v_3.y = _mtl_u.unity_WorldToObject[1].z;
  v_3.z = _mtl_u.unity_WorldToObject[2].z;
  v_3.w = _mtl_u.unity_WorldToObject[3].z;
  float3 tmpvar_4 = 0;
  tmpvar_4 = normalize(((
    (v_1.xyz * _mtl_i._glesNormal.x)
   + 
    (v_2.xyz * _mtl_i._glesNormal.y)
  ) + (v_3.xyz * _mtl_i._glesNormal.z)));
  float4 tmpvar_5 = 0;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _mtl_i._glesTANGENT.xyz;
  float3 tmpvar_6 = 0;
  tmpvar_6 = normalize((_mtl_u.unity_ObjectToWorld * tmpvar_5).xyz);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = _mtl_i._glesMultiTexCoord0.xy;
  _mtl_o.xlv_TEXCOORD1 = _mtl_i._glesMultiTexCoord1.xy;
  _mtl_o.xlv_TEXCOORD2 = _mtl_i._glesMultiTexCoord2.xy;
  _mtl_o.xlv_TEXCOORD3 = (_mtl_u.unity_ObjectToWorld * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD4 = tmpvar_4;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * _mtl_i._glesTANGENT.w));
  _mtl_o.xlv_TEXCOORD8 = float4(0.0, 0.0, 0.0, 0.0);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec2 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD3 = hlslcc_mtx4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD6.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DiffuseMapTransA_ST;
uniform 	vec4 _Diffusecolor;
uniform 	vec4 _NormalMap_ST;
uniform 	float _NormalIntensity;
uniform 	vec4 _SpecularMap_ST;
uniform 	vec4 _Speccolor;
uniform 	float _SpecIntensity;
uniform 	float _Gloss;
uniform 	float _Transparency;
uniform  sampler2D _NormalMap;
uniform  sampler2D _SpecularMap;
uniform  sampler2D _DiffuseMapTransA;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
in  vec4 vs_TEXCOORD8;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat5;
lowp vec4 u_xlat10_5;
vec3 u_xlat6;
lowp vec4 u_xlat10_6;
vec3 u_xlat7;
lowp vec4 u_xlat10_7;
vec3 u_xlat8;
bvec3 u_xlatb8;
vec3 u_xlat9;
bvec3 u_xlatb10;
vec3 u_xlat11;
float u_xlat15;
float u_xlat33;
float u_xlat34;
mediump float u_xlat16_34;
float u_xlat35;
mediump float u_xlat16_35;
bool u_xlatb35;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat0.x = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0u)) ? 1.0 : -1.0;
    u_xlat11.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat11.x = inversesqrt(u_xlat11.x);
    u_xlat11.xyz = u_xlat11.xxx * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat11.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_3 = texture(_NormalMap, u_xlat3.xy);
    u_xlat4.xy = u_xlat10_3.wy + u_xlat10_3.wy;
    u_xlat16_3.xy = u_xlat10_3.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_34 = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_34 = min(u_xlat16_34, 1.0);
    u_xlat16_34 = (-u_xlat16_34) + 1.0;
    u_xlat4.z = sqrt(u_xlat16_34);
    u_xlat3.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = vec3(_NormalIntensity) * u_xlat3.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat4.xyz = u_xlat3.yyy * vs_TEXCOORD6.xyz;
    u_xlat3.xyw = u_xlat3.xxx * vs_TEXCOORD5.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat3.zzz * u_xlat0.xyz + u_xlat3.xyw;
    u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat34);
    u_xlat0.x = dot((-u_xlat2.xyz), u_xlat3.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat3.xyz * (-u_xlat0.xxx) + (-u_xlat2.xyz);
    u_xlat34 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat2.xyz = vec3(u_xlat34) * _WorldSpaceLightPos0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat33) + u_xlat2.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = _Gloss * 10.0 + 1.0;
    u_xlat33 = exp2(u_xlat33);
    u_xlat34 = (-_Gloss) + 1.0;
    u_xlatb35 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb35){
        u_xlatb35 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD3.yyy * hlslcc_mtx4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD3.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD3.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb35)) ? u_xlat4.xyz : vs_TEXCOORD3.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat35 = u_xlat4.y * 0.25;
        u_xlat15 = unity_ProbeVolumeParams.z * 0.5;
        u_xlat5.x = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat35 = max(u_xlat35, u_xlat15);
        u_xlat4.x = min(u_xlat5.x, u_xlat35);
        u_xlat10_5 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
        u_xlat6.xyz = u_xlat4.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_6 = texture(unity_ProbeVolumeSH, u_xlat6.xyz);
        u_xlat4.xyz = u_xlat4.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_4 = texture(unity_ProbeVolumeSH, u_xlat4.xyz);
        u_xlat3.w = 1.0;
        u_xlat5.x = dot(u_xlat10_5, u_xlat3);
        u_xlat5.y = dot(u_xlat10_6, u_xlat3);
        u_xlat5.z = dot(u_xlat10_4, u_xlat3);
    } else {
        u_xlat3.w = 1.0;
        u_xlat5.x = dot(unity_SHAr, u_xlat3);
        u_xlat5.y = dot(unity_SHAg, u_xlat3);
        u_xlat5.z = dot(unity_SHAb, u_xlat3);
    //ENDIF
    }
    u_xlat4.xyz = u_xlat5.xyz + vs_TEXCOORD8.xyz;
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb35 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat5.xyz = log2(u_xlat4.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = (bool(u_xlatb35)) ? u_xlat5.xyz : u_xlat4.xyz;
    u_xlatb35 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb35){
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat5.xyz = u_xlat0.xyz * vec3(u_xlat35);
        u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
        u_xlat7.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
        u_xlat6.x = (u_xlatb8.x) ? u_xlat6.x : u_xlat7.x;
        u_xlat6.y = (u_xlatb8.y) ? u_xlat6.y : u_xlat7.y;
        u_xlat6.z = (u_xlatb8.z) ? u_xlat6.z : u_xlat7.z;
        u_xlat35 = min(u_xlat6.y, u_xlat6.x);
        u_xlat35 = min(u_xlat6.z, u_xlat35);
        u_xlat6.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat35) + u_xlat6.xyz;
    } else {
        u_xlat5.xyz = u_xlat0.xyz;
    //ENDIF
    }
    u_xlat35 = (-u_xlat34) * 0.699999988 + 1.70000005;
    u_xlat34 = u_xlat34 * u_xlat35;
    u_xlat34 = u_xlat34 * 6.0;
    u_xlat10_5 = textureLod(unity_SpecCube0, u_xlat5.xyz, u_xlat34);
    u_xlat16_35 = log2(u_xlat10_5.w);
    u_xlat35 = u_xlat16_35 * unity_SpecCube0_HDR.y;
    u_xlat35 = exp2(u_xlat35);
    u_xlat35 = u_xlat35 * unity_SpecCube0_HDR.x;
    u_xlat6.xyz = u_xlat10_5.xyz * vec3(u_xlat35);
    u_xlatb36 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb36){
        u_xlatb36 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb36){
            u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
            u_xlat36 = inversesqrt(u_xlat36);
            u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat36);
            u_xlat8.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
            u_xlat9.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
            u_xlat8.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
            u_xlat8.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
            u_xlat8.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
            u_xlat36 = min(u_xlat8.y, u_xlat8.x);
            u_xlat36 = min(u_xlat8.z, u_xlat36);
            u_xlat8.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat0.xyz = u_xlat7.xyz * vec3(u_xlat36) + u_xlat8.xyz;
        //ENDIF
        }
        u_xlat10_7 = textureLod(unity_SpecCube1, u_xlat0.xyz, u_xlat34);
        u_xlat16_0 = log2(u_xlat10_7.w);
        u_xlat0.x = u_xlat16_0 * unity_SpecCube1_HDR.y;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * unity_SpecCube1_HDR.x;
        u_xlat0.xyz = u_xlat10_7.xyz * u_xlat0.xxx;
        u_xlat5.xyz = vec3(u_xlat35) * u_xlat10_5.xyz + (-u_xlat0.xyz);
        u_xlat6.xyz = unity_SpecCube0_BoxMin.www * u_xlat5.xyz + u_xlat0.xyz;
    //ENDIF
    }
    u_xlat0.xy = vs_TEXCOORD0.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
    u_xlat10_5 = texture(_SpecularMap, u_xlat0.xy);
    u_xlat0.xyz = u_xlat10_5.xyz * vec3(_SpecIntensity);
    u_xlat0.xyz = u_xlat0.xyz * _Speccolor.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat33 = u_xlat33 * u_xlat1.x;
    u_xlat33 = exp2(u_xlat33);
    u_xlat1.xyz = u_xlat0.xyz * u_xlat6.xyz;
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat33 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat33 = max(u_xlat33, 0.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _DiffuseMapTransA_ST.xy + _DiffuseMapTransA_ST.zw;
    u_xlat10_1 = texture(_DiffuseMapTransA, u_xlat1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * _Diffusecolor.xyz;
    u_xlat2.xyz = vec3(u_xlat33) * _LightColor0.xyz + u_xlat4.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_1.w * _Transparency;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 122 math, 8 textures, 14 branches
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"#version 120

#ifdef VERTEX

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
attribute vec4 TANGENT;
varying vec2 xlv_TEXCOORD0;
varying vec2 xlv_TEXCOORD1;
varying vec2 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec4 xlv_TEXCOORD8;
void main ()
{
  vec4 v_1;
  v_1.x = unity_WorldToObject[0].x;
  v_1.y = unity_WorldToObject[1].x;
  v_1.z = unity_WorldToObject[2].x;
  v_1.w = unity_WorldToObject[3].x;
  vec4 v_2;
  v_2.x = unity_WorldToObject[0].y;
  v_2.y = unity_WorldToObject[1].y;
  v_2.z = unity_WorldToObject[2].y;
  v_2.w = unity_WorldToObject[3].y;
  vec4 v_3;
  v_3.x = unity_WorldToObject[0].z;
  v_3.y = unity_WorldToObject[1].z;
  v_3.z = unity_WorldToObject[2].z;
  v_3.w = unity_WorldToObject[3].z;
  vec3 tmpvar_4;
  tmpvar_4 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = TANGENT.xyz;
  vec3 tmpvar_6;
  tmpvar_6 = normalize((unity_ObjectToWorld * tmpvar_5).xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = gl_MultiTexCoord0.xy;
  xlv_TEXCOORD1 = gl_MultiTexCoord1.xy;
  xlv_TEXCOORD2 = gl_MultiTexCoord2.xy;
  xlv_TEXCOORD3 = (unity_ObjectToWorld * gl_Vertex);
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * TANGENT.w));
  xlv_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform samplerCube unity_SpecCube0;
uniform samplerCube unity_SpecCube1;
uniform vec4 unity_SpecCube0_BoxMax;
uniform vec4 unity_SpecCube0_BoxMin;
uniform vec4 unity_SpecCube0_ProbePosition;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_SpecCube1_BoxMax;
uniform vec4 unity_SpecCube1_BoxMin;
uniform vec4 unity_SpecCube1_ProbePosition;
uniform vec4 unity_SpecCube1_HDR;
uniform sampler3D unity_ProbeVolumeSH;
uniform vec4 unity_ProbeVolumeParams;
uniform mat4 unity_ProbeVolumeWorldToObject;
uniform vec3 unity_ProbeVolumeSizeInv;
uniform vec3 unity_ProbeVolumeMin;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _LightColor0;
uniform sampler2D _DiffuseMapTransA;
uniform vec4 _DiffuseMapTransA_ST;
uniform vec4 _Diffusecolor;
uniform sampler2D _NormalMap;
uniform vec4 _NormalMap_ST;
uniform float _NormalIntensity;
uniform sampler2D _SpecularMap;
uniform vec4 _SpecularMap_ST;
uniform vec4 _Speccolor;
uniform float _SpecIntensity;
uniform float _Gloss;
uniform float _Transparency;
varying vec2 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec4 xlv_TEXCOORD8;
void main ()
{
  float tmpvar_1;
  if (gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD4;
  float tmpvar_3;
  vec3 tmpvar_4;
  int tmpvar_5;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_5 = 1;
  } else {
    tmpvar_5 = -1;
  };
  tmpvar_2 = (normalize(xlv_TEXCOORD4) * float(tmpvar_5));
  mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD5.x;
  tmpvar_6[0].y = xlv_TEXCOORD6.x;
  tmpvar_6[0].z = tmpvar_2.x;
  tmpvar_6[1].x = xlv_TEXCOORD5.y;
  tmpvar_6[1].y = xlv_TEXCOORD6.y;
  tmpvar_6[1].z = tmpvar_2.y;
  tmpvar_6[2].x = xlv_TEXCOORD5.z;
  tmpvar_6[2].y = xlv_TEXCOORD6.z;
  tmpvar_6[2].z = tmpvar_2.z;
  vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3.xyz));
  vec3 normal_8;
  normal_8.xy = ((texture2D (_NormalMap, (
    (xlv_TEXCOORD0 * _NormalMap_ST.xy)
   + _NormalMap_ST.zw)).wy * 2.0) - 1.0);
  normal_8.z = sqrt((1.0 - clamp (
    dot (normal_8.xy, normal_8.xy)
  , 0.0, 1.0)));
  vec3 tmpvar_9;
  tmpvar_9 = normalize((mix (vec3(0.0, 0.0, 1.0), normal_8, vec3(_NormalIntensity)) * tmpvar_6));
  vec3 tmpvar_10;
  vec3 I_11;
  I_11 = -(tmpvar_7);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_7 + tmpvar_12));
  float tmpvar_14;
  tmpvar_14 = exp2(((_Gloss * 10.0) + 1.0));
  tmpvar_4 = xlv_TEXCOORD3.xyz;
  tmpvar_3 = (1.0 - _Gloss);
  vec3 ambient_15;
  ambient_15 = xlv_TEXCOORD8.xyz;
  vec3 ambient_contrib_16;
  ambient_contrib_16 = vec3(0.0, 0.0, 0.0);
  if ((unity_ProbeVolumeParams.x == 1.0)) {
    vec4 tmpvar_17;
    tmpvar_17.w = 1.0;
    tmpvar_17.xyz = tmpvar_9;
    vec3 x1_18;
    vec3 texCoord_19;
    vec3 tmpvar_20;
    if ((unity_ProbeVolumeParams.y == 1.0)) {
      vec4 tmpvar_21;
      tmpvar_21.w = 1.0;
      tmpvar_21.xyz = tmpvar_4;
      tmpvar_20 = (unity_ProbeVolumeWorldToObject * tmpvar_21).xyz;
    } else {
      tmpvar_20 = tmpvar_4;
    };
    vec3 tmpvar_22;
    tmpvar_22 = ((tmpvar_20 - unity_ProbeVolumeMin) * unity_ProbeVolumeSizeInv);
    texCoord_19.yz = tmpvar_22.yz;
    texCoord_19.x = (tmpvar_22.x * 0.25);
    float tmpvar_23;
    float tmpvar_24;
    tmpvar_24 = (0.5 * unity_ProbeVolumeParams.z);
    tmpvar_23 = clamp (texCoord_19.x, tmpvar_24, (0.25 - tmpvar_24));
    texCoord_19.x = tmpvar_23;
    vec4 tmpvar_25;
    tmpvar_25 = texture3D (unity_ProbeVolumeSH, texCoord_19);
    texCoord_19.x = (tmpvar_23 + 0.25);
    vec4 tmpvar_26;
    tmpvar_26 = texture3D (unity_ProbeVolumeSH, texCoord_19);
    texCoord_19.x = (tmpvar_23 + 0.5);
    x1_18.x = dot (tmpvar_25, tmpvar_17);
    x1_18.y = dot (tmpvar_26, tmpvar_17);
    x1_18.z = dot (texture3D (unity_ProbeVolumeSH, texCoord_19), tmpvar_17);
    ambient_contrib_16 = x1_18;
  } else {
    vec4 tmpvar_27;
    tmpvar_27.w = 1.0;
    tmpvar_27.xyz = tmpvar_9;
    vec3 x_28;
    x_28.x = dot (unity_SHAr, tmpvar_27);
    x_28.y = dot (unity_SHAg, tmpvar_27);
    x_28.z = dot (unity_SHAb, tmpvar_27);
    ambient_contrib_16 = x_28;
  };
  vec3 tmpvar_29;
  tmpvar_29 = max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD8.xyz + ambient_contrib_16));
  ambient_15 = tmpvar_29;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_15 = max (((1.055 * 
      pow (max (tmpvar_29, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0));
  };
  vec3 specular_30;
  vec3 worldRefl_31;
  worldRefl_31 = tmpvar_10;
  vec3 worldPos_32;
  worldPos_32 = tmpvar_4;
  if ((unity_SpecCube0_ProbePosition.w > 0.0)) {
    vec3 tmpvar_33;
    tmpvar_33 = normalize(tmpvar_10);
    vec3 tmpvar_34;
    tmpvar_34 = ((unity_SpecCube0_BoxMax.xyz - xlv_TEXCOORD3.xyz) / tmpvar_33);
    vec3 tmpvar_35;
    tmpvar_35 = ((unity_SpecCube0_BoxMin.xyz - xlv_TEXCOORD3.xyz) / tmpvar_33);
    bvec3 tmpvar_36;
    tmpvar_36 = greaterThan (tmpvar_33, vec3(0.0, 0.0, 0.0));
    float tmpvar_37;
    if (tmpvar_36.x) {
      tmpvar_37 = tmpvar_34.x;
    } else {
      tmpvar_37 = tmpvar_35.x;
    };
    float tmpvar_38;
    if (tmpvar_36.y) {
      tmpvar_38 = tmpvar_34.y;
    } else {
      tmpvar_38 = tmpvar_35.y;
    };
    float tmpvar_39;
    if (tmpvar_36.z) {
      tmpvar_39 = tmpvar_34.z;
    } else {
      tmpvar_39 = tmpvar_35.z;
    };
    worldPos_32 = (xlv_TEXCOORD3.xyz - unity_SpecCube0_ProbePosition.xyz);
    worldRefl_31 = (worldPos_32 + (tmpvar_33 * min (
      min (tmpvar_37, tmpvar_38)
    , tmpvar_39)));
  };
  vec4 tmpvar_40;
  tmpvar_40.xyz = worldRefl_31;
  tmpvar_40.w = ((tmpvar_3 * (1.7 - 
    (0.7 * tmpvar_3)
  )) * 6.0);
  vec4 tmpvar_41;
  tmpvar_41 = textureCubeLod (unity_SpecCube0, worldRefl_31, tmpvar_40.w);
  vec3 tmpvar_42;
  tmpvar_42 = ((unity_SpecCube0_HDR.x * pow (tmpvar_41.w, unity_SpecCube0_HDR.y)) * tmpvar_41.xyz);
  if ((unity_SpecCube0_BoxMin.w < 0.99999)) {
    vec3 worldRefl_43;
    worldRefl_43 = tmpvar_10;
    vec3 worldPos_44;
    worldPos_44 = tmpvar_4;
    if ((unity_SpecCube1_ProbePosition.w > 0.0)) {
      vec3 tmpvar_45;
      tmpvar_45 = normalize(tmpvar_10);
      vec3 tmpvar_46;
      tmpvar_46 = ((unity_SpecCube1_BoxMax.xyz - xlv_TEXCOORD3.xyz) / tmpvar_45);
      vec3 tmpvar_47;
      tmpvar_47 = ((unity_SpecCube1_BoxMin.xyz - xlv_TEXCOORD3.xyz) / tmpvar_45);
      bvec3 tmpvar_48;
      tmpvar_48 = greaterThan (tmpvar_45, vec3(0.0, 0.0, 0.0));
      float tmpvar_49;
      if (tmpvar_48.x) {
        tmpvar_49 = tmpvar_46.x;
      } else {
        tmpvar_49 = tmpvar_47.x;
      };
      float tmpvar_50;
      if (tmpvar_48.y) {
        tmpvar_50 = tmpvar_46.y;
      } else {
        tmpvar_50 = tmpvar_47.y;
      };
      float tmpvar_51;
      if (tmpvar_48.z) {
        tmpvar_51 = tmpvar_46.z;
      } else {
        tmpvar_51 = tmpvar_47.z;
      };
      worldPos_44 = (xlv_TEXCOORD3.xyz - unity_SpecCube1_ProbePosition.xyz);
      worldRefl_43 = (worldPos_44 + (tmpvar_45 * min (
        min (tmpvar_49, tmpvar_50)
      , tmpvar_51)));
    };
    vec4 tmpvar_52;
    tmpvar_52.xyz = worldRefl_43;
    tmpvar_52.w = ((tmpvar_3 * (1.7 - 
      (0.7 * tmpvar_3)
    )) * 6.0);
    vec4 tmpvar_53;
    tmpvar_53 = textureCubeLod (unity_SpecCube1, worldRefl_43, tmpvar_52.w);
    specular_30 = mix (((unity_SpecCube1_HDR.x * 
      pow (tmpvar_53.w, unity_SpecCube1_HDR.y)
    ) * tmpvar_53.xyz), tmpvar_42, unity_SpecCube0_BoxMin.www);
  } else {
    specular_30 = tmpvar_42;
  };
  vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_SpecularMap, (
    (xlv_TEXCOORD0 * _SpecularMap_ST.xy)
   + _SpecularMap_ST.zw)).xyz * _SpecIntensity) * _Speccolor.xyz);
  vec4 tmpvar_55;
  tmpvar_55 = texture2D (_DiffuseMapTransA, ((xlv_TEXCOORD0 * _DiffuseMapTransA_ST.xy) + _DiffuseMapTransA_ST.zw));
  vec4 tmpvar_56;
  tmpvar_56.xyz = (((
    (max (0.0, dot (tmpvar_9, tmpvar_12)) * _LightColor0.xyz)
   + ambient_15) * (tmpvar_55.xyz * _Diffusecolor.xyz)) + ((
    pow (max (0.0, dot (tmpvar_13, tmpvar_9)), tmpvar_14)
   * tmpvar_54) + (specular_30 * tmpvar_54)));
  tmpvar_56.w = (tmpvar_55.w * _Transparency);
  gl_FragData[0] = tmpvar_56;
}


#endif
"
}
SubProgram "metal " {
// Stats: 17 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
Bind "texcoord2" ATTR5
ConstBuffer "$Globals" 192
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [unity_ObjectToWorld]
Matrix 128 [unity_WorldToObject]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
  float4 _glesMultiTexCoord2 [[attribute(5)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float4 xlv_TEXCOORD8;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4x4 unity_ObjectToWorld;
  float4x4 unity_WorldToObject;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 v_1 = 0;
  v_1.x = _mtl_u.unity_WorldToObject[0].x;
  v_1.y = _mtl_u.unity_WorldToObject[1].x;
  v_1.z = _mtl_u.unity_WorldToObject[2].x;
  v_1.w = _mtl_u.unity_WorldToObject[3].x;
  float4 v_2 = 0;
  v_2.x = _mtl_u.unity_WorldToObject[0].y;
  v_2.y = _mtl_u.unity_WorldToObject[1].y;
  v_2.z = _mtl_u.unity_WorldToObject[2].y;
  v_2.w = _mtl_u.unity_WorldToObject[3].y;
  float4 v_3 = 0;
  v_3.x = _mtl_u.unity_WorldToObject[0].z;
  v_3.y = _mtl_u.unity_WorldToObject[1].z;
  v_3.z = _mtl_u.unity_WorldToObject[2].z;
  v_3.w = _mtl_u.unity_WorldToObject[3].z;
  float3 tmpvar_4 = 0;
  tmpvar_4 = normalize(((
    (v_1.xyz * _mtl_i._glesNormal.x)
   + 
    (v_2.xyz * _mtl_i._glesNormal.y)
  ) + (v_3.xyz * _mtl_i._glesNormal.z)));
  float4 tmpvar_5 = 0;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _mtl_i._glesTANGENT.xyz;
  float3 tmpvar_6 = 0;
  tmpvar_6 = normalize((_mtl_u.unity_ObjectToWorld * tmpvar_5).xyz);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = _mtl_i._glesMultiTexCoord0.xy;
  _mtl_o.xlv_TEXCOORD1 = _mtl_i._glesMultiTexCoord1.xy;
  _mtl_o.xlv_TEXCOORD2 = _mtl_i._glesMultiTexCoord2.xy;
  _mtl_o.xlv_TEXCOORD3 = (_mtl_u.unity_ObjectToWorld * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD4 = tmpvar_4;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * _mtl_i._glesTANGENT.w));
  _mtl_o.xlv_TEXCOORD8 = float4(0.0, 0.0, 0.0, 0.0);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec2 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD3 = hlslcc_mtx4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD6.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DiffuseMapTransA_ST;
uniform 	vec4 _Diffusecolor;
uniform 	vec4 _NormalMap_ST;
uniform 	float _NormalIntensity;
uniform 	vec4 _SpecularMap_ST;
uniform 	vec4 _Speccolor;
uniform 	float _SpecIntensity;
uniform 	float _Gloss;
uniform 	float _Transparency;
uniform  sampler2D _NormalMap;
uniform  sampler2D _SpecularMap;
uniform  sampler2D _DiffuseMapTransA;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
in  vec4 vs_TEXCOORD8;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat5;
lowp vec4 u_xlat10_5;
vec3 u_xlat6;
lowp vec4 u_xlat10_6;
vec3 u_xlat7;
lowp vec4 u_xlat10_7;
vec3 u_xlat8;
bvec3 u_xlatb8;
vec3 u_xlat9;
bvec3 u_xlatb10;
vec3 u_xlat11;
float u_xlat15;
float u_xlat33;
float u_xlat34;
mediump float u_xlat16_34;
float u_xlat35;
mediump float u_xlat16_35;
bool u_xlatb35;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat0.x = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0u)) ? 1.0 : -1.0;
    u_xlat11.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat11.x = inversesqrt(u_xlat11.x);
    u_xlat11.xyz = u_xlat11.xxx * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat11.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_3 = texture(_NormalMap, u_xlat3.xy);
    u_xlat4.xy = u_xlat10_3.wy + u_xlat10_3.wy;
    u_xlat16_3.xy = u_xlat10_3.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_34 = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_34 = min(u_xlat16_34, 1.0);
    u_xlat16_34 = (-u_xlat16_34) + 1.0;
    u_xlat4.z = sqrt(u_xlat16_34);
    u_xlat3.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = vec3(_NormalIntensity) * u_xlat3.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat4.xyz = u_xlat3.yyy * vs_TEXCOORD6.xyz;
    u_xlat3.xyw = u_xlat3.xxx * vs_TEXCOORD5.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat3.zzz * u_xlat0.xyz + u_xlat3.xyw;
    u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat34);
    u_xlat0.x = dot((-u_xlat2.xyz), u_xlat3.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat3.xyz * (-u_xlat0.xxx) + (-u_xlat2.xyz);
    u_xlat34 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat2.xyz = vec3(u_xlat34) * _WorldSpaceLightPos0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat33) + u_xlat2.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = _Gloss * 10.0 + 1.0;
    u_xlat33 = exp2(u_xlat33);
    u_xlat34 = (-_Gloss) + 1.0;
    u_xlatb35 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb35){
        u_xlatb35 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD3.yyy * hlslcc_mtx4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD3.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD3.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb35)) ? u_xlat4.xyz : vs_TEXCOORD3.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat35 = u_xlat4.y * 0.25;
        u_xlat15 = unity_ProbeVolumeParams.z * 0.5;
        u_xlat5.x = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat35 = max(u_xlat35, u_xlat15);
        u_xlat4.x = min(u_xlat5.x, u_xlat35);
        u_xlat10_5 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
        u_xlat6.xyz = u_xlat4.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_6 = texture(unity_ProbeVolumeSH, u_xlat6.xyz);
        u_xlat4.xyz = u_xlat4.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_4 = texture(unity_ProbeVolumeSH, u_xlat4.xyz);
        u_xlat3.w = 1.0;
        u_xlat5.x = dot(u_xlat10_5, u_xlat3);
        u_xlat5.y = dot(u_xlat10_6, u_xlat3);
        u_xlat5.z = dot(u_xlat10_4, u_xlat3);
    } else {
        u_xlat3.w = 1.0;
        u_xlat5.x = dot(unity_SHAr, u_xlat3);
        u_xlat5.y = dot(unity_SHAg, u_xlat3);
        u_xlat5.z = dot(unity_SHAb, u_xlat3);
    //ENDIF
    }
    u_xlat4.xyz = u_xlat5.xyz + vs_TEXCOORD8.xyz;
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb35 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat5.xyz = log2(u_xlat4.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = (bool(u_xlatb35)) ? u_xlat5.xyz : u_xlat4.xyz;
    u_xlatb35 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb35){
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat5.xyz = u_xlat0.xyz * vec3(u_xlat35);
        u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
        u_xlat7.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
        u_xlat6.x = (u_xlatb8.x) ? u_xlat6.x : u_xlat7.x;
        u_xlat6.y = (u_xlatb8.y) ? u_xlat6.y : u_xlat7.y;
        u_xlat6.z = (u_xlatb8.z) ? u_xlat6.z : u_xlat7.z;
        u_xlat35 = min(u_xlat6.y, u_xlat6.x);
        u_xlat35 = min(u_xlat6.z, u_xlat35);
        u_xlat6.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat35) + u_xlat6.xyz;
    } else {
        u_xlat5.xyz = u_xlat0.xyz;
    //ENDIF
    }
    u_xlat35 = (-u_xlat34) * 0.699999988 + 1.70000005;
    u_xlat34 = u_xlat34 * u_xlat35;
    u_xlat34 = u_xlat34 * 6.0;
    u_xlat10_5 = textureLod(unity_SpecCube0, u_xlat5.xyz, u_xlat34);
    u_xlat16_35 = log2(u_xlat10_5.w);
    u_xlat35 = u_xlat16_35 * unity_SpecCube0_HDR.y;
    u_xlat35 = exp2(u_xlat35);
    u_xlat35 = u_xlat35 * unity_SpecCube0_HDR.x;
    u_xlat6.xyz = u_xlat10_5.xyz * vec3(u_xlat35);
    u_xlatb36 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb36){
        u_xlatb36 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb36){
            u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
            u_xlat36 = inversesqrt(u_xlat36);
            u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat36);
            u_xlat8.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
            u_xlat9.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
            u_xlat8.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
            u_xlat8.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
            u_xlat8.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
            u_xlat36 = min(u_xlat8.y, u_xlat8.x);
            u_xlat36 = min(u_xlat8.z, u_xlat36);
            u_xlat8.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat0.xyz = u_xlat7.xyz * vec3(u_xlat36) + u_xlat8.xyz;
        //ENDIF
        }
        u_xlat10_7 = textureLod(unity_SpecCube1, u_xlat0.xyz, u_xlat34);
        u_xlat16_0 = log2(u_xlat10_7.w);
        u_xlat0.x = u_xlat16_0 * unity_SpecCube1_HDR.y;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * unity_SpecCube1_HDR.x;
        u_xlat0.xyz = u_xlat10_7.xyz * u_xlat0.xxx;
        u_xlat5.xyz = vec3(u_xlat35) * u_xlat10_5.xyz + (-u_xlat0.xyz);
        u_xlat6.xyz = unity_SpecCube0_BoxMin.www * u_xlat5.xyz + u_xlat0.xyz;
    //ENDIF
    }
    u_xlat0.xy = vs_TEXCOORD0.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
    u_xlat10_5 = texture(_SpecularMap, u_xlat0.xy);
    u_xlat0.xyz = u_xlat10_5.xyz * vec3(_SpecIntensity);
    u_xlat0.xyz = u_xlat0.xyz * _Speccolor.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat33 = u_xlat33 * u_xlat1.x;
    u_xlat33 = exp2(u_xlat33);
    u_xlat1.xyz = u_xlat0.xyz * u_xlat6.xyz;
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat33 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat33 = max(u_xlat33, 0.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _DiffuseMapTransA_ST.xy + _DiffuseMapTransA_ST.zw;
    u_xlat10_1 = texture(_DiffuseMapTransA, u_xlat1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * _Diffusecolor.xyz;
    u_xlat2.xyz = vec3(u_xlat33) * _LightColor0.xyz + u_xlat4.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_1.w * _Transparency;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 122 math, 8 textures, 14 branches
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#version 120

#ifdef VERTEX

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
attribute vec4 TANGENT;
varying vec2 xlv_TEXCOORD0;
varying vec2 xlv_TEXCOORD1;
varying vec2 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec4 xlv_TEXCOORD8;
void main ()
{
  vec4 v_1;
  v_1.x = unity_WorldToObject[0].x;
  v_1.y = unity_WorldToObject[1].x;
  v_1.z = unity_WorldToObject[2].x;
  v_1.w = unity_WorldToObject[3].x;
  vec4 v_2;
  v_2.x = unity_WorldToObject[0].y;
  v_2.y = unity_WorldToObject[1].y;
  v_2.z = unity_WorldToObject[2].y;
  v_2.w = unity_WorldToObject[3].y;
  vec4 v_3;
  v_3.x = unity_WorldToObject[0].z;
  v_3.y = unity_WorldToObject[1].z;
  v_3.z = unity_WorldToObject[2].z;
  v_3.w = unity_WorldToObject[3].z;
  vec3 tmpvar_4;
  tmpvar_4 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = TANGENT.xyz;
  vec3 tmpvar_6;
  tmpvar_6 = normalize((unity_ObjectToWorld * tmpvar_5).xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = gl_MultiTexCoord0.xy;
  xlv_TEXCOORD1 = gl_MultiTexCoord1.xy;
  xlv_TEXCOORD2 = gl_MultiTexCoord2.xy;
  xlv_TEXCOORD3 = (unity_ObjectToWorld * gl_Vertex);
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * TANGENT.w));
  xlv_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform samplerCube unity_SpecCube0;
uniform samplerCube unity_SpecCube1;
uniform vec4 unity_SpecCube0_BoxMax;
uniform vec4 unity_SpecCube0_BoxMin;
uniform vec4 unity_SpecCube0_ProbePosition;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_SpecCube1_BoxMax;
uniform vec4 unity_SpecCube1_BoxMin;
uniform vec4 unity_SpecCube1_ProbePosition;
uniform vec4 unity_SpecCube1_HDR;
uniform sampler3D unity_ProbeVolumeSH;
uniform vec4 unity_ProbeVolumeParams;
uniform mat4 unity_ProbeVolumeWorldToObject;
uniform vec3 unity_ProbeVolumeSizeInv;
uniform vec3 unity_ProbeVolumeMin;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _LightColor0;
uniform sampler2D _DiffuseMapTransA;
uniform vec4 _DiffuseMapTransA_ST;
uniform vec4 _Diffusecolor;
uniform sampler2D _NormalMap;
uniform vec4 _NormalMap_ST;
uniform float _NormalIntensity;
uniform sampler2D _SpecularMap;
uniform vec4 _SpecularMap_ST;
uniform vec4 _Speccolor;
uniform float _SpecIntensity;
uniform float _Gloss;
uniform float _Transparency;
varying vec2 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec4 xlv_TEXCOORD8;
void main ()
{
  float tmpvar_1;
  if (gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD4;
  float tmpvar_3;
  vec3 tmpvar_4;
  int tmpvar_5;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_5 = 1;
  } else {
    tmpvar_5 = -1;
  };
  tmpvar_2 = (normalize(xlv_TEXCOORD4) * float(tmpvar_5));
  mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD5.x;
  tmpvar_6[0].y = xlv_TEXCOORD6.x;
  tmpvar_6[0].z = tmpvar_2.x;
  tmpvar_6[1].x = xlv_TEXCOORD5.y;
  tmpvar_6[1].y = xlv_TEXCOORD6.y;
  tmpvar_6[1].z = tmpvar_2.y;
  tmpvar_6[2].x = xlv_TEXCOORD5.z;
  tmpvar_6[2].y = xlv_TEXCOORD6.z;
  tmpvar_6[2].z = tmpvar_2.z;
  vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3.xyz));
  vec3 normal_8;
  normal_8.xy = ((texture2D (_NormalMap, (
    (xlv_TEXCOORD0 * _NormalMap_ST.xy)
   + _NormalMap_ST.zw)).wy * 2.0) - 1.0);
  normal_8.z = sqrt((1.0 - clamp (
    dot (normal_8.xy, normal_8.xy)
  , 0.0, 1.0)));
  vec3 tmpvar_9;
  tmpvar_9 = normalize((mix (vec3(0.0, 0.0, 1.0), normal_8, vec3(_NormalIntensity)) * tmpvar_6));
  vec3 tmpvar_10;
  vec3 I_11;
  I_11 = -(tmpvar_7);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_7 + tmpvar_12));
  float tmpvar_14;
  tmpvar_14 = exp2(((_Gloss * 10.0) + 1.0));
  tmpvar_4 = xlv_TEXCOORD3.xyz;
  tmpvar_3 = (1.0 - _Gloss);
  vec3 ambient_15;
  ambient_15 = xlv_TEXCOORD8.xyz;
  vec3 ambient_contrib_16;
  ambient_contrib_16 = vec3(0.0, 0.0, 0.0);
  if ((unity_ProbeVolumeParams.x == 1.0)) {
    vec4 tmpvar_17;
    tmpvar_17.w = 1.0;
    tmpvar_17.xyz = tmpvar_9;
    vec3 x1_18;
    vec3 texCoord_19;
    vec3 tmpvar_20;
    if ((unity_ProbeVolumeParams.y == 1.0)) {
      vec4 tmpvar_21;
      tmpvar_21.w = 1.0;
      tmpvar_21.xyz = tmpvar_4;
      tmpvar_20 = (unity_ProbeVolumeWorldToObject * tmpvar_21).xyz;
    } else {
      tmpvar_20 = tmpvar_4;
    };
    vec3 tmpvar_22;
    tmpvar_22 = ((tmpvar_20 - unity_ProbeVolumeMin) * unity_ProbeVolumeSizeInv);
    texCoord_19.yz = tmpvar_22.yz;
    texCoord_19.x = (tmpvar_22.x * 0.25);
    float tmpvar_23;
    float tmpvar_24;
    tmpvar_24 = (0.5 * unity_ProbeVolumeParams.z);
    tmpvar_23 = clamp (texCoord_19.x, tmpvar_24, (0.25 - tmpvar_24));
    texCoord_19.x = tmpvar_23;
    vec4 tmpvar_25;
    tmpvar_25 = texture3D (unity_ProbeVolumeSH, texCoord_19);
    texCoord_19.x = (tmpvar_23 + 0.25);
    vec4 tmpvar_26;
    tmpvar_26 = texture3D (unity_ProbeVolumeSH, texCoord_19);
    texCoord_19.x = (tmpvar_23 + 0.5);
    x1_18.x = dot (tmpvar_25, tmpvar_17);
    x1_18.y = dot (tmpvar_26, tmpvar_17);
    x1_18.z = dot (texture3D (unity_ProbeVolumeSH, texCoord_19), tmpvar_17);
    ambient_contrib_16 = x1_18;
  } else {
    vec4 tmpvar_27;
    tmpvar_27.w = 1.0;
    tmpvar_27.xyz = tmpvar_9;
    vec3 x_28;
    x_28.x = dot (unity_SHAr, tmpvar_27);
    x_28.y = dot (unity_SHAg, tmpvar_27);
    x_28.z = dot (unity_SHAb, tmpvar_27);
    ambient_contrib_16 = x_28;
  };
  vec3 tmpvar_29;
  tmpvar_29 = max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD8.xyz + ambient_contrib_16));
  ambient_15 = tmpvar_29;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_15 = max (((1.055 * 
      pow (max (tmpvar_29, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0));
  };
  vec3 specular_30;
  vec3 worldRefl_31;
  worldRefl_31 = tmpvar_10;
  vec3 worldPos_32;
  worldPos_32 = tmpvar_4;
  if ((unity_SpecCube0_ProbePosition.w > 0.0)) {
    vec3 tmpvar_33;
    tmpvar_33 = normalize(tmpvar_10);
    vec3 tmpvar_34;
    tmpvar_34 = ((unity_SpecCube0_BoxMax.xyz - xlv_TEXCOORD3.xyz) / tmpvar_33);
    vec3 tmpvar_35;
    tmpvar_35 = ((unity_SpecCube0_BoxMin.xyz - xlv_TEXCOORD3.xyz) / tmpvar_33);
    bvec3 tmpvar_36;
    tmpvar_36 = greaterThan (tmpvar_33, vec3(0.0, 0.0, 0.0));
    float tmpvar_37;
    if (tmpvar_36.x) {
      tmpvar_37 = tmpvar_34.x;
    } else {
      tmpvar_37 = tmpvar_35.x;
    };
    float tmpvar_38;
    if (tmpvar_36.y) {
      tmpvar_38 = tmpvar_34.y;
    } else {
      tmpvar_38 = tmpvar_35.y;
    };
    float tmpvar_39;
    if (tmpvar_36.z) {
      tmpvar_39 = tmpvar_34.z;
    } else {
      tmpvar_39 = tmpvar_35.z;
    };
    worldPos_32 = (xlv_TEXCOORD3.xyz - unity_SpecCube0_ProbePosition.xyz);
    worldRefl_31 = (worldPos_32 + (tmpvar_33 * min (
      min (tmpvar_37, tmpvar_38)
    , tmpvar_39)));
  };
  vec4 tmpvar_40;
  tmpvar_40.xyz = worldRefl_31;
  tmpvar_40.w = ((tmpvar_3 * (1.7 - 
    (0.7 * tmpvar_3)
  )) * 6.0);
  vec4 tmpvar_41;
  tmpvar_41 = textureCubeLod (unity_SpecCube0, worldRefl_31, tmpvar_40.w);
  vec3 tmpvar_42;
  tmpvar_42 = ((unity_SpecCube0_HDR.x * pow (tmpvar_41.w, unity_SpecCube0_HDR.y)) * tmpvar_41.xyz);
  if ((unity_SpecCube0_BoxMin.w < 0.99999)) {
    vec3 worldRefl_43;
    worldRefl_43 = tmpvar_10;
    vec3 worldPos_44;
    worldPos_44 = tmpvar_4;
    if ((unity_SpecCube1_ProbePosition.w > 0.0)) {
      vec3 tmpvar_45;
      tmpvar_45 = normalize(tmpvar_10);
      vec3 tmpvar_46;
      tmpvar_46 = ((unity_SpecCube1_BoxMax.xyz - xlv_TEXCOORD3.xyz) / tmpvar_45);
      vec3 tmpvar_47;
      tmpvar_47 = ((unity_SpecCube1_BoxMin.xyz - xlv_TEXCOORD3.xyz) / tmpvar_45);
      bvec3 tmpvar_48;
      tmpvar_48 = greaterThan (tmpvar_45, vec3(0.0, 0.0, 0.0));
      float tmpvar_49;
      if (tmpvar_48.x) {
        tmpvar_49 = tmpvar_46.x;
      } else {
        tmpvar_49 = tmpvar_47.x;
      };
      float tmpvar_50;
      if (tmpvar_48.y) {
        tmpvar_50 = tmpvar_46.y;
      } else {
        tmpvar_50 = tmpvar_47.y;
      };
      float tmpvar_51;
      if (tmpvar_48.z) {
        tmpvar_51 = tmpvar_46.z;
      } else {
        tmpvar_51 = tmpvar_47.z;
      };
      worldPos_44 = (xlv_TEXCOORD3.xyz - unity_SpecCube1_ProbePosition.xyz);
      worldRefl_43 = (worldPos_44 + (tmpvar_45 * min (
        min (tmpvar_49, tmpvar_50)
      , tmpvar_51)));
    };
    vec4 tmpvar_52;
    tmpvar_52.xyz = worldRefl_43;
    tmpvar_52.w = ((tmpvar_3 * (1.7 - 
      (0.7 * tmpvar_3)
    )) * 6.0);
    vec4 tmpvar_53;
    tmpvar_53 = textureCubeLod (unity_SpecCube1, worldRefl_43, tmpvar_52.w);
    specular_30 = mix (((unity_SpecCube1_HDR.x * 
      pow (tmpvar_53.w, unity_SpecCube1_HDR.y)
    ) * tmpvar_53.xyz), tmpvar_42, unity_SpecCube0_BoxMin.www);
  } else {
    specular_30 = tmpvar_42;
  };
  vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_SpecularMap, (
    (xlv_TEXCOORD0 * _SpecularMap_ST.xy)
   + _SpecularMap_ST.zw)).xyz * _SpecIntensity) * _Speccolor.xyz);
  vec4 tmpvar_55;
  tmpvar_55 = texture2D (_DiffuseMapTransA, ((xlv_TEXCOORD0 * _DiffuseMapTransA_ST.xy) + _DiffuseMapTransA_ST.zw));
  vec4 tmpvar_56;
  tmpvar_56.xyz = (((
    (max (0.0, dot (tmpvar_9, tmpvar_12)) * _LightColor0.xyz)
   + ambient_15) * (tmpvar_55.xyz * _Diffusecolor.xyz)) + ((
    pow (max (0.0, dot (tmpvar_13, tmpvar_9)), tmpvar_14)
   * tmpvar_54) + (specular_30 * tmpvar_54)));
  tmpvar_56.w = (tmpvar_55.w * _Transparency);
  gl_FragData[0] = tmpvar_56;
}


#endif
"
}
SubProgram "metal " {
// Stats: 17 math
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
Bind "texcoord2" ATTR5
ConstBuffer "$Globals" 192
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [unity_ObjectToWorld]
Matrix 128 [unity_WorldToObject]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
  float4 _glesMultiTexCoord2 [[attribute(5)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float4 xlv_TEXCOORD8;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4x4 unity_ObjectToWorld;
  float4x4 unity_WorldToObject;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 v_1 = 0;
  v_1.x = _mtl_u.unity_WorldToObject[0].x;
  v_1.y = _mtl_u.unity_WorldToObject[1].x;
  v_1.z = _mtl_u.unity_WorldToObject[2].x;
  v_1.w = _mtl_u.unity_WorldToObject[3].x;
  float4 v_2 = 0;
  v_2.x = _mtl_u.unity_WorldToObject[0].y;
  v_2.y = _mtl_u.unity_WorldToObject[1].y;
  v_2.z = _mtl_u.unity_WorldToObject[2].y;
  v_2.w = _mtl_u.unity_WorldToObject[3].y;
  float4 v_3 = 0;
  v_3.x = _mtl_u.unity_WorldToObject[0].z;
  v_3.y = _mtl_u.unity_WorldToObject[1].z;
  v_3.z = _mtl_u.unity_WorldToObject[2].z;
  v_3.w = _mtl_u.unity_WorldToObject[3].z;
  float3 tmpvar_4 = 0;
  tmpvar_4 = normalize(((
    (v_1.xyz * _mtl_i._glesNormal.x)
   + 
    (v_2.xyz * _mtl_i._glesNormal.y)
  ) + (v_3.xyz * _mtl_i._glesNormal.z)));
  float4 tmpvar_5 = 0;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _mtl_i._glesTANGENT.xyz;
  float3 tmpvar_6 = 0;
  tmpvar_6 = normalize((_mtl_u.unity_ObjectToWorld * tmpvar_5).xyz);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = _mtl_i._glesMultiTexCoord0.xy;
  _mtl_o.xlv_TEXCOORD1 = _mtl_i._glesMultiTexCoord1.xy;
  _mtl_o.xlv_TEXCOORD2 = _mtl_i._glesMultiTexCoord2.xy;
  _mtl_o.xlv_TEXCOORD3 = (_mtl_u.unity_ObjectToWorld * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD4 = tmpvar_4;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * _mtl_i._glesTANGENT.w));
  _mtl_o.xlv_TEXCOORD8 = float4(0.0, 0.0, 0.0, 0.0);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec2 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD3 = hlslcc_mtx4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD6.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DiffuseMapTransA_ST;
uniform 	vec4 _Diffusecolor;
uniform 	vec4 _NormalMap_ST;
uniform 	float _NormalIntensity;
uniform 	vec4 _SpecularMap_ST;
uniform 	vec4 _Speccolor;
uniform 	float _SpecIntensity;
uniform 	float _Gloss;
uniform 	float _Transparency;
uniform  sampler2D _NormalMap;
uniform  sampler2D _SpecularMap;
uniform  sampler2D _DiffuseMapTransA;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
in  vec4 vs_TEXCOORD8;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat5;
lowp vec4 u_xlat10_5;
vec3 u_xlat6;
lowp vec4 u_xlat10_6;
vec3 u_xlat7;
lowp vec4 u_xlat10_7;
vec3 u_xlat8;
bvec3 u_xlatb8;
vec3 u_xlat9;
bvec3 u_xlatb10;
vec3 u_xlat11;
float u_xlat15;
float u_xlat33;
float u_xlat34;
mediump float u_xlat16_34;
float u_xlat35;
mediump float u_xlat16_35;
bool u_xlatb35;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat0.x = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0u)) ? 1.0 : -1.0;
    u_xlat11.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat11.x = inversesqrt(u_xlat11.x);
    u_xlat11.xyz = u_xlat11.xxx * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat11.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_3 = texture(_NormalMap, u_xlat3.xy);
    u_xlat4.xy = u_xlat10_3.wy + u_xlat10_3.wy;
    u_xlat16_3.xy = u_xlat10_3.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_34 = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_34 = min(u_xlat16_34, 1.0);
    u_xlat16_34 = (-u_xlat16_34) + 1.0;
    u_xlat4.z = sqrt(u_xlat16_34);
    u_xlat3.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = vec3(_NormalIntensity) * u_xlat3.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat4.xyz = u_xlat3.yyy * vs_TEXCOORD6.xyz;
    u_xlat3.xyw = u_xlat3.xxx * vs_TEXCOORD5.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat3.zzz * u_xlat0.xyz + u_xlat3.xyw;
    u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat34);
    u_xlat0.x = dot((-u_xlat2.xyz), u_xlat3.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat3.xyz * (-u_xlat0.xxx) + (-u_xlat2.xyz);
    u_xlat34 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat2.xyz = vec3(u_xlat34) * _WorldSpaceLightPos0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat33) + u_xlat2.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = _Gloss * 10.0 + 1.0;
    u_xlat33 = exp2(u_xlat33);
    u_xlat34 = (-_Gloss) + 1.0;
    u_xlatb35 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb35){
        u_xlatb35 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD3.yyy * hlslcc_mtx4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD3.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD3.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb35)) ? u_xlat4.xyz : vs_TEXCOORD3.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat35 = u_xlat4.y * 0.25;
        u_xlat15 = unity_ProbeVolumeParams.z * 0.5;
        u_xlat5.x = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat35 = max(u_xlat35, u_xlat15);
        u_xlat4.x = min(u_xlat5.x, u_xlat35);
        u_xlat10_5 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
        u_xlat6.xyz = u_xlat4.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_6 = texture(unity_ProbeVolumeSH, u_xlat6.xyz);
        u_xlat4.xyz = u_xlat4.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_4 = texture(unity_ProbeVolumeSH, u_xlat4.xyz);
        u_xlat3.w = 1.0;
        u_xlat5.x = dot(u_xlat10_5, u_xlat3);
        u_xlat5.y = dot(u_xlat10_6, u_xlat3);
        u_xlat5.z = dot(u_xlat10_4, u_xlat3);
    } else {
        u_xlat3.w = 1.0;
        u_xlat5.x = dot(unity_SHAr, u_xlat3);
        u_xlat5.y = dot(unity_SHAg, u_xlat3);
        u_xlat5.z = dot(unity_SHAb, u_xlat3);
    //ENDIF
    }
    u_xlat4.xyz = u_xlat5.xyz + vs_TEXCOORD8.xyz;
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb35 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat5.xyz = log2(u_xlat4.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = (bool(u_xlatb35)) ? u_xlat5.xyz : u_xlat4.xyz;
    u_xlatb35 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb35){
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat5.xyz = u_xlat0.xyz * vec3(u_xlat35);
        u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
        u_xlat7.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
        u_xlat6.x = (u_xlatb8.x) ? u_xlat6.x : u_xlat7.x;
        u_xlat6.y = (u_xlatb8.y) ? u_xlat6.y : u_xlat7.y;
        u_xlat6.z = (u_xlatb8.z) ? u_xlat6.z : u_xlat7.z;
        u_xlat35 = min(u_xlat6.y, u_xlat6.x);
        u_xlat35 = min(u_xlat6.z, u_xlat35);
        u_xlat6.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat35) + u_xlat6.xyz;
    } else {
        u_xlat5.xyz = u_xlat0.xyz;
    //ENDIF
    }
    u_xlat35 = (-u_xlat34) * 0.699999988 + 1.70000005;
    u_xlat34 = u_xlat34 * u_xlat35;
    u_xlat34 = u_xlat34 * 6.0;
    u_xlat10_5 = textureLod(unity_SpecCube0, u_xlat5.xyz, u_xlat34);
    u_xlat16_35 = log2(u_xlat10_5.w);
    u_xlat35 = u_xlat16_35 * unity_SpecCube0_HDR.y;
    u_xlat35 = exp2(u_xlat35);
    u_xlat35 = u_xlat35 * unity_SpecCube0_HDR.x;
    u_xlat6.xyz = u_xlat10_5.xyz * vec3(u_xlat35);
    u_xlatb36 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb36){
        u_xlatb36 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb36){
            u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
            u_xlat36 = inversesqrt(u_xlat36);
            u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat36);
            u_xlat8.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
            u_xlat9.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
            u_xlat8.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
            u_xlat8.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
            u_xlat8.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
            u_xlat36 = min(u_xlat8.y, u_xlat8.x);
            u_xlat36 = min(u_xlat8.z, u_xlat36);
            u_xlat8.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat0.xyz = u_xlat7.xyz * vec3(u_xlat36) + u_xlat8.xyz;
        //ENDIF
        }
        u_xlat10_7 = textureLod(unity_SpecCube1, u_xlat0.xyz, u_xlat34);
        u_xlat16_0 = log2(u_xlat10_7.w);
        u_xlat0.x = u_xlat16_0 * unity_SpecCube1_HDR.y;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * unity_SpecCube1_HDR.x;
        u_xlat0.xyz = u_xlat10_7.xyz * u_xlat0.xxx;
        u_xlat5.xyz = vec3(u_xlat35) * u_xlat10_5.xyz + (-u_xlat0.xyz);
        u_xlat6.xyz = unity_SpecCube0_BoxMin.www * u_xlat5.xyz + u_xlat0.xyz;
    //ENDIF
    }
    u_xlat0.xy = vs_TEXCOORD0.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
    u_xlat10_5 = texture(_SpecularMap, u_xlat0.xy);
    u_xlat0.xyz = u_xlat10_5.xyz * vec3(_SpecIntensity);
    u_xlat0.xyz = u_xlat0.xyz * _Speccolor.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat33 = u_xlat33 * u_xlat1.x;
    u_xlat33 = exp2(u_xlat33);
    u_xlat1.xyz = u_xlat0.xyz * u_xlat6.xyz;
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat33 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat33 = max(u_xlat33, 0.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _DiffuseMapTransA_ST.xy + _DiffuseMapTransA_ST.zw;
    u_xlat10_1 = texture(_DiffuseMapTransA, u_xlat1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * _Diffusecolor.xyz;
    u_xlat2.xyz = vec3(u_xlat33) * _LightColor0.xyz + u_xlat4.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_1.w * _Transparency;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 122 math, 8 textures, 14 branches
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#version 120

#ifdef VERTEX

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
attribute vec4 TANGENT;
varying vec2 xlv_TEXCOORD0;
varying vec2 xlv_TEXCOORD1;
varying vec2 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec4 xlv_TEXCOORD8;
void main ()
{
  vec4 v_1;
  v_1.x = unity_WorldToObject[0].x;
  v_1.y = unity_WorldToObject[1].x;
  v_1.z = unity_WorldToObject[2].x;
  v_1.w = unity_WorldToObject[3].x;
  vec4 v_2;
  v_2.x = unity_WorldToObject[0].y;
  v_2.y = unity_WorldToObject[1].y;
  v_2.z = unity_WorldToObject[2].y;
  v_2.w = unity_WorldToObject[3].y;
  vec4 v_3;
  v_3.x = unity_WorldToObject[0].z;
  v_3.y = unity_WorldToObject[1].z;
  v_3.z = unity_WorldToObject[2].z;
  v_3.w = unity_WorldToObject[3].z;
  vec3 tmpvar_4;
  tmpvar_4 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = TANGENT.xyz;
  vec3 tmpvar_6;
  tmpvar_6 = normalize((unity_ObjectToWorld * tmpvar_5).xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = gl_MultiTexCoord0.xy;
  xlv_TEXCOORD1 = gl_MultiTexCoord1.xy;
  xlv_TEXCOORD2 = gl_MultiTexCoord2.xy;
  xlv_TEXCOORD3 = (unity_ObjectToWorld * gl_Vertex);
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * TANGENT.w));
  xlv_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
#ifdef FRAGMENT
#extension GL_ARB_shader_texture_lod : enable
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 unity_SHAr;
uniform vec4 unity_SHAg;
uniform vec4 unity_SHAb;
uniform samplerCube unity_SpecCube0;
uniform samplerCube unity_SpecCube1;
uniform vec4 unity_SpecCube0_BoxMax;
uniform vec4 unity_SpecCube0_BoxMin;
uniform vec4 unity_SpecCube0_ProbePosition;
uniform vec4 unity_SpecCube0_HDR;
uniform vec4 unity_SpecCube1_BoxMax;
uniform vec4 unity_SpecCube1_BoxMin;
uniform vec4 unity_SpecCube1_ProbePosition;
uniform vec4 unity_SpecCube1_HDR;
uniform sampler3D unity_ProbeVolumeSH;
uniform vec4 unity_ProbeVolumeParams;
uniform mat4 unity_ProbeVolumeWorldToObject;
uniform vec3 unity_ProbeVolumeSizeInv;
uniform vec3 unity_ProbeVolumeMin;
uniform vec4 unity_ColorSpaceLuminance;
uniform vec4 _LightColor0;
uniform sampler2D _DiffuseMapTransA;
uniform vec4 _DiffuseMapTransA_ST;
uniform vec4 _Diffusecolor;
uniform sampler2D _NormalMap;
uniform vec4 _NormalMap_ST;
uniform float _NormalIntensity;
uniform sampler2D _SpecularMap;
uniform vec4 _SpecularMap_ST;
uniform vec4 _Speccolor;
uniform float _SpecIntensity;
uniform float _Gloss;
uniform float _Transparency;
varying vec2 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec4 xlv_TEXCOORD8;
void main ()
{
  float tmpvar_1;
  if (gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD4;
  float tmpvar_3;
  vec3 tmpvar_4;
  int tmpvar_5;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_5 = 1;
  } else {
    tmpvar_5 = -1;
  };
  tmpvar_2 = (normalize(xlv_TEXCOORD4) * float(tmpvar_5));
  mat3 tmpvar_6;
  tmpvar_6[0].x = xlv_TEXCOORD5.x;
  tmpvar_6[0].y = xlv_TEXCOORD6.x;
  tmpvar_6[0].z = tmpvar_2.x;
  tmpvar_6[1].x = xlv_TEXCOORD5.y;
  tmpvar_6[1].y = xlv_TEXCOORD6.y;
  tmpvar_6[1].z = tmpvar_2.y;
  tmpvar_6[2].x = xlv_TEXCOORD5.z;
  tmpvar_6[2].y = xlv_TEXCOORD6.z;
  tmpvar_6[2].z = tmpvar_2.z;
  vec3 tmpvar_7;
  tmpvar_7 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3.xyz));
  vec3 normal_8;
  normal_8.xy = ((texture2D (_NormalMap, (
    (xlv_TEXCOORD0 * _NormalMap_ST.xy)
   + _NormalMap_ST.zw)).wy * 2.0) - 1.0);
  normal_8.z = sqrt((1.0 - clamp (
    dot (normal_8.xy, normal_8.xy)
  , 0.0, 1.0)));
  vec3 tmpvar_9;
  tmpvar_9 = normalize((mix (vec3(0.0, 0.0, 1.0), normal_8, vec3(_NormalIntensity)) * tmpvar_6));
  vec3 tmpvar_10;
  vec3 I_11;
  I_11 = -(tmpvar_7);
  tmpvar_10 = (I_11 - (2.0 * (
    dot (tmpvar_9, I_11)
   * tmpvar_9)));
  vec3 tmpvar_12;
  tmpvar_12 = normalize(_WorldSpaceLightPos0.xyz);
  vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_7 + tmpvar_12));
  float tmpvar_14;
  tmpvar_14 = exp2(((_Gloss * 10.0) + 1.0));
  tmpvar_4 = xlv_TEXCOORD3.xyz;
  tmpvar_3 = (1.0 - _Gloss);
  vec3 ambient_15;
  ambient_15 = xlv_TEXCOORD8.xyz;
  vec3 ambient_contrib_16;
  ambient_contrib_16 = vec3(0.0, 0.0, 0.0);
  if ((unity_ProbeVolumeParams.x == 1.0)) {
    vec4 tmpvar_17;
    tmpvar_17.w = 1.0;
    tmpvar_17.xyz = tmpvar_9;
    vec3 x1_18;
    vec3 texCoord_19;
    vec3 tmpvar_20;
    if ((unity_ProbeVolumeParams.y == 1.0)) {
      vec4 tmpvar_21;
      tmpvar_21.w = 1.0;
      tmpvar_21.xyz = tmpvar_4;
      tmpvar_20 = (unity_ProbeVolumeWorldToObject * tmpvar_21).xyz;
    } else {
      tmpvar_20 = tmpvar_4;
    };
    vec3 tmpvar_22;
    tmpvar_22 = ((tmpvar_20 - unity_ProbeVolumeMin) * unity_ProbeVolumeSizeInv);
    texCoord_19.yz = tmpvar_22.yz;
    texCoord_19.x = (tmpvar_22.x * 0.25);
    float tmpvar_23;
    float tmpvar_24;
    tmpvar_24 = (0.5 * unity_ProbeVolumeParams.z);
    tmpvar_23 = clamp (texCoord_19.x, tmpvar_24, (0.25 - tmpvar_24));
    texCoord_19.x = tmpvar_23;
    vec4 tmpvar_25;
    tmpvar_25 = texture3D (unity_ProbeVolumeSH, texCoord_19);
    texCoord_19.x = (tmpvar_23 + 0.25);
    vec4 tmpvar_26;
    tmpvar_26 = texture3D (unity_ProbeVolumeSH, texCoord_19);
    texCoord_19.x = (tmpvar_23 + 0.5);
    x1_18.x = dot (tmpvar_25, tmpvar_17);
    x1_18.y = dot (tmpvar_26, tmpvar_17);
    x1_18.z = dot (texture3D (unity_ProbeVolumeSH, texCoord_19), tmpvar_17);
    ambient_contrib_16 = x1_18;
  } else {
    vec4 tmpvar_27;
    tmpvar_27.w = 1.0;
    tmpvar_27.xyz = tmpvar_9;
    vec3 x_28;
    x_28.x = dot (unity_SHAr, tmpvar_27);
    x_28.y = dot (unity_SHAg, tmpvar_27);
    x_28.z = dot (unity_SHAb, tmpvar_27);
    ambient_contrib_16 = x_28;
  };
  vec3 tmpvar_29;
  tmpvar_29 = max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD8.xyz + ambient_contrib_16));
  ambient_15 = tmpvar_29;
  if ((unity_ColorSpaceLuminance.w == 0.0)) {
    ambient_15 = max (((1.055 * 
      pow (max (tmpvar_29, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
    ) - 0.055), vec3(0.0, 0.0, 0.0));
  };
  vec3 specular_30;
  vec3 worldRefl_31;
  worldRefl_31 = tmpvar_10;
  vec3 worldPos_32;
  worldPos_32 = tmpvar_4;
  if ((unity_SpecCube0_ProbePosition.w > 0.0)) {
    vec3 tmpvar_33;
    tmpvar_33 = normalize(tmpvar_10);
    vec3 tmpvar_34;
    tmpvar_34 = ((unity_SpecCube0_BoxMax.xyz - xlv_TEXCOORD3.xyz) / tmpvar_33);
    vec3 tmpvar_35;
    tmpvar_35 = ((unity_SpecCube0_BoxMin.xyz - xlv_TEXCOORD3.xyz) / tmpvar_33);
    bvec3 tmpvar_36;
    tmpvar_36 = greaterThan (tmpvar_33, vec3(0.0, 0.0, 0.0));
    float tmpvar_37;
    if (tmpvar_36.x) {
      tmpvar_37 = tmpvar_34.x;
    } else {
      tmpvar_37 = tmpvar_35.x;
    };
    float tmpvar_38;
    if (tmpvar_36.y) {
      tmpvar_38 = tmpvar_34.y;
    } else {
      tmpvar_38 = tmpvar_35.y;
    };
    float tmpvar_39;
    if (tmpvar_36.z) {
      tmpvar_39 = tmpvar_34.z;
    } else {
      tmpvar_39 = tmpvar_35.z;
    };
    worldPos_32 = (xlv_TEXCOORD3.xyz - unity_SpecCube0_ProbePosition.xyz);
    worldRefl_31 = (worldPos_32 + (tmpvar_33 * min (
      min (tmpvar_37, tmpvar_38)
    , tmpvar_39)));
  };
  vec4 tmpvar_40;
  tmpvar_40.xyz = worldRefl_31;
  tmpvar_40.w = ((tmpvar_3 * (1.7 - 
    (0.7 * tmpvar_3)
  )) * 6.0);
  vec4 tmpvar_41;
  tmpvar_41 = textureCubeLod (unity_SpecCube0, worldRefl_31, tmpvar_40.w);
  vec3 tmpvar_42;
  tmpvar_42 = ((unity_SpecCube0_HDR.x * pow (tmpvar_41.w, unity_SpecCube0_HDR.y)) * tmpvar_41.xyz);
  if ((unity_SpecCube0_BoxMin.w < 0.99999)) {
    vec3 worldRefl_43;
    worldRefl_43 = tmpvar_10;
    vec3 worldPos_44;
    worldPos_44 = tmpvar_4;
    if ((unity_SpecCube1_ProbePosition.w > 0.0)) {
      vec3 tmpvar_45;
      tmpvar_45 = normalize(tmpvar_10);
      vec3 tmpvar_46;
      tmpvar_46 = ((unity_SpecCube1_BoxMax.xyz - xlv_TEXCOORD3.xyz) / tmpvar_45);
      vec3 tmpvar_47;
      tmpvar_47 = ((unity_SpecCube1_BoxMin.xyz - xlv_TEXCOORD3.xyz) / tmpvar_45);
      bvec3 tmpvar_48;
      tmpvar_48 = greaterThan (tmpvar_45, vec3(0.0, 0.0, 0.0));
      float tmpvar_49;
      if (tmpvar_48.x) {
        tmpvar_49 = tmpvar_46.x;
      } else {
        tmpvar_49 = tmpvar_47.x;
      };
      float tmpvar_50;
      if (tmpvar_48.y) {
        tmpvar_50 = tmpvar_46.y;
      } else {
        tmpvar_50 = tmpvar_47.y;
      };
      float tmpvar_51;
      if (tmpvar_48.z) {
        tmpvar_51 = tmpvar_46.z;
      } else {
        tmpvar_51 = tmpvar_47.z;
      };
      worldPos_44 = (xlv_TEXCOORD3.xyz - unity_SpecCube1_ProbePosition.xyz);
      worldRefl_43 = (worldPos_44 + (tmpvar_45 * min (
        min (tmpvar_49, tmpvar_50)
      , tmpvar_51)));
    };
    vec4 tmpvar_52;
    tmpvar_52.xyz = worldRefl_43;
    tmpvar_52.w = ((tmpvar_3 * (1.7 - 
      (0.7 * tmpvar_3)
    )) * 6.0);
    vec4 tmpvar_53;
    tmpvar_53 = textureCubeLod (unity_SpecCube1, worldRefl_43, tmpvar_52.w);
    specular_30 = mix (((unity_SpecCube1_HDR.x * 
      pow (tmpvar_53.w, unity_SpecCube1_HDR.y)
    ) * tmpvar_53.xyz), tmpvar_42, unity_SpecCube0_BoxMin.www);
  } else {
    specular_30 = tmpvar_42;
  };
  vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_SpecularMap, (
    (xlv_TEXCOORD0 * _SpecularMap_ST.xy)
   + _SpecularMap_ST.zw)).xyz * _SpecIntensity) * _Speccolor.xyz);
  vec4 tmpvar_55;
  tmpvar_55 = texture2D (_DiffuseMapTransA, ((xlv_TEXCOORD0 * _DiffuseMapTransA_ST.xy) + _DiffuseMapTransA_ST.zw));
  vec4 tmpvar_56;
  tmpvar_56.xyz = (((
    (max (0.0, dot (tmpvar_9, tmpvar_12)) * _LightColor0.xyz)
   + ambient_15) * (tmpvar_55.xyz * _Diffusecolor.xyz)) + ((
    pow (max (0.0, dot (tmpvar_13, tmpvar_9)), tmpvar_14)
   * tmpvar_54) + (specular_30 * tmpvar_54)));
  tmpvar_56.w = (tmpvar_55.w * _Transparency);
  gl_FragData[0] = tmpvar_56;
}


#endif
"
}
SubProgram "metal " {
// Stats: 17 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
Bind "texcoord2" ATTR5
ConstBuffer "$Globals" 192
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [unity_ObjectToWorld]
Matrix 128 [unity_WorldToObject]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
  float4 _glesMultiTexCoord2 [[attribute(5)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float4 xlv_TEXCOORD8;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4x4 unity_ObjectToWorld;
  float4x4 unity_WorldToObject;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 v_1 = 0;
  v_1.x = _mtl_u.unity_WorldToObject[0].x;
  v_1.y = _mtl_u.unity_WorldToObject[1].x;
  v_1.z = _mtl_u.unity_WorldToObject[2].x;
  v_1.w = _mtl_u.unity_WorldToObject[3].x;
  float4 v_2 = 0;
  v_2.x = _mtl_u.unity_WorldToObject[0].y;
  v_2.y = _mtl_u.unity_WorldToObject[1].y;
  v_2.z = _mtl_u.unity_WorldToObject[2].y;
  v_2.w = _mtl_u.unity_WorldToObject[3].y;
  float4 v_3 = 0;
  v_3.x = _mtl_u.unity_WorldToObject[0].z;
  v_3.y = _mtl_u.unity_WorldToObject[1].z;
  v_3.z = _mtl_u.unity_WorldToObject[2].z;
  v_3.w = _mtl_u.unity_WorldToObject[3].z;
  float3 tmpvar_4 = 0;
  tmpvar_4 = normalize(((
    (v_1.xyz * _mtl_i._glesNormal.x)
   + 
    (v_2.xyz * _mtl_i._glesNormal.y)
  ) + (v_3.xyz * _mtl_i._glesNormal.z)));
  float4 tmpvar_5 = 0;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _mtl_i._glesTANGENT.xyz;
  float3 tmpvar_6 = 0;
  tmpvar_6 = normalize((_mtl_u.unity_ObjectToWorld * tmpvar_5).xyz);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = _mtl_i._glesMultiTexCoord0.xy;
  _mtl_o.xlv_TEXCOORD1 = _mtl_i._glesMultiTexCoord1.xy;
  _mtl_o.xlv_TEXCOORD2 = _mtl_i._glesMultiTexCoord2.xy;
  _mtl_o.xlv_TEXCOORD3 = (_mtl_u.unity_ObjectToWorld * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD4 = tmpvar_4;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * _mtl_i._glesTANGENT.w));
  _mtl_o.xlv_TEXCOORD8 = float4(0.0, 0.0, 0.0, 0.0);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec2 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD3 = hlslcc_mtx4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD6.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD8 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DiffuseMapTransA_ST;
uniform 	vec4 _Diffusecolor;
uniform 	vec4 _NormalMap_ST;
uniform 	float _NormalIntensity;
uniform 	vec4 _SpecularMap_ST;
uniform 	vec4 _Speccolor;
uniform 	float _SpecIntensity;
uniform 	float _Gloss;
uniform 	float _Transparency;
uniform  sampler2D _NormalMap;
uniform  sampler2D _SpecularMap;
uniform  sampler2D _DiffuseMapTransA;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
in  vec4 vs_TEXCOORD8;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat5;
lowp vec4 u_xlat10_5;
vec3 u_xlat6;
lowp vec4 u_xlat10_6;
vec3 u_xlat7;
lowp vec4 u_xlat10_7;
vec3 u_xlat8;
bvec3 u_xlatb8;
vec3 u_xlat9;
bvec3 u_xlatb10;
vec3 u_xlat11;
float u_xlat15;
float u_xlat33;
float u_xlat34;
mediump float u_xlat16_34;
float u_xlat35;
mediump float u_xlat16_35;
bool u_xlatb35;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat0.x = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0u)) ? 1.0 : -1.0;
    u_xlat11.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat11.x = inversesqrt(u_xlat11.x);
    u_xlat11.xyz = u_xlat11.xxx * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat11.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_3 = texture(_NormalMap, u_xlat3.xy);
    u_xlat4.xy = u_xlat10_3.wy + u_xlat10_3.wy;
    u_xlat16_3.xy = u_xlat10_3.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_34 = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_34 = min(u_xlat16_34, 1.0);
    u_xlat16_34 = (-u_xlat16_34) + 1.0;
    u_xlat4.z = sqrt(u_xlat16_34);
    u_xlat3.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = vec3(_NormalIntensity) * u_xlat3.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat4.xyz = u_xlat3.yyy * vs_TEXCOORD6.xyz;
    u_xlat3.xyw = u_xlat3.xxx * vs_TEXCOORD5.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat3.zzz * u_xlat0.xyz + u_xlat3.xyw;
    u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat34);
    u_xlat0.x = dot((-u_xlat2.xyz), u_xlat3.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat3.xyz * (-u_xlat0.xxx) + (-u_xlat2.xyz);
    u_xlat34 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat2.xyz = vec3(u_xlat34) * _WorldSpaceLightPos0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat33) + u_xlat2.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = _Gloss * 10.0 + 1.0;
    u_xlat33 = exp2(u_xlat33);
    u_xlat34 = (-_Gloss) + 1.0;
    u_xlatb35 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb35){
        u_xlatb35 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD3.yyy * hlslcc_mtx4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD3.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD3.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb35)) ? u_xlat4.xyz : vs_TEXCOORD3.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat35 = u_xlat4.y * 0.25;
        u_xlat15 = unity_ProbeVolumeParams.z * 0.5;
        u_xlat5.x = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat35 = max(u_xlat35, u_xlat15);
        u_xlat4.x = min(u_xlat5.x, u_xlat35);
        u_xlat10_5 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
        u_xlat6.xyz = u_xlat4.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_6 = texture(unity_ProbeVolumeSH, u_xlat6.xyz);
        u_xlat4.xyz = u_xlat4.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_4 = texture(unity_ProbeVolumeSH, u_xlat4.xyz);
        u_xlat3.w = 1.0;
        u_xlat5.x = dot(u_xlat10_5, u_xlat3);
        u_xlat5.y = dot(u_xlat10_6, u_xlat3);
        u_xlat5.z = dot(u_xlat10_4, u_xlat3);
    } else {
        u_xlat3.w = 1.0;
        u_xlat5.x = dot(unity_SHAr, u_xlat3);
        u_xlat5.y = dot(unity_SHAg, u_xlat3);
        u_xlat5.z = dot(unity_SHAb, u_xlat3);
    //ENDIF
    }
    u_xlat4.xyz = u_xlat5.xyz + vs_TEXCOORD8.xyz;
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb35 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat5.xyz = log2(u_xlat4.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = (bool(u_xlatb35)) ? u_xlat5.xyz : u_xlat4.xyz;
    u_xlatb35 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb35){
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat5.xyz = u_xlat0.xyz * vec3(u_xlat35);
        u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
        u_xlat7.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
        u_xlat6.x = (u_xlatb8.x) ? u_xlat6.x : u_xlat7.x;
        u_xlat6.y = (u_xlatb8.y) ? u_xlat6.y : u_xlat7.y;
        u_xlat6.z = (u_xlatb8.z) ? u_xlat6.z : u_xlat7.z;
        u_xlat35 = min(u_xlat6.y, u_xlat6.x);
        u_xlat35 = min(u_xlat6.z, u_xlat35);
        u_xlat6.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat35) + u_xlat6.xyz;
    } else {
        u_xlat5.xyz = u_xlat0.xyz;
    //ENDIF
    }
    u_xlat35 = (-u_xlat34) * 0.699999988 + 1.70000005;
    u_xlat34 = u_xlat34 * u_xlat35;
    u_xlat34 = u_xlat34 * 6.0;
    u_xlat10_5 = textureLod(unity_SpecCube0, u_xlat5.xyz, u_xlat34);
    u_xlat16_35 = log2(u_xlat10_5.w);
    u_xlat35 = u_xlat16_35 * unity_SpecCube0_HDR.y;
    u_xlat35 = exp2(u_xlat35);
    u_xlat35 = u_xlat35 * unity_SpecCube0_HDR.x;
    u_xlat6.xyz = u_xlat10_5.xyz * vec3(u_xlat35);
    u_xlatb36 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb36){
        u_xlatb36 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb36){
            u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
            u_xlat36 = inversesqrt(u_xlat36);
            u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat36);
            u_xlat8.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
            u_xlat9.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
            u_xlat8.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
            u_xlat8.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
            u_xlat8.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
            u_xlat36 = min(u_xlat8.y, u_xlat8.x);
            u_xlat36 = min(u_xlat8.z, u_xlat36);
            u_xlat8.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat0.xyz = u_xlat7.xyz * vec3(u_xlat36) + u_xlat8.xyz;
        //ENDIF
        }
        u_xlat10_7 = textureLod(unity_SpecCube1, u_xlat0.xyz, u_xlat34);
        u_xlat16_0 = log2(u_xlat10_7.w);
        u_xlat0.x = u_xlat16_0 * unity_SpecCube1_HDR.y;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * unity_SpecCube1_HDR.x;
        u_xlat0.xyz = u_xlat10_7.xyz * u_xlat0.xxx;
        u_xlat5.xyz = vec3(u_xlat35) * u_xlat10_5.xyz + (-u_xlat0.xyz);
        u_xlat6.xyz = unity_SpecCube0_BoxMin.www * u_xlat5.xyz + u_xlat0.xyz;
    //ENDIF
    }
    u_xlat0.xy = vs_TEXCOORD0.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
    u_xlat10_5 = texture(_SpecularMap, u_xlat0.xy);
    u_xlat0.xyz = u_xlat10_5.xyz * vec3(_SpecIntensity);
    u_xlat0.xyz = u_xlat0.xyz * _Speccolor.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat33 = u_xlat33 * u_xlat1.x;
    u_xlat33 = exp2(u_xlat33);
    u_xlat1.xyz = u_xlat0.xyz * u_xlat6.xyz;
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat33 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat33 = max(u_xlat33, 0.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _DiffuseMapTransA_ST.xy + _DiffuseMapTransA_ST.zw;
    u_xlat10_1 = texture(_DiffuseMapTransA, u_xlat1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * _Diffusecolor.xyz;
    u_xlat2.xyz = vec3(u_xlat33) * _LightColor0.xyz + u_xlat4.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_1.w * _Transparency;
    return;
}
#endif
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 122 math, 8 textures, 14 branches
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [unity_SpecCube0] CUBE 0
SetTexture 1 [unity_SpecCube1] CUBE 1
SetTexture 2 [unity_ProbeVolumeSH] 3D 2
SetTexture 3 [_DiffuseMapTransA] 2D 3
SetTexture 4 [_NormalMap] 2D 4
SetTexture 5 [_SpecularMap] 2D 5
ConstBuffer "$Globals" 412
Matrix 192 [unity_ProbeVolumeWorldToObject]
Vector 0 [_WorldSpaceCameraPos] 3
VectorHalf 16 [_WorldSpaceLightPos0] 4
VectorHalf 24 [unity_SHAr] 4
VectorHalf 32 [unity_SHAg] 4
VectorHalf 40 [unity_SHAb] 4
Vector 48 [unity_SpecCube0_BoxMax]
Vector 64 [unity_SpecCube0_BoxMin]
Vector 80 [unity_SpecCube0_ProbePosition]
VectorHalf 96 [unity_SpecCube0_HDR] 4
Vector 112 [unity_SpecCube1_BoxMax]
Vector 128 [unity_SpecCube1_BoxMin]
Vector 144 [unity_SpecCube1_ProbePosition]
VectorHalf 160 [unity_SpecCube1_HDR] 4
Vector 176 [unity_ProbeVolumeParams]
Vector 256 [unity_ProbeVolumeSizeInv] 3
Vector 272 [unity_ProbeVolumeMin] 3
VectorHalf 288 [unity_ColorSpaceLuminance] 4
VectorHalf 296 [_LightColor0] 4
Vector 304 [_DiffuseMapTransA_ST]
Vector 320 [_Diffusecolor]
Vector 336 [_NormalMap_ST]
Float 352 [_NormalIntensity]
Vector 368 [_SpecularMap_ST]
Vector 384 [_Speccolor]
Float 400 [_SpecIntensity]
Float 404 [_Gloss]
Float 408 [_Transparency]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  bool gl_FrontFacing [[front_facing]];
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float4 xlv_TEXCOORD8;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  half4 _WorldSpaceLightPos0;
  half4 unity_SHAr;
  half4 unity_SHAg;
  half4 unity_SHAb;
  float4 unity_SpecCube0_BoxMax;
  float4 unity_SpecCube0_BoxMin;
  float4 unity_SpecCube0_ProbePosition;
  half4 unity_SpecCube0_HDR;
  float4 unity_SpecCube1_BoxMax;
  float4 unity_SpecCube1_BoxMin;
  float4 unity_SpecCube1_ProbePosition;
  half4 unity_SpecCube1_HDR;
  float4 unity_ProbeVolumeParams;
  float4x4 unity_ProbeVolumeWorldToObject;
  float3 unity_ProbeVolumeSizeInv;
  float3 unity_ProbeVolumeMin;
  half4 unity_ColorSpaceLuminance;
  half4 _LightColor0;
  float4 _DiffuseMapTransA_ST;
  float4 _Diffusecolor;
  float4 _NormalMap_ST;
  float _NormalIntensity;
  float4 _SpecularMap_ST;
  float4 _Speccolor;
  float _SpecIntensity;
  float _Gloss;
  float _Transparency;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texturecube<half> unity_SpecCube0 [[texture(0)]], sampler _mtlsmp_unity_SpecCube0 [[sampler(0)]]
  ,   texturecube<half> unity_SpecCube1 [[texture(1)]], sampler _mtlsmp_unity_SpecCube1 [[sampler(1)]]
  ,   texture3d<half> unity_ProbeVolumeSH [[texture(2)]], sampler _mtlsmp_unity_ProbeVolumeSH [[sampler(2)]]
  ,   texture2d<half> _DiffuseMapTransA [[texture(3)]], sampler _mtlsmp__DiffuseMapTransA [[sampler(3)]]
  ,   texture2d<half> _NormalMap [[texture(4)]], sampler _mtlsmp__NormalMap [[sampler(4)]]
  ,   texture2d<half> _SpecularMap [[texture(5)]], sampler _mtlsmp__SpecularMap [[sampler(5)]])
{
  xlatMtlShaderOutput _mtl_o;
  float tmpvar_1 = 0;
  if (_mtl_i.gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  float4 tmpvar_2 = 0;
  float3 tmpvar_3 = 0;
  tmpvar_3 = _mtl_i.xlv_TEXCOORD4;
  half4 finalRGBA_4 = 0;
  float4 _DiffuseMapTransA_var_5 = 0;
  float4 _SpecularMap_var_6 = 0;
  half tmpvar_7 = 0;
  half3 tmpvar_8 = 0;
  float3 tmpvar_9 = 0;
  half3 tmpvar_10 = 0;
  float4 tmpvar_11 = 0;
  float4 tmpvar_12 = 0;
  half3 tmpvar_13 = 0;
  half3 tmpvar_14 = 0;
  float3 lightColor_15 = 0;
  float3 lightDirection_16 = 0;
  float3 _NormalMap_var_17 = 0;
  int tmpvar_18 = 0;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_18 = 1;
  } else {
    tmpvar_18 = -1;
  };
  tmpvar_3 = (normalize(_mtl_i.xlv_TEXCOORD4) * float(tmpvar_18));
  float3x3 tmpvar_19;
  tmpvar_19[0].x = _mtl_i.xlv_TEXCOORD5.x;
  tmpvar_19[0].y = _mtl_i.xlv_TEXCOORD6.x;
  tmpvar_19[0].z = tmpvar_3.x;
  tmpvar_19[1].x = _mtl_i.xlv_TEXCOORD5.y;
  tmpvar_19[1].y = _mtl_i.xlv_TEXCOORD6.y;
  tmpvar_19[1].z = tmpvar_3.y;
  tmpvar_19[2].x = _mtl_i.xlv_TEXCOORD5.z;
  tmpvar_19[2].y = _mtl_i.xlv_TEXCOORD6.z;
  tmpvar_19[2].z = tmpvar_3.z;
  float3 tmpvar_20 = 0;
  tmpvar_20 = normalize((_mtl_u._WorldSpaceCameraPos - _mtl_i.xlv_TEXCOORD3.xyz));
  float2 P_21 = 0;
  P_21 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._NormalMap_ST.xy) + _mtl_u._NormalMap_ST.zw);
  half3 normal_22 = 0;
  normal_22.xy = ((_NormalMap.sample(_mtlsmp__NormalMap, (float2)(P_21)).wy * (half)(2.0)) - (half)(1.0));
  normal_22.z = sqrt(((half)(1.0) - clamp (
    dot (normal_22.xy, normal_22.xy)
  , (half)0.0, (half)1.0)));
  _NormalMap_var_17 = float3(normal_22);
  float3 tmpvar_23 = 0;
  tmpvar_23 = normalize((mix (float3(0.0, 0.0, 1.0), _NormalMap_var_17, float3(_mtl_u._NormalIntensity)) * tmpvar_19));
  float3 tmpvar_24 = 0;
  float3 I_25 = 0;
  I_25 = -(tmpvar_20);
  tmpvar_24 = (I_25 - (2.0 * (
    dot (tmpvar_23, I_25)
   * tmpvar_23)));
  half3 tmpvar_26 = 0;
  tmpvar_26 = normalize(_mtl_u._WorldSpaceLightPos0.xyz);
  lightDirection_16 = float3(tmpvar_26);
  half3 tmpvar_27 = 0;
  tmpvar_27 = _mtl_u._LightColor0.xyz;
  lightColor_15 = float3(tmpvar_27);
  float3 tmpvar_28 = 0;
  tmpvar_28 = normalize((tmpvar_20 + lightDirection_16));
  float3 tmpvar_29 = 0;
  tmpvar_29 = float3(_mtl_u._LightColor0.xyz);
  float tmpvar_30 = 0;
  tmpvar_30 = exp2(((_mtl_u._Gloss * 10.0) + 1.0));
  tmpvar_13 = half3(lightColor_15);
  tmpvar_14 = half3(lightDirection_16);
  tmpvar_9 = _mtl_i.xlv_TEXCOORD3.xyz;
  float3 tmpvar_31 = 0;
  tmpvar_31 = _mtl_i.xlv_TEXCOORD8.xyz;
  tmpvar_10 = half3(tmpvar_31);
  tmpvar_11 = float4(_mtl_u.unity_SpecCube0_HDR);
  tmpvar_12 = float4(_mtl_u.unity_SpecCube1_HDR);
  tmpvar_7 = half((1.0 - _mtl_u._Gloss));
  tmpvar_8 = half3(tmpvar_24);
  half3 normalWorld_32 = 0;
  normalWorld_32 = half3(tmpvar_23);
  half3 ambient_33 = 0;
  ambient_33 = tmpvar_10;
  half3 ambient_contrib_34 = 0;
  ambient_contrib_34 = half3(float3(0.0, 0.0, 0.0));
  if ((_mtl_u.unity_ProbeVolumeParams.x == 1.0)) {
    half4 tmpvar_35 = 0;
    tmpvar_35.w = half(1.0);
    tmpvar_35.xyz = normalWorld_32;
    half3 x1_36 = 0;
    half4 SHAb_37 = 0;
    half4 SHAg_38 = 0;
    half4 SHAr_39 = 0;
    float3 texCoord_40 = 0;
    float3 tmpvar_41 = 0;
    if ((_mtl_u.unity_ProbeVolumeParams.y == 1.0)) {
      float4 tmpvar_42 = 0;
      tmpvar_42.w = 1.0;
      tmpvar_42.xyz = tmpvar_9;
      tmpvar_41 = (_mtl_u.unity_ProbeVolumeWorldToObject * tmpvar_42).xyz;
    } else {
      tmpvar_41 = tmpvar_9;
    };
    float3 tmpvar_43 = 0;
    tmpvar_43 = ((tmpvar_41 - _mtl_u.unity_ProbeVolumeMin) * _mtl_u.unity_ProbeVolumeSizeInv);
    texCoord_40.yz = tmpvar_43.yz;
    texCoord_40.x = (tmpvar_43.x * 0.25);
    float tmpvar_44 = 0;
    float tmpvar_45 = 0;
    tmpvar_45 = (0.5 * _mtl_u.unity_ProbeVolumeParams.z);
    tmpvar_44 = clamp (texCoord_40.x, tmpvar_45, (0.25 - tmpvar_45));
    texCoord_40.x = tmpvar_44;
    half4 tmpvar_46 = 0;
    tmpvar_46 = unity_ProbeVolumeSH.sample(_mtlsmp_unity_ProbeVolumeSH, (float3)(texCoord_40));
    SHAr_39 = tmpvar_46;
    texCoord_40.x = (tmpvar_44 + 0.25);
    half4 tmpvar_47 = 0;
    tmpvar_47 = unity_ProbeVolumeSH.sample(_mtlsmp_unity_ProbeVolumeSH, (float3)(texCoord_40));
    SHAg_38 = tmpvar_47;
    texCoord_40.x = (tmpvar_44 + 0.5);
    half4 tmpvar_48 = 0;
    tmpvar_48 = unity_ProbeVolumeSH.sample(_mtlsmp_unity_ProbeVolumeSH, (float3)(texCoord_40));
    SHAb_37 = tmpvar_48;
    x1_36.x = dot (SHAr_39, tmpvar_35);
    x1_36.y = dot (SHAg_38, tmpvar_35);
    x1_36.z = dot (SHAb_37, tmpvar_35);
    ambient_contrib_34 = x1_36;
  } else {
    half4 tmpvar_49 = 0;
    tmpvar_49.w = half(1.0);
    tmpvar_49.xyz = normalWorld_32;
    half3 x_50 = 0;
    x_50.x = dot (_mtl_u.unity_SHAr, tmpvar_49);
    x_50.y = dot (_mtl_u.unity_SHAg, tmpvar_49);
    x_50.z = dot (_mtl_u.unity_SHAb, tmpvar_49);
    ambient_contrib_34 = x_50;
  };
  half3 tmpvar_51 = 0;
  tmpvar_51 = max ((half3)float3(0.0, 0.0, 0.0), (tmpvar_10 + ambient_contrib_34));
  ambient_33 = tmpvar_51;
  bool tmpvar_52 = false;
  tmpvar_52 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)(0.0));
  if (tmpvar_52) {
    ambient_33 = max ((((half)(1.055) * 
      pow (max (tmpvar_51, (half3)float3(0.0, 0.0, 0.0)), (half3)float3(0.4166667, 0.4166667, 0.4166667))
    ) - (half)(0.055)), (half3)float3(0.0, 0.0, 0.0));
  };
  half3 specular_53 = 0;
  half3 worldRefl_54 = 0;
  worldRefl_54 = tmpvar_8;
  float3 worldPos_55 = 0;
  worldPos_55 = tmpvar_9;
  if ((_mtl_u.unity_SpecCube0_ProbePosition.w > 0.0)) {
    half3 rbmin_56 = 0;
    half3 rbmax_57 = 0;
    half3 tmpvar_58 = 0;
    tmpvar_58 = normalize(tmpvar_8);
    float3 tmpvar_59 = 0;
    tmpvar_59 = ((_mtl_u.unity_SpecCube0_BoxMax.xyz - _mtl_i.xlv_TEXCOORD3.xyz) / (float3)(tmpvar_58));
    rbmax_57 = half3(tmpvar_59);
    float3 tmpvar_60 = 0;
    tmpvar_60 = ((_mtl_u.unity_SpecCube0_BoxMin.xyz - _mtl_i.xlv_TEXCOORD3.xyz) / (float3)(tmpvar_58));
    rbmin_56 = half3(tmpvar_60);
    bool3 tmpvar_61 = false;
    tmpvar_61 = (tmpvar_58 > (half3)(float3(0.0, 0.0, 0.0)));
    half tmpvar_62 = 0;
    if (tmpvar_61.x) {
      tmpvar_62 = rbmax_57.x;
    } else {
      tmpvar_62 = rbmin_56.x;
    };
    half tmpvar_63 = 0;
    if (tmpvar_61.y) {
      tmpvar_63 = rbmax_57.y;
    } else {
      tmpvar_63 = rbmin_56.y;
    };
    half tmpvar_64 = 0;
    if (tmpvar_61.z) {
      tmpvar_64 = rbmax_57.z;
    } else {
      tmpvar_64 = rbmin_56.z;
    };
    worldPos_55 = (_mtl_i.xlv_TEXCOORD3.xyz - _mtl_u.unity_SpecCube0_ProbePosition.xyz);
    worldRefl_54 = half3((worldPos_55 + (float3)((tmpvar_58 * min (
      min (tmpvar_62, tmpvar_63)
    , tmpvar_64)))));
  };
  half4 hdr_65 = 0;
  hdr_65 = half4(tmpvar_11);
  half4 tmpvar_66 = 0;
  tmpvar_66.xyz = worldRefl_54;
  tmpvar_66.w = ((tmpvar_7 * ((half)(1.7) - 
    ((half)(0.7) * tmpvar_7)
  )) * (half)(6.0));
  half4 tmpvar_67 = 0;
  tmpvar_67 = unity_SpecCube0.sample(_mtlsmp_unity_SpecCube0, (float3)(worldRefl_54), level(tmpvar_66.w));
  half4 tmpvar_68 = 0;
  tmpvar_68 = tmpvar_67;
  half3 tmpvar_69 = 0;
  tmpvar_69 = ((hdr_65.x * pow (tmpvar_68.w, hdr_65.y)) * tmpvar_68.xyz);
  if ((_mtl_u.unity_SpecCube0_BoxMin.w < 0.99999)) {
    half3 worldRefl_70 = 0;
    worldRefl_70 = tmpvar_8;
    float3 worldPos_71 = 0;
    worldPos_71 = tmpvar_9;
    if ((_mtl_u.unity_SpecCube1_ProbePosition.w > 0.0)) {
      half3 rbmin_72 = 0;
      half3 rbmax_73 = 0;
      half3 tmpvar_74 = 0;
      tmpvar_74 = normalize(tmpvar_8);
      float3 tmpvar_75 = 0;
      tmpvar_75 = ((_mtl_u.unity_SpecCube1_BoxMax.xyz - _mtl_i.xlv_TEXCOORD3.xyz) / (float3)(tmpvar_74));
      rbmax_73 = half3(tmpvar_75);
      float3 tmpvar_76 = 0;
      tmpvar_76 = ((_mtl_u.unity_SpecCube1_BoxMin.xyz - _mtl_i.xlv_TEXCOORD3.xyz) / (float3)(tmpvar_74));
      rbmin_72 = half3(tmpvar_76);
      bool3 tmpvar_77 = false;
      tmpvar_77 = (tmpvar_74 > (half3)(float3(0.0, 0.0, 0.0)));
      half tmpvar_78 = 0;
      if (tmpvar_77.x) {
        tmpvar_78 = rbmax_73.x;
      } else {
        tmpvar_78 = rbmin_72.x;
      };
      half tmpvar_79 = 0;
      if (tmpvar_77.y) {
        tmpvar_79 = rbmax_73.y;
      } else {
        tmpvar_79 = rbmin_72.y;
      };
      half tmpvar_80 = 0;
      if (tmpvar_77.z) {
        tmpvar_80 = rbmax_73.z;
      } else {
        tmpvar_80 = rbmin_72.z;
      };
      worldPos_71 = (_mtl_i.xlv_TEXCOORD3.xyz - _mtl_u.unity_SpecCube1_ProbePosition.xyz);
      worldRefl_70 = half3((worldPos_71 + (float3)((tmpvar_74 * min (
        min (tmpvar_78, tmpvar_79)
      , tmpvar_80)))));
    };
    half4 hdr_81 = 0;
    hdr_81 = half4(tmpvar_12);
    half4 tmpvar_82 = 0;
    tmpvar_82.xyz = worldRefl_70;
    tmpvar_82.w = ((tmpvar_7 * ((half)(1.7) - 
      ((half)(0.7) * tmpvar_7)
    )) * (half)(6.0));
    half4 tmpvar_83 = 0;
    tmpvar_83 = unity_SpecCube1.sample(_mtlsmp_unity_SpecCube1, (float3)(worldRefl_70), level(tmpvar_82.w));
    half4 tmpvar_84 = 0;
    tmpvar_84 = tmpvar_83;
    half3 tmpvar_85 = 0;
    tmpvar_85 = ((hdr_81.x * pow (tmpvar_84.w, hdr_81.y)) * tmpvar_84.xyz);
    float3 tmpvar_86 = 0;
    tmpvar_86 = mix ((float3)tmpvar_85, (float3)tmpvar_69, _mtl_u.unity_SpecCube0_BoxMin.www);
    specular_53 = half3(tmpvar_86);
  } else {
    specular_53 = tmpvar_69;
  };
  lightDirection_16 = float3(tmpvar_14);
  lightColor_15 = float3(tmpvar_13);
  half4 tmpvar_87 = 0;
  float2 P_88 = 0;
  P_88 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._SpecularMap_ST.xy) + _mtl_u._SpecularMap_ST.zw);
  tmpvar_87 = _SpecularMap.sample(_mtlsmp__SpecularMap, (float2)(P_88));
  _SpecularMap_var_6 = float4(tmpvar_87);
  float3 tmpvar_89 = 0;
  tmpvar_89 = ((_SpecularMap_var_6.xyz * _mtl_u._SpecIntensity) * _mtl_u._Speccolor.xyz);
  half4 tmpvar_90 = 0;
  float2 P_91 = 0;
  P_91 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._DiffuseMapTransA_ST.xy) + _mtl_u._DiffuseMapTransA_ST.zw);
  tmpvar_90 = _DiffuseMapTransA.sample(_mtlsmp__DiffuseMapTransA, (float2)(P_91));
  _DiffuseMapTransA_var_5 = float4(tmpvar_90);
  float4 tmpvar_92 = 0;
  tmpvar_92.xyz = (((
    (max (0.0, dot (tmpvar_23, lightDirection_16)) * tmpvar_29)
   + (float3)(ambient_33)) * (_DiffuseMapTransA_var_5.xyz * _mtl_u._Diffusecolor.xyz)) + ((
    pow (max (0.0, dot (tmpvar_28, tmpvar_23)), tmpvar_30)
   * tmpvar_89) + ((float3)(specular_53) * tmpvar_89)));
  tmpvar_92.w = (_DiffuseMapTransA_var_5.w * _mtl_u._Transparency);
  finalRGBA_4 = half4(tmpvar_92);
  tmpvar_2 = float4(finalRGBA_4);
  _mtl_o._glesFragData_0 = half4(tmpvar_2);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 122 math, 8 textures, 14 branches
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [unity_SpecCube0] CUBE 0
SetTexture 1 [unity_SpecCube1] CUBE 1
SetTexture 2 [unity_ProbeVolumeSH] 3D 2
SetTexture 3 [_DiffuseMapTransA] 2D 3
SetTexture 4 [_NormalMap] 2D 4
SetTexture 5 [_SpecularMap] 2D 5
ConstBuffer "$Globals" 412
Matrix 192 [unity_ProbeVolumeWorldToObject]
Vector 0 [_WorldSpaceCameraPos] 3
VectorHalf 16 [_WorldSpaceLightPos0] 4
VectorHalf 24 [unity_SHAr] 4
VectorHalf 32 [unity_SHAg] 4
VectorHalf 40 [unity_SHAb] 4
Vector 48 [unity_SpecCube0_BoxMax]
Vector 64 [unity_SpecCube0_BoxMin]
Vector 80 [unity_SpecCube0_ProbePosition]
VectorHalf 96 [unity_SpecCube0_HDR] 4
Vector 112 [unity_SpecCube1_BoxMax]
Vector 128 [unity_SpecCube1_BoxMin]
Vector 144 [unity_SpecCube1_ProbePosition]
VectorHalf 160 [unity_SpecCube1_HDR] 4
Vector 176 [unity_ProbeVolumeParams]
Vector 256 [unity_ProbeVolumeSizeInv] 3
Vector 272 [unity_ProbeVolumeMin] 3
VectorHalf 288 [unity_ColorSpaceLuminance] 4
VectorHalf 296 [_LightColor0] 4
Vector 304 [_DiffuseMapTransA_ST]
Vector 320 [_Diffusecolor]
Vector 336 [_NormalMap_ST]
Float 352 [_NormalIntensity]
Vector 368 [_SpecularMap_ST]
Vector 384 [_Speccolor]
Float 400 [_SpecIntensity]
Float 404 [_Gloss]
Float 408 [_Transparency]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  bool gl_FrontFacing [[front_facing]];
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float4 xlv_TEXCOORD8;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  half4 _WorldSpaceLightPos0;
  half4 unity_SHAr;
  half4 unity_SHAg;
  half4 unity_SHAb;
  float4 unity_SpecCube0_BoxMax;
  float4 unity_SpecCube0_BoxMin;
  float4 unity_SpecCube0_ProbePosition;
  half4 unity_SpecCube0_HDR;
  float4 unity_SpecCube1_BoxMax;
  float4 unity_SpecCube1_BoxMin;
  float4 unity_SpecCube1_ProbePosition;
  half4 unity_SpecCube1_HDR;
  float4 unity_ProbeVolumeParams;
  float4x4 unity_ProbeVolumeWorldToObject;
  float3 unity_ProbeVolumeSizeInv;
  float3 unity_ProbeVolumeMin;
  half4 unity_ColorSpaceLuminance;
  half4 _LightColor0;
  float4 _DiffuseMapTransA_ST;
  float4 _Diffusecolor;
  float4 _NormalMap_ST;
  float _NormalIntensity;
  float4 _SpecularMap_ST;
  float4 _Speccolor;
  float _SpecIntensity;
  float _Gloss;
  float _Transparency;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texturecube<half> unity_SpecCube0 [[texture(0)]], sampler _mtlsmp_unity_SpecCube0 [[sampler(0)]]
  ,   texturecube<half> unity_SpecCube1 [[texture(1)]], sampler _mtlsmp_unity_SpecCube1 [[sampler(1)]]
  ,   texture3d<half> unity_ProbeVolumeSH [[texture(2)]], sampler _mtlsmp_unity_ProbeVolumeSH [[sampler(2)]]
  ,   texture2d<half> _DiffuseMapTransA [[texture(3)]], sampler _mtlsmp__DiffuseMapTransA [[sampler(3)]]
  ,   texture2d<half> _NormalMap [[texture(4)]], sampler _mtlsmp__NormalMap [[sampler(4)]]
  ,   texture2d<half> _SpecularMap [[texture(5)]], sampler _mtlsmp__SpecularMap [[sampler(5)]])
{
  xlatMtlShaderOutput _mtl_o;
  float tmpvar_1 = 0;
  if (_mtl_i.gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  float4 tmpvar_2 = 0;
  float3 tmpvar_3 = 0;
  tmpvar_3 = _mtl_i.xlv_TEXCOORD4;
  half4 finalRGBA_4 = 0;
  float4 _DiffuseMapTransA_var_5 = 0;
  float4 _SpecularMap_var_6 = 0;
  half tmpvar_7 = 0;
  half3 tmpvar_8 = 0;
  float3 tmpvar_9 = 0;
  half3 tmpvar_10 = 0;
  float4 tmpvar_11 = 0;
  float4 tmpvar_12 = 0;
  half3 tmpvar_13 = 0;
  half3 tmpvar_14 = 0;
  float3 lightColor_15 = 0;
  float3 lightDirection_16 = 0;
  float3 _NormalMap_var_17 = 0;
  int tmpvar_18 = 0;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_18 = 1;
  } else {
    tmpvar_18 = -1;
  };
  tmpvar_3 = (normalize(_mtl_i.xlv_TEXCOORD4) * float(tmpvar_18));
  float3x3 tmpvar_19;
  tmpvar_19[0].x = _mtl_i.xlv_TEXCOORD5.x;
  tmpvar_19[0].y = _mtl_i.xlv_TEXCOORD6.x;
  tmpvar_19[0].z = tmpvar_3.x;
  tmpvar_19[1].x = _mtl_i.xlv_TEXCOORD5.y;
  tmpvar_19[1].y = _mtl_i.xlv_TEXCOORD6.y;
  tmpvar_19[1].z = tmpvar_3.y;
  tmpvar_19[2].x = _mtl_i.xlv_TEXCOORD5.z;
  tmpvar_19[2].y = _mtl_i.xlv_TEXCOORD6.z;
  tmpvar_19[2].z = tmpvar_3.z;
  float3 tmpvar_20 = 0;
  tmpvar_20 = normalize((_mtl_u._WorldSpaceCameraPos - _mtl_i.xlv_TEXCOORD3.xyz));
  float2 P_21 = 0;
  P_21 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._NormalMap_ST.xy) + _mtl_u._NormalMap_ST.zw);
  half3 normal_22 = 0;
  normal_22.xy = ((_NormalMap.sample(_mtlsmp__NormalMap, (float2)(P_21)).wy * (half)(2.0)) - (half)(1.0));
  normal_22.z = sqrt(((half)(1.0) - clamp (
    dot (normal_22.xy, normal_22.xy)
  , (half)0.0, (half)1.0)));
  _NormalMap_var_17 = float3(normal_22);
  float3 tmpvar_23 = 0;
  tmpvar_23 = normalize((mix (float3(0.0, 0.0, 1.0), _NormalMap_var_17, float3(_mtl_u._NormalIntensity)) * tmpvar_19));
  float3 tmpvar_24 = 0;
  float3 I_25 = 0;
  I_25 = -(tmpvar_20);
  tmpvar_24 = (I_25 - (2.0 * (
    dot (tmpvar_23, I_25)
   * tmpvar_23)));
  half3 tmpvar_26 = 0;
  tmpvar_26 = normalize(_mtl_u._WorldSpaceLightPos0.xyz);
  lightDirection_16 = float3(tmpvar_26);
  half3 tmpvar_27 = 0;
  tmpvar_27 = _mtl_u._LightColor0.xyz;
  lightColor_15 = float3(tmpvar_27);
  float3 tmpvar_28 = 0;
  tmpvar_28 = normalize((tmpvar_20 + lightDirection_16));
  float3 tmpvar_29 = 0;
  tmpvar_29 = float3(_mtl_u._LightColor0.xyz);
  float tmpvar_30 = 0;
  tmpvar_30 = exp2(((_mtl_u._Gloss * 10.0) + 1.0));
  tmpvar_13 = half3(lightColor_15);
  tmpvar_14 = half3(lightDirection_16);
  tmpvar_9 = _mtl_i.xlv_TEXCOORD3.xyz;
  float3 tmpvar_31 = 0;
  tmpvar_31 = _mtl_i.xlv_TEXCOORD8.xyz;
  tmpvar_10 = half3(tmpvar_31);
  tmpvar_11 = float4(_mtl_u.unity_SpecCube0_HDR);
  tmpvar_12 = float4(_mtl_u.unity_SpecCube1_HDR);
  tmpvar_7 = half((1.0 - _mtl_u._Gloss));
  tmpvar_8 = half3(tmpvar_24);
  half3 normalWorld_32 = 0;
  normalWorld_32 = half3(tmpvar_23);
  half3 ambient_33 = 0;
  ambient_33 = tmpvar_10;
  half3 ambient_contrib_34 = 0;
  ambient_contrib_34 = half3(float3(0.0, 0.0, 0.0));
  if ((_mtl_u.unity_ProbeVolumeParams.x == 1.0)) {
    half4 tmpvar_35 = 0;
    tmpvar_35.w = half(1.0);
    tmpvar_35.xyz = normalWorld_32;
    half3 x1_36 = 0;
    half4 SHAb_37 = 0;
    half4 SHAg_38 = 0;
    half4 SHAr_39 = 0;
    float3 texCoord_40 = 0;
    float3 tmpvar_41 = 0;
    if ((_mtl_u.unity_ProbeVolumeParams.y == 1.0)) {
      float4 tmpvar_42 = 0;
      tmpvar_42.w = 1.0;
      tmpvar_42.xyz = tmpvar_9;
      tmpvar_41 = (_mtl_u.unity_ProbeVolumeWorldToObject * tmpvar_42).xyz;
    } else {
      tmpvar_41 = tmpvar_9;
    };
    float3 tmpvar_43 = 0;
    tmpvar_43 = ((tmpvar_41 - _mtl_u.unity_ProbeVolumeMin) * _mtl_u.unity_ProbeVolumeSizeInv);
    texCoord_40.yz = tmpvar_43.yz;
    texCoord_40.x = (tmpvar_43.x * 0.25);
    float tmpvar_44 = 0;
    float tmpvar_45 = 0;
    tmpvar_45 = (0.5 * _mtl_u.unity_ProbeVolumeParams.z);
    tmpvar_44 = clamp (texCoord_40.x, tmpvar_45, (0.25 - tmpvar_45));
    texCoord_40.x = tmpvar_44;
    half4 tmpvar_46 = 0;
    tmpvar_46 = unity_ProbeVolumeSH.sample(_mtlsmp_unity_ProbeVolumeSH, (float3)(texCoord_40));
    SHAr_39 = tmpvar_46;
    texCoord_40.x = (tmpvar_44 + 0.25);
    half4 tmpvar_47 = 0;
    tmpvar_47 = unity_ProbeVolumeSH.sample(_mtlsmp_unity_ProbeVolumeSH, (float3)(texCoord_40));
    SHAg_38 = tmpvar_47;
    texCoord_40.x = (tmpvar_44 + 0.5);
    half4 tmpvar_48 = 0;
    tmpvar_48 = unity_ProbeVolumeSH.sample(_mtlsmp_unity_ProbeVolumeSH, (float3)(texCoord_40));
    SHAb_37 = tmpvar_48;
    x1_36.x = dot (SHAr_39, tmpvar_35);
    x1_36.y = dot (SHAg_38, tmpvar_35);
    x1_36.z = dot (SHAb_37, tmpvar_35);
    ambient_contrib_34 = x1_36;
  } else {
    half4 tmpvar_49 = 0;
    tmpvar_49.w = half(1.0);
    tmpvar_49.xyz = normalWorld_32;
    half3 x_50 = 0;
    x_50.x = dot (_mtl_u.unity_SHAr, tmpvar_49);
    x_50.y = dot (_mtl_u.unity_SHAg, tmpvar_49);
    x_50.z = dot (_mtl_u.unity_SHAb, tmpvar_49);
    ambient_contrib_34 = x_50;
  };
  half3 tmpvar_51 = 0;
  tmpvar_51 = max ((half3)float3(0.0, 0.0, 0.0), (tmpvar_10 + ambient_contrib_34));
  ambient_33 = tmpvar_51;
  bool tmpvar_52 = false;
  tmpvar_52 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)(0.0));
  if (tmpvar_52) {
    ambient_33 = max ((((half)(1.055) * 
      pow (max (tmpvar_51, (half3)float3(0.0, 0.0, 0.0)), (half3)float3(0.4166667, 0.4166667, 0.4166667))
    ) - (half)(0.055)), (half3)float3(0.0, 0.0, 0.0));
  };
  half3 specular_53 = 0;
  half3 worldRefl_54 = 0;
  worldRefl_54 = tmpvar_8;
  float3 worldPos_55 = 0;
  worldPos_55 = tmpvar_9;
  if ((_mtl_u.unity_SpecCube0_ProbePosition.w > 0.0)) {
    half3 rbmin_56 = 0;
    half3 rbmax_57 = 0;
    half3 tmpvar_58 = 0;
    tmpvar_58 = normalize(tmpvar_8);
    float3 tmpvar_59 = 0;
    tmpvar_59 = ((_mtl_u.unity_SpecCube0_BoxMax.xyz - _mtl_i.xlv_TEXCOORD3.xyz) / (float3)(tmpvar_58));
    rbmax_57 = half3(tmpvar_59);
    float3 tmpvar_60 = 0;
    tmpvar_60 = ((_mtl_u.unity_SpecCube0_BoxMin.xyz - _mtl_i.xlv_TEXCOORD3.xyz) / (float3)(tmpvar_58));
    rbmin_56 = half3(tmpvar_60);
    bool3 tmpvar_61 = false;
    tmpvar_61 = (tmpvar_58 > (half3)(float3(0.0, 0.0, 0.0)));
    half tmpvar_62 = 0;
    if (tmpvar_61.x) {
      tmpvar_62 = rbmax_57.x;
    } else {
      tmpvar_62 = rbmin_56.x;
    };
    half tmpvar_63 = 0;
    if (tmpvar_61.y) {
      tmpvar_63 = rbmax_57.y;
    } else {
      tmpvar_63 = rbmin_56.y;
    };
    half tmpvar_64 = 0;
    if (tmpvar_61.z) {
      tmpvar_64 = rbmax_57.z;
    } else {
      tmpvar_64 = rbmin_56.z;
    };
    worldPos_55 = (_mtl_i.xlv_TEXCOORD3.xyz - _mtl_u.unity_SpecCube0_ProbePosition.xyz);
    worldRefl_54 = half3((worldPos_55 + (float3)((tmpvar_58 * min (
      min (tmpvar_62, tmpvar_63)
    , tmpvar_64)))));
  };
  half4 hdr_65 = 0;
  hdr_65 = half4(tmpvar_11);
  half4 tmpvar_66 = 0;
  tmpvar_66.xyz = worldRefl_54;
  tmpvar_66.w = ((tmpvar_7 * ((half)(1.7) - 
    ((half)(0.7) * tmpvar_7)
  )) * (half)(6.0));
  half4 tmpvar_67 = 0;
  tmpvar_67 = unity_SpecCube0.sample(_mtlsmp_unity_SpecCube0, (float3)(worldRefl_54), level(tmpvar_66.w));
  half4 tmpvar_68 = 0;
  tmpvar_68 = tmpvar_67;
  half3 tmpvar_69 = 0;
  tmpvar_69 = ((hdr_65.x * pow (tmpvar_68.w, hdr_65.y)) * tmpvar_68.xyz);
  if ((_mtl_u.unity_SpecCube0_BoxMin.w < 0.99999)) {
    half3 worldRefl_70 = 0;
    worldRefl_70 = tmpvar_8;
    float3 worldPos_71 = 0;
    worldPos_71 = tmpvar_9;
    if ((_mtl_u.unity_SpecCube1_ProbePosition.w > 0.0)) {
      half3 rbmin_72 = 0;
      half3 rbmax_73 = 0;
      half3 tmpvar_74 = 0;
      tmpvar_74 = normalize(tmpvar_8);
      float3 tmpvar_75 = 0;
      tmpvar_75 = ((_mtl_u.unity_SpecCube1_BoxMax.xyz - _mtl_i.xlv_TEXCOORD3.xyz) / (float3)(tmpvar_74));
      rbmax_73 = half3(tmpvar_75);
      float3 tmpvar_76 = 0;
      tmpvar_76 = ((_mtl_u.unity_SpecCube1_BoxMin.xyz - _mtl_i.xlv_TEXCOORD3.xyz) / (float3)(tmpvar_74));
      rbmin_72 = half3(tmpvar_76);
      bool3 tmpvar_77 = false;
      tmpvar_77 = (tmpvar_74 > (half3)(float3(0.0, 0.0, 0.0)));
      half tmpvar_78 = 0;
      if (tmpvar_77.x) {
        tmpvar_78 = rbmax_73.x;
      } else {
        tmpvar_78 = rbmin_72.x;
      };
      half tmpvar_79 = 0;
      if (tmpvar_77.y) {
        tmpvar_79 = rbmax_73.y;
      } else {
        tmpvar_79 = rbmin_72.y;
      };
      half tmpvar_80 = 0;
      if (tmpvar_77.z) {
        tmpvar_80 = rbmax_73.z;
      } else {
        tmpvar_80 = rbmin_72.z;
      };
      worldPos_71 = (_mtl_i.xlv_TEXCOORD3.xyz - _mtl_u.unity_SpecCube1_ProbePosition.xyz);
      worldRefl_70 = half3((worldPos_71 + (float3)((tmpvar_74 * min (
        min (tmpvar_78, tmpvar_79)
      , tmpvar_80)))));
    };
    half4 hdr_81 = 0;
    hdr_81 = half4(tmpvar_12);
    half4 tmpvar_82 = 0;
    tmpvar_82.xyz = worldRefl_70;
    tmpvar_82.w = ((tmpvar_7 * ((half)(1.7) - 
      ((half)(0.7) * tmpvar_7)
    )) * (half)(6.0));
    half4 tmpvar_83 = 0;
    tmpvar_83 = unity_SpecCube1.sample(_mtlsmp_unity_SpecCube1, (float3)(worldRefl_70), level(tmpvar_82.w));
    half4 tmpvar_84 = 0;
    tmpvar_84 = tmpvar_83;
    half3 tmpvar_85 = 0;
    tmpvar_85 = ((hdr_81.x * pow (tmpvar_84.w, hdr_81.y)) * tmpvar_84.xyz);
    float3 tmpvar_86 = 0;
    tmpvar_86 = mix ((float3)tmpvar_85, (float3)tmpvar_69, _mtl_u.unity_SpecCube0_BoxMin.www);
    specular_53 = half3(tmpvar_86);
  } else {
    specular_53 = tmpvar_69;
  };
  lightDirection_16 = float3(tmpvar_14);
  lightColor_15 = float3(tmpvar_13);
  half4 tmpvar_87 = 0;
  float2 P_88 = 0;
  P_88 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._SpecularMap_ST.xy) + _mtl_u._SpecularMap_ST.zw);
  tmpvar_87 = _SpecularMap.sample(_mtlsmp__SpecularMap, (float2)(P_88));
  _SpecularMap_var_6 = float4(tmpvar_87);
  float3 tmpvar_89 = 0;
  tmpvar_89 = ((_SpecularMap_var_6.xyz * _mtl_u._SpecIntensity) * _mtl_u._Speccolor.xyz);
  half4 tmpvar_90 = 0;
  float2 P_91 = 0;
  P_91 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._DiffuseMapTransA_ST.xy) + _mtl_u._DiffuseMapTransA_ST.zw);
  tmpvar_90 = _DiffuseMapTransA.sample(_mtlsmp__DiffuseMapTransA, (float2)(P_91));
  _DiffuseMapTransA_var_5 = float4(tmpvar_90);
  float4 tmpvar_92 = 0;
  tmpvar_92.xyz = (((
    (max (0.0, dot (tmpvar_23, lightDirection_16)) * tmpvar_29)
   + (float3)(ambient_33)) * (_DiffuseMapTransA_var_5.xyz * _mtl_u._Diffusecolor.xyz)) + ((
    pow (max (0.0, dot (tmpvar_28, tmpvar_23)), tmpvar_30)
   * tmpvar_89) + ((float3)(specular_53) * tmpvar_89)));
  tmpvar_92.w = (_DiffuseMapTransA_var_5.w * _mtl_u._Transparency);
  finalRGBA_4 = half4(tmpvar_92);
  tmpvar_2 = float4(finalRGBA_4);
  _mtl_o._glesFragData_0 = half4(tmpvar_2);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 122 math, 8 textures, 14 branches
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
SetTexture 0 [unity_SpecCube0] CUBE 0
SetTexture 1 [unity_SpecCube1] CUBE 1
SetTexture 2 [unity_ProbeVolumeSH] 3D 2
SetTexture 3 [_DiffuseMapTransA] 2D 3
SetTexture 4 [_NormalMap] 2D 4
SetTexture 5 [_SpecularMap] 2D 5
ConstBuffer "$Globals" 412
Matrix 192 [unity_ProbeVolumeWorldToObject]
Vector 0 [_WorldSpaceCameraPos] 3
VectorHalf 16 [_WorldSpaceLightPos0] 4
VectorHalf 24 [unity_SHAr] 4
VectorHalf 32 [unity_SHAg] 4
VectorHalf 40 [unity_SHAb] 4
Vector 48 [unity_SpecCube0_BoxMax]
Vector 64 [unity_SpecCube0_BoxMin]
Vector 80 [unity_SpecCube0_ProbePosition]
VectorHalf 96 [unity_SpecCube0_HDR] 4
Vector 112 [unity_SpecCube1_BoxMax]
Vector 128 [unity_SpecCube1_BoxMin]
Vector 144 [unity_SpecCube1_ProbePosition]
VectorHalf 160 [unity_SpecCube1_HDR] 4
Vector 176 [unity_ProbeVolumeParams]
Vector 256 [unity_ProbeVolumeSizeInv] 3
Vector 272 [unity_ProbeVolumeMin] 3
VectorHalf 288 [unity_ColorSpaceLuminance] 4
VectorHalf 296 [_LightColor0] 4
Vector 304 [_DiffuseMapTransA_ST]
Vector 320 [_Diffusecolor]
Vector 336 [_NormalMap_ST]
Float 352 [_NormalIntensity]
Vector 368 [_SpecularMap_ST]
Vector 384 [_Speccolor]
Float 400 [_SpecIntensity]
Float 404 [_Gloss]
Float 408 [_Transparency]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  bool gl_FrontFacing [[front_facing]];
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float4 xlv_TEXCOORD8;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  half4 _WorldSpaceLightPos0;
  half4 unity_SHAr;
  half4 unity_SHAg;
  half4 unity_SHAb;
  float4 unity_SpecCube0_BoxMax;
  float4 unity_SpecCube0_BoxMin;
  float4 unity_SpecCube0_ProbePosition;
  half4 unity_SpecCube0_HDR;
  float4 unity_SpecCube1_BoxMax;
  float4 unity_SpecCube1_BoxMin;
  float4 unity_SpecCube1_ProbePosition;
  half4 unity_SpecCube1_HDR;
  float4 unity_ProbeVolumeParams;
  float4x4 unity_ProbeVolumeWorldToObject;
  float3 unity_ProbeVolumeSizeInv;
  float3 unity_ProbeVolumeMin;
  half4 unity_ColorSpaceLuminance;
  half4 _LightColor0;
  float4 _DiffuseMapTransA_ST;
  float4 _Diffusecolor;
  float4 _NormalMap_ST;
  float _NormalIntensity;
  float4 _SpecularMap_ST;
  float4 _Speccolor;
  float _SpecIntensity;
  float _Gloss;
  float _Transparency;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texturecube<half> unity_SpecCube0 [[texture(0)]], sampler _mtlsmp_unity_SpecCube0 [[sampler(0)]]
  ,   texturecube<half> unity_SpecCube1 [[texture(1)]], sampler _mtlsmp_unity_SpecCube1 [[sampler(1)]]
  ,   texture3d<half> unity_ProbeVolumeSH [[texture(2)]], sampler _mtlsmp_unity_ProbeVolumeSH [[sampler(2)]]
  ,   texture2d<half> _DiffuseMapTransA [[texture(3)]], sampler _mtlsmp__DiffuseMapTransA [[sampler(3)]]
  ,   texture2d<half> _NormalMap [[texture(4)]], sampler _mtlsmp__NormalMap [[sampler(4)]]
  ,   texture2d<half> _SpecularMap [[texture(5)]], sampler _mtlsmp__SpecularMap [[sampler(5)]])
{
  xlatMtlShaderOutput _mtl_o;
  float tmpvar_1 = 0;
  if (_mtl_i.gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  float4 tmpvar_2 = 0;
  float3 tmpvar_3 = 0;
  tmpvar_3 = _mtl_i.xlv_TEXCOORD4;
  half4 finalRGBA_4 = 0;
  float4 _DiffuseMapTransA_var_5 = 0;
  float4 _SpecularMap_var_6 = 0;
  half tmpvar_7 = 0;
  half3 tmpvar_8 = 0;
  float3 tmpvar_9 = 0;
  half3 tmpvar_10 = 0;
  float4 tmpvar_11 = 0;
  float4 tmpvar_12 = 0;
  half3 tmpvar_13 = 0;
  half3 tmpvar_14 = 0;
  float3 lightColor_15 = 0;
  float3 lightDirection_16 = 0;
  float3 _NormalMap_var_17 = 0;
  int tmpvar_18 = 0;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_18 = 1;
  } else {
    tmpvar_18 = -1;
  };
  tmpvar_3 = (normalize(_mtl_i.xlv_TEXCOORD4) * float(tmpvar_18));
  float3x3 tmpvar_19;
  tmpvar_19[0].x = _mtl_i.xlv_TEXCOORD5.x;
  tmpvar_19[0].y = _mtl_i.xlv_TEXCOORD6.x;
  tmpvar_19[0].z = tmpvar_3.x;
  tmpvar_19[1].x = _mtl_i.xlv_TEXCOORD5.y;
  tmpvar_19[1].y = _mtl_i.xlv_TEXCOORD6.y;
  tmpvar_19[1].z = tmpvar_3.y;
  tmpvar_19[2].x = _mtl_i.xlv_TEXCOORD5.z;
  tmpvar_19[2].y = _mtl_i.xlv_TEXCOORD6.z;
  tmpvar_19[2].z = tmpvar_3.z;
  float3 tmpvar_20 = 0;
  tmpvar_20 = normalize((_mtl_u._WorldSpaceCameraPos - _mtl_i.xlv_TEXCOORD3.xyz));
  float2 P_21 = 0;
  P_21 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._NormalMap_ST.xy) + _mtl_u._NormalMap_ST.zw);
  half3 normal_22 = 0;
  normal_22.xy = ((_NormalMap.sample(_mtlsmp__NormalMap, (float2)(P_21)).wy * (half)(2.0)) - (half)(1.0));
  normal_22.z = sqrt(((half)(1.0) - clamp (
    dot (normal_22.xy, normal_22.xy)
  , (half)0.0, (half)1.0)));
  _NormalMap_var_17 = float3(normal_22);
  float3 tmpvar_23 = 0;
  tmpvar_23 = normalize((mix (float3(0.0, 0.0, 1.0), _NormalMap_var_17, float3(_mtl_u._NormalIntensity)) * tmpvar_19));
  float3 tmpvar_24 = 0;
  float3 I_25 = 0;
  I_25 = -(tmpvar_20);
  tmpvar_24 = (I_25 - (2.0 * (
    dot (tmpvar_23, I_25)
   * tmpvar_23)));
  half3 tmpvar_26 = 0;
  tmpvar_26 = normalize(_mtl_u._WorldSpaceLightPos0.xyz);
  lightDirection_16 = float3(tmpvar_26);
  half3 tmpvar_27 = 0;
  tmpvar_27 = _mtl_u._LightColor0.xyz;
  lightColor_15 = float3(tmpvar_27);
  float3 tmpvar_28 = 0;
  tmpvar_28 = normalize((tmpvar_20 + lightDirection_16));
  float3 tmpvar_29 = 0;
  tmpvar_29 = float3(_mtl_u._LightColor0.xyz);
  float tmpvar_30 = 0;
  tmpvar_30 = exp2(((_mtl_u._Gloss * 10.0) + 1.0));
  tmpvar_13 = half3(lightColor_15);
  tmpvar_14 = half3(lightDirection_16);
  tmpvar_9 = _mtl_i.xlv_TEXCOORD3.xyz;
  float3 tmpvar_31 = 0;
  tmpvar_31 = _mtl_i.xlv_TEXCOORD8.xyz;
  tmpvar_10 = half3(tmpvar_31);
  tmpvar_11 = float4(_mtl_u.unity_SpecCube0_HDR);
  tmpvar_12 = float4(_mtl_u.unity_SpecCube1_HDR);
  tmpvar_7 = half((1.0 - _mtl_u._Gloss));
  tmpvar_8 = half3(tmpvar_24);
  half3 normalWorld_32 = 0;
  normalWorld_32 = half3(tmpvar_23);
  half3 ambient_33 = 0;
  ambient_33 = tmpvar_10;
  half3 ambient_contrib_34 = 0;
  ambient_contrib_34 = half3(float3(0.0, 0.0, 0.0));
  if ((_mtl_u.unity_ProbeVolumeParams.x == 1.0)) {
    half4 tmpvar_35 = 0;
    tmpvar_35.w = half(1.0);
    tmpvar_35.xyz = normalWorld_32;
    half3 x1_36 = 0;
    half4 SHAb_37 = 0;
    half4 SHAg_38 = 0;
    half4 SHAr_39 = 0;
    float3 texCoord_40 = 0;
    float3 tmpvar_41 = 0;
    if ((_mtl_u.unity_ProbeVolumeParams.y == 1.0)) {
      float4 tmpvar_42 = 0;
      tmpvar_42.w = 1.0;
      tmpvar_42.xyz = tmpvar_9;
      tmpvar_41 = (_mtl_u.unity_ProbeVolumeWorldToObject * tmpvar_42).xyz;
    } else {
      tmpvar_41 = tmpvar_9;
    };
    float3 tmpvar_43 = 0;
    tmpvar_43 = ((tmpvar_41 - _mtl_u.unity_ProbeVolumeMin) * _mtl_u.unity_ProbeVolumeSizeInv);
    texCoord_40.yz = tmpvar_43.yz;
    texCoord_40.x = (tmpvar_43.x * 0.25);
    float tmpvar_44 = 0;
    float tmpvar_45 = 0;
    tmpvar_45 = (0.5 * _mtl_u.unity_ProbeVolumeParams.z);
    tmpvar_44 = clamp (texCoord_40.x, tmpvar_45, (0.25 - tmpvar_45));
    texCoord_40.x = tmpvar_44;
    half4 tmpvar_46 = 0;
    tmpvar_46 = unity_ProbeVolumeSH.sample(_mtlsmp_unity_ProbeVolumeSH, (float3)(texCoord_40));
    SHAr_39 = tmpvar_46;
    texCoord_40.x = (tmpvar_44 + 0.25);
    half4 tmpvar_47 = 0;
    tmpvar_47 = unity_ProbeVolumeSH.sample(_mtlsmp_unity_ProbeVolumeSH, (float3)(texCoord_40));
    SHAg_38 = tmpvar_47;
    texCoord_40.x = (tmpvar_44 + 0.5);
    half4 tmpvar_48 = 0;
    tmpvar_48 = unity_ProbeVolumeSH.sample(_mtlsmp_unity_ProbeVolumeSH, (float3)(texCoord_40));
    SHAb_37 = tmpvar_48;
    x1_36.x = dot (SHAr_39, tmpvar_35);
    x1_36.y = dot (SHAg_38, tmpvar_35);
    x1_36.z = dot (SHAb_37, tmpvar_35);
    ambient_contrib_34 = x1_36;
  } else {
    half4 tmpvar_49 = 0;
    tmpvar_49.w = half(1.0);
    tmpvar_49.xyz = normalWorld_32;
    half3 x_50 = 0;
    x_50.x = dot (_mtl_u.unity_SHAr, tmpvar_49);
    x_50.y = dot (_mtl_u.unity_SHAg, tmpvar_49);
    x_50.z = dot (_mtl_u.unity_SHAb, tmpvar_49);
    ambient_contrib_34 = x_50;
  };
  half3 tmpvar_51 = 0;
  tmpvar_51 = max ((half3)float3(0.0, 0.0, 0.0), (tmpvar_10 + ambient_contrib_34));
  ambient_33 = tmpvar_51;
  bool tmpvar_52 = false;
  tmpvar_52 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)(0.0));
  if (tmpvar_52) {
    ambient_33 = max ((((half)(1.055) * 
      pow (max (tmpvar_51, (half3)float3(0.0, 0.0, 0.0)), (half3)float3(0.4166667, 0.4166667, 0.4166667))
    ) - (half)(0.055)), (half3)float3(0.0, 0.0, 0.0));
  };
  half3 specular_53 = 0;
  half3 worldRefl_54 = 0;
  worldRefl_54 = tmpvar_8;
  float3 worldPos_55 = 0;
  worldPos_55 = tmpvar_9;
  if ((_mtl_u.unity_SpecCube0_ProbePosition.w > 0.0)) {
    half3 rbmin_56 = 0;
    half3 rbmax_57 = 0;
    half3 tmpvar_58 = 0;
    tmpvar_58 = normalize(tmpvar_8);
    float3 tmpvar_59 = 0;
    tmpvar_59 = ((_mtl_u.unity_SpecCube0_BoxMax.xyz - _mtl_i.xlv_TEXCOORD3.xyz) / (float3)(tmpvar_58));
    rbmax_57 = half3(tmpvar_59);
    float3 tmpvar_60 = 0;
    tmpvar_60 = ((_mtl_u.unity_SpecCube0_BoxMin.xyz - _mtl_i.xlv_TEXCOORD3.xyz) / (float3)(tmpvar_58));
    rbmin_56 = half3(tmpvar_60);
    bool3 tmpvar_61 = false;
    tmpvar_61 = (tmpvar_58 > (half3)(float3(0.0, 0.0, 0.0)));
    half tmpvar_62 = 0;
    if (tmpvar_61.x) {
      tmpvar_62 = rbmax_57.x;
    } else {
      tmpvar_62 = rbmin_56.x;
    };
    half tmpvar_63 = 0;
    if (tmpvar_61.y) {
      tmpvar_63 = rbmax_57.y;
    } else {
      tmpvar_63 = rbmin_56.y;
    };
    half tmpvar_64 = 0;
    if (tmpvar_61.z) {
      tmpvar_64 = rbmax_57.z;
    } else {
      tmpvar_64 = rbmin_56.z;
    };
    worldPos_55 = (_mtl_i.xlv_TEXCOORD3.xyz - _mtl_u.unity_SpecCube0_ProbePosition.xyz);
    worldRefl_54 = half3((worldPos_55 + (float3)((tmpvar_58 * min (
      min (tmpvar_62, tmpvar_63)
    , tmpvar_64)))));
  };
  half4 hdr_65 = 0;
  hdr_65 = half4(tmpvar_11);
  half4 tmpvar_66 = 0;
  tmpvar_66.xyz = worldRefl_54;
  tmpvar_66.w = ((tmpvar_7 * ((half)(1.7) - 
    ((half)(0.7) * tmpvar_7)
  )) * (half)(6.0));
  half4 tmpvar_67 = 0;
  tmpvar_67 = unity_SpecCube0.sample(_mtlsmp_unity_SpecCube0, (float3)(worldRefl_54), level(tmpvar_66.w));
  half4 tmpvar_68 = 0;
  tmpvar_68 = tmpvar_67;
  half3 tmpvar_69 = 0;
  tmpvar_69 = ((hdr_65.x * pow (tmpvar_68.w, hdr_65.y)) * tmpvar_68.xyz);
  if ((_mtl_u.unity_SpecCube0_BoxMin.w < 0.99999)) {
    half3 worldRefl_70 = 0;
    worldRefl_70 = tmpvar_8;
    float3 worldPos_71 = 0;
    worldPos_71 = tmpvar_9;
    if ((_mtl_u.unity_SpecCube1_ProbePosition.w > 0.0)) {
      half3 rbmin_72 = 0;
      half3 rbmax_73 = 0;
      half3 tmpvar_74 = 0;
      tmpvar_74 = normalize(tmpvar_8);
      float3 tmpvar_75 = 0;
      tmpvar_75 = ((_mtl_u.unity_SpecCube1_BoxMax.xyz - _mtl_i.xlv_TEXCOORD3.xyz) / (float3)(tmpvar_74));
      rbmax_73 = half3(tmpvar_75);
      float3 tmpvar_76 = 0;
      tmpvar_76 = ((_mtl_u.unity_SpecCube1_BoxMin.xyz - _mtl_i.xlv_TEXCOORD3.xyz) / (float3)(tmpvar_74));
      rbmin_72 = half3(tmpvar_76);
      bool3 tmpvar_77 = false;
      tmpvar_77 = (tmpvar_74 > (half3)(float3(0.0, 0.0, 0.0)));
      half tmpvar_78 = 0;
      if (tmpvar_77.x) {
        tmpvar_78 = rbmax_73.x;
      } else {
        tmpvar_78 = rbmin_72.x;
      };
      half tmpvar_79 = 0;
      if (tmpvar_77.y) {
        tmpvar_79 = rbmax_73.y;
      } else {
        tmpvar_79 = rbmin_72.y;
      };
      half tmpvar_80 = 0;
      if (tmpvar_77.z) {
        tmpvar_80 = rbmax_73.z;
      } else {
        tmpvar_80 = rbmin_72.z;
      };
      worldPos_71 = (_mtl_i.xlv_TEXCOORD3.xyz - _mtl_u.unity_SpecCube1_ProbePosition.xyz);
      worldRefl_70 = half3((worldPos_71 + (float3)((tmpvar_74 * min (
        min (tmpvar_78, tmpvar_79)
      , tmpvar_80)))));
    };
    half4 hdr_81 = 0;
    hdr_81 = half4(tmpvar_12);
    half4 tmpvar_82 = 0;
    tmpvar_82.xyz = worldRefl_70;
    tmpvar_82.w = ((tmpvar_7 * ((half)(1.7) - 
      ((half)(0.7) * tmpvar_7)
    )) * (half)(6.0));
    half4 tmpvar_83 = 0;
    tmpvar_83 = unity_SpecCube1.sample(_mtlsmp_unity_SpecCube1, (float3)(worldRefl_70), level(tmpvar_82.w));
    half4 tmpvar_84 = 0;
    tmpvar_84 = tmpvar_83;
    half3 tmpvar_85 = 0;
    tmpvar_85 = ((hdr_81.x * pow (tmpvar_84.w, hdr_81.y)) * tmpvar_84.xyz);
    float3 tmpvar_86 = 0;
    tmpvar_86 = mix ((float3)tmpvar_85, (float3)tmpvar_69, _mtl_u.unity_SpecCube0_BoxMin.www);
    specular_53 = half3(tmpvar_86);
  } else {
    specular_53 = tmpvar_69;
  };
  lightDirection_16 = float3(tmpvar_14);
  lightColor_15 = float3(tmpvar_13);
  half4 tmpvar_87 = 0;
  float2 P_88 = 0;
  P_88 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._SpecularMap_ST.xy) + _mtl_u._SpecularMap_ST.zw);
  tmpvar_87 = _SpecularMap.sample(_mtlsmp__SpecularMap, (float2)(P_88));
  _SpecularMap_var_6 = float4(tmpvar_87);
  float3 tmpvar_89 = 0;
  tmpvar_89 = ((_SpecularMap_var_6.xyz * _mtl_u._SpecIntensity) * _mtl_u._Speccolor.xyz);
  half4 tmpvar_90 = 0;
  float2 P_91 = 0;
  P_91 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._DiffuseMapTransA_ST.xy) + _mtl_u._DiffuseMapTransA_ST.zw);
  tmpvar_90 = _DiffuseMapTransA.sample(_mtlsmp__DiffuseMapTransA, (float2)(P_91));
  _DiffuseMapTransA_var_5 = float4(tmpvar_90);
  float4 tmpvar_92 = 0;
  tmpvar_92.xyz = (((
    (max (0.0, dot (tmpvar_23, lightDirection_16)) * tmpvar_29)
   + (float3)(ambient_33)) * (_DiffuseMapTransA_var_5.xyz * _mtl_u._Diffusecolor.xyz)) + ((
    pow (max (0.0, dot (tmpvar_28, tmpvar_23)), tmpvar_30)
   * tmpvar_89) + ((float3)(specular_53) * tmpvar_89)));
  tmpvar_92.w = (_DiffuseMapTransA_var_5.w * _mtl_u._Transparency);
  finalRGBA_4 = half4(tmpvar_92);
  tmpvar_2 = float4(finalRGBA_4);
  _mtl_o._glesFragData_0 = half4(tmpvar_2);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 122 math, 8 textures, 14 branches
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
SetTexture 0 [unity_SpecCube0] CUBE 0
SetTexture 1 [unity_SpecCube1] CUBE 1
SetTexture 2 [unity_ProbeVolumeSH] 3D 2
SetTexture 3 [_DiffuseMapTransA] 2D 3
SetTexture 4 [_NormalMap] 2D 4
SetTexture 5 [_SpecularMap] 2D 5
ConstBuffer "$Globals" 412
Matrix 192 [unity_ProbeVolumeWorldToObject]
Vector 0 [_WorldSpaceCameraPos] 3
VectorHalf 16 [_WorldSpaceLightPos0] 4
VectorHalf 24 [unity_SHAr] 4
VectorHalf 32 [unity_SHAg] 4
VectorHalf 40 [unity_SHAb] 4
Vector 48 [unity_SpecCube0_BoxMax]
Vector 64 [unity_SpecCube0_BoxMin]
Vector 80 [unity_SpecCube0_ProbePosition]
VectorHalf 96 [unity_SpecCube0_HDR] 4
Vector 112 [unity_SpecCube1_BoxMax]
Vector 128 [unity_SpecCube1_BoxMin]
Vector 144 [unity_SpecCube1_ProbePosition]
VectorHalf 160 [unity_SpecCube1_HDR] 4
Vector 176 [unity_ProbeVolumeParams]
Vector 256 [unity_ProbeVolumeSizeInv] 3
Vector 272 [unity_ProbeVolumeMin] 3
VectorHalf 288 [unity_ColorSpaceLuminance] 4
VectorHalf 296 [_LightColor0] 4
Vector 304 [_DiffuseMapTransA_ST]
Vector 320 [_Diffusecolor]
Vector 336 [_NormalMap_ST]
Float 352 [_NormalIntensity]
Vector 368 [_SpecularMap_ST]
Vector 384 [_Speccolor]
Float 400 [_SpecIntensity]
Float 404 [_Gloss]
Float 408 [_Transparency]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  bool gl_FrontFacing [[front_facing]];
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float4 xlv_TEXCOORD8;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  half4 _WorldSpaceLightPos0;
  half4 unity_SHAr;
  half4 unity_SHAg;
  half4 unity_SHAb;
  float4 unity_SpecCube0_BoxMax;
  float4 unity_SpecCube0_BoxMin;
  float4 unity_SpecCube0_ProbePosition;
  half4 unity_SpecCube0_HDR;
  float4 unity_SpecCube1_BoxMax;
  float4 unity_SpecCube1_BoxMin;
  float4 unity_SpecCube1_ProbePosition;
  half4 unity_SpecCube1_HDR;
  float4 unity_ProbeVolumeParams;
  float4x4 unity_ProbeVolumeWorldToObject;
  float3 unity_ProbeVolumeSizeInv;
  float3 unity_ProbeVolumeMin;
  half4 unity_ColorSpaceLuminance;
  half4 _LightColor0;
  float4 _DiffuseMapTransA_ST;
  float4 _Diffusecolor;
  float4 _NormalMap_ST;
  float _NormalIntensity;
  float4 _SpecularMap_ST;
  float4 _Speccolor;
  float _SpecIntensity;
  float _Gloss;
  float _Transparency;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texturecube<half> unity_SpecCube0 [[texture(0)]], sampler _mtlsmp_unity_SpecCube0 [[sampler(0)]]
  ,   texturecube<half> unity_SpecCube1 [[texture(1)]], sampler _mtlsmp_unity_SpecCube1 [[sampler(1)]]
  ,   texture3d<half> unity_ProbeVolumeSH [[texture(2)]], sampler _mtlsmp_unity_ProbeVolumeSH [[sampler(2)]]
  ,   texture2d<half> _DiffuseMapTransA [[texture(3)]], sampler _mtlsmp__DiffuseMapTransA [[sampler(3)]]
  ,   texture2d<half> _NormalMap [[texture(4)]], sampler _mtlsmp__NormalMap [[sampler(4)]]
  ,   texture2d<half> _SpecularMap [[texture(5)]], sampler _mtlsmp__SpecularMap [[sampler(5)]])
{
  xlatMtlShaderOutput _mtl_o;
  float tmpvar_1 = 0;
  if (_mtl_i.gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  float4 tmpvar_2 = 0;
  float3 tmpvar_3 = 0;
  tmpvar_3 = _mtl_i.xlv_TEXCOORD4;
  half4 finalRGBA_4 = 0;
  float4 _DiffuseMapTransA_var_5 = 0;
  float4 _SpecularMap_var_6 = 0;
  half tmpvar_7 = 0;
  half3 tmpvar_8 = 0;
  float3 tmpvar_9 = 0;
  half3 tmpvar_10 = 0;
  float4 tmpvar_11 = 0;
  float4 tmpvar_12 = 0;
  half3 tmpvar_13 = 0;
  half3 tmpvar_14 = 0;
  float3 lightColor_15 = 0;
  float3 lightDirection_16 = 0;
  float3 _NormalMap_var_17 = 0;
  int tmpvar_18 = 0;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_18 = 1;
  } else {
    tmpvar_18 = -1;
  };
  tmpvar_3 = (normalize(_mtl_i.xlv_TEXCOORD4) * float(tmpvar_18));
  float3x3 tmpvar_19;
  tmpvar_19[0].x = _mtl_i.xlv_TEXCOORD5.x;
  tmpvar_19[0].y = _mtl_i.xlv_TEXCOORD6.x;
  tmpvar_19[0].z = tmpvar_3.x;
  tmpvar_19[1].x = _mtl_i.xlv_TEXCOORD5.y;
  tmpvar_19[1].y = _mtl_i.xlv_TEXCOORD6.y;
  tmpvar_19[1].z = tmpvar_3.y;
  tmpvar_19[2].x = _mtl_i.xlv_TEXCOORD5.z;
  tmpvar_19[2].y = _mtl_i.xlv_TEXCOORD6.z;
  tmpvar_19[2].z = tmpvar_3.z;
  float3 tmpvar_20 = 0;
  tmpvar_20 = normalize((_mtl_u._WorldSpaceCameraPos - _mtl_i.xlv_TEXCOORD3.xyz));
  float2 P_21 = 0;
  P_21 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._NormalMap_ST.xy) + _mtl_u._NormalMap_ST.zw);
  half3 normal_22 = 0;
  normal_22.xy = ((_NormalMap.sample(_mtlsmp__NormalMap, (float2)(P_21)).wy * (half)(2.0)) - (half)(1.0));
  normal_22.z = sqrt(((half)(1.0) - clamp (
    dot (normal_22.xy, normal_22.xy)
  , (half)0.0, (half)1.0)));
  _NormalMap_var_17 = float3(normal_22);
  float3 tmpvar_23 = 0;
  tmpvar_23 = normalize((mix (float3(0.0, 0.0, 1.0), _NormalMap_var_17, float3(_mtl_u._NormalIntensity)) * tmpvar_19));
  float3 tmpvar_24 = 0;
  float3 I_25 = 0;
  I_25 = -(tmpvar_20);
  tmpvar_24 = (I_25 - (2.0 * (
    dot (tmpvar_23, I_25)
   * tmpvar_23)));
  half3 tmpvar_26 = 0;
  tmpvar_26 = normalize(_mtl_u._WorldSpaceLightPos0.xyz);
  lightDirection_16 = float3(tmpvar_26);
  half3 tmpvar_27 = 0;
  tmpvar_27 = _mtl_u._LightColor0.xyz;
  lightColor_15 = float3(tmpvar_27);
  float3 tmpvar_28 = 0;
  tmpvar_28 = normalize((tmpvar_20 + lightDirection_16));
  float3 tmpvar_29 = 0;
  tmpvar_29 = float3(_mtl_u._LightColor0.xyz);
  float tmpvar_30 = 0;
  tmpvar_30 = exp2(((_mtl_u._Gloss * 10.0) + 1.0));
  tmpvar_13 = half3(lightColor_15);
  tmpvar_14 = half3(lightDirection_16);
  tmpvar_9 = _mtl_i.xlv_TEXCOORD3.xyz;
  float3 tmpvar_31 = 0;
  tmpvar_31 = _mtl_i.xlv_TEXCOORD8.xyz;
  tmpvar_10 = half3(tmpvar_31);
  tmpvar_11 = float4(_mtl_u.unity_SpecCube0_HDR);
  tmpvar_12 = float4(_mtl_u.unity_SpecCube1_HDR);
  tmpvar_7 = half((1.0 - _mtl_u._Gloss));
  tmpvar_8 = half3(tmpvar_24);
  half3 normalWorld_32 = 0;
  normalWorld_32 = half3(tmpvar_23);
  half3 ambient_33 = 0;
  ambient_33 = tmpvar_10;
  half3 ambient_contrib_34 = 0;
  ambient_contrib_34 = half3(float3(0.0, 0.0, 0.0));
  if ((_mtl_u.unity_ProbeVolumeParams.x == 1.0)) {
    half4 tmpvar_35 = 0;
    tmpvar_35.w = half(1.0);
    tmpvar_35.xyz = normalWorld_32;
    half3 x1_36 = 0;
    half4 SHAb_37 = 0;
    half4 SHAg_38 = 0;
    half4 SHAr_39 = 0;
    float3 texCoord_40 = 0;
    float3 tmpvar_41 = 0;
    if ((_mtl_u.unity_ProbeVolumeParams.y == 1.0)) {
      float4 tmpvar_42 = 0;
      tmpvar_42.w = 1.0;
      tmpvar_42.xyz = tmpvar_9;
      tmpvar_41 = (_mtl_u.unity_ProbeVolumeWorldToObject * tmpvar_42).xyz;
    } else {
      tmpvar_41 = tmpvar_9;
    };
    float3 tmpvar_43 = 0;
    tmpvar_43 = ((tmpvar_41 - _mtl_u.unity_ProbeVolumeMin) * _mtl_u.unity_ProbeVolumeSizeInv);
    texCoord_40.yz = tmpvar_43.yz;
    texCoord_40.x = (tmpvar_43.x * 0.25);
    float tmpvar_44 = 0;
    float tmpvar_45 = 0;
    tmpvar_45 = (0.5 * _mtl_u.unity_ProbeVolumeParams.z);
    tmpvar_44 = clamp (texCoord_40.x, tmpvar_45, (0.25 - tmpvar_45));
    texCoord_40.x = tmpvar_44;
    half4 tmpvar_46 = 0;
    tmpvar_46 = unity_ProbeVolumeSH.sample(_mtlsmp_unity_ProbeVolumeSH, (float3)(texCoord_40));
    SHAr_39 = tmpvar_46;
    texCoord_40.x = (tmpvar_44 + 0.25);
    half4 tmpvar_47 = 0;
    tmpvar_47 = unity_ProbeVolumeSH.sample(_mtlsmp_unity_ProbeVolumeSH, (float3)(texCoord_40));
    SHAg_38 = tmpvar_47;
    texCoord_40.x = (tmpvar_44 + 0.5);
    half4 tmpvar_48 = 0;
    tmpvar_48 = unity_ProbeVolumeSH.sample(_mtlsmp_unity_ProbeVolumeSH, (float3)(texCoord_40));
    SHAb_37 = tmpvar_48;
    x1_36.x = dot (SHAr_39, tmpvar_35);
    x1_36.y = dot (SHAg_38, tmpvar_35);
    x1_36.z = dot (SHAb_37, tmpvar_35);
    ambient_contrib_34 = x1_36;
  } else {
    half4 tmpvar_49 = 0;
    tmpvar_49.w = half(1.0);
    tmpvar_49.xyz = normalWorld_32;
    half3 x_50 = 0;
    x_50.x = dot (_mtl_u.unity_SHAr, tmpvar_49);
    x_50.y = dot (_mtl_u.unity_SHAg, tmpvar_49);
    x_50.z = dot (_mtl_u.unity_SHAb, tmpvar_49);
    ambient_contrib_34 = x_50;
  };
  half3 tmpvar_51 = 0;
  tmpvar_51 = max ((half3)float3(0.0, 0.0, 0.0), (tmpvar_10 + ambient_contrib_34));
  ambient_33 = tmpvar_51;
  bool tmpvar_52 = false;
  tmpvar_52 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)(0.0));
  if (tmpvar_52) {
    ambient_33 = max ((((half)(1.055) * 
      pow (max (tmpvar_51, (half3)float3(0.0, 0.0, 0.0)), (half3)float3(0.4166667, 0.4166667, 0.4166667))
    ) - (half)(0.055)), (half3)float3(0.0, 0.0, 0.0));
  };
  half3 specular_53 = 0;
  half3 worldRefl_54 = 0;
  worldRefl_54 = tmpvar_8;
  float3 worldPos_55 = 0;
  worldPos_55 = tmpvar_9;
  if ((_mtl_u.unity_SpecCube0_ProbePosition.w > 0.0)) {
    half3 rbmin_56 = 0;
    half3 rbmax_57 = 0;
    half3 tmpvar_58 = 0;
    tmpvar_58 = normalize(tmpvar_8);
    float3 tmpvar_59 = 0;
    tmpvar_59 = ((_mtl_u.unity_SpecCube0_BoxMax.xyz - _mtl_i.xlv_TEXCOORD3.xyz) / (float3)(tmpvar_58));
    rbmax_57 = half3(tmpvar_59);
    float3 tmpvar_60 = 0;
    tmpvar_60 = ((_mtl_u.unity_SpecCube0_BoxMin.xyz - _mtl_i.xlv_TEXCOORD3.xyz) / (float3)(tmpvar_58));
    rbmin_56 = half3(tmpvar_60);
    bool3 tmpvar_61 = false;
    tmpvar_61 = (tmpvar_58 > (half3)(float3(0.0, 0.0, 0.0)));
    half tmpvar_62 = 0;
    if (tmpvar_61.x) {
      tmpvar_62 = rbmax_57.x;
    } else {
      tmpvar_62 = rbmin_56.x;
    };
    half tmpvar_63 = 0;
    if (tmpvar_61.y) {
      tmpvar_63 = rbmax_57.y;
    } else {
      tmpvar_63 = rbmin_56.y;
    };
    half tmpvar_64 = 0;
    if (tmpvar_61.z) {
      tmpvar_64 = rbmax_57.z;
    } else {
      tmpvar_64 = rbmin_56.z;
    };
    worldPos_55 = (_mtl_i.xlv_TEXCOORD3.xyz - _mtl_u.unity_SpecCube0_ProbePosition.xyz);
    worldRefl_54 = half3((worldPos_55 + (float3)((tmpvar_58 * min (
      min (tmpvar_62, tmpvar_63)
    , tmpvar_64)))));
  };
  half4 hdr_65 = 0;
  hdr_65 = half4(tmpvar_11);
  half4 tmpvar_66 = 0;
  tmpvar_66.xyz = worldRefl_54;
  tmpvar_66.w = ((tmpvar_7 * ((half)(1.7) - 
    ((half)(0.7) * tmpvar_7)
  )) * (half)(6.0));
  half4 tmpvar_67 = 0;
  tmpvar_67 = unity_SpecCube0.sample(_mtlsmp_unity_SpecCube0, (float3)(worldRefl_54), level(tmpvar_66.w));
  half4 tmpvar_68 = 0;
  tmpvar_68 = tmpvar_67;
  half3 tmpvar_69 = 0;
  tmpvar_69 = ((hdr_65.x * pow (tmpvar_68.w, hdr_65.y)) * tmpvar_68.xyz);
  if ((_mtl_u.unity_SpecCube0_BoxMin.w < 0.99999)) {
    half3 worldRefl_70 = 0;
    worldRefl_70 = tmpvar_8;
    float3 worldPos_71 = 0;
    worldPos_71 = tmpvar_9;
    if ((_mtl_u.unity_SpecCube1_ProbePosition.w > 0.0)) {
      half3 rbmin_72 = 0;
      half3 rbmax_73 = 0;
      half3 tmpvar_74 = 0;
      tmpvar_74 = normalize(tmpvar_8);
      float3 tmpvar_75 = 0;
      tmpvar_75 = ((_mtl_u.unity_SpecCube1_BoxMax.xyz - _mtl_i.xlv_TEXCOORD3.xyz) / (float3)(tmpvar_74));
      rbmax_73 = half3(tmpvar_75);
      float3 tmpvar_76 = 0;
      tmpvar_76 = ((_mtl_u.unity_SpecCube1_BoxMin.xyz - _mtl_i.xlv_TEXCOORD3.xyz) / (float3)(tmpvar_74));
      rbmin_72 = half3(tmpvar_76);
      bool3 tmpvar_77 = false;
      tmpvar_77 = (tmpvar_74 > (half3)(float3(0.0, 0.0, 0.0)));
      half tmpvar_78 = 0;
      if (tmpvar_77.x) {
        tmpvar_78 = rbmax_73.x;
      } else {
        tmpvar_78 = rbmin_72.x;
      };
      half tmpvar_79 = 0;
      if (tmpvar_77.y) {
        tmpvar_79 = rbmax_73.y;
      } else {
        tmpvar_79 = rbmin_72.y;
      };
      half tmpvar_80 = 0;
      if (tmpvar_77.z) {
        tmpvar_80 = rbmax_73.z;
      } else {
        tmpvar_80 = rbmin_72.z;
      };
      worldPos_71 = (_mtl_i.xlv_TEXCOORD3.xyz - _mtl_u.unity_SpecCube1_ProbePosition.xyz);
      worldRefl_70 = half3((worldPos_71 + (float3)((tmpvar_74 * min (
        min (tmpvar_78, tmpvar_79)
      , tmpvar_80)))));
    };
    half4 hdr_81 = 0;
    hdr_81 = half4(tmpvar_12);
    half4 tmpvar_82 = 0;
    tmpvar_82.xyz = worldRefl_70;
    tmpvar_82.w = ((tmpvar_7 * ((half)(1.7) - 
      ((half)(0.7) * tmpvar_7)
    )) * (half)(6.0));
    half4 tmpvar_83 = 0;
    tmpvar_83 = unity_SpecCube1.sample(_mtlsmp_unity_SpecCube1, (float3)(worldRefl_70), level(tmpvar_82.w));
    half4 tmpvar_84 = 0;
    tmpvar_84 = tmpvar_83;
    half3 tmpvar_85 = 0;
    tmpvar_85 = ((hdr_81.x * pow (tmpvar_84.w, hdr_81.y)) * tmpvar_84.xyz);
    float3 tmpvar_86 = 0;
    tmpvar_86 = mix ((float3)tmpvar_85, (float3)tmpvar_69, _mtl_u.unity_SpecCube0_BoxMin.www);
    specular_53 = half3(tmpvar_86);
  } else {
    specular_53 = tmpvar_69;
  };
  lightDirection_16 = float3(tmpvar_14);
  lightColor_15 = float3(tmpvar_13);
  half4 tmpvar_87 = 0;
  float2 P_88 = 0;
  P_88 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._SpecularMap_ST.xy) + _mtl_u._SpecularMap_ST.zw);
  tmpvar_87 = _SpecularMap.sample(_mtlsmp__SpecularMap, (float2)(P_88));
  _SpecularMap_var_6 = float4(tmpvar_87);
  float3 tmpvar_89 = 0;
  tmpvar_89 = ((_SpecularMap_var_6.xyz * _mtl_u._SpecIntensity) * _mtl_u._Speccolor.xyz);
  half4 tmpvar_90 = 0;
  float2 P_91 = 0;
  P_91 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._DiffuseMapTransA_ST.xy) + _mtl_u._DiffuseMapTransA_ST.zw);
  tmpvar_90 = _DiffuseMapTransA.sample(_mtlsmp__DiffuseMapTransA, (float2)(P_91));
  _DiffuseMapTransA_var_5 = float4(tmpvar_90);
  float4 tmpvar_92 = 0;
  tmpvar_92.xyz = (((
    (max (0.0, dot (tmpvar_23, lightDirection_16)) * tmpvar_29)
   + (float3)(ambient_33)) * (_DiffuseMapTransA_var_5.xyz * _mtl_u._Diffusecolor.xyz)) + ((
    pow (max (0.0, dot (tmpvar_28, tmpvar_23)), tmpvar_30)
   * tmpvar_89) + ((float3)(specular_53) * tmpvar_89)));
  tmpvar_92.w = (_DiffuseMapTransA_var_5.w * _mtl_u._Transparency);
  finalRGBA_4 = half4(tmpvar_92);
  tmpvar_2 = float4(finalRGBA_4);
  _mtl_o._glesFragData_0 = half4(tmpvar_2);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 122 math, 8 textures, 14 branches
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
SetTexture 0 [unity_SpecCube0] CUBE 0
SetTexture 1 [unity_SpecCube1] CUBE 1
SetTexture 2 [unity_ProbeVolumeSH] 3D 2
SetTexture 3 [_DiffuseMapTransA] 2D 3
SetTexture 4 [_NormalMap] 2D 4
SetTexture 5 [_SpecularMap] 2D 5
ConstBuffer "$Globals" 412
Matrix 192 [unity_ProbeVolumeWorldToObject]
Vector 0 [_WorldSpaceCameraPos] 3
VectorHalf 16 [_WorldSpaceLightPos0] 4
VectorHalf 24 [unity_SHAr] 4
VectorHalf 32 [unity_SHAg] 4
VectorHalf 40 [unity_SHAb] 4
Vector 48 [unity_SpecCube0_BoxMax]
Vector 64 [unity_SpecCube0_BoxMin]
Vector 80 [unity_SpecCube0_ProbePosition]
VectorHalf 96 [unity_SpecCube0_HDR] 4
Vector 112 [unity_SpecCube1_BoxMax]
Vector 128 [unity_SpecCube1_BoxMin]
Vector 144 [unity_SpecCube1_ProbePosition]
VectorHalf 160 [unity_SpecCube1_HDR] 4
Vector 176 [unity_ProbeVolumeParams]
Vector 256 [unity_ProbeVolumeSizeInv] 3
Vector 272 [unity_ProbeVolumeMin] 3
VectorHalf 288 [unity_ColorSpaceLuminance] 4
VectorHalf 296 [_LightColor0] 4
Vector 304 [_DiffuseMapTransA_ST]
Vector 320 [_Diffusecolor]
Vector 336 [_NormalMap_ST]
Float 352 [_NormalIntensity]
Vector 368 [_SpecularMap_ST]
Vector 384 [_Speccolor]
Float 400 [_SpecIntensity]
Float 404 [_Gloss]
Float 408 [_Transparency]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  bool gl_FrontFacing [[front_facing]];
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float4 xlv_TEXCOORD8;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  half4 _WorldSpaceLightPos0;
  half4 unity_SHAr;
  half4 unity_SHAg;
  half4 unity_SHAb;
  float4 unity_SpecCube0_BoxMax;
  float4 unity_SpecCube0_BoxMin;
  float4 unity_SpecCube0_ProbePosition;
  half4 unity_SpecCube0_HDR;
  float4 unity_SpecCube1_BoxMax;
  float4 unity_SpecCube1_BoxMin;
  float4 unity_SpecCube1_ProbePosition;
  half4 unity_SpecCube1_HDR;
  float4 unity_ProbeVolumeParams;
  float4x4 unity_ProbeVolumeWorldToObject;
  float3 unity_ProbeVolumeSizeInv;
  float3 unity_ProbeVolumeMin;
  half4 unity_ColorSpaceLuminance;
  half4 _LightColor0;
  float4 _DiffuseMapTransA_ST;
  float4 _Diffusecolor;
  float4 _NormalMap_ST;
  float _NormalIntensity;
  float4 _SpecularMap_ST;
  float4 _Speccolor;
  float _SpecIntensity;
  float _Gloss;
  float _Transparency;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texturecube<half> unity_SpecCube0 [[texture(0)]], sampler _mtlsmp_unity_SpecCube0 [[sampler(0)]]
  ,   texturecube<half> unity_SpecCube1 [[texture(1)]], sampler _mtlsmp_unity_SpecCube1 [[sampler(1)]]
  ,   texture3d<half> unity_ProbeVolumeSH [[texture(2)]], sampler _mtlsmp_unity_ProbeVolumeSH [[sampler(2)]]
  ,   texture2d<half> _DiffuseMapTransA [[texture(3)]], sampler _mtlsmp__DiffuseMapTransA [[sampler(3)]]
  ,   texture2d<half> _NormalMap [[texture(4)]], sampler _mtlsmp__NormalMap [[sampler(4)]]
  ,   texture2d<half> _SpecularMap [[texture(5)]], sampler _mtlsmp__SpecularMap [[sampler(5)]])
{
  xlatMtlShaderOutput _mtl_o;
  float tmpvar_1 = 0;
  if (_mtl_i.gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  float4 tmpvar_2 = 0;
  float3 tmpvar_3 = 0;
  tmpvar_3 = _mtl_i.xlv_TEXCOORD4;
  half4 finalRGBA_4 = 0;
  float4 _DiffuseMapTransA_var_5 = 0;
  float4 _SpecularMap_var_6 = 0;
  half tmpvar_7 = 0;
  half3 tmpvar_8 = 0;
  float3 tmpvar_9 = 0;
  half3 tmpvar_10 = 0;
  float4 tmpvar_11 = 0;
  float4 tmpvar_12 = 0;
  half3 tmpvar_13 = 0;
  half3 tmpvar_14 = 0;
  float3 lightColor_15 = 0;
  float3 lightDirection_16 = 0;
  float3 _NormalMap_var_17 = 0;
  int tmpvar_18 = 0;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_18 = 1;
  } else {
    tmpvar_18 = -1;
  };
  tmpvar_3 = (normalize(_mtl_i.xlv_TEXCOORD4) * float(tmpvar_18));
  float3x3 tmpvar_19;
  tmpvar_19[0].x = _mtl_i.xlv_TEXCOORD5.x;
  tmpvar_19[0].y = _mtl_i.xlv_TEXCOORD6.x;
  tmpvar_19[0].z = tmpvar_3.x;
  tmpvar_19[1].x = _mtl_i.xlv_TEXCOORD5.y;
  tmpvar_19[1].y = _mtl_i.xlv_TEXCOORD6.y;
  tmpvar_19[1].z = tmpvar_3.y;
  tmpvar_19[2].x = _mtl_i.xlv_TEXCOORD5.z;
  tmpvar_19[2].y = _mtl_i.xlv_TEXCOORD6.z;
  tmpvar_19[2].z = tmpvar_3.z;
  float3 tmpvar_20 = 0;
  tmpvar_20 = normalize((_mtl_u._WorldSpaceCameraPos - _mtl_i.xlv_TEXCOORD3.xyz));
  float2 P_21 = 0;
  P_21 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._NormalMap_ST.xy) + _mtl_u._NormalMap_ST.zw);
  half3 normal_22 = 0;
  normal_22.xy = ((_NormalMap.sample(_mtlsmp__NormalMap, (float2)(P_21)).wy * (half)(2.0)) - (half)(1.0));
  normal_22.z = sqrt(((half)(1.0) - clamp (
    dot (normal_22.xy, normal_22.xy)
  , (half)0.0, (half)1.0)));
  _NormalMap_var_17 = float3(normal_22);
  float3 tmpvar_23 = 0;
  tmpvar_23 = normalize((mix (float3(0.0, 0.0, 1.0), _NormalMap_var_17, float3(_mtl_u._NormalIntensity)) * tmpvar_19));
  float3 tmpvar_24 = 0;
  float3 I_25 = 0;
  I_25 = -(tmpvar_20);
  tmpvar_24 = (I_25 - (2.0 * (
    dot (tmpvar_23, I_25)
   * tmpvar_23)));
  half3 tmpvar_26 = 0;
  tmpvar_26 = normalize(_mtl_u._WorldSpaceLightPos0.xyz);
  lightDirection_16 = float3(tmpvar_26);
  half3 tmpvar_27 = 0;
  tmpvar_27 = _mtl_u._LightColor0.xyz;
  lightColor_15 = float3(tmpvar_27);
  float3 tmpvar_28 = 0;
  tmpvar_28 = normalize((tmpvar_20 + lightDirection_16));
  float3 tmpvar_29 = 0;
  tmpvar_29 = float3(_mtl_u._LightColor0.xyz);
  float tmpvar_30 = 0;
  tmpvar_30 = exp2(((_mtl_u._Gloss * 10.0) + 1.0));
  tmpvar_13 = half3(lightColor_15);
  tmpvar_14 = half3(lightDirection_16);
  tmpvar_9 = _mtl_i.xlv_TEXCOORD3.xyz;
  float3 tmpvar_31 = 0;
  tmpvar_31 = _mtl_i.xlv_TEXCOORD8.xyz;
  tmpvar_10 = half3(tmpvar_31);
  tmpvar_11 = float4(_mtl_u.unity_SpecCube0_HDR);
  tmpvar_12 = float4(_mtl_u.unity_SpecCube1_HDR);
  tmpvar_7 = half((1.0 - _mtl_u._Gloss));
  tmpvar_8 = half3(tmpvar_24);
  half3 normalWorld_32 = 0;
  normalWorld_32 = half3(tmpvar_23);
  half3 ambient_33 = 0;
  ambient_33 = tmpvar_10;
  half3 ambient_contrib_34 = 0;
  ambient_contrib_34 = half3(float3(0.0, 0.0, 0.0));
  if ((_mtl_u.unity_ProbeVolumeParams.x == 1.0)) {
    half4 tmpvar_35 = 0;
    tmpvar_35.w = half(1.0);
    tmpvar_35.xyz = normalWorld_32;
    half3 x1_36 = 0;
    half4 SHAb_37 = 0;
    half4 SHAg_38 = 0;
    half4 SHAr_39 = 0;
    float3 texCoord_40 = 0;
    float3 tmpvar_41 = 0;
    if ((_mtl_u.unity_ProbeVolumeParams.y == 1.0)) {
      float4 tmpvar_42 = 0;
      tmpvar_42.w = 1.0;
      tmpvar_42.xyz = tmpvar_9;
      tmpvar_41 = (_mtl_u.unity_ProbeVolumeWorldToObject * tmpvar_42).xyz;
    } else {
      tmpvar_41 = tmpvar_9;
    };
    float3 tmpvar_43 = 0;
    tmpvar_43 = ((tmpvar_41 - _mtl_u.unity_ProbeVolumeMin) * _mtl_u.unity_ProbeVolumeSizeInv);
    texCoord_40.yz = tmpvar_43.yz;
    texCoord_40.x = (tmpvar_43.x * 0.25);
    float tmpvar_44 = 0;
    float tmpvar_45 = 0;
    tmpvar_45 = (0.5 * _mtl_u.unity_ProbeVolumeParams.z);
    tmpvar_44 = clamp (texCoord_40.x, tmpvar_45, (0.25 - tmpvar_45));
    texCoord_40.x = tmpvar_44;
    half4 tmpvar_46 = 0;
    tmpvar_46 = unity_ProbeVolumeSH.sample(_mtlsmp_unity_ProbeVolumeSH, (float3)(texCoord_40));
    SHAr_39 = tmpvar_46;
    texCoord_40.x = (tmpvar_44 + 0.25);
    half4 tmpvar_47 = 0;
    tmpvar_47 = unity_ProbeVolumeSH.sample(_mtlsmp_unity_ProbeVolumeSH, (float3)(texCoord_40));
    SHAg_38 = tmpvar_47;
    texCoord_40.x = (tmpvar_44 + 0.5);
    half4 tmpvar_48 = 0;
    tmpvar_48 = unity_ProbeVolumeSH.sample(_mtlsmp_unity_ProbeVolumeSH, (float3)(texCoord_40));
    SHAb_37 = tmpvar_48;
    x1_36.x = dot (SHAr_39, tmpvar_35);
    x1_36.y = dot (SHAg_38, tmpvar_35);
    x1_36.z = dot (SHAb_37, tmpvar_35);
    ambient_contrib_34 = x1_36;
  } else {
    half4 tmpvar_49 = 0;
    tmpvar_49.w = half(1.0);
    tmpvar_49.xyz = normalWorld_32;
    half3 x_50 = 0;
    x_50.x = dot (_mtl_u.unity_SHAr, tmpvar_49);
    x_50.y = dot (_mtl_u.unity_SHAg, tmpvar_49);
    x_50.z = dot (_mtl_u.unity_SHAb, tmpvar_49);
    ambient_contrib_34 = x_50;
  };
  half3 tmpvar_51 = 0;
  tmpvar_51 = max ((half3)float3(0.0, 0.0, 0.0), (tmpvar_10 + ambient_contrib_34));
  ambient_33 = tmpvar_51;
  bool tmpvar_52 = false;
  tmpvar_52 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)(0.0));
  if (tmpvar_52) {
    ambient_33 = max ((((half)(1.055) * 
      pow (max (tmpvar_51, (half3)float3(0.0, 0.0, 0.0)), (half3)float3(0.4166667, 0.4166667, 0.4166667))
    ) - (half)(0.055)), (half3)float3(0.0, 0.0, 0.0));
  };
  half3 specular_53 = 0;
  half3 worldRefl_54 = 0;
  worldRefl_54 = tmpvar_8;
  float3 worldPos_55 = 0;
  worldPos_55 = tmpvar_9;
  if ((_mtl_u.unity_SpecCube0_ProbePosition.w > 0.0)) {
    half3 rbmin_56 = 0;
    half3 rbmax_57 = 0;
    half3 tmpvar_58 = 0;
    tmpvar_58 = normalize(tmpvar_8);
    float3 tmpvar_59 = 0;
    tmpvar_59 = ((_mtl_u.unity_SpecCube0_BoxMax.xyz - _mtl_i.xlv_TEXCOORD3.xyz) / (float3)(tmpvar_58));
    rbmax_57 = half3(tmpvar_59);
    float3 tmpvar_60 = 0;
    tmpvar_60 = ((_mtl_u.unity_SpecCube0_BoxMin.xyz - _mtl_i.xlv_TEXCOORD3.xyz) / (float3)(tmpvar_58));
    rbmin_56 = half3(tmpvar_60);
    bool3 tmpvar_61 = false;
    tmpvar_61 = (tmpvar_58 > (half3)(float3(0.0, 0.0, 0.0)));
    half tmpvar_62 = 0;
    if (tmpvar_61.x) {
      tmpvar_62 = rbmax_57.x;
    } else {
      tmpvar_62 = rbmin_56.x;
    };
    half tmpvar_63 = 0;
    if (tmpvar_61.y) {
      tmpvar_63 = rbmax_57.y;
    } else {
      tmpvar_63 = rbmin_56.y;
    };
    half tmpvar_64 = 0;
    if (tmpvar_61.z) {
      tmpvar_64 = rbmax_57.z;
    } else {
      tmpvar_64 = rbmin_56.z;
    };
    worldPos_55 = (_mtl_i.xlv_TEXCOORD3.xyz - _mtl_u.unity_SpecCube0_ProbePosition.xyz);
    worldRefl_54 = half3((worldPos_55 + (float3)((tmpvar_58 * min (
      min (tmpvar_62, tmpvar_63)
    , tmpvar_64)))));
  };
  half4 hdr_65 = 0;
  hdr_65 = half4(tmpvar_11);
  half4 tmpvar_66 = 0;
  tmpvar_66.xyz = worldRefl_54;
  tmpvar_66.w = ((tmpvar_7 * ((half)(1.7) - 
    ((half)(0.7) * tmpvar_7)
  )) * (half)(6.0));
  half4 tmpvar_67 = 0;
  tmpvar_67 = unity_SpecCube0.sample(_mtlsmp_unity_SpecCube0, (float3)(worldRefl_54), level(tmpvar_66.w));
  half4 tmpvar_68 = 0;
  tmpvar_68 = tmpvar_67;
  half3 tmpvar_69 = 0;
  tmpvar_69 = ((hdr_65.x * pow (tmpvar_68.w, hdr_65.y)) * tmpvar_68.xyz);
  if ((_mtl_u.unity_SpecCube0_BoxMin.w < 0.99999)) {
    half3 worldRefl_70 = 0;
    worldRefl_70 = tmpvar_8;
    float3 worldPos_71 = 0;
    worldPos_71 = tmpvar_9;
    if ((_mtl_u.unity_SpecCube1_ProbePosition.w > 0.0)) {
      half3 rbmin_72 = 0;
      half3 rbmax_73 = 0;
      half3 tmpvar_74 = 0;
      tmpvar_74 = normalize(tmpvar_8);
      float3 tmpvar_75 = 0;
      tmpvar_75 = ((_mtl_u.unity_SpecCube1_BoxMax.xyz - _mtl_i.xlv_TEXCOORD3.xyz) / (float3)(tmpvar_74));
      rbmax_73 = half3(tmpvar_75);
      float3 tmpvar_76 = 0;
      tmpvar_76 = ((_mtl_u.unity_SpecCube1_BoxMin.xyz - _mtl_i.xlv_TEXCOORD3.xyz) / (float3)(tmpvar_74));
      rbmin_72 = half3(tmpvar_76);
      bool3 tmpvar_77 = false;
      tmpvar_77 = (tmpvar_74 > (half3)(float3(0.0, 0.0, 0.0)));
      half tmpvar_78 = 0;
      if (tmpvar_77.x) {
        tmpvar_78 = rbmax_73.x;
      } else {
        tmpvar_78 = rbmin_72.x;
      };
      half tmpvar_79 = 0;
      if (tmpvar_77.y) {
        tmpvar_79 = rbmax_73.y;
      } else {
        tmpvar_79 = rbmin_72.y;
      };
      half tmpvar_80 = 0;
      if (tmpvar_77.z) {
        tmpvar_80 = rbmax_73.z;
      } else {
        tmpvar_80 = rbmin_72.z;
      };
      worldPos_71 = (_mtl_i.xlv_TEXCOORD3.xyz - _mtl_u.unity_SpecCube1_ProbePosition.xyz);
      worldRefl_70 = half3((worldPos_71 + (float3)((tmpvar_74 * min (
        min (tmpvar_78, tmpvar_79)
      , tmpvar_80)))));
    };
    half4 hdr_81 = 0;
    hdr_81 = half4(tmpvar_12);
    half4 tmpvar_82 = 0;
    tmpvar_82.xyz = worldRefl_70;
    tmpvar_82.w = ((tmpvar_7 * ((half)(1.7) - 
      ((half)(0.7) * tmpvar_7)
    )) * (half)(6.0));
    half4 tmpvar_83 = 0;
    tmpvar_83 = unity_SpecCube1.sample(_mtlsmp_unity_SpecCube1, (float3)(worldRefl_70), level(tmpvar_82.w));
    half4 tmpvar_84 = 0;
    tmpvar_84 = tmpvar_83;
    half3 tmpvar_85 = 0;
    tmpvar_85 = ((hdr_81.x * pow (tmpvar_84.w, hdr_81.y)) * tmpvar_84.xyz);
    float3 tmpvar_86 = 0;
    tmpvar_86 = mix ((float3)tmpvar_85, (float3)tmpvar_69, _mtl_u.unity_SpecCube0_BoxMin.www);
    specular_53 = half3(tmpvar_86);
  } else {
    specular_53 = tmpvar_69;
  };
  lightDirection_16 = float3(tmpvar_14);
  lightColor_15 = float3(tmpvar_13);
  half4 tmpvar_87 = 0;
  float2 P_88 = 0;
  P_88 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._SpecularMap_ST.xy) + _mtl_u._SpecularMap_ST.zw);
  tmpvar_87 = _SpecularMap.sample(_mtlsmp__SpecularMap, (float2)(P_88));
  _SpecularMap_var_6 = float4(tmpvar_87);
  float3 tmpvar_89 = 0;
  tmpvar_89 = ((_SpecularMap_var_6.xyz * _mtl_u._SpecIntensity) * _mtl_u._Speccolor.xyz);
  half4 tmpvar_90 = 0;
  float2 P_91 = 0;
  P_91 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._DiffuseMapTransA_ST.xy) + _mtl_u._DiffuseMapTransA_ST.zw);
  tmpvar_90 = _DiffuseMapTransA.sample(_mtlsmp__DiffuseMapTransA, (float2)(P_91));
  _DiffuseMapTransA_var_5 = float4(tmpvar_90);
  float4 tmpvar_92 = 0;
  tmpvar_92.xyz = (((
    (max (0.0, dot (tmpvar_23, lightDirection_16)) * tmpvar_29)
   + (float3)(ambient_33)) * (_DiffuseMapTransA_var_5.xyz * _mtl_u._Diffusecolor.xyz)) + ((
    pow (max (0.0, dot (tmpvar_28, tmpvar_23)), tmpvar_30)
   * tmpvar_89) + ((float3)(specular_53) * tmpvar_89)));
  tmpvar_92.w = (_DiffuseMapTransA_var_5.w * _mtl_u._Transparency);
  finalRGBA_4 = half4(tmpvar_92);
  tmpvar_2 = float4(finalRGBA_4);
  _mtl_o._glesFragData_0 = half4(tmpvar_2);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 122 math, 8 textures, 14 branches
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
SetTexture 0 [unity_SpecCube0] CUBE 0
SetTexture 1 [unity_SpecCube1] CUBE 1
SetTexture 2 [unity_ProbeVolumeSH] 3D 2
SetTexture 3 [_DiffuseMapTransA] 2D 3
SetTexture 4 [_NormalMap] 2D 4
SetTexture 5 [_SpecularMap] 2D 5
ConstBuffer "$Globals" 412
Matrix 192 [unity_ProbeVolumeWorldToObject]
Vector 0 [_WorldSpaceCameraPos] 3
VectorHalf 16 [_WorldSpaceLightPos0] 4
VectorHalf 24 [unity_SHAr] 4
VectorHalf 32 [unity_SHAg] 4
VectorHalf 40 [unity_SHAb] 4
Vector 48 [unity_SpecCube0_BoxMax]
Vector 64 [unity_SpecCube0_BoxMin]
Vector 80 [unity_SpecCube0_ProbePosition]
VectorHalf 96 [unity_SpecCube0_HDR] 4
Vector 112 [unity_SpecCube1_BoxMax]
Vector 128 [unity_SpecCube1_BoxMin]
Vector 144 [unity_SpecCube1_ProbePosition]
VectorHalf 160 [unity_SpecCube1_HDR] 4
Vector 176 [unity_ProbeVolumeParams]
Vector 256 [unity_ProbeVolumeSizeInv] 3
Vector 272 [unity_ProbeVolumeMin] 3
VectorHalf 288 [unity_ColorSpaceLuminance] 4
VectorHalf 296 [_LightColor0] 4
Vector 304 [_DiffuseMapTransA_ST]
Vector 320 [_Diffusecolor]
Vector 336 [_NormalMap_ST]
Float 352 [_NormalIntensity]
Vector 368 [_SpecularMap_ST]
Vector 384 [_Speccolor]
Float 400 [_SpecIntensity]
Float 404 [_Gloss]
Float 408 [_Transparency]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  bool gl_FrontFacing [[front_facing]];
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float4 xlv_TEXCOORD8;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  half4 _WorldSpaceLightPos0;
  half4 unity_SHAr;
  half4 unity_SHAg;
  half4 unity_SHAb;
  float4 unity_SpecCube0_BoxMax;
  float4 unity_SpecCube0_BoxMin;
  float4 unity_SpecCube0_ProbePosition;
  half4 unity_SpecCube0_HDR;
  float4 unity_SpecCube1_BoxMax;
  float4 unity_SpecCube1_BoxMin;
  float4 unity_SpecCube1_ProbePosition;
  half4 unity_SpecCube1_HDR;
  float4 unity_ProbeVolumeParams;
  float4x4 unity_ProbeVolumeWorldToObject;
  float3 unity_ProbeVolumeSizeInv;
  float3 unity_ProbeVolumeMin;
  half4 unity_ColorSpaceLuminance;
  half4 _LightColor0;
  float4 _DiffuseMapTransA_ST;
  float4 _Diffusecolor;
  float4 _NormalMap_ST;
  float _NormalIntensity;
  float4 _SpecularMap_ST;
  float4 _Speccolor;
  float _SpecIntensity;
  float _Gloss;
  float _Transparency;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texturecube<half> unity_SpecCube0 [[texture(0)]], sampler _mtlsmp_unity_SpecCube0 [[sampler(0)]]
  ,   texturecube<half> unity_SpecCube1 [[texture(1)]], sampler _mtlsmp_unity_SpecCube1 [[sampler(1)]]
  ,   texture3d<half> unity_ProbeVolumeSH [[texture(2)]], sampler _mtlsmp_unity_ProbeVolumeSH [[sampler(2)]]
  ,   texture2d<half> _DiffuseMapTransA [[texture(3)]], sampler _mtlsmp__DiffuseMapTransA [[sampler(3)]]
  ,   texture2d<half> _NormalMap [[texture(4)]], sampler _mtlsmp__NormalMap [[sampler(4)]]
  ,   texture2d<half> _SpecularMap [[texture(5)]], sampler _mtlsmp__SpecularMap [[sampler(5)]])
{
  xlatMtlShaderOutput _mtl_o;
  float tmpvar_1 = 0;
  if (_mtl_i.gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  float4 tmpvar_2 = 0;
  float3 tmpvar_3 = 0;
  tmpvar_3 = _mtl_i.xlv_TEXCOORD4;
  half4 finalRGBA_4 = 0;
  float4 _DiffuseMapTransA_var_5 = 0;
  float4 _SpecularMap_var_6 = 0;
  half tmpvar_7 = 0;
  half3 tmpvar_8 = 0;
  float3 tmpvar_9 = 0;
  half3 tmpvar_10 = 0;
  float4 tmpvar_11 = 0;
  float4 tmpvar_12 = 0;
  half3 tmpvar_13 = 0;
  half3 tmpvar_14 = 0;
  float3 lightColor_15 = 0;
  float3 lightDirection_16 = 0;
  float3 _NormalMap_var_17 = 0;
  int tmpvar_18 = 0;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_18 = 1;
  } else {
    tmpvar_18 = -1;
  };
  tmpvar_3 = (normalize(_mtl_i.xlv_TEXCOORD4) * float(tmpvar_18));
  float3x3 tmpvar_19;
  tmpvar_19[0].x = _mtl_i.xlv_TEXCOORD5.x;
  tmpvar_19[0].y = _mtl_i.xlv_TEXCOORD6.x;
  tmpvar_19[0].z = tmpvar_3.x;
  tmpvar_19[1].x = _mtl_i.xlv_TEXCOORD5.y;
  tmpvar_19[1].y = _mtl_i.xlv_TEXCOORD6.y;
  tmpvar_19[1].z = tmpvar_3.y;
  tmpvar_19[2].x = _mtl_i.xlv_TEXCOORD5.z;
  tmpvar_19[2].y = _mtl_i.xlv_TEXCOORD6.z;
  tmpvar_19[2].z = tmpvar_3.z;
  float3 tmpvar_20 = 0;
  tmpvar_20 = normalize((_mtl_u._WorldSpaceCameraPos - _mtl_i.xlv_TEXCOORD3.xyz));
  float2 P_21 = 0;
  P_21 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._NormalMap_ST.xy) + _mtl_u._NormalMap_ST.zw);
  half3 normal_22 = 0;
  normal_22.xy = ((_NormalMap.sample(_mtlsmp__NormalMap, (float2)(P_21)).wy * (half)(2.0)) - (half)(1.0));
  normal_22.z = sqrt(((half)(1.0) - clamp (
    dot (normal_22.xy, normal_22.xy)
  , (half)0.0, (half)1.0)));
  _NormalMap_var_17 = float3(normal_22);
  float3 tmpvar_23 = 0;
  tmpvar_23 = normalize((mix (float3(0.0, 0.0, 1.0), _NormalMap_var_17, float3(_mtl_u._NormalIntensity)) * tmpvar_19));
  float3 tmpvar_24 = 0;
  float3 I_25 = 0;
  I_25 = -(tmpvar_20);
  tmpvar_24 = (I_25 - (2.0 * (
    dot (tmpvar_23, I_25)
   * tmpvar_23)));
  half3 tmpvar_26 = 0;
  tmpvar_26 = normalize(_mtl_u._WorldSpaceLightPos0.xyz);
  lightDirection_16 = float3(tmpvar_26);
  half3 tmpvar_27 = 0;
  tmpvar_27 = _mtl_u._LightColor0.xyz;
  lightColor_15 = float3(tmpvar_27);
  float3 tmpvar_28 = 0;
  tmpvar_28 = normalize((tmpvar_20 + lightDirection_16));
  float3 tmpvar_29 = 0;
  tmpvar_29 = float3(_mtl_u._LightColor0.xyz);
  float tmpvar_30 = 0;
  tmpvar_30 = exp2(((_mtl_u._Gloss * 10.0) + 1.0));
  tmpvar_13 = half3(lightColor_15);
  tmpvar_14 = half3(lightDirection_16);
  tmpvar_9 = _mtl_i.xlv_TEXCOORD3.xyz;
  float3 tmpvar_31 = 0;
  tmpvar_31 = _mtl_i.xlv_TEXCOORD8.xyz;
  tmpvar_10 = half3(tmpvar_31);
  tmpvar_11 = float4(_mtl_u.unity_SpecCube0_HDR);
  tmpvar_12 = float4(_mtl_u.unity_SpecCube1_HDR);
  tmpvar_7 = half((1.0 - _mtl_u._Gloss));
  tmpvar_8 = half3(tmpvar_24);
  half3 normalWorld_32 = 0;
  normalWorld_32 = half3(tmpvar_23);
  half3 ambient_33 = 0;
  ambient_33 = tmpvar_10;
  half3 ambient_contrib_34 = 0;
  ambient_contrib_34 = half3(float3(0.0, 0.0, 0.0));
  if ((_mtl_u.unity_ProbeVolumeParams.x == 1.0)) {
    half4 tmpvar_35 = 0;
    tmpvar_35.w = half(1.0);
    tmpvar_35.xyz = normalWorld_32;
    half3 x1_36 = 0;
    half4 SHAb_37 = 0;
    half4 SHAg_38 = 0;
    half4 SHAr_39 = 0;
    float3 texCoord_40 = 0;
    float3 tmpvar_41 = 0;
    if ((_mtl_u.unity_ProbeVolumeParams.y == 1.0)) {
      float4 tmpvar_42 = 0;
      tmpvar_42.w = 1.0;
      tmpvar_42.xyz = tmpvar_9;
      tmpvar_41 = (_mtl_u.unity_ProbeVolumeWorldToObject * tmpvar_42).xyz;
    } else {
      tmpvar_41 = tmpvar_9;
    };
    float3 tmpvar_43 = 0;
    tmpvar_43 = ((tmpvar_41 - _mtl_u.unity_ProbeVolumeMin) * _mtl_u.unity_ProbeVolumeSizeInv);
    texCoord_40.yz = tmpvar_43.yz;
    texCoord_40.x = (tmpvar_43.x * 0.25);
    float tmpvar_44 = 0;
    float tmpvar_45 = 0;
    tmpvar_45 = (0.5 * _mtl_u.unity_ProbeVolumeParams.z);
    tmpvar_44 = clamp (texCoord_40.x, tmpvar_45, (0.25 - tmpvar_45));
    texCoord_40.x = tmpvar_44;
    half4 tmpvar_46 = 0;
    tmpvar_46 = unity_ProbeVolumeSH.sample(_mtlsmp_unity_ProbeVolumeSH, (float3)(texCoord_40));
    SHAr_39 = tmpvar_46;
    texCoord_40.x = (tmpvar_44 + 0.25);
    half4 tmpvar_47 = 0;
    tmpvar_47 = unity_ProbeVolumeSH.sample(_mtlsmp_unity_ProbeVolumeSH, (float3)(texCoord_40));
    SHAg_38 = tmpvar_47;
    texCoord_40.x = (tmpvar_44 + 0.5);
    half4 tmpvar_48 = 0;
    tmpvar_48 = unity_ProbeVolumeSH.sample(_mtlsmp_unity_ProbeVolumeSH, (float3)(texCoord_40));
    SHAb_37 = tmpvar_48;
    x1_36.x = dot (SHAr_39, tmpvar_35);
    x1_36.y = dot (SHAg_38, tmpvar_35);
    x1_36.z = dot (SHAb_37, tmpvar_35);
    ambient_contrib_34 = x1_36;
  } else {
    half4 tmpvar_49 = 0;
    tmpvar_49.w = half(1.0);
    tmpvar_49.xyz = normalWorld_32;
    half3 x_50 = 0;
    x_50.x = dot (_mtl_u.unity_SHAr, tmpvar_49);
    x_50.y = dot (_mtl_u.unity_SHAg, tmpvar_49);
    x_50.z = dot (_mtl_u.unity_SHAb, tmpvar_49);
    ambient_contrib_34 = x_50;
  };
  half3 tmpvar_51 = 0;
  tmpvar_51 = max ((half3)float3(0.0, 0.0, 0.0), (tmpvar_10 + ambient_contrib_34));
  ambient_33 = tmpvar_51;
  bool tmpvar_52 = false;
  tmpvar_52 = (_mtl_u.unity_ColorSpaceLuminance.w == (half)(0.0));
  if (tmpvar_52) {
    ambient_33 = max ((((half)(1.055) * 
      pow (max (tmpvar_51, (half3)float3(0.0, 0.0, 0.0)), (half3)float3(0.4166667, 0.4166667, 0.4166667))
    ) - (half)(0.055)), (half3)float3(0.0, 0.0, 0.0));
  };
  half3 specular_53 = 0;
  half3 worldRefl_54 = 0;
  worldRefl_54 = tmpvar_8;
  float3 worldPos_55 = 0;
  worldPos_55 = tmpvar_9;
  if ((_mtl_u.unity_SpecCube0_ProbePosition.w > 0.0)) {
    half3 rbmin_56 = 0;
    half3 rbmax_57 = 0;
    half3 tmpvar_58 = 0;
    tmpvar_58 = normalize(tmpvar_8);
    float3 tmpvar_59 = 0;
    tmpvar_59 = ((_mtl_u.unity_SpecCube0_BoxMax.xyz - _mtl_i.xlv_TEXCOORD3.xyz) / (float3)(tmpvar_58));
    rbmax_57 = half3(tmpvar_59);
    float3 tmpvar_60 = 0;
    tmpvar_60 = ((_mtl_u.unity_SpecCube0_BoxMin.xyz - _mtl_i.xlv_TEXCOORD3.xyz) / (float3)(tmpvar_58));
    rbmin_56 = half3(tmpvar_60);
    bool3 tmpvar_61 = false;
    tmpvar_61 = (tmpvar_58 > (half3)(float3(0.0, 0.0, 0.0)));
    half tmpvar_62 = 0;
    if (tmpvar_61.x) {
      tmpvar_62 = rbmax_57.x;
    } else {
      tmpvar_62 = rbmin_56.x;
    };
    half tmpvar_63 = 0;
    if (tmpvar_61.y) {
      tmpvar_63 = rbmax_57.y;
    } else {
      tmpvar_63 = rbmin_56.y;
    };
    half tmpvar_64 = 0;
    if (tmpvar_61.z) {
      tmpvar_64 = rbmax_57.z;
    } else {
      tmpvar_64 = rbmin_56.z;
    };
    worldPos_55 = (_mtl_i.xlv_TEXCOORD3.xyz - _mtl_u.unity_SpecCube0_ProbePosition.xyz);
    worldRefl_54 = half3((worldPos_55 + (float3)((tmpvar_58 * min (
      min (tmpvar_62, tmpvar_63)
    , tmpvar_64)))));
  };
  half4 hdr_65 = 0;
  hdr_65 = half4(tmpvar_11);
  half4 tmpvar_66 = 0;
  tmpvar_66.xyz = worldRefl_54;
  tmpvar_66.w = ((tmpvar_7 * ((half)(1.7) - 
    ((half)(0.7) * tmpvar_7)
  )) * (half)(6.0));
  half4 tmpvar_67 = 0;
  tmpvar_67 = unity_SpecCube0.sample(_mtlsmp_unity_SpecCube0, (float3)(worldRefl_54), level(tmpvar_66.w));
  half4 tmpvar_68 = 0;
  tmpvar_68 = tmpvar_67;
  half3 tmpvar_69 = 0;
  tmpvar_69 = ((hdr_65.x * pow (tmpvar_68.w, hdr_65.y)) * tmpvar_68.xyz);
  if ((_mtl_u.unity_SpecCube0_BoxMin.w < 0.99999)) {
    half3 worldRefl_70 = 0;
    worldRefl_70 = tmpvar_8;
    float3 worldPos_71 = 0;
    worldPos_71 = tmpvar_9;
    if ((_mtl_u.unity_SpecCube1_ProbePosition.w > 0.0)) {
      half3 rbmin_72 = 0;
      half3 rbmax_73 = 0;
      half3 tmpvar_74 = 0;
      tmpvar_74 = normalize(tmpvar_8);
      float3 tmpvar_75 = 0;
      tmpvar_75 = ((_mtl_u.unity_SpecCube1_BoxMax.xyz - _mtl_i.xlv_TEXCOORD3.xyz) / (float3)(tmpvar_74));
      rbmax_73 = half3(tmpvar_75);
      float3 tmpvar_76 = 0;
      tmpvar_76 = ((_mtl_u.unity_SpecCube1_BoxMin.xyz - _mtl_i.xlv_TEXCOORD3.xyz) / (float3)(tmpvar_74));
      rbmin_72 = half3(tmpvar_76);
      bool3 tmpvar_77 = false;
      tmpvar_77 = (tmpvar_74 > (half3)(float3(0.0, 0.0, 0.0)));
      half tmpvar_78 = 0;
      if (tmpvar_77.x) {
        tmpvar_78 = rbmax_73.x;
      } else {
        tmpvar_78 = rbmin_72.x;
      };
      half tmpvar_79 = 0;
      if (tmpvar_77.y) {
        tmpvar_79 = rbmax_73.y;
      } else {
        tmpvar_79 = rbmin_72.y;
      };
      half tmpvar_80 = 0;
      if (tmpvar_77.z) {
        tmpvar_80 = rbmax_73.z;
      } else {
        tmpvar_80 = rbmin_72.z;
      };
      worldPos_71 = (_mtl_i.xlv_TEXCOORD3.xyz - _mtl_u.unity_SpecCube1_ProbePosition.xyz);
      worldRefl_70 = half3((worldPos_71 + (float3)((tmpvar_74 * min (
        min (tmpvar_78, tmpvar_79)
      , tmpvar_80)))));
    };
    half4 hdr_81 = 0;
    hdr_81 = half4(tmpvar_12);
    half4 tmpvar_82 = 0;
    tmpvar_82.xyz = worldRefl_70;
    tmpvar_82.w = ((tmpvar_7 * ((half)(1.7) - 
      ((half)(0.7) * tmpvar_7)
    )) * (half)(6.0));
    half4 tmpvar_83 = 0;
    tmpvar_83 = unity_SpecCube1.sample(_mtlsmp_unity_SpecCube1, (float3)(worldRefl_70), level(tmpvar_82.w));
    half4 tmpvar_84 = 0;
    tmpvar_84 = tmpvar_83;
    half3 tmpvar_85 = 0;
    tmpvar_85 = ((hdr_81.x * pow (tmpvar_84.w, hdr_81.y)) * tmpvar_84.xyz);
    float3 tmpvar_86 = 0;
    tmpvar_86 = mix ((float3)tmpvar_85, (float3)tmpvar_69, _mtl_u.unity_SpecCube0_BoxMin.www);
    specular_53 = half3(tmpvar_86);
  } else {
    specular_53 = tmpvar_69;
  };
  lightDirection_16 = float3(tmpvar_14);
  lightColor_15 = float3(tmpvar_13);
  half4 tmpvar_87 = 0;
  float2 P_88 = 0;
  P_88 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._SpecularMap_ST.xy) + _mtl_u._SpecularMap_ST.zw);
  tmpvar_87 = _SpecularMap.sample(_mtlsmp__SpecularMap, (float2)(P_88));
  _SpecularMap_var_6 = float4(tmpvar_87);
  float3 tmpvar_89 = 0;
  tmpvar_89 = ((_SpecularMap_var_6.xyz * _mtl_u._SpecIntensity) * _mtl_u._Speccolor.xyz);
  half4 tmpvar_90 = 0;
  float2 P_91 = 0;
  P_91 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._DiffuseMapTransA_ST.xy) + _mtl_u._DiffuseMapTransA_ST.zw);
  tmpvar_90 = _DiffuseMapTransA.sample(_mtlsmp__DiffuseMapTransA, (float2)(P_91));
  _DiffuseMapTransA_var_5 = float4(tmpvar_90);
  float4 tmpvar_92 = 0;
  tmpvar_92.xyz = (((
    (max (0.0, dot (tmpvar_23, lightDirection_16)) * tmpvar_29)
   + (float3)(ambient_33)) * (_DiffuseMapTransA_var_5.xyz * _mtl_u._Diffusecolor.xyz)) + ((
    pow (max (0.0, dot (tmpvar_28, tmpvar_23)), tmpvar_30)
   * tmpvar_89) + ((float3)(specular_53) * tmpvar_89)));
  tmpvar_92.w = (_DiffuseMapTransA_var_5.w * _mtl_u._Transparency);
  finalRGBA_4 = half4(tmpvar_92);
  tmpvar_2 = float4(finalRGBA_4);
  _mtl_o._glesFragData_0 = half4(tmpvar_2);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on glcore"
}
}
 }


 // Stats for Vertex shader:
 //       metal : 16 avg math (16..17)
 //      opengl : 51 avg math (49..57), 4 avg texture (3..5), 2 branch
 // Stats for Fragment shader:
 //       metal : 51 avg math (49..57), 4 avg texture (3..5), 2 branch
 Pass {
  Name "FORWARD_DELTA"
  Tags { "LIGHTMODE"="ForwardAdd" "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  Cull Off
  Blend One One
  GpuProgramID 74907
Program "vp" {
SubProgram "opengl " {
// Stats: 51 math, 4 textures, 2 branches
Keywords { "POINT" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"#version 120

#ifdef VERTEX

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_WorldToLight;
attribute vec4 TANGENT;
varying vec2 xlv_TEXCOORD0;
varying vec2 xlv_TEXCOORD1;
varying vec2 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec3 xlv_TEXCOORD7;
void main ()
{
  vec4 v_1;
  v_1.x = unity_WorldToObject[0].x;
  v_1.y = unity_WorldToObject[1].x;
  v_1.z = unity_WorldToObject[2].x;
  v_1.w = unity_WorldToObject[3].x;
  vec4 v_2;
  v_2.x = unity_WorldToObject[0].y;
  v_2.y = unity_WorldToObject[1].y;
  v_2.z = unity_WorldToObject[2].y;
  v_2.w = unity_WorldToObject[3].y;
  vec4 v_3;
  v_3.x = unity_WorldToObject[0].z;
  v_3.y = unity_WorldToObject[1].z;
  v_3.z = unity_WorldToObject[2].z;
  v_3.w = unity_WorldToObject[3].z;
  vec3 tmpvar_4;
  tmpvar_4 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = TANGENT.xyz;
  vec3 tmpvar_6;
  tmpvar_6 = normalize((unity_ObjectToWorld * tmpvar_5).xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = gl_MultiTexCoord0.xy;
  xlv_TEXCOORD1 = gl_MultiTexCoord1.xy;
  xlv_TEXCOORD2 = gl_MultiTexCoord2.xy;
  vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * gl_Vertex);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * TANGENT.w));
  xlv_TEXCOORD7 = (unity_WorldToLight * tmpvar_7).xyz;
}


#endif
#ifdef FRAGMENT
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform sampler2D _LightTexture0;
uniform vec4 _LightColor0;
uniform sampler2D _DiffuseMapTransA;
uniform vec4 _DiffuseMapTransA_ST;
uniform vec4 _Diffusecolor;
uniform sampler2D _NormalMap;
uniform vec4 _NormalMap_ST;
uniform float _NormalIntensity;
uniform sampler2D _SpecularMap;
uniform vec4 _SpecularMap_ST;
uniform vec4 _Speccolor;
uniform float _SpecIntensity;
uniform float _Gloss;
uniform float _Transparency;
varying vec2 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec3 xlv_TEXCOORD7;
void main ()
{
  float tmpvar_1;
  if (gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD4;
  int tmpvar_3;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_3 = 1;
  } else {
    tmpvar_3 = -1;
  };
  tmpvar_2 = (normalize(xlv_TEXCOORD4) * float(tmpvar_3));
  mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD5.x;
  tmpvar_4[0].y = xlv_TEXCOORD6.x;
  tmpvar_4[0].z = tmpvar_2.x;
  tmpvar_4[1].x = xlv_TEXCOORD5.y;
  tmpvar_4[1].y = xlv_TEXCOORD6.y;
  tmpvar_4[1].z = tmpvar_2.y;
  tmpvar_4[2].x = xlv_TEXCOORD5.z;
  tmpvar_4[2].y = xlv_TEXCOORD6.z;
  tmpvar_4[2].z = tmpvar_2.z;
  vec3 normal_5;
  normal_5.xy = ((texture2D (_NormalMap, (
    (xlv_TEXCOORD0 * _NormalMap_ST.xy)
   + _NormalMap_ST.zw)).wy * 2.0) - 1.0);
  normal_5.z = sqrt((1.0 - clamp (
    dot (normal_5.xy, normal_5.xy)
  , 0.0, 1.0)));
  vec3 tmpvar_6;
  tmpvar_6 = normalize((mix (vec3(0.0, 0.0, 1.0), normal_5, vec3(_NormalIntensity)) * tmpvar_4));
  vec3 tmpvar_7;
  tmpvar_7 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3.xyz), _WorldSpaceLightPos0.www));
  vec3 tmpvar_8;
  tmpvar_8 = (texture2D (_LightTexture0, vec2(dot (xlv_TEXCOORD7, xlv_TEXCOORD7))).w * _LightColor0.xyz);
  vec4 tmpvar_9;
  tmpvar_9 = texture2D (_DiffuseMapTransA, ((xlv_TEXCOORD0 * _DiffuseMapTransA_ST.xy) + _DiffuseMapTransA_ST.zw));
  vec4 tmpvar_10;
  tmpvar_10.w = 0.0;
  tmpvar_10.xyz = (((
    (max (0.0, dot (tmpvar_6, tmpvar_7)) * tmpvar_8)
   * 
    (tmpvar_9.xyz * _Diffusecolor.xyz)
  ) + (
    (tmpvar_8 * pow (max (0.0, dot (
      normalize((normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3.xyz)) + tmpvar_7))
    , tmpvar_6)), exp2((
      (_Gloss * 10.0)
     + 1.0))))
   * 
    ((texture2D (_SpecularMap, ((xlv_TEXCOORD0 * _SpecularMap_ST.xy) + _SpecularMap_ST.zw)).xyz * _SpecIntensity) * _Speccolor.xyz)
  )) * (tmpvar_9.w * _Transparency));
  gl_FragData[0] = tmpvar_10;
}


#endif
"
}
SubProgram "metal " {
// Stats: 17 math
Keywords { "POINT" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
Bind "texcoord2" ATTR5
ConstBuffer "$Globals" 256
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [unity_ObjectToWorld]
Matrix 128 [unity_WorldToObject]
Matrix 192 [unity_WorldToLight]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
  float4 _glesMultiTexCoord2 [[attribute(5)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float3 xlv_TEXCOORD7;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4x4 unity_ObjectToWorld;
  float4x4 unity_WorldToObject;
  float4x4 unity_WorldToLight;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 v_1 = 0;
  v_1.x = _mtl_u.unity_WorldToObject[0].x;
  v_1.y = _mtl_u.unity_WorldToObject[1].x;
  v_1.z = _mtl_u.unity_WorldToObject[2].x;
  v_1.w = _mtl_u.unity_WorldToObject[3].x;
  float4 v_2 = 0;
  v_2.x = _mtl_u.unity_WorldToObject[0].y;
  v_2.y = _mtl_u.unity_WorldToObject[1].y;
  v_2.z = _mtl_u.unity_WorldToObject[2].y;
  v_2.w = _mtl_u.unity_WorldToObject[3].y;
  float4 v_3 = 0;
  v_3.x = _mtl_u.unity_WorldToObject[0].z;
  v_3.y = _mtl_u.unity_WorldToObject[1].z;
  v_3.z = _mtl_u.unity_WorldToObject[2].z;
  v_3.w = _mtl_u.unity_WorldToObject[3].z;
  float3 tmpvar_4 = 0;
  tmpvar_4 = normalize(((
    (v_1.xyz * _mtl_i._glesNormal.x)
   + 
    (v_2.xyz * _mtl_i._glesNormal.y)
  ) + (v_3.xyz * _mtl_i._glesNormal.z)));
  float4 tmpvar_5 = 0;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _mtl_i._glesTANGENT.xyz;
  float3 tmpvar_6 = 0;
  tmpvar_6 = normalize((_mtl_u.unity_ObjectToWorld * tmpvar_5).xyz);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = _mtl_i._glesMultiTexCoord0.xy;
  _mtl_o.xlv_TEXCOORD1 = _mtl_i._glesMultiTexCoord1.xy;
  _mtl_o.xlv_TEXCOORD2 = _mtl_i._glesMultiTexCoord2.xy;
  float4 tmpvar_7 = 0;
  tmpvar_7 = (_mtl_u.unity_ObjectToWorld * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD3 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD4 = tmpvar_4;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * _mtl_i._glesTANGENT.w));
  _mtl_o.xlv_TEXCOORD7 = (_mtl_u.unity_WorldToLight * tmpvar_7).xyz;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec2 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat1.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat1.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat1.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat2.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat2.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat2.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD5.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD6.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DiffuseMapTransA_ST;
uniform 	vec4 _Diffusecolor;
uniform 	vec4 _NormalMap_ST;
uniform 	float _NormalIntensity;
uniform 	vec4 _SpecularMap_ST;
uniform 	vec4 _Speccolor;
uniform 	float _SpecIntensity;
uniform 	float _Gloss;
uniform 	float _Transparency;
uniform  sampler2D _NormalMap;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _SpecularMap;
uniform  sampler2D _DiffuseMapTransA;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
in  vec3 vs_TEXCOORD7;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
float u_xlat3;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_0 = texture(_NormalMap, u_xlat0.xy);
    u_xlat16_0.xz = u_xlat10_0.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat10_0.wy + u_xlat10_0.wy;
    u_xlat16_0.x = dot(u_xlat16_0.xz, u_xlat16_0.xz);
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat1.z = sqrt(u_xlat16_0.x);
    u_xlat0.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = vec3(_NormalIntensity) * u_xlat0.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD6.xyz;
    u_xlat0.xyw = u_xlat0.xxx * vs_TEXCOORD5.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat10 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0u)) ? 1.0 : -1.0;
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat1.xyz + u_xlat0.xyw;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlat0.w = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.xw = max(u_xlat0.xw, vec2(0.0, 0.0));
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat3 = _Gloss * 10.0 + 1.0;
    u_xlat3 = exp2(u_xlat3);
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat3 = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
    u_xlat10_1 = texture(_LightTexture0, vec2(u_xlat3));
    u_xlat1.xyz = u_xlat10_1.www * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.www * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
    u_xlat10_2 = texture(_SpecularMap, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_SpecIntensity);
    u_xlat2.xyz = u_xlat2.xyz * _Speccolor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _DiffuseMapTransA_ST.xy + _DiffuseMapTransA_ST.zw;
    u_xlat10_2 = texture(_DiffuseMapTransA, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * _Diffusecolor.xyz;
    u_xlat9 = u_xlat10_2.w * _Transparency;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    SV_Target0.w = 0.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 49 math, 3 textures, 2 branches
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"#version 120

#ifdef VERTEX

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
attribute vec4 TANGENT;
varying vec2 xlv_TEXCOORD0;
varying vec2 xlv_TEXCOORD1;
varying vec2 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec4 v_1;
  v_1.x = unity_WorldToObject[0].x;
  v_1.y = unity_WorldToObject[1].x;
  v_1.z = unity_WorldToObject[2].x;
  v_1.w = unity_WorldToObject[3].x;
  vec4 v_2;
  v_2.x = unity_WorldToObject[0].y;
  v_2.y = unity_WorldToObject[1].y;
  v_2.z = unity_WorldToObject[2].y;
  v_2.w = unity_WorldToObject[3].y;
  vec4 v_3;
  v_3.x = unity_WorldToObject[0].z;
  v_3.y = unity_WorldToObject[1].z;
  v_3.z = unity_WorldToObject[2].z;
  v_3.w = unity_WorldToObject[3].z;
  vec3 tmpvar_4;
  tmpvar_4 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = TANGENT.xyz;
  vec3 tmpvar_6;
  tmpvar_6 = normalize((unity_ObjectToWorld * tmpvar_5).xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = gl_MultiTexCoord0.xy;
  xlv_TEXCOORD1 = gl_MultiTexCoord1.xy;
  xlv_TEXCOORD2 = gl_MultiTexCoord2.xy;
  xlv_TEXCOORD3 = (unity_ObjectToWorld * gl_Vertex);
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * TANGENT.w));
}


#endif
#ifdef FRAGMENT
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 _LightColor0;
uniform sampler2D _DiffuseMapTransA;
uniform vec4 _DiffuseMapTransA_ST;
uniform vec4 _Diffusecolor;
uniform sampler2D _NormalMap;
uniform vec4 _NormalMap_ST;
uniform float _NormalIntensity;
uniform sampler2D _SpecularMap;
uniform vec4 _SpecularMap_ST;
uniform vec4 _Speccolor;
uniform float _SpecIntensity;
uniform float _Gloss;
uniform float _Transparency;
varying vec2 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  float tmpvar_1;
  if (gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD4;
  int tmpvar_3;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_3 = 1;
  } else {
    tmpvar_3 = -1;
  };
  tmpvar_2 = (normalize(xlv_TEXCOORD4) * float(tmpvar_3));
  mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD5.x;
  tmpvar_4[0].y = xlv_TEXCOORD6.x;
  tmpvar_4[0].z = tmpvar_2.x;
  tmpvar_4[1].x = xlv_TEXCOORD5.y;
  tmpvar_4[1].y = xlv_TEXCOORD6.y;
  tmpvar_4[1].z = tmpvar_2.y;
  tmpvar_4[2].x = xlv_TEXCOORD5.z;
  tmpvar_4[2].y = xlv_TEXCOORD6.z;
  tmpvar_4[2].z = tmpvar_2.z;
  vec3 normal_5;
  normal_5.xy = ((texture2D (_NormalMap, (
    (xlv_TEXCOORD0 * _NormalMap_ST.xy)
   + _NormalMap_ST.zw)).wy * 2.0) - 1.0);
  normal_5.z = sqrt((1.0 - clamp (
    dot (normal_5.xy, normal_5.xy)
  , 0.0, 1.0)));
  vec3 tmpvar_6;
  tmpvar_6 = normalize((mix (vec3(0.0, 0.0, 1.0), normal_5, vec3(_NormalIntensity)) * tmpvar_4));
  vec3 tmpvar_7;
  tmpvar_7 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3.xyz), _WorldSpaceLightPos0.www));
  vec4 tmpvar_8;
  tmpvar_8 = texture2D (_DiffuseMapTransA, ((xlv_TEXCOORD0 * _DiffuseMapTransA_ST.xy) + _DiffuseMapTransA_ST.zw));
  vec4 tmpvar_9;
  tmpvar_9.w = 0.0;
  tmpvar_9.xyz = (((
    (max (0.0, dot (tmpvar_6, tmpvar_7)) * _LightColor0.xyz)
   * 
    (tmpvar_8.xyz * _Diffusecolor.xyz)
  ) + (
    (_LightColor0.xyz * pow (max (0.0, dot (
      normalize((normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3.xyz)) + tmpvar_7))
    , tmpvar_6)), exp2((
      (_Gloss * 10.0)
     + 1.0))))
   * 
    ((texture2D (_SpecularMap, ((xlv_TEXCOORD0 * _SpecularMap_ST.xy) + _SpecularMap_ST.zw)).xyz * _SpecIntensity) * _Speccolor.xyz)
  )) * (tmpvar_8.w * _Transparency));
  gl_FragData[0] = tmpvar_9;
}


#endif
"
}
SubProgram "metal " {
// Stats: 16 math
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
Bind "texcoord2" ATTR5
ConstBuffer "$Globals" 192
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [unity_ObjectToWorld]
Matrix 128 [unity_WorldToObject]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
  float4 _glesMultiTexCoord2 [[attribute(5)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4x4 unity_ObjectToWorld;
  float4x4 unity_WorldToObject;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 v_1 = 0;
  v_1.x = _mtl_u.unity_WorldToObject[0].x;
  v_1.y = _mtl_u.unity_WorldToObject[1].x;
  v_1.z = _mtl_u.unity_WorldToObject[2].x;
  v_1.w = _mtl_u.unity_WorldToObject[3].x;
  float4 v_2 = 0;
  v_2.x = _mtl_u.unity_WorldToObject[0].y;
  v_2.y = _mtl_u.unity_WorldToObject[1].y;
  v_2.z = _mtl_u.unity_WorldToObject[2].y;
  v_2.w = _mtl_u.unity_WorldToObject[3].y;
  float4 v_3 = 0;
  v_3.x = _mtl_u.unity_WorldToObject[0].z;
  v_3.y = _mtl_u.unity_WorldToObject[1].z;
  v_3.z = _mtl_u.unity_WorldToObject[2].z;
  v_3.w = _mtl_u.unity_WorldToObject[3].z;
  float3 tmpvar_4 = 0;
  tmpvar_4 = normalize(((
    (v_1.xyz * _mtl_i._glesNormal.x)
   + 
    (v_2.xyz * _mtl_i._glesNormal.y)
  ) + (v_3.xyz * _mtl_i._glesNormal.z)));
  float4 tmpvar_5 = 0;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _mtl_i._glesTANGENT.xyz;
  float3 tmpvar_6 = 0;
  tmpvar_6 = normalize((_mtl_u.unity_ObjectToWorld * tmpvar_5).xyz);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = _mtl_i._glesMultiTexCoord0.xy;
  _mtl_o.xlv_TEXCOORD1 = _mtl_i._glesMultiTexCoord1.xy;
  _mtl_o.xlv_TEXCOORD2 = _mtl_i._glesMultiTexCoord2.xy;
  _mtl_o.xlv_TEXCOORD3 = (_mtl_u.unity_ObjectToWorld * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD4 = tmpvar_4;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * _mtl_i._glesTANGENT.w));
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec2 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD3 = hlslcc_mtx4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD6.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DiffuseMapTransA_ST;
uniform 	vec4 _Diffusecolor;
uniform 	vec4 _NormalMap_ST;
uniform 	float _NormalIntensity;
uniform 	vec4 _SpecularMap_ST;
uniform 	vec4 _Speccolor;
uniform 	float _SpecIntensity;
uniform 	float _Gloss;
uniform 	float _Transparency;
uniform  sampler2D _NormalMap;
uniform  sampler2D _SpecularMap;
uniform  sampler2D _DiffuseMapTransA;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
float u_xlat3;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_0 = texture(_NormalMap, u_xlat0.xy);
    u_xlat16_0.xz = u_xlat10_0.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat10_0.wy + u_xlat10_0.wy;
    u_xlat16_0.x = dot(u_xlat16_0.xz, u_xlat16_0.xz);
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat1.z = sqrt(u_xlat16_0.x);
    u_xlat0.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = vec3(_NormalIntensity) * u_xlat0.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD6.xyz;
    u_xlat0.xyw = u_xlat0.xxx * vs_TEXCOORD5.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat10 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0u)) ? 1.0 : -1.0;
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat1.xyz + u_xlat0.xyw;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 0.0);
    u_xlat1.xyz = vec3(u_xlat9) * _LightColor0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat3 = _Gloss * 10.0 + 1.0;
    u_xlat3 = exp2(u_xlat3);
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
    u_xlat10_2 = texture(_SpecularMap, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_SpecIntensity);
    u_xlat2.xyz = u_xlat2.xyz * _Speccolor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _DiffuseMapTransA_ST.xy + _DiffuseMapTransA_ST.zw;
    u_xlat10_2 = texture(_DiffuseMapTransA, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * _Diffusecolor.xyz;
    u_xlat9 = u_xlat10_2.w * _Transparency;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    SV_Target0.w = 0.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 57 math, 5 textures, 2 branches
Keywords { "SPOT" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"#version 120

#ifdef VERTEX

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_WorldToLight;
attribute vec4 TANGENT;
varying vec2 xlv_TEXCOORD0;
varying vec2 xlv_TEXCOORD1;
varying vec2 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec4 xlv_TEXCOORD7;
void main ()
{
  vec4 v_1;
  v_1.x = unity_WorldToObject[0].x;
  v_1.y = unity_WorldToObject[1].x;
  v_1.z = unity_WorldToObject[2].x;
  v_1.w = unity_WorldToObject[3].x;
  vec4 v_2;
  v_2.x = unity_WorldToObject[0].y;
  v_2.y = unity_WorldToObject[1].y;
  v_2.z = unity_WorldToObject[2].y;
  v_2.w = unity_WorldToObject[3].y;
  vec4 v_3;
  v_3.x = unity_WorldToObject[0].z;
  v_3.y = unity_WorldToObject[1].z;
  v_3.z = unity_WorldToObject[2].z;
  v_3.w = unity_WorldToObject[3].z;
  vec3 tmpvar_4;
  tmpvar_4 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = TANGENT.xyz;
  vec3 tmpvar_6;
  tmpvar_6 = normalize((unity_ObjectToWorld * tmpvar_5).xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = gl_MultiTexCoord0.xy;
  xlv_TEXCOORD1 = gl_MultiTexCoord1.xy;
  xlv_TEXCOORD2 = gl_MultiTexCoord2.xy;
  vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * gl_Vertex);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * TANGENT.w));
  xlv_TEXCOORD7 = (unity_WorldToLight * tmpvar_7);
}


#endif
#ifdef FRAGMENT
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform vec4 _LightColor0;
uniform sampler2D _DiffuseMapTransA;
uniform vec4 _DiffuseMapTransA_ST;
uniform vec4 _Diffusecolor;
uniform sampler2D _NormalMap;
uniform vec4 _NormalMap_ST;
uniform float _NormalIntensity;
uniform sampler2D _SpecularMap;
uniform vec4 _SpecularMap_ST;
uniform vec4 _Speccolor;
uniform float _SpecIntensity;
uniform float _Gloss;
uniform float _Transparency;
varying vec2 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec4 xlv_TEXCOORD7;
void main ()
{
  float tmpvar_1;
  if (gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD4;
  int tmpvar_3;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_3 = 1;
  } else {
    tmpvar_3 = -1;
  };
  tmpvar_2 = (normalize(xlv_TEXCOORD4) * float(tmpvar_3));
  mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD5.x;
  tmpvar_4[0].y = xlv_TEXCOORD6.x;
  tmpvar_4[0].z = tmpvar_2.x;
  tmpvar_4[1].x = xlv_TEXCOORD5.y;
  tmpvar_4[1].y = xlv_TEXCOORD6.y;
  tmpvar_4[1].z = tmpvar_2.y;
  tmpvar_4[2].x = xlv_TEXCOORD5.z;
  tmpvar_4[2].y = xlv_TEXCOORD6.z;
  tmpvar_4[2].z = tmpvar_2.z;
  vec3 normal_5;
  normal_5.xy = ((texture2D (_NormalMap, (
    (xlv_TEXCOORD0 * _NormalMap_ST.xy)
   + _NormalMap_ST.zw)).wy * 2.0) - 1.0);
  normal_5.z = sqrt((1.0 - clamp (
    dot (normal_5.xy, normal_5.xy)
  , 0.0, 1.0)));
  vec3 tmpvar_6;
  tmpvar_6 = normalize((mix (vec3(0.0, 0.0, 1.0), normal_5, vec3(_NormalIntensity)) * tmpvar_4));
  vec3 tmpvar_7;
  tmpvar_7 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3.xyz), _WorldSpaceLightPos0.www));
  vec3 tmpvar_8;
  tmpvar_8 = (((
    float((xlv_TEXCOORD7.z > 0.0))
   * texture2D (_LightTexture0, 
    ((xlv_TEXCOORD7.xy / xlv_TEXCOORD7.w) + 0.5)
  ).w) * texture2D (_LightTextureB0, vec2(dot (xlv_TEXCOORD7.xyz, xlv_TEXCOORD7.xyz))).w) * _LightColor0.xyz);
  vec4 tmpvar_9;
  tmpvar_9 = texture2D (_DiffuseMapTransA, ((xlv_TEXCOORD0 * _DiffuseMapTransA_ST.xy) + _DiffuseMapTransA_ST.zw));
  vec4 tmpvar_10;
  tmpvar_10.w = 0.0;
  tmpvar_10.xyz = (((
    (max (0.0, dot (tmpvar_6, tmpvar_7)) * tmpvar_8)
   * 
    (tmpvar_9.xyz * _Diffusecolor.xyz)
  ) + (
    (tmpvar_8 * pow (max (0.0, dot (
      normalize((normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3.xyz)) + tmpvar_7))
    , tmpvar_6)), exp2((
      (_Gloss * 10.0)
     + 1.0))))
   * 
    ((texture2D (_SpecularMap, ((xlv_TEXCOORD0 * _SpecularMap_ST.xy) + _SpecularMap_ST.zw)).xyz * _SpecIntensity) * _Speccolor.xyz)
  )) * (tmpvar_9.w * _Transparency));
  gl_FragData[0] = tmpvar_10;
}


#endif
"
}
SubProgram "metal " {
// Stats: 17 math
Keywords { "SPOT" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
Bind "texcoord2" ATTR5
ConstBuffer "$Globals" 256
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [unity_ObjectToWorld]
Matrix 128 [unity_WorldToObject]
Matrix 192 [unity_WorldToLight]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
  float4 _glesMultiTexCoord2 [[attribute(5)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float4 xlv_TEXCOORD7;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4x4 unity_ObjectToWorld;
  float4x4 unity_WorldToObject;
  float4x4 unity_WorldToLight;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 v_1 = 0;
  v_1.x = _mtl_u.unity_WorldToObject[0].x;
  v_1.y = _mtl_u.unity_WorldToObject[1].x;
  v_1.z = _mtl_u.unity_WorldToObject[2].x;
  v_1.w = _mtl_u.unity_WorldToObject[3].x;
  float4 v_2 = 0;
  v_2.x = _mtl_u.unity_WorldToObject[0].y;
  v_2.y = _mtl_u.unity_WorldToObject[1].y;
  v_2.z = _mtl_u.unity_WorldToObject[2].y;
  v_2.w = _mtl_u.unity_WorldToObject[3].y;
  float4 v_3 = 0;
  v_3.x = _mtl_u.unity_WorldToObject[0].z;
  v_3.y = _mtl_u.unity_WorldToObject[1].z;
  v_3.z = _mtl_u.unity_WorldToObject[2].z;
  v_3.w = _mtl_u.unity_WorldToObject[3].z;
  float3 tmpvar_4 = 0;
  tmpvar_4 = normalize(((
    (v_1.xyz * _mtl_i._glesNormal.x)
   + 
    (v_2.xyz * _mtl_i._glesNormal.y)
  ) + (v_3.xyz * _mtl_i._glesNormal.z)));
  float4 tmpvar_5 = 0;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _mtl_i._glesTANGENT.xyz;
  float3 tmpvar_6 = 0;
  tmpvar_6 = normalize((_mtl_u.unity_ObjectToWorld * tmpvar_5).xyz);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = _mtl_i._glesMultiTexCoord0.xy;
  _mtl_o.xlv_TEXCOORD1 = _mtl_i._glesMultiTexCoord1.xy;
  _mtl_o.xlv_TEXCOORD2 = _mtl_i._glesMultiTexCoord2.xy;
  float4 tmpvar_7 = 0;
  tmpvar_7 = (_mtl_u.unity_ObjectToWorld * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD3 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD4 = tmpvar_4;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * _mtl_i._glesTANGENT.w));
  _mtl_o.xlv_TEXCOORD7 = (_mtl_u.unity_WorldToLight * tmpvar_7);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "SPOT" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec2 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat1.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat1.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat1.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat2.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat2.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat2.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD5.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD6.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD7 = hlslcc_mtx4unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DiffuseMapTransA_ST;
uniform 	vec4 _Diffusecolor;
uniform 	vec4 _NormalMap_ST;
uniform 	float _NormalIntensity;
uniform 	vec4 _SpecularMap_ST;
uniform 	vec4 _Speccolor;
uniform 	float _SpecIntensity;
uniform 	float _Gloss;
uniform 	float _Transparency;
uniform  sampler2D _NormalMap;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler2D _SpecularMap;
uniform  sampler2D _DiffuseMapTransA;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
in  vec4 vs_TEXCOORD7;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec2 u_xlat3;
bool u_xlatb3;
float u_xlat6;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_0 = texture(_NormalMap, u_xlat0.xy);
    u_xlat16_0.xz = u_xlat10_0.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat10_0.wy + u_xlat10_0.wy;
    u_xlat16_0.x = dot(u_xlat16_0.xz, u_xlat16_0.xz);
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat1.z = sqrt(u_xlat16_0.x);
    u_xlat0.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = vec3(_NormalIntensity) * u_xlat0.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD6.xyz;
    u_xlat0.xyw = u_xlat0.xxx * vs_TEXCOORD5.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat10 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0u)) ? 1.0 : -1.0;
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat1.xyz + u_xlat0.xyw;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlat0.w = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.xw = max(u_xlat0.xw, vec2(0.0, 0.0));
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat3.x = _Gloss * 10.0 + 1.0;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat3.xy = vs_TEXCOORD7.xy / vs_TEXCOORD7.ww;
    u_xlat3.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat10_1 = texture(_LightTexture0, u_xlat3.xy);
    u_xlatb3 = 0.0<vs_TEXCOORD7.z;
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat3.x = u_xlat10_1.w * u_xlat3.x;
    u_xlat6 = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
    u_xlat10_1 = texture(_LightTextureB0, vec2(u_xlat6));
    u_xlat3.x = u_xlat3.x * u_xlat10_1.w;
    u_xlat1.xyz = u_xlat3.xxx * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.www * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
    u_xlat10_2 = texture(_SpecularMap, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_SpecIntensity);
    u_xlat2.xyz = u_xlat2.xyz * _Speccolor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _DiffuseMapTransA_ST.xy + _DiffuseMapTransA_ST.zw;
    u_xlat10_2 = texture(_DiffuseMapTransA, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * _Diffusecolor.xyz;
    u_xlat9 = u_xlat10_2.w * _Transparency;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    SV_Target0.w = 0.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 52 math, 5 textures, 2 branches
Keywords { "POINT_COOKIE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"#version 120

#ifdef VERTEX

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_WorldToLight;
attribute vec4 TANGENT;
varying vec2 xlv_TEXCOORD0;
varying vec2 xlv_TEXCOORD1;
varying vec2 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec3 xlv_TEXCOORD7;
void main ()
{
  vec4 v_1;
  v_1.x = unity_WorldToObject[0].x;
  v_1.y = unity_WorldToObject[1].x;
  v_1.z = unity_WorldToObject[2].x;
  v_1.w = unity_WorldToObject[3].x;
  vec4 v_2;
  v_2.x = unity_WorldToObject[0].y;
  v_2.y = unity_WorldToObject[1].y;
  v_2.z = unity_WorldToObject[2].y;
  v_2.w = unity_WorldToObject[3].y;
  vec4 v_3;
  v_3.x = unity_WorldToObject[0].z;
  v_3.y = unity_WorldToObject[1].z;
  v_3.z = unity_WorldToObject[2].z;
  v_3.w = unity_WorldToObject[3].z;
  vec3 tmpvar_4;
  tmpvar_4 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = TANGENT.xyz;
  vec3 tmpvar_6;
  tmpvar_6 = normalize((unity_ObjectToWorld * tmpvar_5).xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = gl_MultiTexCoord0.xy;
  xlv_TEXCOORD1 = gl_MultiTexCoord1.xy;
  xlv_TEXCOORD2 = gl_MultiTexCoord2.xy;
  vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * gl_Vertex);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * TANGENT.w));
  xlv_TEXCOORD7 = (unity_WorldToLight * tmpvar_7).xyz;
}


#endif
#ifdef FRAGMENT
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform vec4 _LightColor0;
uniform sampler2D _DiffuseMapTransA;
uniform vec4 _DiffuseMapTransA_ST;
uniform vec4 _Diffusecolor;
uniform sampler2D _NormalMap;
uniform vec4 _NormalMap_ST;
uniform float _NormalIntensity;
uniform sampler2D _SpecularMap;
uniform vec4 _SpecularMap_ST;
uniform vec4 _Speccolor;
uniform float _SpecIntensity;
uniform float _Gloss;
uniform float _Transparency;
varying vec2 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec3 xlv_TEXCOORD7;
void main ()
{
  float tmpvar_1;
  if (gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD4;
  int tmpvar_3;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_3 = 1;
  } else {
    tmpvar_3 = -1;
  };
  tmpvar_2 = (normalize(xlv_TEXCOORD4) * float(tmpvar_3));
  mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD5.x;
  tmpvar_4[0].y = xlv_TEXCOORD6.x;
  tmpvar_4[0].z = tmpvar_2.x;
  tmpvar_4[1].x = xlv_TEXCOORD5.y;
  tmpvar_4[1].y = xlv_TEXCOORD6.y;
  tmpvar_4[1].z = tmpvar_2.y;
  tmpvar_4[2].x = xlv_TEXCOORD5.z;
  tmpvar_4[2].y = xlv_TEXCOORD6.z;
  tmpvar_4[2].z = tmpvar_2.z;
  vec3 normal_5;
  normal_5.xy = ((texture2D (_NormalMap, (
    (xlv_TEXCOORD0 * _NormalMap_ST.xy)
   + _NormalMap_ST.zw)).wy * 2.0) - 1.0);
  normal_5.z = sqrt((1.0 - clamp (
    dot (normal_5.xy, normal_5.xy)
  , 0.0, 1.0)));
  vec3 tmpvar_6;
  tmpvar_6 = normalize((mix (vec3(0.0, 0.0, 1.0), normal_5, vec3(_NormalIntensity)) * tmpvar_4));
  vec3 tmpvar_7;
  tmpvar_7 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3.xyz), _WorldSpaceLightPos0.www));
  vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_LightTextureB0, vec2(dot (xlv_TEXCOORD7, xlv_TEXCOORD7))).w * textureCube (_LightTexture0, xlv_TEXCOORD7).w) * _LightColor0.xyz);
  vec4 tmpvar_9;
  tmpvar_9 = texture2D (_DiffuseMapTransA, ((xlv_TEXCOORD0 * _DiffuseMapTransA_ST.xy) + _DiffuseMapTransA_ST.zw));
  vec4 tmpvar_10;
  tmpvar_10.w = 0.0;
  tmpvar_10.xyz = (((
    (max (0.0, dot (tmpvar_6, tmpvar_7)) * tmpvar_8)
   * 
    (tmpvar_9.xyz * _Diffusecolor.xyz)
  ) + (
    (tmpvar_8 * pow (max (0.0, dot (
      normalize((normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3.xyz)) + tmpvar_7))
    , tmpvar_6)), exp2((
      (_Gloss * 10.0)
     + 1.0))))
   * 
    ((texture2D (_SpecularMap, ((xlv_TEXCOORD0 * _SpecularMap_ST.xy) + _SpecularMap_ST.zw)).xyz * _SpecIntensity) * _Speccolor.xyz)
  )) * (tmpvar_9.w * _Transparency));
  gl_FragData[0] = tmpvar_10;
}


#endif
"
}
SubProgram "metal " {
// Stats: 17 math
Keywords { "POINT_COOKIE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
Bind "texcoord2" ATTR5
ConstBuffer "$Globals" 256
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [unity_ObjectToWorld]
Matrix 128 [unity_WorldToObject]
Matrix 192 [unity_WorldToLight]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
  float4 _glesMultiTexCoord2 [[attribute(5)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float3 xlv_TEXCOORD7;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4x4 unity_ObjectToWorld;
  float4x4 unity_WorldToObject;
  float4x4 unity_WorldToLight;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 v_1 = 0;
  v_1.x = _mtl_u.unity_WorldToObject[0].x;
  v_1.y = _mtl_u.unity_WorldToObject[1].x;
  v_1.z = _mtl_u.unity_WorldToObject[2].x;
  v_1.w = _mtl_u.unity_WorldToObject[3].x;
  float4 v_2 = 0;
  v_2.x = _mtl_u.unity_WorldToObject[0].y;
  v_2.y = _mtl_u.unity_WorldToObject[1].y;
  v_2.z = _mtl_u.unity_WorldToObject[2].y;
  v_2.w = _mtl_u.unity_WorldToObject[3].y;
  float4 v_3 = 0;
  v_3.x = _mtl_u.unity_WorldToObject[0].z;
  v_3.y = _mtl_u.unity_WorldToObject[1].z;
  v_3.z = _mtl_u.unity_WorldToObject[2].z;
  v_3.w = _mtl_u.unity_WorldToObject[3].z;
  float3 tmpvar_4 = 0;
  tmpvar_4 = normalize(((
    (v_1.xyz * _mtl_i._glesNormal.x)
   + 
    (v_2.xyz * _mtl_i._glesNormal.y)
  ) + (v_3.xyz * _mtl_i._glesNormal.z)));
  float4 tmpvar_5 = 0;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _mtl_i._glesTANGENT.xyz;
  float3 tmpvar_6 = 0;
  tmpvar_6 = normalize((_mtl_u.unity_ObjectToWorld * tmpvar_5).xyz);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = _mtl_i._glesMultiTexCoord0.xy;
  _mtl_o.xlv_TEXCOORD1 = _mtl_i._glesMultiTexCoord1.xy;
  _mtl_o.xlv_TEXCOORD2 = _mtl_i._glesMultiTexCoord2.xy;
  float4 tmpvar_7 = 0;
  tmpvar_7 = (_mtl_u.unity_ObjectToWorld * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD3 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD4 = tmpvar_4;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * _mtl_i._glesTANGENT.w));
  _mtl_o.xlv_TEXCOORD7 = (_mtl_u.unity_WorldToLight * tmpvar_7).xyz;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec2 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat1.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat1.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat1.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat2.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat2.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat2.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD5.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD6.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DiffuseMapTransA_ST;
uniform 	vec4 _Diffusecolor;
uniform 	vec4 _NormalMap_ST;
uniform 	float _NormalIntensity;
uniform 	vec4 _SpecularMap_ST;
uniform 	vec4 _Speccolor;
uniform 	float _SpecIntensity;
uniform 	float _Gloss;
uniform 	float _Transparency;
uniform  sampler2D _NormalMap;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  sampler2D _SpecularMap;
uniform  sampler2D _DiffuseMapTransA;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
in  vec3 vs_TEXCOORD7;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
float u_xlat3;
mediump float u_xlat16_3;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_0 = texture(_NormalMap, u_xlat0.xy);
    u_xlat16_0.xz = u_xlat10_0.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat10_0.wy + u_xlat10_0.wy;
    u_xlat16_0.x = dot(u_xlat16_0.xz, u_xlat16_0.xz);
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat1.z = sqrt(u_xlat16_0.x);
    u_xlat0.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = vec3(_NormalIntensity) * u_xlat0.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD6.xyz;
    u_xlat0.xyw = u_xlat0.xxx * vs_TEXCOORD5.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat10 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0u)) ? 1.0 : -1.0;
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat1.xyz + u_xlat0.xyw;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlat0.w = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.xw = max(u_xlat0.xw, vec2(0.0, 0.0));
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat3 = _Gloss * 10.0 + 1.0;
    u_xlat3 = exp2(u_xlat3);
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat3 = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
    u_xlat10_1 = texture(_LightTextureB0, vec2(u_xlat3));
    u_xlat10_2 = texture(_LightTexture0, vs_TEXCOORD7.xyz);
    u_xlat16_3 = u_xlat10_1.w * u_xlat10_2.w;
    u_xlat1.xyz = vec3(u_xlat16_3) * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.www * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
    u_xlat10_2 = texture(_SpecularMap, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_SpecIntensity);
    u_xlat2.xyz = u_xlat2.xyz * _Speccolor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _DiffuseMapTransA_ST.xy + _DiffuseMapTransA_ST.zw;
    u_xlat10_2 = texture(_DiffuseMapTransA, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * _Diffusecolor.xyz;
    u_xlat9 = u_xlat10_2.w * _Transparency;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    SV_Target0.w = 0.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 50 math, 4 textures, 2 branches
Keywords { "DIRECTIONAL_COOKIE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"#version 120

#ifdef VERTEX

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_WorldToLight;
attribute vec4 TANGENT;
varying vec2 xlv_TEXCOORD0;
varying vec2 xlv_TEXCOORD1;
varying vec2 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec2 xlv_TEXCOORD7;
void main ()
{
  vec4 v_1;
  v_1.x = unity_WorldToObject[0].x;
  v_1.y = unity_WorldToObject[1].x;
  v_1.z = unity_WorldToObject[2].x;
  v_1.w = unity_WorldToObject[3].x;
  vec4 v_2;
  v_2.x = unity_WorldToObject[0].y;
  v_2.y = unity_WorldToObject[1].y;
  v_2.z = unity_WorldToObject[2].y;
  v_2.w = unity_WorldToObject[3].y;
  vec4 v_3;
  v_3.x = unity_WorldToObject[0].z;
  v_3.y = unity_WorldToObject[1].z;
  v_3.z = unity_WorldToObject[2].z;
  v_3.w = unity_WorldToObject[3].z;
  vec3 tmpvar_4;
  tmpvar_4 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = TANGENT.xyz;
  vec3 tmpvar_6;
  tmpvar_6 = normalize((unity_ObjectToWorld * tmpvar_5).xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = gl_MultiTexCoord0.xy;
  xlv_TEXCOORD1 = gl_MultiTexCoord1.xy;
  xlv_TEXCOORD2 = gl_MultiTexCoord2.xy;
  vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * gl_Vertex);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * TANGENT.w));
  xlv_TEXCOORD7 = (unity_WorldToLight * tmpvar_7).xy;
}


#endif
#ifdef FRAGMENT
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform sampler2D _LightTexture0;
uniform vec4 _LightColor0;
uniform sampler2D _DiffuseMapTransA;
uniform vec4 _DiffuseMapTransA_ST;
uniform vec4 _Diffusecolor;
uniform sampler2D _NormalMap;
uniform vec4 _NormalMap_ST;
uniform float _NormalIntensity;
uniform sampler2D _SpecularMap;
uniform vec4 _SpecularMap_ST;
uniform vec4 _Speccolor;
uniform float _SpecIntensity;
uniform float _Gloss;
uniform float _Transparency;
varying vec2 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec2 xlv_TEXCOORD7;
void main ()
{
  float tmpvar_1;
  if (gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD4;
  int tmpvar_3;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_3 = 1;
  } else {
    tmpvar_3 = -1;
  };
  tmpvar_2 = (normalize(xlv_TEXCOORD4) * float(tmpvar_3));
  mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD5.x;
  tmpvar_4[0].y = xlv_TEXCOORD6.x;
  tmpvar_4[0].z = tmpvar_2.x;
  tmpvar_4[1].x = xlv_TEXCOORD5.y;
  tmpvar_4[1].y = xlv_TEXCOORD6.y;
  tmpvar_4[1].z = tmpvar_2.y;
  tmpvar_4[2].x = xlv_TEXCOORD5.z;
  tmpvar_4[2].y = xlv_TEXCOORD6.z;
  tmpvar_4[2].z = tmpvar_2.z;
  vec3 normal_5;
  normal_5.xy = ((texture2D (_NormalMap, (
    (xlv_TEXCOORD0 * _NormalMap_ST.xy)
   + _NormalMap_ST.zw)).wy * 2.0) - 1.0);
  normal_5.z = sqrt((1.0 - clamp (
    dot (normal_5.xy, normal_5.xy)
  , 0.0, 1.0)));
  vec3 tmpvar_6;
  tmpvar_6 = normalize((mix (vec3(0.0, 0.0, 1.0), normal_5, vec3(_NormalIntensity)) * tmpvar_4));
  vec3 tmpvar_7;
  tmpvar_7 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3.xyz), _WorldSpaceLightPos0.www));
  vec3 tmpvar_8;
  tmpvar_8 = (texture2D (_LightTexture0, xlv_TEXCOORD7).w * _LightColor0.xyz);
  vec4 tmpvar_9;
  tmpvar_9 = texture2D (_DiffuseMapTransA, ((xlv_TEXCOORD0 * _DiffuseMapTransA_ST.xy) + _DiffuseMapTransA_ST.zw));
  vec4 tmpvar_10;
  tmpvar_10.w = 0.0;
  tmpvar_10.xyz = (((
    (max (0.0, dot (tmpvar_6, tmpvar_7)) * tmpvar_8)
   * 
    (tmpvar_9.xyz * _Diffusecolor.xyz)
  ) + (
    (tmpvar_8 * pow (max (0.0, dot (
      normalize((normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3.xyz)) + tmpvar_7))
    , tmpvar_6)), exp2((
      (_Gloss * 10.0)
     + 1.0))))
   * 
    ((texture2D (_SpecularMap, ((xlv_TEXCOORD0 * _SpecularMap_ST.xy) + _SpecularMap_ST.zw)).xyz * _SpecIntensity) * _Speccolor.xyz)
  )) * (tmpvar_9.w * _Transparency));
  gl_FragData[0] = tmpvar_10;
}


#endif
"
}
SubProgram "metal " {
// Stats: 17 math
Keywords { "DIRECTIONAL_COOKIE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
Bind "texcoord2" ATTR5
ConstBuffer "$Globals" 256
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [unity_ObjectToWorld]
Matrix 128 [unity_WorldToObject]
Matrix 192 [unity_WorldToLight]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
  float4 _glesMultiTexCoord2 [[attribute(5)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float2 xlv_TEXCOORD7;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4x4 unity_ObjectToWorld;
  float4x4 unity_WorldToObject;
  float4x4 unity_WorldToLight;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 v_1 = 0;
  v_1.x = _mtl_u.unity_WorldToObject[0].x;
  v_1.y = _mtl_u.unity_WorldToObject[1].x;
  v_1.z = _mtl_u.unity_WorldToObject[2].x;
  v_1.w = _mtl_u.unity_WorldToObject[3].x;
  float4 v_2 = 0;
  v_2.x = _mtl_u.unity_WorldToObject[0].y;
  v_2.y = _mtl_u.unity_WorldToObject[1].y;
  v_2.z = _mtl_u.unity_WorldToObject[2].y;
  v_2.w = _mtl_u.unity_WorldToObject[3].y;
  float4 v_3 = 0;
  v_3.x = _mtl_u.unity_WorldToObject[0].z;
  v_3.y = _mtl_u.unity_WorldToObject[1].z;
  v_3.z = _mtl_u.unity_WorldToObject[2].z;
  v_3.w = _mtl_u.unity_WorldToObject[3].z;
  float3 tmpvar_4 = 0;
  tmpvar_4 = normalize(((
    (v_1.xyz * _mtl_i._glesNormal.x)
   + 
    (v_2.xyz * _mtl_i._glesNormal.y)
  ) + (v_3.xyz * _mtl_i._glesNormal.z)));
  float4 tmpvar_5 = 0;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _mtl_i._glesTANGENT.xyz;
  float3 tmpvar_6 = 0;
  tmpvar_6 = normalize((_mtl_u.unity_ObjectToWorld * tmpvar_5).xyz);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = _mtl_i._glesMultiTexCoord0.xy;
  _mtl_o.xlv_TEXCOORD1 = _mtl_i._glesMultiTexCoord1.xy;
  _mtl_o.xlv_TEXCOORD2 = _mtl_i._glesMultiTexCoord2.xy;
  float4 tmpvar_7 = 0;
  tmpvar_7 = (_mtl_u.unity_ObjectToWorld * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD3 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD4 = tmpvar_4;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * _mtl_i._glesTANGENT.w));
  _mtl_o.xlv_TEXCOORD7 = (_mtl_u.unity_WorldToLight * tmpvar_7).xy;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec2 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out vec2 vs_TEXCOORD7;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4unity_WorldToLight[1].xy;
    u_xlat1.xy = hlslcc_mtx4unity_WorldToLight[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4unity_WorldToLight[2].xy * u_xlat0.zz + u_xlat1.xy;
    vs_TEXCOORD7.xy = hlslcc_mtx4unity_WorldToLight[3].xy * u_xlat0.ww + u_xlat1.xy;
    vs_TEXCOORD3 = u_xlat0;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD6.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DiffuseMapTransA_ST;
uniform 	vec4 _Diffusecolor;
uniform 	vec4 _NormalMap_ST;
uniform 	float _NormalIntensity;
uniform 	vec4 _SpecularMap_ST;
uniform 	vec4 _Speccolor;
uniform 	float _SpecIntensity;
uniform 	float _Gloss;
uniform 	float _Transparency;
uniform  sampler2D _NormalMap;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _SpecularMap;
uniform  sampler2D _DiffuseMapTransA;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD7;
in  vec4 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
float u_xlat3;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_0 = texture(_NormalMap, u_xlat0.xy);
    u_xlat16_0.xz = u_xlat10_0.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat10_0.wy + u_xlat10_0.wy;
    u_xlat16_0.x = dot(u_xlat16_0.xz, u_xlat16_0.xz);
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat1.z = sqrt(u_xlat16_0.x);
    u_xlat0.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = vec3(_NormalIntensity) * u_xlat0.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD6.xyz;
    u_xlat0.xyw = u_xlat0.xxx * vs_TEXCOORD5.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat10 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0u)) ? 1.0 : -1.0;
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat1.xyz + u_xlat0.xyw;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlat0.w = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.xw = max(u_xlat0.xw, vec2(0.0, 0.0));
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat3 = _Gloss * 10.0 + 1.0;
    u_xlat3 = exp2(u_xlat3);
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat10_1 = texture(_LightTexture0, vs_TEXCOORD7.xy);
    u_xlat1.xyz = u_xlat10_1.www * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.www * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
    u_xlat10_2 = texture(_SpecularMap, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_SpecIntensity);
    u_xlat2.xyz = u_xlat2.xyz * _Speccolor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _DiffuseMapTransA_ST.xy + _DiffuseMapTransA_ST.zw;
    u_xlat10_2 = texture(_DiffuseMapTransA, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * _Diffusecolor.xyz;
    u_xlat9 = u_xlat10_2.w * _Transparency;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    SV_Target0.w = 0.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 51 math, 4 textures, 2 branches
Keywords { "POINT" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"#version 120

#ifdef VERTEX

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_WorldToLight;
attribute vec4 TANGENT;
varying vec2 xlv_TEXCOORD0;
varying vec2 xlv_TEXCOORD1;
varying vec2 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec3 xlv_TEXCOORD7;
void main ()
{
  vec4 v_1;
  v_1.x = unity_WorldToObject[0].x;
  v_1.y = unity_WorldToObject[1].x;
  v_1.z = unity_WorldToObject[2].x;
  v_1.w = unity_WorldToObject[3].x;
  vec4 v_2;
  v_2.x = unity_WorldToObject[0].y;
  v_2.y = unity_WorldToObject[1].y;
  v_2.z = unity_WorldToObject[2].y;
  v_2.w = unity_WorldToObject[3].y;
  vec4 v_3;
  v_3.x = unity_WorldToObject[0].z;
  v_3.y = unity_WorldToObject[1].z;
  v_3.z = unity_WorldToObject[2].z;
  v_3.w = unity_WorldToObject[3].z;
  vec3 tmpvar_4;
  tmpvar_4 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = TANGENT.xyz;
  vec3 tmpvar_6;
  tmpvar_6 = normalize((unity_ObjectToWorld * tmpvar_5).xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = gl_MultiTexCoord0.xy;
  xlv_TEXCOORD1 = gl_MultiTexCoord1.xy;
  xlv_TEXCOORD2 = gl_MultiTexCoord2.xy;
  vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * gl_Vertex);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * TANGENT.w));
  xlv_TEXCOORD7 = (unity_WorldToLight * tmpvar_7).xyz;
}


#endif
#ifdef FRAGMENT
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform sampler2D _LightTexture0;
uniform vec4 _LightColor0;
uniform sampler2D _DiffuseMapTransA;
uniform vec4 _DiffuseMapTransA_ST;
uniform vec4 _Diffusecolor;
uniform sampler2D _NormalMap;
uniform vec4 _NormalMap_ST;
uniform float _NormalIntensity;
uniform sampler2D _SpecularMap;
uniform vec4 _SpecularMap_ST;
uniform vec4 _Speccolor;
uniform float _SpecIntensity;
uniform float _Gloss;
uniform float _Transparency;
varying vec2 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec3 xlv_TEXCOORD7;
void main ()
{
  float tmpvar_1;
  if (gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD4;
  int tmpvar_3;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_3 = 1;
  } else {
    tmpvar_3 = -1;
  };
  tmpvar_2 = (normalize(xlv_TEXCOORD4) * float(tmpvar_3));
  mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD5.x;
  tmpvar_4[0].y = xlv_TEXCOORD6.x;
  tmpvar_4[0].z = tmpvar_2.x;
  tmpvar_4[1].x = xlv_TEXCOORD5.y;
  tmpvar_4[1].y = xlv_TEXCOORD6.y;
  tmpvar_4[1].z = tmpvar_2.y;
  tmpvar_4[2].x = xlv_TEXCOORD5.z;
  tmpvar_4[2].y = xlv_TEXCOORD6.z;
  tmpvar_4[2].z = tmpvar_2.z;
  vec3 normal_5;
  normal_5.xy = ((texture2D (_NormalMap, (
    (xlv_TEXCOORD0 * _NormalMap_ST.xy)
   + _NormalMap_ST.zw)).wy * 2.0) - 1.0);
  normal_5.z = sqrt((1.0 - clamp (
    dot (normal_5.xy, normal_5.xy)
  , 0.0, 1.0)));
  vec3 tmpvar_6;
  tmpvar_6 = normalize((mix (vec3(0.0, 0.0, 1.0), normal_5, vec3(_NormalIntensity)) * tmpvar_4));
  vec3 tmpvar_7;
  tmpvar_7 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3.xyz), _WorldSpaceLightPos0.www));
  vec3 tmpvar_8;
  tmpvar_8 = (texture2D (_LightTexture0, vec2(dot (xlv_TEXCOORD7, xlv_TEXCOORD7))).w * _LightColor0.xyz);
  vec4 tmpvar_9;
  tmpvar_9 = texture2D (_DiffuseMapTransA, ((xlv_TEXCOORD0 * _DiffuseMapTransA_ST.xy) + _DiffuseMapTransA_ST.zw));
  vec4 tmpvar_10;
  tmpvar_10.w = 0.0;
  tmpvar_10.xyz = (((
    (max (0.0, dot (tmpvar_6, tmpvar_7)) * tmpvar_8)
   * 
    (tmpvar_9.xyz * _Diffusecolor.xyz)
  ) + (
    (tmpvar_8 * pow (max (0.0, dot (
      normalize((normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3.xyz)) + tmpvar_7))
    , tmpvar_6)), exp2((
      (_Gloss * 10.0)
     + 1.0))))
   * 
    ((texture2D (_SpecularMap, ((xlv_TEXCOORD0 * _SpecularMap_ST.xy) + _SpecularMap_ST.zw)).xyz * _SpecIntensity) * _Speccolor.xyz)
  )) * (tmpvar_9.w * _Transparency));
  gl_FragData[0] = tmpvar_10;
}


#endif
"
}
SubProgram "metal " {
// Stats: 17 math
Keywords { "POINT" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
Bind "texcoord2" ATTR5
ConstBuffer "$Globals" 256
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [unity_ObjectToWorld]
Matrix 128 [unity_WorldToObject]
Matrix 192 [unity_WorldToLight]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
  float4 _glesMultiTexCoord2 [[attribute(5)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float3 xlv_TEXCOORD7;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4x4 unity_ObjectToWorld;
  float4x4 unity_WorldToObject;
  float4x4 unity_WorldToLight;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 v_1 = 0;
  v_1.x = _mtl_u.unity_WorldToObject[0].x;
  v_1.y = _mtl_u.unity_WorldToObject[1].x;
  v_1.z = _mtl_u.unity_WorldToObject[2].x;
  v_1.w = _mtl_u.unity_WorldToObject[3].x;
  float4 v_2 = 0;
  v_2.x = _mtl_u.unity_WorldToObject[0].y;
  v_2.y = _mtl_u.unity_WorldToObject[1].y;
  v_2.z = _mtl_u.unity_WorldToObject[2].y;
  v_2.w = _mtl_u.unity_WorldToObject[3].y;
  float4 v_3 = 0;
  v_3.x = _mtl_u.unity_WorldToObject[0].z;
  v_3.y = _mtl_u.unity_WorldToObject[1].z;
  v_3.z = _mtl_u.unity_WorldToObject[2].z;
  v_3.w = _mtl_u.unity_WorldToObject[3].z;
  float3 tmpvar_4 = 0;
  tmpvar_4 = normalize(((
    (v_1.xyz * _mtl_i._glesNormal.x)
   + 
    (v_2.xyz * _mtl_i._glesNormal.y)
  ) + (v_3.xyz * _mtl_i._glesNormal.z)));
  float4 tmpvar_5 = 0;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _mtl_i._glesTANGENT.xyz;
  float3 tmpvar_6 = 0;
  tmpvar_6 = normalize((_mtl_u.unity_ObjectToWorld * tmpvar_5).xyz);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = _mtl_i._glesMultiTexCoord0.xy;
  _mtl_o.xlv_TEXCOORD1 = _mtl_i._glesMultiTexCoord1.xy;
  _mtl_o.xlv_TEXCOORD2 = _mtl_i._glesMultiTexCoord2.xy;
  float4 tmpvar_7 = 0;
  tmpvar_7 = (_mtl_u.unity_ObjectToWorld * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD3 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD4 = tmpvar_4;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * _mtl_i._glesTANGENT.w));
  _mtl_o.xlv_TEXCOORD7 = (_mtl_u.unity_WorldToLight * tmpvar_7).xyz;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec2 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat1.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat1.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat1.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat2.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat2.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat2.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD5.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD6.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DiffuseMapTransA_ST;
uniform 	vec4 _Diffusecolor;
uniform 	vec4 _NormalMap_ST;
uniform 	float _NormalIntensity;
uniform 	vec4 _SpecularMap_ST;
uniform 	vec4 _Speccolor;
uniform 	float _SpecIntensity;
uniform 	float _Gloss;
uniform 	float _Transparency;
uniform  sampler2D _NormalMap;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _SpecularMap;
uniform  sampler2D _DiffuseMapTransA;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
in  vec3 vs_TEXCOORD7;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
float u_xlat3;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_0 = texture(_NormalMap, u_xlat0.xy);
    u_xlat16_0.xz = u_xlat10_0.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat10_0.wy + u_xlat10_0.wy;
    u_xlat16_0.x = dot(u_xlat16_0.xz, u_xlat16_0.xz);
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat1.z = sqrt(u_xlat16_0.x);
    u_xlat0.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = vec3(_NormalIntensity) * u_xlat0.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD6.xyz;
    u_xlat0.xyw = u_xlat0.xxx * vs_TEXCOORD5.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat10 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0u)) ? 1.0 : -1.0;
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat1.xyz + u_xlat0.xyw;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlat0.w = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.xw = max(u_xlat0.xw, vec2(0.0, 0.0));
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat3 = _Gloss * 10.0 + 1.0;
    u_xlat3 = exp2(u_xlat3);
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat3 = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
    u_xlat10_1 = texture(_LightTexture0, vec2(u_xlat3));
    u_xlat1.xyz = u_xlat10_1.www * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.www * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
    u_xlat10_2 = texture(_SpecularMap, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_SpecIntensity);
    u_xlat2.xyz = u_xlat2.xyz * _Speccolor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _DiffuseMapTransA_ST.xy + _DiffuseMapTransA_ST.zw;
    u_xlat10_2 = texture(_DiffuseMapTransA, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * _Diffusecolor.xyz;
    u_xlat9 = u_xlat10_2.w * _Transparency;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    SV_Target0.w = 0.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 49 math, 3 textures, 2 branches
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"#version 120

#ifdef VERTEX

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
attribute vec4 TANGENT;
varying vec2 xlv_TEXCOORD0;
varying vec2 xlv_TEXCOORD1;
varying vec2 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec4 v_1;
  v_1.x = unity_WorldToObject[0].x;
  v_1.y = unity_WorldToObject[1].x;
  v_1.z = unity_WorldToObject[2].x;
  v_1.w = unity_WorldToObject[3].x;
  vec4 v_2;
  v_2.x = unity_WorldToObject[0].y;
  v_2.y = unity_WorldToObject[1].y;
  v_2.z = unity_WorldToObject[2].y;
  v_2.w = unity_WorldToObject[3].y;
  vec4 v_3;
  v_3.x = unity_WorldToObject[0].z;
  v_3.y = unity_WorldToObject[1].z;
  v_3.z = unity_WorldToObject[2].z;
  v_3.w = unity_WorldToObject[3].z;
  vec3 tmpvar_4;
  tmpvar_4 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = TANGENT.xyz;
  vec3 tmpvar_6;
  tmpvar_6 = normalize((unity_ObjectToWorld * tmpvar_5).xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = gl_MultiTexCoord0.xy;
  xlv_TEXCOORD1 = gl_MultiTexCoord1.xy;
  xlv_TEXCOORD2 = gl_MultiTexCoord2.xy;
  xlv_TEXCOORD3 = (unity_ObjectToWorld * gl_Vertex);
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * TANGENT.w));
}


#endif
#ifdef FRAGMENT
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 _LightColor0;
uniform sampler2D _DiffuseMapTransA;
uniform vec4 _DiffuseMapTransA_ST;
uniform vec4 _Diffusecolor;
uniform sampler2D _NormalMap;
uniform vec4 _NormalMap_ST;
uniform float _NormalIntensity;
uniform sampler2D _SpecularMap;
uniform vec4 _SpecularMap_ST;
uniform vec4 _Speccolor;
uniform float _SpecIntensity;
uniform float _Gloss;
uniform float _Transparency;
varying vec2 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  float tmpvar_1;
  if (gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD4;
  int tmpvar_3;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_3 = 1;
  } else {
    tmpvar_3 = -1;
  };
  tmpvar_2 = (normalize(xlv_TEXCOORD4) * float(tmpvar_3));
  mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD5.x;
  tmpvar_4[0].y = xlv_TEXCOORD6.x;
  tmpvar_4[0].z = tmpvar_2.x;
  tmpvar_4[1].x = xlv_TEXCOORD5.y;
  tmpvar_4[1].y = xlv_TEXCOORD6.y;
  tmpvar_4[1].z = tmpvar_2.y;
  tmpvar_4[2].x = xlv_TEXCOORD5.z;
  tmpvar_4[2].y = xlv_TEXCOORD6.z;
  tmpvar_4[2].z = tmpvar_2.z;
  vec3 normal_5;
  normal_5.xy = ((texture2D (_NormalMap, (
    (xlv_TEXCOORD0 * _NormalMap_ST.xy)
   + _NormalMap_ST.zw)).wy * 2.0) - 1.0);
  normal_5.z = sqrt((1.0 - clamp (
    dot (normal_5.xy, normal_5.xy)
  , 0.0, 1.0)));
  vec3 tmpvar_6;
  tmpvar_6 = normalize((mix (vec3(0.0, 0.0, 1.0), normal_5, vec3(_NormalIntensity)) * tmpvar_4));
  vec3 tmpvar_7;
  tmpvar_7 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3.xyz), _WorldSpaceLightPos0.www));
  vec4 tmpvar_8;
  tmpvar_8 = texture2D (_DiffuseMapTransA, ((xlv_TEXCOORD0 * _DiffuseMapTransA_ST.xy) + _DiffuseMapTransA_ST.zw));
  vec4 tmpvar_9;
  tmpvar_9.w = 0.0;
  tmpvar_9.xyz = (((
    (max (0.0, dot (tmpvar_6, tmpvar_7)) * _LightColor0.xyz)
   * 
    (tmpvar_8.xyz * _Diffusecolor.xyz)
  ) + (
    (_LightColor0.xyz * pow (max (0.0, dot (
      normalize((normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3.xyz)) + tmpvar_7))
    , tmpvar_6)), exp2((
      (_Gloss * 10.0)
     + 1.0))))
   * 
    ((texture2D (_SpecularMap, ((xlv_TEXCOORD0 * _SpecularMap_ST.xy) + _SpecularMap_ST.zw)).xyz * _SpecIntensity) * _Speccolor.xyz)
  )) * (tmpvar_8.w * _Transparency));
  gl_FragData[0] = tmpvar_9;
}


#endif
"
}
SubProgram "metal " {
// Stats: 16 math
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
Bind "texcoord2" ATTR5
ConstBuffer "$Globals" 192
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [unity_ObjectToWorld]
Matrix 128 [unity_WorldToObject]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
  float4 _glesMultiTexCoord2 [[attribute(5)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4x4 unity_ObjectToWorld;
  float4x4 unity_WorldToObject;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 v_1 = 0;
  v_1.x = _mtl_u.unity_WorldToObject[0].x;
  v_1.y = _mtl_u.unity_WorldToObject[1].x;
  v_1.z = _mtl_u.unity_WorldToObject[2].x;
  v_1.w = _mtl_u.unity_WorldToObject[3].x;
  float4 v_2 = 0;
  v_2.x = _mtl_u.unity_WorldToObject[0].y;
  v_2.y = _mtl_u.unity_WorldToObject[1].y;
  v_2.z = _mtl_u.unity_WorldToObject[2].y;
  v_2.w = _mtl_u.unity_WorldToObject[3].y;
  float4 v_3 = 0;
  v_3.x = _mtl_u.unity_WorldToObject[0].z;
  v_3.y = _mtl_u.unity_WorldToObject[1].z;
  v_3.z = _mtl_u.unity_WorldToObject[2].z;
  v_3.w = _mtl_u.unity_WorldToObject[3].z;
  float3 tmpvar_4 = 0;
  tmpvar_4 = normalize(((
    (v_1.xyz * _mtl_i._glesNormal.x)
   + 
    (v_2.xyz * _mtl_i._glesNormal.y)
  ) + (v_3.xyz * _mtl_i._glesNormal.z)));
  float4 tmpvar_5 = 0;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _mtl_i._glesTANGENT.xyz;
  float3 tmpvar_6 = 0;
  tmpvar_6 = normalize((_mtl_u.unity_ObjectToWorld * tmpvar_5).xyz);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = _mtl_i._glesMultiTexCoord0.xy;
  _mtl_o.xlv_TEXCOORD1 = _mtl_i._glesMultiTexCoord1.xy;
  _mtl_o.xlv_TEXCOORD2 = _mtl_i._glesMultiTexCoord2.xy;
  _mtl_o.xlv_TEXCOORD3 = (_mtl_u.unity_ObjectToWorld * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD4 = tmpvar_4;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * _mtl_i._glesTANGENT.w));
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec2 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD3 = hlslcc_mtx4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD6.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DiffuseMapTransA_ST;
uniform 	vec4 _Diffusecolor;
uniform 	vec4 _NormalMap_ST;
uniform 	float _NormalIntensity;
uniform 	vec4 _SpecularMap_ST;
uniform 	vec4 _Speccolor;
uniform 	float _SpecIntensity;
uniform 	float _Gloss;
uniform 	float _Transparency;
uniform  sampler2D _NormalMap;
uniform  sampler2D _SpecularMap;
uniform  sampler2D _DiffuseMapTransA;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
float u_xlat3;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_0 = texture(_NormalMap, u_xlat0.xy);
    u_xlat16_0.xz = u_xlat10_0.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat10_0.wy + u_xlat10_0.wy;
    u_xlat16_0.x = dot(u_xlat16_0.xz, u_xlat16_0.xz);
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat1.z = sqrt(u_xlat16_0.x);
    u_xlat0.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = vec3(_NormalIntensity) * u_xlat0.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD6.xyz;
    u_xlat0.xyw = u_xlat0.xxx * vs_TEXCOORD5.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat10 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0u)) ? 1.0 : -1.0;
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat1.xyz + u_xlat0.xyw;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 0.0);
    u_xlat1.xyz = vec3(u_xlat9) * _LightColor0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat3 = _Gloss * 10.0 + 1.0;
    u_xlat3 = exp2(u_xlat3);
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
    u_xlat10_2 = texture(_SpecularMap, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_SpecIntensity);
    u_xlat2.xyz = u_xlat2.xyz * _Speccolor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _DiffuseMapTransA_ST.xy + _DiffuseMapTransA_ST.zw;
    u_xlat10_2 = texture(_DiffuseMapTransA, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * _Diffusecolor.xyz;
    u_xlat9 = u_xlat10_2.w * _Transparency;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    SV_Target0.w = 0.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 57 math, 5 textures, 2 branches
Keywords { "SPOT" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"#version 120

#ifdef VERTEX

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_WorldToLight;
attribute vec4 TANGENT;
varying vec2 xlv_TEXCOORD0;
varying vec2 xlv_TEXCOORD1;
varying vec2 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec4 xlv_TEXCOORD7;
void main ()
{
  vec4 v_1;
  v_1.x = unity_WorldToObject[0].x;
  v_1.y = unity_WorldToObject[1].x;
  v_1.z = unity_WorldToObject[2].x;
  v_1.w = unity_WorldToObject[3].x;
  vec4 v_2;
  v_2.x = unity_WorldToObject[0].y;
  v_2.y = unity_WorldToObject[1].y;
  v_2.z = unity_WorldToObject[2].y;
  v_2.w = unity_WorldToObject[3].y;
  vec4 v_3;
  v_3.x = unity_WorldToObject[0].z;
  v_3.y = unity_WorldToObject[1].z;
  v_3.z = unity_WorldToObject[2].z;
  v_3.w = unity_WorldToObject[3].z;
  vec3 tmpvar_4;
  tmpvar_4 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = TANGENT.xyz;
  vec3 tmpvar_6;
  tmpvar_6 = normalize((unity_ObjectToWorld * tmpvar_5).xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = gl_MultiTexCoord0.xy;
  xlv_TEXCOORD1 = gl_MultiTexCoord1.xy;
  xlv_TEXCOORD2 = gl_MultiTexCoord2.xy;
  vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * gl_Vertex);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * TANGENT.w));
  xlv_TEXCOORD7 = (unity_WorldToLight * tmpvar_7);
}


#endif
#ifdef FRAGMENT
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform vec4 _LightColor0;
uniform sampler2D _DiffuseMapTransA;
uniform vec4 _DiffuseMapTransA_ST;
uniform vec4 _Diffusecolor;
uniform sampler2D _NormalMap;
uniform vec4 _NormalMap_ST;
uniform float _NormalIntensity;
uniform sampler2D _SpecularMap;
uniform vec4 _SpecularMap_ST;
uniform vec4 _Speccolor;
uniform float _SpecIntensity;
uniform float _Gloss;
uniform float _Transparency;
varying vec2 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec4 xlv_TEXCOORD7;
void main ()
{
  float tmpvar_1;
  if (gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD4;
  int tmpvar_3;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_3 = 1;
  } else {
    tmpvar_3 = -1;
  };
  tmpvar_2 = (normalize(xlv_TEXCOORD4) * float(tmpvar_3));
  mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD5.x;
  tmpvar_4[0].y = xlv_TEXCOORD6.x;
  tmpvar_4[0].z = tmpvar_2.x;
  tmpvar_4[1].x = xlv_TEXCOORD5.y;
  tmpvar_4[1].y = xlv_TEXCOORD6.y;
  tmpvar_4[1].z = tmpvar_2.y;
  tmpvar_4[2].x = xlv_TEXCOORD5.z;
  tmpvar_4[2].y = xlv_TEXCOORD6.z;
  tmpvar_4[2].z = tmpvar_2.z;
  vec3 normal_5;
  normal_5.xy = ((texture2D (_NormalMap, (
    (xlv_TEXCOORD0 * _NormalMap_ST.xy)
   + _NormalMap_ST.zw)).wy * 2.0) - 1.0);
  normal_5.z = sqrt((1.0 - clamp (
    dot (normal_5.xy, normal_5.xy)
  , 0.0, 1.0)));
  vec3 tmpvar_6;
  tmpvar_6 = normalize((mix (vec3(0.0, 0.0, 1.0), normal_5, vec3(_NormalIntensity)) * tmpvar_4));
  vec3 tmpvar_7;
  tmpvar_7 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3.xyz), _WorldSpaceLightPos0.www));
  vec3 tmpvar_8;
  tmpvar_8 = (((
    float((xlv_TEXCOORD7.z > 0.0))
   * texture2D (_LightTexture0, 
    ((xlv_TEXCOORD7.xy / xlv_TEXCOORD7.w) + 0.5)
  ).w) * texture2D (_LightTextureB0, vec2(dot (xlv_TEXCOORD7.xyz, xlv_TEXCOORD7.xyz))).w) * _LightColor0.xyz);
  vec4 tmpvar_9;
  tmpvar_9 = texture2D (_DiffuseMapTransA, ((xlv_TEXCOORD0 * _DiffuseMapTransA_ST.xy) + _DiffuseMapTransA_ST.zw));
  vec4 tmpvar_10;
  tmpvar_10.w = 0.0;
  tmpvar_10.xyz = (((
    (max (0.0, dot (tmpvar_6, tmpvar_7)) * tmpvar_8)
   * 
    (tmpvar_9.xyz * _Diffusecolor.xyz)
  ) + (
    (tmpvar_8 * pow (max (0.0, dot (
      normalize((normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3.xyz)) + tmpvar_7))
    , tmpvar_6)), exp2((
      (_Gloss * 10.0)
     + 1.0))))
   * 
    ((texture2D (_SpecularMap, ((xlv_TEXCOORD0 * _SpecularMap_ST.xy) + _SpecularMap_ST.zw)).xyz * _SpecIntensity) * _Speccolor.xyz)
  )) * (tmpvar_9.w * _Transparency));
  gl_FragData[0] = tmpvar_10;
}


#endif
"
}
SubProgram "metal " {
// Stats: 17 math
Keywords { "SPOT" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
Bind "texcoord2" ATTR5
ConstBuffer "$Globals" 256
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [unity_ObjectToWorld]
Matrix 128 [unity_WorldToObject]
Matrix 192 [unity_WorldToLight]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
  float4 _glesMultiTexCoord2 [[attribute(5)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float4 xlv_TEXCOORD7;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4x4 unity_ObjectToWorld;
  float4x4 unity_WorldToObject;
  float4x4 unity_WorldToLight;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 v_1 = 0;
  v_1.x = _mtl_u.unity_WorldToObject[0].x;
  v_1.y = _mtl_u.unity_WorldToObject[1].x;
  v_1.z = _mtl_u.unity_WorldToObject[2].x;
  v_1.w = _mtl_u.unity_WorldToObject[3].x;
  float4 v_2 = 0;
  v_2.x = _mtl_u.unity_WorldToObject[0].y;
  v_2.y = _mtl_u.unity_WorldToObject[1].y;
  v_2.z = _mtl_u.unity_WorldToObject[2].y;
  v_2.w = _mtl_u.unity_WorldToObject[3].y;
  float4 v_3 = 0;
  v_3.x = _mtl_u.unity_WorldToObject[0].z;
  v_3.y = _mtl_u.unity_WorldToObject[1].z;
  v_3.z = _mtl_u.unity_WorldToObject[2].z;
  v_3.w = _mtl_u.unity_WorldToObject[3].z;
  float3 tmpvar_4 = 0;
  tmpvar_4 = normalize(((
    (v_1.xyz * _mtl_i._glesNormal.x)
   + 
    (v_2.xyz * _mtl_i._glesNormal.y)
  ) + (v_3.xyz * _mtl_i._glesNormal.z)));
  float4 tmpvar_5 = 0;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _mtl_i._glesTANGENT.xyz;
  float3 tmpvar_6 = 0;
  tmpvar_6 = normalize((_mtl_u.unity_ObjectToWorld * tmpvar_5).xyz);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = _mtl_i._glesMultiTexCoord0.xy;
  _mtl_o.xlv_TEXCOORD1 = _mtl_i._glesMultiTexCoord1.xy;
  _mtl_o.xlv_TEXCOORD2 = _mtl_i._glesMultiTexCoord2.xy;
  float4 tmpvar_7 = 0;
  tmpvar_7 = (_mtl_u.unity_ObjectToWorld * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD3 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD4 = tmpvar_4;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * _mtl_i._glesTANGENT.w));
  _mtl_o.xlv_TEXCOORD7 = (_mtl_u.unity_WorldToLight * tmpvar_7);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "SPOT" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec2 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat1.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat1.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat1.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat2.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat2.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat2.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD5.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD6.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD7 = hlslcc_mtx4unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DiffuseMapTransA_ST;
uniform 	vec4 _Diffusecolor;
uniform 	vec4 _NormalMap_ST;
uniform 	float _NormalIntensity;
uniform 	vec4 _SpecularMap_ST;
uniform 	vec4 _Speccolor;
uniform 	float _SpecIntensity;
uniform 	float _Gloss;
uniform 	float _Transparency;
uniform  sampler2D _NormalMap;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler2D _SpecularMap;
uniform  sampler2D _DiffuseMapTransA;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
in  vec4 vs_TEXCOORD7;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec2 u_xlat3;
bool u_xlatb3;
float u_xlat6;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_0 = texture(_NormalMap, u_xlat0.xy);
    u_xlat16_0.xz = u_xlat10_0.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat10_0.wy + u_xlat10_0.wy;
    u_xlat16_0.x = dot(u_xlat16_0.xz, u_xlat16_0.xz);
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat1.z = sqrt(u_xlat16_0.x);
    u_xlat0.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = vec3(_NormalIntensity) * u_xlat0.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD6.xyz;
    u_xlat0.xyw = u_xlat0.xxx * vs_TEXCOORD5.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat10 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0u)) ? 1.0 : -1.0;
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat1.xyz + u_xlat0.xyw;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlat0.w = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.xw = max(u_xlat0.xw, vec2(0.0, 0.0));
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat3.x = _Gloss * 10.0 + 1.0;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat3.xy = vs_TEXCOORD7.xy / vs_TEXCOORD7.ww;
    u_xlat3.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat10_1 = texture(_LightTexture0, u_xlat3.xy);
    u_xlatb3 = 0.0<vs_TEXCOORD7.z;
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat3.x = u_xlat10_1.w * u_xlat3.x;
    u_xlat6 = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
    u_xlat10_1 = texture(_LightTextureB0, vec2(u_xlat6));
    u_xlat3.x = u_xlat3.x * u_xlat10_1.w;
    u_xlat1.xyz = u_xlat3.xxx * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.www * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
    u_xlat10_2 = texture(_SpecularMap, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_SpecIntensity);
    u_xlat2.xyz = u_xlat2.xyz * _Speccolor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _DiffuseMapTransA_ST.xy + _DiffuseMapTransA_ST.zw;
    u_xlat10_2 = texture(_DiffuseMapTransA, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * _Diffusecolor.xyz;
    u_xlat9 = u_xlat10_2.w * _Transparency;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    SV_Target0.w = 0.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 52 math, 5 textures, 2 branches
Keywords { "POINT_COOKIE" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"#version 120

#ifdef VERTEX

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_WorldToLight;
attribute vec4 TANGENT;
varying vec2 xlv_TEXCOORD0;
varying vec2 xlv_TEXCOORD1;
varying vec2 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec3 xlv_TEXCOORD7;
void main ()
{
  vec4 v_1;
  v_1.x = unity_WorldToObject[0].x;
  v_1.y = unity_WorldToObject[1].x;
  v_1.z = unity_WorldToObject[2].x;
  v_1.w = unity_WorldToObject[3].x;
  vec4 v_2;
  v_2.x = unity_WorldToObject[0].y;
  v_2.y = unity_WorldToObject[1].y;
  v_2.z = unity_WorldToObject[2].y;
  v_2.w = unity_WorldToObject[3].y;
  vec4 v_3;
  v_3.x = unity_WorldToObject[0].z;
  v_3.y = unity_WorldToObject[1].z;
  v_3.z = unity_WorldToObject[2].z;
  v_3.w = unity_WorldToObject[3].z;
  vec3 tmpvar_4;
  tmpvar_4 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = TANGENT.xyz;
  vec3 tmpvar_6;
  tmpvar_6 = normalize((unity_ObjectToWorld * tmpvar_5).xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = gl_MultiTexCoord0.xy;
  xlv_TEXCOORD1 = gl_MultiTexCoord1.xy;
  xlv_TEXCOORD2 = gl_MultiTexCoord2.xy;
  vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * gl_Vertex);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * TANGENT.w));
  xlv_TEXCOORD7 = (unity_WorldToLight * tmpvar_7).xyz;
}


#endif
#ifdef FRAGMENT
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform vec4 _LightColor0;
uniform sampler2D _DiffuseMapTransA;
uniform vec4 _DiffuseMapTransA_ST;
uniform vec4 _Diffusecolor;
uniform sampler2D _NormalMap;
uniform vec4 _NormalMap_ST;
uniform float _NormalIntensity;
uniform sampler2D _SpecularMap;
uniform vec4 _SpecularMap_ST;
uniform vec4 _Speccolor;
uniform float _SpecIntensity;
uniform float _Gloss;
uniform float _Transparency;
varying vec2 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec3 xlv_TEXCOORD7;
void main ()
{
  float tmpvar_1;
  if (gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD4;
  int tmpvar_3;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_3 = 1;
  } else {
    tmpvar_3 = -1;
  };
  tmpvar_2 = (normalize(xlv_TEXCOORD4) * float(tmpvar_3));
  mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD5.x;
  tmpvar_4[0].y = xlv_TEXCOORD6.x;
  tmpvar_4[0].z = tmpvar_2.x;
  tmpvar_4[1].x = xlv_TEXCOORD5.y;
  tmpvar_4[1].y = xlv_TEXCOORD6.y;
  tmpvar_4[1].z = tmpvar_2.y;
  tmpvar_4[2].x = xlv_TEXCOORD5.z;
  tmpvar_4[2].y = xlv_TEXCOORD6.z;
  tmpvar_4[2].z = tmpvar_2.z;
  vec3 normal_5;
  normal_5.xy = ((texture2D (_NormalMap, (
    (xlv_TEXCOORD0 * _NormalMap_ST.xy)
   + _NormalMap_ST.zw)).wy * 2.0) - 1.0);
  normal_5.z = sqrt((1.0 - clamp (
    dot (normal_5.xy, normal_5.xy)
  , 0.0, 1.0)));
  vec3 tmpvar_6;
  tmpvar_6 = normalize((mix (vec3(0.0, 0.0, 1.0), normal_5, vec3(_NormalIntensity)) * tmpvar_4));
  vec3 tmpvar_7;
  tmpvar_7 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3.xyz), _WorldSpaceLightPos0.www));
  vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_LightTextureB0, vec2(dot (xlv_TEXCOORD7, xlv_TEXCOORD7))).w * textureCube (_LightTexture0, xlv_TEXCOORD7).w) * _LightColor0.xyz);
  vec4 tmpvar_9;
  tmpvar_9 = texture2D (_DiffuseMapTransA, ((xlv_TEXCOORD0 * _DiffuseMapTransA_ST.xy) + _DiffuseMapTransA_ST.zw));
  vec4 tmpvar_10;
  tmpvar_10.w = 0.0;
  tmpvar_10.xyz = (((
    (max (0.0, dot (tmpvar_6, tmpvar_7)) * tmpvar_8)
   * 
    (tmpvar_9.xyz * _Diffusecolor.xyz)
  ) + (
    (tmpvar_8 * pow (max (0.0, dot (
      normalize((normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3.xyz)) + tmpvar_7))
    , tmpvar_6)), exp2((
      (_Gloss * 10.0)
     + 1.0))))
   * 
    ((texture2D (_SpecularMap, ((xlv_TEXCOORD0 * _SpecularMap_ST.xy) + _SpecularMap_ST.zw)).xyz * _SpecIntensity) * _Speccolor.xyz)
  )) * (tmpvar_9.w * _Transparency));
  gl_FragData[0] = tmpvar_10;
}


#endif
"
}
SubProgram "metal " {
// Stats: 17 math
Keywords { "POINT_COOKIE" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
Bind "texcoord2" ATTR5
ConstBuffer "$Globals" 256
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [unity_ObjectToWorld]
Matrix 128 [unity_WorldToObject]
Matrix 192 [unity_WorldToLight]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
  float4 _glesMultiTexCoord2 [[attribute(5)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float3 xlv_TEXCOORD7;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4x4 unity_ObjectToWorld;
  float4x4 unity_WorldToObject;
  float4x4 unity_WorldToLight;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 v_1 = 0;
  v_1.x = _mtl_u.unity_WorldToObject[0].x;
  v_1.y = _mtl_u.unity_WorldToObject[1].x;
  v_1.z = _mtl_u.unity_WorldToObject[2].x;
  v_1.w = _mtl_u.unity_WorldToObject[3].x;
  float4 v_2 = 0;
  v_2.x = _mtl_u.unity_WorldToObject[0].y;
  v_2.y = _mtl_u.unity_WorldToObject[1].y;
  v_2.z = _mtl_u.unity_WorldToObject[2].y;
  v_2.w = _mtl_u.unity_WorldToObject[3].y;
  float4 v_3 = 0;
  v_3.x = _mtl_u.unity_WorldToObject[0].z;
  v_3.y = _mtl_u.unity_WorldToObject[1].z;
  v_3.z = _mtl_u.unity_WorldToObject[2].z;
  v_3.w = _mtl_u.unity_WorldToObject[3].z;
  float3 tmpvar_4 = 0;
  tmpvar_4 = normalize(((
    (v_1.xyz * _mtl_i._glesNormal.x)
   + 
    (v_2.xyz * _mtl_i._glesNormal.y)
  ) + (v_3.xyz * _mtl_i._glesNormal.z)));
  float4 tmpvar_5 = 0;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _mtl_i._glesTANGENT.xyz;
  float3 tmpvar_6 = 0;
  tmpvar_6 = normalize((_mtl_u.unity_ObjectToWorld * tmpvar_5).xyz);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = _mtl_i._glesMultiTexCoord0.xy;
  _mtl_o.xlv_TEXCOORD1 = _mtl_i._glesMultiTexCoord1.xy;
  _mtl_o.xlv_TEXCOORD2 = _mtl_i._glesMultiTexCoord2.xy;
  float4 tmpvar_7 = 0;
  tmpvar_7 = (_mtl_u.unity_ObjectToWorld * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD3 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD4 = tmpvar_4;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * _mtl_i._glesTANGENT.w));
  _mtl_o.xlv_TEXCOORD7 = (_mtl_u.unity_WorldToLight * tmpvar_7).xyz;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec2 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat1.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat1.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat1.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat2.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat2.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat2.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD5.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD6.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DiffuseMapTransA_ST;
uniform 	vec4 _Diffusecolor;
uniform 	vec4 _NormalMap_ST;
uniform 	float _NormalIntensity;
uniform 	vec4 _SpecularMap_ST;
uniform 	vec4 _Speccolor;
uniform 	float _SpecIntensity;
uniform 	float _Gloss;
uniform 	float _Transparency;
uniform  sampler2D _NormalMap;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  sampler2D _SpecularMap;
uniform  sampler2D _DiffuseMapTransA;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
in  vec3 vs_TEXCOORD7;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
float u_xlat3;
mediump float u_xlat16_3;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_0 = texture(_NormalMap, u_xlat0.xy);
    u_xlat16_0.xz = u_xlat10_0.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat10_0.wy + u_xlat10_0.wy;
    u_xlat16_0.x = dot(u_xlat16_0.xz, u_xlat16_0.xz);
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat1.z = sqrt(u_xlat16_0.x);
    u_xlat0.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = vec3(_NormalIntensity) * u_xlat0.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD6.xyz;
    u_xlat0.xyw = u_xlat0.xxx * vs_TEXCOORD5.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat10 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0u)) ? 1.0 : -1.0;
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat1.xyz + u_xlat0.xyw;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlat0.w = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.xw = max(u_xlat0.xw, vec2(0.0, 0.0));
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat3 = _Gloss * 10.0 + 1.0;
    u_xlat3 = exp2(u_xlat3);
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat3 = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
    u_xlat10_1 = texture(_LightTextureB0, vec2(u_xlat3));
    u_xlat10_2 = texture(_LightTexture0, vs_TEXCOORD7.xyz);
    u_xlat16_3 = u_xlat10_1.w * u_xlat10_2.w;
    u_xlat1.xyz = vec3(u_xlat16_3) * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.www * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
    u_xlat10_2 = texture(_SpecularMap, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_SpecIntensity);
    u_xlat2.xyz = u_xlat2.xyz * _Speccolor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _DiffuseMapTransA_ST.xy + _DiffuseMapTransA_ST.zw;
    u_xlat10_2 = texture(_DiffuseMapTransA, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * _Diffusecolor.xyz;
    u_xlat9 = u_xlat10_2.w * _Transparency;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    SV_Target0.w = 0.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 50 math, 4 textures, 2 branches
Keywords { "DIRECTIONAL_COOKIE" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"#version 120

#ifdef VERTEX

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_WorldToLight;
attribute vec4 TANGENT;
varying vec2 xlv_TEXCOORD0;
varying vec2 xlv_TEXCOORD1;
varying vec2 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec2 xlv_TEXCOORD7;
void main ()
{
  vec4 v_1;
  v_1.x = unity_WorldToObject[0].x;
  v_1.y = unity_WorldToObject[1].x;
  v_1.z = unity_WorldToObject[2].x;
  v_1.w = unity_WorldToObject[3].x;
  vec4 v_2;
  v_2.x = unity_WorldToObject[0].y;
  v_2.y = unity_WorldToObject[1].y;
  v_2.z = unity_WorldToObject[2].y;
  v_2.w = unity_WorldToObject[3].y;
  vec4 v_3;
  v_3.x = unity_WorldToObject[0].z;
  v_3.y = unity_WorldToObject[1].z;
  v_3.z = unity_WorldToObject[2].z;
  v_3.w = unity_WorldToObject[3].z;
  vec3 tmpvar_4;
  tmpvar_4 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = TANGENT.xyz;
  vec3 tmpvar_6;
  tmpvar_6 = normalize((unity_ObjectToWorld * tmpvar_5).xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = gl_MultiTexCoord0.xy;
  xlv_TEXCOORD1 = gl_MultiTexCoord1.xy;
  xlv_TEXCOORD2 = gl_MultiTexCoord2.xy;
  vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * gl_Vertex);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * TANGENT.w));
  xlv_TEXCOORD7 = (unity_WorldToLight * tmpvar_7).xy;
}


#endif
#ifdef FRAGMENT
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform sampler2D _LightTexture0;
uniform vec4 _LightColor0;
uniform sampler2D _DiffuseMapTransA;
uniform vec4 _DiffuseMapTransA_ST;
uniform vec4 _Diffusecolor;
uniform sampler2D _NormalMap;
uniform vec4 _NormalMap_ST;
uniform float _NormalIntensity;
uniform sampler2D _SpecularMap;
uniform vec4 _SpecularMap_ST;
uniform vec4 _Speccolor;
uniform float _SpecIntensity;
uniform float _Gloss;
uniform float _Transparency;
varying vec2 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec2 xlv_TEXCOORD7;
void main ()
{
  float tmpvar_1;
  if (gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD4;
  int tmpvar_3;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_3 = 1;
  } else {
    tmpvar_3 = -1;
  };
  tmpvar_2 = (normalize(xlv_TEXCOORD4) * float(tmpvar_3));
  mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD5.x;
  tmpvar_4[0].y = xlv_TEXCOORD6.x;
  tmpvar_4[0].z = tmpvar_2.x;
  tmpvar_4[1].x = xlv_TEXCOORD5.y;
  tmpvar_4[1].y = xlv_TEXCOORD6.y;
  tmpvar_4[1].z = tmpvar_2.y;
  tmpvar_4[2].x = xlv_TEXCOORD5.z;
  tmpvar_4[2].y = xlv_TEXCOORD6.z;
  tmpvar_4[2].z = tmpvar_2.z;
  vec3 normal_5;
  normal_5.xy = ((texture2D (_NormalMap, (
    (xlv_TEXCOORD0 * _NormalMap_ST.xy)
   + _NormalMap_ST.zw)).wy * 2.0) - 1.0);
  normal_5.z = sqrt((1.0 - clamp (
    dot (normal_5.xy, normal_5.xy)
  , 0.0, 1.0)));
  vec3 tmpvar_6;
  tmpvar_6 = normalize((mix (vec3(0.0, 0.0, 1.0), normal_5, vec3(_NormalIntensity)) * tmpvar_4));
  vec3 tmpvar_7;
  tmpvar_7 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3.xyz), _WorldSpaceLightPos0.www));
  vec3 tmpvar_8;
  tmpvar_8 = (texture2D (_LightTexture0, xlv_TEXCOORD7).w * _LightColor0.xyz);
  vec4 tmpvar_9;
  tmpvar_9 = texture2D (_DiffuseMapTransA, ((xlv_TEXCOORD0 * _DiffuseMapTransA_ST.xy) + _DiffuseMapTransA_ST.zw));
  vec4 tmpvar_10;
  tmpvar_10.w = 0.0;
  tmpvar_10.xyz = (((
    (max (0.0, dot (tmpvar_6, tmpvar_7)) * tmpvar_8)
   * 
    (tmpvar_9.xyz * _Diffusecolor.xyz)
  ) + (
    (tmpvar_8 * pow (max (0.0, dot (
      normalize((normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3.xyz)) + tmpvar_7))
    , tmpvar_6)), exp2((
      (_Gloss * 10.0)
     + 1.0))))
   * 
    ((texture2D (_SpecularMap, ((xlv_TEXCOORD0 * _SpecularMap_ST.xy) + _SpecularMap_ST.zw)).xyz * _SpecIntensity) * _Speccolor.xyz)
  )) * (tmpvar_9.w * _Transparency));
  gl_FragData[0] = tmpvar_10;
}


#endif
"
}
SubProgram "metal " {
// Stats: 17 math
Keywords { "DIRECTIONAL_COOKIE" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
Bind "texcoord2" ATTR5
ConstBuffer "$Globals" 256
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [unity_ObjectToWorld]
Matrix 128 [unity_WorldToObject]
Matrix 192 [unity_WorldToLight]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
  float4 _glesMultiTexCoord2 [[attribute(5)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float2 xlv_TEXCOORD7;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4x4 unity_ObjectToWorld;
  float4x4 unity_WorldToObject;
  float4x4 unity_WorldToLight;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 v_1 = 0;
  v_1.x = _mtl_u.unity_WorldToObject[0].x;
  v_1.y = _mtl_u.unity_WorldToObject[1].x;
  v_1.z = _mtl_u.unity_WorldToObject[2].x;
  v_1.w = _mtl_u.unity_WorldToObject[3].x;
  float4 v_2 = 0;
  v_2.x = _mtl_u.unity_WorldToObject[0].y;
  v_2.y = _mtl_u.unity_WorldToObject[1].y;
  v_2.z = _mtl_u.unity_WorldToObject[2].y;
  v_2.w = _mtl_u.unity_WorldToObject[3].y;
  float4 v_3 = 0;
  v_3.x = _mtl_u.unity_WorldToObject[0].z;
  v_3.y = _mtl_u.unity_WorldToObject[1].z;
  v_3.z = _mtl_u.unity_WorldToObject[2].z;
  v_3.w = _mtl_u.unity_WorldToObject[3].z;
  float3 tmpvar_4 = 0;
  tmpvar_4 = normalize(((
    (v_1.xyz * _mtl_i._glesNormal.x)
   + 
    (v_2.xyz * _mtl_i._glesNormal.y)
  ) + (v_3.xyz * _mtl_i._glesNormal.z)));
  float4 tmpvar_5 = 0;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _mtl_i._glesTANGENT.xyz;
  float3 tmpvar_6 = 0;
  tmpvar_6 = normalize((_mtl_u.unity_ObjectToWorld * tmpvar_5).xyz);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = _mtl_i._glesMultiTexCoord0.xy;
  _mtl_o.xlv_TEXCOORD1 = _mtl_i._glesMultiTexCoord1.xy;
  _mtl_o.xlv_TEXCOORD2 = _mtl_i._glesMultiTexCoord2.xy;
  float4 tmpvar_7 = 0;
  tmpvar_7 = (_mtl_u.unity_ObjectToWorld * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD3 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD4 = tmpvar_4;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * _mtl_i._glesTANGENT.w));
  _mtl_o.xlv_TEXCOORD7 = (_mtl_u.unity_WorldToLight * tmpvar_7).xy;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec2 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out vec2 vs_TEXCOORD7;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4unity_WorldToLight[1].xy;
    u_xlat1.xy = hlslcc_mtx4unity_WorldToLight[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4unity_WorldToLight[2].xy * u_xlat0.zz + u_xlat1.xy;
    vs_TEXCOORD7.xy = hlslcc_mtx4unity_WorldToLight[3].xy * u_xlat0.ww + u_xlat1.xy;
    vs_TEXCOORD3 = u_xlat0;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD6.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DiffuseMapTransA_ST;
uniform 	vec4 _Diffusecolor;
uniform 	vec4 _NormalMap_ST;
uniform 	float _NormalIntensity;
uniform 	vec4 _SpecularMap_ST;
uniform 	vec4 _Speccolor;
uniform 	float _SpecIntensity;
uniform 	float _Gloss;
uniform 	float _Transparency;
uniform  sampler2D _NormalMap;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _SpecularMap;
uniform  sampler2D _DiffuseMapTransA;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD7;
in  vec4 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
float u_xlat3;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_0 = texture(_NormalMap, u_xlat0.xy);
    u_xlat16_0.xz = u_xlat10_0.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat10_0.wy + u_xlat10_0.wy;
    u_xlat16_0.x = dot(u_xlat16_0.xz, u_xlat16_0.xz);
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat1.z = sqrt(u_xlat16_0.x);
    u_xlat0.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = vec3(_NormalIntensity) * u_xlat0.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD6.xyz;
    u_xlat0.xyw = u_xlat0.xxx * vs_TEXCOORD5.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat10 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0u)) ? 1.0 : -1.0;
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat1.xyz + u_xlat0.xyw;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlat0.w = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.xw = max(u_xlat0.xw, vec2(0.0, 0.0));
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat3 = _Gloss * 10.0 + 1.0;
    u_xlat3 = exp2(u_xlat3);
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat10_1 = texture(_LightTexture0, vs_TEXCOORD7.xy);
    u_xlat1.xyz = u_xlat10_1.www * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.www * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
    u_xlat10_2 = texture(_SpecularMap, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_SpecIntensity);
    u_xlat2.xyz = u_xlat2.xyz * _Speccolor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _DiffuseMapTransA_ST.xy + _DiffuseMapTransA_ST.zw;
    u_xlat10_2 = texture(_DiffuseMapTransA, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * _Diffusecolor.xyz;
    u_xlat9 = u_xlat10_2.w * _Transparency;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    SV_Target0.w = 0.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 51 math, 4 textures, 2 branches
Keywords { "POINT" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"#version 120

#ifdef VERTEX

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_WorldToLight;
attribute vec4 TANGENT;
varying vec2 xlv_TEXCOORD0;
varying vec2 xlv_TEXCOORD1;
varying vec2 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec3 xlv_TEXCOORD7;
void main ()
{
  vec4 v_1;
  v_1.x = unity_WorldToObject[0].x;
  v_1.y = unity_WorldToObject[1].x;
  v_1.z = unity_WorldToObject[2].x;
  v_1.w = unity_WorldToObject[3].x;
  vec4 v_2;
  v_2.x = unity_WorldToObject[0].y;
  v_2.y = unity_WorldToObject[1].y;
  v_2.z = unity_WorldToObject[2].y;
  v_2.w = unity_WorldToObject[3].y;
  vec4 v_3;
  v_3.x = unity_WorldToObject[0].z;
  v_3.y = unity_WorldToObject[1].z;
  v_3.z = unity_WorldToObject[2].z;
  v_3.w = unity_WorldToObject[3].z;
  vec3 tmpvar_4;
  tmpvar_4 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = TANGENT.xyz;
  vec3 tmpvar_6;
  tmpvar_6 = normalize((unity_ObjectToWorld * tmpvar_5).xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = gl_MultiTexCoord0.xy;
  xlv_TEXCOORD1 = gl_MultiTexCoord1.xy;
  xlv_TEXCOORD2 = gl_MultiTexCoord2.xy;
  vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * gl_Vertex);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * TANGENT.w));
  xlv_TEXCOORD7 = (unity_WorldToLight * tmpvar_7).xyz;
}


#endif
#ifdef FRAGMENT
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform sampler2D _LightTexture0;
uniform vec4 _LightColor0;
uniform sampler2D _DiffuseMapTransA;
uniform vec4 _DiffuseMapTransA_ST;
uniform vec4 _Diffusecolor;
uniform sampler2D _NormalMap;
uniform vec4 _NormalMap_ST;
uniform float _NormalIntensity;
uniform sampler2D _SpecularMap;
uniform vec4 _SpecularMap_ST;
uniform vec4 _Speccolor;
uniform float _SpecIntensity;
uniform float _Gloss;
uniform float _Transparency;
varying vec2 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec3 xlv_TEXCOORD7;
void main ()
{
  float tmpvar_1;
  if (gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD4;
  int tmpvar_3;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_3 = 1;
  } else {
    tmpvar_3 = -1;
  };
  tmpvar_2 = (normalize(xlv_TEXCOORD4) * float(tmpvar_3));
  mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD5.x;
  tmpvar_4[0].y = xlv_TEXCOORD6.x;
  tmpvar_4[0].z = tmpvar_2.x;
  tmpvar_4[1].x = xlv_TEXCOORD5.y;
  tmpvar_4[1].y = xlv_TEXCOORD6.y;
  tmpvar_4[1].z = tmpvar_2.y;
  tmpvar_4[2].x = xlv_TEXCOORD5.z;
  tmpvar_4[2].y = xlv_TEXCOORD6.z;
  tmpvar_4[2].z = tmpvar_2.z;
  vec3 normal_5;
  normal_5.xy = ((texture2D (_NormalMap, (
    (xlv_TEXCOORD0 * _NormalMap_ST.xy)
   + _NormalMap_ST.zw)).wy * 2.0) - 1.0);
  normal_5.z = sqrt((1.0 - clamp (
    dot (normal_5.xy, normal_5.xy)
  , 0.0, 1.0)));
  vec3 tmpvar_6;
  tmpvar_6 = normalize((mix (vec3(0.0, 0.0, 1.0), normal_5, vec3(_NormalIntensity)) * tmpvar_4));
  vec3 tmpvar_7;
  tmpvar_7 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3.xyz), _WorldSpaceLightPos0.www));
  vec3 tmpvar_8;
  tmpvar_8 = (texture2D (_LightTexture0, vec2(dot (xlv_TEXCOORD7, xlv_TEXCOORD7))).w * _LightColor0.xyz);
  vec4 tmpvar_9;
  tmpvar_9 = texture2D (_DiffuseMapTransA, ((xlv_TEXCOORD0 * _DiffuseMapTransA_ST.xy) + _DiffuseMapTransA_ST.zw));
  vec4 tmpvar_10;
  tmpvar_10.w = 0.0;
  tmpvar_10.xyz = (((
    (max (0.0, dot (tmpvar_6, tmpvar_7)) * tmpvar_8)
   * 
    (tmpvar_9.xyz * _Diffusecolor.xyz)
  ) + (
    (tmpvar_8 * pow (max (0.0, dot (
      normalize((normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3.xyz)) + tmpvar_7))
    , tmpvar_6)), exp2((
      (_Gloss * 10.0)
     + 1.0))))
   * 
    ((texture2D (_SpecularMap, ((xlv_TEXCOORD0 * _SpecularMap_ST.xy) + _SpecularMap_ST.zw)).xyz * _SpecIntensity) * _Speccolor.xyz)
  )) * (tmpvar_9.w * _Transparency));
  gl_FragData[0] = tmpvar_10;
}


#endif
"
}
SubProgram "metal " {
// Stats: 17 math
Keywords { "POINT" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
Bind "texcoord2" ATTR5
ConstBuffer "$Globals" 256
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [unity_ObjectToWorld]
Matrix 128 [unity_WorldToObject]
Matrix 192 [unity_WorldToLight]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
  float4 _glesMultiTexCoord2 [[attribute(5)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float3 xlv_TEXCOORD7;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4x4 unity_ObjectToWorld;
  float4x4 unity_WorldToObject;
  float4x4 unity_WorldToLight;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 v_1 = 0;
  v_1.x = _mtl_u.unity_WorldToObject[0].x;
  v_1.y = _mtl_u.unity_WorldToObject[1].x;
  v_1.z = _mtl_u.unity_WorldToObject[2].x;
  v_1.w = _mtl_u.unity_WorldToObject[3].x;
  float4 v_2 = 0;
  v_2.x = _mtl_u.unity_WorldToObject[0].y;
  v_2.y = _mtl_u.unity_WorldToObject[1].y;
  v_2.z = _mtl_u.unity_WorldToObject[2].y;
  v_2.w = _mtl_u.unity_WorldToObject[3].y;
  float4 v_3 = 0;
  v_3.x = _mtl_u.unity_WorldToObject[0].z;
  v_3.y = _mtl_u.unity_WorldToObject[1].z;
  v_3.z = _mtl_u.unity_WorldToObject[2].z;
  v_3.w = _mtl_u.unity_WorldToObject[3].z;
  float3 tmpvar_4 = 0;
  tmpvar_4 = normalize(((
    (v_1.xyz * _mtl_i._glesNormal.x)
   + 
    (v_2.xyz * _mtl_i._glesNormal.y)
  ) + (v_3.xyz * _mtl_i._glesNormal.z)));
  float4 tmpvar_5 = 0;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _mtl_i._glesTANGENT.xyz;
  float3 tmpvar_6 = 0;
  tmpvar_6 = normalize((_mtl_u.unity_ObjectToWorld * tmpvar_5).xyz);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = _mtl_i._glesMultiTexCoord0.xy;
  _mtl_o.xlv_TEXCOORD1 = _mtl_i._glesMultiTexCoord1.xy;
  _mtl_o.xlv_TEXCOORD2 = _mtl_i._glesMultiTexCoord2.xy;
  float4 tmpvar_7 = 0;
  tmpvar_7 = (_mtl_u.unity_ObjectToWorld * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD3 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD4 = tmpvar_4;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * _mtl_i._glesTANGENT.w));
  _mtl_o.xlv_TEXCOORD7 = (_mtl_u.unity_WorldToLight * tmpvar_7).xyz;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec2 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat1.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat1.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat1.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat2.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat2.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat2.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD5.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD6.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DiffuseMapTransA_ST;
uniform 	vec4 _Diffusecolor;
uniform 	vec4 _NormalMap_ST;
uniform 	float _NormalIntensity;
uniform 	vec4 _SpecularMap_ST;
uniform 	vec4 _Speccolor;
uniform 	float _SpecIntensity;
uniform 	float _Gloss;
uniform 	float _Transparency;
uniform  sampler2D _NormalMap;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _SpecularMap;
uniform  sampler2D _DiffuseMapTransA;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
in  vec3 vs_TEXCOORD7;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
float u_xlat3;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_0 = texture(_NormalMap, u_xlat0.xy);
    u_xlat16_0.xz = u_xlat10_0.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat10_0.wy + u_xlat10_0.wy;
    u_xlat16_0.x = dot(u_xlat16_0.xz, u_xlat16_0.xz);
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat1.z = sqrt(u_xlat16_0.x);
    u_xlat0.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = vec3(_NormalIntensity) * u_xlat0.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD6.xyz;
    u_xlat0.xyw = u_xlat0.xxx * vs_TEXCOORD5.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat10 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0u)) ? 1.0 : -1.0;
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat1.xyz + u_xlat0.xyw;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlat0.w = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.xw = max(u_xlat0.xw, vec2(0.0, 0.0));
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat3 = _Gloss * 10.0 + 1.0;
    u_xlat3 = exp2(u_xlat3);
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat3 = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
    u_xlat10_1 = texture(_LightTexture0, vec2(u_xlat3));
    u_xlat1.xyz = u_xlat10_1.www * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.www * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
    u_xlat10_2 = texture(_SpecularMap, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_SpecIntensity);
    u_xlat2.xyz = u_xlat2.xyz * _Speccolor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _DiffuseMapTransA_ST.xy + _DiffuseMapTransA_ST.zw;
    u_xlat10_2 = texture(_DiffuseMapTransA, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * _Diffusecolor.xyz;
    u_xlat9 = u_xlat10_2.w * _Transparency;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    SV_Target0.w = 0.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 49 math, 3 textures, 2 branches
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"#version 120

#ifdef VERTEX

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
attribute vec4 TANGENT;
varying vec2 xlv_TEXCOORD0;
varying vec2 xlv_TEXCOORD1;
varying vec2 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  vec4 v_1;
  v_1.x = unity_WorldToObject[0].x;
  v_1.y = unity_WorldToObject[1].x;
  v_1.z = unity_WorldToObject[2].x;
  v_1.w = unity_WorldToObject[3].x;
  vec4 v_2;
  v_2.x = unity_WorldToObject[0].y;
  v_2.y = unity_WorldToObject[1].y;
  v_2.z = unity_WorldToObject[2].y;
  v_2.w = unity_WorldToObject[3].y;
  vec4 v_3;
  v_3.x = unity_WorldToObject[0].z;
  v_3.y = unity_WorldToObject[1].z;
  v_3.z = unity_WorldToObject[2].z;
  v_3.w = unity_WorldToObject[3].z;
  vec3 tmpvar_4;
  tmpvar_4 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = TANGENT.xyz;
  vec3 tmpvar_6;
  tmpvar_6 = normalize((unity_ObjectToWorld * tmpvar_5).xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = gl_MultiTexCoord0.xy;
  xlv_TEXCOORD1 = gl_MultiTexCoord1.xy;
  xlv_TEXCOORD2 = gl_MultiTexCoord2.xy;
  xlv_TEXCOORD3 = (unity_ObjectToWorld * gl_Vertex);
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * TANGENT.w));
}


#endif
#ifdef FRAGMENT
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform vec4 _LightColor0;
uniform sampler2D _DiffuseMapTransA;
uniform vec4 _DiffuseMapTransA_ST;
uniform vec4 _Diffusecolor;
uniform sampler2D _NormalMap;
uniform vec4 _NormalMap_ST;
uniform float _NormalIntensity;
uniform sampler2D _SpecularMap;
uniform vec4 _SpecularMap_ST;
uniform vec4 _Speccolor;
uniform float _SpecIntensity;
uniform float _Gloss;
uniform float _Transparency;
varying vec2 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
void main ()
{
  float tmpvar_1;
  if (gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD4;
  int tmpvar_3;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_3 = 1;
  } else {
    tmpvar_3 = -1;
  };
  tmpvar_2 = (normalize(xlv_TEXCOORD4) * float(tmpvar_3));
  mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD5.x;
  tmpvar_4[0].y = xlv_TEXCOORD6.x;
  tmpvar_4[0].z = tmpvar_2.x;
  tmpvar_4[1].x = xlv_TEXCOORD5.y;
  tmpvar_4[1].y = xlv_TEXCOORD6.y;
  tmpvar_4[1].z = tmpvar_2.y;
  tmpvar_4[2].x = xlv_TEXCOORD5.z;
  tmpvar_4[2].y = xlv_TEXCOORD6.z;
  tmpvar_4[2].z = tmpvar_2.z;
  vec3 normal_5;
  normal_5.xy = ((texture2D (_NormalMap, (
    (xlv_TEXCOORD0 * _NormalMap_ST.xy)
   + _NormalMap_ST.zw)).wy * 2.0) - 1.0);
  normal_5.z = sqrt((1.0 - clamp (
    dot (normal_5.xy, normal_5.xy)
  , 0.0, 1.0)));
  vec3 tmpvar_6;
  tmpvar_6 = normalize((mix (vec3(0.0, 0.0, 1.0), normal_5, vec3(_NormalIntensity)) * tmpvar_4));
  vec3 tmpvar_7;
  tmpvar_7 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3.xyz), _WorldSpaceLightPos0.www));
  vec4 tmpvar_8;
  tmpvar_8 = texture2D (_DiffuseMapTransA, ((xlv_TEXCOORD0 * _DiffuseMapTransA_ST.xy) + _DiffuseMapTransA_ST.zw));
  vec4 tmpvar_9;
  tmpvar_9.w = 0.0;
  tmpvar_9.xyz = (((
    (max (0.0, dot (tmpvar_6, tmpvar_7)) * _LightColor0.xyz)
   * 
    (tmpvar_8.xyz * _Diffusecolor.xyz)
  ) + (
    (_LightColor0.xyz * pow (max (0.0, dot (
      normalize((normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3.xyz)) + tmpvar_7))
    , tmpvar_6)), exp2((
      (_Gloss * 10.0)
     + 1.0))))
   * 
    ((texture2D (_SpecularMap, ((xlv_TEXCOORD0 * _SpecularMap_ST.xy) + _SpecularMap_ST.zw)).xyz * _SpecIntensity) * _Speccolor.xyz)
  )) * (tmpvar_8.w * _Transparency));
  gl_FragData[0] = tmpvar_9;
}


#endif
"
}
SubProgram "metal " {
// Stats: 16 math
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
Bind "texcoord2" ATTR5
ConstBuffer "$Globals" 192
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [unity_ObjectToWorld]
Matrix 128 [unity_WorldToObject]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
  float4 _glesMultiTexCoord2 [[attribute(5)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4x4 unity_ObjectToWorld;
  float4x4 unity_WorldToObject;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 v_1 = 0;
  v_1.x = _mtl_u.unity_WorldToObject[0].x;
  v_1.y = _mtl_u.unity_WorldToObject[1].x;
  v_1.z = _mtl_u.unity_WorldToObject[2].x;
  v_1.w = _mtl_u.unity_WorldToObject[3].x;
  float4 v_2 = 0;
  v_2.x = _mtl_u.unity_WorldToObject[0].y;
  v_2.y = _mtl_u.unity_WorldToObject[1].y;
  v_2.z = _mtl_u.unity_WorldToObject[2].y;
  v_2.w = _mtl_u.unity_WorldToObject[3].y;
  float4 v_3 = 0;
  v_3.x = _mtl_u.unity_WorldToObject[0].z;
  v_3.y = _mtl_u.unity_WorldToObject[1].z;
  v_3.z = _mtl_u.unity_WorldToObject[2].z;
  v_3.w = _mtl_u.unity_WorldToObject[3].z;
  float3 tmpvar_4 = 0;
  tmpvar_4 = normalize(((
    (v_1.xyz * _mtl_i._glesNormal.x)
   + 
    (v_2.xyz * _mtl_i._glesNormal.y)
  ) + (v_3.xyz * _mtl_i._glesNormal.z)));
  float4 tmpvar_5 = 0;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _mtl_i._glesTANGENT.xyz;
  float3 tmpvar_6 = 0;
  tmpvar_6 = normalize((_mtl_u.unity_ObjectToWorld * tmpvar_5).xyz);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = _mtl_i._glesMultiTexCoord0.xy;
  _mtl_o.xlv_TEXCOORD1 = _mtl_i._glesMultiTexCoord1.xy;
  _mtl_o.xlv_TEXCOORD2 = _mtl_i._glesMultiTexCoord2.xy;
  _mtl_o.xlv_TEXCOORD3 = (_mtl_u.unity_ObjectToWorld * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD4 = tmpvar_4;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * _mtl_i._glesTANGENT.w));
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec2 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD3 = hlslcc_mtx4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD6.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DiffuseMapTransA_ST;
uniform 	vec4 _Diffusecolor;
uniform 	vec4 _NormalMap_ST;
uniform 	float _NormalIntensity;
uniform 	vec4 _SpecularMap_ST;
uniform 	vec4 _Speccolor;
uniform 	float _SpecIntensity;
uniform 	float _Gloss;
uniform 	float _Transparency;
uniform  sampler2D _NormalMap;
uniform  sampler2D _SpecularMap;
uniform  sampler2D _DiffuseMapTransA;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
float u_xlat3;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_0 = texture(_NormalMap, u_xlat0.xy);
    u_xlat16_0.xz = u_xlat10_0.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat10_0.wy + u_xlat10_0.wy;
    u_xlat16_0.x = dot(u_xlat16_0.xz, u_xlat16_0.xz);
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat1.z = sqrt(u_xlat16_0.x);
    u_xlat0.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = vec3(_NormalIntensity) * u_xlat0.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD6.xyz;
    u_xlat0.xyw = u_xlat0.xxx * vs_TEXCOORD5.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat10 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0u)) ? 1.0 : -1.0;
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat1.xyz + u_xlat0.xyw;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 0.0);
    u_xlat1.xyz = vec3(u_xlat9) * _LightColor0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat3 = _Gloss * 10.0 + 1.0;
    u_xlat3 = exp2(u_xlat3);
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
    u_xlat10_2 = texture(_SpecularMap, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_SpecIntensity);
    u_xlat2.xyz = u_xlat2.xyz * _Speccolor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _DiffuseMapTransA_ST.xy + _DiffuseMapTransA_ST.zw;
    u_xlat10_2 = texture(_DiffuseMapTransA, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * _Diffusecolor.xyz;
    u_xlat9 = u_xlat10_2.w * _Transparency;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    SV_Target0.w = 0.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 57 math, 5 textures, 2 branches
Keywords { "SPOT" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"#version 120

#ifdef VERTEX

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_WorldToLight;
attribute vec4 TANGENT;
varying vec2 xlv_TEXCOORD0;
varying vec2 xlv_TEXCOORD1;
varying vec2 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec4 xlv_TEXCOORD7;
void main ()
{
  vec4 v_1;
  v_1.x = unity_WorldToObject[0].x;
  v_1.y = unity_WorldToObject[1].x;
  v_1.z = unity_WorldToObject[2].x;
  v_1.w = unity_WorldToObject[3].x;
  vec4 v_2;
  v_2.x = unity_WorldToObject[0].y;
  v_2.y = unity_WorldToObject[1].y;
  v_2.z = unity_WorldToObject[2].y;
  v_2.w = unity_WorldToObject[3].y;
  vec4 v_3;
  v_3.x = unity_WorldToObject[0].z;
  v_3.y = unity_WorldToObject[1].z;
  v_3.z = unity_WorldToObject[2].z;
  v_3.w = unity_WorldToObject[3].z;
  vec3 tmpvar_4;
  tmpvar_4 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = TANGENT.xyz;
  vec3 tmpvar_6;
  tmpvar_6 = normalize((unity_ObjectToWorld * tmpvar_5).xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = gl_MultiTexCoord0.xy;
  xlv_TEXCOORD1 = gl_MultiTexCoord1.xy;
  xlv_TEXCOORD2 = gl_MultiTexCoord2.xy;
  vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * gl_Vertex);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * TANGENT.w));
  xlv_TEXCOORD7 = (unity_WorldToLight * tmpvar_7);
}


#endif
#ifdef FRAGMENT
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform vec4 _LightColor0;
uniform sampler2D _DiffuseMapTransA;
uniform vec4 _DiffuseMapTransA_ST;
uniform vec4 _Diffusecolor;
uniform sampler2D _NormalMap;
uniform vec4 _NormalMap_ST;
uniform float _NormalIntensity;
uniform sampler2D _SpecularMap;
uniform vec4 _SpecularMap_ST;
uniform vec4 _Speccolor;
uniform float _SpecIntensity;
uniform float _Gloss;
uniform float _Transparency;
varying vec2 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec4 xlv_TEXCOORD7;
void main ()
{
  float tmpvar_1;
  if (gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD4;
  int tmpvar_3;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_3 = 1;
  } else {
    tmpvar_3 = -1;
  };
  tmpvar_2 = (normalize(xlv_TEXCOORD4) * float(tmpvar_3));
  mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD5.x;
  tmpvar_4[0].y = xlv_TEXCOORD6.x;
  tmpvar_4[0].z = tmpvar_2.x;
  tmpvar_4[1].x = xlv_TEXCOORD5.y;
  tmpvar_4[1].y = xlv_TEXCOORD6.y;
  tmpvar_4[1].z = tmpvar_2.y;
  tmpvar_4[2].x = xlv_TEXCOORD5.z;
  tmpvar_4[2].y = xlv_TEXCOORD6.z;
  tmpvar_4[2].z = tmpvar_2.z;
  vec3 normal_5;
  normal_5.xy = ((texture2D (_NormalMap, (
    (xlv_TEXCOORD0 * _NormalMap_ST.xy)
   + _NormalMap_ST.zw)).wy * 2.0) - 1.0);
  normal_5.z = sqrt((1.0 - clamp (
    dot (normal_5.xy, normal_5.xy)
  , 0.0, 1.0)));
  vec3 tmpvar_6;
  tmpvar_6 = normalize((mix (vec3(0.0, 0.0, 1.0), normal_5, vec3(_NormalIntensity)) * tmpvar_4));
  vec3 tmpvar_7;
  tmpvar_7 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3.xyz), _WorldSpaceLightPos0.www));
  vec3 tmpvar_8;
  tmpvar_8 = (((
    float((xlv_TEXCOORD7.z > 0.0))
   * texture2D (_LightTexture0, 
    ((xlv_TEXCOORD7.xy / xlv_TEXCOORD7.w) + 0.5)
  ).w) * texture2D (_LightTextureB0, vec2(dot (xlv_TEXCOORD7.xyz, xlv_TEXCOORD7.xyz))).w) * _LightColor0.xyz);
  vec4 tmpvar_9;
  tmpvar_9 = texture2D (_DiffuseMapTransA, ((xlv_TEXCOORD0 * _DiffuseMapTransA_ST.xy) + _DiffuseMapTransA_ST.zw));
  vec4 tmpvar_10;
  tmpvar_10.w = 0.0;
  tmpvar_10.xyz = (((
    (max (0.0, dot (tmpvar_6, tmpvar_7)) * tmpvar_8)
   * 
    (tmpvar_9.xyz * _Diffusecolor.xyz)
  ) + (
    (tmpvar_8 * pow (max (0.0, dot (
      normalize((normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3.xyz)) + tmpvar_7))
    , tmpvar_6)), exp2((
      (_Gloss * 10.0)
     + 1.0))))
   * 
    ((texture2D (_SpecularMap, ((xlv_TEXCOORD0 * _SpecularMap_ST.xy) + _SpecularMap_ST.zw)).xyz * _SpecIntensity) * _Speccolor.xyz)
  )) * (tmpvar_9.w * _Transparency));
  gl_FragData[0] = tmpvar_10;
}


#endif
"
}
SubProgram "metal " {
// Stats: 17 math
Keywords { "SPOT" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
Bind "texcoord2" ATTR5
ConstBuffer "$Globals" 256
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [unity_ObjectToWorld]
Matrix 128 [unity_WorldToObject]
Matrix 192 [unity_WorldToLight]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
  float4 _glesMultiTexCoord2 [[attribute(5)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float4 xlv_TEXCOORD7;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4x4 unity_ObjectToWorld;
  float4x4 unity_WorldToObject;
  float4x4 unity_WorldToLight;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 v_1 = 0;
  v_1.x = _mtl_u.unity_WorldToObject[0].x;
  v_1.y = _mtl_u.unity_WorldToObject[1].x;
  v_1.z = _mtl_u.unity_WorldToObject[2].x;
  v_1.w = _mtl_u.unity_WorldToObject[3].x;
  float4 v_2 = 0;
  v_2.x = _mtl_u.unity_WorldToObject[0].y;
  v_2.y = _mtl_u.unity_WorldToObject[1].y;
  v_2.z = _mtl_u.unity_WorldToObject[2].y;
  v_2.w = _mtl_u.unity_WorldToObject[3].y;
  float4 v_3 = 0;
  v_3.x = _mtl_u.unity_WorldToObject[0].z;
  v_3.y = _mtl_u.unity_WorldToObject[1].z;
  v_3.z = _mtl_u.unity_WorldToObject[2].z;
  v_3.w = _mtl_u.unity_WorldToObject[3].z;
  float3 tmpvar_4 = 0;
  tmpvar_4 = normalize(((
    (v_1.xyz * _mtl_i._glesNormal.x)
   + 
    (v_2.xyz * _mtl_i._glesNormal.y)
  ) + (v_3.xyz * _mtl_i._glesNormal.z)));
  float4 tmpvar_5 = 0;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _mtl_i._glesTANGENT.xyz;
  float3 tmpvar_6 = 0;
  tmpvar_6 = normalize((_mtl_u.unity_ObjectToWorld * tmpvar_5).xyz);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = _mtl_i._glesMultiTexCoord0.xy;
  _mtl_o.xlv_TEXCOORD1 = _mtl_i._glesMultiTexCoord1.xy;
  _mtl_o.xlv_TEXCOORD2 = _mtl_i._glesMultiTexCoord2.xy;
  float4 tmpvar_7 = 0;
  tmpvar_7 = (_mtl_u.unity_ObjectToWorld * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD3 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD4 = tmpvar_4;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * _mtl_i._glesTANGENT.w));
  _mtl_o.xlv_TEXCOORD7 = (_mtl_u.unity_WorldToLight * tmpvar_7);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "SPOT" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec2 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat1.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat1.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat1.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat2.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat2.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat2.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD5.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD6.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD7 = hlslcc_mtx4unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DiffuseMapTransA_ST;
uniform 	vec4 _Diffusecolor;
uniform 	vec4 _NormalMap_ST;
uniform 	float _NormalIntensity;
uniform 	vec4 _SpecularMap_ST;
uniform 	vec4 _Speccolor;
uniform 	float _SpecIntensity;
uniform 	float _Gloss;
uniform 	float _Transparency;
uniform  sampler2D _NormalMap;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler2D _SpecularMap;
uniform  sampler2D _DiffuseMapTransA;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
in  vec4 vs_TEXCOORD7;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec2 u_xlat3;
bool u_xlatb3;
float u_xlat6;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_0 = texture(_NormalMap, u_xlat0.xy);
    u_xlat16_0.xz = u_xlat10_0.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat10_0.wy + u_xlat10_0.wy;
    u_xlat16_0.x = dot(u_xlat16_0.xz, u_xlat16_0.xz);
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat1.z = sqrt(u_xlat16_0.x);
    u_xlat0.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = vec3(_NormalIntensity) * u_xlat0.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD6.xyz;
    u_xlat0.xyw = u_xlat0.xxx * vs_TEXCOORD5.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat10 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0u)) ? 1.0 : -1.0;
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat1.xyz + u_xlat0.xyw;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlat0.w = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.xw = max(u_xlat0.xw, vec2(0.0, 0.0));
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat3.x = _Gloss * 10.0 + 1.0;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat3.xy = vs_TEXCOORD7.xy / vs_TEXCOORD7.ww;
    u_xlat3.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat10_1 = texture(_LightTexture0, u_xlat3.xy);
    u_xlatb3 = 0.0<vs_TEXCOORD7.z;
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat3.x = u_xlat10_1.w * u_xlat3.x;
    u_xlat6 = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
    u_xlat10_1 = texture(_LightTextureB0, vec2(u_xlat6));
    u_xlat3.x = u_xlat3.x * u_xlat10_1.w;
    u_xlat1.xyz = u_xlat3.xxx * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.www * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
    u_xlat10_2 = texture(_SpecularMap, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_SpecIntensity);
    u_xlat2.xyz = u_xlat2.xyz * _Speccolor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _DiffuseMapTransA_ST.xy + _DiffuseMapTransA_ST.zw;
    u_xlat10_2 = texture(_DiffuseMapTransA, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * _Diffusecolor.xyz;
    u_xlat9 = u_xlat10_2.w * _Transparency;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    SV_Target0.w = 0.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 52 math, 5 textures, 2 branches
Keywords { "POINT_COOKIE" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"#version 120

#ifdef VERTEX

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_WorldToLight;
attribute vec4 TANGENT;
varying vec2 xlv_TEXCOORD0;
varying vec2 xlv_TEXCOORD1;
varying vec2 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec3 xlv_TEXCOORD7;
void main ()
{
  vec4 v_1;
  v_1.x = unity_WorldToObject[0].x;
  v_1.y = unity_WorldToObject[1].x;
  v_1.z = unity_WorldToObject[2].x;
  v_1.w = unity_WorldToObject[3].x;
  vec4 v_2;
  v_2.x = unity_WorldToObject[0].y;
  v_2.y = unity_WorldToObject[1].y;
  v_2.z = unity_WorldToObject[2].y;
  v_2.w = unity_WorldToObject[3].y;
  vec4 v_3;
  v_3.x = unity_WorldToObject[0].z;
  v_3.y = unity_WorldToObject[1].z;
  v_3.z = unity_WorldToObject[2].z;
  v_3.w = unity_WorldToObject[3].z;
  vec3 tmpvar_4;
  tmpvar_4 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = TANGENT.xyz;
  vec3 tmpvar_6;
  tmpvar_6 = normalize((unity_ObjectToWorld * tmpvar_5).xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = gl_MultiTexCoord0.xy;
  xlv_TEXCOORD1 = gl_MultiTexCoord1.xy;
  xlv_TEXCOORD2 = gl_MultiTexCoord2.xy;
  vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * gl_Vertex);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * TANGENT.w));
  xlv_TEXCOORD7 = (unity_WorldToLight * tmpvar_7).xyz;
}


#endif
#ifdef FRAGMENT
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform vec4 _LightColor0;
uniform sampler2D _DiffuseMapTransA;
uniform vec4 _DiffuseMapTransA_ST;
uniform vec4 _Diffusecolor;
uniform sampler2D _NormalMap;
uniform vec4 _NormalMap_ST;
uniform float _NormalIntensity;
uniform sampler2D _SpecularMap;
uniform vec4 _SpecularMap_ST;
uniform vec4 _Speccolor;
uniform float _SpecIntensity;
uniform float _Gloss;
uniform float _Transparency;
varying vec2 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec3 xlv_TEXCOORD7;
void main ()
{
  float tmpvar_1;
  if (gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD4;
  int tmpvar_3;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_3 = 1;
  } else {
    tmpvar_3 = -1;
  };
  tmpvar_2 = (normalize(xlv_TEXCOORD4) * float(tmpvar_3));
  mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD5.x;
  tmpvar_4[0].y = xlv_TEXCOORD6.x;
  tmpvar_4[0].z = tmpvar_2.x;
  tmpvar_4[1].x = xlv_TEXCOORD5.y;
  tmpvar_4[1].y = xlv_TEXCOORD6.y;
  tmpvar_4[1].z = tmpvar_2.y;
  tmpvar_4[2].x = xlv_TEXCOORD5.z;
  tmpvar_4[2].y = xlv_TEXCOORD6.z;
  tmpvar_4[2].z = tmpvar_2.z;
  vec3 normal_5;
  normal_5.xy = ((texture2D (_NormalMap, (
    (xlv_TEXCOORD0 * _NormalMap_ST.xy)
   + _NormalMap_ST.zw)).wy * 2.0) - 1.0);
  normal_5.z = sqrt((1.0 - clamp (
    dot (normal_5.xy, normal_5.xy)
  , 0.0, 1.0)));
  vec3 tmpvar_6;
  tmpvar_6 = normalize((mix (vec3(0.0, 0.0, 1.0), normal_5, vec3(_NormalIntensity)) * tmpvar_4));
  vec3 tmpvar_7;
  tmpvar_7 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3.xyz), _WorldSpaceLightPos0.www));
  vec3 tmpvar_8;
  tmpvar_8 = ((texture2D (_LightTextureB0, vec2(dot (xlv_TEXCOORD7, xlv_TEXCOORD7))).w * textureCube (_LightTexture0, xlv_TEXCOORD7).w) * _LightColor0.xyz);
  vec4 tmpvar_9;
  tmpvar_9 = texture2D (_DiffuseMapTransA, ((xlv_TEXCOORD0 * _DiffuseMapTransA_ST.xy) + _DiffuseMapTransA_ST.zw));
  vec4 tmpvar_10;
  tmpvar_10.w = 0.0;
  tmpvar_10.xyz = (((
    (max (0.0, dot (tmpvar_6, tmpvar_7)) * tmpvar_8)
   * 
    (tmpvar_9.xyz * _Diffusecolor.xyz)
  ) + (
    (tmpvar_8 * pow (max (0.0, dot (
      normalize((normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3.xyz)) + tmpvar_7))
    , tmpvar_6)), exp2((
      (_Gloss * 10.0)
     + 1.0))))
   * 
    ((texture2D (_SpecularMap, ((xlv_TEXCOORD0 * _SpecularMap_ST.xy) + _SpecularMap_ST.zw)).xyz * _SpecIntensity) * _Speccolor.xyz)
  )) * (tmpvar_9.w * _Transparency));
  gl_FragData[0] = tmpvar_10;
}


#endif
"
}
SubProgram "metal " {
// Stats: 17 math
Keywords { "POINT_COOKIE" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
Bind "texcoord2" ATTR5
ConstBuffer "$Globals" 256
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [unity_ObjectToWorld]
Matrix 128 [unity_WorldToObject]
Matrix 192 [unity_WorldToLight]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
  float4 _glesMultiTexCoord2 [[attribute(5)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float3 xlv_TEXCOORD7;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4x4 unity_ObjectToWorld;
  float4x4 unity_WorldToObject;
  float4x4 unity_WorldToLight;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 v_1 = 0;
  v_1.x = _mtl_u.unity_WorldToObject[0].x;
  v_1.y = _mtl_u.unity_WorldToObject[1].x;
  v_1.z = _mtl_u.unity_WorldToObject[2].x;
  v_1.w = _mtl_u.unity_WorldToObject[3].x;
  float4 v_2 = 0;
  v_2.x = _mtl_u.unity_WorldToObject[0].y;
  v_2.y = _mtl_u.unity_WorldToObject[1].y;
  v_2.z = _mtl_u.unity_WorldToObject[2].y;
  v_2.w = _mtl_u.unity_WorldToObject[3].y;
  float4 v_3 = 0;
  v_3.x = _mtl_u.unity_WorldToObject[0].z;
  v_3.y = _mtl_u.unity_WorldToObject[1].z;
  v_3.z = _mtl_u.unity_WorldToObject[2].z;
  v_3.w = _mtl_u.unity_WorldToObject[3].z;
  float3 tmpvar_4 = 0;
  tmpvar_4 = normalize(((
    (v_1.xyz * _mtl_i._glesNormal.x)
   + 
    (v_2.xyz * _mtl_i._glesNormal.y)
  ) + (v_3.xyz * _mtl_i._glesNormal.z)));
  float4 tmpvar_5 = 0;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _mtl_i._glesTANGENT.xyz;
  float3 tmpvar_6 = 0;
  tmpvar_6 = normalize((_mtl_u.unity_ObjectToWorld * tmpvar_5).xyz);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = _mtl_i._glesMultiTexCoord0.xy;
  _mtl_o.xlv_TEXCOORD1 = _mtl_i._glesMultiTexCoord1.xy;
  _mtl_o.xlv_TEXCOORD2 = _mtl_i._glesMultiTexCoord2.xy;
  float4 tmpvar_7 = 0;
  tmpvar_7 = (_mtl_u.unity_ObjectToWorld * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD3 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD4 = tmpvar_4;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * _mtl_i._glesTANGENT.w));
  _mtl_o.xlv_TEXCOORD7 = (_mtl_u.unity_WorldToLight * tmpvar_7).xyz;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec2 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
out vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat1.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat1.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat1.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat2.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat2.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat2.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat2.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat2.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD5.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD6.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DiffuseMapTransA_ST;
uniform 	vec4 _Diffusecolor;
uniform 	vec4 _NormalMap_ST;
uniform 	float _NormalIntensity;
uniform 	vec4 _SpecularMap_ST;
uniform 	vec4 _Speccolor;
uniform 	float _SpecIntensity;
uniform 	float _Gloss;
uniform 	float _Transparency;
uniform  sampler2D _NormalMap;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  sampler2D _SpecularMap;
uniform  sampler2D _DiffuseMapTransA;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
in  vec3 vs_TEXCOORD7;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
float u_xlat3;
mediump float u_xlat16_3;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_0 = texture(_NormalMap, u_xlat0.xy);
    u_xlat16_0.xz = u_xlat10_0.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat10_0.wy + u_xlat10_0.wy;
    u_xlat16_0.x = dot(u_xlat16_0.xz, u_xlat16_0.xz);
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat1.z = sqrt(u_xlat16_0.x);
    u_xlat0.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = vec3(_NormalIntensity) * u_xlat0.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD6.xyz;
    u_xlat0.xyw = u_xlat0.xxx * vs_TEXCOORD5.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat10 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0u)) ? 1.0 : -1.0;
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat1.xyz + u_xlat0.xyw;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlat0.w = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.xw = max(u_xlat0.xw, vec2(0.0, 0.0));
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat3 = _Gloss * 10.0 + 1.0;
    u_xlat3 = exp2(u_xlat3);
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat3 = dot(vs_TEXCOORD7.xyz, vs_TEXCOORD7.xyz);
    u_xlat10_1 = texture(_LightTextureB0, vec2(u_xlat3));
    u_xlat10_2 = texture(_LightTexture0, vs_TEXCOORD7.xyz);
    u_xlat16_3 = u_xlat10_1.w * u_xlat10_2.w;
    u_xlat1.xyz = vec3(u_xlat16_3) * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.www * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
    u_xlat10_2 = texture(_SpecularMap, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_SpecIntensity);
    u_xlat2.xyz = u_xlat2.xyz * _Speccolor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _DiffuseMapTransA_ST.xy + _DiffuseMapTransA_ST.zw;
    u_xlat10_2 = texture(_DiffuseMapTransA, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * _Diffusecolor.xyz;
    u_xlat9 = u_xlat10_2.w * _Transparency;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    SV_Target0.w = 0.0;
    return;
}
#endif
"
}
SubProgram "opengl " {
// Stats: 50 math, 4 textures, 2 branches
Keywords { "DIRECTIONAL_COOKIE" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"#version 120

#ifdef VERTEX

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_WorldToLight;
attribute vec4 TANGENT;
varying vec2 xlv_TEXCOORD0;
varying vec2 xlv_TEXCOORD1;
varying vec2 xlv_TEXCOORD2;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec2 xlv_TEXCOORD7;
void main ()
{
  vec4 v_1;
  v_1.x = unity_WorldToObject[0].x;
  v_1.y = unity_WorldToObject[1].x;
  v_1.z = unity_WorldToObject[2].x;
  v_1.w = unity_WorldToObject[3].x;
  vec4 v_2;
  v_2.x = unity_WorldToObject[0].y;
  v_2.y = unity_WorldToObject[1].y;
  v_2.z = unity_WorldToObject[2].y;
  v_2.w = unity_WorldToObject[3].y;
  vec4 v_3;
  v_3.x = unity_WorldToObject[0].z;
  v_3.y = unity_WorldToObject[1].z;
  v_3.z = unity_WorldToObject[2].z;
  v_3.w = unity_WorldToObject[3].z;
  vec3 tmpvar_4;
  tmpvar_4 = normalize(((
    (v_1.xyz * gl_Normal.x)
   + 
    (v_2.xyz * gl_Normal.y)
  ) + (v_3.xyz * gl_Normal.z)));
  vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = TANGENT.xyz;
  vec3 tmpvar_6;
  tmpvar_6 = normalize((unity_ObjectToWorld * tmpvar_5).xyz);
  gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
  xlv_TEXCOORD0 = gl_MultiTexCoord0.xy;
  xlv_TEXCOORD1 = gl_MultiTexCoord1.xy;
  xlv_TEXCOORD2 = gl_MultiTexCoord2.xy;
  vec4 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * gl_Vertex);
  xlv_TEXCOORD3 = tmpvar_7;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * TANGENT.w));
  xlv_TEXCOORD7 = (unity_WorldToLight * tmpvar_7).xy;
}


#endif
#ifdef FRAGMENT
uniform vec3 _WorldSpaceCameraPos;
uniform vec4 _WorldSpaceLightPos0;
uniform sampler2D _LightTexture0;
uniform vec4 _LightColor0;
uniform sampler2D _DiffuseMapTransA;
uniform vec4 _DiffuseMapTransA_ST;
uniform vec4 _Diffusecolor;
uniform sampler2D _NormalMap;
uniform vec4 _NormalMap_ST;
uniform float _NormalIntensity;
uniform sampler2D _SpecularMap;
uniform vec4 _SpecularMap_ST;
uniform vec4 _Speccolor;
uniform float _SpecIntensity;
uniform float _Gloss;
uniform float _Transparency;
varying vec2 xlv_TEXCOORD0;
varying vec4 xlv_TEXCOORD3;
varying vec3 xlv_TEXCOORD4;
varying vec3 xlv_TEXCOORD5;
varying vec3 xlv_TEXCOORD6;
varying vec2 xlv_TEXCOORD7;
void main ()
{
  float tmpvar_1;
  if (gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  vec3 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD4;
  int tmpvar_3;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_3 = 1;
  } else {
    tmpvar_3 = -1;
  };
  tmpvar_2 = (normalize(xlv_TEXCOORD4) * float(tmpvar_3));
  mat3 tmpvar_4;
  tmpvar_4[0].x = xlv_TEXCOORD5.x;
  tmpvar_4[0].y = xlv_TEXCOORD6.x;
  tmpvar_4[0].z = tmpvar_2.x;
  tmpvar_4[1].x = xlv_TEXCOORD5.y;
  tmpvar_4[1].y = xlv_TEXCOORD6.y;
  tmpvar_4[1].z = tmpvar_2.y;
  tmpvar_4[2].x = xlv_TEXCOORD5.z;
  tmpvar_4[2].y = xlv_TEXCOORD6.z;
  tmpvar_4[2].z = tmpvar_2.z;
  vec3 normal_5;
  normal_5.xy = ((texture2D (_NormalMap, (
    (xlv_TEXCOORD0 * _NormalMap_ST.xy)
   + _NormalMap_ST.zw)).wy * 2.0) - 1.0);
  normal_5.z = sqrt((1.0 - clamp (
    dot (normal_5.xy, normal_5.xy)
  , 0.0, 1.0)));
  vec3 tmpvar_6;
  tmpvar_6 = normalize((mix (vec3(0.0, 0.0, 1.0), normal_5, vec3(_NormalIntensity)) * tmpvar_4));
  vec3 tmpvar_7;
  tmpvar_7 = normalize(mix (_WorldSpaceLightPos0.xyz, (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD3.xyz), _WorldSpaceLightPos0.www));
  vec3 tmpvar_8;
  tmpvar_8 = (texture2D (_LightTexture0, xlv_TEXCOORD7).w * _LightColor0.xyz);
  vec4 tmpvar_9;
  tmpvar_9 = texture2D (_DiffuseMapTransA, ((xlv_TEXCOORD0 * _DiffuseMapTransA_ST.xy) + _DiffuseMapTransA_ST.zw));
  vec4 tmpvar_10;
  tmpvar_10.w = 0.0;
  tmpvar_10.xyz = (((
    (max (0.0, dot (tmpvar_6, tmpvar_7)) * tmpvar_8)
   * 
    (tmpvar_9.xyz * _Diffusecolor.xyz)
  ) + (
    (tmpvar_8 * pow (max (0.0, dot (
      normalize((normalize((_WorldSpaceCameraPos - xlv_TEXCOORD3.xyz)) + tmpvar_7))
    , tmpvar_6)), exp2((
      (_Gloss * 10.0)
     + 1.0))))
   * 
    ((texture2D (_SpecularMap, ((xlv_TEXCOORD0 * _SpecularMap_ST.xy) + _SpecularMap_ST.zw)).xyz * _SpecIntensity) * _Speccolor.xyz)
  )) * (tmpvar_9.w * _Transparency));
  gl_FragData[0] = tmpvar_10;
}


#endif
"
}
SubProgram "metal " {
// Stats: 17 math
Keywords { "DIRECTIONAL_COOKIE" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
Bind "tangent" ATTR0
Bind "vertex" ATTR1
Bind "normal" ATTR2
Bind "texcoord" ATTR3
Bind "texcoord1" ATTR4
Bind "texcoord2" ATTR5
ConstBuffer "$Globals" 256
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [unity_ObjectToWorld]
Matrix 128 [unity_WorldToObject]
Matrix 192 [unity_WorldToLight]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  float4 _glesTANGENT [[attribute(0)]];
  float4 _glesVertex [[attribute(1)]];
  float3 _glesNormal [[attribute(2)]];
  float4 _glesMultiTexCoord0 [[attribute(3)]];
  float4 _glesMultiTexCoord1 [[attribute(4)]];
  float4 _glesMultiTexCoord2 [[attribute(5)]];
};
struct xlatMtlShaderOutput {
  float4 gl_Position [[position]];
  float2 xlv_TEXCOORD0;
  float2 xlv_TEXCOORD1;
  float2 xlv_TEXCOORD2;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float2 xlv_TEXCOORD7;
};
struct xlatMtlShaderUniform {
  float4x4 glstate_matrix_mvp;
  float4x4 unity_ObjectToWorld;
  float4x4 unity_WorldToObject;
  float4x4 unity_WorldToLight;
};
vertex xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]])
{
  xlatMtlShaderOutput _mtl_o;
  float4 v_1 = 0;
  v_1.x = _mtl_u.unity_WorldToObject[0].x;
  v_1.y = _mtl_u.unity_WorldToObject[1].x;
  v_1.z = _mtl_u.unity_WorldToObject[2].x;
  v_1.w = _mtl_u.unity_WorldToObject[3].x;
  float4 v_2 = 0;
  v_2.x = _mtl_u.unity_WorldToObject[0].y;
  v_2.y = _mtl_u.unity_WorldToObject[1].y;
  v_2.z = _mtl_u.unity_WorldToObject[2].y;
  v_2.w = _mtl_u.unity_WorldToObject[3].y;
  float4 v_3 = 0;
  v_3.x = _mtl_u.unity_WorldToObject[0].z;
  v_3.y = _mtl_u.unity_WorldToObject[1].z;
  v_3.z = _mtl_u.unity_WorldToObject[2].z;
  v_3.w = _mtl_u.unity_WorldToObject[3].z;
  float3 tmpvar_4 = 0;
  tmpvar_4 = normalize(((
    (v_1.xyz * _mtl_i._glesNormal.x)
   + 
    (v_2.xyz * _mtl_i._glesNormal.y)
  ) + (v_3.xyz * _mtl_i._glesNormal.z)));
  float4 tmpvar_5 = 0;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = _mtl_i._glesTANGENT.xyz;
  float3 tmpvar_6 = 0;
  tmpvar_6 = normalize((_mtl_u.unity_ObjectToWorld * tmpvar_5).xyz);
  _mtl_o.gl_Position = (_mtl_u.glstate_matrix_mvp * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD0 = _mtl_i._glesMultiTexCoord0.xy;
  _mtl_o.xlv_TEXCOORD1 = _mtl_i._glesMultiTexCoord1.xy;
  _mtl_o.xlv_TEXCOORD2 = _mtl_i._glesMultiTexCoord2.xy;
  float4 tmpvar_7 = 0;
  tmpvar_7 = (_mtl_u.unity_ObjectToWorld * _mtl_i._glesVertex);
  _mtl_o.xlv_TEXCOORD3 = tmpvar_7;
  _mtl_o.xlv_TEXCOORD4 = tmpvar_4;
  _mtl_o.xlv_TEXCOORD5 = tmpvar_6;
  _mtl_o.xlv_TEXCOORD6 = normalize(((
    (tmpvar_4.yzx * tmpvar_6.zxy)
   - 
    (tmpvar_4.zxy * tmpvar_6.yzx)
  ) * _mtl_i._glesTANGENT.w));
  _mtl_o.xlv_TEXCOORD7 = (_mtl_u.unity_WorldToLight * tmpvar_7).xy;
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 hlslcc_mtx4glstate_matrix_mvp[4];
uniform 	vec4 hlslcc_mtx4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4unity_WorldToLight[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TANGENT0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec2 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out vec2 vs_TEXCOORD7;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4glstate_matrix_mvp[1];
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4unity_WorldToLight[1].xy;
    u_xlat1.xy = hlslcc_mtx4unity_WorldToLight[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4unity_WorldToLight[2].xy * u_xlat0.zz + u_xlat1.xy;
    vs_TEXCOORD7.xy = hlslcc_mtx4unity_WorldToLight[3].xy * u_xlat0.ww + u_xlat1.xy;
    vs_TEXCOORD3 = u_xlat0;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat0.x = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[0].x;
    u_xlat0.y = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[1].x;
    u_xlat0.z = in_NORMAL0.x * hlslcc_mtx4unity_WorldToObject[2].x;
    u_xlat1.x = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[0].y;
    u_xlat1.y = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[1].y;
    u_xlat1.z = in_NORMAL0.y * hlslcc_mtx4unity_WorldToObject[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[0].z;
    u_xlat1.y = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[1].z;
    u_xlat1.z = in_NORMAL0.z * hlslcc_mtx4unity_WorldToObject[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD6.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightColor0;
uniform 	vec4 _DiffuseMapTransA_ST;
uniform 	vec4 _Diffusecolor;
uniform 	vec4 _NormalMap_ST;
uniform 	float _NormalIntensity;
uniform 	vec4 _SpecularMap_ST;
uniform 	vec4 _Speccolor;
uniform 	float _SpecIntensity;
uniform 	float _Gloss;
uniform 	float _Transparency;
uniform  sampler2D _NormalMap;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _SpecularMap;
uniform  sampler2D _DiffuseMapTransA;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD7;
in  vec4 vs_TEXCOORD3;
in  vec3 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
float u_xlat3;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_0 = texture(_NormalMap, u_xlat0.xy);
    u_xlat16_0.xz = u_xlat10_0.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat10_0.wy + u_xlat10_0.wy;
    u_xlat16_0.x = dot(u_xlat16_0.xz, u_xlat16_0.xz);
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat1.z = sqrt(u_xlat16_0.x);
    u_xlat0.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = vec3(_NormalIntensity) * u_xlat0.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD6.xyz;
    u_xlat0.xyw = u_xlat0.xxx * vs_TEXCOORD5.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat10 = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0u)) ? 1.0 : -1.0;
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat1.xyz + u_xlat0.xyw;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD3.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlat0.w = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.xw = max(u_xlat0.xw, vec2(0.0, 0.0));
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat3 = _Gloss * 10.0 + 1.0;
    u_xlat3 = exp2(u_xlat3);
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat10_1 = texture(_LightTexture0, vs_TEXCOORD7.xy);
    u_xlat1.xyz = u_xlat10_1.www * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.www * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _SpecularMap_ST.xy + _SpecularMap_ST.zw;
    u_xlat10_2 = texture(_SpecularMap, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_SpecIntensity);
    u_xlat2.xyz = u_xlat2.xyz * _Speccolor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _DiffuseMapTransA_ST.xy + _DiffuseMapTransA_ST.zw;
    u_xlat10_2 = texture(_DiffuseMapTransA, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * _Diffusecolor.xyz;
    u_xlat9 = u_xlat10_2.w * _Transparency;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    SV_Target0.w = 0.0;
    return;
}
#endif
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "POINT" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 51 math, 4 textures, 2 branches
Keywords { "POINT" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_DiffuseMapTransA] 2D 1
SetTexture 2 [_NormalMap] 2D 2
SetTexture 3 [_SpecularMap] 2D 3
ConstBuffer "$Globals" 156
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_WorldSpaceLightPos0]
VectorHalf 32 [_LightColor0] 4
Vector 48 [_DiffuseMapTransA_ST]
Vector 64 [_Diffusecolor]
Vector 80 [_NormalMap_ST]
Float 96 [_NormalIntensity]
Vector 112 [_SpecularMap_ST]
Vector 128 [_Speccolor]
Float 144 [_SpecIntensity]
Float 148 [_Gloss]
Float 152 [_Transparency]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  bool gl_FrontFacing [[front_facing]];
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float3 xlv_TEXCOORD7;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _WorldSpaceLightPos0;
  half4 _LightColor0;
  float4 _DiffuseMapTransA_ST;
  float4 _Diffusecolor;
  float4 _NormalMap_ST;
  float _NormalIntensity;
  float4 _SpecularMap_ST;
  float4 _Speccolor;
  float _SpecIntensity;
  float _Gloss;
  float _Transparency;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _LightTexture0 [[texture(0)]], sampler _mtlsmp__LightTexture0 [[sampler(0)]]
  ,   texture2d<half> _DiffuseMapTransA [[texture(1)]], sampler _mtlsmp__DiffuseMapTransA [[sampler(1)]]
  ,   texture2d<half> _NormalMap [[texture(2)]], sampler _mtlsmp__NormalMap [[sampler(2)]]
  ,   texture2d<half> _SpecularMap [[texture(3)]], sampler _mtlsmp__SpecularMap [[sampler(3)]])
{
  xlatMtlShaderOutput _mtl_o;
  float tmpvar_1 = 0;
  if (_mtl_i.gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  float4 tmpvar_2 = 0;
  float3 tmpvar_3 = 0;
  tmpvar_3 = _mtl_i.xlv_TEXCOORD4;
  half4 finalRGBA_4 = 0;
  float4 _DiffuseMapTransA_var_5 = 0;
  float4 _SpecularMap_var_6 = 0;
  float attenuation_7 = 0;
  float3 _NormalMap_var_8 = 0;
  int tmpvar_9 = 0;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_9 = 1;
  } else {
    tmpvar_9 = -1;
  };
  tmpvar_3 = (normalize(_mtl_i.xlv_TEXCOORD4) * float(tmpvar_9));
  float3x3 tmpvar_10;
  tmpvar_10[0].x = _mtl_i.xlv_TEXCOORD5.x;
  tmpvar_10[0].y = _mtl_i.xlv_TEXCOORD6.x;
  tmpvar_10[0].z = tmpvar_3.x;
  tmpvar_10[1].x = _mtl_i.xlv_TEXCOORD5.y;
  tmpvar_10[1].y = _mtl_i.xlv_TEXCOORD6.y;
  tmpvar_10[1].z = tmpvar_3.y;
  tmpvar_10[2].x = _mtl_i.xlv_TEXCOORD5.z;
  tmpvar_10[2].y = _mtl_i.xlv_TEXCOORD6.z;
  tmpvar_10[2].z = tmpvar_3.z;
  float2 P_11 = 0;
  P_11 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._NormalMap_ST.xy) + _mtl_u._NormalMap_ST.zw);
  half3 normal_12 = 0;
  normal_12.xy = ((_NormalMap.sample(_mtlsmp__NormalMap, (float2)(P_11)).wy * (half)(2.0)) - (half)(1.0));
  normal_12.z = sqrt(((half)(1.0) - clamp (
    dot (normal_12.xy, normal_12.xy)
  , (half)0.0, (half)1.0)));
  _NormalMap_var_8 = float3(normal_12);
  float3 tmpvar_13 = 0;
  tmpvar_13 = normalize((mix (float3(0.0, 0.0, 1.0), _NormalMap_var_8, float3(_mtl_u._NormalIntensity)) * tmpvar_10));
  float3 tmpvar_14 = 0;
  tmpvar_14 = normalize(mix (_mtl_u._WorldSpaceLightPos0.xyz, (_mtl_u._WorldSpaceLightPos0.xyz - _mtl_i.xlv_TEXCOORD3.xyz), _mtl_u._WorldSpaceLightPos0.www));
  float tmpvar_15 = 0;
  tmpvar_15 = dot (_mtl_i.xlv_TEXCOORD7, _mtl_i.xlv_TEXCOORD7);
  half tmpvar_16 = 0;
  tmpvar_16 = _LightTexture0.sample(_mtlsmp__LightTexture0, (float2)(float2(tmpvar_15))).w;
  attenuation_7 = float(tmpvar_16);
  float3 tmpvar_17 = 0;
  tmpvar_17 = (attenuation_7 * (float3)(_mtl_u._LightColor0.xyz));
  half4 tmpvar_18 = 0;
  float2 P_19 = 0;
  P_19 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._SpecularMap_ST.xy) + _mtl_u._SpecularMap_ST.zw);
  tmpvar_18 = _SpecularMap.sample(_mtlsmp__SpecularMap, (float2)(P_19));
  _SpecularMap_var_6 = float4(tmpvar_18);
  half4 tmpvar_20 = 0;
  float2 P_21 = 0;
  P_21 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._DiffuseMapTransA_ST.xy) + _mtl_u._DiffuseMapTransA_ST.zw);
  tmpvar_20 = _DiffuseMapTransA.sample(_mtlsmp__DiffuseMapTransA, (float2)(P_21));
  _DiffuseMapTransA_var_5 = float4(tmpvar_20);
  float4 tmpvar_22 = 0;
  tmpvar_22.w = 0.0;
  tmpvar_22.xyz = (((
    (max (0.0, dot (tmpvar_13, tmpvar_14)) * tmpvar_17)
   * 
    (_DiffuseMapTransA_var_5.xyz * _mtl_u._Diffusecolor.xyz)
  ) + (
    (tmpvar_17 * pow (max (0.0, dot (
      normalize((normalize((_mtl_u._WorldSpaceCameraPos - _mtl_i.xlv_TEXCOORD3.xyz)) + tmpvar_14))
    , tmpvar_13)), exp2((
      (_mtl_u._Gloss * 10.0)
     + 1.0))))
   * 
    ((_SpecularMap_var_6.xyz * _mtl_u._SpecIntensity) * _mtl_u._Speccolor.xyz)
  )) * (_DiffuseMapTransA_var_5.w * _mtl_u._Transparency));
  finalRGBA_4 = half4(tmpvar_22);
  tmpvar_2 = float4(finalRGBA_4);
  _mtl_o._glesFragData_0 = half4(tmpvar_2);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 49 math, 3 textures, 2 branches
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_DiffuseMapTransA] 2D 0
SetTexture 1 [_NormalMap] 2D 1
SetTexture 2 [_SpecularMap] 2D 2
ConstBuffer "$Globals" 140
Vector 0 [_WorldSpaceCameraPos] 3
VectorHalf 16 [_WorldSpaceLightPos0] 4
VectorHalf 24 [_LightColor0] 4
Vector 32 [_DiffuseMapTransA_ST]
Vector 48 [_Diffusecolor]
Vector 64 [_NormalMap_ST]
Float 80 [_NormalIntensity]
Vector 96 [_SpecularMap_ST]
Vector 112 [_Speccolor]
Float 128 [_SpecIntensity]
Float 132 [_Gloss]
Float 136 [_Transparency]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  bool gl_FrontFacing [[front_facing]];
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  half4 _WorldSpaceLightPos0;
  half4 _LightColor0;
  float4 _DiffuseMapTransA_ST;
  float4 _Diffusecolor;
  float4 _NormalMap_ST;
  float _NormalIntensity;
  float4 _SpecularMap_ST;
  float4 _Speccolor;
  float _SpecIntensity;
  float _Gloss;
  float _Transparency;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _DiffuseMapTransA [[texture(0)]], sampler _mtlsmp__DiffuseMapTransA [[sampler(0)]]
  ,   texture2d<half> _NormalMap [[texture(1)]], sampler _mtlsmp__NormalMap [[sampler(1)]]
  ,   texture2d<half> _SpecularMap [[texture(2)]], sampler _mtlsmp__SpecularMap [[sampler(2)]])
{
  xlatMtlShaderOutput _mtl_o;
  float tmpvar_1 = 0;
  if (_mtl_i.gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  float4 tmpvar_2 = 0;
  float3 tmpvar_3 = 0;
  tmpvar_3 = _mtl_i.xlv_TEXCOORD4;
  half4 finalRGBA_4 = 0;
  float4 _DiffuseMapTransA_var_5 = 0;
  float4 _SpecularMap_var_6 = 0;
  float3 _NormalMap_var_7 = 0;
  int tmpvar_8 = 0;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_8 = 1;
  } else {
    tmpvar_8 = -1;
  };
  tmpvar_3 = (normalize(_mtl_i.xlv_TEXCOORD4) * float(tmpvar_8));
  float3x3 tmpvar_9;
  tmpvar_9[0].x = _mtl_i.xlv_TEXCOORD5.x;
  tmpvar_9[0].y = _mtl_i.xlv_TEXCOORD6.x;
  tmpvar_9[0].z = tmpvar_3.x;
  tmpvar_9[1].x = _mtl_i.xlv_TEXCOORD5.y;
  tmpvar_9[1].y = _mtl_i.xlv_TEXCOORD6.y;
  tmpvar_9[1].z = tmpvar_3.y;
  tmpvar_9[2].x = _mtl_i.xlv_TEXCOORD5.z;
  tmpvar_9[2].y = _mtl_i.xlv_TEXCOORD6.z;
  tmpvar_9[2].z = tmpvar_3.z;
  float2 P_10 = 0;
  P_10 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._NormalMap_ST.xy) + _mtl_u._NormalMap_ST.zw);
  half3 normal_11 = 0;
  normal_11.xy = ((_NormalMap.sample(_mtlsmp__NormalMap, (float2)(P_10)).wy * (half)(2.0)) - (half)(1.0));
  normal_11.z = sqrt(((half)(1.0) - clamp (
    dot (normal_11.xy, normal_11.xy)
  , (half)0.0, (half)1.0)));
  _NormalMap_var_7 = float3(normal_11);
  float3 tmpvar_12 = 0;
  tmpvar_12 = normalize((mix (float3(0.0, 0.0, 1.0), _NormalMap_var_7, float3(_mtl_u._NormalIntensity)) * tmpvar_9));
  float3 tmpvar_13 = 0;
  tmpvar_13 = normalize(mix ((float3)_mtl_u._WorldSpaceLightPos0.xyz, ((float3)(_mtl_u._WorldSpaceLightPos0.xyz) - _mtl_i.xlv_TEXCOORD3.xyz), (float3)_mtl_u._WorldSpaceLightPos0.www));
  float3 tmpvar_14 = 0;
  tmpvar_14 = float3(_mtl_u._LightColor0.xyz);
  half4 tmpvar_15 = 0;
  float2 P_16 = 0;
  P_16 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._SpecularMap_ST.xy) + _mtl_u._SpecularMap_ST.zw);
  tmpvar_15 = _SpecularMap.sample(_mtlsmp__SpecularMap, (float2)(P_16));
  _SpecularMap_var_6 = float4(tmpvar_15);
  half4 tmpvar_17 = 0;
  float2 P_18 = 0;
  P_18 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._DiffuseMapTransA_ST.xy) + _mtl_u._DiffuseMapTransA_ST.zw);
  tmpvar_17 = _DiffuseMapTransA.sample(_mtlsmp__DiffuseMapTransA, (float2)(P_18));
  _DiffuseMapTransA_var_5 = float4(tmpvar_17);
  float4 tmpvar_19 = 0;
  tmpvar_19.w = 0.0;
  tmpvar_19.xyz = (((
    (max (0.0, dot (tmpvar_12, tmpvar_13)) * tmpvar_14)
   * 
    (_DiffuseMapTransA_var_5.xyz * _mtl_u._Diffusecolor.xyz)
  ) + (
    (tmpvar_14 * pow (max (0.0, dot (
      normalize((normalize((_mtl_u._WorldSpaceCameraPos - _mtl_i.xlv_TEXCOORD3.xyz)) + tmpvar_13))
    , tmpvar_12)), exp2((
      (_mtl_u._Gloss * 10.0)
     + 1.0))))
   * 
    ((_SpecularMap_var_6.xyz * _mtl_u._SpecIntensity) * _mtl_u._Speccolor.xyz)
  )) * (_DiffuseMapTransA_var_5.w * _mtl_u._Transparency));
  finalRGBA_4 = half4(tmpvar_19);
  tmpvar_2 = float4(finalRGBA_4);
  _mtl_o._glesFragData_0 = half4(tmpvar_2);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "SPOT" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 57 math, 5 textures, 2 branches
Keywords { "SPOT" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_DiffuseMapTransA] 2D 2
SetTexture 3 [_NormalMap] 2D 3
SetTexture 4 [_SpecularMap] 2D 4
ConstBuffer "$Globals" 156
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_WorldSpaceLightPos0]
VectorHalf 32 [_LightColor0] 4
Vector 48 [_DiffuseMapTransA_ST]
Vector 64 [_Diffusecolor]
Vector 80 [_NormalMap_ST]
Float 96 [_NormalIntensity]
Vector 112 [_SpecularMap_ST]
Vector 128 [_Speccolor]
Float 144 [_SpecIntensity]
Float 148 [_Gloss]
Float 152 [_Transparency]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  bool gl_FrontFacing [[front_facing]];
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float4 xlv_TEXCOORD7;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _WorldSpaceLightPos0;
  half4 _LightColor0;
  float4 _DiffuseMapTransA_ST;
  float4 _Diffusecolor;
  float4 _NormalMap_ST;
  float _NormalIntensity;
  float4 _SpecularMap_ST;
  float4 _Speccolor;
  float _SpecIntensity;
  float _Gloss;
  float _Transparency;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _LightTexture0 [[texture(0)]], sampler _mtlsmp__LightTexture0 [[sampler(0)]]
  ,   texture2d<half> _LightTextureB0 [[texture(1)]], sampler _mtlsmp__LightTextureB0 [[sampler(1)]]
  ,   texture2d<half> _DiffuseMapTransA [[texture(2)]], sampler _mtlsmp__DiffuseMapTransA [[sampler(2)]]
  ,   texture2d<half> _NormalMap [[texture(3)]], sampler _mtlsmp__NormalMap [[sampler(3)]]
  ,   texture2d<half> _SpecularMap [[texture(4)]], sampler _mtlsmp__SpecularMap [[sampler(4)]])
{
  xlatMtlShaderOutput _mtl_o;
  float tmpvar_1 = 0;
  if (_mtl_i.gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  float4 tmpvar_2 = 0;
  float3 tmpvar_3 = 0;
  tmpvar_3 = _mtl_i.xlv_TEXCOORD4;
  half4 finalRGBA_4 = 0;
  float4 _DiffuseMapTransA_var_5 = 0;
  float4 _SpecularMap_var_6 = 0;
  float3 _NormalMap_var_7 = 0;
  int tmpvar_8 = 0;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_8 = 1;
  } else {
    tmpvar_8 = -1;
  };
  tmpvar_3 = (normalize(_mtl_i.xlv_TEXCOORD4) * float(tmpvar_8));
  float3x3 tmpvar_9;
  tmpvar_9[0].x = _mtl_i.xlv_TEXCOORD5.x;
  tmpvar_9[0].y = _mtl_i.xlv_TEXCOORD6.x;
  tmpvar_9[0].z = tmpvar_3.x;
  tmpvar_9[1].x = _mtl_i.xlv_TEXCOORD5.y;
  tmpvar_9[1].y = _mtl_i.xlv_TEXCOORD6.y;
  tmpvar_9[1].z = tmpvar_3.y;
  tmpvar_9[2].x = _mtl_i.xlv_TEXCOORD5.z;
  tmpvar_9[2].y = _mtl_i.xlv_TEXCOORD6.z;
  tmpvar_9[2].z = tmpvar_3.z;
  float2 P_10 = 0;
  P_10 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._NormalMap_ST.xy) + _mtl_u._NormalMap_ST.zw);
  half3 normal_11 = 0;
  normal_11.xy = ((_NormalMap.sample(_mtlsmp__NormalMap, (float2)(P_10)).wy * (half)(2.0)) - (half)(1.0));
  normal_11.z = sqrt(((half)(1.0) - clamp (
    dot (normal_11.xy, normal_11.xy)
  , (half)0.0, (half)1.0)));
  _NormalMap_var_7 = float3(normal_11);
  float3 tmpvar_12 = 0;
  tmpvar_12 = normalize((mix (float3(0.0, 0.0, 1.0), _NormalMap_var_7, float3(_mtl_u._NormalIntensity)) * tmpvar_9));
  float3 tmpvar_13 = 0;
  tmpvar_13 = normalize(mix (_mtl_u._WorldSpaceLightPos0.xyz, (_mtl_u._WorldSpaceLightPos0.xyz - _mtl_i.xlv_TEXCOORD3.xyz), _mtl_u._WorldSpaceLightPos0.www));
  half4 tmpvar_14 = 0;
  float2 P_15 = 0;
  P_15 = ((_mtl_i.xlv_TEXCOORD7.xy / _mtl_i.xlv_TEXCOORD7.w) + 0.5);
  tmpvar_14 = _LightTexture0.sample(_mtlsmp__LightTexture0, (float2)(P_15));
  float tmpvar_16 = 0;
  tmpvar_16 = dot (_mtl_i.xlv_TEXCOORD7.xyz, _mtl_i.xlv_TEXCOORD7.xyz);
  half4 tmpvar_17 = 0;
  tmpvar_17 = _LightTextureB0.sample(_mtlsmp__LightTextureB0, (float2)(float2(tmpvar_16)));
  float3 tmpvar_18 = 0;
  tmpvar_18 = (((
    float((_mtl_i.xlv_TEXCOORD7.z > 0.0))
   * (float)(tmpvar_14.w)) * (float)(tmpvar_17.w)) * (float3)(_mtl_u._LightColor0.xyz));
  half4 tmpvar_19 = 0;
  float2 P_20 = 0;
  P_20 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._SpecularMap_ST.xy) + _mtl_u._SpecularMap_ST.zw);
  tmpvar_19 = _SpecularMap.sample(_mtlsmp__SpecularMap, (float2)(P_20));
  _SpecularMap_var_6 = float4(tmpvar_19);
  half4 tmpvar_21 = 0;
  float2 P_22 = 0;
  P_22 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._DiffuseMapTransA_ST.xy) + _mtl_u._DiffuseMapTransA_ST.zw);
  tmpvar_21 = _DiffuseMapTransA.sample(_mtlsmp__DiffuseMapTransA, (float2)(P_22));
  _DiffuseMapTransA_var_5 = float4(tmpvar_21);
  float4 tmpvar_23 = 0;
  tmpvar_23.w = 0.0;
  tmpvar_23.xyz = (((
    (max (0.0, dot (tmpvar_12, tmpvar_13)) * tmpvar_18)
   * 
    (_DiffuseMapTransA_var_5.xyz * _mtl_u._Diffusecolor.xyz)
  ) + (
    (tmpvar_18 * pow (max (0.0, dot (
      normalize((normalize((_mtl_u._WorldSpaceCameraPos - _mtl_i.xlv_TEXCOORD3.xyz)) + tmpvar_13))
    , tmpvar_12)), exp2((
      (_mtl_u._Gloss * 10.0)
     + 1.0))))
   * 
    ((_SpecularMap_var_6.xyz * _mtl_u._SpecIntensity) * _mtl_u._Speccolor.xyz)
  )) * (_DiffuseMapTransA_var_5.w * _mtl_u._Transparency));
  finalRGBA_4 = half4(tmpvar_23);
  tmpvar_2 = float4(finalRGBA_4);
  _mtl_o._glesFragData_0 = half4(tmpvar_2);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "SPOT" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 52 math, 5 textures, 2 branches
Keywords { "POINT_COOKIE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_LightTexture0] CUBE 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_DiffuseMapTransA] 2D 2
SetTexture 3 [_NormalMap] 2D 3
SetTexture 4 [_SpecularMap] 2D 4
ConstBuffer "$Globals" 156
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_WorldSpaceLightPos0]
VectorHalf 32 [_LightColor0] 4
Vector 48 [_DiffuseMapTransA_ST]
Vector 64 [_Diffusecolor]
Vector 80 [_NormalMap_ST]
Float 96 [_NormalIntensity]
Vector 112 [_SpecularMap_ST]
Vector 128 [_Speccolor]
Float 144 [_SpecIntensity]
Float 148 [_Gloss]
Float 152 [_Transparency]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  bool gl_FrontFacing [[front_facing]];
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float3 xlv_TEXCOORD7;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _WorldSpaceLightPos0;
  half4 _LightColor0;
  float4 _DiffuseMapTransA_ST;
  float4 _Diffusecolor;
  float4 _NormalMap_ST;
  float _NormalIntensity;
  float4 _SpecularMap_ST;
  float4 _Speccolor;
  float _SpecIntensity;
  float _Gloss;
  float _Transparency;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texturecube<half> _LightTexture0 [[texture(0)]], sampler _mtlsmp__LightTexture0 [[sampler(0)]]
  ,   texture2d<half> _LightTextureB0 [[texture(1)]], sampler _mtlsmp__LightTextureB0 [[sampler(1)]]
  ,   texture2d<half> _DiffuseMapTransA [[texture(2)]], sampler _mtlsmp__DiffuseMapTransA [[sampler(2)]]
  ,   texture2d<half> _NormalMap [[texture(3)]], sampler _mtlsmp__NormalMap [[sampler(3)]]
  ,   texture2d<half> _SpecularMap [[texture(4)]], sampler _mtlsmp__SpecularMap [[sampler(4)]])
{
  xlatMtlShaderOutput _mtl_o;
  float tmpvar_1 = 0;
  if (_mtl_i.gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  float4 tmpvar_2 = 0;
  float3 tmpvar_3 = 0;
  tmpvar_3 = _mtl_i.xlv_TEXCOORD4;
  half4 finalRGBA_4 = 0;
  float4 _DiffuseMapTransA_var_5 = 0;
  float4 _SpecularMap_var_6 = 0;
  float attenuation_7 = 0;
  float3 _NormalMap_var_8 = 0;
  int tmpvar_9 = 0;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_9 = 1;
  } else {
    tmpvar_9 = -1;
  };
  tmpvar_3 = (normalize(_mtl_i.xlv_TEXCOORD4) * float(tmpvar_9));
  float3x3 tmpvar_10;
  tmpvar_10[0].x = _mtl_i.xlv_TEXCOORD5.x;
  tmpvar_10[0].y = _mtl_i.xlv_TEXCOORD6.x;
  tmpvar_10[0].z = tmpvar_3.x;
  tmpvar_10[1].x = _mtl_i.xlv_TEXCOORD5.y;
  tmpvar_10[1].y = _mtl_i.xlv_TEXCOORD6.y;
  tmpvar_10[1].z = tmpvar_3.y;
  tmpvar_10[2].x = _mtl_i.xlv_TEXCOORD5.z;
  tmpvar_10[2].y = _mtl_i.xlv_TEXCOORD6.z;
  tmpvar_10[2].z = tmpvar_3.z;
  float2 P_11 = 0;
  P_11 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._NormalMap_ST.xy) + _mtl_u._NormalMap_ST.zw);
  half3 normal_12 = 0;
  normal_12.xy = ((_NormalMap.sample(_mtlsmp__NormalMap, (float2)(P_11)).wy * (half)(2.0)) - (half)(1.0));
  normal_12.z = sqrt(((half)(1.0) - clamp (
    dot (normal_12.xy, normal_12.xy)
  , (half)0.0, (half)1.0)));
  _NormalMap_var_8 = float3(normal_12);
  float3 tmpvar_13 = 0;
  tmpvar_13 = normalize((mix (float3(0.0, 0.0, 1.0), _NormalMap_var_8, float3(_mtl_u._NormalIntensity)) * tmpvar_10));
  float3 tmpvar_14 = 0;
  tmpvar_14 = normalize(mix (_mtl_u._WorldSpaceLightPos0.xyz, (_mtl_u._WorldSpaceLightPos0.xyz - _mtl_i.xlv_TEXCOORD3.xyz), _mtl_u._WorldSpaceLightPos0.www));
  float tmpvar_15 = 0;
  tmpvar_15 = dot (_mtl_i.xlv_TEXCOORD7, _mtl_i.xlv_TEXCOORD7);
  half tmpvar_16 = 0;
  tmpvar_16 = (_LightTextureB0.sample(_mtlsmp__LightTextureB0, (float2)(float2(tmpvar_15))).w * _LightTexture0.sample(_mtlsmp__LightTexture0, (float3)(_mtl_i.xlv_TEXCOORD7)).w);
  attenuation_7 = float(tmpvar_16);
  float3 tmpvar_17 = 0;
  tmpvar_17 = (attenuation_7 * (float3)(_mtl_u._LightColor0.xyz));
  half4 tmpvar_18 = 0;
  float2 P_19 = 0;
  P_19 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._SpecularMap_ST.xy) + _mtl_u._SpecularMap_ST.zw);
  tmpvar_18 = _SpecularMap.sample(_mtlsmp__SpecularMap, (float2)(P_19));
  _SpecularMap_var_6 = float4(tmpvar_18);
  half4 tmpvar_20 = 0;
  float2 P_21 = 0;
  P_21 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._DiffuseMapTransA_ST.xy) + _mtl_u._DiffuseMapTransA_ST.zw);
  tmpvar_20 = _DiffuseMapTransA.sample(_mtlsmp__DiffuseMapTransA, (float2)(P_21));
  _DiffuseMapTransA_var_5 = float4(tmpvar_20);
  float4 tmpvar_22 = 0;
  tmpvar_22.w = 0.0;
  tmpvar_22.xyz = (((
    (max (0.0, dot (tmpvar_13, tmpvar_14)) * tmpvar_17)
   * 
    (_DiffuseMapTransA_var_5.xyz * _mtl_u._Diffusecolor.xyz)
  ) + (
    (tmpvar_17 * pow (max (0.0, dot (
      normalize((normalize((_mtl_u._WorldSpaceCameraPos - _mtl_i.xlv_TEXCOORD3.xyz)) + tmpvar_14))
    , tmpvar_13)), exp2((
      (_mtl_u._Gloss * 10.0)
     + 1.0))))
   * 
    ((_SpecularMap_var_6.xyz * _mtl_u._SpecIntensity) * _mtl_u._Speccolor.xyz)
  )) * (_DiffuseMapTransA_var_5.w * _mtl_u._Transparency));
  finalRGBA_4 = half4(tmpvar_22);
  tmpvar_2 = float4(finalRGBA_4);
  _mtl_o._glesFragData_0 = half4(tmpvar_2);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 50 math, 4 textures, 2 branches
Keywords { "DIRECTIONAL_COOKIE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_DiffuseMapTransA] 2D 1
SetTexture 2 [_NormalMap] 2D 2
SetTexture 3 [_SpecularMap] 2D 3
ConstBuffer "$Globals" 140
Vector 0 [_WorldSpaceCameraPos] 3
VectorHalf 16 [_WorldSpaceLightPos0] 4
VectorHalf 24 [_LightColor0] 4
Vector 32 [_DiffuseMapTransA_ST]
Vector 48 [_Diffusecolor]
Vector 64 [_NormalMap_ST]
Float 80 [_NormalIntensity]
Vector 96 [_SpecularMap_ST]
Vector 112 [_Speccolor]
Float 128 [_SpecIntensity]
Float 132 [_Gloss]
Float 136 [_Transparency]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  bool gl_FrontFacing [[front_facing]];
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float2 xlv_TEXCOORD7;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  half4 _WorldSpaceLightPos0;
  half4 _LightColor0;
  float4 _DiffuseMapTransA_ST;
  float4 _Diffusecolor;
  float4 _NormalMap_ST;
  float _NormalIntensity;
  float4 _SpecularMap_ST;
  float4 _Speccolor;
  float _SpecIntensity;
  float _Gloss;
  float _Transparency;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _LightTexture0 [[texture(0)]], sampler _mtlsmp__LightTexture0 [[sampler(0)]]
  ,   texture2d<half> _DiffuseMapTransA [[texture(1)]], sampler _mtlsmp__DiffuseMapTransA [[sampler(1)]]
  ,   texture2d<half> _NormalMap [[texture(2)]], sampler _mtlsmp__NormalMap [[sampler(2)]]
  ,   texture2d<half> _SpecularMap [[texture(3)]], sampler _mtlsmp__SpecularMap [[sampler(3)]])
{
  xlatMtlShaderOutput _mtl_o;
  float tmpvar_1 = 0;
  if (_mtl_i.gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  float4 tmpvar_2 = 0;
  float3 tmpvar_3 = 0;
  tmpvar_3 = _mtl_i.xlv_TEXCOORD4;
  half4 finalRGBA_4 = 0;
  float4 _DiffuseMapTransA_var_5 = 0;
  float4 _SpecularMap_var_6 = 0;
  float attenuation_7 = 0;
  float3 _NormalMap_var_8 = 0;
  int tmpvar_9 = 0;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_9 = 1;
  } else {
    tmpvar_9 = -1;
  };
  tmpvar_3 = (normalize(_mtl_i.xlv_TEXCOORD4) * float(tmpvar_9));
  float3x3 tmpvar_10;
  tmpvar_10[0].x = _mtl_i.xlv_TEXCOORD5.x;
  tmpvar_10[0].y = _mtl_i.xlv_TEXCOORD6.x;
  tmpvar_10[0].z = tmpvar_3.x;
  tmpvar_10[1].x = _mtl_i.xlv_TEXCOORD5.y;
  tmpvar_10[1].y = _mtl_i.xlv_TEXCOORD6.y;
  tmpvar_10[1].z = tmpvar_3.y;
  tmpvar_10[2].x = _mtl_i.xlv_TEXCOORD5.z;
  tmpvar_10[2].y = _mtl_i.xlv_TEXCOORD6.z;
  tmpvar_10[2].z = tmpvar_3.z;
  float2 P_11 = 0;
  P_11 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._NormalMap_ST.xy) + _mtl_u._NormalMap_ST.zw);
  half3 normal_12 = 0;
  normal_12.xy = ((_NormalMap.sample(_mtlsmp__NormalMap, (float2)(P_11)).wy * (half)(2.0)) - (half)(1.0));
  normal_12.z = sqrt(((half)(1.0) - clamp (
    dot (normal_12.xy, normal_12.xy)
  , (half)0.0, (half)1.0)));
  _NormalMap_var_8 = float3(normal_12);
  float3 tmpvar_13 = 0;
  tmpvar_13 = normalize((mix (float3(0.0, 0.0, 1.0), _NormalMap_var_8, float3(_mtl_u._NormalIntensity)) * tmpvar_10));
  float3 tmpvar_14 = 0;
  tmpvar_14 = normalize(mix ((float3)_mtl_u._WorldSpaceLightPos0.xyz, ((float3)(_mtl_u._WorldSpaceLightPos0.xyz) - _mtl_i.xlv_TEXCOORD3.xyz), (float3)_mtl_u._WorldSpaceLightPos0.www));
  half tmpvar_15 = 0;
  tmpvar_15 = _LightTexture0.sample(_mtlsmp__LightTexture0, (float2)(_mtl_i.xlv_TEXCOORD7)).w;
  attenuation_7 = float(tmpvar_15);
  float3 tmpvar_16 = 0;
  tmpvar_16 = (attenuation_7 * (float3)(_mtl_u._LightColor0.xyz));
  half4 tmpvar_17 = 0;
  float2 P_18 = 0;
  P_18 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._SpecularMap_ST.xy) + _mtl_u._SpecularMap_ST.zw);
  tmpvar_17 = _SpecularMap.sample(_mtlsmp__SpecularMap, (float2)(P_18));
  _SpecularMap_var_6 = float4(tmpvar_17);
  half4 tmpvar_19 = 0;
  float2 P_20 = 0;
  P_20 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._DiffuseMapTransA_ST.xy) + _mtl_u._DiffuseMapTransA_ST.zw);
  tmpvar_19 = _DiffuseMapTransA.sample(_mtlsmp__DiffuseMapTransA, (float2)(P_20));
  _DiffuseMapTransA_var_5 = float4(tmpvar_19);
  float4 tmpvar_21 = 0;
  tmpvar_21.w = 0.0;
  tmpvar_21.xyz = (((
    (max (0.0, dot (tmpvar_13, tmpvar_14)) * tmpvar_16)
   * 
    (_DiffuseMapTransA_var_5.xyz * _mtl_u._Diffusecolor.xyz)
  ) + (
    (tmpvar_16 * pow (max (0.0, dot (
      normalize((normalize((_mtl_u._WorldSpaceCameraPos - _mtl_i.xlv_TEXCOORD3.xyz)) + tmpvar_14))
    , tmpvar_13)), exp2((
      (_mtl_u._Gloss * 10.0)
     + 1.0))))
   * 
    ((_SpecularMap_var_6.xyz * _mtl_u._SpecIntensity) * _mtl_u._Speccolor.xyz)
  )) * (_DiffuseMapTransA_var_5.w * _mtl_u._Transparency));
  finalRGBA_4 = half4(tmpvar_21);
  tmpvar_2 = float4(finalRGBA_4);
  _mtl_o._glesFragData_0 = half4(tmpvar_2);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "POINT" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 51 math, 4 textures, 2 branches
Keywords { "POINT" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_DiffuseMapTransA] 2D 1
SetTexture 2 [_NormalMap] 2D 2
SetTexture 3 [_SpecularMap] 2D 3
ConstBuffer "$Globals" 156
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_WorldSpaceLightPos0]
VectorHalf 32 [_LightColor0] 4
Vector 48 [_DiffuseMapTransA_ST]
Vector 64 [_Diffusecolor]
Vector 80 [_NormalMap_ST]
Float 96 [_NormalIntensity]
Vector 112 [_SpecularMap_ST]
Vector 128 [_Speccolor]
Float 144 [_SpecIntensity]
Float 148 [_Gloss]
Float 152 [_Transparency]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  bool gl_FrontFacing [[front_facing]];
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float3 xlv_TEXCOORD7;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _WorldSpaceLightPos0;
  half4 _LightColor0;
  float4 _DiffuseMapTransA_ST;
  float4 _Diffusecolor;
  float4 _NormalMap_ST;
  float _NormalIntensity;
  float4 _SpecularMap_ST;
  float4 _Speccolor;
  float _SpecIntensity;
  float _Gloss;
  float _Transparency;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _LightTexture0 [[texture(0)]], sampler _mtlsmp__LightTexture0 [[sampler(0)]]
  ,   texture2d<half> _DiffuseMapTransA [[texture(1)]], sampler _mtlsmp__DiffuseMapTransA [[sampler(1)]]
  ,   texture2d<half> _NormalMap [[texture(2)]], sampler _mtlsmp__NormalMap [[sampler(2)]]
  ,   texture2d<half> _SpecularMap [[texture(3)]], sampler _mtlsmp__SpecularMap [[sampler(3)]])
{
  xlatMtlShaderOutput _mtl_o;
  float tmpvar_1 = 0;
  if (_mtl_i.gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  float4 tmpvar_2 = 0;
  float3 tmpvar_3 = 0;
  tmpvar_3 = _mtl_i.xlv_TEXCOORD4;
  half4 finalRGBA_4 = 0;
  float4 _DiffuseMapTransA_var_5 = 0;
  float4 _SpecularMap_var_6 = 0;
  float attenuation_7 = 0;
  float3 _NormalMap_var_8 = 0;
  int tmpvar_9 = 0;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_9 = 1;
  } else {
    tmpvar_9 = -1;
  };
  tmpvar_3 = (normalize(_mtl_i.xlv_TEXCOORD4) * float(tmpvar_9));
  float3x3 tmpvar_10;
  tmpvar_10[0].x = _mtl_i.xlv_TEXCOORD5.x;
  tmpvar_10[0].y = _mtl_i.xlv_TEXCOORD6.x;
  tmpvar_10[0].z = tmpvar_3.x;
  tmpvar_10[1].x = _mtl_i.xlv_TEXCOORD5.y;
  tmpvar_10[1].y = _mtl_i.xlv_TEXCOORD6.y;
  tmpvar_10[1].z = tmpvar_3.y;
  tmpvar_10[2].x = _mtl_i.xlv_TEXCOORD5.z;
  tmpvar_10[2].y = _mtl_i.xlv_TEXCOORD6.z;
  tmpvar_10[2].z = tmpvar_3.z;
  float2 P_11 = 0;
  P_11 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._NormalMap_ST.xy) + _mtl_u._NormalMap_ST.zw);
  half3 normal_12 = 0;
  normal_12.xy = ((_NormalMap.sample(_mtlsmp__NormalMap, (float2)(P_11)).wy * (half)(2.0)) - (half)(1.0));
  normal_12.z = sqrt(((half)(1.0) - clamp (
    dot (normal_12.xy, normal_12.xy)
  , (half)0.0, (half)1.0)));
  _NormalMap_var_8 = float3(normal_12);
  float3 tmpvar_13 = 0;
  tmpvar_13 = normalize((mix (float3(0.0, 0.0, 1.0), _NormalMap_var_8, float3(_mtl_u._NormalIntensity)) * tmpvar_10));
  float3 tmpvar_14 = 0;
  tmpvar_14 = normalize(mix (_mtl_u._WorldSpaceLightPos0.xyz, (_mtl_u._WorldSpaceLightPos0.xyz - _mtl_i.xlv_TEXCOORD3.xyz), _mtl_u._WorldSpaceLightPos0.www));
  float tmpvar_15 = 0;
  tmpvar_15 = dot (_mtl_i.xlv_TEXCOORD7, _mtl_i.xlv_TEXCOORD7);
  half tmpvar_16 = 0;
  tmpvar_16 = _LightTexture0.sample(_mtlsmp__LightTexture0, (float2)(float2(tmpvar_15))).w;
  attenuation_7 = float(tmpvar_16);
  float3 tmpvar_17 = 0;
  tmpvar_17 = (attenuation_7 * (float3)(_mtl_u._LightColor0.xyz));
  half4 tmpvar_18 = 0;
  float2 P_19 = 0;
  P_19 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._SpecularMap_ST.xy) + _mtl_u._SpecularMap_ST.zw);
  tmpvar_18 = _SpecularMap.sample(_mtlsmp__SpecularMap, (float2)(P_19));
  _SpecularMap_var_6 = float4(tmpvar_18);
  half4 tmpvar_20 = 0;
  float2 P_21 = 0;
  P_21 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._DiffuseMapTransA_ST.xy) + _mtl_u._DiffuseMapTransA_ST.zw);
  tmpvar_20 = _DiffuseMapTransA.sample(_mtlsmp__DiffuseMapTransA, (float2)(P_21));
  _DiffuseMapTransA_var_5 = float4(tmpvar_20);
  float4 tmpvar_22 = 0;
  tmpvar_22.w = 0.0;
  tmpvar_22.xyz = (((
    (max (0.0, dot (tmpvar_13, tmpvar_14)) * tmpvar_17)
   * 
    (_DiffuseMapTransA_var_5.xyz * _mtl_u._Diffusecolor.xyz)
  ) + (
    (tmpvar_17 * pow (max (0.0, dot (
      normalize((normalize((_mtl_u._WorldSpaceCameraPos - _mtl_i.xlv_TEXCOORD3.xyz)) + tmpvar_14))
    , tmpvar_13)), exp2((
      (_mtl_u._Gloss * 10.0)
     + 1.0))))
   * 
    ((_SpecularMap_var_6.xyz * _mtl_u._SpecIntensity) * _mtl_u._Speccolor.xyz)
  )) * (_DiffuseMapTransA_var_5.w * _mtl_u._Transparency));
  finalRGBA_4 = half4(tmpvar_22);
  tmpvar_2 = float4(finalRGBA_4);
  _mtl_o._glesFragData_0 = half4(tmpvar_2);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 49 math, 3 textures, 2 branches
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
SetTexture 0 [_DiffuseMapTransA] 2D 0
SetTexture 1 [_NormalMap] 2D 1
SetTexture 2 [_SpecularMap] 2D 2
ConstBuffer "$Globals" 140
Vector 0 [_WorldSpaceCameraPos] 3
VectorHalf 16 [_WorldSpaceLightPos0] 4
VectorHalf 24 [_LightColor0] 4
Vector 32 [_DiffuseMapTransA_ST]
Vector 48 [_Diffusecolor]
Vector 64 [_NormalMap_ST]
Float 80 [_NormalIntensity]
Vector 96 [_SpecularMap_ST]
Vector 112 [_Speccolor]
Float 128 [_SpecIntensity]
Float 132 [_Gloss]
Float 136 [_Transparency]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  bool gl_FrontFacing [[front_facing]];
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  half4 _WorldSpaceLightPos0;
  half4 _LightColor0;
  float4 _DiffuseMapTransA_ST;
  float4 _Diffusecolor;
  float4 _NormalMap_ST;
  float _NormalIntensity;
  float4 _SpecularMap_ST;
  float4 _Speccolor;
  float _SpecIntensity;
  float _Gloss;
  float _Transparency;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _DiffuseMapTransA [[texture(0)]], sampler _mtlsmp__DiffuseMapTransA [[sampler(0)]]
  ,   texture2d<half> _NormalMap [[texture(1)]], sampler _mtlsmp__NormalMap [[sampler(1)]]
  ,   texture2d<half> _SpecularMap [[texture(2)]], sampler _mtlsmp__SpecularMap [[sampler(2)]])
{
  xlatMtlShaderOutput _mtl_o;
  float tmpvar_1 = 0;
  if (_mtl_i.gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  float4 tmpvar_2 = 0;
  float3 tmpvar_3 = 0;
  tmpvar_3 = _mtl_i.xlv_TEXCOORD4;
  half4 finalRGBA_4 = 0;
  float4 _DiffuseMapTransA_var_5 = 0;
  float4 _SpecularMap_var_6 = 0;
  float3 _NormalMap_var_7 = 0;
  int tmpvar_8 = 0;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_8 = 1;
  } else {
    tmpvar_8 = -1;
  };
  tmpvar_3 = (normalize(_mtl_i.xlv_TEXCOORD4) * float(tmpvar_8));
  float3x3 tmpvar_9;
  tmpvar_9[0].x = _mtl_i.xlv_TEXCOORD5.x;
  tmpvar_9[0].y = _mtl_i.xlv_TEXCOORD6.x;
  tmpvar_9[0].z = tmpvar_3.x;
  tmpvar_9[1].x = _mtl_i.xlv_TEXCOORD5.y;
  tmpvar_9[1].y = _mtl_i.xlv_TEXCOORD6.y;
  tmpvar_9[1].z = tmpvar_3.y;
  tmpvar_9[2].x = _mtl_i.xlv_TEXCOORD5.z;
  tmpvar_9[2].y = _mtl_i.xlv_TEXCOORD6.z;
  tmpvar_9[2].z = tmpvar_3.z;
  float2 P_10 = 0;
  P_10 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._NormalMap_ST.xy) + _mtl_u._NormalMap_ST.zw);
  half3 normal_11 = 0;
  normal_11.xy = ((_NormalMap.sample(_mtlsmp__NormalMap, (float2)(P_10)).wy * (half)(2.0)) - (half)(1.0));
  normal_11.z = sqrt(((half)(1.0) - clamp (
    dot (normal_11.xy, normal_11.xy)
  , (half)0.0, (half)1.0)));
  _NormalMap_var_7 = float3(normal_11);
  float3 tmpvar_12 = 0;
  tmpvar_12 = normalize((mix (float3(0.0, 0.0, 1.0), _NormalMap_var_7, float3(_mtl_u._NormalIntensity)) * tmpvar_9));
  float3 tmpvar_13 = 0;
  tmpvar_13 = normalize(mix ((float3)_mtl_u._WorldSpaceLightPos0.xyz, ((float3)(_mtl_u._WorldSpaceLightPos0.xyz) - _mtl_i.xlv_TEXCOORD3.xyz), (float3)_mtl_u._WorldSpaceLightPos0.www));
  float3 tmpvar_14 = 0;
  tmpvar_14 = float3(_mtl_u._LightColor0.xyz);
  half4 tmpvar_15 = 0;
  float2 P_16 = 0;
  P_16 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._SpecularMap_ST.xy) + _mtl_u._SpecularMap_ST.zw);
  tmpvar_15 = _SpecularMap.sample(_mtlsmp__SpecularMap, (float2)(P_16));
  _SpecularMap_var_6 = float4(tmpvar_15);
  half4 tmpvar_17 = 0;
  float2 P_18 = 0;
  P_18 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._DiffuseMapTransA_ST.xy) + _mtl_u._DiffuseMapTransA_ST.zw);
  tmpvar_17 = _DiffuseMapTransA.sample(_mtlsmp__DiffuseMapTransA, (float2)(P_18));
  _DiffuseMapTransA_var_5 = float4(tmpvar_17);
  float4 tmpvar_19 = 0;
  tmpvar_19.w = 0.0;
  tmpvar_19.xyz = (((
    (max (0.0, dot (tmpvar_12, tmpvar_13)) * tmpvar_14)
   * 
    (_DiffuseMapTransA_var_5.xyz * _mtl_u._Diffusecolor.xyz)
  ) + (
    (tmpvar_14 * pow (max (0.0, dot (
      normalize((normalize((_mtl_u._WorldSpaceCameraPos - _mtl_i.xlv_TEXCOORD3.xyz)) + tmpvar_13))
    , tmpvar_12)), exp2((
      (_mtl_u._Gloss * 10.0)
     + 1.0))))
   * 
    ((_SpecularMap_var_6.xyz * _mtl_u._SpecIntensity) * _mtl_u._Speccolor.xyz)
  )) * (_DiffuseMapTransA_var_5.w * _mtl_u._Transparency));
  finalRGBA_4 = half4(tmpvar_19);
  tmpvar_2 = float4(finalRGBA_4);
  _mtl_o._glesFragData_0 = half4(tmpvar_2);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "SPOT" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 57 math, 5 textures, 2 branches
Keywords { "SPOT" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_DiffuseMapTransA] 2D 2
SetTexture 3 [_NormalMap] 2D 3
SetTexture 4 [_SpecularMap] 2D 4
ConstBuffer "$Globals" 156
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_WorldSpaceLightPos0]
VectorHalf 32 [_LightColor0] 4
Vector 48 [_DiffuseMapTransA_ST]
Vector 64 [_Diffusecolor]
Vector 80 [_NormalMap_ST]
Float 96 [_NormalIntensity]
Vector 112 [_SpecularMap_ST]
Vector 128 [_Speccolor]
Float 144 [_SpecIntensity]
Float 148 [_Gloss]
Float 152 [_Transparency]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  bool gl_FrontFacing [[front_facing]];
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float4 xlv_TEXCOORD7;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _WorldSpaceLightPos0;
  half4 _LightColor0;
  float4 _DiffuseMapTransA_ST;
  float4 _Diffusecolor;
  float4 _NormalMap_ST;
  float _NormalIntensity;
  float4 _SpecularMap_ST;
  float4 _Speccolor;
  float _SpecIntensity;
  float _Gloss;
  float _Transparency;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _LightTexture0 [[texture(0)]], sampler _mtlsmp__LightTexture0 [[sampler(0)]]
  ,   texture2d<half> _LightTextureB0 [[texture(1)]], sampler _mtlsmp__LightTextureB0 [[sampler(1)]]
  ,   texture2d<half> _DiffuseMapTransA [[texture(2)]], sampler _mtlsmp__DiffuseMapTransA [[sampler(2)]]
  ,   texture2d<half> _NormalMap [[texture(3)]], sampler _mtlsmp__NormalMap [[sampler(3)]]
  ,   texture2d<half> _SpecularMap [[texture(4)]], sampler _mtlsmp__SpecularMap [[sampler(4)]])
{
  xlatMtlShaderOutput _mtl_o;
  float tmpvar_1 = 0;
  if (_mtl_i.gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  float4 tmpvar_2 = 0;
  float3 tmpvar_3 = 0;
  tmpvar_3 = _mtl_i.xlv_TEXCOORD4;
  half4 finalRGBA_4 = 0;
  float4 _DiffuseMapTransA_var_5 = 0;
  float4 _SpecularMap_var_6 = 0;
  float3 _NormalMap_var_7 = 0;
  int tmpvar_8 = 0;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_8 = 1;
  } else {
    tmpvar_8 = -1;
  };
  tmpvar_3 = (normalize(_mtl_i.xlv_TEXCOORD4) * float(tmpvar_8));
  float3x3 tmpvar_9;
  tmpvar_9[0].x = _mtl_i.xlv_TEXCOORD5.x;
  tmpvar_9[0].y = _mtl_i.xlv_TEXCOORD6.x;
  tmpvar_9[0].z = tmpvar_3.x;
  tmpvar_9[1].x = _mtl_i.xlv_TEXCOORD5.y;
  tmpvar_9[1].y = _mtl_i.xlv_TEXCOORD6.y;
  tmpvar_9[1].z = tmpvar_3.y;
  tmpvar_9[2].x = _mtl_i.xlv_TEXCOORD5.z;
  tmpvar_9[2].y = _mtl_i.xlv_TEXCOORD6.z;
  tmpvar_9[2].z = tmpvar_3.z;
  float2 P_10 = 0;
  P_10 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._NormalMap_ST.xy) + _mtl_u._NormalMap_ST.zw);
  half3 normal_11 = 0;
  normal_11.xy = ((_NormalMap.sample(_mtlsmp__NormalMap, (float2)(P_10)).wy * (half)(2.0)) - (half)(1.0));
  normal_11.z = sqrt(((half)(1.0) - clamp (
    dot (normal_11.xy, normal_11.xy)
  , (half)0.0, (half)1.0)));
  _NormalMap_var_7 = float3(normal_11);
  float3 tmpvar_12 = 0;
  tmpvar_12 = normalize((mix (float3(0.0, 0.0, 1.0), _NormalMap_var_7, float3(_mtl_u._NormalIntensity)) * tmpvar_9));
  float3 tmpvar_13 = 0;
  tmpvar_13 = normalize(mix (_mtl_u._WorldSpaceLightPos0.xyz, (_mtl_u._WorldSpaceLightPos0.xyz - _mtl_i.xlv_TEXCOORD3.xyz), _mtl_u._WorldSpaceLightPos0.www));
  half4 tmpvar_14 = 0;
  float2 P_15 = 0;
  P_15 = ((_mtl_i.xlv_TEXCOORD7.xy / _mtl_i.xlv_TEXCOORD7.w) + 0.5);
  tmpvar_14 = _LightTexture0.sample(_mtlsmp__LightTexture0, (float2)(P_15));
  float tmpvar_16 = 0;
  tmpvar_16 = dot (_mtl_i.xlv_TEXCOORD7.xyz, _mtl_i.xlv_TEXCOORD7.xyz);
  half4 tmpvar_17 = 0;
  tmpvar_17 = _LightTextureB0.sample(_mtlsmp__LightTextureB0, (float2)(float2(tmpvar_16)));
  float3 tmpvar_18 = 0;
  tmpvar_18 = (((
    float((_mtl_i.xlv_TEXCOORD7.z > 0.0))
   * (float)(tmpvar_14.w)) * (float)(tmpvar_17.w)) * (float3)(_mtl_u._LightColor0.xyz));
  half4 tmpvar_19 = 0;
  float2 P_20 = 0;
  P_20 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._SpecularMap_ST.xy) + _mtl_u._SpecularMap_ST.zw);
  tmpvar_19 = _SpecularMap.sample(_mtlsmp__SpecularMap, (float2)(P_20));
  _SpecularMap_var_6 = float4(tmpvar_19);
  half4 tmpvar_21 = 0;
  float2 P_22 = 0;
  P_22 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._DiffuseMapTransA_ST.xy) + _mtl_u._DiffuseMapTransA_ST.zw);
  tmpvar_21 = _DiffuseMapTransA.sample(_mtlsmp__DiffuseMapTransA, (float2)(P_22));
  _DiffuseMapTransA_var_5 = float4(tmpvar_21);
  float4 tmpvar_23 = 0;
  tmpvar_23.w = 0.0;
  tmpvar_23.xyz = (((
    (max (0.0, dot (tmpvar_12, tmpvar_13)) * tmpvar_18)
   * 
    (_DiffuseMapTransA_var_5.xyz * _mtl_u._Diffusecolor.xyz)
  ) + (
    (tmpvar_18 * pow (max (0.0, dot (
      normalize((normalize((_mtl_u._WorldSpaceCameraPos - _mtl_i.xlv_TEXCOORD3.xyz)) + tmpvar_13))
    , tmpvar_12)), exp2((
      (_mtl_u._Gloss * 10.0)
     + 1.0))))
   * 
    ((_SpecularMap_var_6.xyz * _mtl_u._SpecIntensity) * _mtl_u._Speccolor.xyz)
  )) * (_DiffuseMapTransA_var_5.w * _mtl_u._Transparency));
  finalRGBA_4 = half4(tmpvar_23);
  tmpvar_2 = float4(finalRGBA_4);
  _mtl_o._glesFragData_0 = half4(tmpvar_2);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "SPOT" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 52 math, 5 textures, 2 branches
Keywords { "POINT_COOKIE" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
SetTexture 0 [_LightTexture0] CUBE 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_DiffuseMapTransA] 2D 2
SetTexture 3 [_NormalMap] 2D 3
SetTexture 4 [_SpecularMap] 2D 4
ConstBuffer "$Globals" 156
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_WorldSpaceLightPos0]
VectorHalf 32 [_LightColor0] 4
Vector 48 [_DiffuseMapTransA_ST]
Vector 64 [_Diffusecolor]
Vector 80 [_NormalMap_ST]
Float 96 [_NormalIntensity]
Vector 112 [_SpecularMap_ST]
Vector 128 [_Speccolor]
Float 144 [_SpecIntensity]
Float 148 [_Gloss]
Float 152 [_Transparency]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  bool gl_FrontFacing [[front_facing]];
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float3 xlv_TEXCOORD7;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _WorldSpaceLightPos0;
  half4 _LightColor0;
  float4 _DiffuseMapTransA_ST;
  float4 _Diffusecolor;
  float4 _NormalMap_ST;
  float _NormalIntensity;
  float4 _SpecularMap_ST;
  float4 _Speccolor;
  float _SpecIntensity;
  float _Gloss;
  float _Transparency;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texturecube<half> _LightTexture0 [[texture(0)]], sampler _mtlsmp__LightTexture0 [[sampler(0)]]
  ,   texture2d<half> _LightTextureB0 [[texture(1)]], sampler _mtlsmp__LightTextureB0 [[sampler(1)]]
  ,   texture2d<half> _DiffuseMapTransA [[texture(2)]], sampler _mtlsmp__DiffuseMapTransA [[sampler(2)]]
  ,   texture2d<half> _NormalMap [[texture(3)]], sampler _mtlsmp__NormalMap [[sampler(3)]]
  ,   texture2d<half> _SpecularMap [[texture(4)]], sampler _mtlsmp__SpecularMap [[sampler(4)]])
{
  xlatMtlShaderOutput _mtl_o;
  float tmpvar_1 = 0;
  if (_mtl_i.gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  float4 tmpvar_2 = 0;
  float3 tmpvar_3 = 0;
  tmpvar_3 = _mtl_i.xlv_TEXCOORD4;
  half4 finalRGBA_4 = 0;
  float4 _DiffuseMapTransA_var_5 = 0;
  float4 _SpecularMap_var_6 = 0;
  float attenuation_7 = 0;
  float3 _NormalMap_var_8 = 0;
  int tmpvar_9 = 0;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_9 = 1;
  } else {
    tmpvar_9 = -1;
  };
  tmpvar_3 = (normalize(_mtl_i.xlv_TEXCOORD4) * float(tmpvar_9));
  float3x3 tmpvar_10;
  tmpvar_10[0].x = _mtl_i.xlv_TEXCOORD5.x;
  tmpvar_10[0].y = _mtl_i.xlv_TEXCOORD6.x;
  tmpvar_10[0].z = tmpvar_3.x;
  tmpvar_10[1].x = _mtl_i.xlv_TEXCOORD5.y;
  tmpvar_10[1].y = _mtl_i.xlv_TEXCOORD6.y;
  tmpvar_10[1].z = tmpvar_3.y;
  tmpvar_10[2].x = _mtl_i.xlv_TEXCOORD5.z;
  tmpvar_10[2].y = _mtl_i.xlv_TEXCOORD6.z;
  tmpvar_10[2].z = tmpvar_3.z;
  float2 P_11 = 0;
  P_11 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._NormalMap_ST.xy) + _mtl_u._NormalMap_ST.zw);
  half3 normal_12 = 0;
  normal_12.xy = ((_NormalMap.sample(_mtlsmp__NormalMap, (float2)(P_11)).wy * (half)(2.0)) - (half)(1.0));
  normal_12.z = sqrt(((half)(1.0) - clamp (
    dot (normal_12.xy, normal_12.xy)
  , (half)0.0, (half)1.0)));
  _NormalMap_var_8 = float3(normal_12);
  float3 tmpvar_13 = 0;
  tmpvar_13 = normalize((mix (float3(0.0, 0.0, 1.0), _NormalMap_var_8, float3(_mtl_u._NormalIntensity)) * tmpvar_10));
  float3 tmpvar_14 = 0;
  tmpvar_14 = normalize(mix (_mtl_u._WorldSpaceLightPos0.xyz, (_mtl_u._WorldSpaceLightPos0.xyz - _mtl_i.xlv_TEXCOORD3.xyz), _mtl_u._WorldSpaceLightPos0.www));
  float tmpvar_15 = 0;
  tmpvar_15 = dot (_mtl_i.xlv_TEXCOORD7, _mtl_i.xlv_TEXCOORD7);
  half tmpvar_16 = 0;
  tmpvar_16 = (_LightTextureB0.sample(_mtlsmp__LightTextureB0, (float2)(float2(tmpvar_15))).w * _LightTexture0.sample(_mtlsmp__LightTexture0, (float3)(_mtl_i.xlv_TEXCOORD7)).w);
  attenuation_7 = float(tmpvar_16);
  float3 tmpvar_17 = 0;
  tmpvar_17 = (attenuation_7 * (float3)(_mtl_u._LightColor0.xyz));
  half4 tmpvar_18 = 0;
  float2 P_19 = 0;
  P_19 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._SpecularMap_ST.xy) + _mtl_u._SpecularMap_ST.zw);
  tmpvar_18 = _SpecularMap.sample(_mtlsmp__SpecularMap, (float2)(P_19));
  _SpecularMap_var_6 = float4(tmpvar_18);
  half4 tmpvar_20 = 0;
  float2 P_21 = 0;
  P_21 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._DiffuseMapTransA_ST.xy) + _mtl_u._DiffuseMapTransA_ST.zw);
  tmpvar_20 = _DiffuseMapTransA.sample(_mtlsmp__DiffuseMapTransA, (float2)(P_21));
  _DiffuseMapTransA_var_5 = float4(tmpvar_20);
  float4 tmpvar_22 = 0;
  tmpvar_22.w = 0.0;
  tmpvar_22.xyz = (((
    (max (0.0, dot (tmpvar_13, tmpvar_14)) * tmpvar_17)
   * 
    (_DiffuseMapTransA_var_5.xyz * _mtl_u._Diffusecolor.xyz)
  ) + (
    (tmpvar_17 * pow (max (0.0, dot (
      normalize((normalize((_mtl_u._WorldSpaceCameraPos - _mtl_i.xlv_TEXCOORD3.xyz)) + tmpvar_14))
    , tmpvar_13)), exp2((
      (_mtl_u._Gloss * 10.0)
     + 1.0))))
   * 
    ((_SpecularMap_var_6.xyz * _mtl_u._SpecIntensity) * _mtl_u._Speccolor.xyz)
  )) * (_DiffuseMapTransA_var_5.w * _mtl_u._Transparency));
  finalRGBA_4 = half4(tmpvar_22);
  tmpvar_2 = float4(finalRGBA_4);
  _mtl_o._glesFragData_0 = half4(tmpvar_2);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 50 math, 4 textures, 2 branches
Keywords { "DIRECTIONAL_COOKIE" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_DiffuseMapTransA] 2D 1
SetTexture 2 [_NormalMap] 2D 2
SetTexture 3 [_SpecularMap] 2D 3
ConstBuffer "$Globals" 140
Vector 0 [_WorldSpaceCameraPos] 3
VectorHalf 16 [_WorldSpaceLightPos0] 4
VectorHalf 24 [_LightColor0] 4
Vector 32 [_DiffuseMapTransA_ST]
Vector 48 [_Diffusecolor]
Vector 64 [_NormalMap_ST]
Float 80 [_NormalIntensity]
Vector 96 [_SpecularMap_ST]
Vector 112 [_Speccolor]
Float 128 [_SpecIntensity]
Float 132 [_Gloss]
Float 136 [_Transparency]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  bool gl_FrontFacing [[front_facing]];
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float2 xlv_TEXCOORD7;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  half4 _WorldSpaceLightPos0;
  half4 _LightColor0;
  float4 _DiffuseMapTransA_ST;
  float4 _Diffusecolor;
  float4 _NormalMap_ST;
  float _NormalIntensity;
  float4 _SpecularMap_ST;
  float4 _Speccolor;
  float _SpecIntensity;
  float _Gloss;
  float _Transparency;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _LightTexture0 [[texture(0)]], sampler _mtlsmp__LightTexture0 [[sampler(0)]]
  ,   texture2d<half> _DiffuseMapTransA [[texture(1)]], sampler _mtlsmp__DiffuseMapTransA [[sampler(1)]]
  ,   texture2d<half> _NormalMap [[texture(2)]], sampler _mtlsmp__NormalMap [[sampler(2)]]
  ,   texture2d<half> _SpecularMap [[texture(3)]], sampler _mtlsmp__SpecularMap [[sampler(3)]])
{
  xlatMtlShaderOutput _mtl_o;
  float tmpvar_1 = 0;
  if (_mtl_i.gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  float4 tmpvar_2 = 0;
  float3 tmpvar_3 = 0;
  tmpvar_3 = _mtl_i.xlv_TEXCOORD4;
  half4 finalRGBA_4 = 0;
  float4 _DiffuseMapTransA_var_5 = 0;
  float4 _SpecularMap_var_6 = 0;
  float attenuation_7 = 0;
  float3 _NormalMap_var_8 = 0;
  int tmpvar_9 = 0;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_9 = 1;
  } else {
    tmpvar_9 = -1;
  };
  tmpvar_3 = (normalize(_mtl_i.xlv_TEXCOORD4) * float(tmpvar_9));
  float3x3 tmpvar_10;
  tmpvar_10[0].x = _mtl_i.xlv_TEXCOORD5.x;
  tmpvar_10[0].y = _mtl_i.xlv_TEXCOORD6.x;
  tmpvar_10[0].z = tmpvar_3.x;
  tmpvar_10[1].x = _mtl_i.xlv_TEXCOORD5.y;
  tmpvar_10[1].y = _mtl_i.xlv_TEXCOORD6.y;
  tmpvar_10[1].z = tmpvar_3.y;
  tmpvar_10[2].x = _mtl_i.xlv_TEXCOORD5.z;
  tmpvar_10[2].y = _mtl_i.xlv_TEXCOORD6.z;
  tmpvar_10[2].z = tmpvar_3.z;
  float2 P_11 = 0;
  P_11 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._NormalMap_ST.xy) + _mtl_u._NormalMap_ST.zw);
  half3 normal_12 = 0;
  normal_12.xy = ((_NormalMap.sample(_mtlsmp__NormalMap, (float2)(P_11)).wy * (half)(2.0)) - (half)(1.0));
  normal_12.z = sqrt(((half)(1.0) - clamp (
    dot (normal_12.xy, normal_12.xy)
  , (half)0.0, (half)1.0)));
  _NormalMap_var_8 = float3(normal_12);
  float3 tmpvar_13 = 0;
  tmpvar_13 = normalize((mix (float3(0.0, 0.0, 1.0), _NormalMap_var_8, float3(_mtl_u._NormalIntensity)) * tmpvar_10));
  float3 tmpvar_14 = 0;
  tmpvar_14 = normalize(mix ((float3)_mtl_u._WorldSpaceLightPos0.xyz, ((float3)(_mtl_u._WorldSpaceLightPos0.xyz) - _mtl_i.xlv_TEXCOORD3.xyz), (float3)_mtl_u._WorldSpaceLightPos0.www));
  half tmpvar_15 = 0;
  tmpvar_15 = _LightTexture0.sample(_mtlsmp__LightTexture0, (float2)(_mtl_i.xlv_TEXCOORD7)).w;
  attenuation_7 = float(tmpvar_15);
  float3 tmpvar_16 = 0;
  tmpvar_16 = (attenuation_7 * (float3)(_mtl_u._LightColor0.xyz));
  half4 tmpvar_17 = 0;
  float2 P_18 = 0;
  P_18 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._SpecularMap_ST.xy) + _mtl_u._SpecularMap_ST.zw);
  tmpvar_17 = _SpecularMap.sample(_mtlsmp__SpecularMap, (float2)(P_18));
  _SpecularMap_var_6 = float4(tmpvar_17);
  half4 tmpvar_19 = 0;
  float2 P_20 = 0;
  P_20 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._DiffuseMapTransA_ST.xy) + _mtl_u._DiffuseMapTransA_ST.zw);
  tmpvar_19 = _DiffuseMapTransA.sample(_mtlsmp__DiffuseMapTransA, (float2)(P_20));
  _DiffuseMapTransA_var_5 = float4(tmpvar_19);
  float4 tmpvar_21 = 0;
  tmpvar_21.w = 0.0;
  tmpvar_21.xyz = (((
    (max (0.0, dot (tmpvar_13, tmpvar_14)) * tmpvar_16)
   * 
    (_DiffuseMapTransA_var_5.xyz * _mtl_u._Diffusecolor.xyz)
  ) + (
    (tmpvar_16 * pow (max (0.0, dot (
      normalize((normalize((_mtl_u._WorldSpaceCameraPos - _mtl_i.xlv_TEXCOORD3.xyz)) + tmpvar_14))
    , tmpvar_13)), exp2((
      (_mtl_u._Gloss * 10.0)
     + 1.0))))
   * 
    ((_SpecularMap_var_6.xyz * _mtl_u._SpecIntensity) * _mtl_u._Speccolor.xyz)
  )) * (_DiffuseMapTransA_var_5.w * _mtl_u._Transparency));
  finalRGBA_4 = half4(tmpvar_21);
  tmpvar_2 = float4(finalRGBA_4);
  _mtl_o._glesFragData_0 = half4(tmpvar_2);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "POINT" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 51 math, 4 textures, 2 branches
Keywords { "POINT" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_DiffuseMapTransA] 2D 1
SetTexture 2 [_NormalMap] 2D 2
SetTexture 3 [_SpecularMap] 2D 3
ConstBuffer "$Globals" 156
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_WorldSpaceLightPos0]
VectorHalf 32 [_LightColor0] 4
Vector 48 [_DiffuseMapTransA_ST]
Vector 64 [_Diffusecolor]
Vector 80 [_NormalMap_ST]
Float 96 [_NormalIntensity]
Vector 112 [_SpecularMap_ST]
Vector 128 [_Speccolor]
Float 144 [_SpecIntensity]
Float 148 [_Gloss]
Float 152 [_Transparency]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  bool gl_FrontFacing [[front_facing]];
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float3 xlv_TEXCOORD7;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _WorldSpaceLightPos0;
  half4 _LightColor0;
  float4 _DiffuseMapTransA_ST;
  float4 _Diffusecolor;
  float4 _NormalMap_ST;
  float _NormalIntensity;
  float4 _SpecularMap_ST;
  float4 _Speccolor;
  float _SpecIntensity;
  float _Gloss;
  float _Transparency;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _LightTexture0 [[texture(0)]], sampler _mtlsmp__LightTexture0 [[sampler(0)]]
  ,   texture2d<half> _DiffuseMapTransA [[texture(1)]], sampler _mtlsmp__DiffuseMapTransA [[sampler(1)]]
  ,   texture2d<half> _NormalMap [[texture(2)]], sampler _mtlsmp__NormalMap [[sampler(2)]]
  ,   texture2d<half> _SpecularMap [[texture(3)]], sampler _mtlsmp__SpecularMap [[sampler(3)]])
{
  xlatMtlShaderOutput _mtl_o;
  float tmpvar_1 = 0;
  if (_mtl_i.gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  float4 tmpvar_2 = 0;
  float3 tmpvar_3 = 0;
  tmpvar_3 = _mtl_i.xlv_TEXCOORD4;
  half4 finalRGBA_4 = 0;
  float4 _DiffuseMapTransA_var_5 = 0;
  float4 _SpecularMap_var_6 = 0;
  float attenuation_7 = 0;
  float3 _NormalMap_var_8 = 0;
  int tmpvar_9 = 0;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_9 = 1;
  } else {
    tmpvar_9 = -1;
  };
  tmpvar_3 = (normalize(_mtl_i.xlv_TEXCOORD4) * float(tmpvar_9));
  float3x3 tmpvar_10;
  tmpvar_10[0].x = _mtl_i.xlv_TEXCOORD5.x;
  tmpvar_10[0].y = _mtl_i.xlv_TEXCOORD6.x;
  tmpvar_10[0].z = tmpvar_3.x;
  tmpvar_10[1].x = _mtl_i.xlv_TEXCOORD5.y;
  tmpvar_10[1].y = _mtl_i.xlv_TEXCOORD6.y;
  tmpvar_10[1].z = tmpvar_3.y;
  tmpvar_10[2].x = _mtl_i.xlv_TEXCOORD5.z;
  tmpvar_10[2].y = _mtl_i.xlv_TEXCOORD6.z;
  tmpvar_10[2].z = tmpvar_3.z;
  float2 P_11 = 0;
  P_11 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._NormalMap_ST.xy) + _mtl_u._NormalMap_ST.zw);
  half3 normal_12 = 0;
  normal_12.xy = ((_NormalMap.sample(_mtlsmp__NormalMap, (float2)(P_11)).wy * (half)(2.0)) - (half)(1.0));
  normal_12.z = sqrt(((half)(1.0) - clamp (
    dot (normal_12.xy, normal_12.xy)
  , (half)0.0, (half)1.0)));
  _NormalMap_var_8 = float3(normal_12);
  float3 tmpvar_13 = 0;
  tmpvar_13 = normalize((mix (float3(0.0, 0.0, 1.0), _NormalMap_var_8, float3(_mtl_u._NormalIntensity)) * tmpvar_10));
  float3 tmpvar_14 = 0;
  tmpvar_14 = normalize(mix (_mtl_u._WorldSpaceLightPos0.xyz, (_mtl_u._WorldSpaceLightPos0.xyz - _mtl_i.xlv_TEXCOORD3.xyz), _mtl_u._WorldSpaceLightPos0.www));
  float tmpvar_15 = 0;
  tmpvar_15 = dot (_mtl_i.xlv_TEXCOORD7, _mtl_i.xlv_TEXCOORD7);
  half tmpvar_16 = 0;
  tmpvar_16 = _LightTexture0.sample(_mtlsmp__LightTexture0, (float2)(float2(tmpvar_15))).w;
  attenuation_7 = float(tmpvar_16);
  float3 tmpvar_17 = 0;
  tmpvar_17 = (attenuation_7 * (float3)(_mtl_u._LightColor0.xyz));
  half4 tmpvar_18 = 0;
  float2 P_19 = 0;
  P_19 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._SpecularMap_ST.xy) + _mtl_u._SpecularMap_ST.zw);
  tmpvar_18 = _SpecularMap.sample(_mtlsmp__SpecularMap, (float2)(P_19));
  _SpecularMap_var_6 = float4(tmpvar_18);
  half4 tmpvar_20 = 0;
  float2 P_21 = 0;
  P_21 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._DiffuseMapTransA_ST.xy) + _mtl_u._DiffuseMapTransA_ST.zw);
  tmpvar_20 = _DiffuseMapTransA.sample(_mtlsmp__DiffuseMapTransA, (float2)(P_21));
  _DiffuseMapTransA_var_5 = float4(tmpvar_20);
  float4 tmpvar_22 = 0;
  tmpvar_22.w = 0.0;
  tmpvar_22.xyz = (((
    (max (0.0, dot (tmpvar_13, tmpvar_14)) * tmpvar_17)
   * 
    (_DiffuseMapTransA_var_5.xyz * _mtl_u._Diffusecolor.xyz)
  ) + (
    (tmpvar_17 * pow (max (0.0, dot (
      normalize((normalize((_mtl_u._WorldSpaceCameraPos - _mtl_i.xlv_TEXCOORD3.xyz)) + tmpvar_14))
    , tmpvar_13)), exp2((
      (_mtl_u._Gloss * 10.0)
     + 1.0))))
   * 
    ((_SpecularMap_var_6.xyz * _mtl_u._SpecIntensity) * _mtl_u._Speccolor.xyz)
  )) * (_DiffuseMapTransA_var_5.w * _mtl_u._Transparency));
  finalRGBA_4 = half4(tmpvar_22);
  tmpvar_2 = float4(finalRGBA_4);
  _mtl_o._glesFragData_0 = half4(tmpvar_2);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 49 math, 3 textures, 2 branches
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
SetTexture 0 [_DiffuseMapTransA] 2D 0
SetTexture 1 [_NormalMap] 2D 1
SetTexture 2 [_SpecularMap] 2D 2
ConstBuffer "$Globals" 140
Vector 0 [_WorldSpaceCameraPos] 3
VectorHalf 16 [_WorldSpaceLightPos0] 4
VectorHalf 24 [_LightColor0] 4
Vector 32 [_DiffuseMapTransA_ST]
Vector 48 [_Diffusecolor]
Vector 64 [_NormalMap_ST]
Float 80 [_NormalIntensity]
Vector 96 [_SpecularMap_ST]
Vector 112 [_Speccolor]
Float 128 [_SpecIntensity]
Float 132 [_Gloss]
Float 136 [_Transparency]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  bool gl_FrontFacing [[front_facing]];
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  half4 _WorldSpaceLightPos0;
  half4 _LightColor0;
  float4 _DiffuseMapTransA_ST;
  float4 _Diffusecolor;
  float4 _NormalMap_ST;
  float _NormalIntensity;
  float4 _SpecularMap_ST;
  float4 _Speccolor;
  float _SpecIntensity;
  float _Gloss;
  float _Transparency;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _DiffuseMapTransA [[texture(0)]], sampler _mtlsmp__DiffuseMapTransA [[sampler(0)]]
  ,   texture2d<half> _NormalMap [[texture(1)]], sampler _mtlsmp__NormalMap [[sampler(1)]]
  ,   texture2d<half> _SpecularMap [[texture(2)]], sampler _mtlsmp__SpecularMap [[sampler(2)]])
{
  xlatMtlShaderOutput _mtl_o;
  float tmpvar_1 = 0;
  if (_mtl_i.gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  float4 tmpvar_2 = 0;
  float3 tmpvar_3 = 0;
  tmpvar_3 = _mtl_i.xlv_TEXCOORD4;
  half4 finalRGBA_4 = 0;
  float4 _DiffuseMapTransA_var_5 = 0;
  float4 _SpecularMap_var_6 = 0;
  float3 _NormalMap_var_7 = 0;
  int tmpvar_8 = 0;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_8 = 1;
  } else {
    tmpvar_8 = -1;
  };
  tmpvar_3 = (normalize(_mtl_i.xlv_TEXCOORD4) * float(tmpvar_8));
  float3x3 tmpvar_9;
  tmpvar_9[0].x = _mtl_i.xlv_TEXCOORD5.x;
  tmpvar_9[0].y = _mtl_i.xlv_TEXCOORD6.x;
  tmpvar_9[0].z = tmpvar_3.x;
  tmpvar_9[1].x = _mtl_i.xlv_TEXCOORD5.y;
  tmpvar_9[1].y = _mtl_i.xlv_TEXCOORD6.y;
  tmpvar_9[1].z = tmpvar_3.y;
  tmpvar_9[2].x = _mtl_i.xlv_TEXCOORD5.z;
  tmpvar_9[2].y = _mtl_i.xlv_TEXCOORD6.z;
  tmpvar_9[2].z = tmpvar_3.z;
  float2 P_10 = 0;
  P_10 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._NormalMap_ST.xy) + _mtl_u._NormalMap_ST.zw);
  half3 normal_11 = 0;
  normal_11.xy = ((_NormalMap.sample(_mtlsmp__NormalMap, (float2)(P_10)).wy * (half)(2.0)) - (half)(1.0));
  normal_11.z = sqrt(((half)(1.0) - clamp (
    dot (normal_11.xy, normal_11.xy)
  , (half)0.0, (half)1.0)));
  _NormalMap_var_7 = float3(normal_11);
  float3 tmpvar_12 = 0;
  tmpvar_12 = normalize((mix (float3(0.0, 0.0, 1.0), _NormalMap_var_7, float3(_mtl_u._NormalIntensity)) * tmpvar_9));
  float3 tmpvar_13 = 0;
  tmpvar_13 = normalize(mix ((float3)_mtl_u._WorldSpaceLightPos0.xyz, ((float3)(_mtl_u._WorldSpaceLightPos0.xyz) - _mtl_i.xlv_TEXCOORD3.xyz), (float3)_mtl_u._WorldSpaceLightPos0.www));
  float3 tmpvar_14 = 0;
  tmpvar_14 = float3(_mtl_u._LightColor0.xyz);
  half4 tmpvar_15 = 0;
  float2 P_16 = 0;
  P_16 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._SpecularMap_ST.xy) + _mtl_u._SpecularMap_ST.zw);
  tmpvar_15 = _SpecularMap.sample(_mtlsmp__SpecularMap, (float2)(P_16));
  _SpecularMap_var_6 = float4(tmpvar_15);
  half4 tmpvar_17 = 0;
  float2 P_18 = 0;
  P_18 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._DiffuseMapTransA_ST.xy) + _mtl_u._DiffuseMapTransA_ST.zw);
  tmpvar_17 = _DiffuseMapTransA.sample(_mtlsmp__DiffuseMapTransA, (float2)(P_18));
  _DiffuseMapTransA_var_5 = float4(tmpvar_17);
  float4 tmpvar_19 = 0;
  tmpvar_19.w = 0.0;
  tmpvar_19.xyz = (((
    (max (0.0, dot (tmpvar_12, tmpvar_13)) * tmpvar_14)
   * 
    (_DiffuseMapTransA_var_5.xyz * _mtl_u._Diffusecolor.xyz)
  ) + (
    (tmpvar_14 * pow (max (0.0, dot (
      normalize((normalize((_mtl_u._WorldSpaceCameraPos - _mtl_i.xlv_TEXCOORD3.xyz)) + tmpvar_13))
    , tmpvar_12)), exp2((
      (_mtl_u._Gloss * 10.0)
     + 1.0))))
   * 
    ((_SpecularMap_var_6.xyz * _mtl_u._SpecIntensity) * _mtl_u._Speccolor.xyz)
  )) * (_DiffuseMapTransA_var_5.w * _mtl_u._Transparency));
  finalRGBA_4 = half4(tmpvar_19);
  tmpvar_2 = float4(finalRGBA_4);
  _mtl_o._glesFragData_0 = half4(tmpvar_2);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "SPOT" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 57 math, 5 textures, 2 branches
Keywords { "SPOT" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_DiffuseMapTransA] 2D 2
SetTexture 3 [_NormalMap] 2D 3
SetTexture 4 [_SpecularMap] 2D 4
ConstBuffer "$Globals" 156
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_WorldSpaceLightPos0]
VectorHalf 32 [_LightColor0] 4
Vector 48 [_DiffuseMapTransA_ST]
Vector 64 [_Diffusecolor]
Vector 80 [_NormalMap_ST]
Float 96 [_NormalIntensity]
Vector 112 [_SpecularMap_ST]
Vector 128 [_Speccolor]
Float 144 [_SpecIntensity]
Float 148 [_Gloss]
Float 152 [_Transparency]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  bool gl_FrontFacing [[front_facing]];
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float4 xlv_TEXCOORD7;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _WorldSpaceLightPos0;
  half4 _LightColor0;
  float4 _DiffuseMapTransA_ST;
  float4 _Diffusecolor;
  float4 _NormalMap_ST;
  float _NormalIntensity;
  float4 _SpecularMap_ST;
  float4 _Speccolor;
  float _SpecIntensity;
  float _Gloss;
  float _Transparency;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _LightTexture0 [[texture(0)]], sampler _mtlsmp__LightTexture0 [[sampler(0)]]
  ,   texture2d<half> _LightTextureB0 [[texture(1)]], sampler _mtlsmp__LightTextureB0 [[sampler(1)]]
  ,   texture2d<half> _DiffuseMapTransA [[texture(2)]], sampler _mtlsmp__DiffuseMapTransA [[sampler(2)]]
  ,   texture2d<half> _NormalMap [[texture(3)]], sampler _mtlsmp__NormalMap [[sampler(3)]]
  ,   texture2d<half> _SpecularMap [[texture(4)]], sampler _mtlsmp__SpecularMap [[sampler(4)]])
{
  xlatMtlShaderOutput _mtl_o;
  float tmpvar_1 = 0;
  if (_mtl_i.gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  float4 tmpvar_2 = 0;
  float3 tmpvar_3 = 0;
  tmpvar_3 = _mtl_i.xlv_TEXCOORD4;
  half4 finalRGBA_4 = 0;
  float4 _DiffuseMapTransA_var_5 = 0;
  float4 _SpecularMap_var_6 = 0;
  float3 _NormalMap_var_7 = 0;
  int tmpvar_8 = 0;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_8 = 1;
  } else {
    tmpvar_8 = -1;
  };
  tmpvar_3 = (normalize(_mtl_i.xlv_TEXCOORD4) * float(tmpvar_8));
  float3x3 tmpvar_9;
  tmpvar_9[0].x = _mtl_i.xlv_TEXCOORD5.x;
  tmpvar_9[0].y = _mtl_i.xlv_TEXCOORD6.x;
  tmpvar_9[0].z = tmpvar_3.x;
  tmpvar_9[1].x = _mtl_i.xlv_TEXCOORD5.y;
  tmpvar_9[1].y = _mtl_i.xlv_TEXCOORD6.y;
  tmpvar_9[1].z = tmpvar_3.y;
  tmpvar_9[2].x = _mtl_i.xlv_TEXCOORD5.z;
  tmpvar_9[2].y = _mtl_i.xlv_TEXCOORD6.z;
  tmpvar_9[2].z = tmpvar_3.z;
  float2 P_10 = 0;
  P_10 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._NormalMap_ST.xy) + _mtl_u._NormalMap_ST.zw);
  half3 normal_11 = 0;
  normal_11.xy = ((_NormalMap.sample(_mtlsmp__NormalMap, (float2)(P_10)).wy * (half)(2.0)) - (half)(1.0));
  normal_11.z = sqrt(((half)(1.0) - clamp (
    dot (normal_11.xy, normal_11.xy)
  , (half)0.0, (half)1.0)));
  _NormalMap_var_7 = float3(normal_11);
  float3 tmpvar_12 = 0;
  tmpvar_12 = normalize((mix (float3(0.0, 0.0, 1.0), _NormalMap_var_7, float3(_mtl_u._NormalIntensity)) * tmpvar_9));
  float3 tmpvar_13 = 0;
  tmpvar_13 = normalize(mix (_mtl_u._WorldSpaceLightPos0.xyz, (_mtl_u._WorldSpaceLightPos0.xyz - _mtl_i.xlv_TEXCOORD3.xyz), _mtl_u._WorldSpaceLightPos0.www));
  half4 tmpvar_14 = 0;
  float2 P_15 = 0;
  P_15 = ((_mtl_i.xlv_TEXCOORD7.xy / _mtl_i.xlv_TEXCOORD7.w) + 0.5);
  tmpvar_14 = _LightTexture0.sample(_mtlsmp__LightTexture0, (float2)(P_15));
  float tmpvar_16 = 0;
  tmpvar_16 = dot (_mtl_i.xlv_TEXCOORD7.xyz, _mtl_i.xlv_TEXCOORD7.xyz);
  half4 tmpvar_17 = 0;
  tmpvar_17 = _LightTextureB0.sample(_mtlsmp__LightTextureB0, (float2)(float2(tmpvar_16)));
  float3 tmpvar_18 = 0;
  tmpvar_18 = (((
    float((_mtl_i.xlv_TEXCOORD7.z > 0.0))
   * (float)(tmpvar_14.w)) * (float)(tmpvar_17.w)) * (float3)(_mtl_u._LightColor0.xyz));
  half4 tmpvar_19 = 0;
  float2 P_20 = 0;
  P_20 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._SpecularMap_ST.xy) + _mtl_u._SpecularMap_ST.zw);
  tmpvar_19 = _SpecularMap.sample(_mtlsmp__SpecularMap, (float2)(P_20));
  _SpecularMap_var_6 = float4(tmpvar_19);
  half4 tmpvar_21 = 0;
  float2 P_22 = 0;
  P_22 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._DiffuseMapTransA_ST.xy) + _mtl_u._DiffuseMapTransA_ST.zw);
  tmpvar_21 = _DiffuseMapTransA.sample(_mtlsmp__DiffuseMapTransA, (float2)(P_22));
  _DiffuseMapTransA_var_5 = float4(tmpvar_21);
  float4 tmpvar_23 = 0;
  tmpvar_23.w = 0.0;
  tmpvar_23.xyz = (((
    (max (0.0, dot (tmpvar_12, tmpvar_13)) * tmpvar_18)
   * 
    (_DiffuseMapTransA_var_5.xyz * _mtl_u._Diffusecolor.xyz)
  ) + (
    (tmpvar_18 * pow (max (0.0, dot (
      normalize((normalize((_mtl_u._WorldSpaceCameraPos - _mtl_i.xlv_TEXCOORD3.xyz)) + tmpvar_13))
    , tmpvar_12)), exp2((
      (_mtl_u._Gloss * 10.0)
     + 1.0))))
   * 
    ((_SpecularMap_var_6.xyz * _mtl_u._SpecIntensity) * _mtl_u._Speccolor.xyz)
  )) * (_DiffuseMapTransA_var_5.w * _mtl_u._Transparency));
  finalRGBA_4 = half4(tmpvar_23);
  tmpvar_2 = float4(finalRGBA_4);
  _mtl_o._glesFragData_0 = half4(tmpvar_2);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "SPOT" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 52 math, 5 textures, 2 branches
Keywords { "POINT_COOKIE" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
SetTexture 0 [_LightTexture0] CUBE 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_DiffuseMapTransA] 2D 2
SetTexture 3 [_NormalMap] 2D 3
SetTexture 4 [_SpecularMap] 2D 4
ConstBuffer "$Globals" 156
Vector 0 [_WorldSpaceCameraPos] 3
Vector 16 [_WorldSpaceLightPos0]
VectorHalf 32 [_LightColor0] 4
Vector 48 [_DiffuseMapTransA_ST]
Vector 64 [_Diffusecolor]
Vector 80 [_NormalMap_ST]
Float 96 [_NormalIntensity]
Vector 112 [_SpecularMap_ST]
Vector 128 [_Speccolor]
Float 144 [_SpecIntensity]
Float 148 [_Gloss]
Float 152 [_Transparency]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  bool gl_FrontFacing [[front_facing]];
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float3 xlv_TEXCOORD7;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  float4 _WorldSpaceLightPos0;
  half4 _LightColor0;
  float4 _DiffuseMapTransA_ST;
  float4 _Diffusecolor;
  float4 _NormalMap_ST;
  float _NormalIntensity;
  float4 _SpecularMap_ST;
  float4 _Speccolor;
  float _SpecIntensity;
  float _Gloss;
  float _Transparency;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texturecube<half> _LightTexture0 [[texture(0)]], sampler _mtlsmp__LightTexture0 [[sampler(0)]]
  ,   texture2d<half> _LightTextureB0 [[texture(1)]], sampler _mtlsmp__LightTextureB0 [[sampler(1)]]
  ,   texture2d<half> _DiffuseMapTransA [[texture(2)]], sampler _mtlsmp__DiffuseMapTransA [[sampler(2)]]
  ,   texture2d<half> _NormalMap [[texture(3)]], sampler _mtlsmp__NormalMap [[sampler(3)]]
  ,   texture2d<half> _SpecularMap [[texture(4)]], sampler _mtlsmp__SpecularMap [[sampler(4)]])
{
  xlatMtlShaderOutput _mtl_o;
  float tmpvar_1 = 0;
  if (_mtl_i.gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  float4 tmpvar_2 = 0;
  float3 tmpvar_3 = 0;
  tmpvar_3 = _mtl_i.xlv_TEXCOORD4;
  half4 finalRGBA_4 = 0;
  float4 _DiffuseMapTransA_var_5 = 0;
  float4 _SpecularMap_var_6 = 0;
  float attenuation_7 = 0;
  float3 _NormalMap_var_8 = 0;
  int tmpvar_9 = 0;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_9 = 1;
  } else {
    tmpvar_9 = -1;
  };
  tmpvar_3 = (normalize(_mtl_i.xlv_TEXCOORD4) * float(tmpvar_9));
  float3x3 tmpvar_10;
  tmpvar_10[0].x = _mtl_i.xlv_TEXCOORD5.x;
  tmpvar_10[0].y = _mtl_i.xlv_TEXCOORD6.x;
  tmpvar_10[0].z = tmpvar_3.x;
  tmpvar_10[1].x = _mtl_i.xlv_TEXCOORD5.y;
  tmpvar_10[1].y = _mtl_i.xlv_TEXCOORD6.y;
  tmpvar_10[1].z = tmpvar_3.y;
  tmpvar_10[2].x = _mtl_i.xlv_TEXCOORD5.z;
  tmpvar_10[2].y = _mtl_i.xlv_TEXCOORD6.z;
  tmpvar_10[2].z = tmpvar_3.z;
  float2 P_11 = 0;
  P_11 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._NormalMap_ST.xy) + _mtl_u._NormalMap_ST.zw);
  half3 normal_12 = 0;
  normal_12.xy = ((_NormalMap.sample(_mtlsmp__NormalMap, (float2)(P_11)).wy * (half)(2.0)) - (half)(1.0));
  normal_12.z = sqrt(((half)(1.0) - clamp (
    dot (normal_12.xy, normal_12.xy)
  , (half)0.0, (half)1.0)));
  _NormalMap_var_8 = float3(normal_12);
  float3 tmpvar_13 = 0;
  tmpvar_13 = normalize((mix (float3(0.0, 0.0, 1.0), _NormalMap_var_8, float3(_mtl_u._NormalIntensity)) * tmpvar_10));
  float3 tmpvar_14 = 0;
  tmpvar_14 = normalize(mix (_mtl_u._WorldSpaceLightPos0.xyz, (_mtl_u._WorldSpaceLightPos0.xyz - _mtl_i.xlv_TEXCOORD3.xyz), _mtl_u._WorldSpaceLightPos0.www));
  float tmpvar_15 = 0;
  tmpvar_15 = dot (_mtl_i.xlv_TEXCOORD7, _mtl_i.xlv_TEXCOORD7);
  half tmpvar_16 = 0;
  tmpvar_16 = (_LightTextureB0.sample(_mtlsmp__LightTextureB0, (float2)(float2(tmpvar_15))).w * _LightTexture0.sample(_mtlsmp__LightTexture0, (float3)(_mtl_i.xlv_TEXCOORD7)).w);
  attenuation_7 = float(tmpvar_16);
  float3 tmpvar_17 = 0;
  tmpvar_17 = (attenuation_7 * (float3)(_mtl_u._LightColor0.xyz));
  half4 tmpvar_18 = 0;
  float2 P_19 = 0;
  P_19 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._SpecularMap_ST.xy) + _mtl_u._SpecularMap_ST.zw);
  tmpvar_18 = _SpecularMap.sample(_mtlsmp__SpecularMap, (float2)(P_19));
  _SpecularMap_var_6 = float4(tmpvar_18);
  half4 tmpvar_20 = 0;
  float2 P_21 = 0;
  P_21 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._DiffuseMapTransA_ST.xy) + _mtl_u._DiffuseMapTransA_ST.zw);
  tmpvar_20 = _DiffuseMapTransA.sample(_mtlsmp__DiffuseMapTransA, (float2)(P_21));
  _DiffuseMapTransA_var_5 = float4(tmpvar_20);
  float4 tmpvar_22 = 0;
  tmpvar_22.w = 0.0;
  tmpvar_22.xyz = (((
    (max (0.0, dot (tmpvar_13, tmpvar_14)) * tmpvar_17)
   * 
    (_DiffuseMapTransA_var_5.xyz * _mtl_u._Diffusecolor.xyz)
  ) + (
    (tmpvar_17 * pow (max (0.0, dot (
      normalize((normalize((_mtl_u._WorldSpaceCameraPos - _mtl_i.xlv_TEXCOORD3.xyz)) + tmpvar_14))
    , tmpvar_13)), exp2((
      (_mtl_u._Gloss * 10.0)
     + 1.0))))
   * 
    ((_SpecularMap_var_6.xyz * _mtl_u._SpecIntensity) * _mtl_u._Speccolor.xyz)
  )) * (_DiffuseMapTransA_var_5.w * _mtl_u._Transparency));
  finalRGBA_4 = half4(tmpvar_22);
  tmpvar_2 = float4(finalRGBA_4);
  _mtl_o._glesFragData_0 = half4(tmpvar_2);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on glcore"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on opengl"
}
SubProgram "metal " {
// Stats: 50 math, 4 textures, 2 branches
Keywords { "DIRECTIONAL_COOKIE" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_DiffuseMapTransA] 2D 1
SetTexture 2 [_NormalMap] 2D 2
SetTexture 3 [_SpecularMap] 2D 3
ConstBuffer "$Globals" 140
Vector 0 [_WorldSpaceCameraPos] 3
VectorHalf 16 [_WorldSpaceLightPos0] 4
VectorHalf 24 [_LightColor0] 4
Vector 32 [_DiffuseMapTransA_ST]
Vector 48 [_Diffusecolor]
Vector 64 [_NormalMap_ST]
Float 80 [_NormalIntensity]
Vector 96 [_SpecularMap_ST]
Vector 112 [_Speccolor]
Float 128 [_SpecIntensity]
Float 132 [_Gloss]
Float 136 [_Transparency]
"#include <metal_stdlib>
#pragma clang diagnostic ignored "-Wparentheses-equality"
using namespace metal;
struct xlatMtlShaderInput {
  bool gl_FrontFacing [[front_facing]];
  float2 xlv_TEXCOORD0;
  float4 xlv_TEXCOORD3;
  float3 xlv_TEXCOORD4;
  float3 xlv_TEXCOORD5;
  float3 xlv_TEXCOORD6;
  float2 xlv_TEXCOORD7;
};
struct xlatMtlShaderOutput {
  half4 _glesFragData_0 [[color(0)]];
};
struct xlatMtlShaderUniform {
  float3 _WorldSpaceCameraPos;
  half4 _WorldSpaceLightPos0;
  half4 _LightColor0;
  float4 _DiffuseMapTransA_ST;
  float4 _Diffusecolor;
  float4 _NormalMap_ST;
  float _NormalIntensity;
  float4 _SpecularMap_ST;
  float4 _Speccolor;
  float _SpecIntensity;
  float _Gloss;
  float _Transparency;
};
fragment xlatMtlShaderOutput xlatMtlMain (xlatMtlShaderInput _mtl_i [[stage_in]], constant xlatMtlShaderUniform& _mtl_u [[buffer(0)]]
  ,   texture2d<half> _LightTexture0 [[texture(0)]], sampler _mtlsmp__LightTexture0 [[sampler(0)]]
  ,   texture2d<half> _DiffuseMapTransA [[texture(1)]], sampler _mtlsmp__DiffuseMapTransA [[sampler(1)]]
  ,   texture2d<half> _NormalMap [[texture(2)]], sampler _mtlsmp__NormalMap [[sampler(2)]]
  ,   texture2d<half> _SpecularMap [[texture(3)]], sampler _mtlsmp__SpecularMap [[sampler(3)]])
{
  xlatMtlShaderOutput _mtl_o;
  float tmpvar_1 = 0;
  if (_mtl_i.gl_FrontFacing) {
    tmpvar_1 = 1.0;
  } else {
    tmpvar_1 = -1.0;
  };
  float4 tmpvar_2 = 0;
  float3 tmpvar_3 = 0;
  tmpvar_3 = _mtl_i.xlv_TEXCOORD4;
  half4 finalRGBA_4 = 0;
  float4 _DiffuseMapTransA_var_5 = 0;
  float4 _SpecularMap_var_6 = 0;
  float attenuation_7 = 0;
  float3 _NormalMap_var_8 = 0;
  int tmpvar_9 = 0;
  if ((tmpvar_1 >= 0.0)) {
    tmpvar_9 = 1;
  } else {
    tmpvar_9 = -1;
  };
  tmpvar_3 = (normalize(_mtl_i.xlv_TEXCOORD4) * float(tmpvar_9));
  float3x3 tmpvar_10;
  tmpvar_10[0].x = _mtl_i.xlv_TEXCOORD5.x;
  tmpvar_10[0].y = _mtl_i.xlv_TEXCOORD6.x;
  tmpvar_10[0].z = tmpvar_3.x;
  tmpvar_10[1].x = _mtl_i.xlv_TEXCOORD5.y;
  tmpvar_10[1].y = _mtl_i.xlv_TEXCOORD6.y;
  tmpvar_10[1].z = tmpvar_3.y;
  tmpvar_10[2].x = _mtl_i.xlv_TEXCOORD5.z;
  tmpvar_10[2].y = _mtl_i.xlv_TEXCOORD6.z;
  tmpvar_10[2].z = tmpvar_3.z;
  float2 P_11 = 0;
  P_11 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._NormalMap_ST.xy) + _mtl_u._NormalMap_ST.zw);
  half3 normal_12 = 0;
  normal_12.xy = ((_NormalMap.sample(_mtlsmp__NormalMap, (float2)(P_11)).wy * (half)(2.0)) - (half)(1.0));
  normal_12.z = sqrt(((half)(1.0) - clamp (
    dot (normal_12.xy, normal_12.xy)
  , (half)0.0, (half)1.0)));
  _NormalMap_var_8 = float3(normal_12);
  float3 tmpvar_13 = 0;
  tmpvar_13 = normalize((mix (float3(0.0, 0.0, 1.0), _NormalMap_var_8, float3(_mtl_u._NormalIntensity)) * tmpvar_10));
  float3 tmpvar_14 = 0;
  tmpvar_14 = normalize(mix ((float3)_mtl_u._WorldSpaceLightPos0.xyz, ((float3)(_mtl_u._WorldSpaceLightPos0.xyz) - _mtl_i.xlv_TEXCOORD3.xyz), (float3)_mtl_u._WorldSpaceLightPos0.www));
  half tmpvar_15 = 0;
  tmpvar_15 = _LightTexture0.sample(_mtlsmp__LightTexture0, (float2)(_mtl_i.xlv_TEXCOORD7)).w;
  attenuation_7 = float(tmpvar_15);
  float3 tmpvar_16 = 0;
  tmpvar_16 = (attenuation_7 * (float3)(_mtl_u._LightColor0.xyz));
  half4 tmpvar_17 = 0;
  float2 P_18 = 0;
  P_18 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._SpecularMap_ST.xy) + _mtl_u._SpecularMap_ST.zw);
  tmpvar_17 = _SpecularMap.sample(_mtlsmp__SpecularMap, (float2)(P_18));
  _SpecularMap_var_6 = float4(tmpvar_17);
  half4 tmpvar_19 = 0;
  float2 P_20 = 0;
  P_20 = ((_mtl_i.xlv_TEXCOORD0 * _mtl_u._DiffuseMapTransA_ST.xy) + _mtl_u._DiffuseMapTransA_ST.zw);
  tmpvar_19 = _DiffuseMapTransA.sample(_mtlsmp__DiffuseMapTransA, (float2)(P_20));
  _DiffuseMapTransA_var_5 = float4(tmpvar_19);
  float4 tmpvar_21 = 0;
  tmpvar_21.w = 0.0;
  tmpvar_21.xyz = (((
    (max (0.0, dot (tmpvar_13, tmpvar_14)) * tmpvar_16)
   * 
    (_DiffuseMapTransA_var_5.xyz * _mtl_u._Diffusecolor.xyz)
  ) + (
    (tmpvar_16 * pow (max (0.0, dot (
      normalize((normalize((_mtl_u._WorldSpaceCameraPos - _mtl_i.xlv_TEXCOORD3.xyz)) + tmpvar_14))
    , tmpvar_13)), exp2((
      (_mtl_u._Gloss * 10.0)
     + 1.0))))
   * 
    ((_SpecularMap_var_6.xyz * _mtl_u._SpecIntensity) * _mtl_u._Speccolor.xyz)
  )) * (_DiffuseMapTransA_var_5.w * _mtl_u._Transparency));
  finalRGBA_4 = half4(tmpvar_21);
  tmpvar_2 = float4(finalRGBA_4);
  _mtl_o._glesFragData_0 = half4(tmpvar_2);
  return _mtl_o;
}

"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on glcore"
}
}
 }
}
CustomEditor "ShaderForgeMaterialInspector"
Fallback "Diffuse"
}