Shader "Hidden/LensFlareCreate" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "" {}
	}
	SubShader {
		Pass {
			Blend One One, One One
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 22580
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
					varying highp vec2 xlv_TEXCOORD0_1;
					varying highp vec2 xlv_TEXCOORD0_2;
					varying highp vec2 xlv_TEXCOORD0_3;
					void main ()
					{
					  highp vec2 tmpvar_1;
					  highp vec2 tmpvar_2;
					  highp vec2 tmpvar_3;
					  highp vec2 tmpvar_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5.w = 1.0;
					  tmpvar_5.xyz = _glesVertex.xyz;
					  mediump vec2 tmpvar_6;
					  tmpvar_6 = (_glesMultiTexCoord0.xy - 0.5);
					  tmpvar_1 = ((tmpvar_6 * -0.85) + 0.5);
					  tmpvar_2 = ((tmpvar_6 * -1.45) + 0.5);
					  tmpvar_3 = ((tmpvar_6 * -2.55) + 0.5);
					  tmpvar_4 = ((tmpvar_6 * -4.15) + 0.5);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
					  xlv_TEXCOORD0 = tmpvar_1;
					  xlv_TEXCOORD0_1 = tmpvar_2;
					  xlv_TEXCOORD0_2 = tmpvar_3;
					  xlv_TEXCOORD0_3 = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 colorA;
					uniform lowp vec4 colorB;
					uniform lowp vec4 colorC;
					uniform lowp vec4 colorD;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
					varying highp vec2 xlv_TEXCOORD0_2;
					varying highp vec2 xlv_TEXCOORD0_3;
					void main ()
					{
					  lowp vec4 color_1;
					  color_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * colorA);
					  color_1 = (color_1 + (texture2D (_MainTex, xlv_TEXCOORD0_1) * colorB));
					  color_1 = (color_1 + (texture2D (_MainTex, xlv_TEXCOORD0_2) * colorC));
					  color_1 = (color_1 + (texture2D (_MainTex, xlv_TEXCOORD0_3) * colorD));
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
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
					varying highp vec2 xlv_TEXCOORD0_2;
					varying highp vec2 xlv_TEXCOORD0_3;
					void main ()
					{
					  highp vec2 tmpvar_1;
					  highp vec2 tmpvar_2;
					  highp vec2 tmpvar_3;
					  highp vec2 tmpvar_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5.w = 1.0;
					  tmpvar_5.xyz = _glesVertex.xyz;
					  mediump vec2 tmpvar_6;
					  tmpvar_6 = (_glesMultiTexCoord0.xy - 0.5);
					  tmpvar_1 = ((tmpvar_6 * -0.85) + 0.5);
					  tmpvar_2 = ((tmpvar_6 * -1.45) + 0.5);
					  tmpvar_3 = ((tmpvar_6 * -2.55) + 0.5);
					  tmpvar_4 = ((tmpvar_6 * -4.15) + 0.5);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
					  xlv_TEXCOORD0 = tmpvar_1;
					  xlv_TEXCOORD0_1 = tmpvar_2;
					  xlv_TEXCOORD0_2 = tmpvar_3;
					  xlv_TEXCOORD0_3 = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 colorA;
					uniform lowp vec4 colorB;
					uniform lowp vec4 colorC;
					uniform lowp vec4 colorD;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
					varying highp vec2 xlv_TEXCOORD0_2;
					varying highp vec2 xlv_TEXCOORD0_3;
					void main ()
					{
					  lowp vec4 color_1;
					  color_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * colorA);
					  color_1 = (color_1 + (texture2D (_MainTex, xlv_TEXCOORD0_1) * colorB));
					  color_1 = (color_1 + (texture2D (_MainTex, xlv_TEXCOORD0_2) * colorC));
					  color_1 = (color_1 + (texture2D (_MainTex, xlv_TEXCOORD0_3) * colorD));
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
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
					varying highp vec2 xlv_TEXCOORD0_2;
					varying highp vec2 xlv_TEXCOORD0_3;
					void main ()
					{
					  highp vec2 tmpvar_1;
					  highp vec2 tmpvar_2;
					  highp vec2 tmpvar_3;
					  highp vec2 tmpvar_4;
					  highp vec4 tmpvar_5;
					  tmpvar_5.w = 1.0;
					  tmpvar_5.xyz = _glesVertex.xyz;
					  mediump vec2 tmpvar_6;
					  tmpvar_6 = (_glesMultiTexCoord0.xy - 0.5);
					  tmpvar_1 = ((tmpvar_6 * -0.85) + 0.5);
					  tmpvar_2 = ((tmpvar_6 * -1.45) + 0.5);
					  tmpvar_3 = ((tmpvar_6 * -2.55) + 0.5);
					  tmpvar_4 = ((tmpvar_6 * -4.15) + 0.5);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
					  xlv_TEXCOORD0 = tmpvar_1;
					  xlv_TEXCOORD0_1 = tmpvar_2;
					  xlv_TEXCOORD0_2 = tmpvar_3;
					  xlv_TEXCOORD0_3 = tmpvar_4;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 colorA;
					uniform lowp vec4 colorB;
					uniform lowp vec4 colorC;
					uniform lowp vec4 colorD;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
					varying highp vec2 xlv_TEXCOORD0_2;
					varying highp vec2 xlv_TEXCOORD0_3;
					void main ()
					{
					  lowp vec4 color_1;
					  color_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * colorA);
					  color_1 = (color_1 + (texture2D (_MainTex, xlv_TEXCOORD0_1) * colorB));
					  color_1 = (color_1 + (texture2D (_MainTex, xlv_TEXCOORD0_2) * colorC));
					  color_1 = (color_1 + (texture2D (_MainTex, xlv_TEXCOORD0_3) * colorD));
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
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec2 vs_TEXCOORD1;
					out highp vec2 vs_TEXCOORD2;
					out highp vec2 vs_TEXCOORD3;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
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
					    u_xlat16_0 = in_TEXCOORD0.xyxy + vec4(-0.5, -0.5, -0.5, -0.5);
					    u_xlat16_1 = u_xlat16_0.zwzw * vec4(-0.850000024, -0.850000024, -1.45000005, -1.45000005) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat16_0 = u_xlat16_0 * vec4(-2.54999995, -2.54999995, -4.1500001, -4.1500001) + vec4(0.5, 0.5, 0.5, 0.5);
					    vs_TEXCOORD0.xy = u_xlat16_1.xy;
					    vs_TEXCOORD1.xy = u_xlat16_1.zw;
					    vs_TEXCOORD2.xy = u_xlat16_0.xy;
					    vs_TEXCOORD3.xy = u_xlat16_0.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 colorA;
					uniform 	mediump vec4 colorB;
					uniform 	mediump vec4 colorC;
					uniform 	mediump vec4 colorD;
					uniform lowp sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					in highp vec2 vs_TEXCOORD2;
					in highp vec2 vs_TEXCOORD3;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat10_0 * colorB;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = u_xlat10_1 * colorA + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat10_1 * colorC + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat10_1 * colorD + u_xlat16_0;
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
					out highp vec2 vs_TEXCOORD1;
					out highp vec2 vs_TEXCOORD2;
					out highp vec2 vs_TEXCOORD3;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
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
					    u_xlat16_0 = in_TEXCOORD0.xyxy + vec4(-0.5, -0.5, -0.5, -0.5);
					    u_xlat16_1 = u_xlat16_0.zwzw * vec4(-0.850000024, -0.850000024, -1.45000005, -1.45000005) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat16_0 = u_xlat16_0 * vec4(-2.54999995, -2.54999995, -4.1500001, -4.1500001) + vec4(0.5, 0.5, 0.5, 0.5);
					    vs_TEXCOORD0.xy = u_xlat16_1.xy;
					    vs_TEXCOORD1.xy = u_xlat16_1.zw;
					    vs_TEXCOORD2.xy = u_xlat16_0.xy;
					    vs_TEXCOORD3.xy = u_xlat16_0.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 colorA;
					uniform 	mediump vec4 colorB;
					uniform 	mediump vec4 colorC;
					uniform 	mediump vec4 colorD;
					uniform lowp sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					in highp vec2 vs_TEXCOORD2;
					in highp vec2 vs_TEXCOORD3;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat10_0 * colorB;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = u_xlat10_1 * colorA + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat10_1 * colorC + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat10_1 * colorD + u_xlat16_0;
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
					out highp vec2 vs_TEXCOORD1;
					out highp vec2 vs_TEXCOORD2;
					out highp vec2 vs_TEXCOORD3;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					vec4 u_xlat1;
					mediump vec4 u_xlat16_1;
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
					    u_xlat16_0 = in_TEXCOORD0.xyxy + vec4(-0.5, -0.5, -0.5, -0.5);
					    u_xlat16_1 = u_xlat16_0.zwzw * vec4(-0.850000024, -0.850000024, -1.45000005, -1.45000005) + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat16_0 = u_xlat16_0 * vec4(-2.54999995, -2.54999995, -4.1500001, -4.1500001) + vec4(0.5, 0.5, 0.5, 0.5);
					    vs_TEXCOORD0.xy = u_xlat16_1.xy;
					    vs_TEXCOORD1.xy = u_xlat16_1.zw;
					    vs_TEXCOORD2.xy = u_xlat16_0.xy;
					    vs_TEXCOORD3.xy = u_xlat16_0.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 colorA;
					uniform 	mediump vec4 colorB;
					uniform 	mediump vec4 colorC;
					uniform 	mediump vec4 colorD;
					uniform lowp sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					in highp vec2 vs_TEXCOORD2;
					in highp vec2 vs_TEXCOORD3;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat10_0 * colorB;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = u_xlat10_1 * colorA + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat10_1 * colorC + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat10_1 * colorD + u_xlat16_0;
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
					; Bound: 126
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Vertex %4 "main" %11 %72 %85 %108 %111 %114 %117 
					                                              OpDecorate %11 Location 11 
					                                              OpDecorate %16 ArrayStride 16 
					                                              OpDecorate %17 ArrayStride 17 
					                                              OpMemberDecorate %18 0 Offset 18 
					                                              OpMemberDecorate %18 1 Offset 18 
					                                              OpDecorate %18 Block 
					                                              OpDecorate %20 DescriptorSet 20 
					                                              OpDecorate %20 Binding 20 
					                                              OpMemberDecorate %70 0 BuiltIn 70 
					                                              OpMemberDecorate %70 1 BuiltIn 70 
					                                              OpMemberDecorate %70 2 BuiltIn 70 
					                                              OpDecorate %70 Block 
					                                              OpDecorate %82 RelaxedPrecision 
					                                              OpDecorate %85 RelaxedPrecision 
					                                              OpDecorate %85 Location 85 
					                                              OpDecorate %86 RelaxedPrecision 
					                                              OpDecorate %87 RelaxedPrecision 
					                                              OpDecorate %90 RelaxedPrecision 
					                                              OpDecorate %91 RelaxedPrecision 
					                                              OpDecorate %92 RelaxedPrecision 
					                                              OpDecorate %93 RelaxedPrecision 
					                                              OpDecorate %97 RelaxedPrecision 
					                                              OpDecorate %100 RelaxedPrecision 
					                                              OpDecorate %101 RelaxedPrecision 
					                                              OpDecorate %105 RelaxedPrecision 
					                                              OpDecorate %106 RelaxedPrecision 
					                                              OpDecorate %108 Location 108 
					                                              OpDecorate %109 RelaxedPrecision 
					                                              OpDecorate %110 RelaxedPrecision 
					                                              OpDecorate %111 Location 111 
					                                              OpDecorate %112 RelaxedPrecision 
					                                              OpDecorate %113 RelaxedPrecision 
					                                              OpDecorate %114 Location 114 
					                                              OpDecorate %115 RelaxedPrecision 
					                                              OpDecorate %116 RelaxedPrecision 
					                                              OpDecorate %117 Location 117 
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
					                                      %18 = OpTypeStruct %16 %17 
					                                      %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
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
					                       Private f32_4* %82 = OpVariable Private 
					                                      %83 = OpTypeVector %6 2 
					                                      %84 = OpTypePointer Input %83 
					                         Input f32_2* %85 = OpVariable Input 
					                                  f32 %88 = OpConstant 3.674022E-40 
					                                f32_4 %89 = OpConstantComposite %88 %88 %88 %88 
					                       Private f32_4* %91 = OpVariable Private 
					                                  f32 %94 = OpConstant 3.674022E-40 
					                                  f32 %95 = OpConstant 3.674022E-40 
					                                f32_4 %96 = OpConstantComposite %94 %94 %95 %95 
					                                  f32 %98 = OpConstant 3.674022E-40 
					                                f32_4 %99 = OpConstantComposite %98 %98 %98 %98 
					                                 f32 %102 = OpConstant 3.674022E-40 
					                                 f32 %103 = OpConstant 3.674022E-40 
					                               f32_4 %104 = OpConstantComposite %102 %102 %103 %103 
					                                     %107 = OpTypePointer Output %83 
					                       Output f32_2* %108 = OpVariable Output 
					                       Output f32_2* %111 = OpVariable Output 
					                       Output f32_2* %114 = OpVariable Output 
					                       Output f32_2* %117 = OpVariable Output 
					                                     %120 = OpTypePointer Output %6 
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
					                                f32_2 %86 = OpLoad %85 
					                                f32_4 %87 = OpVectorShuffle %86 %86 0 1 0 1 
					                                f32_4 %90 = OpFAdd %87 %89 
					                                              OpStore %82 %90 
					                                f32_4 %92 = OpLoad %82 
					                                f32_4 %93 = OpVectorShuffle %92 %92 2 3 2 3 
					                                f32_4 %97 = OpFMul %93 %96 
					                               f32_4 %100 = OpFAdd %97 %99 
					                                              OpStore %91 %100 
					                               f32_4 %101 = OpLoad %82 
					                               f32_4 %105 = OpFMul %101 %104 
					                               f32_4 %106 = OpFAdd %105 %99 
					                                              OpStore %82 %106 
					                               f32_4 %109 = OpLoad %91 
					                               f32_2 %110 = OpVectorShuffle %109 %109 0 1 
					                                              OpStore %108 %110 
					                               f32_4 %112 = OpLoad %91 
					                               f32_2 %113 = OpVectorShuffle %112 %112 2 3 
					                                              OpStore %111 %113 
					                               f32_4 %115 = OpLoad %82 
					                               f32_2 %116 = OpVectorShuffle %115 %115 0 1 
					                                              OpStore %114 %116 
					                               f32_4 %118 = OpLoad %82 
					                               f32_2 %119 = OpVectorShuffle %118 %118 2 3 
					                                              OpStore %117 %119 
					                         Output f32* %121 = OpAccessChain %72 %22 %68 
					                                 f32 %122 = OpLoad %121 
					                                 f32 %123 = OpFNegate %122 
					                         Output f32* %124 = OpAccessChain %72 %22 %68 
					                                              OpStore %124 %123 
					                                              OpReturn
					                                              OpFunctionEnd

					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 69
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %17 %33 %44 %55 %66 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpDecorate %9 RelaxedPrecision 
					                                                      OpDecorate %13 RelaxedPrecision 
					                                                      OpDecorate %13 DescriptorSet 13 
					                                                      OpDecorate %13 Binding 13 
					                                                      OpDecorate %14 RelaxedPrecision 
					                                                      OpDecorate %17 Location 17 
					                                                      OpDecorate %20 RelaxedPrecision 
					                                                      OpDecorate %21 RelaxedPrecision 
					                                                      OpMemberDecorate %22 0 RelaxedPrecision 
					                                                      OpMemberDecorate %22 0 Offset 22 
					                                                      OpMemberDecorate %22 1 RelaxedPrecision 
					                                                      OpMemberDecorate %22 1 Offset 22 
					                                                      OpMemberDecorate %22 2 RelaxedPrecision 
					                                                      OpMemberDecorate %22 2 Offset 22 
					                                                      OpMemberDecorate %22 3 RelaxedPrecision 
					                                                      OpMemberDecorate %22 3 Offset 22 
					                                                      OpDecorate %22 Block 
					                                                      OpDecorate %24 DescriptorSet 24 
					                                                      OpDecorate %24 Binding 24 
					                                                      OpDecorate %29 RelaxedPrecision 
					                                                      OpDecorate %30 RelaxedPrecision 
					                                                      OpDecorate %31 RelaxedPrecision 
					                                                      OpDecorate %32 RelaxedPrecision 
					                                                      OpDecorate %33 Location 33 
					                                                      OpDecorate %36 RelaxedPrecision 
					                                                      OpDecorate %39 RelaxedPrecision 
					                                                      OpDecorate %40 RelaxedPrecision 
					                                                      OpDecorate %41 RelaxedPrecision 
					                                                      OpDecorate %42 RelaxedPrecision 
					                                                      OpDecorate %43 RelaxedPrecision 
					                                                      OpDecorate %44 Location 44 
					                                                      OpDecorate %47 RelaxedPrecision 
					                                                      OpDecorate %50 RelaxedPrecision 
					                                                      OpDecorate %51 RelaxedPrecision 
					                                                      OpDecorate %52 RelaxedPrecision 
					                                                      OpDecorate %53 RelaxedPrecision 
					                                                      OpDecorate %54 RelaxedPrecision 
					                                                      OpDecorate %55 Location 55 
					                                                      OpDecorate %58 RelaxedPrecision 
					                                                      OpDecorate %61 RelaxedPrecision 
					                                                      OpDecorate %62 RelaxedPrecision 
					                                                      OpDecorate %63 RelaxedPrecision 
					                                                      OpDecorate %64 RelaxedPrecision 
					                                                      OpDecorate %66 RelaxedPrecision 
					                                                      OpDecorate %66 Location 66 
					                                                      OpDecorate %67 RelaxedPrecision 
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
					                                              %15 = OpTypeVector %6 2 
					                                              %16 = OpTypePointer Input %15 
					                                 Input f32_2* %17 = OpVariable Input 
					                               Private f32_4* %20 = OpVariable Private 
					                                              %22 = OpTypeStruct %7 %7 %7 %7 
					                                              %23 = OpTypePointer Uniform %22 
					Uniform struct {f32_4; f32_4; f32_4; f32_4;}* %24 = OpVariable Uniform 
					                                              %25 = OpTypeInt 32 1 
					                                          i32 %26 = OpConstant 1 
					                                              %27 = OpTypePointer Uniform %7 
					                               Private f32_4* %31 = OpVariable Private 
					                                 Input f32_2* %33 = OpVariable Input 
					                                          i32 %37 = OpConstant 0 
					                                 Input f32_2* %44 = OpVariable Input 
					                                          i32 %48 = OpConstant 2 
					                                 Input f32_2* %55 = OpVariable Input 
					                                          i32 %59 = OpConstant 3 
					                                              %65 = OpTypePointer Output %7 
					                                Output f32_4* %66 = OpVariable Output 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                   read_only Texture2DSampled %14 = OpLoad %13 
					                                        f32_2 %18 = OpLoad %17 
					                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                      OpStore %9 %19 
					                                        f32_4 %21 = OpLoad %9 
					                               Uniform f32_4* %28 = OpAccessChain %24 %26 
					                                        f32_4 %29 = OpLoad %28 
					                                        f32_4 %30 = OpFMul %21 %29 
					                                                      OpStore %20 %30 
					                   read_only Texture2DSampled %32 = OpLoad %13 
					                                        f32_2 %34 = OpLoad %33 
					                                        f32_4 %35 = OpImageSampleImplicitLod %32 %34 
					                                                      OpStore %31 %35 
					                                        f32_4 %36 = OpLoad %31 
					                               Uniform f32_4* %38 = OpAccessChain %24 %37 
					                                        f32_4 %39 = OpLoad %38 
					                                        f32_4 %40 = OpFMul %36 %39 
					                                        f32_4 %41 = OpLoad %20 
					                                        f32_4 %42 = OpFAdd %40 %41 
					                                                      OpStore %20 %42 
					                   read_only Texture2DSampled %43 = OpLoad %13 
					                                        f32_2 %45 = OpLoad %44 
					                                        f32_4 %46 = OpImageSampleImplicitLod %43 %45 
					                                                      OpStore %31 %46 
					                                        f32_4 %47 = OpLoad %31 
					                               Uniform f32_4* %49 = OpAccessChain %24 %48 
					                                        f32_4 %50 = OpLoad %49 
					                                        f32_4 %51 = OpFMul %47 %50 
					                                        f32_4 %52 = OpLoad %20 
					                                        f32_4 %53 = OpFAdd %51 %52 
					                                                      OpStore %20 %53 
					                   read_only Texture2DSampled %54 = OpLoad %13 
					                                        f32_2 %56 = OpLoad %55 
					                                        f32_4 %57 = OpImageSampleImplicitLod %54 %56 
					                                                      OpStore %31 %57 
					                                        f32_4 %58 = OpLoad %31 
					                               Uniform f32_4* %60 = OpAccessChain %24 %59 
					                                        f32_4 %61 = OpLoad %60 
					                                        f32_4 %62 = OpFMul %58 %61 
					                                        f32_4 %63 = OpLoad %20 
					                                        f32_4 %64 = OpFAdd %62 %63 
					                                                      OpStore %20 %64 
					                                        f32_4 %67 = OpLoad %20 
					                                                      OpStore %66 %67 
					                                                      OpReturn
					                                                      OpFunctionEnd
"
				}
				SubProgram "vulkan hw_tier01 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 126
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Vertex %4 "main" %11 %72 %85 %108 %111 %114 %117 
					                                              OpDecorate %11 Location 11 
					                                              OpDecorate %16 ArrayStride 16 
					                                              OpDecorate %17 ArrayStride 17 
					                                              OpMemberDecorate %18 0 Offset 18 
					                                              OpMemberDecorate %18 1 Offset 18 
					                                              OpDecorate %18 Block 
					                                              OpDecorate %20 DescriptorSet 20 
					                                              OpDecorate %20 Binding 20 
					                                              OpMemberDecorate %70 0 BuiltIn 70 
					                                              OpMemberDecorate %70 1 BuiltIn 70 
					                                              OpMemberDecorate %70 2 BuiltIn 70 
					                                              OpDecorate %70 Block 
					                                              OpDecorate %82 RelaxedPrecision 
					                                              OpDecorate %85 RelaxedPrecision 
					                                              OpDecorate %85 Location 85 
					                                              OpDecorate %86 RelaxedPrecision 
					                                              OpDecorate %87 RelaxedPrecision 
					                                              OpDecorate %90 RelaxedPrecision 
					                                              OpDecorate %91 RelaxedPrecision 
					                                              OpDecorate %92 RelaxedPrecision 
					                                              OpDecorate %93 RelaxedPrecision 
					                                              OpDecorate %97 RelaxedPrecision 
					                                              OpDecorate %100 RelaxedPrecision 
					                                              OpDecorate %101 RelaxedPrecision 
					                                              OpDecorate %105 RelaxedPrecision 
					                                              OpDecorate %106 RelaxedPrecision 
					                                              OpDecorate %108 Location 108 
					                                              OpDecorate %109 RelaxedPrecision 
					                                              OpDecorate %110 RelaxedPrecision 
					                                              OpDecorate %111 Location 111 
					                                              OpDecorate %112 RelaxedPrecision 
					                                              OpDecorate %113 RelaxedPrecision 
					                                              OpDecorate %114 Location 114 
					                                              OpDecorate %115 RelaxedPrecision 
					                                              OpDecorate %116 RelaxedPrecision 
					                                              OpDecorate %117 Location 117 
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
					                                      %18 = OpTypeStruct %16 %17 
					                                      %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
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
					                       Private f32_4* %82 = OpVariable Private 
					                                      %83 = OpTypeVector %6 2 
					                                      %84 = OpTypePointer Input %83 
					                         Input f32_2* %85 = OpVariable Input 
					                                  f32 %88 = OpConstant 3.674022E-40 
					                                f32_4 %89 = OpConstantComposite %88 %88 %88 %88 
					                       Private f32_4* %91 = OpVariable Private 
					                                  f32 %94 = OpConstant 3.674022E-40 
					                                  f32 %95 = OpConstant 3.674022E-40 
					                                f32_4 %96 = OpConstantComposite %94 %94 %95 %95 
					                                  f32 %98 = OpConstant 3.674022E-40 
					                                f32_4 %99 = OpConstantComposite %98 %98 %98 %98 
					                                 f32 %102 = OpConstant 3.674022E-40 
					                                 f32 %103 = OpConstant 3.674022E-40 
					                               f32_4 %104 = OpConstantComposite %102 %102 %103 %103 
					                                     %107 = OpTypePointer Output %83 
					                       Output f32_2* %108 = OpVariable Output 
					                       Output f32_2* %111 = OpVariable Output 
					                       Output f32_2* %114 = OpVariable Output 
					                       Output f32_2* %117 = OpVariable Output 
					                                     %120 = OpTypePointer Output %6 
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
					                                f32_2 %86 = OpLoad %85 
					                                f32_4 %87 = OpVectorShuffle %86 %86 0 1 0 1 
					                                f32_4 %90 = OpFAdd %87 %89 
					                                              OpStore %82 %90 
					                                f32_4 %92 = OpLoad %82 
					                                f32_4 %93 = OpVectorShuffle %92 %92 2 3 2 3 
					                                f32_4 %97 = OpFMul %93 %96 
					                               f32_4 %100 = OpFAdd %97 %99 
					                                              OpStore %91 %100 
					                               f32_4 %101 = OpLoad %82 
					                               f32_4 %105 = OpFMul %101 %104 
					                               f32_4 %106 = OpFAdd %105 %99 
					                                              OpStore %82 %106 
					                               f32_4 %109 = OpLoad %91 
					                               f32_2 %110 = OpVectorShuffle %109 %109 0 1 
					                                              OpStore %108 %110 
					                               f32_4 %112 = OpLoad %91 
					                               f32_2 %113 = OpVectorShuffle %112 %112 2 3 
					                                              OpStore %111 %113 
					                               f32_4 %115 = OpLoad %82 
					                               f32_2 %116 = OpVectorShuffle %115 %115 0 1 
					                                              OpStore %114 %116 
					                               f32_4 %118 = OpLoad %82 
					                               f32_2 %119 = OpVectorShuffle %118 %118 2 3 
					                                              OpStore %117 %119 
					                         Output f32* %121 = OpAccessChain %72 %22 %68 
					                                 f32 %122 = OpLoad %121 
					                                 f32 %123 = OpFNegate %122 
					                         Output f32* %124 = OpAccessChain %72 %22 %68 
					                                              OpStore %124 %123 
					                                              OpReturn
					                                              OpFunctionEnd

					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 69
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %17 %33 %44 %55 %66 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpDecorate %9 RelaxedPrecision 
					                                                      OpDecorate %13 RelaxedPrecision 
					                                                      OpDecorate %13 DescriptorSet 13 
					                                                      OpDecorate %13 Binding 13 
					                                                      OpDecorate %14 RelaxedPrecision 
					                                                      OpDecorate %17 Location 17 
					                                                      OpDecorate %20 RelaxedPrecision 
					                                                      OpDecorate %21 RelaxedPrecision 
					                                                      OpMemberDecorate %22 0 RelaxedPrecision 
					                                                      OpMemberDecorate %22 0 Offset 22 
					                                                      OpMemberDecorate %22 1 RelaxedPrecision 
					                                                      OpMemberDecorate %22 1 Offset 22 
					                                                      OpMemberDecorate %22 2 RelaxedPrecision 
					                                                      OpMemberDecorate %22 2 Offset 22 
					                                                      OpMemberDecorate %22 3 RelaxedPrecision 
					                                                      OpMemberDecorate %22 3 Offset 22 
					                                                      OpDecorate %22 Block 
					                                                      OpDecorate %24 DescriptorSet 24 
					                                                      OpDecorate %24 Binding 24 
					                                                      OpDecorate %29 RelaxedPrecision 
					                                                      OpDecorate %30 RelaxedPrecision 
					                                                      OpDecorate %31 RelaxedPrecision 
					                                                      OpDecorate %32 RelaxedPrecision 
					                                                      OpDecorate %33 Location 33 
					                                                      OpDecorate %36 RelaxedPrecision 
					                                                      OpDecorate %39 RelaxedPrecision 
					                                                      OpDecorate %40 RelaxedPrecision 
					                                                      OpDecorate %41 RelaxedPrecision 
					                                                      OpDecorate %42 RelaxedPrecision 
					                                                      OpDecorate %43 RelaxedPrecision 
					                                                      OpDecorate %44 Location 44 
					                                                      OpDecorate %47 RelaxedPrecision 
					                                                      OpDecorate %50 RelaxedPrecision 
					                                                      OpDecorate %51 RelaxedPrecision 
					                                                      OpDecorate %52 RelaxedPrecision 
					                                                      OpDecorate %53 RelaxedPrecision 
					                                                      OpDecorate %54 RelaxedPrecision 
					                                                      OpDecorate %55 Location 55 
					                                                      OpDecorate %58 RelaxedPrecision 
					                                                      OpDecorate %61 RelaxedPrecision 
					                                                      OpDecorate %62 RelaxedPrecision 
					                                                      OpDecorate %63 RelaxedPrecision 
					                                                      OpDecorate %64 RelaxedPrecision 
					                                                      OpDecorate %66 RelaxedPrecision 
					                                                      OpDecorate %66 Location 66 
					                                                      OpDecorate %67 RelaxedPrecision 
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
					                                              %15 = OpTypeVector %6 2 
					                                              %16 = OpTypePointer Input %15 
					                                 Input f32_2* %17 = OpVariable Input 
					                               Private f32_4* %20 = OpVariable Private 
					                                              %22 = OpTypeStruct %7 %7 %7 %7 
					                                              %23 = OpTypePointer Uniform %22 
					Uniform struct {f32_4; f32_4; f32_4; f32_4;}* %24 = OpVariable Uniform 
					                                              %25 = OpTypeInt 32 1 
					                                          i32 %26 = OpConstant 1 
					                                              %27 = OpTypePointer Uniform %7 
					                               Private f32_4* %31 = OpVariable Private 
					                                 Input f32_2* %33 = OpVariable Input 
					                                          i32 %37 = OpConstant 0 
					                                 Input f32_2* %44 = OpVariable Input 
					                                          i32 %48 = OpConstant 2 
					                                 Input f32_2* %55 = OpVariable Input 
					                                          i32 %59 = OpConstant 3 
					                                              %65 = OpTypePointer Output %7 
					                                Output f32_4* %66 = OpVariable Output 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                   read_only Texture2DSampled %14 = OpLoad %13 
					                                        f32_2 %18 = OpLoad %17 
					                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                      OpStore %9 %19 
					                                        f32_4 %21 = OpLoad %9 
					                               Uniform f32_4* %28 = OpAccessChain %24 %26 
					                                        f32_4 %29 = OpLoad %28 
					                                        f32_4 %30 = OpFMul %21 %29 
					                                                      OpStore %20 %30 
					                   read_only Texture2DSampled %32 = OpLoad %13 
					                                        f32_2 %34 = OpLoad %33 
					                                        f32_4 %35 = OpImageSampleImplicitLod %32 %34 
					                                                      OpStore %31 %35 
					                                        f32_4 %36 = OpLoad %31 
					                               Uniform f32_4* %38 = OpAccessChain %24 %37 
					                                        f32_4 %39 = OpLoad %38 
					                                        f32_4 %40 = OpFMul %36 %39 
					                                        f32_4 %41 = OpLoad %20 
					                                        f32_4 %42 = OpFAdd %40 %41 
					                                                      OpStore %20 %42 
					                   read_only Texture2DSampled %43 = OpLoad %13 
					                                        f32_2 %45 = OpLoad %44 
					                                        f32_4 %46 = OpImageSampleImplicitLod %43 %45 
					                                                      OpStore %31 %46 
					                                        f32_4 %47 = OpLoad %31 
					                               Uniform f32_4* %49 = OpAccessChain %24 %48 
					                                        f32_4 %50 = OpLoad %49 
					                                        f32_4 %51 = OpFMul %47 %50 
					                                        f32_4 %52 = OpLoad %20 
					                                        f32_4 %53 = OpFAdd %51 %52 
					                                                      OpStore %20 %53 
					                   read_only Texture2DSampled %54 = OpLoad %13 
					                                        f32_2 %56 = OpLoad %55 
					                                        f32_4 %57 = OpImageSampleImplicitLod %54 %56 
					                                                      OpStore %31 %57 
					                                        f32_4 %58 = OpLoad %31 
					                               Uniform f32_4* %60 = OpAccessChain %24 %59 
					                                        f32_4 %61 = OpLoad %60 
					                                        f32_4 %62 = OpFMul %58 %61 
					                                        f32_4 %63 = OpLoad %20 
					                                        f32_4 %64 = OpFAdd %62 %63 
					                                                      OpStore %20 %64 
					                                        f32_4 %67 = OpLoad %20 
					                                                      OpStore %66 %67 
					                                                      OpReturn
					                                                      OpFunctionEnd
"
				}
				SubProgram "vulkan hw_tier02 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 126
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Vertex %4 "main" %11 %72 %85 %108 %111 %114 %117 
					                                              OpDecorate %11 Location 11 
					                                              OpDecorate %16 ArrayStride 16 
					                                              OpDecorate %17 ArrayStride 17 
					                                              OpMemberDecorate %18 0 Offset 18 
					                                              OpMemberDecorate %18 1 Offset 18 
					                                              OpDecorate %18 Block 
					                                              OpDecorate %20 DescriptorSet 20 
					                                              OpDecorate %20 Binding 20 
					                                              OpMemberDecorate %70 0 BuiltIn 70 
					                                              OpMemberDecorate %70 1 BuiltIn 70 
					                                              OpMemberDecorate %70 2 BuiltIn 70 
					                                              OpDecorate %70 Block 
					                                              OpDecorate %82 RelaxedPrecision 
					                                              OpDecorate %85 RelaxedPrecision 
					                                              OpDecorate %85 Location 85 
					                                              OpDecorate %86 RelaxedPrecision 
					                                              OpDecorate %87 RelaxedPrecision 
					                                              OpDecorate %90 RelaxedPrecision 
					                                              OpDecorate %91 RelaxedPrecision 
					                                              OpDecorate %92 RelaxedPrecision 
					                                              OpDecorate %93 RelaxedPrecision 
					                                              OpDecorate %97 RelaxedPrecision 
					                                              OpDecorate %100 RelaxedPrecision 
					                                              OpDecorate %101 RelaxedPrecision 
					                                              OpDecorate %105 RelaxedPrecision 
					                                              OpDecorate %106 RelaxedPrecision 
					                                              OpDecorate %108 Location 108 
					                                              OpDecorate %109 RelaxedPrecision 
					                                              OpDecorate %110 RelaxedPrecision 
					                                              OpDecorate %111 Location 111 
					                                              OpDecorate %112 RelaxedPrecision 
					                                              OpDecorate %113 RelaxedPrecision 
					                                              OpDecorate %114 Location 114 
					                                              OpDecorate %115 RelaxedPrecision 
					                                              OpDecorate %116 RelaxedPrecision 
					                                              OpDecorate %117 Location 117 
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
					                                      %18 = OpTypeStruct %16 %17 
					                                      %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
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
					                       Private f32_4* %82 = OpVariable Private 
					                                      %83 = OpTypeVector %6 2 
					                                      %84 = OpTypePointer Input %83 
					                         Input f32_2* %85 = OpVariable Input 
					                                  f32 %88 = OpConstant 3.674022E-40 
					                                f32_4 %89 = OpConstantComposite %88 %88 %88 %88 
					                       Private f32_4* %91 = OpVariable Private 
					                                  f32 %94 = OpConstant 3.674022E-40 
					                                  f32 %95 = OpConstant 3.674022E-40 
					                                f32_4 %96 = OpConstantComposite %94 %94 %95 %95 
					                                  f32 %98 = OpConstant 3.674022E-40 
					                                f32_4 %99 = OpConstantComposite %98 %98 %98 %98 
					                                 f32 %102 = OpConstant 3.674022E-40 
					                                 f32 %103 = OpConstant 3.674022E-40 
					                               f32_4 %104 = OpConstantComposite %102 %102 %103 %103 
					                                     %107 = OpTypePointer Output %83 
					                       Output f32_2* %108 = OpVariable Output 
					                       Output f32_2* %111 = OpVariable Output 
					                       Output f32_2* %114 = OpVariable Output 
					                       Output f32_2* %117 = OpVariable Output 
					                                     %120 = OpTypePointer Output %6 
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
					                                f32_2 %86 = OpLoad %85 
					                                f32_4 %87 = OpVectorShuffle %86 %86 0 1 0 1 
					                                f32_4 %90 = OpFAdd %87 %89 
					                                              OpStore %82 %90 
					                                f32_4 %92 = OpLoad %82 
					                                f32_4 %93 = OpVectorShuffle %92 %92 2 3 2 3 
					                                f32_4 %97 = OpFMul %93 %96 
					                               f32_4 %100 = OpFAdd %97 %99 
					                                              OpStore %91 %100 
					                               f32_4 %101 = OpLoad %82 
					                               f32_4 %105 = OpFMul %101 %104 
					                               f32_4 %106 = OpFAdd %105 %99 
					                                              OpStore %82 %106 
					                               f32_4 %109 = OpLoad %91 
					                               f32_2 %110 = OpVectorShuffle %109 %109 0 1 
					                                              OpStore %108 %110 
					                               f32_4 %112 = OpLoad %91 
					                               f32_2 %113 = OpVectorShuffle %112 %112 2 3 
					                                              OpStore %111 %113 
					                               f32_4 %115 = OpLoad %82 
					                               f32_2 %116 = OpVectorShuffle %115 %115 0 1 
					                                              OpStore %114 %116 
					                               f32_4 %118 = OpLoad %82 
					                               f32_2 %119 = OpVectorShuffle %118 %118 2 3 
					                                              OpStore %117 %119 
					                         Output f32* %121 = OpAccessChain %72 %22 %68 
					                                 f32 %122 = OpLoad %121 
					                                 f32 %123 = OpFNegate %122 
					                         Output f32* %124 = OpAccessChain %72 %22 %68 
					                                              OpStore %124 %123 
					                                              OpReturn
					                                              OpFunctionEnd

					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 69
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %17 %33 %44 %55 %66 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpDecorate %9 RelaxedPrecision 
					                                                      OpDecorate %13 RelaxedPrecision 
					                                                      OpDecorate %13 DescriptorSet 13 
					                                                      OpDecorate %13 Binding 13 
					                                                      OpDecorate %14 RelaxedPrecision 
					                                                      OpDecorate %17 Location 17 
					                                                      OpDecorate %20 RelaxedPrecision 
					                                                      OpDecorate %21 RelaxedPrecision 
					                                                      OpMemberDecorate %22 0 RelaxedPrecision 
					                                                      OpMemberDecorate %22 0 Offset 22 
					                                                      OpMemberDecorate %22 1 RelaxedPrecision 
					                                                      OpMemberDecorate %22 1 Offset 22 
					                                                      OpMemberDecorate %22 2 RelaxedPrecision 
					                                                      OpMemberDecorate %22 2 Offset 22 
					                                                      OpMemberDecorate %22 3 RelaxedPrecision 
					                                                      OpMemberDecorate %22 3 Offset 22 
					                                                      OpDecorate %22 Block 
					                                                      OpDecorate %24 DescriptorSet 24 
					                                                      OpDecorate %24 Binding 24 
					                                                      OpDecorate %29 RelaxedPrecision 
					                                                      OpDecorate %30 RelaxedPrecision 
					                                                      OpDecorate %31 RelaxedPrecision 
					                                                      OpDecorate %32 RelaxedPrecision 
					                                                      OpDecorate %33 Location 33 
					                                                      OpDecorate %36 RelaxedPrecision 
					                                                      OpDecorate %39 RelaxedPrecision 
					                                                      OpDecorate %40 RelaxedPrecision 
					                                                      OpDecorate %41 RelaxedPrecision 
					                                                      OpDecorate %42 RelaxedPrecision 
					                                                      OpDecorate %43 RelaxedPrecision 
					                                                      OpDecorate %44 Location 44 
					                                                      OpDecorate %47 RelaxedPrecision 
					                                                      OpDecorate %50 RelaxedPrecision 
					                                                      OpDecorate %51 RelaxedPrecision 
					                                                      OpDecorate %52 RelaxedPrecision 
					                                                      OpDecorate %53 RelaxedPrecision 
					                                                      OpDecorate %54 RelaxedPrecision 
					                                                      OpDecorate %55 Location 55 
					                                                      OpDecorate %58 RelaxedPrecision 
					                                                      OpDecorate %61 RelaxedPrecision 
					                                                      OpDecorate %62 RelaxedPrecision 
					                                                      OpDecorate %63 RelaxedPrecision 
					                                                      OpDecorate %64 RelaxedPrecision 
					                                                      OpDecorate %66 RelaxedPrecision 
					                                                      OpDecorate %66 Location 66 
					                                                      OpDecorate %67 RelaxedPrecision 
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
					                                              %15 = OpTypeVector %6 2 
					                                              %16 = OpTypePointer Input %15 
					                                 Input f32_2* %17 = OpVariable Input 
					                               Private f32_4* %20 = OpVariable Private 
					                                              %22 = OpTypeStruct %7 %7 %7 %7 
					                                              %23 = OpTypePointer Uniform %22 
					Uniform struct {f32_4; f32_4; f32_4; f32_4;}* %24 = OpVariable Uniform 
					                                              %25 = OpTypeInt 32 1 
					                                          i32 %26 = OpConstant 1 
					                                              %27 = OpTypePointer Uniform %7 
					                               Private f32_4* %31 = OpVariable Private 
					                                 Input f32_2* %33 = OpVariable Input 
					                                          i32 %37 = OpConstant 0 
					                                 Input f32_2* %44 = OpVariable Input 
					                                          i32 %48 = OpConstant 2 
					                                 Input f32_2* %55 = OpVariable Input 
					                                          i32 %59 = OpConstant 3 
					                                              %65 = OpTypePointer Output %7 
					                                Output f32_4* %66 = OpVariable Output 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                   read_only Texture2DSampled %14 = OpLoad %13 
					                                        f32_2 %18 = OpLoad %17 
					                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                      OpStore %9 %19 
					                                        f32_4 %21 = OpLoad %9 
					                               Uniform f32_4* %28 = OpAccessChain %24 %26 
					                                        f32_4 %29 = OpLoad %28 
					                                        f32_4 %30 = OpFMul %21 %29 
					                                                      OpStore %20 %30 
					                   read_only Texture2DSampled %32 = OpLoad %13 
					                                        f32_2 %34 = OpLoad %33 
					                                        f32_4 %35 = OpImageSampleImplicitLod %32 %34 
					                                                      OpStore %31 %35 
					                                        f32_4 %36 = OpLoad %31 
					                               Uniform f32_4* %38 = OpAccessChain %24 %37 
					                                        f32_4 %39 = OpLoad %38 
					                                        f32_4 %40 = OpFMul %36 %39 
					                                        f32_4 %41 = OpLoad %20 
					                                        f32_4 %42 = OpFAdd %40 %41 
					                                                      OpStore %20 %42 
					                   read_only Texture2DSampled %43 = OpLoad %13 
					                                        f32_2 %45 = OpLoad %44 
					                                        f32_4 %46 = OpImageSampleImplicitLod %43 %45 
					                                                      OpStore %31 %46 
					                                        f32_4 %47 = OpLoad %31 
					                               Uniform f32_4* %49 = OpAccessChain %24 %48 
					                                        f32_4 %50 = OpLoad %49 
					                                        f32_4 %51 = OpFMul %47 %50 
					                                        f32_4 %52 = OpLoad %20 
					                                        f32_4 %53 = OpFAdd %51 %52 
					                                                      OpStore %20 %53 
					                   read_only Texture2DSampled %54 = OpLoad %13 
					                                        f32_2 %56 = OpLoad %55 
					                                        f32_4 %57 = OpImageSampleImplicitLod %54 %56 
					                                                      OpStore %31 %57 
					                                        f32_4 %58 = OpLoad %31 
					                               Uniform f32_4* %60 = OpAccessChain %24 %59 
					                                        f32_4 %61 = OpLoad %60 
					                                        f32_4 %62 = OpFMul %58 %61 
					                                        f32_4 %63 = OpLoad %20 
					                                        f32_4 %64 = OpFAdd %62 %63 
					                                                      OpStore %20 %64 
					                                        f32_4 %67 = OpLoad %20 
					                                                      OpStore %66 %67 
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