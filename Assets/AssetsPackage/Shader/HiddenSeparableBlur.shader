Shader "Hidden/SeparableBlur" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "" {}
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 51521
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 offsets;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec4 xlv_TEXCOORD2;
					varying highp vec4 xlv_TEXCOORD3;
					void main ()
					{
					  mediump vec2 tmpvar_1;
					  tmpvar_1 = _glesMultiTexCoord0.xy;
					  highp vec2 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  tmpvar_2 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = tmpvar_2;
					  highp vec4 tmpvar_4;
					  tmpvar_4 = (offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0));
					  xlv_TEXCOORD1 = (_glesMultiTexCoord0.xyxy + tmpvar_4);
					  xlv_TEXCOORD2 = (_glesMultiTexCoord0.xyxy + (tmpvar_4 * 2.0));
					  xlv_TEXCOORD3 = (_glesMultiTexCoord0.xyxy + (tmpvar_4 * 3.0));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec4 xlv_TEXCOORD2;
					varying highp vec4 xlv_TEXCOORD3;
					void main ()
					{
					  mediump vec4 color_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  color_1 = (0.4 * tmpvar_2);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD1.xy);
					  color_1 = (color_1 + (0.15 * tmpvar_3));
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD1.zw);
					  color_1 = (color_1 + (0.15 * tmpvar_4));
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD2.xy);
					  color_1 = (color_1 + (0.1 * tmpvar_5));
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD2.zw);
					  color_1 = (color_1 + (0.1 * tmpvar_6));
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD3.xy);
					  color_1 = (color_1 + (0.05 * tmpvar_7));
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD3.zw);
					  color_1 = (color_1 + (0.05 * tmpvar_8));
					  gl_FragData[0] = color_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 offsets;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec4 xlv_TEXCOORD2;
					varying highp vec4 xlv_TEXCOORD3;
					void main ()
					{
					  mediump vec2 tmpvar_1;
					  tmpvar_1 = _glesMultiTexCoord0.xy;
					  highp vec2 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  tmpvar_2 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = tmpvar_2;
					  highp vec4 tmpvar_4;
					  tmpvar_4 = (offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0));
					  xlv_TEXCOORD1 = (_glesMultiTexCoord0.xyxy + tmpvar_4);
					  xlv_TEXCOORD2 = (_glesMultiTexCoord0.xyxy + (tmpvar_4 * 2.0));
					  xlv_TEXCOORD3 = (_glesMultiTexCoord0.xyxy + (tmpvar_4 * 3.0));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec4 xlv_TEXCOORD2;
					varying highp vec4 xlv_TEXCOORD3;
					void main ()
					{
					  mediump vec4 color_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  color_1 = (0.4 * tmpvar_2);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD1.xy);
					  color_1 = (color_1 + (0.15 * tmpvar_3));
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD1.zw);
					  color_1 = (color_1 + (0.15 * tmpvar_4));
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD2.xy);
					  color_1 = (color_1 + (0.1 * tmpvar_5));
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD2.zw);
					  color_1 = (color_1 + (0.1 * tmpvar_6));
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD3.xy);
					  color_1 = (color_1 + (0.05 * tmpvar_7));
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD3.zw);
					  color_1 = (color_1 + (0.05 * tmpvar_8));
					  gl_FragData[0] = color_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 offsets;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec4 xlv_TEXCOORD2;
					varying highp vec4 xlv_TEXCOORD3;
					void main ()
					{
					  mediump vec2 tmpvar_1;
					  tmpvar_1 = _glesMultiTexCoord0.xy;
					  highp vec2 tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  tmpvar_2 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					  xlv_TEXCOORD0 = tmpvar_2;
					  highp vec4 tmpvar_4;
					  tmpvar_4 = (offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0));
					  xlv_TEXCOORD1 = (_glesMultiTexCoord0.xyxy + tmpvar_4);
					  xlv_TEXCOORD2 = (_glesMultiTexCoord0.xyxy + (tmpvar_4 * 2.0));
					  xlv_TEXCOORD3 = (_glesMultiTexCoord0.xyxy + (tmpvar_4 * 3.0));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec4 xlv_TEXCOORD1;
					varying highp vec4 xlv_TEXCOORD2;
					varying highp vec4 xlv_TEXCOORD3;
					void main ()
					{
					  mediump vec4 color_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  color_1 = (0.4 * tmpvar_2);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD1.xy);
					  color_1 = (color_1 + (0.15 * tmpvar_3));
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD1.zw);
					  color_1 = (color_1 + (0.15 * tmpvar_4));
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD2.xy);
					  color_1 = (color_1 + (0.1 * tmpvar_5));
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD2.zw);
					  color_1 = (color_1 + (0.1 * tmpvar_6));
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD3.xy);
					  color_1 = (color_1 + (0.05 * tmpvar_7));
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD3.zw);
					  color_1 = (color_1 + (0.05 * tmpvar_8));
					  gl_FragData[0] = color_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 offsets;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
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
					    vs_TEXCOORD1 = offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform lowp sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec4 vs_TEXCOORD2;
					in highp vec4 vs_TEXCOORD3;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat10_0 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.400000006, 0.400000006, 0.400000006, 0.400000006) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat16_0;
					    SV_Target0 = u_xlat16_0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 offsets;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
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
					    vs_TEXCOORD1 = offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform lowp sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec4 vs_TEXCOORD2;
					in highp vec4 vs_TEXCOORD3;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat10_0 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.400000006, 0.400000006, 0.400000006, 0.400000006) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat16_0;
					    SV_Target0 = u_xlat16_0;
					    return;
					}
					
					#endif"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 offsets;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec4 vs_TEXCOORD1;
					out highp vec4 vs_TEXCOORD2;
					out highp vec4 vs_TEXCOORD3;
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
					    vs_TEXCOORD1 = offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform lowp sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec4 vs_TEXCOORD1;
					in highp vec4 vs_TEXCOORD2;
					in highp vec4 vs_TEXCOORD3;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat10_0 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.400000006, 0.400000006, 0.400000006, 0.400000006) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat16_0;
					    SV_Target0 = u_xlat16_0;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan hw_tier00 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 127
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %88 %99 %110 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %86 Location 86 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %88 Location 88 
					                                                     OpDecorate %96 RelaxedPrecision 
					                                                     OpDecorate %97 RelaxedPrecision 
					                                                     OpDecorate %99 Location 99 
					                                                     OpDecorate %107 RelaxedPrecision 
					                                                     OpDecorate %108 RelaxedPrecision 
					                                                     OpDecorate %110 Location 110 
					                                                     OpDecorate %118 RelaxedPrecision 
					                                                     OpDecorate %119 RelaxedPrecision 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                             %14 = OpTypeInt 32 0 
					                                         u32 %15 = OpConstant 4 
					                                             %16 = OpTypeArray %7 %15 
					                                             %17 = OpTypeArray %7 %15 
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
					                                             %21 = OpTypeInt 32 1 
					                                         i32 %22 = OpConstant 0 
					                                         i32 %23 = OpConstant 1 
					                                             %24 = OpTypePointer Uniform %7 
					                                         i32 %35 = OpConstant 2 
					                                         i32 %44 = OpConstant 3 
					                              Private f32_4* %48 = OpVariable Private 
					                                         u32 %68 = OpConstant 1 
					                                             %69 = OpTypeArray %6 %68 
					                                             %70 = OpTypeStruct %7 %6 %69 
					                                             %71 = OpTypePointer Output %70 
					        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                             %80 = OpTypePointer Output %7 
					                                             %82 = OpTypeVector %6 2 
					                                             %83 = OpTypePointer Output %82 
					                               Output f32_2* %84 = OpVariable Output 
					                                             %85 = OpTypePointer Input %82 
					                                Input f32_2* %86 = OpVariable Input 
					                               Output f32_4* %88 = OpVariable Output 
					                                         f32 %92 = OpConstant 3.674022E-40 
					                                         f32 %93 = OpConstant 3.674022E-40 
					                                       f32_4 %94 = OpConstantComposite %92 %92 %93 %93 
					                               Output f32_4* %99 = OpVariable Output 
					                                        f32 %103 = OpConstant 3.674022E-40 
					                                        f32 %104 = OpConstant 3.674022E-40 
					                                      f32_4 %105 = OpConstantComposite %103 %103 %104 %104 
					                              Output f32_4* %110 = OpVariable Output 
					                                        f32 %114 = OpConstant 3.674022E-40 
					                                        f32 %115 = OpConstant 3.674022E-40 
					                                      f32_4 %116 = OpConstantComposite %114 %114 %115 %115 
					                                            %121 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                       f32_4 %12 = OpLoad %11 
					                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_4 %27 = OpFMul %13 %26 
					                                                     OpStore %9 %27 
					                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                       f32_4 %29 = OpLoad %28 
					                                       f32_4 %30 = OpLoad %11 
					                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                       f32_4 %32 = OpFMul %29 %31 
					                                       f32_4 %33 = OpLoad %9 
					                                       f32_4 %34 = OpFAdd %32 %33 
					                                                     OpStore %9 %34 
					                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpLoad %11 
					                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                       f32_4 %40 = OpFMul %37 %39 
					                                       f32_4 %41 = OpLoad %9 
					                                       f32_4 %42 = OpFAdd %40 %41 
					                                                     OpStore %9 %42 
					                                       f32_4 %43 = OpLoad %9 
					                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                       f32_4 %46 = OpLoad %45 
					                                       f32_4 %47 = OpFAdd %43 %46 
					                                                     OpStore %9 %47 
					                                       f32_4 %49 = OpLoad %9 
					                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                       f32_4 %52 = OpLoad %51 
					                                       f32_4 %53 = OpFMul %50 %52 
					                                                     OpStore %48 %53 
					                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                       f32_4 %55 = OpLoad %54 
					                                       f32_4 %56 = OpLoad %9 
					                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                       f32_4 %58 = OpFMul %55 %57 
					                                       f32_4 %59 = OpLoad %48 
					                                       f32_4 %60 = OpFAdd %58 %59 
					                                                     OpStore %48 %60 
					                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                       f32_4 %62 = OpLoad %61 
					                                       f32_4 %63 = OpLoad %9 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                       f32_4 %65 = OpFMul %62 %64 
					                                       f32_4 %66 = OpLoad %48 
					                                       f32_4 %67 = OpFAdd %65 %66 
					                                                     OpStore %48 %67 
					                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                       f32_4 %74 = OpLoad %73 
					                                       f32_4 %75 = OpLoad %9 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                       f32_4 %78 = OpLoad %48 
					                                       f32_4 %79 = OpFAdd %77 %78 
					                               Output f32_4* %81 = OpAccessChain %72 %22 
					                                                     OpStore %81 %79 
					                                       f32_2 %87 = OpLoad %86 
					                                                     OpStore %84 %87 
					                              Uniform f32_4* %89 = OpAccessChain %20 %35 
					                                       f32_4 %90 = OpLoad %89 
					                                       f32_4 %91 = OpVectorShuffle %90 %90 0 1 0 1 
					                                       f32_4 %95 = OpFMul %91 %94 
					                                       f32_2 %96 = OpLoad %86 
					                                       f32_4 %97 = OpVectorShuffle %96 %96 0 1 0 1 
					                                       f32_4 %98 = OpFAdd %95 %97 
					                                                     OpStore %88 %98 
					                             Uniform f32_4* %100 = OpAccessChain %20 %35 
					                                      f32_4 %101 = OpLoad %100 
					                                      f32_4 %102 = OpVectorShuffle %101 %101 0 1 0 1 
					                                      f32_4 %106 = OpFMul %102 %105 
					                                      f32_2 %107 = OpLoad %86 
					                                      f32_4 %108 = OpVectorShuffle %107 %107 0 1 0 1 
					                                      f32_4 %109 = OpFAdd %106 %108 
					                                                     OpStore %99 %109 
					                             Uniform f32_4* %111 = OpAccessChain %20 %35 
					                                      f32_4 %112 = OpLoad %111 
					                                      f32_4 %113 = OpVectorShuffle %112 %112 0 1 0 1 
					                                      f32_4 %117 = OpFMul %113 %116 
					                                      f32_2 %118 = OpLoad %86 
					                                      f32_4 %119 = OpVectorShuffle %118 %118 0 1 0 1 
					                                      f32_4 %120 = OpFAdd %117 %119 
					                                                     OpStore %110 %120 
					                                Output f32* %122 = OpAccessChain %72 %22 %68 
					                                        f32 %123 = OpLoad %122 
					                                        f32 %124 = OpFNegate %123 
					                                Output f32* %125 = OpAccessChain %72 %22 %68 
					                                                     OpStore %125 %124 
					                                                     OpReturn
					                                                     OpFunctionEnd

					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 88
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %16 %29 %47 %66 %85 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %16 Location 16 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %25 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %29 Location 29 
					                                                    OpDecorate %32 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %42 RelaxedPrecision 
					                                                    OpDecorate %43 RelaxedPrecision 
					                                                    OpDecorate %44 RelaxedPrecision 
					                                                    OpDecorate %45 RelaxedPrecision 
					                                                    OpDecorate %46 RelaxedPrecision 
					                                                    OpDecorate %47 Location 47 
					                                                    OpDecorate %51 RelaxedPrecision 
					                                                    OpDecorate %54 RelaxedPrecision 
					                                                    OpDecorate %55 RelaxedPrecision 
					                                                    OpDecorate %56 RelaxedPrecision 
					                                                    OpDecorate %57 RelaxedPrecision 
					                                                    OpDecorate %61 RelaxedPrecision 
					                                                    OpDecorate %62 RelaxedPrecision 
					                                                    OpDecorate %63 RelaxedPrecision 
					                                                    OpDecorate %64 RelaxedPrecision 
					                                                    OpDecorate %65 RelaxedPrecision 
					                                                    OpDecorate %66 Location 66 
					                                                    OpDecorate %70 RelaxedPrecision 
					                                                    OpDecorate %73 RelaxedPrecision 
					                                                    OpDecorate %74 RelaxedPrecision 
					                                                    OpDecorate %75 RelaxedPrecision 
					                                                    OpDecorate %76 RelaxedPrecision 
					                                                    OpDecorate %80 RelaxedPrecision 
					                                                    OpDecorate %81 RelaxedPrecision 
					                                                    OpDecorate %82 RelaxedPrecision 
					                                                    OpDecorate %83 RelaxedPrecision 
					                                                    OpDecorate %85 RelaxedPrecision 
					                                                    OpDecorate %85 Location 85 
					                                                    OpDecorate %86 RelaxedPrecision 
					                                             %2 = OpTypeVoid 
					                                             %3 = OpTypeFunction %2 
					                                             %6 = OpTypeFloat 32 
					                                             %7 = OpTypeVector %6 4 
					                                             %8 = OpTypePointer Private %7 
					                              Private f32_4* %9 = OpVariable Private 
					                                            %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %11 = OpTypeSampledImage %10 
					                                            %12 = OpTypePointer UniformConstant %11 
					UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
					                                            %15 = OpTypePointer Input %7 
					                               Input f32_4* %16 = OpVariable Input 
					                                            %17 = OpTypeVector %6 2 
					                             Private f32_4* %21 = OpVariable Private 
					                                        f32 %23 = OpConstant 3.674022E-40 
					                                      f32_4 %24 = OpConstantComposite %23 %23 %23 %23 
					                             Private f32_4* %26 = OpVariable Private 
					                                            %28 = OpTypePointer Input %17 
					                               Input f32_2* %29 = OpVariable Input 
					                                        f32 %33 = OpConstant 3.674022E-40 
					                                      f32_4 %34 = OpConstantComposite %33 %33 %33 %33 
					                               Input f32_4* %47 = OpVariable Input 
					                                        f32 %52 = OpConstant 3.674022E-40 
					                                      f32_4 %53 = OpConstantComposite %52 %52 %52 %52 
					                               Input f32_4* %66 = OpVariable Input 
					                                        f32 %71 = OpConstant 3.674022E-40 
					                                      f32_4 %72 = OpConstantComposite %71 %71 %71 %71 
					                                            %84 = OpTypePointer Output %7 
					                              Output f32_4* %85 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_4 %18 = OpLoad %16 
					                                      f32_2 %19 = OpVectorShuffle %18 %18 0 1 
					                                      f32_4 %20 = OpImageSampleImplicitLod %14 %19 
					                                                    OpStore %9 %20 
					                                      f32_4 %22 = OpLoad %9 
					                                      f32_4 %25 = OpFMul %22 %24 
					                                                    OpStore %21 %25 
					                 read_only Texture2DSampled %27 = OpLoad %13 
					                                      f32_2 %30 = OpLoad %29 
					                                      f32_4 %31 = OpImageSampleImplicitLod %27 %30 
					                                                    OpStore %26 %31 
					                                      f32_4 %32 = OpLoad %26 
					                                      f32_4 %35 = OpFMul %32 %34 
					                                      f32_4 %36 = OpLoad %21 
					                                      f32_4 %37 = OpFAdd %35 %36 
					                                                    OpStore %21 %37 
					                 read_only Texture2DSampled %38 = OpLoad %13 
					                                      f32_4 %39 = OpLoad %16 
					                                      f32_2 %40 = OpVectorShuffle %39 %39 2 3 
					                                      f32_4 %41 = OpImageSampleImplicitLod %38 %40 
					                                                    OpStore %26 %41 
					                                      f32_4 %42 = OpLoad %26 
					                                      f32_4 %43 = OpFMul %42 %24 
					                                      f32_4 %44 = OpLoad %21 
					                                      f32_4 %45 = OpFAdd %43 %44 
					                                                    OpStore %21 %45 
					                 read_only Texture2DSampled %46 = OpLoad %13 
					                                      f32_4 %48 = OpLoad %47 
					                                      f32_2 %49 = OpVectorShuffle %48 %48 0 1 
					                                      f32_4 %50 = OpImageSampleImplicitLod %46 %49 
					                                                    OpStore %26 %50 
					                                      f32_4 %51 = OpLoad %26 
					                                      f32_4 %54 = OpFMul %51 %53 
					                                      f32_4 %55 = OpLoad %21 
					                                      f32_4 %56 = OpFAdd %54 %55 
					                                                    OpStore %21 %56 
					                 read_only Texture2DSampled %57 = OpLoad %13 
					                                      f32_4 %58 = OpLoad %47 
					                                      f32_2 %59 = OpVectorShuffle %58 %58 2 3 
					                                      f32_4 %60 = OpImageSampleImplicitLod %57 %59 
					                                                    OpStore %26 %60 
					                                      f32_4 %61 = OpLoad %26 
					                                      f32_4 %62 = OpFMul %61 %53 
					                                      f32_4 %63 = OpLoad %21 
					                                      f32_4 %64 = OpFAdd %62 %63 
					                                                    OpStore %21 %64 
					                 read_only Texture2DSampled %65 = OpLoad %13 
					                                      f32_4 %67 = OpLoad %66 
					                                      f32_2 %68 = OpVectorShuffle %67 %67 0 1 
					                                      f32_4 %69 = OpImageSampleImplicitLod %65 %68 
					                                                    OpStore %26 %69 
					                                      f32_4 %70 = OpLoad %26 
					                                      f32_4 %73 = OpFMul %70 %72 
					                                      f32_4 %74 = OpLoad %21 
					                                      f32_4 %75 = OpFAdd %73 %74 
					                                                    OpStore %21 %75 
					                 read_only Texture2DSampled %76 = OpLoad %13 
					                                      f32_4 %77 = OpLoad %66 
					                                      f32_2 %78 = OpVectorShuffle %77 %77 2 3 
					                                      f32_4 %79 = OpImageSampleImplicitLod %76 %78 
					                                                    OpStore %26 %79 
					                                      f32_4 %80 = OpLoad %26 
					                                      f32_4 %81 = OpFMul %80 %72 
					                                      f32_4 %82 = OpLoad %21 
					                                      f32_4 %83 = OpFAdd %81 %82 
					                                                    OpStore %21 %83 
					                                      f32_4 %86 = OpLoad %21 
					                                                    OpStore %85 %86 
					                                                    OpReturn
					                                                    OpFunctionEnd
