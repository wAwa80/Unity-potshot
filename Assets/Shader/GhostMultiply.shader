Shader "Ghost/Multiply" {
	Properties {
		_MainCol ("MainCol", Vector) = (0.5,0.5,0.5,1)
		_MainTex ("MainTex", 2D) = "white" {}
		_MaskTex ("MaskTex", 2D) = "white" {}
		[HideInInspector] _Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5
	}
	SubShader {
		LOD 200
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Name "FORWARD"
			LOD 200
			Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ZClip Off
			ZWrite Off
			Cull Off
			GpuProgramID 14423
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					Keywords { "DIRECTIONAL" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform highp vec4 _MainTex_ST;
					uniform sampler2D _MaskTex;
					uniform highp vec4 _MaskTex_ST;
					uniform highp vec4 _MainCol;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _MaskTex_var_3;
					  highp vec4 _MainTex_var_4;
					  lowp vec4 tmpvar_5;
					  highp vec2 P_6;
					  P_6 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
					  tmpvar_5 = texture2D (_MainTex, P_6);
					  _MainTex_var_4 = tmpvar_5;
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  P_8 = ((xlv_TEXCOORD0 * _MaskTex_ST.xy) + _MaskTex_ST.zw);
					  tmpvar_7 = texture2D (_MaskTex, P_8);
					  _MaskTex_var_3 = tmpvar_7;
					  highp vec4 tmpvar_9;
					  tmpvar_9.xyz = ((_MainTex_var_4.xyz * _MaskTex_var_3.xyz) * _MainCol.xyz);
					  tmpvar_9.w = ((_MainTex_var_4.w * _MaskTex_var_3.w) * _MainCol.w);
					  finalRGBA_2 = tmpvar_9;
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
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform highp vec4 _MainTex_ST;
					uniform sampler2D _MaskTex;
					uniform highp vec4 _MaskTex_ST;
					uniform highp vec4 _MainCol;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _MaskTex_var_3;
					  highp vec4 _MainTex_var_4;
					  lowp vec4 tmpvar_5;
					  highp vec2 P_6;
					  P_6 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
					  tmpvar_5 = texture2D (_MainTex, P_6);
					  _MainTex_var_4 = tmpvar_5;
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  P_8 = ((xlv_TEXCOORD0 * _MaskTex_ST.xy) + _MaskTex_ST.zw);
					  tmpvar_7 = texture2D (_MaskTex, P_8);
					  _MaskTex_var_3 = tmpvar_7;
					  highp vec4 tmpvar_9;
					  tmpvar_9.xyz = ((_MainTex_var_4.xyz * _MaskTex_var_3.xyz) * _MainCol.xyz);
					  tmpvar_9.w = ((_MainTex_var_4.w * _MaskTex_var_3.w) * _MainCol.w);
					  finalRGBA_2 = tmpvar_9;
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
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform highp vec4 _MainTex_ST;
					uniform sampler2D _MaskTex;
					uniform highp vec4 _MaskTex_ST;
					uniform highp vec4 _MainCol;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _MaskTex_var_3;
					  highp vec4 _MainTex_var_4;
					  lowp vec4 tmpvar_5;
					  highp vec2 P_6;
					  P_6 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
					  tmpvar_5 = texture2D (_MainTex, P_6);
					  _MainTex_var_4 = tmpvar_5;
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  P_8 = ((xlv_TEXCOORD0 * _MaskTex_ST.xy) + _MaskTex_ST.zw);
					  tmpvar_7 = texture2D (_MaskTex, P_8);
					  _MaskTex_var_3 = tmpvar_7;
					  highp vec4 tmpvar_9;
					  tmpvar_9.xyz = ((_MainTex_var_4.xyz * _MaskTex_var_3.xyz) * _MainCol.xyz);
					  tmpvar_9.w = ((_MainTex_var_4.w * _MaskTex_var_3.w) * _MainCol.w);
					  finalRGBA_2 = tmpvar_9;
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
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _MaskTex_ST;
					uniform 	vec4 _MainCol;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _MaskTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec2 u_xlat1;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
					    u_xlat10_1 = texture(_MaskTex, u_xlat1.xy);
					    u_xlat16_0 = u_xlat10_0 * u_xlat10_1;
					    SV_Target0 = u_xlat16_0 * _MainCol;
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
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _MaskTex_ST;
					uniform 	vec4 _MainCol;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _MaskTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec2 u_xlat1;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
					    u_xlat10_1 = texture(_MaskTex, u_xlat1.xy);
					    u_xlat16_0 = u_xlat10_0 * u_xlat10_1;
					    SV_Target0 = u_xlat16_0 * _MainCol;
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
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _MaskTex_ST;
					uniform 	vec4 _MainCol;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _MaskTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec2 u_xlat1;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
					    u_xlat10_1 = texture(_MaskTex, u_xlat1.xy);
					    u_xlat16_0 = u_xlat10_0 * u_xlat10_1;
					    SV_Target0 = u_xlat16_0 * _MainCol;
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
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform highp vec4 _MainTex_ST;
					uniform sampler2D _MaskTex;
					uniform highp vec4 _MaskTex_ST;
					uniform highp vec4 _MainCol;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _MaskTex_var_3;
					  highp vec4 _MainTex_var_4;
					  lowp vec4 tmpvar_5;
					  highp vec2 P_6;
					  P_6 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
					  tmpvar_5 = texture2D (_MainTex, P_6);
					  _MainTex_var_4 = tmpvar_5;
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  P_8 = ((xlv_TEXCOORD0 * _MaskTex_ST.xy) + _MaskTex_ST.zw);
					  tmpvar_7 = texture2D (_MaskTex, P_8);
					  _MaskTex_var_3 = tmpvar_7;
					  highp vec4 tmpvar_9;
					  tmpvar_9.xyz = ((_MainTex_var_4.xyz * _MaskTex_var_3.xyz) * _MainCol.xyz);
					  tmpvar_9.w = ((_MainTex_var_4.w * _MaskTex_var_3.w) * _MainCol.w);
					  finalRGBA_2 = tmpvar_9;
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
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform highp vec4 _MainTex_ST;
					uniform sampler2D _MaskTex;
					uniform highp vec4 _MaskTex_ST;
					uniform highp vec4 _MainCol;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _MaskTex_var_3;
					  highp vec4 _MainTex_var_4;
					  lowp vec4 tmpvar_5;
					  highp vec2 P_6;
					  P_6 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
					  tmpvar_5 = texture2D (_MainTex, P_6);
					  _MainTex_var_4 = tmpvar_5;
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  P_8 = ((xlv_TEXCOORD0 * _MaskTex_ST.xy) + _MaskTex_ST.zw);
					  tmpvar_7 = texture2D (_MaskTex, P_8);
					  _MaskTex_var_3 = tmpvar_7;
					  highp vec4 tmpvar_9;
					  tmpvar_9.xyz = ((_MainTex_var_4.xyz * _MaskTex_var_3.xyz) * _MainCol.xyz);
					  tmpvar_9.w = ((_MainTex_var_4.w * _MaskTex_var_3.w) * _MainCol.w);
					  finalRGBA_2 = tmpvar_9;
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
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform highp vec4 _MainTex_ST;
					uniform sampler2D _MaskTex;
					uniform highp vec4 _MaskTex_ST;
					uniform highp vec4 _MainCol;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _MaskTex_var_3;
					  highp vec4 _MainTex_var_4;
					  lowp vec4 tmpvar_5;
					  highp vec2 P_6;
					  P_6 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
					  tmpvar_5 = texture2D (_MainTex, P_6);
					  _MainTex_var_4 = tmpvar_5;
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  P_8 = ((xlv_TEXCOORD0 * _MaskTex_ST.xy) + _MaskTex_ST.zw);
					  tmpvar_7 = texture2D (_MaskTex, P_8);
					  _MaskTex_var_3 = tmpvar_7;
					  highp vec4 tmpvar_9;
					  tmpvar_9.xyz = ((_MainTex_var_4.xyz * _MaskTex_var_3.xyz) * _MainCol.xyz);
					  tmpvar_9.w = ((_MainTex_var_4.w * _MaskTex_var_3.w) * _MainCol.w);
					  finalRGBA_2 = tmpvar_9;
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
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _MaskTex_ST;
					uniform 	vec4 _MainCol;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _MaskTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec2 u_xlat1;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
					    u_xlat10_1 = texture(_MaskTex, u_xlat1.xy);
					    u_xlat16_0 = u_xlat10_0 * u_xlat10_1;
					    SV_Target0 = u_xlat16_0 * _MainCol;
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
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _MaskTex_ST;
					uniform 	vec4 _MainCol;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _MaskTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec2 u_xlat1;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
					    u_xlat10_1 = texture(_MaskTex, u_xlat1.xy);
					    u_xlat16_0 = u_xlat10_0 * u_xlat10_1;
					    SV_Target0 = u_xlat16_0 * _MainCol;
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
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _MaskTex_ST;
					uniform 	vec4 _MainCol;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _MaskTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec2 u_xlat1;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
					    u_xlat10_1 = texture(_MaskTex, u_xlat1.xy);
					    u_xlat16_0 = u_xlat10_0 * u_xlat10_1;
					    SV_Target0 = u_xlat16_0 * _MainCol;
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
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform highp vec4 _MainTex_ST;
					uniform sampler2D _MaskTex;
					uniform highp vec4 _MaskTex_ST;
					uniform highp vec4 _MainCol;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _MaskTex_var_3;
					  highp vec4 _MainTex_var_4;
					  lowp vec4 tmpvar_5;
					  highp vec2 P_6;
					  P_6 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
					  tmpvar_5 = texture2D (_MainTex, P_6);
					  _MainTex_var_4 = tmpvar_5;
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  P_8 = ((xlv_TEXCOORD0 * _MaskTex_ST.xy) + _MaskTex_ST.zw);
					  tmpvar_7 = texture2D (_MaskTex, P_8);
					  _MaskTex_var_3 = tmpvar_7;
					  highp vec4 tmpvar_9;
					  tmpvar_9.xyz = ((_MainTex_var_4.xyz * _MaskTex_var_3.xyz) * _MainCol.xyz);
					  tmpvar_9.w = ((_MainTex_var_4.w * _MaskTex_var_3.w) * _MainCol.w);
					  finalRGBA_2 = tmpvar_9;
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
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform highp vec4 _MainTex_ST;
					uniform sampler2D _MaskTex;
					uniform highp vec4 _MaskTex_ST;
					uniform highp vec4 _MainCol;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _MaskTex_var_3;
					  highp vec4 _MainTex_var_4;
					  lowp vec4 tmpvar_5;
					  highp vec2 P_6;
					  P_6 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
					  tmpvar_5 = texture2D (_MainTex, P_6);
					  _MainTex_var_4 = tmpvar_5;
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  P_8 = ((xlv_TEXCOORD0 * _MaskTex_ST.xy) + _MaskTex_ST.zw);
					  tmpvar_7 = texture2D (_MaskTex, P_8);
					  _MaskTex_var_3 = tmpvar_7;
					  highp vec4 tmpvar_9;
					  tmpvar_9.xyz = ((_MainTex_var_4.xyz * _MaskTex_var_3.xyz) * _MainCol.xyz);
					  tmpvar_9.w = ((_MainTex_var_4.w * _MaskTex_var_3.w) * _MainCol.w);
					  finalRGBA_2 = tmpvar_9;
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
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform highp vec4 _MainTex_ST;
					uniform sampler2D _MaskTex;
					uniform highp vec4 _MaskTex_ST;
					uniform highp vec4 _MainCol;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _MaskTex_var_3;
					  highp vec4 _MainTex_var_4;
					  lowp vec4 tmpvar_5;
					  highp vec2 P_6;
					  P_6 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
					  tmpvar_5 = texture2D (_MainTex, P_6);
					  _MainTex_var_4 = tmpvar_5;
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  P_8 = ((xlv_TEXCOORD0 * _MaskTex_ST.xy) + _MaskTex_ST.zw);
					  tmpvar_7 = texture2D (_MaskTex, P_8);
					  _MaskTex_var_3 = tmpvar_7;
					  highp vec4 tmpvar_9;
					  tmpvar_9.xyz = ((_MainTex_var_4.xyz * _MaskTex_var_3.xyz) * _MainCol.xyz);
					  tmpvar_9.w = ((_MainTex_var_4.w * _MaskTex_var_3.w) * _MainCol.w);
					  finalRGBA_2 = tmpvar_9;
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
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _MaskTex_ST;
					uniform 	vec4 _MainCol;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _MaskTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec2 u_xlat1;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
					    u_xlat10_1 = texture(_MaskTex, u_xlat1.xy);
					    u_xlat16_0 = u_xlat10_0 * u_xlat10_1;
					    SV_Target0 = u_xlat16_0 * _MainCol;
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
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _MaskTex_ST;
					uniform 	vec4 _MainCol;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _MaskTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec2 u_xlat1;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
					    u_xlat10_1 = texture(_MaskTex, u_xlat1.xy);
					    u_xlat16_0 = u_xlat10_0 * u_xlat10_1;
					    SV_Target0 = u_xlat16_0 * _MainCol;
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
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _MaskTex_ST;
					uniform 	vec4 _MainCol;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _MaskTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec2 u_xlat1;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
					    u_xlat10_1 = texture(_MaskTex, u_xlat1.xy);
					    u_xlat16_0 = u_xlat10_0 * u_xlat10_1;
					    SV_Target0 = u_xlat16_0 * _MainCol;
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
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform highp vec4 _MainTex_ST;
					uniform sampler2D _MaskTex;
					uniform highp vec4 _MaskTex_ST;
					uniform highp vec4 _MainCol;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _MaskTex_var_3;
					  highp vec4 _MainTex_var_4;
					  lowp vec4 tmpvar_5;
					  highp vec2 P_6;
					  P_6 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
					  tmpvar_5 = texture2D (_MainTex, P_6);
					  _MainTex_var_4 = tmpvar_5;
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  P_8 = ((xlv_TEXCOORD0 * _MaskTex_ST.xy) + _MaskTex_ST.zw);
					  tmpvar_7 = texture2D (_MaskTex, P_8);
					  _MaskTex_var_3 = tmpvar_7;
					  highp vec4 tmpvar_9;
					  tmpvar_9.xyz = ((_MainTex_var_4.xyz * _MaskTex_var_3.xyz) * _MainCol.xyz);
					  tmpvar_9.w = ((_MainTex_var_4.w * _MaskTex_var_3.w) * _MainCol.w);
					  finalRGBA_2 = tmpvar_9;
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
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform highp vec4 _MainTex_ST;
					uniform sampler2D _MaskTex;
					uniform highp vec4 _MaskTex_ST;
					uniform highp vec4 _MainCol;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _MaskTex_var_3;
					  highp vec4 _MainTex_var_4;
					  lowp vec4 tmpvar_5;
					  highp vec2 P_6;
					  P_6 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
					  tmpvar_5 = texture2D (_MainTex, P_6);
					  _MainTex_var_4 = tmpvar_5;
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  P_8 = ((xlv_TEXCOORD0 * _MaskTex_ST.xy) + _MaskTex_ST.zw);
					  tmpvar_7 = texture2D (_MaskTex, P_8);
					  _MaskTex_var_3 = tmpvar_7;
					  highp vec4 tmpvar_9;
					  tmpvar_9.xyz = ((_MainTex_var_4.xyz * _MaskTex_var_3.xyz) * _MainCol.xyz);
					  tmpvar_9.w = ((_MainTex_var_4.w * _MaskTex_var_3.w) * _MainCol.w);
					  finalRGBA_2 = tmpvar_9;
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
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform highp vec4 _MainTex_ST;
					uniform sampler2D _MaskTex;
					uniform highp vec4 _MaskTex_ST;
					uniform highp vec4 _MainCol;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  lowp vec4 finalRGBA_2;
					  highp vec4 _MaskTex_var_3;
					  highp vec4 _MainTex_var_4;
					  lowp vec4 tmpvar_5;
					  highp vec2 P_6;
					  P_6 = ((xlv_TEXCOORD0 * _MainTex_ST.xy) + _MainTex_ST.zw);
					  tmpvar_5 = texture2D (_MainTex, P_6);
					  _MainTex_var_4 = tmpvar_5;
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  P_8 = ((xlv_TEXCOORD0 * _MaskTex_ST.xy) + _MaskTex_ST.zw);
					  tmpvar_7 = texture2D (_MaskTex, P_8);
					  _MaskTex_var_3 = tmpvar_7;
					  highp vec4 tmpvar_9;
					  tmpvar_9.xyz = ((_MainTex_var_4.xyz * _MaskTex_var_3.xyz) * _MainCol.xyz);
					  tmpvar_9.w = ((_MainTex_var_4.w * _MaskTex_var_3.w) * _MainCol.w);
					  finalRGBA_2 = tmpvar_9;
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
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _MaskTex_ST;
					uniform 	vec4 _MainCol;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _MaskTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec2 u_xlat1;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
					    u_xlat10_1 = texture(_MaskTex, u_xlat1.xy);
					    u_xlat16_0 = u_xlat10_0 * u_xlat10_1;
					    SV_Target0 = u_xlat16_0 * _MainCol;
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
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _MaskTex_ST;
					uniform 	vec4 _MainCol;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _MaskTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec2 u_xlat1;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
					    u_xlat10_1 = texture(_MaskTex, u_xlat1.xy);
					    u_xlat16_0 = u_xlat10_0 * u_xlat10_1;
					    SV_Target0 = u_xlat16_0 * _MainCol;
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
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in highp vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _MainTex_ST;
					uniform 	vec4 _MaskTex_ST;
					uniform 	vec4 _MainCol;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _MaskTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec2 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					vec2 u_xlat1;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
					    u_xlat10_1 = texture(_MaskTex, u_xlat1.xy);
					    u_xlat16_0 = u_xlat10_0 * u_xlat10_1;
					    SV_Target0 = u_xlat16_0 * _MainCol;
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
			Name "SHADOWCASTER"
			LOD 200
			Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
			ZClip Off
			Cull Off
			Offset 1, 1
			GpuProgramID 70339
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					Keywords { "SHADOWS_DEPTH" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec4 unity_LightShadowBias;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  highp vec4 clipPos_3;
					  clipPos_3.xyw = tmpvar_1.xyw;
					  clipPos_3.z = (tmpvar_1.z + clamp ((unity_LightShadowBias.x / tmpvar_1.w), 0.0, 1.0));
					  clipPos_3.z = mix (clipPos_3.z, max (clipPos_3.z, -(tmpvar_1.w)), unity_LightShadowBias.y);
					  gl_Position = clipPos_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					void main ()
					{
					  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "SHADOWS_DEPTH" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec4 unity_LightShadowBias;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  highp vec4 clipPos_3;
					  clipPos_3.xyw = tmpvar_1.xyw;
					  clipPos_3.z = (tmpvar_1.z + clamp ((unity_LightShadowBias.x / tmpvar_1.w), 0.0, 1.0));
					  clipPos_3.z = mix (clipPos_3.z, max (clipPos_3.z, -(tmpvar_1.w)), unity_LightShadowBias.y);
					  gl_Position = clipPos_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					void main ()
					{
					  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "SHADOWS_DEPTH" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec4 unity_LightShadowBias;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  highp vec4 tmpvar_2;
					  tmpvar_2.w = 1.0;
					  tmpvar_2.xyz = _glesVertex.xyz;
					  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
					  highp vec4 clipPos_3;
					  clipPos_3.xyw = tmpvar_1.xyw;
					  clipPos_3.z = (tmpvar_1.z + clamp ((unity_LightShadowBias.x / tmpvar_1.w), 0.0, 1.0));
					  clipPos_3.z = mix (clipPos_3.z, max (clipPos_3.z, -(tmpvar_1.w)), unity_LightShadowBias.y);
					  gl_Position = clipPos_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					void main ()
					{
					  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "SHADOWS_DEPTH" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 unity_LightShadowBias;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat4;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat4 = u_xlat0.z + u_xlat1.x;
					    u_xlat1.x = max((-u_xlat0.w), u_xlat4);
					    gl_Position.xyw = u_xlat0.xyw;
					    u_xlat0.x = (-u_xlat4) + u_xlat1.x;
					    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat4;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					layout(location = 0) out highp vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "SHADOWS_DEPTH" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 unity_LightShadowBias;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat4;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat4 = u_xlat0.z + u_xlat1.x;
					    u_xlat1.x = max((-u_xlat0.w), u_xlat4);
					    gl_Position.xyw = u_xlat0.xyw;
					    u_xlat0.x = (-u_xlat4) + u_xlat1.x;
					    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat4;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					layout(location = 0) out highp vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "SHADOWS_DEPTH" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 unity_LightShadowBias;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat4;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
					#else
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					#endif
					    u_xlat4 = u_xlat0.z + u_xlat1.x;
					    u_xlat1.x = max((-u_xlat0.w), u_xlat4);
					    gl_Position.xyw = u_xlat0.xyw;
					    u_xlat0.x = (-u_xlat4) + u_xlat1.x;
					    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat4;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					layout(location = 0) out highp vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "SHADOWS_CUBE" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec4 _LightPositionRange;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec3 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  xlv_TEXCOORD0 = ((unity_ObjectToWorld * _glesVertex).xyz - _LightPositionRange.xyz);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec4 _LightPositionRange;
					uniform highp vec4 unity_LightShadowBias;
					varying highp vec3 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = fract((vec4(1.0, 255.0, 65025.0, 1.658138e+07) * min (
					    ((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) + unity_LightShadowBias.x) * _LightPositionRange.w)
					  , 0.999)));
					  highp vec4 tmpvar_2;
					  tmpvar_2 = (tmpvar_1 - (tmpvar_1.yzww * 0.003921569));
					  gl_FragData[0] = tmpvar_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "SHADOWS_CUBE" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec4 _LightPositionRange;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec3 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  xlv_TEXCOORD0 = ((unity_ObjectToWorld * _glesVertex).xyz - _LightPositionRange.xyz);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec4 _LightPositionRange;
					uniform highp vec4 unity_LightShadowBias;
					varying highp vec3 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = fract((vec4(1.0, 255.0, 65025.0, 1.658138e+07) * min (
					    ((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) + unity_LightShadowBias.x) * _LightPositionRange.w)
					  , 0.999)));
					  highp vec4 tmpvar_2;
					  tmpvar_2 = (tmpvar_1 - (tmpvar_1.yzww * 0.003921569));
					  gl_FragData[0] = tmpvar_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "SHADOWS_CUBE" }
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					uniform highp vec4 _LightPositionRange;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec3 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  xlv_TEXCOORD0 = ((unity_ObjectToWorld * _glesVertex).xyz - _LightPositionRange.xyz);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec4 _LightPositionRange;
					uniform highp vec4 unity_LightShadowBias;
					varying highp vec3 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = fract((vec4(1.0, 255.0, 65025.0, 1.658138e+07) * min (
					    ((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) + unity_LightShadowBias.x) * _LightPositionRange.w)
					  , 0.999)));
					  highp vec4 tmpvar_2;
					  tmpvar_2 = (tmpvar_1 - (tmpvar_1.yzww * 0.003921569));
					  gl_FragData[0] = tmpvar_2;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "SHADOWS_CUBE" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _LightPositionRange;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					out highp vec3 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _LightPositionRange;
					uniform 	vec4 unity_LightShadowBias;
					in highp vec3 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + unity_LightShadowBias.x;
					    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
					    u_xlat0.x = min(u_xlat0.x, 0.999000013);
					    u_xlat0 = u_xlat0.xxxx * vec4(1.0, 255.0, 65025.0, 16581375.0);
					    u_xlat0 = fract(u_xlat0);
					    SV_Target0 = (-u_xlat0.yzww) * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "SHADOWS_CUBE" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _LightPositionRange;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					out highp vec3 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _LightPositionRange;
					uniform 	vec4 unity_LightShadowBias;
					in highp vec3 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + unity_LightShadowBias.x;
					    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
					    u_xlat0.x = min(u_xlat0.x, 0.999000013);
					    u_xlat0 = u_xlat0.xxxx * vec4(1.0, 255.0, 65025.0, 16581375.0);
					    u_xlat0 = fract(u_xlat0);
					    SV_Target0 = (-u_xlat0.yzww) * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "SHADOWS_CUBE" }
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 _LightPositionRange;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					out highp vec3 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _LightPositionRange;
					uniform 	vec4 unity_LightShadowBias;
					in highp vec3 vs_TEXCOORD0;
					layout(location = 0) out highp vec4 SV_Target0;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + unity_LightShadowBias.x;
					    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
					    u_xlat0.x = min(u_xlat0.x, 0.999000013);
					    u_xlat0 = u_xlat0.xxxx * vec4(1.0, 255.0, 65025.0, 16581375.0);
					    u_xlat0 = fract(u_xlat0);
					    SV_Target0 = (-u_xlat0.yzww) * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0;
					    return;
					}
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					Keywords { "SHADOWS_DEPTH" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "SHADOWS_DEPTH" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "SHADOWS_DEPTH" }
					"!!!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "SHADOWS_DEPTH" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "SHADOWS_DEPTH" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "SHADOWS_DEPTH" }
					"!!!!GLES3"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "SHADOWS_CUBE" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "SHADOWS_CUBE" }
					"!!!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "SHADOWS_CUBE" }
					"!!!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					Keywords { "SHADOWS_CUBE" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					Keywords { "SHADOWS_CUBE" }
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					Keywords { "SHADOWS_CUBE" }
					"!!!!GLES3"
				}
			}
		}
	}
	Fallback "Diffuse"
	CustomEditor "ShaderForgeMaterialInspector"
}