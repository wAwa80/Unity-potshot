Shader "Ghost/Models" {
	Properties {
		_Color ("Color", Vector) = (0.5,0.5,0.5,1)
		_Diffuse ("Diffuse", 2D) = "white" {}
		_Glow ("Glow", Float) = 0
		[HideInInspector] _Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5
	}
	SubShader {
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Name "FORWARD"
			Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ZClip Off
			GpuProgramID 33733
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp mat3 tmpvar_1;
					  tmpvar_1[0] = unity_WorldToObject[0].xyz;
					  tmpvar_1[1] = unity_WorldToObject[1].xyz;
					  tmpvar_1[2] = unity_WorldToObject[2].xyz;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD2 = normalize((_glesNormal * tmpvar_1));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 glstate_lightmodel_ambient;
					uniform highp vec4 _LightColor0;
					uniform sampler2D _Diffuse;
					uniform highp vec4 _Diffuse_ST;
					uniform highp vec4 _Color;
					uniform highp float _Glow;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _Diffuse_var_3;
					  highp vec3 lightDirection_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = normalize(_WorldSpaceLightPos0.xyz);
					  lightDirection_4 = tmpvar_5;
					  lowp vec4 tmpvar_6;
					  highp vec2 P_7;
					  P_7 = ((xlv_TEXCOORD0 * _Diffuse_ST.xy) + _Diffuse_ST.zw);
					  tmpvar_6 = texture2D (_Diffuse, P_7);
					  _Diffuse_var_3 = tmpvar_6;
					  highp vec4 tmpvar_8;
					  tmpvar_8.xyz = (((
					    max (0.0, dot (normalize(xlv_TEXCOORD2), lightDirection_4))
					   * _LightColor0.xyz) + (glstate_lightmodel_ambient * 2.0).xyz) * ((_Diffuse_var_3.xyz * _Color.xyz) * _Glow));
					  tmpvar_8.w = _Color.w;
					  finalRGBA_2 = tmpvar_8;
					  tmpvar_1 = finalRGBA_2;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp mat3 tmpvar_1;
					  tmpvar_1[0] = unity_WorldToObject[0].xyz;
					  tmpvar_1[1] = unity_WorldToObject[1].xyz;
					  tmpvar_1[2] = unity_WorldToObject[2].xyz;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD2 = normalize((_glesNormal * tmpvar_1));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 glstate_lightmodel_ambient;
					uniform highp vec4 _LightColor0;
					uniform sampler2D _Diffuse;
					uniform highp vec4 _Diffuse_ST;
					uniform highp vec4 _Color;
					uniform highp float _Glow;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _Diffuse_var_3;
					  highp vec3 lightDirection_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = normalize(_WorldSpaceLightPos0.xyz);
					  lightDirection_4 = tmpvar_5;
					  lowp vec4 tmpvar_6;
					  highp vec2 P_7;
					  P_7 = ((xlv_TEXCOORD0 * _Diffuse_ST.xy) + _Diffuse_ST.zw);
					  tmpvar_6 = texture2D (_Diffuse, P_7);
					  _Diffuse_var_3 = tmpvar_6;
					  highp vec4 tmpvar_8;
					  tmpvar_8.xyz = (((
					    max (0.0, dot (normalize(xlv_TEXCOORD2), lightDirection_4))
					   * _LightColor0.xyz) + (glstate_lightmodel_ambient * 2.0).xyz) * ((_Diffuse_var_3.xyz * _Color.xyz) * _Glow));
					  tmpvar_8.w = _Color.w;
					  finalRGBA_2 = tmpvar_8;
					  tmpvar_1 = finalRGBA_2;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp mat3 tmpvar_1;
					  tmpvar_1[0] = unity_WorldToObject[0].xyz;
					  tmpvar_1[1] = unity_WorldToObject[1].xyz;
					  tmpvar_1[2] = unity_WorldToObject[2].xyz;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD2 = normalize((_glesNormal * tmpvar_1));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 glstate_lightmodel_ambient;
					uniform highp vec4 _LightColor0;
					uniform sampler2D _Diffuse;
					uniform highp vec4 _Diffuse_ST;
					uniform highp vec4 _Color;
					uniform highp float _Glow;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _Diffuse_var_3;
					  highp vec3 lightDirection_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = normalize(_WorldSpaceLightPos0.xyz);
					  lightDirection_4 = tmpvar_5;
					  lowp vec4 tmpvar_6;
					  highp vec2 P_7;
					  P_7 = ((xlv_TEXCOORD0 * _Diffuse_ST.xy) + _Diffuse_ST.zw);
					  tmpvar_6 = texture2D (_Diffuse, P_7);
					  _Diffuse_var_3 = tmpvar_6;
					  highp vec4 tmpvar_8;
					  tmpvar_8.xyz = (((
					    max (0.0, dot (normalize(xlv_TEXCOORD2), lightDirection_4))
					   * _LightColor0.xyz) + (glstate_lightmodel_ambient * 2.0).xyz) * ((_Diffuse_var_3.xyz * _Color.xyz) * _Glow));
					  tmpvar_8.w = _Color.w;
					  finalRGBA_2 = tmpvar_8;
					  tmpvar_1 = finalRGBA_2;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	vec4 _LightColor0;
					uniform 	vec4 _Diffuse_ST;
					uniform 	vec4 _Color;
					uniform 	float _Glow;
					uniform lowp sampler2D _Diffuse;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat16_1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
					    u_xlat16_1.xyz = u_xlat16_1.xxx * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat16_1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat16_1.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat16_1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2.xyz = texture(_Diffuse, u_xlat2.xy).xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * _Color.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(_Glow);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    SV_Target0.w = _Color.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	vec4 _LightColor0;
					uniform 	vec4 _Diffuse_ST;
					uniform 	vec4 _Color;
					uniform 	float _Glow;
					uniform lowp sampler2D _Diffuse;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat16_1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
					    u_xlat16_1.xyz = u_xlat16_1.xxx * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat16_1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat16_1.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat16_1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2.xyz = texture(_Diffuse, u_xlat2.xy).xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * _Color.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(_Glow);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    SV_Target0.w = _Color.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	vec4 _LightColor0;
					uniform 	vec4 _Diffuse_ST;
					uniform 	vec4 _Color;
					uniform 	float _Glow;
					uniform lowp sampler2D _Diffuse;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat16_1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
					    u_xlat16_1.xyz = u_xlat16_1.xxx * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat16_1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat16_1.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat16_1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2.xyz = texture(_Diffuse, u_xlat2.xy).xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * _Color.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(_Glow);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    SV_Target0.w = _Color.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp mat3 tmpvar_1;
					  tmpvar_1[0] = unity_WorldToObject[0].xyz;
					  tmpvar_1[1] = unity_WorldToObject[1].xyz;
					  tmpvar_1[2] = unity_WorldToObject[2].xyz;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD2 = normalize((_glesNormal * tmpvar_1));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 glstate_lightmodel_ambient;
					uniform highp vec4 _LightColor0;
					uniform sampler2D _Diffuse;
					uniform highp vec4 _Diffuse_ST;
					uniform highp vec4 _Color;
					uniform highp float _Glow;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _Diffuse_var_3;
					  highp vec3 lightDirection_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = normalize(_WorldSpaceLightPos0.xyz);
					  lightDirection_4 = tmpvar_5;
					  lowp vec4 tmpvar_6;
					  highp vec2 P_7;
					  P_7 = ((xlv_TEXCOORD0 * _Diffuse_ST.xy) + _Diffuse_ST.zw);
					  tmpvar_6 = texture2D (_Diffuse, P_7);
					  _Diffuse_var_3 = tmpvar_6;
					  highp vec4 tmpvar_8;
					  tmpvar_8.xyz = (((
					    max (0.0, dot (normalize(xlv_TEXCOORD2), lightDirection_4))
					   * _LightColor0.xyz) + (glstate_lightmodel_ambient * 2.0).xyz) * ((_Diffuse_var_3.xyz * _Color.xyz) * _Glow));
					  tmpvar_8.w = _Color.w;
					  finalRGBA_2 = tmpvar_8;
					  tmpvar_1 = finalRGBA_2;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp mat3 tmpvar_1;
					  tmpvar_1[0] = unity_WorldToObject[0].xyz;
					  tmpvar_1[1] = unity_WorldToObject[1].xyz;
					  tmpvar_1[2] = unity_WorldToObject[2].xyz;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD2 = normalize((_glesNormal * tmpvar_1));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 glstate_lightmodel_ambient;
					uniform highp vec4 _LightColor0;
					uniform sampler2D _Diffuse;
					uniform highp vec4 _Diffuse_ST;
					uniform highp vec4 _Color;
					uniform highp float _Glow;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _Diffuse_var_3;
					  highp vec3 lightDirection_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = normalize(_WorldSpaceLightPos0.xyz);
					  lightDirection_4 = tmpvar_5;
					  lowp vec4 tmpvar_6;
					  highp vec2 P_7;
					  P_7 = ((xlv_TEXCOORD0 * _Diffuse_ST.xy) + _Diffuse_ST.zw);
					  tmpvar_6 = texture2D (_Diffuse, P_7);
					  _Diffuse_var_3 = tmpvar_6;
					  highp vec4 tmpvar_8;
					  tmpvar_8.xyz = (((
					    max (0.0, dot (normalize(xlv_TEXCOORD2), lightDirection_4))
					   * _LightColor0.xyz) + (glstate_lightmodel_ambient * 2.0).xyz) * ((_Diffuse_var_3.xyz * _Color.xyz) * _Glow));
					  tmpvar_8.w = _Color.w;
					  finalRGBA_2 = tmpvar_8;
					  tmpvar_1 = finalRGBA_2;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp mat3 tmpvar_1;
					  tmpvar_1[0] = unity_WorldToObject[0].xyz;
					  tmpvar_1[1] = unity_WorldToObject[1].xyz;
					  tmpvar_1[2] = unity_WorldToObject[2].xyz;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD2 = normalize((_glesNormal * tmpvar_1));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 glstate_lightmodel_ambient;
					uniform highp vec4 _LightColor0;
					uniform sampler2D _Diffuse;
					uniform highp vec4 _Diffuse_ST;
					uniform highp vec4 _Color;
					uniform highp float _Glow;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _Diffuse_var_3;
					  highp vec3 lightDirection_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = normalize(_WorldSpaceLightPos0.xyz);
					  lightDirection_4 = tmpvar_5;
					  lowp vec4 tmpvar_6;
					  highp vec2 P_7;
					  P_7 = ((xlv_TEXCOORD0 * _Diffuse_ST.xy) + _Diffuse_ST.zw);
					  tmpvar_6 = texture2D (_Diffuse, P_7);
					  _Diffuse_var_3 = tmpvar_6;
					  highp vec4 tmpvar_8;
					  tmpvar_8.xyz = (((
					    max (0.0, dot (normalize(xlv_TEXCOORD2), lightDirection_4))
					   * _LightColor0.xyz) + (glstate_lightmodel_ambient * 2.0).xyz) * ((_Diffuse_var_3.xyz * _Color.xyz) * _Glow));
					  tmpvar_8.w = _Color.w;
					  finalRGBA_2 = tmpvar_8;
					  tmpvar_1 = finalRGBA_2;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	vec4 _LightColor0;
					uniform 	vec4 _Diffuse_ST;
					uniform 	vec4 _Color;
					uniform 	float _Glow;
					uniform lowp sampler2D _Diffuse;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat16_1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
					    u_xlat16_1.xyz = u_xlat16_1.xxx * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat16_1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat16_1.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat16_1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2.xyz = texture(_Diffuse, u_xlat2.xy).xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * _Color.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(_Glow);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    SV_Target0.w = _Color.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	vec4 _LightColor0;
					uniform 	vec4 _Diffuse_ST;
					uniform 	vec4 _Color;
					uniform 	float _Glow;
					uniform lowp sampler2D _Diffuse;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat16_1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
					    u_xlat16_1.xyz = u_xlat16_1.xxx * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat16_1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat16_1.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat16_1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2.xyz = texture(_Diffuse, u_xlat2.xy).xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * _Color.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(_Glow);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    SV_Target0.w = _Color.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	vec4 _LightColor0;
					uniform 	vec4 _Diffuse_ST;
					uniform 	vec4 _Color;
					uniform 	float _Glow;
					uniform lowp sampler2D _Diffuse;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat16_1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
					    u_xlat16_1.xyz = u_xlat16_1.xxx * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat16_1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat16_1.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat16_1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2.xyz = texture(_Diffuse, u_xlat2.xy).xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * _Color.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(_Glow);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    SV_Target0.w = _Color.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp mat3 tmpvar_1;
					  tmpvar_1[0] = unity_WorldToObject[0].xyz;
					  tmpvar_1[1] = unity_WorldToObject[1].xyz;
					  tmpvar_1[2] = unity_WorldToObject[2].xyz;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD2 = normalize((_glesNormal * tmpvar_1));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 glstate_lightmodel_ambient;
					uniform highp vec4 _LightColor0;
					uniform sampler2D _Diffuse;
					uniform highp vec4 _Diffuse_ST;
					uniform highp vec4 _Color;
					uniform highp float _Glow;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _Diffuse_var_3;
					  highp vec3 lightDirection_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = normalize(_WorldSpaceLightPos0.xyz);
					  lightDirection_4 = tmpvar_5;
					  lowp vec4 tmpvar_6;
					  highp vec2 P_7;
					  P_7 = ((xlv_TEXCOORD0 * _Diffuse_ST.xy) + _Diffuse_ST.zw);
					  tmpvar_6 = texture2D (_Diffuse, P_7);
					  _Diffuse_var_3 = tmpvar_6;
					  highp vec4 tmpvar_8;
					  tmpvar_8.xyz = (((
					    max (0.0, dot (normalize(xlv_TEXCOORD2), lightDirection_4))
					   * _LightColor0.xyz) + (glstate_lightmodel_ambient * 2.0).xyz) * ((_Diffuse_var_3.xyz * _Color.xyz) * _Glow));
					  tmpvar_8.w = _Color.w;
					  finalRGBA_2 = tmpvar_8;
					  tmpvar_1 = finalRGBA_2;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp mat3 tmpvar_1;
					  tmpvar_1[0] = unity_WorldToObject[0].xyz;
					  tmpvar_1[1] = unity_WorldToObject[1].xyz;
					  tmpvar_1[2] = unity_WorldToObject[2].xyz;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD2 = normalize((_glesNormal * tmpvar_1));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 glstate_lightmodel_ambient;
					uniform highp vec4 _LightColor0;
					uniform sampler2D _Diffuse;
					uniform highp vec4 _Diffuse_ST;
					uniform highp vec4 _Color;
					uniform highp float _Glow;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _Diffuse_var_3;
					  highp vec3 lightDirection_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = normalize(_WorldSpaceLightPos0.xyz);
					  lightDirection_4 = tmpvar_5;
					  lowp vec4 tmpvar_6;
					  highp vec2 P_7;
					  P_7 = ((xlv_TEXCOORD0 * _Diffuse_ST.xy) + _Diffuse_ST.zw);
					  tmpvar_6 = texture2D (_Diffuse, P_7);
					  _Diffuse_var_3 = tmpvar_6;
					  highp vec4 tmpvar_8;
					  tmpvar_8.xyz = (((
					    max (0.0, dot (normalize(xlv_TEXCOORD2), lightDirection_4))
					   * _LightColor0.xyz) + (glstate_lightmodel_ambient * 2.0).xyz) * ((_Diffuse_var_3.xyz * _Color.xyz) * _Glow));
					  tmpvar_8.w = _Color.w;
					  finalRGBA_2 = tmpvar_8;
					  tmpvar_1 = finalRGBA_2;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp mat3 tmpvar_1;
					  tmpvar_1[0] = unity_WorldToObject[0].xyz;
					  tmpvar_1[1] = unity_WorldToObject[1].xyz;
					  tmpvar_1[2] = unity_WorldToObject[2].xyz;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD2 = normalize((_glesNormal * tmpvar_1));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 glstate_lightmodel_ambient;
					uniform highp vec4 _LightColor0;
					uniform sampler2D _Diffuse;
					uniform highp vec4 _Diffuse_ST;
					uniform highp vec4 _Color;
					uniform highp float _Glow;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _Diffuse_var_3;
					  highp vec3 lightDirection_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = normalize(_WorldSpaceLightPos0.xyz);
					  lightDirection_4 = tmpvar_5;
					  lowp vec4 tmpvar_6;
					  highp vec2 P_7;
					  P_7 = ((xlv_TEXCOORD0 * _Diffuse_ST.xy) + _Diffuse_ST.zw);
					  tmpvar_6 = texture2D (_Diffuse, P_7);
					  _Diffuse_var_3 = tmpvar_6;
					  highp vec4 tmpvar_8;
					  tmpvar_8.xyz = (((
					    max (0.0, dot (normalize(xlv_TEXCOORD2), lightDirection_4))
					   * _LightColor0.xyz) + (glstate_lightmodel_ambient * 2.0).xyz) * ((_Diffuse_var_3.xyz * _Color.xyz) * _Glow));
					  tmpvar_8.w = _Color.w;
					  finalRGBA_2 = tmpvar_8;
					  tmpvar_1 = finalRGBA_2;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	vec4 _LightColor0;
					uniform 	vec4 _Diffuse_ST;
					uniform 	vec4 _Color;
					uniform 	float _Glow;
					uniform lowp sampler2D _Diffuse;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat16_1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
					    u_xlat16_1.xyz = u_xlat16_1.xxx * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat16_1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat16_1.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat16_1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2.xyz = texture(_Diffuse, u_xlat2.xy).xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * _Color.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(_Glow);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    SV_Target0.w = _Color.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	vec4 _LightColor0;
					uniform 	vec4 _Diffuse_ST;
					uniform 	vec4 _Color;
					uniform 	float _Glow;
					uniform lowp sampler2D _Diffuse;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat16_1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
					    u_xlat16_1.xyz = u_xlat16_1.xxx * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat16_1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat16_1.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat16_1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2.xyz = texture(_Diffuse, u_xlat2.xy).xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * _Color.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(_Glow);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    SV_Target0.w = _Color.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	vec4 _LightColor0;
					uniform 	vec4 _Diffuse_ST;
					uniform 	vec4 _Color;
					uniform 	float _Glow;
					uniform lowp sampler2D _Diffuse;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat16_1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
					    u_xlat16_1.xyz = u_xlat16_1.xxx * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat16_1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat16_1.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat16_1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2.xyz = texture(_Diffuse, u_xlat2.xy).xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * _Color.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(_Glow);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    SV_Target0.w = _Color.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp mat3 tmpvar_1;
					  tmpvar_1[0] = unity_WorldToObject[0].xyz;
					  tmpvar_1[1] = unity_WorldToObject[1].xyz;
					  tmpvar_1[2] = unity_WorldToObject[2].xyz;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD2 = normalize((_glesNormal * tmpvar_1));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 glstate_lightmodel_ambient;
					uniform highp vec4 _LightColor0;
					uniform sampler2D _Diffuse;
					uniform highp vec4 _Diffuse_ST;
					uniform highp vec4 _Color;
					uniform highp float _Glow;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _Diffuse_var_3;
					  highp vec3 lightDirection_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = normalize(_WorldSpaceLightPos0.xyz);
					  lightDirection_4 = tmpvar_5;
					  lowp vec4 tmpvar_6;
					  highp vec2 P_7;
					  P_7 = ((xlv_TEXCOORD0 * _Diffuse_ST.xy) + _Diffuse_ST.zw);
					  tmpvar_6 = texture2D (_Diffuse, P_7);
					  _Diffuse_var_3 = tmpvar_6;
					  highp vec4 tmpvar_8;
					  tmpvar_8.xyz = (((
					    max (0.0, dot (normalize(xlv_TEXCOORD2), lightDirection_4))
					   * _LightColor0.xyz) + (glstate_lightmodel_ambient * 2.0).xyz) * ((_Diffuse_var_3.xyz * _Color.xyz) * _Glow));
					  tmpvar_8.w = _Color.w;
					  finalRGBA_2 = tmpvar_8;
					  tmpvar_1 = finalRGBA_2;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp mat3 tmpvar_1;
					  tmpvar_1[0] = unity_WorldToObject[0].xyz;
					  tmpvar_1[1] = unity_WorldToObject[1].xyz;
					  tmpvar_1[2] = unity_WorldToObject[2].xyz;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD2 = normalize((_glesNormal * tmpvar_1));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 glstate_lightmodel_ambient;
					uniform highp vec4 _LightColor0;
					uniform sampler2D _Diffuse;
					uniform highp vec4 _Diffuse_ST;
					uniform highp vec4 _Color;
					uniform highp float _Glow;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _Diffuse_var_3;
					  highp vec3 lightDirection_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = normalize(_WorldSpaceLightPos0.xyz);
					  lightDirection_4 = tmpvar_5;
					  lowp vec4 tmpvar_6;
					  highp vec2 P_7;
					  P_7 = ((xlv_TEXCOORD0 * _Diffuse_ST.xy) + _Diffuse_ST.zw);
					  tmpvar_6 = texture2D (_Diffuse, P_7);
					  _Diffuse_var_3 = tmpvar_6;
					  highp vec4 tmpvar_8;
					  tmpvar_8.xyz = (((
					    max (0.0, dot (normalize(xlv_TEXCOORD2), lightDirection_4))
					   * _LightColor0.xyz) + (glstate_lightmodel_ambient * 2.0).xyz) * ((_Diffuse_var_3.xyz * _Color.xyz) * _Glow));
					  tmpvar_8.w = _Color.w;
					  finalRGBA_2 = tmpvar_8;
					  tmpvar_1 = finalRGBA_2;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp mat3 tmpvar_1;
					  tmpvar_1[0] = unity_WorldToObject[0].xyz;
					  tmpvar_1[1] = unity_WorldToObject[1].xyz;
					  tmpvar_1[2] = unity_WorldToObject[2].xyz;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD2 = normalize((_glesNormal * tmpvar_1));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform lowp vec4 glstate_lightmodel_ambient;
					uniform highp vec4 _LightColor0;
					uniform sampler2D _Diffuse;
					uniform highp vec4 _Diffuse_ST;
					uniform highp vec4 _Color;
					uniform highp float _Glow;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _Diffuse_var_3;
					  highp vec3 lightDirection_4;
					  mediump vec3 tmpvar_5;
					  tmpvar_5 = normalize(_WorldSpaceLightPos0.xyz);
					  lightDirection_4 = tmpvar_5;
					  lowp vec4 tmpvar_6;
					  highp vec2 P_7;
					  P_7 = ((xlv_TEXCOORD0 * _Diffuse_ST.xy) + _Diffuse_ST.zw);
					  tmpvar_6 = texture2D (_Diffuse, P_7);
					  _Diffuse_var_3 = tmpvar_6;
					  highp vec4 tmpvar_8;
					  tmpvar_8.xyz = (((
					    max (0.0, dot (normalize(xlv_TEXCOORD2), lightDirection_4))
					   * _LightColor0.xyz) + (glstate_lightmodel_ambient * 2.0).xyz) * ((_Diffuse_var_3.xyz * _Color.xyz) * _Glow));
					  tmpvar_8.w = _Color.w;
					  finalRGBA_2 = tmpvar_8;
					  tmpvar_1 = finalRGBA_2;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	vec4 _LightColor0;
					uniform 	vec4 _Diffuse_ST;
					uniform 	vec4 _Color;
					uniform 	float _Glow;
					uniform lowp sampler2D _Diffuse;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat16_1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
					    u_xlat16_1.xyz = u_xlat16_1.xxx * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat16_1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat16_1.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat16_1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2.xyz = texture(_Diffuse, u_xlat2.xy).xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * _Color.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(_Glow);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    SV_Target0.w = _Color.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	vec4 _LightColor0;
					uniform 	vec4 _Diffuse_ST;
					uniform 	vec4 _Color;
					uniform 	float _Glow;
					uniform lowp sampler2D _Diffuse;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat16_1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
					    u_xlat16_1.xyz = u_xlat16_1.xxx * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat16_1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat16_1.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat16_1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2.xyz = texture(_Diffuse, u_xlat2.xy).xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * _Color.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(_Glow);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    SV_Target0.w = _Color.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	mediump vec4 glstate_lightmodel_ambient;
					uniform 	vec4 _LightColor0;
					uniform 	vec4 _Diffuse_ST;
					uniform 	vec4 _Color;
					uniform 	float _Glow;
					uniform lowp sampler2D _Diffuse;
					in highp vec2 vs_TEXCOORD0;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					mediump vec3 u_xlat16_1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat16_1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
					    u_xlat16_1.xyz = u_xlat16_1.xxx * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat16_1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat16_1.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat16_1.xyz;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2.xyz = texture(_Diffuse, u_xlat2.xy).xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * _Color.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(_Glow);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    SV_Target0.w = _Color.w;
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
					"!!!!GLES3"
				}
			}
		}
		Pass {
			Name "FORWARD_DELTA"
			Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend One One, One One
			ZClip Off
			GpuProgramID 115339
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					Keywords { "POINT" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp mat4 unity_WorldToLight;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  highp mat3 tmpvar_1;
					  tmpvar_1[0] = unity_WorldToObject[0].xyz;
					  tmpvar_1[1] = unity_WorldToObject[1].xyz;
					  tmpvar_1[2] = unity_WorldToObject[2].xyz;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = normalize((_glesNormal * tmpvar_1));
					  xlv_TEXCOORD3 = (unity_WorldToLight * tmpvar_3).xyz;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec4 _WorldSpaceLightPos0;
					uniform sampler2D _LightTexture0;
					uniform highp vec4 _LightColor0;
					uniform sampler2D _Diffuse;
					uniform highp vec4 _Diffuse_ST;
					uniform highp vec4 _Color;
					uniform highp float _Glow;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _Diffuse_var_3;
					  highp float attenuation_4;
					  highp float tmpvar_5;
					  tmpvar_5 = dot (xlv_TEXCOORD3, xlv_TEXCOORD3);
					  lowp float tmpvar_6;
					  tmpvar_6 = texture2D (_LightTexture0, vec2(tmpvar_5)).w;
					  attenuation_4 = tmpvar_6;
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  P_8 = ((xlv_TEXCOORD0 * _Diffuse_ST.xy) + _Diffuse_ST.zw);
					  tmpvar_7 = texture2D (_Diffuse, P_8);
					  _Diffuse_var_3 = tmpvar_7;
					  highp vec4 tmpvar_9;
					  tmpvar_9.w = 0.0;
					  tmpvar_9.xyz = (((
					    max (0.0, dot (normalize(xlv_TEXCOORD2), normalize(mix (_WorldSpaceLightPos0.xyz, 
					      (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz)
					    , _WorldSpaceLightPos0.www))))
					   * 
					    (attenuation_4 * _LightColor0.xyz)
					  ) * (
					    (_Diffuse_var_3.xyz * _Color.xyz)
					   * _Glow)) * _Color.w);
					  finalRGBA_2 = tmpvar_9;
					  tmpvar_1 = finalRGBA_2;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "POINT" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp mat4 unity_WorldToLight;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  highp mat3 tmpvar_1;
					  tmpvar_1[0] = unity_WorldToObject[0].xyz;
					  tmpvar_1[1] = unity_WorldToObject[1].xyz;
					  tmpvar_1[2] = unity_WorldToObject[2].xyz;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = normalize((_glesNormal * tmpvar_1));
					  xlv_TEXCOORD3 = (unity_WorldToLight * tmpvar_3).xyz;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec4 _WorldSpaceLightPos0;
					uniform sampler2D _LightTexture0;
					uniform highp vec4 _LightColor0;
					uniform sampler2D _Diffuse;
					uniform highp vec4 _Diffuse_ST;
					uniform highp vec4 _Color;
					uniform highp float _Glow;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _Diffuse_var_3;
					  highp float attenuation_4;
					  highp float tmpvar_5;
					  tmpvar_5 = dot (xlv_TEXCOORD3, xlv_TEXCOORD3);
					  lowp float tmpvar_6;
					  tmpvar_6 = texture2D (_LightTexture0, vec2(tmpvar_5)).w;
					  attenuation_4 = tmpvar_6;
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  P_8 = ((xlv_TEXCOORD0 * _Diffuse_ST.xy) + _Diffuse_ST.zw);
					  tmpvar_7 = texture2D (_Diffuse, P_8);
					  _Diffuse_var_3 = tmpvar_7;
					  highp vec4 tmpvar_9;
					  tmpvar_9.w = 0.0;
					  tmpvar_9.xyz = (((
					    max (0.0, dot (normalize(xlv_TEXCOORD2), normalize(mix (_WorldSpaceLightPos0.xyz, 
					      (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz)
					    , _WorldSpaceLightPos0.www))))
					   * 
					    (attenuation_4 * _LightColor0.xyz)
					  ) * (
					    (_Diffuse_var_3.xyz * _Color.xyz)
					   * _Glow)) * _Color.w);
					  finalRGBA_2 = tmpvar_9;
					  tmpvar_1 = finalRGBA_2;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "POINT" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp mat4 unity_WorldToLight;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  highp mat3 tmpvar_1;
					  tmpvar_1[0] = unity_WorldToObject[0].xyz;
					  tmpvar_1[1] = unity_WorldToObject[1].xyz;
					  tmpvar_1[2] = unity_WorldToObject[2].xyz;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = normalize((_glesNormal * tmpvar_1));
					  xlv_TEXCOORD3 = (unity_WorldToLight * tmpvar_3).xyz;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec4 _WorldSpaceLightPos0;
					uniform sampler2D _LightTexture0;
					uniform highp vec4 _LightColor0;
					uniform sampler2D _Diffuse;
					uniform highp vec4 _Diffuse_ST;
					uniform highp vec4 _Color;
					uniform highp float _Glow;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _Diffuse_var_3;
					  highp float attenuation_4;
					  highp float tmpvar_5;
					  tmpvar_5 = dot (xlv_TEXCOORD3, xlv_TEXCOORD3);
					  lowp float tmpvar_6;
					  tmpvar_6 = texture2D (_LightTexture0, vec2(tmpvar_5)).w;
					  attenuation_4 = tmpvar_6;
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  P_8 = ((xlv_TEXCOORD0 * _Diffuse_ST.xy) + _Diffuse_ST.zw);
					  tmpvar_7 = texture2D (_Diffuse, P_8);
					  _Diffuse_var_3 = tmpvar_7;
					  highp vec4 tmpvar_9;
					  tmpvar_9.w = 0.0;
					  tmpvar_9.xyz = (((
					    max (0.0, dot (normalize(xlv_TEXCOORD2), normalize(mix (_WorldSpaceLightPos0.xyz, 
					      (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz)
					    , _WorldSpaceLightPos0.www))))
					   * 
					    (attenuation_4 * _LightColor0.xyz)
					  ) * (
					    (_Diffuse_var_3.xyz * _Color.xyz)
					   * _Glow)) * _Color.w);
					  finalRGBA_2 = tmpvar_9;
					  tmpvar_1 = finalRGBA_2;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "POINT" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    vs_TEXCOORD2.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	vec4 _LightColor0;
					uniform 	vec4 _Diffuse_ST;
					uniform 	vec4 _Color;
					uniform 	float _Glow;
					uniform lowp sampler2D _LightTexture0;
					uniform lowp sampler2D _Diffuse;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					lowp float u_xlat10_2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat6 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * vs_TEXCOORD2.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat10_2 = texture(_LightTexture0, u_xlat2.xx).w;
					    u_xlat2.xyz = vec3(u_xlat10_2) * _LightColor0.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xxx;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_1.xyz = texture(_Diffuse, u_xlat1.xy).xyz;
					    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(_Glow);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * _Color.www;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "POINT" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    vs_TEXCOORD2.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	vec4 _LightColor0;
					uniform 	vec4 _Diffuse_ST;
					uniform 	vec4 _Color;
					uniform 	float _Glow;
					uniform lowp sampler2D _LightTexture0;
					uniform lowp sampler2D _Diffuse;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					lowp float u_xlat10_2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat6 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * vs_TEXCOORD2.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat10_2 = texture(_LightTexture0, u_xlat2.xx).w;
					    u_xlat2.xyz = vec3(u_xlat10_2) * _LightColor0.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xxx;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_1.xyz = texture(_Diffuse, u_xlat1.xy).xyz;
					    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(_Glow);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * _Color.www;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "POINT" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    vs_TEXCOORD2.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	vec4 _LightColor0;
					uniform 	vec4 _Diffuse_ST;
					uniform 	vec4 _Color;
					uniform 	float _Glow;
					uniform lowp sampler2D _LightTexture0;
					uniform lowp sampler2D _Diffuse;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					lowp float u_xlat10_2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat6 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * vs_TEXCOORD2.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat10_2 = texture(_LightTexture0, u_xlat2.xx).w;
					    u_xlat2.xyz = vec3(u_xlat10_2) * _LightColor0.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xxx;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_1.xyz = texture(_Diffuse, u_xlat1.xy).xyz;
					    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(_Glow);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * _Color.www;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp mat3 tmpvar_1;
					  tmpvar_1[0] = unity_WorldToObject[0].xyz;
					  tmpvar_1[1] = unity_WorldToObject[1].xyz;
					  tmpvar_1[2] = unity_WorldToObject[2].xyz;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD2 = normalize((_glesNormal * tmpvar_1));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform highp vec4 _LightColor0;
					uniform sampler2D _Diffuse;
					uniform highp vec4 _Diffuse_ST;
					uniform highp vec4 _Color;
					uniform highp float _Glow;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _Diffuse_var_3;
					  lowp vec4 tmpvar_4;
					  highp vec2 P_5;
					  P_5 = ((xlv_TEXCOORD0 * _Diffuse_ST.xy) + _Diffuse_ST.zw);
					  tmpvar_4 = texture2D (_Diffuse, P_5);
					  _Diffuse_var_3 = tmpvar_4;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 0.0;
					  tmpvar_6.xyz = (((
					    max (0.0, dot (normalize(xlv_TEXCOORD2), normalize(mix (_WorldSpaceLightPos0.xyz, 
					      (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz)
					    , _WorldSpaceLightPos0.www))))
					   * _LightColor0.xyz) * (
					    (_Diffuse_var_3.xyz * _Color.xyz)
					   * _Glow)) * _Color.w);
					  finalRGBA_2 = tmpvar_6;
					  tmpvar_1 = finalRGBA_2;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp mat3 tmpvar_1;
					  tmpvar_1[0] = unity_WorldToObject[0].xyz;
					  tmpvar_1[1] = unity_WorldToObject[1].xyz;
					  tmpvar_1[2] = unity_WorldToObject[2].xyz;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD2 = normalize((_glesNormal * tmpvar_1));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform highp vec4 _LightColor0;
					uniform sampler2D _Diffuse;
					uniform highp vec4 _Diffuse_ST;
					uniform highp vec4 _Color;
					uniform highp float _Glow;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _Diffuse_var_3;
					  lowp vec4 tmpvar_4;
					  highp vec2 P_5;
					  P_5 = ((xlv_TEXCOORD0 * _Diffuse_ST.xy) + _Diffuse_ST.zw);
					  tmpvar_4 = texture2D (_Diffuse, P_5);
					  _Diffuse_var_3 = tmpvar_4;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 0.0;
					  tmpvar_6.xyz = (((
					    max (0.0, dot (normalize(xlv_TEXCOORD2), normalize(mix (_WorldSpaceLightPos0.xyz, 
					      (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz)
					    , _WorldSpaceLightPos0.www))))
					   * _LightColor0.xyz) * (
					    (_Diffuse_var_3.xyz * _Color.xyz)
					   * _Glow)) * _Color.w);
					  finalRGBA_2 = tmpvar_6;
					  tmpvar_1 = finalRGBA_2;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp mat3 tmpvar_1;
					  tmpvar_1[0] = unity_WorldToObject[0].xyz;
					  tmpvar_1[1] = unity_WorldToObject[1].xyz;
					  tmpvar_1[2] = unity_WorldToObject[2].xyz;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  xlv_TEXCOORD1 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD2 = normalize((_glesNormal * tmpvar_1));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform highp vec4 _LightColor0;
					uniform sampler2D _Diffuse;
					uniform highp vec4 _Diffuse_ST;
					uniform highp vec4 _Color;
					uniform highp float _Glow;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _Diffuse_var_3;
					  lowp vec4 tmpvar_4;
					  highp vec2 P_5;
					  P_5 = ((xlv_TEXCOORD0 * _Diffuse_ST.xy) + _Diffuse_ST.zw);
					  tmpvar_4 = texture2D (_Diffuse, P_5);
					  _Diffuse_var_3 = tmpvar_4;
					  highp vec4 tmpvar_6;
					  tmpvar_6.w = 0.0;
					  tmpvar_6.xyz = (((
					    max (0.0, dot (normalize(xlv_TEXCOORD2), normalize(mix (_WorldSpaceLightPos0.xyz, 
					      (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz)
					    , _WorldSpaceLightPos0.www))))
					   * _LightColor0.xyz) * (
					    (_Diffuse_var_3.xyz * _Color.xyz)
					   * _Glow)) * _Color.w);
					  finalRGBA_2 = tmpvar_6;
					  tmpvar_1 = finalRGBA_2;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	vec4 _LightColor0;
					uniform 	vec4 _Diffuse_ST;
					uniform 	vec4 _Color;
					uniform 	float _Glow;
					uniform lowp sampler2D _Diffuse;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					lowp vec3 u_xlat10_1;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat6 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * vs_TEXCOORD2.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_1.xyz = texture(_Diffuse, u_xlat1.xy).xyz;
					    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(_Glow);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * _Color.www;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	vec4 _LightColor0;
					uniform 	vec4 _Diffuse_ST;
					uniform 	vec4 _Color;
					uniform 	float _Glow;
					uniform lowp sampler2D _Diffuse;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					lowp vec3 u_xlat10_1;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat6 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * vs_TEXCOORD2.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_1.xyz = texture(_Diffuse, u_xlat1.xy).xyz;
					    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(_Glow);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * _Color.www;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	vec4 _LightColor0;
					uniform 	vec4 _Diffuse_ST;
					uniform 	vec4 _Color;
					uniform 	float _Glow;
					uniform lowp sampler2D _Diffuse;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					lowp vec3 u_xlat10_1;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat6 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * vs_TEXCOORD2.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_1.xyz = texture(_Diffuse, u_xlat1.xy).xyz;
					    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(_Glow);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * _Color.www;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "SPOT" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp mat4 unity_WorldToLight;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec4 xlv_TEXCOORD3;
					void main ()
					{
					  highp mat3 tmpvar_1;
					  tmpvar_1[0] = unity_WorldToObject[0].xyz;
					  tmpvar_1[1] = unity_WorldToObject[1].xyz;
					  tmpvar_1[2] = unity_WorldToObject[2].xyz;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = normalize((_glesNormal * tmpvar_1));
					  xlv_TEXCOORD3 = (unity_WorldToLight * tmpvar_3);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec4 _WorldSpaceLightPos0;
					uniform sampler2D _LightTexture0;
					uniform sampler2D _LightTextureB0;
					uniform highp vec4 _LightColor0;
					uniform sampler2D _Diffuse;
					uniform highp vec4 _Diffuse_ST;
					uniform highp vec4 _Color;
					uniform highp float _Glow;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec4 xlv_TEXCOORD3;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _Diffuse_var_3;
					  lowp vec4 tmpvar_4;
					  highp vec2 P_5;
					  P_5 = ((xlv_TEXCOORD3.xy / xlv_TEXCOORD3.w) + 0.5);
					  tmpvar_4 = texture2D (_LightTexture0, P_5);
					  highp float tmpvar_6;
					  tmpvar_6 = dot (xlv_TEXCOORD3.xyz, xlv_TEXCOORD3.xyz);
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_LightTextureB0, vec2(tmpvar_6));
					  lowp vec4 tmpvar_8;
					  highp vec2 P_9;
					  P_9 = ((xlv_TEXCOORD0 * _Diffuse_ST.xy) + _Diffuse_ST.zw);
					  tmpvar_8 = texture2D (_Diffuse, P_9);
					  _Diffuse_var_3 = tmpvar_8;
					  highp vec4 tmpvar_10;
					  tmpvar_10.w = 0.0;
					  tmpvar_10.xyz = (((
					    max (0.0, dot (normalize(xlv_TEXCOORD2), normalize(mix (_WorldSpaceLightPos0.xyz, 
					      (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz)
					    , _WorldSpaceLightPos0.www))))
					   * 
					    (((float(
					      (xlv_TEXCOORD3.z > 0.0)
					    ) * tmpvar_4.w) * tmpvar_7.w) * _LightColor0.xyz)
					  ) * (
					    (_Diffuse_var_3.xyz * _Color.xyz)
					   * _Glow)) * _Color.w);
					  finalRGBA_2 = tmpvar_10;
					  tmpvar_1 = finalRGBA_2;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "SPOT" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp mat4 unity_WorldToLight;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec4 xlv_TEXCOORD3;
					void main ()
					{
					  highp mat3 tmpvar_1;
					  tmpvar_1[0] = unity_WorldToObject[0].xyz;
					  tmpvar_1[1] = unity_WorldToObject[1].xyz;
					  tmpvar_1[2] = unity_WorldToObject[2].xyz;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = normalize((_glesNormal * tmpvar_1));
					  xlv_TEXCOORD3 = (unity_WorldToLight * tmpvar_3);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec4 _WorldSpaceLightPos0;
					uniform sampler2D _LightTexture0;
					uniform sampler2D _LightTextureB0;
					uniform highp vec4 _LightColor0;
					uniform sampler2D _Diffuse;
					uniform highp vec4 _Diffuse_ST;
					uniform highp vec4 _Color;
					uniform highp float _Glow;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec4 xlv_TEXCOORD3;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _Diffuse_var_3;
					  lowp vec4 tmpvar_4;
					  highp vec2 P_5;
					  P_5 = ((xlv_TEXCOORD3.xy / xlv_TEXCOORD3.w) + 0.5);
					  tmpvar_4 = texture2D (_LightTexture0, P_5);
					  highp float tmpvar_6;
					  tmpvar_6 = dot (xlv_TEXCOORD3.xyz, xlv_TEXCOORD3.xyz);
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_LightTextureB0, vec2(tmpvar_6));
					  lowp vec4 tmpvar_8;
					  highp vec2 P_9;
					  P_9 = ((xlv_TEXCOORD0 * _Diffuse_ST.xy) + _Diffuse_ST.zw);
					  tmpvar_8 = texture2D (_Diffuse, P_9);
					  _Diffuse_var_3 = tmpvar_8;
					  highp vec4 tmpvar_10;
					  tmpvar_10.w = 0.0;
					  tmpvar_10.xyz = (((
					    max (0.0, dot (normalize(xlv_TEXCOORD2), normalize(mix (_WorldSpaceLightPos0.xyz, 
					      (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz)
					    , _WorldSpaceLightPos0.www))))
					   * 
					    (((float(
					      (xlv_TEXCOORD3.z > 0.0)
					    ) * tmpvar_4.w) * tmpvar_7.w) * _LightColor0.xyz)
					  ) * (
					    (_Diffuse_var_3.xyz * _Color.xyz)
					   * _Glow)) * _Color.w);
					  finalRGBA_2 = tmpvar_10;
					  tmpvar_1 = finalRGBA_2;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "SPOT" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp mat4 unity_WorldToLight;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec4 xlv_TEXCOORD3;
					void main ()
					{
					  highp mat3 tmpvar_1;
					  tmpvar_1[0] = unity_WorldToObject[0].xyz;
					  tmpvar_1[1] = unity_WorldToObject[1].xyz;
					  tmpvar_1[2] = unity_WorldToObject[2].xyz;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = normalize((_glesNormal * tmpvar_1));
					  xlv_TEXCOORD3 = (unity_WorldToLight * tmpvar_3);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec4 _WorldSpaceLightPos0;
					uniform sampler2D _LightTexture0;
					uniform sampler2D _LightTextureB0;
					uniform highp vec4 _LightColor0;
					uniform sampler2D _Diffuse;
					uniform highp vec4 _Diffuse_ST;
					uniform highp vec4 _Color;
					uniform highp float _Glow;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec4 xlv_TEXCOORD3;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _Diffuse_var_3;
					  lowp vec4 tmpvar_4;
					  highp vec2 P_5;
					  P_5 = ((xlv_TEXCOORD3.xy / xlv_TEXCOORD3.w) + 0.5);
					  tmpvar_4 = texture2D (_LightTexture0, P_5);
					  highp float tmpvar_6;
					  tmpvar_6 = dot (xlv_TEXCOORD3.xyz, xlv_TEXCOORD3.xyz);
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_LightTextureB0, vec2(tmpvar_6));
					  lowp vec4 tmpvar_8;
					  highp vec2 P_9;
					  P_9 = ((xlv_TEXCOORD0 * _Diffuse_ST.xy) + _Diffuse_ST.zw);
					  tmpvar_8 = texture2D (_Diffuse, P_9);
					  _Diffuse_var_3 = tmpvar_8;
					  highp vec4 tmpvar_10;
					  tmpvar_10.w = 0.0;
					  tmpvar_10.xyz = (((
					    max (0.0, dot (normalize(xlv_TEXCOORD2), normalize(mix (_WorldSpaceLightPos0.xyz, 
					      (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz)
					    , _WorldSpaceLightPos0.www))))
					   * 
					    (((float(
					      (xlv_TEXCOORD3.z > 0.0)
					    ) * tmpvar_4.w) * tmpvar_7.w) * _LightColor0.xyz)
					  ) * (
					    (_Diffuse_var_3.xyz * _Color.xyz)
					   * _Glow)) * _Color.w);
					  finalRGBA_2 = tmpvar_10;
					  tmpvar_1 = finalRGBA_2;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "SPOT" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    vs_TEXCOORD2.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD3 = hlslcc_mtx4x4unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	vec4 _LightColor0;
					uniform 	vec4 _Diffuse_ST;
					uniform 	vec4 _Color;
					uniform 	float _Glow;
					uniform lowp sampler2D _LightTexture0;
					uniform lowp sampler2D _LightTextureB0;
					uniform lowp sampler2D _Diffuse;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec4 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp float u_xlat10_0;
					mediump float u_xlat16_1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					vec3 u_xlat3;
					bool u_xlatb4;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
					    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
					    u_xlat10_0 = texture(_LightTexture0, u_xlat0.xy).w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb4 = !!(0.0<vs_TEXCOORD3.z);
					#else
					    u_xlatb4 = 0.0<vs_TEXCOORD3.z;
					#endif
					    u_xlat16_1 = (u_xlatb4) ? 1.0 : 0.0;
					    u_xlat16_1 = u_xlat10_0 * u_xlat16_1;
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat10_0 = texture(_LightTextureB0, u_xlat0.xx).w;
					    u_xlat16_1 = u_xlat10_0 * u_xlat16_1;
					    u_xlat0.xyz = vec3(u_xlat16_1) * _LightColor0.xyz;
					    u_xlat2.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = vec3(u_xlat12) * vs_TEXCOORD2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat2.xyz);
					    u_xlat12 = max(u_xlat12, 0.0);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2.xyz = texture(_Diffuse, u_xlat2.xy).xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * _Color.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(_Glow);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * _Color.www;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "SPOT" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    vs_TEXCOORD2.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD3 = hlslcc_mtx4x4unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	vec4 _LightColor0;
					uniform 	vec4 _Diffuse_ST;
					uniform 	vec4 _Color;
					uniform 	float _Glow;
					uniform lowp sampler2D _LightTexture0;
					uniform lowp sampler2D _LightTextureB0;
					uniform lowp sampler2D _Diffuse;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec4 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp float u_xlat10_0;
					mediump float u_xlat16_1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					vec3 u_xlat3;
					bool u_xlatb4;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
					    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
					    u_xlat10_0 = texture(_LightTexture0, u_xlat0.xy).w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb4 = !!(0.0<vs_TEXCOORD3.z);
					#else
					    u_xlatb4 = 0.0<vs_TEXCOORD3.z;
					#endif
					    u_xlat16_1 = (u_xlatb4) ? 1.0 : 0.0;
					    u_xlat16_1 = u_xlat10_0 * u_xlat16_1;
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat10_0 = texture(_LightTextureB0, u_xlat0.xx).w;
					    u_xlat16_1 = u_xlat10_0 * u_xlat16_1;
					    u_xlat0.xyz = vec3(u_xlat16_1) * _LightColor0.xyz;
					    u_xlat2.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = vec3(u_xlat12) * vs_TEXCOORD2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat2.xyz);
					    u_xlat12 = max(u_xlat12, 0.0);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2.xyz = texture(_Diffuse, u_xlat2.xy).xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * _Color.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(_Glow);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * _Color.www;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "SPOT" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    vs_TEXCOORD2.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD3 = hlslcc_mtx4x4unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	vec4 _LightColor0;
					uniform 	vec4 _Diffuse_ST;
					uniform 	vec4 _Color;
					uniform 	float _Glow;
					uniform lowp sampler2D _LightTexture0;
					uniform lowp sampler2D _LightTextureB0;
					uniform lowp sampler2D _Diffuse;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec4 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					lowp float u_xlat10_0;
					mediump float u_xlat16_1;
					vec3 u_xlat2;
					lowp vec3 u_xlat10_2;
					vec3 u_xlat3;
					bool u_xlatb4;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
					    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
					    u_xlat10_0 = texture(_LightTexture0, u_xlat0.xy).w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlatb4 = !!(0.0<vs_TEXCOORD3.z);
					#else
					    u_xlatb4 = 0.0<vs_TEXCOORD3.z;
					#endif
					    u_xlat16_1 = (u_xlatb4) ? 1.0 : 0.0;
					    u_xlat16_1 = u_xlat10_0 * u_xlat16_1;
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat10_0 = texture(_LightTextureB0, u_xlat0.xx).w;
					    u_xlat16_1 = u_xlat10_0 * u_xlat16_1;
					    u_xlat0.xyz = vec3(u_xlat16_1) * _LightColor0.xyz;
					    u_xlat2.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = vec3(u_xlat12) * vs_TEXCOORD2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat2.xyz);
					    u_xlat12 = max(u_xlat12, 0.0);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_2.xyz = texture(_Diffuse, u_xlat2.xy).xyz;
					    u_xlat2.xyz = u_xlat10_2.xyz * _Color.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(_Glow);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * _Color.www;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "POINT_COOKIE" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp mat4 unity_WorldToLight;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  highp mat3 tmpvar_1;
					  tmpvar_1[0] = unity_WorldToObject[0].xyz;
					  tmpvar_1[1] = unity_WorldToObject[1].xyz;
					  tmpvar_1[2] = unity_WorldToObject[2].xyz;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = normalize((_glesNormal * tmpvar_1));
					  xlv_TEXCOORD3 = (unity_WorldToLight * tmpvar_3).xyz;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec4 _WorldSpaceLightPos0;
					uniform lowp samplerCube _LightTexture0;
					uniform sampler2D _LightTextureB0;
					uniform highp vec4 _LightColor0;
					uniform sampler2D _Diffuse;
					uniform highp vec4 _Diffuse_ST;
					uniform highp vec4 _Color;
					uniform highp float _Glow;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _Diffuse_var_3;
					  highp float attenuation_4;
					  highp float tmpvar_5;
					  tmpvar_5 = dot (xlv_TEXCOORD3, xlv_TEXCOORD3);
					  lowp float tmpvar_6;
					  tmpvar_6 = (texture2D (_LightTextureB0, vec2(tmpvar_5)).w * textureCube (_LightTexture0, xlv_TEXCOORD3).w);
					  attenuation_4 = tmpvar_6;
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  P_8 = ((xlv_TEXCOORD0 * _Diffuse_ST.xy) + _Diffuse_ST.zw);
					  tmpvar_7 = texture2D (_Diffuse, P_8);
					  _Diffuse_var_3 = tmpvar_7;
					  highp vec4 tmpvar_9;
					  tmpvar_9.w = 0.0;
					  tmpvar_9.xyz = (((
					    max (0.0, dot (normalize(xlv_TEXCOORD2), normalize(mix (_WorldSpaceLightPos0.xyz, 
					      (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz)
					    , _WorldSpaceLightPos0.www))))
					   * 
					    (attenuation_4 * _LightColor0.xyz)
					  ) * (
					    (_Diffuse_var_3.xyz * _Color.xyz)
					   * _Glow)) * _Color.w);
					  finalRGBA_2 = tmpvar_9;
					  tmpvar_1 = finalRGBA_2;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "POINT_COOKIE" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp mat4 unity_WorldToLight;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  highp mat3 tmpvar_1;
					  tmpvar_1[0] = unity_WorldToObject[0].xyz;
					  tmpvar_1[1] = unity_WorldToObject[1].xyz;
					  tmpvar_1[2] = unity_WorldToObject[2].xyz;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = normalize((_glesNormal * tmpvar_1));
					  xlv_TEXCOORD3 = (unity_WorldToLight * tmpvar_3).xyz;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec4 _WorldSpaceLightPos0;
					uniform lowp samplerCube _LightTexture0;
					uniform sampler2D _LightTextureB0;
					uniform highp vec4 _LightColor0;
					uniform sampler2D _Diffuse;
					uniform highp vec4 _Diffuse_ST;
					uniform highp vec4 _Color;
					uniform highp float _Glow;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _Diffuse_var_3;
					  highp float attenuation_4;
					  highp float tmpvar_5;
					  tmpvar_5 = dot (xlv_TEXCOORD3, xlv_TEXCOORD3);
					  lowp float tmpvar_6;
					  tmpvar_6 = (texture2D (_LightTextureB0, vec2(tmpvar_5)).w * textureCube (_LightTexture0, xlv_TEXCOORD3).w);
					  attenuation_4 = tmpvar_6;
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  P_8 = ((xlv_TEXCOORD0 * _Diffuse_ST.xy) + _Diffuse_ST.zw);
					  tmpvar_7 = texture2D (_Diffuse, P_8);
					  _Diffuse_var_3 = tmpvar_7;
					  highp vec4 tmpvar_9;
					  tmpvar_9.w = 0.0;
					  tmpvar_9.xyz = (((
					    max (0.0, dot (normalize(xlv_TEXCOORD2), normalize(mix (_WorldSpaceLightPos0.xyz, 
					      (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz)
					    , _WorldSpaceLightPos0.www))))
					   * 
					    (attenuation_4 * _LightColor0.xyz)
					  ) * (
					    (_Diffuse_var_3.xyz * _Color.xyz)
					   * _Glow)) * _Color.w);
					  finalRGBA_2 = tmpvar_9;
					  tmpvar_1 = finalRGBA_2;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "POINT_COOKIE" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp mat4 unity_WorldToLight;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  highp mat3 tmpvar_1;
					  tmpvar_1[0] = unity_WorldToObject[0].xyz;
					  tmpvar_1[1] = unity_WorldToObject[1].xyz;
					  tmpvar_1[2] = unity_WorldToObject[2].xyz;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = normalize((_glesNormal * tmpvar_1));
					  xlv_TEXCOORD3 = (unity_WorldToLight * tmpvar_3).xyz;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec4 _WorldSpaceLightPos0;
					uniform lowp samplerCube _LightTexture0;
					uniform sampler2D _LightTextureB0;
					uniform highp vec4 _LightColor0;
					uniform sampler2D _Diffuse;
					uniform highp vec4 _Diffuse_ST;
					uniform highp vec4 _Color;
					uniform highp float _Glow;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec3 xlv_TEXCOORD3;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _Diffuse_var_3;
					  highp float attenuation_4;
					  highp float tmpvar_5;
					  tmpvar_5 = dot (xlv_TEXCOORD3, xlv_TEXCOORD3);
					  lowp float tmpvar_6;
					  tmpvar_6 = (texture2D (_LightTextureB0, vec2(tmpvar_5)).w * textureCube (_LightTexture0, xlv_TEXCOORD3).w);
					  attenuation_4 = tmpvar_6;
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  P_8 = ((xlv_TEXCOORD0 * _Diffuse_ST.xy) + _Diffuse_ST.zw);
					  tmpvar_7 = texture2D (_Diffuse, P_8);
					  _Diffuse_var_3 = tmpvar_7;
					  highp vec4 tmpvar_9;
					  tmpvar_9.w = 0.0;
					  tmpvar_9.xyz = (((
					    max (0.0, dot (normalize(xlv_TEXCOORD2), normalize(mix (_WorldSpaceLightPos0.xyz, 
					      (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz)
					    , _WorldSpaceLightPos0.www))))
					   * 
					    (attenuation_4 * _LightColor0.xyz)
					  ) * (
					    (_Diffuse_var_3.xyz * _Color.xyz)
					   * _Glow)) * _Color.w);
					  finalRGBA_2 = tmpvar_9;
					  tmpvar_1 = finalRGBA_2;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "POINT_COOKIE" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    vs_TEXCOORD2.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	vec4 _LightColor0;
					uniform 	vec4 _Diffuse_ST;
					uniform 	vec4 _Color;
					uniform 	float _Glow;
					uniform lowp sampler2D _LightTextureB0;
					uniform lowp samplerCube _LightTexture0;
					uniform lowp sampler2D _Diffuse;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					mediump float u_xlat16_2;
					lowp float u_xlat10_2;
					lowp float u_xlat10_4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat6 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * vs_TEXCOORD2.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat10_2 = texture(_LightTextureB0, u_xlat2.xx).w;
					    u_xlat10_4 = texture(_LightTexture0, vs_TEXCOORD3.xyz).w;
					    u_xlat16_2 = u_xlat10_4 * u_xlat10_2;
					    u_xlat2.xyz = vec3(u_xlat16_2) * _LightColor0.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xxx;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_1.xyz = texture(_Diffuse, u_xlat1.xy).xyz;
					    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(_Glow);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * _Color.www;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "POINT_COOKIE" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    vs_TEXCOORD2.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	vec4 _LightColor0;
					uniform 	vec4 _Diffuse_ST;
					uniform 	vec4 _Color;
					uniform 	float _Glow;
					uniform lowp sampler2D _LightTextureB0;
					uniform lowp samplerCube _LightTexture0;
					uniform lowp sampler2D _Diffuse;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					mediump float u_xlat16_2;
					lowp float u_xlat10_2;
					lowp float u_xlat10_4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat6 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * vs_TEXCOORD2.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat10_2 = texture(_LightTextureB0, u_xlat2.xx).w;
					    u_xlat10_4 = texture(_LightTexture0, vs_TEXCOORD3.xyz).w;
					    u_xlat16_2 = u_xlat10_4 * u_xlat10_2;
					    u_xlat2.xyz = vec3(u_xlat16_2) * _LightColor0.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xxx;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_1.xyz = texture(_Diffuse, u_xlat1.xy).xyz;
					    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(_Glow);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * _Color.www;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "POINT_COOKIE" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					out highp vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    vs_TEXCOORD2.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _WorldSpaceLightPos0;
					uniform 	vec4 _LightColor0;
					uniform 	vec4 _Diffuse_ST;
					uniform 	vec4 _Color;
					uniform 	float _Glow;
					uniform lowp sampler2D _LightTextureB0;
					uniform lowp samplerCube _LightTexture0;
					uniform lowp sampler2D _Diffuse;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					in highp vec3 vs_TEXCOORD3;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					mediump float u_xlat16_2;
					lowp float u_xlat10_2;
					lowp float u_xlat10_4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat6 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * vs_TEXCOORD2.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat10_2 = texture(_LightTextureB0, u_xlat2.xx).w;
					    u_xlat10_4 = texture(_LightTexture0, vs_TEXCOORD3.xyz).w;
					    u_xlat16_2 = u_xlat10_4 * u_xlat10_2;
					    u_xlat2.xyz = vec3(u_xlat16_2) * _LightColor0.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xxx;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_1.xyz = texture(_Diffuse, u_xlat1.xy).xyz;
					    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(_Glow);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * _Color.www;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL_COOKIE" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp mat4 unity_WorldToLight;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec2 xlv_TEXCOORD3;
					void main ()
					{
					  highp mat3 tmpvar_1;
					  tmpvar_1[0] = unity_WorldToObject[0].xyz;
					  tmpvar_1[1] = unity_WorldToObject[1].xyz;
					  tmpvar_1[2] = unity_WorldToObject[2].xyz;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = normalize((_glesNormal * tmpvar_1));
					  xlv_TEXCOORD3 = (unity_WorldToLight * tmpvar_3).xy;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform sampler2D _LightTexture0;
					uniform highp vec4 _LightColor0;
					uniform sampler2D _Diffuse;
					uniform highp vec4 _Diffuse_ST;
					uniform highp vec4 _Color;
					uniform highp float _Glow;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec2 xlv_TEXCOORD3;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _Diffuse_var_3;
					  highp float attenuation_4;
					  lowp float tmpvar_5;
					  tmpvar_5 = texture2D (_LightTexture0, xlv_TEXCOORD3).w;
					  attenuation_4 = tmpvar_5;
					  lowp vec4 tmpvar_6;
					  highp vec2 P_7;
					  P_7 = ((xlv_TEXCOORD0 * _Diffuse_ST.xy) + _Diffuse_ST.zw);
					  tmpvar_6 = texture2D (_Diffuse, P_7);
					  _Diffuse_var_3 = tmpvar_6;
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 0.0;
					  tmpvar_8.xyz = (((
					    max (0.0, dot (normalize(xlv_TEXCOORD2), normalize(mix (_WorldSpaceLightPos0.xyz, 
					      (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz)
					    , _WorldSpaceLightPos0.www))))
					   * 
					    (attenuation_4 * _LightColor0.xyz)
					  ) * (
					    (_Diffuse_var_3.xyz * _Color.xyz)
					   * _Glow)) * _Color.w);
					  finalRGBA_2 = tmpvar_8;
					  tmpvar_1 = finalRGBA_2;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL_COOKIE" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp mat4 unity_WorldToLight;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec2 xlv_TEXCOORD3;
					void main ()
					{
					  highp mat3 tmpvar_1;
					  tmpvar_1[0] = unity_WorldToObject[0].xyz;
					  tmpvar_1[1] = unity_WorldToObject[1].xyz;
					  tmpvar_1[2] = unity_WorldToObject[2].xyz;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = normalize((_glesNormal * tmpvar_1));
					  xlv_TEXCOORD3 = (unity_WorldToLight * tmpvar_3).xy;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform sampler2D _LightTexture0;
					uniform highp vec4 _LightColor0;
					uniform sampler2D _Diffuse;
					uniform highp vec4 _Diffuse_ST;
					uniform highp vec4 _Color;
					uniform highp float _Glow;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec2 xlv_TEXCOORD3;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _Diffuse_var_3;
					  highp float attenuation_4;
					  lowp float tmpvar_5;
					  tmpvar_5 = texture2D (_LightTexture0, xlv_TEXCOORD3).w;
					  attenuation_4 = tmpvar_5;
					  lowp vec4 tmpvar_6;
					  highp vec2 P_7;
					  P_7 = ((xlv_TEXCOORD0 * _Diffuse_ST.xy) + _Diffuse_ST.zw);
					  tmpvar_6 = texture2D (_Diffuse, P_7);
					  _Diffuse_var_3 = tmpvar_6;
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 0.0;
					  tmpvar_8.xyz = (((
					    max (0.0, dot (normalize(xlv_TEXCOORD2), normalize(mix (_WorldSpaceLightPos0.xyz, 
					      (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz)
					    , _WorldSpaceLightPos0.www))))
					   * 
					    (attenuation_4 * _LightColor0.xyz)
					  ) * (
					    (_Diffuse_var_3.xyz * _Color.xyz)
					   * _Glow)) * _Color.w);
					  finalRGBA_2 = tmpvar_8;
					  tmpvar_1 = finalRGBA_2;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL_COOKIE" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp mat4 unity_WorldToLight;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec2 xlv_TEXCOORD3;
					void main ()
					{
					  highp mat3 tmpvar_1;
					  tmpvar_1[0] = unity_WorldToObject[0].xyz;
					  tmpvar_1[1] = unity_WorldToObject[1].xyz;
					  tmpvar_1[2] = unity_WorldToObject[2].xyz;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex);
					  xlv_TEXCOORD1 = tmpvar_3;
					  xlv_TEXCOORD2 = normalize((_glesNormal * tmpvar_1));
					  xlv_TEXCOORD3 = (unity_WorldToLight * tmpvar_3).xy;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump vec4 _WorldSpaceLightPos0;
					uniform sampler2D _LightTexture0;
					uniform highp vec4 _LightColor0;
					uniform sampler2D _Diffuse;
					uniform highp vec4 _Diffuse_ST;
					uniform highp vec4 _Color;
					uniform highp float _Glow;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec3 xlv_TEXCOORD2;
					varying highp vec2 xlv_TEXCOORD3;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _Diffuse_var_3;
					  highp float attenuation_4;
					  lowp float tmpvar_5;
					  tmpvar_5 = texture2D (_LightTexture0, xlv_TEXCOORD3).w;
					  attenuation_4 = tmpvar_5;
					  lowp vec4 tmpvar_6;
					  highp vec2 P_7;
					  P_7 = ((xlv_TEXCOORD0 * _Diffuse_ST.xy) + _Diffuse_ST.zw);
					  tmpvar_6 = texture2D (_Diffuse, P_7);
					  _Diffuse_var_3 = tmpvar_6;
					  highp vec4 tmpvar_8;
					  tmpvar_8.w = 0.0;
					  tmpvar_8.xyz = (((
					    max (0.0, dot (normalize(xlv_TEXCOORD2), normalize(mix (_WorldSpaceLightPos0.xyz, 
					      (_WorldSpaceLightPos0.xyz - xlv_TEXCOORD1.xyz)
					    , _WorldSpaceLightPos0.www))))
					   * 
					    (attenuation_4 * _LightColor0.xyz)
					  ) * (
					    (_Diffuse_var_3.xyz * _Color.xyz)
					   * _Glow)) * _Color.w);
					  finalRGBA_2 = tmpvar_8;
					  tmpvar_1 = finalRGBA_2;
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL_COOKIE" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec2 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
					    u_xlat1.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat0.xx + u_xlat1.xy;
					    u_xlat1.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat0.zz + u_xlat1.xy;
					    vs_TEXCOORD3.xy = hlslcc_mtx4x4unity_WorldToLight[3].xy * u_xlat0.ww + u_xlat1.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    vs_TEXCOORD2.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	vec4 _LightColor0;
					uniform 	vec4 _Diffuse_ST;
					uniform 	vec4 _Color;
					uniform 	float _Glow;
					uniform lowp sampler2D _LightTexture0;
					uniform lowp sampler2D _Diffuse;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD3;
					in highp vec4 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					lowp float u_xlat10_2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat6 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * vs_TEXCOORD2.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat10_2 = texture(_LightTexture0, vs_TEXCOORD3.xy).w;
					    u_xlat2.xyz = vec3(u_xlat10_2) * _LightColor0.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xxx;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_1.xyz = texture(_Diffuse, u_xlat1.xy).xyz;
					    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(_Glow);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * _Color.www;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL_COOKIE" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec2 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
					    u_xlat1.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat0.xx + u_xlat1.xy;
					    u_xlat1.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat0.zz + u_xlat1.xy;
					    vs_TEXCOORD3.xy = hlslcc_mtx4x4unity_WorldToLight[3].xy * u_xlat0.ww + u_xlat1.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    vs_TEXCOORD2.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	vec4 _LightColor0;
					uniform 	vec4 _Diffuse_ST;
					uniform 	vec4 _Color;
					uniform 	float _Glow;
					uniform lowp sampler2D _LightTexture0;
					uniform lowp sampler2D _Diffuse;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD3;
					in highp vec4 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					lowp float u_xlat10_2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat6 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * vs_TEXCOORD2.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat10_2 = texture(_LightTexture0, vs_TEXCOORD3.xy).w;
					    u_xlat2.xyz = vec3(u_xlat10_2) * _LightColor0.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xxx;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_1.xyz = texture(_Diffuse, u_xlat1.xy).xyz;
					    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(_Glow);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * _Color.www;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL_COOKIE" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
					in highp vec4 in_POSITION0;
					in highp vec3 in_NORMAL0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec2 vs_TEXCOORD3;
					out highp vec4 vs_TEXCOORD1;
					out highp vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
					    u_xlat1.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat0.xx + u_xlat1.xy;
					    u_xlat1.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat0.zz + u_xlat1.xy;
					    vs_TEXCOORD3.xy = hlslcc_mtx4x4unity_WorldToLight[3].xy * u_xlat0.ww + u_xlat1.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    vs_TEXCOORD2.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 _WorldSpaceLightPos0;
					uniform 	vec4 _LightColor0;
					uniform 	vec4 _Diffuse_ST;
					uniform 	vec4 _Color;
					uniform 	float _Glow;
					uniform lowp sampler2D _LightTexture0;
					uniform lowp sampler2D _Diffuse;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD3;
					in highp vec4 vs_TEXCOORD1;
					in highp vec3 vs_TEXCOORD2;
					layout(location = 0) out highp vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					lowp vec3 u_xlat10_1;
					vec3 u_xlat2;
					lowp float u_xlat10_2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat6 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * vs_TEXCOORD2.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat10_2 = texture(_LightTexture0, vs_TEXCOORD3.xy).w;
					    u_xlat2.xyz = vec3(u_xlat10_2) * _LightColor0.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xxx;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
					    u_xlat10_1.xyz = texture(_Diffuse, u_xlat1.xy).xyz;
					    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(_Glow);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * _Color.www;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					Keywords { "POINT" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "POINT" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "POINT" }
					"!!!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "POINT" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "POINT" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "POINT" }
					"!!!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "SPOT" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "SPOT" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "SPOT" }
					"!!!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "SPOT" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "SPOT" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "SPOT" }
					"!!!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "POINT_COOKIE" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "POINT_COOKIE" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "POINT_COOKIE" }
					"!!!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "POINT_COOKIE" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "POINT_COOKIE" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "POINT_COOKIE" }
					"!!!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL_COOKIE" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "DIRECTIONAL_COOKIE" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "DIRECTIONAL_COOKIE" }
					"!!!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "DIRECTIONAL_COOKIE" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "DIRECTIONAL_COOKIE" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "DIRECTIONAL_COOKIE" }
					"!!!!GLES3"
				}
			}
		}
	}
	Fallback "Diffuse"
	CustomEditor "ShaderForgeMaterialInspector"
}