"
				}
				SubProgram "vulkan hw_tier01 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 127
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %88 %99 %110 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %86 Location 86 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %88 Location 88 
					                                                     OpDecorate %96 RelaxedPrecision 
					                                                     OpDecorate %97 RelaxedPrecision 
					                                                     OpDecorate %99 Location 99 
					                                                     OpDecorate %107 RelaxedPrecision 
					                                                     OpDecorate %108 RelaxedPrecision 
					                                                     OpDecorate %110 Location 110 
					                                                     OpDecorate %118 RelaxedPrecision 
					                                                     OpDecorate %119 RelaxedPrecision 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                             %14 = OpTypeInt 32 0 
					                                         u32 %15 = OpConstant 4 
					                                             %16 = OpTypeArray %7 %15 
					                                             %17 = OpTypeArray %7 %15 
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
					                                             %21 = OpTypeInt 32 1 
					                                         i32 %22 = OpConstant 0 
					                                         i32 %23 = OpConstant 1 
					                                             %24 = OpTypePointer Uniform %7 
					                                         i32 %35 = OpConstant 2 
					                                         i32 %44 = OpConstant 3 
					                              Private f32_4* %48 = OpVariable Private 
					                                         u32 %68 = OpConstant 1 
					                                             %69 = OpTypeArray %6 %68 
					                                             %70 = OpTypeStruct %7 %6 %69 
					                                             %71 = OpTypePointer Output %70 
					        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                             %80 = OpTypePointer Output %7 
					                                             %82 = OpTypeVector %6 2 
					                                             %83 = OpTypePointer Output %82 
					                               Output f32_2* %84 = OpVariable Output 
					                                             %85 = OpTypePointer Input %82 
					                                Input f32_2* %86 = OpVariable Input 
					                               Output f32_4* %88 = OpVariable Output 
					                                         f32 %92 = OpConstant 3.674022E-40 
					                                         f32 %93 = OpConstant 3.674022E-40 
					                                       f32_4 %94 = OpConstantComposite %92 %92 %93 %93 
					                               Output f32_4* %99 = OpVariable Output 
					                                        f32 %103 = OpConstant 3.674022E-40 
					                                        f32 %104 = OpConstant 3.674022E-40 
					                                      f32_4 %105 = OpConstantComposite %103 %103 %104 %104 
					                              Output f32_4* %110 = OpVariable Output 
					                                        f32 %114 = OpConstant 3.674022E-40 
					                                        f32 %115 = OpConstant 3.674022E-40 
					                                      f32_4 %116 = OpConstantComposite %114 %114 %115 %115 
					                                            %121 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                       f32_4 %12 = OpLoad %11 
					                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_4 %27 = OpFMul %13 %26 
					                                                     OpStore %9 %27 
					                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                       f32_4 %29 = OpLoad %28 
					                                       f32_4 %30 = OpLoad %11 
					                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                       f32_4 %32 = OpFMul %29 %31 
					                                       f32_4 %33 = OpLoad %9 
					                                       f32_4 %34 = OpFAdd %32 %33 
					                                                     OpStore %9 %34 
					                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpLoad %11 
					                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                       f32_4 %40 = OpFMul %37 %39 
					                                       f32_4 %41 = OpLoad %9 
					                                       f32_4 %42 = OpFAdd %40 %41 
					                                                     OpStore %9 %42 
					                                       f32_4 %43 = OpLoad %9 
					                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                       f32_4 %46 = OpLoad %45 
					                                       f32_4 %47 = OpFAdd %43 %46 
					                                                     OpStore %9 %47 
					                                       f32_4 %49 = OpLoad %9 
					                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                       f32_4 %52 = OpLoad %51 
					                                       f32_4 %53 = OpFMul %50 %52 
					                                                     OpStore %48 %53 
					                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                       f32_4 %55 = OpLoad %54 
					                                       f32_4 %56 = OpLoad %9 
					                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                       f32_4 %58 = OpFMul %55 %57 
					                                       f32_4 %59 = OpLoad %48 
					                                       f32_4 %60 = OpFAdd %58 %59 
					                                                     OpStore %48 %60 
					                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                       f32_4 %62 = OpLoad %61 
					                                       f32_4 %63 = OpLoad %9 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                       f32_4 %65 = OpFMul %62 %64 
					                                       f32_4 %66 = OpLoad %48 
					                                       f32_4 %67 = OpFAdd %65 %66 
					                                                     OpStore %48 %67 
					                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                       f32_4 %74 = OpLoad %73 
					                                       f32_4 %75 = OpLoad %9 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                       f32_4 %78 = OpLoad %48 
					                                       f32_4 %79 = OpFAdd %77 %78 
					                               Output f32_4* %81 = OpAccessChain %72 %22 
					                                                     OpStore %81 %79 
					                                       f32_2 %87 = OpLoad %86 
					                                                     OpStore %84 %87 
					                              Uniform f32_4* %89 = OpAccessChain %20 %35 
					                                       f32_4 %90 = OpLoad %89 
					                                       f32_4 %91 = OpVectorShuffle %90 %90 0 1 0 1 
					                                       f32_4 %95 = OpFMul %91 %94 
					                                       f32_2 %96 = OpLoad %86 
					                                       f32_4 %97 = OpVectorShuffle %96 %96 0 1 0 1 
					                                       f32_4 %98 = OpFAdd %95 %97 
					                                                     OpStore %88 %98 
					                             Uniform f32_4* %100 = OpAccessChain %20 %35 
					                                      f32_4 %101 = OpLoad %100 
					                                      f32_4 %102 = OpVectorShuffle %101 %101 0 1 0 1 
					                                      f32_4 %106 = OpFMul %102 %105 
					                                      f32_2 %107 = OpLoad %86 
					                                      f32_4 %108 = OpVectorShuffle %107 %107 0 1 0 1 
					                                      f32_4 %109 = OpFAdd %106 %108 
					                                                     OpStore %99 %109 
					                             Uniform f32_4* %111 = OpAccessChain %20 %35 
					                                      f32_4 %112 = OpLoad %111 
					                                      f32_4 %113 = OpVectorShuffle %112 %112 0 1 0 1 
					                                      f32_4 %117 = OpFMul %113 %116 
					                                      f32_2 %118 = OpLoad %86 
					                                      f32_4 %119 = OpVectorShuffle %118 %118 0 1 0 1 
					                                      f32_4 %120 = OpFAdd %117 %119 
					                                                     OpStore %110 %120 
					                                Output f32* %122 = OpAccessChain %72 %22 %68 
					                                        f32 %123 = OpLoad %122 
					                                        f32 %124 = OpFNegate %123 
					                                Output f32* %125 = OpAccessChain %72 %22 %68 
					                                                     OpStore %125 %124 
					                                                     OpReturn
					                                                     OpFunctionEnd

					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 88
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %16 %29 %47 %66 %85 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %16 Location 16 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %25 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %29 Location 29 
					                                                    OpDecorate %32 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %42 RelaxedPrecision 
					                                                    OpDecorate %43 RelaxedPrecision 
					                                                    OpDecorate %44 RelaxedPrecision 
					                                                    OpDecorate %45 RelaxedPrecision 
					                                                    OpDecorate %46 RelaxedPrecision 
					                                                    OpDecorate %47 Location 47 
					                                                    OpDecorate %51 RelaxedPrecision 
					                                                    OpDecorate %54 RelaxedPrecision 
					                                                    OpDecorate %55 RelaxedPrecision 
					                                                    OpDecorate %56 RelaxedPrecision 
					                                                    OpDecorate %57 RelaxedPrecision 
					                                                    OpDecorate %61 RelaxedPrecision 
					                                                    OpDecorate %62 RelaxedPrecision 
					                                                    OpDecorate %63 RelaxedPrecision 
					                                                    OpDecorate %64 RelaxedPrecision 
					                                                    OpDecorate %65 RelaxedPrecision 
					                                                    OpDecorate %66 Location 66 
					                                                    OpDecorate %70 RelaxedPrecision 
					                                                    OpDecorate %73 RelaxedPrecision 
					                                                    OpDecorate %74 RelaxedPrecision 
					                                                    OpDecorate %75 RelaxedPrecision 
					                                                    OpDecorate %76 RelaxedPrecision 
					                                                    OpDecorate %80 RelaxedPrecision 
					                                                    OpDecorate %81 RelaxedPrecision 
					                                                    OpDecorate %82 RelaxedPrecision 
					                                                    OpDecorate %83 RelaxedPrecision 
					                                                    OpDecorate %85 RelaxedPrecision 
					                                                    OpDecorate %85 Location 85 
					                                                    OpDecorate %86 RelaxedPrecision 
					                                             %2 = OpTypeVoid 
					                                             %3 = OpTypeFunction %2 
					                                             %6 = OpTypeFloat 32 
					                                             %7 = OpTypeVector %6 4 
					                                             %8 = OpTypePointer Private %7 
					                              Private f32_4* %9 = OpVariable Private 
					                                            %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %11 = OpTypeSampledImage %10 
					                                            %12 = OpTypePointer UniformConstant %11 
					UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
					                                            %15 = OpTypePointer Input %7 
					                               Input f32_4* %16 = OpVariable Input 
					                                            %17 = OpTypeVector %6 2 
					                             Private f32_4* %21 = OpVariable Private 
					                                        f32 %23 = OpConstant 3.674022E-40 
					                                      f32_4 %24 = OpConstantComposite %23 %23 %23 %23 
					                             Private f32_4* %26 = OpVariable Private 
					                                            %28 = OpTypePointer Input %17 
					                               Input f32_2* %29 = OpVariable Input 
					                                        f32 %33 = OpConstant 3.674022E-40 
					                                      f32_4 %34 = OpConstantComposite %33 %33 %33 %33 
					                               Input f32_4* %47 = OpVariable Input 
					                                        f32 %52 = OpConstant 3.674022E-40 
					                                      f32_4 %53 = OpConstantComposite %52 %52 %52 %52 
					                               Input f32_4* %66 = OpVariable Input 
					                                        f32 %71 = OpConstant 3.674022E-40 
					                                      f32_4 %72 = OpConstantComposite %71 %71 %71 %71 
					                                            %84 = OpTypePointer Output %7 
					                              Output f32_4* %85 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_4 %18 = OpLoad %16 
					                                      f32_2 %19 = OpVectorShuffle %18 %18 0 1 
					                                      f32_4 %20 = OpImageSampleImplicitLod %14 %19 
					                                                    OpStore %9 %20 
					                                      f32_4 %22 = OpLoad %9 
					                                      f32_4 %25 = OpFMul %22 %24 
					                                                    OpStore %21 %25 
					                 read_only Texture2DSampled %27 = OpLoad %13 
					                                      f32_2 %30 = OpLoad %29 
					                                      f32_4 %31 = OpImageSampleImplicitLod %27 %30 
					                                                    OpStore %26 %31 
					                                      f32_4 %32 = OpLoad %26 
					                                      f32_4 %35 = OpFMul %32 %34 
					                                      f32_4 %36 = OpLoad %21 
					                                      f32_4 %37 = OpFAdd %35 %36 
					                                                    OpStore %21 %37 
					                 read_only Texture2DSampled %38 = OpLoad %13 
					                                      f32_4 %39 = OpLoad %16 
					                                      f32_2 %40 = OpVectorShuffle %39 %39 2 3 
					                                      f32_4 %41 = OpImageSampleImplicitLod %38 %40 
					                                                    OpStore %26 %41 
					                                      f32_4 %42 = OpLoad %26 
					                                      f32_4 %43 = OpFMul %42 %24 
					                                      f32_4 %44 = OpLoad %21 
					                                      f32_4 %45 = OpFAdd %43 %44 
					                                                    OpStore %21 %45 
					                 read_only Texture2DSampled %46 = OpLoad %13 
					                                      f32_4 %48 = OpLoad %47 
					                                      f32_2 %49 = OpVectorShuffle %48 %48 0 1 
					                                      f32_4 %50 = OpImageSampleImplicitLod %46 %49 
					                                                    OpStore %26 %50 
					                                      f32_4 %51 = OpLoad %26 
					                                      f32_4 %54 = OpFMul %51 %53 
					                                      f32_4 %55 = OpLoad %21 
					                                      f32_4 %56 = OpFAdd %54 %55 
					                                                    OpStore %21 %56 
					                 read_only Texture2DSampled %57 = OpLoad %13 
					                                      f32_4 %58 = OpLoad %47 
					                                      f32_2 %59 = OpVectorShuffle %58 %58 2 3 
					                                      f32_4 %60 = OpImageSampleImplicitLod %57 %59 
					                                                    OpStore %26 %60 
					                                      f32_4 %61 = OpLoad %26 
					                                      f32_4 %62 = OpFMul %61 %53 
					                                      f32_4 %63 = OpLoad %21 
					                                      f32_4 %64 = OpFAdd %62 %63 
					                                                    OpStore %21 %64 
					                 read_only Texture2DSampled %65 = OpLoad %13 
					                                      f32_4 %67 = OpLoad %66 
					                                      f32_2 %68 = OpVectorShuffle %67 %67 0 1 
					                                      f32_4 %69 = OpImageSampleImplicitLod %65 %68 
					                                                    OpStore %26 %69 
					                                      f32_4 %70 = OpLoad %26 
					                                      f32_4 %73 = OpFMul %70 %72 
					                                      f32_4 %74 = OpLoad %21 
					                                      f32_4 %75 = OpFAdd %73 %74 
					                                                    OpStore %21 %75 
					                 read_only Texture2DSampled %76 = OpLoad %13 
					                                      f32_4 %77 = OpLoad %66 
					                                      f32_2 %78 = OpVectorShuffle %77 %77 2 3 
					                                      f32_4 %79 = OpImageSampleImplicitLod %76 %78 
					                                                    OpStore %26 %79 
					                                      f32_4 %80 = OpLoad %26 
					                                      f32_4 %81 = OpFMul %80 %72 
					                                      f32_4 %82 = OpLoad %21 
					                                      f32_4 %83 = OpFAdd %81 %82 
					                                                    OpStore %21 %83 
					                                      f32_4 %86 = OpLoad %21 
					                                                    OpStore %85 %86 
					                                                    OpReturn
					                                                    OpFunctionEnd
