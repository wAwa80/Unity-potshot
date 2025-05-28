Shader "Hidden/Vignetting" {
	Properties {
		_MainTex ("Base", 2D) = "white" {}
		_VignetteTex ("Vignette", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 29044
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec2 tmpvar_1;
					  tmpvar_1 = _glesMultiTexCoord0.xy;
					  highp vec2 tmpvar_2;
					  highp vec2 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_2 = tmpvar_1;
					  tmpvar_3 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform sampler2D _VignetteTex;
					uniform mediump float _Intensity;
					uniform mediump float _Blur;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec4 tmpvar_1;
					  mediump vec4 colorBlur_2;
					  highp float mask_3;
					  mediump vec4 color_4;
					  mediump vec2 uv_5;
					  mediump vec2 coords_6;
					  coords_6 = xlv_TEXCOORD0;
					  uv_5 = xlv_TEXCOORD0;
					  coords_6 = ((coords_6 - 0.5) * 2.0);
					  mediump float tmpvar_7;
					  tmpvar_7 = dot (coords_6, coords_6);
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, uv_5);
					  color_4 = tmpvar_8;
					  mediump float tmpvar_9;
					  tmpvar_9 = (1.0 - ((tmpvar_7 * _Intensity) * 0.1));
					  mask_3 = tmpvar_9;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_VignetteTex, xlv_TEXCOORD1);
					  colorBlur_2 = tmpvar_10;
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = mix (color_4, colorBlur_2, vec4(clamp ((_Blur * tmpvar_7), 0.0, 1.0)));
					  color_4 = tmpvar_11;
					  tmpvar_1 = (tmpvar_11 * mask_3);
					  gl_FragData[0] = tmpvar_1;
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
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec2 tmpvar_1;
					  tmpvar_1 = _glesMultiTexCoord0.xy;
					  highp vec2 tmpvar_2;
					  highp vec2 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_2 = tmpvar_1;
					  tmpvar_3 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform sampler2D _VignetteTex;
					uniform mediump float _Intensity;
					uniform mediump float _Blur;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec4 tmpvar_1;
					  mediump vec4 colorBlur_2;
					  highp float mask_3;
					  mediump vec4 color_4;
					  mediump vec2 uv_5;
					  mediump vec2 coords_6;
					  coords_6 = xlv_TEXCOORD0;
					  uv_5 = xlv_TEXCOORD0;
					  coords_6 = ((coords_6 - 0.5) * 2.0);
					  mediump float tmpvar_7;
					  tmpvar_7 = dot (coords_6, coords_6);
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, uv_5);
					  color_4 = tmpvar_8;
					  mediump float tmpvar_9;
					  tmpvar_9 = (1.0 - ((tmpvar_7 * _Intensity) * 0.1));
					  mask_3 = tmpvar_9;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_VignetteTex, xlv_TEXCOORD1);
					  colorBlur_2 = tmpvar_10;
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = mix (color_4, colorBlur_2, vec4(clamp ((_Blur * tmpvar_7), 0.0, 1.0)));
					  color_4 = tmpvar_11;
					  tmpvar_1 = (tmpvar_11 * mask_3);
					  gl_FragData[0] = tmpvar_1;
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
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec2 tmpvar_1;
					  tmpvar_1 = _glesMultiTexCoord0.xy;
					  highp vec2 tmpvar_2;
					  highp vec2 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  tmpvar_2 = tmpvar_1;
					  tmpvar_3 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform sampler2D _VignetteTex;
					uniform mediump float _Intensity;
					uniform mediump float _Blur;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec4 tmpvar_1;
					  mediump vec4 colorBlur_2;
					  highp float mask_3;
					  mediump vec4 color_4;
					  mediump vec2 uv_5;
					  mediump vec2 coords_6;
					  coords_6 = xlv_TEXCOORD0;
					  uv_5 = xlv_TEXCOORD0;
					  coords_6 = ((coords_6 - 0.5) * 2.0);
					  mediump float tmpvar_7;
					  tmpvar_7 = dot (coords_6, coords_6);
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, uv_5);
					  color_4 = tmpvar_8;
					  mediump float tmpvar_9;
					  tmpvar_9 = (1.0 - ((tmpvar_7 * _Intensity) * 0.1));
					  mask_3 = tmpvar_9;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_VignetteTex, xlv_TEXCOORD1);
					  colorBlur_2 = tmpvar_10;
					  mediump vec4 tmpvar_11;
					  tmpvar_11 = mix (color_4, colorBlur_2, vec4(clamp ((_Blur * tmpvar_7), 0.0, 1.0)));
					  color_4 = tmpvar_11;
					  tmpvar_1 = (tmpvar_11 * mask_3);
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					highp  vec4 phase0_Output0_1;
					out highp vec2 vs_TEXCOORD1;
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
					    phase0_Output0_1 = in_TEXCOORD0.xyxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump float _Intensity;
					uniform 	mediump float _Blur;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _VignetteTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					lowp vec4 u_xlat10_2;
					mediump float u_xlat16_3;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_0.xy = u_xlat16_0.xy + u_xlat16_0.xy;
					    u_xlat16_0.x = dot(u_xlat16_0.xy, u_xlat16_0.xy);
					    u_xlat16_0.xy = u_xlat16_0.xx * vec2(_Blur, _Intensity);
					    u_xlat16_0.x = u_xlat16_0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
					#else
					    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
					#endif
					    u_xlat16_3 = (-u_xlat16_0.y) * 0.100000001 + 1.0;
					    u_xlat10_1 = texture(_VignetteTex, vs_TEXCOORD1.xy);
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1 = u_xlat10_1 + (-u_xlat10_2);
					    u_xlat16_1 = u_xlat16_0.xxxx * u_xlat16_1 + u_xlat10_2;
					    u_xlat16_0 = vec4(u_xlat16_3) * u_xlat16_1;
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
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					highp  vec4 phase0_Output0_1;
					out highp vec2 vs_TEXCOORD1;
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
					    phase0_Output0_1 = in_TEXCOORD0.xyxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump float _Intensity;
					uniform 	mediump float _Blur;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _VignetteTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					lowp vec4 u_xlat10_2;
					mediump float u_xlat16_3;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_0.xy = u_xlat16_0.xy + u_xlat16_0.xy;
					    u_xlat16_0.x = dot(u_xlat16_0.xy, u_xlat16_0.xy);
					    u_xlat16_0.xy = u_xlat16_0.xx * vec2(_Blur, _Intensity);
					    u_xlat16_0.x = u_xlat16_0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
					#else
					    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
					#endif
					    u_xlat16_3 = (-u_xlat16_0.y) * 0.100000001 + 1.0;
					    u_xlat10_1 = texture(_VignetteTex, vs_TEXCOORD1.xy);
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1 = u_xlat10_1 + (-u_xlat10_2);
					    u_xlat16_1 = u_xlat16_0.xxxx * u_xlat16_1 + u_xlat10_2;
					    u_xlat16_0 = vec4(u_xlat16_3) * u_xlat16_1;
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
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					highp  vec4 phase0_Output0_1;
					out highp vec2 vs_TEXCOORD1;
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
					    phase0_Output0_1 = in_TEXCOORD0.xyxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump float _Intensity;
					uniform 	mediump float _Blur;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _VignetteTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					lowp vec4 u_xlat10_2;
					mediump float u_xlat16_3;
					void main()
					{
					    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_0.xy = u_xlat16_0.xy + u_xlat16_0.xy;
					    u_xlat16_0.x = dot(u_xlat16_0.xy, u_xlat16_0.xy);
					    u_xlat16_0.xy = u_xlat16_0.xx * vec2(_Blur, _Intensity);
					    u_xlat16_0.x = u_xlat16_0.x;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
					#else
					    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
					#endif
					    u_xlat16_3 = (-u_xlat16_0.y) * 0.100000001 + 1.0;
					    u_xlat10_1 = texture(_VignetteTex, vs_TEXCOORD1.xy);
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1 = u_xlat10_1 + (-u_xlat10_2);
					    u_xlat16_1 = u_xlat16_0.xxxx * u_xlat16_1 + u_xlat10_2;
					    u_xlat16_0 = vec4(u_xlat16_3) * u_xlat16_1;
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
					; Bound: 132
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %94 %120 %123 
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
					                                                     OpDecorate %94 RelaxedPrecision 
					                                                     OpDecorate %94 Location 94 
					                                                     OpDecorate %97 RelaxedPrecision 
					                                                     OpDecorate %98 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %110 RelaxedPrecision 
					                                                     OpDecorate %115 RelaxedPrecision 
					                                                     OpDecorate %116 RelaxedPrecision 
					                                                     OpDecorate %120 Location 120 
					                                                     OpDecorate %123 Location 123 
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
					                                             %82 = OpTypeBool 
					                                             %83 = OpTypePointer Private %82 
					                               Private bool* %84 = OpVariable Private 
					                                             %85 = OpTypePointer Uniform %6 
					                                         f32 %88 = OpConstant 3.674022E-40 
					                                             %90 = OpTypePointer Private %6 
					                                Private f32* %91 = OpVariable Private 
					                                             %92 = OpTypeVector %6 2 
					                                             %93 = OpTypePointer Input %92 
					                                Input f32_2* %94 = OpVariable Input 
					                                             %95 = OpTypePointer Input %6 
					                                         f32 %99 = OpConstant 3.674022E-40 
					                             Private f32_4* %101 = OpVariable Private 
					                                            %102 = OpTypePointer Function %6 
					                                        u32 %112 = OpConstant 3 
					                                            %114 = OpTypeVector %6 3 
					                                            %119 = OpTypePointer Output %92 
					                              Output f32_2* %120 = OpVariable Output 
					                              Output f32_2* %123 = OpVariable Output 
					                                            %126 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %103 = OpVariable Function 
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
					                                Uniform f32* %86 = OpAccessChain %20 %35 %68 
					                                         f32 %87 = OpLoad %86 
					                                        bool %89 = OpFOrdLessThan %87 %88 
					                                                     OpStore %84 %89 
					                                  Input f32* %96 = OpAccessChain %94 %68 
					                                         f32 %97 = OpLoad %96 
					                                         f32 %98 = OpFNegate %97 
					                                        f32 %100 = OpFAdd %98 %99 
					                                                     OpStore %91 %100 
					                                       bool %104 = OpLoad %84 
					                                                     OpSelectionMerge %106 None 
					                                                     OpBranchConditional %104 %105 %108 
					                                            %105 = OpLabel 
					                                        f32 %107 = OpLoad %91 
					                                                     OpStore %103 %107 
					                                                     OpBranch %106 
					                                            %108 = OpLabel 
					                                 Input f32* %109 = OpAccessChain %94 %68 
					                                        f32 %110 = OpLoad %109 
					                                                     OpStore %103 %110 
					                                                     OpBranch %106 
					                                            %106 = OpLabel 
					                                        f32 %111 = OpLoad %103 
					                               Private f32* %113 = OpAccessChain %101 %112 
					                                                     OpStore %113 %111 
					                                      f32_2 %115 = OpLoad %94 
					                                      f32_3 %116 = OpVectorShuffle %115 %115 0 1 0 
					                                      f32_4 %117 = OpLoad %101 
					                                      f32_4 %118 = OpVectorShuffle %117 %116 4 5 6 3 
					                                                     OpStore %101 %118 
					                                      f32_4 %121 = OpLoad %101 
					                                      f32_2 %122 = OpVectorShuffle %121 %121 0 1 
					                                                     OpStore %120 %122 
					                                      f32_4 %124 = OpLoad %101 
					                                      f32_2 %125 = OpVectorShuffle %124 %124 2 3 
					                                                     OpStore %123 %125 
					                                Output f32* %127 = OpAccessChain %72 %22 %68 
					                                        f32 %128 = OpLoad %127 
					                                        f32 %129 = OpFNegate %128 
					                                Output f32* %130 = OpAccessChain %72 %22 %68 
					                                                     OpStore %130 %129 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 102
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %12 %75 %99 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %12 Location 12 
					                                                    OpDecorate %19 RelaxedPrecision 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %23 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %28 RelaxedPrecision 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %30 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpMemberDecorate %37 0 RelaxedPrecision 
					                                                    OpMemberDecorate %37 0 Offset 37 
					                                                    OpMemberDecorate %37 1 RelaxedPrecision 
					                                                    OpMemberDecorate %37 1 Offset 37 
					                                                    OpDecorate %37 Block 
					                                                    OpDecorate %39 DescriptorSet 39 
					                                                    OpDecorate %39 Binding 39 
					                                                    OpDecorate %44 RelaxedPrecision 
					                                                    OpDecorate %47 RelaxedPrecision 
					                                                    OpDecorate %48 RelaxedPrecision 
					                                                    OpDecorate %49 RelaxedPrecision 
					                                                    OpDecorate %53 RelaxedPrecision 
					                                                    OpDecorate %56 RelaxedPrecision 
					                                                    OpDecorate %59 RelaxedPrecision 
					                                                    OpDecorate %61 RelaxedPrecision 
					                                                    OpDecorate %64 RelaxedPrecision 
					                                                    OpDecorate %65 RelaxedPrecision 
					                                                    OpDecorate %67 RelaxedPrecision 
					                                                    OpDecorate %68 RelaxedPrecision 
					                                                    OpDecorate %69 RelaxedPrecision 
					                                                    OpDecorate %73 RelaxedPrecision 
					                                                    OpDecorate %73 DescriptorSet 73 
					                                                    OpDecorate %73 Binding 73 
					                                                    OpDecorate %74 RelaxedPrecision 
					                                                    OpDecorate %75 Location 75 
					                                                    OpDecorate %78 RelaxedPrecision 
					                                                    OpDecorate %79 RelaxedPrecision 
					                                                    OpDecorate %79 DescriptorSet 79 
					                                                    OpDecorate %79 Binding 79 
					                                                    OpDecorate %80 RelaxedPrecision 
					                                                    OpDecorate %83 RelaxedPrecision 
					                                                    OpDecorate %84 RelaxedPrecision 
					                                                    OpDecorate %85 RelaxedPrecision 
					                                                    OpDecorate %86 RelaxedPrecision 
					                                                    OpDecorate %87 RelaxedPrecision 
					                                                    OpDecorate %88 RelaxedPrecision 
					                                                    OpDecorate %89 RelaxedPrecision 
					                                                    OpDecorate %90 RelaxedPrecision 
					                                                    OpDecorate %91 RelaxedPrecision 
					                                                    OpDecorate %92 RelaxedPrecision 
					                                                    OpDecorate %93 RelaxedPrecision 
					                                                    OpDecorate %94 RelaxedPrecision 
					                                                    OpDecorate %95 RelaxedPrecision 
					                                                    OpDecorate %96 RelaxedPrecision 
					                                                    OpDecorate %97 RelaxedPrecision 
					                                                    OpDecorate %99 RelaxedPrecision 
					                                                    OpDecorate %99 Location 99 
					                                                    OpDecorate %100 RelaxedPrecision 
					                                             %2 = OpTypeVoid 
					                                             %3 = OpTypeFunction %2 
					                                             %6 = OpTypeFloat 32 
					                                             %7 = OpTypeVector %6 4 
					                                             %8 = OpTypePointer Private %7 
					                              Private f32_4* %9 = OpVariable Private 
					                                            %10 = OpTypeVector %6 2 
					                                            %11 = OpTypePointer Input %10 
					                               Input f32_2* %12 = OpVariable Input 
					                                        f32 %14 = OpConstant 3.674022E-40 
					                                      f32_2 %15 = OpConstantComposite %14 %14 
					                                            %31 = OpTypeInt 32 0 
					                                        u32 %32 = OpConstant 0 
					                                            %33 = OpTypePointer Private %6 
					                                            %37 = OpTypeStruct %6 %6 
					                                            %38 = OpTypePointer Uniform %37 
					                Uniform struct {f32; f32;}* %39 = OpVariable Uniform 
					                                            %40 = OpTypeInt 32 1 
					                                        i32 %41 = OpConstant 1 
					                                            %42 = OpTypePointer Uniform %6 
					                                        i32 %45 = OpConstant 0 
					                                        f32 %57 = OpConstant 3.674022E-40 
					                                        f32 %58 = OpConstant 3.674022E-40 
					                               Private f32* %61 = OpVariable Private 
					                                        u32 %62 = OpConstant 1 
					                                        f32 %66 = OpConstant 3.674022E-40 
					                             Private f32_4* %69 = OpVariable Private 
					                                            %70 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %71 = OpTypeSampledImage %70 
					                                            %72 = OpTypePointer UniformConstant %71 
					UniformConstant read_only Texture2DSampled* %73 = OpVariable UniformConstant 
					                               Input f32_2* %75 = OpVariable Input 
					                             Private f32_4* %78 = OpVariable Private 
					UniformConstant read_only Texture2DSampled* %79 = OpVariable UniformConstant 
					                             Private f32_4* %83 = OpVariable Private 
					                                            %98 = OpTypePointer Output %7 
					                              Output f32_4* %99 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                                      f32_2 %13 = OpLoad %12 
					                                      f32_2 %16 = OpFAdd %13 %15 
					                                      f32_4 %17 = OpLoad %9 
					                                      f32_4 %18 = OpVectorShuffle %17 %16 4 5 2 3 
					                                                    OpStore %9 %18 
					                                      f32_4 %19 = OpLoad %9 
					                                      f32_2 %20 = OpVectorShuffle %19 %19 0 1 
					                                      f32_4 %21 = OpLoad %9 
					                                      f32_2 %22 = OpVectorShuffle %21 %21 0 1 
					                                      f32_2 %23 = OpFAdd %20 %22 
					                                      f32_4 %24 = OpLoad %9 
					                                      f32_4 %25 = OpVectorShuffle %24 %23 4 5 2 3 
					                                                    OpStore %9 %25 
					                                      f32_4 %26 = OpLoad %9 
					                                      f32_2 %27 = OpVectorShuffle %26 %26 0 1 
					                                      f32_4 %28 = OpLoad %9 
					                                      f32_2 %29 = OpVectorShuffle %28 %28 0 1 
					                                        f32 %30 = OpDot %27 %29 
					                               Private f32* %34 = OpAccessChain %9 %32 
					                                                    OpStore %34 %30 
					                                      f32_4 %35 = OpLoad %9 
					                                      f32_2 %36 = OpVectorShuffle %35 %35 0 0 
					                               Uniform f32* %43 = OpAccessChain %39 %41 
					                                        f32 %44 = OpLoad %43 
					                               Uniform f32* %46 = OpAccessChain %39 %45 
					                                        f32 %47 = OpLoad %46 
					                                      f32_2 %48 = OpCompositeConstruct %44 %47 
					                                      f32_2 %49 = OpFMul %36 %48 
					                                      f32_4 %50 = OpLoad %9 
					                                      f32_4 %51 = OpVectorShuffle %50 %49 4 5 2 3 
					                                                    OpStore %9 %51 
					                               Private f32* %52 = OpAccessChain %9 %32 
					                                        f32 %53 = OpLoad %52 
					                               Private f32* %54 = OpAccessChain %9 %32 
					                                                    OpStore %54 %53 
					                               Private f32* %55 = OpAccessChain %9 %32 
					                                        f32 %56 = OpLoad %55 
					                                        f32 %59 = OpExtInst %1 43 %56 %57 %58 
					                               Private f32* %60 = OpAccessChain %9 %32 
					                                                    OpStore %60 %59 
					                               Private f32* %63 = OpAccessChain %9 %62 
					                                        f32 %64 = OpLoad %63 
					                                        f32 %65 = OpFNegate %64 
					                                        f32 %67 = OpFMul %65 %66 
					                                        f32 %68 = OpFAdd %67 %58 
					                                                    OpStore %61 %68 
					                 read_only Texture2DSampled %74 = OpLoad %73 
					                                      f32_2 %76 = OpLoad %75 
					                                      f32_4 %77 = OpImageSampleImplicitLod %74 %76 
					                                                    OpStore %69 %77 
					                 read_only Texture2DSampled %80 = OpLoad %79 
					                                      f32_2 %81 = OpLoad %12 
					                                      f32_4 %82 = OpImageSampleImplicitLod %80 %81 
					                                                    OpStore %78 %82 
					                                      f32_4 %84 = OpLoad %69 
					                                      f32_4 %85 = OpLoad %78 
					                                      f32_4 %86 = OpFNegate %85 
					                                      f32_4 %87 = OpFAdd %84 %86 
					                                                    OpStore %83 %87 
					                                      f32_4 %88 = OpLoad %9 
					                                      f32_4 %89 = OpVectorShuffle %88 %88 0 0 0 0 
					                                      f32_4 %90 = OpLoad %83 
					                                      f32_4 %91 = OpFMul %89 %90 
					                                      f32_4 %92 = OpLoad %78 
					                                      f32_4 %93 = OpFAdd %91 %92 
					                                                    OpStore %83 %93 
					                                        f32 %94 = OpLoad %61 
					                                      f32_4 %95 = OpCompositeConstruct %94 %94 %94 %94 
					                                      f32_4 %96 = OpLoad %83 
					                                      f32_4 %97 = OpFMul %95 %96 
					                                                    OpStore %9 %97 
					                                     f32_4 %100 = OpLoad %9 
					                                                    OpStore %99 %100 
					                                                    OpReturn
					                                                    OpFunctionEnd"
				}
				SubProgram "vulkan hw_tier01 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 132
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %94 %120 %123 
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
					                                                     OpDecorate %94 RelaxedPrecision 
					                                                     OpDecorate %94 Location 94 
					                                                     OpDecorate %97 RelaxedPrecision 
					                                                     OpDecorate %98 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %110 RelaxedPrecision 
					                                                     OpDecorate %115 RelaxedPrecision 
					                                                     OpDecorate %116 RelaxedPrecision 
					                                                     OpDecorate %120 Location 120 
					                                                     OpDecorate %123 Location 123 
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
					                                             %82 = OpTypeBool 
					                                             %83 = OpTypePointer Private %82 
					                               Private bool* %84 = OpVariable Private 
					                                             %85 = OpTypePointer Uniform %6 
					                                         f32 %88 = OpConstant 3.674022E-40 
					                                             %90 = OpTypePointer Private %6 
					                                Private f32* %91 = OpVariable Private 
					                                             %92 = OpTypeVector %6 2 
					                                             %93 = OpTypePointer Input %92 
					                                Input f32_2* %94 = OpVariable Input 
					                                             %95 = OpTypePointer Input %6 
					                                         f32 %99 = OpConstant 3.674022E-40 
					                             Private f32_4* %101 = OpVariable Private 
					                                            %102 = OpTypePointer Function %6 
					                                        u32 %112 = OpConstant 3 
					                                            %114 = OpTypeVector %6 3 
					                                            %119 = OpTypePointer Output %92 
					                              Output f32_2* %120 = OpVariable Output 
					                              Output f32_2* %123 = OpVariable Output 
					                                            %126 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %103 = OpVariable Function 
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
					                                Uniform f32* %86 = OpAccessChain %20 %35 %68 
					                                         f32 %87 = OpLoad %86 
					                                        bool %89 = OpFOrdLessThan %87 %88 
					                                                     OpStore %84 %89 
					                                  Input f32* %96 = OpAccessChain %94 %68 
					                                         f32 %97 = OpLoad %96 
					                                         f32 %98 = OpFNegate %97 
					                                        f32 %100 = OpFAdd %98 %99 
					                                                     OpStore %91 %100 
					                                       bool %104 = OpLoad %84 
					                                                     OpSelectionMerge %106 None 
					                                                     OpBranchConditional %104 %105 %108 
					                                            %105 = OpLabel 
					                                        f32 %107 = OpLoad %91 
					                                                     OpStore %103 %107 
					                                                     OpBranch %106 
					                                            %108 = OpLabel 
					                                 Input f32* %109 = OpAccessChain %94 %68 
					                                        f32 %110 = OpLoad %109 
					                                                     OpStore %103 %110 
					                                                     OpBranch %106 
					                                            %106 = OpLabel 
					                                        f32 %111 = OpLoad %103 
					                               Private f32* %113 = OpAccessChain %101 %112 
					                                                     OpStore %113 %111 
					                                      f32_2 %115 = OpLoad %94 
					                                      f32_3 %116 = OpVectorShuffle %115 %115 0 1 0 
					                                      f32_4 %117 = OpLoad %101 
					                                      f32_4 %118 = OpVectorShuffle %117 %116 4 5 6 3 
					                                                     OpStore %101 %118 
					                                      f32_4 %121 = OpLoad %101 
					                                      f32_2 %122 = OpVectorShuffle %121 %121 0 1 
					                                                     OpStore %120 %122 
					                                      f32_4 %124 = OpLoad %101 
					                                      f32_2 %125 = OpVectorShuffle %124 %124 2 3 
					                                                     OpStore %123 %125 
					                                Output f32* %127 = OpAccessChain %72 %22 %68 
					                                        f32 %128 = OpLoad %127 
					                                        f32 %129 = OpFNegate %128 
					                                Output f32* %130 = OpAccessChain %72 %22 %68 
					                                                     OpStore %130 %129 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 102
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %12 %75 %99 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %12 Location 12 
					                                                    OpDecorate %19 RelaxedPrecision 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %23 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %28 RelaxedPrecision 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %30 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpMemberDecorate %37 0 RelaxedPrecision 
					                                                    OpMemberDecorate %37 0 Offset 37 
					                                                    OpMemberDecorate %37 1 RelaxedPrecision 
					                                                    OpMemberDecorate %37 1 Offset 37 
					                                                    OpDecorate %37 Block 
					                                                    OpDecorate %39 DescriptorSet 39 
					                                                    OpDecorate %39 Binding 39 
					                                                    OpDecorate %44 RelaxedPrecision 
					                                                    OpDecorate %47 RelaxedPrecision 
					                                                    OpDecorate %48 RelaxedPrecision 
					                                                    OpDecorate %49 RelaxedPrecision 
					                                                    OpDecorate %53 RelaxedPrecision 
					                                                    OpDecorate %56 RelaxedPrecision 
					                                                    OpDecorate %59 RelaxedPrecision 
					                                                    OpDecorate %61 RelaxedPrecision 
					                                                    OpDecorate %64 RelaxedPrecision 
					                                                    OpDecorate %65 RelaxedPrecision 
					                                                    OpDecorate %67 RelaxedPrecision 
					                                                    OpDecorate %68 RelaxedPrecision 
					                                                    OpDecorate %69 RelaxedPrecision 
					                                                    OpDecorate %73 RelaxedPrecision 
					                                                    OpDecorate %73 DescriptorSet 73 
					                                                    OpDecorate %73 Binding 73 
					                                                    OpDecorate %74 RelaxedPrecision 
					                                                    OpDecorate %75 Location 75 
					                                                    OpDecorate %78 RelaxedPrecision 
					                                                    OpDecorate %79 RelaxedPrecision 
					                                                    OpDecorate %79 DescriptorSet 79 
					                                                    OpDecorate %79 Binding 79 
					                                                    OpDecorate %80 RelaxedPrecision 
					                                                    OpDecorate %83 RelaxedPrecision 
					                                                    OpDecorate %84 RelaxedPrecision 
					                                                    OpDecorate %85 RelaxedPrecision 
					                                                    OpDecorate %86 RelaxedPrecision 
					                                                    OpDecorate %87 RelaxedPrecision 
					                                                    OpDecorate %88 RelaxedPrecision 
					                                                    OpDecorate %89 RelaxedPrecision 
					                                                    OpDecorate %90 RelaxedPrecision 
					                                                    OpDecorate %91 RelaxedPrecision 
					                                                    OpDecorate %92 RelaxedPrecision 
					                                                    OpDecorate %93 RelaxedPrecision 
					                                                    OpDecorate %94 RelaxedPrecision 
					                                                    OpDecorate %95 RelaxedPrecision 
					                                                    OpDecorate %96 RelaxedPrecision 
					                                                    OpDecorate %97 RelaxedPrecision 
					                                                    OpDecorate %99 RelaxedPrecision 
					                                                    OpDecorate %99 Location 99 
					                                                    OpDecorate %100 RelaxedPrecision 
					                                             %2 = OpTypeVoid 
					                                             %3 = OpTypeFunction %2 
					                                             %6 = OpTypeFloat 32 
					                                             %7 = OpTypeVector %6 4 
					                                             %8 = OpTypePointer Private %7 
					                              Private f32_4* %9 = OpVariable Private 
					                                            %10 = OpTypeVector %6 2 
					                                            %11 = OpTypePointer Input %10 
					                               Input f32_2* %12 = OpVariable Input 
					                                        f32 %14 = OpConstant 3.674022E-40 
					                                      f32_2 %15 = OpConstantComposite %14 %14 
					                                            %31 = OpTypeInt 32 0 
					                                        u32 %32 = OpConstant 0 
					                                            %33 = OpTypePointer Private %6 
					                                            %37 = OpTypeStruct %6 %6 
					                                            %38 = OpTypePointer Uniform %37 
					                Uniform struct {f32; f32;}* %39 = OpVariable Uniform 
					                                            %40 = OpTypeInt 32 1 
					                                        i32 %41 = OpConstant 1 
					                                            %42 = OpTypePointer Uniform %6 
					                                        i32 %45 = OpConstant 0 
					                                        f32 %57 = OpConstant 3.674022E-40 
					                                        f32 %58 = OpConstant 3.674022E-40 
					                               Private f32* %61 = OpVariable Private 
					                                        u32 %62 = OpConstant 1 
					                                        f32 %66 = OpConstant 3.674022E-40 
					                             Private f32_4* %69 = OpVariable Private 
					                                            %70 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %71 = OpTypeSampledImage %70 
					                                            %72 = OpTypePointer UniformConstant %71 
					UniformConstant read_only Texture2DSampled* %73 = OpVariable UniformConstant 
					                               Input f32_2* %75 = OpVariable Input 
					                             Private f32_4* %78 = OpVariable Private 
					UniformConstant read_only Texture2DSampled* %79 = OpVariable UniformConstant 
					                             Private f32_4* %83 = OpVariable Private 
					                                            %98 = OpTypePointer Output %7 
					                              Output f32_4* %99 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                                      f32_2 %13 = OpLoad %12 
					                                      f32_2 %16 = OpFAdd %13 %15 
					                                      f32_4 %17 = OpLoad %9 
					                                      f32_4 %18 = OpVectorShuffle %17 %16 4 5 2 3 
					                                                    OpStore %9 %18 
					                                      f32_4 %19 = OpLoad %9 
					                                      f32_2 %20 = OpVectorShuffle %19 %19 0 1 
					                                      f32_4 %21 = OpLoad %9 
					                                      f32_2 %22 = OpVectorShuffle %21 %21 0 1 
					                                      f32_2 %23 = OpFAdd %20 %22 
					                                      f32_4 %24 = OpLoad %9 
					                                      f32_4 %25 = OpVectorShuffle %24 %23 4 5 2 3 
					                                                    OpStore %9 %25 
					                                      f32_4 %26 = OpLoad %9 
					                                      f32_2 %27 = OpVectorShuffle %26 %26 0 1 
					                                      f32_4 %28 = OpLoad %9 
					                                      f32_2 %29 = OpVectorShuffle %28 %28 0 1 
					                                        f32 %30 = OpDot %27 %29 
					                               Private f32* %34 = OpAccessChain %9 %32 
					                                                    OpStore %34 %30 
					                                      f32_4 %35 = OpLoad %9 
					                                      f32_2 %36 = OpVectorShuffle %35 %35 0 0 
					                               Uniform f32* %43 = OpAccessChain %39 %41 
					                                        f32 %44 = OpLoad %43 
					                               Uniform f32* %46 = OpAccessChain %39 %45 
					                                        f32 %47 = OpLoad %46 
					                                      f32_2 %48 = OpCompositeConstruct %44 %47 
					                                      f32_2 %49 = OpFMul %36 %48 
					                                      f32_4 %50 = OpLoad %9 
					                                      f32_4 %51 = OpVectorShuffle %50 %49 4 5 2 3 
					                                                    OpStore %9 %51 
					                               Private f32* %52 = OpAccessChain %9 %32 
					                                        f32 %53 = OpLoad %52 
					                               Private f32* %54 = OpAccessChain %9 %32 
					                                                    OpStore %54 %53 
					                               Private f32* %55 = OpAccessChain %9 %32 
					                                        f32 %56 = OpLoad %55 
					                                        f32 %59 = OpExtInst %1 43 %56 %57 %58 
					                               Private f32* %60 = OpAccessChain %9 %32 
					                                                    OpStore %60 %59 
					                               Private f32* %63 = OpAccessChain %9 %62 
					                                        f32 %64 = OpLoad %63 
					                                        f32 %65 = OpFNegate %64 
					                                        f32 %67 = OpFMul %65 %66 
					                                        f32 %68 = OpFAdd %67 %58 
					                                                    OpStore %61 %68 
					                 read_only Texture2DSampled %74 = OpLoad %73 
					                                      f32_2 %76 = OpLoad %75 
					                                      f32_4 %77 = OpImageSampleImplicitLod %74 %76 
					                                                    OpStore %69 %77 
					                 read_only Texture2DSampled %80 = OpLoad %79 
					                                      f32_2 %81 = OpLoad %12 
					                                      f32_4 %82 = OpImageSampleImplicitLod %80 %81 
					                                                    OpStore %78 %82 
					                                      f32_4 %84 = OpLoad %69 
					                                      f32_4 %85 = OpLoad %78 
					                                      f32_4 %86 = OpFNegate %85 
					                                      f32_4 %87 = OpFAdd %84 %86 
					                                                    OpStore %83 %87 
					                                      f32_4 %88 = OpLoad %9 
					                                      f32_4 %89 = OpVectorShuffle %88 %88 0 0 0 0 
					                                      f32_4 %90 = OpLoad %83 
					                                      f32_4 %91 = OpFMul %89 %90 
					                                      f32_4 %92 = OpLoad %78 
					                                      f32_4 %93 = OpFAdd %91 %92 
					                                                    OpStore %83 %93 
					                                        f32 %94 = OpLoad %61 
					                                      f32_4 %95 = OpCompositeConstruct %94 %94 %94 %94 
					                                      f32_4 %96 = OpLoad %83 
					                                      f32_4 %97 = OpFMul %95 %96 
					                                                    OpStore %9 %97 
					                                     f32_4 %100 = OpLoad %9 
					                                                    OpStore %99 %100 
					                                                    OpReturn
					                                                    OpFunctionEnd"
				}
				SubProgram "vulkan hw_tier02 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 132
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %94 %120 %123 
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
					                                                     OpDecorate %94 RelaxedPrecision 
					                                                     OpDecorate %94 Location 94 
					                                                     OpDecorate %97 RelaxedPrecision 
					                                                     OpDecorate %98 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %110 RelaxedPrecision 
					                                                     OpDecorate %115 RelaxedPrecision 
					                                                     OpDecorate %116 RelaxedPrecision 
					                                                     OpDecorate %120 Location 120 
					                                                     OpDecorate %123 Location 123 
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
					                                             %82 = OpTypeBool 
					                                             %83 = OpTypePointer Private %82 
					                               Private bool* %84 = OpVariable Private 
					                                             %85 = OpTypePointer Uniform %6 
					                                         f32 %88 = OpConstant 3.674022E-40 
					                                             %90 = OpTypePointer Private %6 
					                                Private f32* %91 = OpVariable Private 
					                                             %92 = OpTypeVector %6 2 
					                                             %93 = OpTypePointer Input %92 
					                                Input f32_2* %94 = OpVariable Input 
					                                             %95 = OpTypePointer Input %6 
					                                         f32 %99 = OpConstant 3.674022E-40 
					                             Private f32_4* %101 = OpVariable Private 
					                                            %102 = OpTypePointer Function %6 
					                                        u32 %112 = OpConstant 3 
					                                            %114 = OpTypeVector %6 3 
					                                            %119 = OpTypePointer Output %92 
					                              Output f32_2* %120 = OpVariable Output 
					                              Output f32_2* %123 = OpVariable Output 
					                                            %126 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %103 = OpVariable Function 
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
					                                Uniform f32* %86 = OpAccessChain %20 %35 %68 
					                                         f32 %87 = OpLoad %86 
					                                        bool %89 = OpFOrdLessThan %87 %88 
					                                                     OpStore %84 %89 
					                                  Input f32* %96 = OpAccessChain %94 %68 
					                                         f32 %97 = OpLoad %96 
					                                         f32 %98 = OpFNegate %97 
					                                        f32 %100 = OpFAdd %98 %99 
					                                                     OpStore %91 %100 
					                                       bool %104 = OpLoad %84 
					                                                     OpSelectionMerge %106 None 
					                                                     OpBranchConditional %104 %105 %108 
					                                            %105 = OpLabel 
					                                        f32 %107 = OpLoad %91 
					                                                     OpStore %103 %107 
					                                                     OpBranch %106 
					                                            %108 = OpLabel 
					                                 Input f32* %109 = OpAccessChain %94 %68 
					                                        f32 %110 = OpLoad %109 
					                                                     OpStore %103 %110 
					                                                     OpBranch %106 
					                                            %106 = OpLabel 
					                                        f32 %111 = OpLoad %103 
					                               Private f32* %113 = OpAccessChain %101 %112 
					                                                     OpStore %113 %111 
					                                      f32_2 %115 = OpLoad %94 
					                                      f32_3 %116 = OpVectorShuffle %115 %115 0 1 0 
					                                      f32_4 %117 = OpLoad %101 
					                                      f32_4 %118 = OpVectorShuffle %117 %116 4 5 6 3 
					                                                     OpStore %101 %118 
					                                      f32_4 %121 = OpLoad %101 
					                                      f32_2 %122 = OpVectorShuffle %121 %121 0 1 
					                                                     OpStore %120 %122 
					                                      f32_4 %124 = OpLoad %101 
					                                      f32_2 %125 = OpVectorShuffle %124 %124 2 3 
					                                                     OpStore %123 %125 
					                                Output f32* %127 = OpAccessChain %72 %22 %68 
					                                        f32 %128 = OpLoad %127 
					                                        f32 %129 = OpFNegate %128 
					                                Output f32* %130 = OpAccessChain %72 %22 %68 
					                                                     OpStore %130 %129 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 102
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %12 %75 %99 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %12 Location 12 
					                                                    OpDecorate %19 RelaxedPrecision 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %23 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %28 RelaxedPrecision 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %30 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpMemberDecorate %37 0 RelaxedPrecision 
					                                                    OpMemberDecorate %37 0 Offset 37 
					                                                    OpMemberDecorate %37 1 RelaxedPrecision 
					                                                    OpMemberDecorate %37 1 Offset 37 
					                                                    OpDecorate %37 Block 
					                                                    OpDecorate %39 DescriptorSet 39 
					                                                    OpDecorate %39 Binding 39 
					                                                    OpDecorate %44 RelaxedPrecision 
					                                                    OpDecorate %47 RelaxedPrecision 
					                                                    OpDecorate %48 RelaxedPrecision 
					                                                    OpDecorate %49 RelaxedPrecision 
					                                                    OpDecorate %53 RelaxedPrecision 
					                                                    OpDecorate %56 RelaxedPrecision 
					                                                    OpDecorate %59 RelaxedPrecision 
					                                                    OpDecorate %61 RelaxedPrecision 
					                                                    OpDecorate %64 RelaxedPrecision 
					                                                    OpDecorate %65 RelaxedPrecision 
					                                                    OpDecorate %67 RelaxedPrecision 
					                                                    OpDecorate %68 RelaxedPrecision 
					                                                    OpDecorate %69 RelaxedPrecision 
					                                                    OpDecorate %73 RelaxedPrecision 
					                                                    OpDecorate %73 DescriptorSet 73 
					                                                    OpDecorate %73 Binding 73 
					                                                    OpDecorate %74 RelaxedPrecision 
					                                                    OpDecorate %75 Location 75 
					                                                    OpDecorate %78 RelaxedPrecision 
					                                                    OpDecorate %79 RelaxedPrecision 
					                                                    OpDecorate %79 DescriptorSet 79 
					                                                    OpDecorate %79 Binding 79 
					                                                    OpDecorate %80 RelaxedPrecision 
					                                                    OpDecorate %83 RelaxedPrecision 
					                                                    OpDecorate %84 RelaxedPrecision 
					                                                    OpDecorate %85 RelaxedPrecision 
					                                                    OpDecorate %86 RelaxedPrecision 
					                                                    OpDecorate %87 RelaxedPrecision 
					                                                    OpDecorate %88 RelaxedPrecision 
					                                                    OpDecorate %89 RelaxedPrecision 
					                                                    OpDecorate %90 RelaxedPrecision 
					                                                    OpDecorate %91 RelaxedPrecision 
					                                                    OpDecorate %92 RelaxedPrecision 
					                                                    OpDecorate %93 RelaxedPrecision 
					                                                    OpDecorate %94 RelaxedPrecision 
					                                                    OpDecorate %95 RelaxedPrecision 
					                                                    OpDecorate %96 RelaxedPrecision 
					                                                    OpDecorate %97 RelaxedPrecision 
					                                                    OpDecorate %99 RelaxedPrecision 
					                                                    OpDecorate %99 Location 99 
					                                                    OpDecorate %100 RelaxedPrecision 
					                                             %2 = OpTypeVoid 
					                                             %3 = OpTypeFunction %2 
					                                             %6 = OpTypeFloat 32 
					                                             %7 = OpTypeVector %6 4 
					                                             %8 = OpTypePointer Private %7 
					                              Private f32_4* %9 = OpVariable Private 
					                                            %10 = OpTypeVector %6 2 
					                                            %11 = OpTypePointer Input %10 
					                               Input f32_2* %12 = OpVariable Input 
					                                        f32 %14 = OpConstant 3.674022E-40 
					                                      f32_2 %15 = OpConstantComposite %14 %14 
					                                            %31 = OpTypeInt 32 0 
					                                        u32 %32 = OpConstant 0 
					                                            %33 = OpTypePointer Private %6 
					                                            %37 = OpTypeStruct %6 %6 
					                                            %38 = OpTypePointer Uniform %37 
					                Uniform struct {f32; f32;}* %39 = OpVariable Uniform 
					                                            %40 = OpTypeInt 32 1 
					                                        i32 %41 = OpConstant 1 
					                                            %42 = OpTypePointer Uniform %6 
					                                        i32 %45 = OpConstant 0 
					                                        f32 %57 = OpConstant 3.674022E-40 
					                                        f32 %58 = OpConstant 3.674022E-40 
					                               Private f32* %61 = OpVariable Private 
					                                        u32 %62 = OpConstant 1 
					                                        f32 %66 = OpConstant 3.674022E-40 
					                             Private f32_4* %69 = OpVariable Private 
					                                            %70 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %71 = OpTypeSampledImage %70 
					                                            %72 = OpTypePointer UniformConstant %71 
					UniformConstant read_only Texture2DSampled* %73 = OpVariable UniformConstant 
					                               Input f32_2* %75 = OpVariable Input 
					                             Private f32_4* %78 = OpVariable Private 
					UniformConstant read_only Texture2DSampled* %79 = OpVariable UniformConstant 
					                             Private f32_4* %83 = OpVariable Private 
					                                            %98 = OpTypePointer Output %7 
					                              Output f32_4* %99 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                                      f32_2 %13 = OpLoad %12 
					                                      f32_2 %16 = OpFAdd %13 %15 
					                                      f32_4 %17 = OpLoad %9 
					                                      f32_4 %18 = OpVectorShuffle %17 %16 4 5 2 3 
					                                                    OpStore %9 %18 
					                                      f32_4 %19 = OpLoad %9 
					                                      f32_2 %20 = OpVectorShuffle %19 %19 0 1 
					                                      f32_4 %21 = OpLoad %9 
					                                      f32_2 %22 = OpVectorShuffle %21 %21 0 1 
					                                      f32_2 %23 = OpFAdd %20 %22 
					                                      f32_4 %24 = OpLoad %9 
					                                      f32_4 %25 = OpVectorShuffle %24 %23 4 5 2 3 
					                                                    OpStore %9 %25 
					                                      f32_4 %26 = OpLoad %9 
					                                      f32_2 %27 = OpVectorShuffle %26 %26 0 1 
					                                      f32_4 %28 = OpLoad %9 
					                                      f32_2 %29 = OpVectorShuffle %28 %28 0 1 
					                                        f32 %30 = OpDot %27 %29 
					                               Private f32* %34 = OpAccessChain %9 %32 
					                                                    OpStore %34 %30 
					                                      f32_4 %35 = OpLoad %9 
					                                      f32_2 %36 = OpVectorShuffle %35 %35 0 0 
					                               Uniform f32* %43 = OpAccessChain %39 %41 
					                                        f32 %44 = OpLoad %43 
					                               Uniform f32* %46 = OpAccessChain %39 %45 
					                                        f32 %47 = OpLoad %46 
					                                      f32_2 %48 = OpCompositeConstruct %44 %47 
					                                      f32_2 %49 = OpFMul %36 %48 
					                                      f32_4 %50 = OpLoad %9 
					                                      f32_4 %51 = OpVectorShuffle %50 %49 4 5 2 3 
					                                                    OpStore %9 %51 
					                               Private f32* %52 = OpAccessChain %9 %32 
					                                        f32 %53 = OpLoad %52 
					                               Private f32* %54 = OpAccessChain %9 %32 
					                                                    OpStore %54 %53 
					                               Private f32* %55 = OpAccessChain %9 %32 
					                                        f32 %56 = OpLoad %55 
					                                        f32 %59 = OpExtInst %1 43 %56 %57 %58 
					                               Private f32* %60 = OpAccessChain %9 %32 
					                                                    OpStore %60 %59 
					                               Private f32* %63 = OpAccessChain %9 %62 
					                                        f32 %64 = OpLoad %63 
					                                        f32 %65 = OpFNegate %64 
					                                        f32 %67 = OpFMul %65 %66 
					                                        f32 %68 = OpFAdd %67 %58 
					                                                    OpStore %61 %68 
					                 read_only Texture2DSampled %74 = OpLoad %73 
					                                      f32_2 %76 = OpLoad %75 
					                                      f32_4 %77 = OpImageSampleImplicitLod %74 %76 
					                                                    OpStore %69 %77 
					                 read_only Texture2DSampled %80 = OpLoad %79 
					                                      f32_2 %81 = OpLoad %12 
					                                      f32_4 %82 = OpImageSampleImplicitLod %80 %81 
					                                                    OpStore %78 %82 
					                                      f32_4 %84 = OpLoad %69 
					                                      f32_4 %85 = OpLoad %78 
					                                      f32_4 %86 = OpFNegate %85 
					                                      f32_4 %87 = OpFAdd %84 %86 
					                                                    OpStore %83 %87 
					                                      f32_4 %88 = OpLoad %9 
					                                      f32_4 %89 = OpVectorShuffle %88 %88 0 0 0 0 
					                                      f32_4 %90 = OpLoad %83 
					                                      f32_4 %91 = OpFMul %89 %90 
					                                      f32_4 %92 = OpLoad %78 
					                                      f32_4 %93 = OpFAdd %91 %92 
					                                                    OpStore %83 %93 
					                                        f32 %94 = OpLoad %61 
					                                      f32_4 %95 = OpCompositeConstruct %94 %94 %94 %94 
					                                      f32_4 %96 = OpLoad %83 
					                                      f32_4 %97 = OpFMul %95 %96 
					                                                    OpStore %9 %97 
					                                     f32_4 %100 = OpLoad %9 
					                                                    OpStore %99 %100 
					                                                    OpReturn
					                                                    OpFunctionEnd"
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