"
				}
				SubProgram "vulkan hw_tier02 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 127
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %88 %99 %110 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %86 Location 86 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %88 Location 88 
					                                                     OpDecorate %96 RelaxedPrecision 
					                                                     OpDecorate %97 RelaxedPrecision 
					                                                     OpDecorate %99 Location 99 
					                                                     OpDecorate %107 RelaxedPrecision 
					                                                     OpDecorate %108 RelaxedPrecision 
					                                                     OpDecorate %110 Location 110 
					                                                     OpDecorate %118 RelaxedPrecision 
					                                                     OpDecorate %119 RelaxedPrecision 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                             %14 = OpTypeInt 32 0 
					                                         u32 %15 = OpConstant 4 
					                                             %16 = OpTypeArray %7 %15 
					                                             %17 = OpTypeArray %7 %15 
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
					                                             %21 = OpTypeInt 32 1 
					                                         i32 %22 = OpConstant 0 
					                                         i32 %23 = OpConstant 1 
					                                             %24 = OpTypePointer Uniform %7 
					                                         i32 %35 = OpConstant 2 
					                                         i32 %44 = OpConstant 3 
					                              Private f32_4* %48 = OpVariable Private 
					                                         u32 %68 = OpConstant 1 
					                                             %69 = OpTypeArray %6 %68 
					                                             %70 = OpTypeStruct %7 %6 %69 
					                                             %71 = OpTypePointer Output %70 
					        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                             %80 = OpTypePointer Output %7 
					                                             %82 = OpTypeVector %6 2 
					                                             %83 = OpTypePointer Output %82 
					                               Output f32_2* %84 = OpVariable Output 
					                                             %85 = OpTypePointer Input %82 
					                                Input f32_2* %86 = OpVariable Input 
					                               Output f32_4* %88 = OpVariable Output 
					                                         f32 %92 = OpConstant 3.674022E-40 
					                                         f32 %93 = OpConstant 3.674022E-40 
					                                       f32_4 %94 = OpConstantComposite %92 %92 %93 %93 
					                               Output f32_4* %99 = OpVariable Output 
					                                        f32 %103 = OpConstant 3.674022E-40 
					                                        f32 %104 = OpConstant 3.674022E-40 
					                                      f32_4 %105 = OpConstantComposite %103 %103 %104 %104 
					                              Output f32_4* %110 = OpVariable Output 
					                                        f32 %114 = OpConstant 3.674022E-40 
					                                        f32 %115 = OpConstant 3.674022E-40 
					                                      f32_4 %116 = OpConstantComposite %114 %114 %115 %115 
					                                            %121 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                       f32_4 %12 = OpLoad %11 
					                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_4 %27 = OpFMul %13 %26 
					                                                     OpStore %9 %27 
					                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                       f32_4 %29 = OpLoad %28 
					                                       f32_4 %30 = OpLoad %11 
					                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                       f32_4 %32 = OpFMul %29 %31 
					                                       f32_4 %33 = OpLoad %9 
					                                       f32_4 %34 = OpFAdd %32 %33 
					                                                     OpStore %9 %34 
					                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpLoad %11 
					                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                       f32_4 %40 = OpFMul %37 %39 
					                                       f32_4 %41 = OpLoad %9 
					                                       f32_4 %42 = OpFAdd %40 %41 
					                                                     OpStore %9 %42 
					                                       f32_4 %43 = OpLoad %9 
					                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                       f32_4 %46 = OpLoad %45 
					                                       f32_4 %47 = OpFAdd %43 %46 
					                                                     OpStore %9 %47 
					                                       f32_4 %49 = OpLoad %9 
					                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                       f32_4 %52 = OpLoad %51 
					                                       f32_4 %53 = OpFMul %50 %52 
					                                                     OpStore %48 %53 
					                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                       f32_4 %55 = OpLoad %54 
					                                       f32_4 %56 = OpLoad %9 
					                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                       f32_4 %58 = OpFMul %55 %57 
					                                       f32_4 %59 = OpLoad %48 
					                                       f32_4 %60 = OpFAdd %58 %59 
					                                                     OpStore %48 %60 
					                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                       f32_4 %62 = OpLoad %61 
					                                       f32_4 %63 = OpLoad %9 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                       f32_4 %65 = OpFMul %62 %64 
					                                       f32_4 %66 = OpLoad %48 
					                                       f32_4 %67 = OpFAdd %65 %66 
					                                                     OpStore %48 %67 
					                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                       f32_4 %74 = OpLoad %73 
					                                       f32_4 %75 = OpLoad %9 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                       f32_4 %78 = OpLoad %48 
					                                       f32_4 %79 = OpFAdd %77 %78 
					                               Output f32_4* %81 = OpAccessChain %72 %22 
					                                                     OpStore %81 %79 
					                                       f32_2 %87 = OpLoad %86 
					                                                     OpStore %84 %87 
					                              Uniform f32_4* %89 = OpAccessChain %20 %35 
					                                       f32_4 %90 = OpLoad %89 
					                                       f32_4 %91 = OpVectorShuffle %90 %90 0 1 0 1 
					                                       f32_4 %95 = OpFMul %91 %94 
					                                       f32_2 %96 = OpLoad %86 
					                                       f32_4 %97 = OpVectorShuffle %96 %96 0 1 0 1 
					                                       f32_4 %98 = OpFAdd %95 %97 
					                                                     OpStore %88 %98 
					                             Uniform f32_4* %100 = OpAccessChain %20 %35 
					                                      f32_4 %101 = OpLoad %100 
					                                      f32_4 %102 = OpVectorShuffle %101 %101 0 1 0 1 
					                                      f32_4 %106 = OpFMul %102 %105 
					                                      f32_2 %107 = OpLoad %86 
					                                      f32_4 %108 = OpVectorShuffle %107 %107 0 1 0 1 
					                                      f32_4 %109 = OpFAdd %106 %108 
					                                                     OpStore %99 %109 
					                             Uniform f32_4* %111 = OpAccessChain %20 %35 
					                                      f32_4 %112 = OpLoad %111 
					                                      f32_4 %113 = OpVectorShuffle %112 %112 0 1 0 1 
					                                      f32_4 %117 = OpFMul %113 %116 
					                                      f32_2 %118 = OpLoad %86 
					                                      f32_4 %119 = OpVectorShuffle %118 %118 0 1 0 1 
					                                      f32_4 %120 = OpFAdd %117 %119 
					                                                     OpStore %110 %120 
					                                Output f32* %122 = OpAccessChain %72 %22 %68 
					                                        f32 %123 = OpLoad %122 
					                                        f32 %124 = OpFNegate %123 
					                                Output f32* %125 = OpAccessChain %72 %22 %68 
					                                                     OpStore %125 %124 
					                                                     OpReturn
					                                                     OpFunctionEnd

					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 88
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %16 %29 %47 %66 %85 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %16 Location 16 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %25 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %29 Location 29 
					                                                    OpDecorate %32 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %42 RelaxedPrecision 
					                                                    OpDecorate %43 RelaxedPrecision 
					                                                    OpDecorate %44 RelaxedPrecision 
					                                                    OpDecorate %45 RelaxedPrecision 
					                                                    OpDecorate %46 RelaxedPrecision 
					                                                    OpDecorate %47 Location 47 
					                                                    OpDecorate %51 RelaxedPrecision 
					                                                    OpDecorate %54 RelaxedPrecision 
					                                                    OpDecorate %55 RelaxedPrecision 
					                                                    OpDecorate %56 RelaxedPrecision 
					                                                    OpDecorate %57 RelaxedPrecision 
					                                                    OpDecorate %61 RelaxedPrecision 
					                                                    OpDecorate %62 RelaxedPrecision 
					                                                    OpDecorate %63 RelaxedPrecision 
					                                                    OpDecorate %64 RelaxedPrecision 
					                                                    OpDecorate %65 RelaxedPrecision 
					                                                    OpDecorate %66 Location 66 
					                                                    OpDecorate %70 RelaxedPrecision 
					                                                    OpDecorate %73 RelaxedPrecision 
					                                                    OpDecorate %74 RelaxedPrecision 
					                                                    OpDecorate %75 RelaxedPrecision 
					                                                    OpDecorate %76 RelaxedPrecision 
					                                                    OpDecorate %80 RelaxedPrecision 
					                                                    OpDecorate %81 RelaxedPrecision 
					                                                    OpDecorate %82 RelaxedPrecision 
					                                                    OpDecorate %83 RelaxedPrecision 
					                                                    OpDecorate %85 RelaxedPrecision 
					                                                    OpDecorate %85 Location 85 
					                                                    OpDecorate %86 RelaxedPrecision 
					                                             %2 = OpTypeVoid 
					                                             %3 = OpTypeFunction %2 
					                                             %6 = OpTypeFloat 32 
					                                             %7 = OpTypeVector %6 4 
					                                             %8 = OpTypePointer Private %7 
					                              Private f32_4* %9 = OpVariable Private 
					                                            %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %11 = OpTypeSampledImage %10 
					                                            %12 = OpTypePointer UniformConstant %11 
					UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
					                                            %15 = OpTypePointer Input %7 
					                               Input f32_4* %16 = OpVariable Input 
					                                            %17 = OpTypeVector %6 2 
					                             Private f32_4* %21 = OpVariable Private 
					                                        f32 %23 = OpConstant 3.674022E-40 
					                                      f32_4 %24 = OpConstantComposite %23 %23 %23 %23 
					                             Private f32_4* %26 = OpVariable Private 
					                                            %28 = OpTypePointer Input %17 
					                               Input f32_2* %29 = OpVariable Input 
					                                        f32 %33 = OpConstant 3.674022E-40 
					                                      f32_4 %34 = OpConstantComposite %33 %33 %33 %33 
					                               Input f32_4* %47 = OpVariable Input 
					                                        f32 %52 = OpConstant 3.674022E-40 
					                                      f32_4 %53 = OpConstantComposite %52 %52 %52 %52 
					                               Input f32_4* %66 = OpVariable Input 
					                                        f32 %71 = OpConstant 3.674022E-40 
					                                      f32_4 %72 = OpConstantComposite %71 %71 %71 %71 
					                                            %84 = OpTypePointer Output %7 
					                              Output f32_4* %85 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_4 %18 = OpLoad %16 
					                                      f32_2 %19 = OpVectorShuffle %18 %18 0 1 
					                                      f32_4 %20 = OpImageSampleImplicitLod %14 %19 
					                                                    OpStore %9 %20 
					                                      f32_4 %22 = OpLoad %9 
					                                      f32_4 %25 = OpFMul %22 %24 
					                                                    OpStore %21 %25 
					                 read_only Texture2DSampled %27 = OpLoad %13 
					                                      f32_2 %30 = OpLoad %29 
					                                      f32_4 %31 = OpImageSampleImplicitLod %27 %30 
					                                                    OpStore %26 %31 
					                                      f32_4 %32 = OpLoad %26 
					                                      f32_4 %35 = OpFMul %32 %34 
					                                      f32_4 %36 = OpLoad %21 
					                                      f32_4 %37 = OpFAdd %35 %36 
					                                                    OpStore %21 %37 
					                 read_only Texture2DSampled %38 = OpLoad %13 
					                                      f32_4 %39 = OpLoad %16 
					                                      f32_2 %40 = OpVectorShuffle %39 %39 2 3 
					                                      f32_4 %41 = OpImageSampleImplicitLod %38 %40 
					                                                    OpStore %26 %41 
					                                      f32_4 %42 = OpLoad %26 
					                                      f32_4 %43 = OpFMul %42 %24 
					                                      f32_4 %44 = OpLoad %21 
					                                      f32_4 %45 = OpFAdd %43 %44 
					                                                    OpStore %21 %45 
					                 read_only Texture2DSampled %46 = OpLoad %13 
					                                      f32_4 %48 = OpLoad %47 
					                                      f32_2 %49 = OpVectorShuffle %48 %48 0 1 
					                                      f32_4 %50 = OpImageSampleImplicitLod %46 %49 
					                                                    OpStore %26 %50 
					                                      f32_4 %51 = OpLoad %26 
					                                      f32_4 %54 = OpFMul %51 %53 
					                                      f32_4 %55 = OpLoad %21 
					                                      f32_4 %56 = OpFAdd %54 %55 
					                                                    OpStore %21 %56 
					                 read_only Texture2DSampled %57 = OpLoad %13 
					                                      f32_4 %58 = OpLoad %47 
					                                      f32_2 %59 = OpVectorShuffle %58 %58 2 3 
					                                      f32_4 %60 = OpImageSampleImplicitLod %57 %59 
					                                                    OpStore %26 %60 
					                                      f32_4 %61 = OpLoad %26 
					                                      f32_4 %62 = OpFMul %61 %53 
					                                      f32_4 %63 = OpLoad %21 
					                                      f32_4 %64 = OpFAdd %62 %63 
					                                                    OpStore %21 %64 
					                 read_only Texture2DSampled %65 = OpLoad %13 
					                                      f32_4 %67 = OpLoad %66 
					                                      f32_2 %68 = OpVectorShuffle %67 %67 0 1 
					                                      f32_4 %69 = OpImageSampleImplicitLod %65 %68 
					                                                    OpStore %26 %69 
					                                      f32_4 %70 = OpLoad %26 
					                                      f32_4 %73 = OpFMul %70 %72 
					                                      f32_4 %74 = OpLoad %21 
					                                      f32_4 %75 = OpFAdd %73 %74 
					                                                    OpStore %21 %75 
					                 read_only Texture2DSampled %76 = OpLoad %13 
					                                      f32_4 %77 = OpLoad %66 
					                                      f32_2 %78 = OpVectorShuffle %77 %77 2 3 
					                                      f32_4 %79 = OpImageSampleImplicitLod %76 %78 
					                                                    OpStore %26 %79 
					                                      f32_4 %80 = OpLoad %26 
					                                      f32_4 %81 = OpFMul %80 %72 
					                                      f32_4 %82 = OpLoad %21 
					                                      f32_4 %83 = OpFAdd %81 %82 
					                                                    OpStore %21 %83 
					                                      f32_4 %86 = OpLoad %21 
					                                                    OpStore %85 %86 
					                                                    OpReturn
					                                                    OpFunctionEnd
"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					"!!!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					"!!!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					"!!!!GLES"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier01 " {
					"!!!!GLES3"
				}
				SubProgram "gles3 hw_tier02 " {
					"!!!!GLES3"
				}
				SubProgram "vulkan hw_tier00 " {
					"!!vulkan"
				}
				SubProgram "vulkan hw_tier01 " {
					"!!vulkan"
				}
				SubProgram "vulkan hw_tier02 " {
					"!!vulkan"
				}
			}
		}
	}
}