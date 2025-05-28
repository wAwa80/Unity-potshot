Shader "Hidden/ColorCorrectionSelective" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "" {}
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 35533
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
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform highp vec4 selColor;
					uniform highp vec4 targetColor;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 color_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  highp vec3 x_3;
					  x_3 = (tmpvar_2.xyz - selColor.xyz);
					  lowp float tmpvar_4;
					  highp float tmpvar_5;
					  tmpvar_5 = clamp ((2.0 * sqrt(
					    dot (x_3, x_3)
					  )), 0.0, 1.0);
					  tmpvar_4 = tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6 = mix (targetColor, tmpvar_2, vec4(tmpvar_4));
					  color_1 = tmpvar_6;
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
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform highp vec4 selColor;
					uniform highp vec4 targetColor;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 color_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  highp vec3 x_3;
					  x_3 = (tmpvar_2.xyz - selColor.xyz);
					  lowp float tmpvar_4;
					  highp float tmpvar_5;
					  tmpvar_5 = clamp ((2.0 * sqrt(
					    dot (x_3, x_3)
					  )), 0.0, 1.0);
					  tmpvar_4 = tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6 = mix (targetColor, tmpvar_2, vec4(tmpvar_4));
					  color_1 = tmpvar_6;
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
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform highp vec4 selColor;
					uniform highp vec4 targetColor;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 color_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  highp vec3 x_3;
					  x_3 = (tmpvar_2.xyz - selColor.xyz);
					  lowp float tmpvar_4;
					  highp float tmpvar_5;
					  tmpvar_5 = clamp ((2.0 * sqrt(
					    dot (x_3, x_3)
					  )), 0.0, 1.0);
					  tmpvar_4 = tmpvar_5;
					  highp vec4 tmpvar_6;
					  tmpvar_6 = mix (targetColor, tmpvar_2, vec4(tmpvar_4));
					  color_1 = tmpvar_6;
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
					uniform 	vec4 selColor;
					uniform 	vec4 targetColor;
					uniform lowp sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec3 u_xlat1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat10_0.xyz + (-selColor.xyz);
					    u_xlat0 = u_xlat10_0 + (-targetColor);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x + u_xlat1.x;
					    u_xlat1.x = min(u_xlat1.x, 1.0);
					    u_xlat0 = u_xlat1.xxxx * u_xlat0 + targetColor;
					    SV_Target0 = u_xlat0;
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
					uniform 	vec4 selColor;
					uniform 	vec4 targetColor;
					uniform lowp sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec3 u_xlat1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat10_0.xyz + (-selColor.xyz);
					    u_xlat0 = u_xlat10_0 + (-targetColor);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x + u_xlat1.x;
					    u_xlat1.x = min(u_xlat1.x, 1.0);
					    u_xlat0 = u_xlat1.xxxx * u_xlat0 + targetColor;
					    SV_Target0 = u_xlat0;
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
					uniform 	vec4 selColor;
					uniform 	vec4 targetColor;
					uniform lowp sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec4 u_xlat10_0;
					vec3 u_xlat1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat10_0.xyz + (-selColor.xyz);
					    u_xlat0 = u_xlat10_0 + (-targetColor);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x + u_xlat1.x;
					    u_xlat1.x = min(u_xlat1.x, 1.0);
					    u_xlat0 = u_xlat1.xxxx * u_xlat0 + targetColor;
					    SV_Target0 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan hw_tier00 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 94
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
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
					                                              OpDecorate %84 Location 84 
					                                              OpDecorate %86 RelaxedPrecision 
					                                              OpDecorate %86 Location 86 
					                                              OpDecorate %87 RelaxedPrecision 
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
					                                      %82 = OpTypeVector %6 2 
					                                      %83 = OpTypePointer Output %82 
					                        Output f32_2* %84 = OpVariable Output 
					                                      %85 = OpTypePointer Input %82 
					                         Input f32_2* %86 = OpVariable Input 
					                                      %88 = OpTypePointer Output %6 
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
					                          Output f32* %89 = OpAccessChain %72 %22 %68 
					                                  f32 %90 = OpLoad %89 
					                                  f32 %91 = OpFNegate %90 
					                          Output f32* %92 = OpAccessChain %72 %22 %68 
					                                              OpStore %92 %91 
					                                              OpReturn
					                                              OpFunctionEnd

					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 76
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %73 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %23 RelaxedPrecision 
					                                                    OpDecorate %24 RelaxedPrecision 
					                                                    OpMemberDecorate %25 0 Offset 25 
					                                                    OpMemberDecorate %25 1 Offset 25 
					                                                    OpDecorate %25 Block 
					                                                    OpDecorate %27 DescriptorSet 27 
					                                                    OpDecorate %27 Binding 27 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %73 RelaxedPrecision 
					                                                    OpDecorate %73 Location 73 
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
					                                            %20 = OpTypeVector %6 3 
					                                            %21 = OpTypePointer Private %20 
					                             Private f32_3* %22 = OpVariable Private 
					                                            %25 = OpTypeStruct %7 %7 
					                                            %26 = OpTypePointer Uniform %25 
					            Uniform struct {f32_4; f32_4;}* %27 = OpVariable Uniform 
					                                            %28 = OpTypeInt 32 1 
					                                        i32 %29 = OpConstant 0 
					                                            %30 = OpTypePointer Uniform %7 
					                             Private f32_4* %36 = OpVariable Private 
					                                        i32 %38 = OpConstant 1 
					                                            %46 = OpTypeInt 32 0 
					                                        u32 %47 = OpConstant 0 
					                                            %48 = OpTypePointer Private %6 
					                                        f32 %62 = OpConstant 3.674022E-40 
					                                            %72 = OpTypePointer Output %7 
					                              Output f32_4* %73 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                                      f32_4 %23 = OpLoad %9 
					                                      f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
					                             Uniform f32_4* %31 = OpAccessChain %27 %29 
					                                      f32_4 %32 = OpLoad %31 
					                                      f32_3 %33 = OpVectorShuffle %32 %32 0 1 2 
					                                      f32_3 %34 = OpFNegate %33 
					                                      f32_3 %35 = OpFAdd %24 %34 
					                                                    OpStore %22 %35 
					                                      f32_4 %37 = OpLoad %9 
					                             Uniform f32_4* %39 = OpAccessChain %27 %38 
					                                      f32_4 %40 = OpLoad %39 
					                                      f32_4 %41 = OpFNegate %40 
					                                      f32_4 %42 = OpFAdd %37 %41 
					                                                    OpStore %36 %42 
					                                      f32_3 %43 = OpLoad %22 
					                                      f32_3 %44 = OpLoad %22 
					                                        f32 %45 = OpDot %43 %44 
					                               Private f32* %49 = OpAccessChain %22 %47 
					                                                    OpStore %49 %45 
					                               Private f32* %50 = OpAccessChain %22 %47 
					                                        f32 %51 = OpLoad %50 
					                                        f32 %52 = OpExtInst %1 31 %51 
					                               Private f32* %53 = OpAccessChain %22 %47 
					                                                    OpStore %53 %52 
					                               Private f32* %54 = OpAccessChain %22 %47 
					                                        f32 %55 = OpLoad %54 
					                               Private f32* %56 = OpAccessChain %22 %47 
					                                        f32 %57 = OpLoad %56 
					                                        f32 %58 = OpFAdd %55 %57 
					                               Private f32* %59 = OpAccessChain %22 %47 
					                                                    OpStore %59 %58 
					                               Private f32* %60 = OpAccessChain %22 %47 
					                                        f32 %61 = OpLoad %60 
					                                        f32 %63 = OpExtInst %1 37 %61 %62 
					                               Private f32* %64 = OpAccessChain %22 %47 
					                                                    OpStore %64 %63 
					                                      f32_3 %65 = OpLoad %22 
					                                      f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
					                                      f32_4 %67 = OpLoad %36 
					                                      f32_4 %68 = OpFMul %66 %67 
					                             Uniform f32_4* %69 = OpAccessChain %27 %38 
					                                      f32_4 %70 = OpLoad %69 
					                                      f32_4 %71 = OpFAdd %68 %70 
					                                                    OpStore %36 %71 
					                                      f32_4 %74 = OpLoad %36 
					                                                    OpStore %73 %74 
					                                                    OpReturn
					                                                    OpFunctionEnd
"
				}
				SubProgram "vulkan hw_tier01 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 94
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
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
					                                              OpDecorate %84 Location 84 
					                                              OpDecorate %86 RelaxedPrecision 
					                                              OpDecorate %86 Location 86 
					                                              OpDecorate %87 RelaxedPrecision 
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
					                                      %82 = OpTypeVector %6 2 
					                                      %83 = OpTypePointer Output %82 
					                        Output f32_2* %84 = OpVariable Output 
					                                      %85 = OpTypePointer Input %82 
					                         Input f32_2* %86 = OpVariable Input 
					                                      %88 = OpTypePointer Output %6 
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
					                          Output f32* %89 = OpAccessChain %72 %22 %68 
					                                  f32 %90 = OpLoad %89 
					                                  f32 %91 = OpFNegate %90 
					                          Output f32* %92 = OpAccessChain %72 %22 %68 
					                                              OpStore %92 %91 
					                                              OpReturn
					                                              OpFunctionEnd

					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 76
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %73 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %23 RelaxedPrecision 
					                                                    OpDecorate %24 RelaxedPrecision 
					                                                    OpMemberDecorate %25 0 Offset 25 
					                                                    OpMemberDecorate %25 1 Offset 25 
					                                                    OpDecorate %25 Block 
					                                                    OpDecorate %27 DescriptorSet 27 
					                                                    OpDecorate %27 Binding 27 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %73 RelaxedPrecision 
					                                                    OpDecorate %73 Location 73 
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
					                                            %20 = OpTypeVector %6 3 
					                                            %21 = OpTypePointer Private %20 
					                             Private f32_3* %22 = OpVariable Private 
					                                            %25 = OpTypeStruct %7 %7 
					                                            %26 = OpTypePointer Uniform %25 
					            Uniform struct {f32_4; f32_4;}* %27 = OpVariable Uniform 
					                                            %28 = OpTypeInt 32 1 
					                                        i32 %29 = OpConstant 0 
					                                            %30 = OpTypePointer Uniform %7 
					                             Private f32_4* %36 = OpVariable Private 
					                                        i32 %38 = OpConstant 1 
					                                            %46 = OpTypeInt 32 0 
					                                        u32 %47 = OpConstant 0 
					                                            %48 = OpTypePointer Private %6 
					                                        f32 %62 = OpConstant 3.674022E-40 
					                                            %72 = OpTypePointer Output %7 
					                              Output f32_4* %73 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                                      f32_4 %23 = OpLoad %9 
					                                      f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
					                             Uniform f32_4* %31 = OpAccessChain %27 %29 
					                                      f32_4 %32 = OpLoad %31 
					                                      f32_3 %33 = OpVectorShuffle %32 %32 0 1 2 
					                                      f32_3 %34 = OpFNegate %33 
					                                      f32_3 %35 = OpFAdd %24 %34 
					                                                    OpStore %22 %35 
					                                      f32_4 %37 = OpLoad %9 
					                             Uniform f32_4* %39 = OpAccessChain %27 %38 
					                                      f32_4 %40 = OpLoad %39 
					                                      f32_4 %41 = OpFNegate %40 
					                                      f32_4 %42 = OpFAdd %37 %41 
					                                                    OpStore %36 %42 
					                                      f32_3 %43 = OpLoad %22 
					                                      f32_3 %44 = OpLoad %22 
					                                        f32 %45 = OpDot %43 %44 
					                               Private f32* %49 = OpAccessChain %22 %47 
					                                                    OpStore %49 %45 
					                               Private f32* %50 = OpAccessChain %22 %47 
					                                        f32 %51 = OpLoad %50 
					                                        f32 %52 = OpExtInst %1 31 %51 
					                               Private f32* %53 = OpAccessChain %22 %47 
					                                                    OpStore %53 %52 
					                               Private f32* %54 = OpAccessChain %22 %47 
					                                        f32 %55 = OpLoad %54 
					                               Private f32* %56 = OpAccessChain %22 %47 
					                                        f32 %57 = OpLoad %56 
					                                        f32 %58 = OpFAdd %55 %57 
					                               Private f32* %59 = OpAccessChain %22 %47 
					                                                    OpStore %59 %58 
					                               Private f32* %60 = OpAccessChain %22 %47 
					                                        f32 %61 = OpLoad %60 
					                                        f32 %63 = OpExtInst %1 37 %61 %62 
					                               Private f32* %64 = OpAccessChain %22 %47 
					                                                    OpStore %64 %63 
					                                      f32_3 %65 = OpLoad %22 
					                                      f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
					                                      f32_4 %67 = OpLoad %36 
					                                      f32_4 %68 = OpFMul %66 %67 
					                             Uniform f32_4* %69 = OpAccessChain %27 %38 
					                                      f32_4 %70 = OpLoad %69 
					                                      f32_4 %71 = OpFAdd %68 %70 
					                                                    OpStore %36 %71 
					                                      f32_4 %74 = OpLoad %36 
					                                                    OpStore %73 %74 
					                                                    OpReturn
					                                                    OpFunctionEnd
"
				}
				SubProgram "vulkan hw_tier02 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 94
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
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
					                                              OpDecorate %84 Location 84 
					                                              OpDecorate %86 RelaxedPrecision 
					                                              OpDecorate %86 Location 86 
					                                              OpDecorate %87 RelaxedPrecision 
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
					                                      %82 = OpTypeVector %6 2 
					                                      %83 = OpTypePointer Output %82 
					                        Output f32_2* %84 = OpVariable Output 
					                                      %85 = OpTypePointer Input %82 
					                         Input f32_2* %86 = OpVariable Input 
					                                      %88 = OpTypePointer Output %6 
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
					                          Output f32* %89 = OpAccessChain %72 %22 %68 
					                                  f32 %90 = OpLoad %89 
					                                  f32 %91 = OpFNegate %90 
					                          Output f32* %92 = OpAccessChain %72 %22 %68 
					                                              OpStore %92 %91 
					                                              OpReturn
					                                              OpFunctionEnd

					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 76
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %73 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %23 RelaxedPrecision 
					                                                    OpDecorate %24 RelaxedPrecision 
					                                                    OpMemberDecorate %25 0 Offset 25 
					                                                    OpMemberDecorate %25 1 Offset 25 
					                                                    OpDecorate %25 Block 
					                                                    OpDecorate %27 DescriptorSet 27 
					                                                    OpDecorate %27 Binding 27 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %73 RelaxedPrecision 
					                                                    OpDecorate %73 Location 73 
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
					                                            %20 = OpTypeVector %6 3 
					                                            %21 = OpTypePointer Private %20 
					                             Private f32_3* %22 = OpVariable Private 
					                                            %25 = OpTypeStruct %7 %7 
					                                            %26 = OpTypePointer Uniform %25 
					            Uniform struct {f32_4; f32_4;}* %27 = OpVariable Uniform 
					                                            %28 = OpTypeInt 32 1 
					                                        i32 %29 = OpConstant 0 
					                                            %30 = OpTypePointer Uniform %7 
					                             Private f32_4* %36 = OpVariable Private 
					                                        i32 %38 = OpConstant 1 
					                                            %46 = OpTypeInt 32 0 
					                                        u32 %47 = OpConstant 0 
					                                            %48 = OpTypePointer Private %6 
					                                        f32 %62 = OpConstant 3.674022E-40 
					                                            %72 = OpTypePointer Output %7 
					                              Output f32_4* %73 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                                      f32_4 %23 = OpLoad %9 
					                                      f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
					                             Uniform f32_4* %31 = OpAccessChain %27 %29 
					                                      f32_4 %32 = OpLoad %31 
					                                      f32_3 %33 = OpVectorShuffle %32 %32 0 1 2 
					                                      f32_3 %34 = OpFNegate %33 
					                                      f32_3 %35 = OpFAdd %24 %34 
					                                                    OpStore %22 %35 
					                                      f32_4 %37 = OpLoad %9 
					                             Uniform f32_4* %39 = OpAccessChain %27 %38 
					                                      f32_4 %40 = OpLoad %39 
					                                      f32_4 %41 = OpFNegate %40 
					                                      f32_4 %42 = OpFAdd %37 %41 
					                                                    OpStore %36 %42 
					                                      f32_3 %43 = OpLoad %22 
					                                      f32_3 %44 = OpLoad %22 
					                                        f32 %45 = OpDot %43 %44 
					                               Private f32* %49 = OpAccessChain %22 %47 
					                                                    OpStore %49 %45 
					                               Private f32* %50 = OpAccessChain %22 %47 
					                                        f32 %51 = OpLoad %50 
					                                        f32 %52 = OpExtInst %1 31 %51 
					                               Private f32* %53 = OpAccessChain %22 %47 
					                                                    OpStore %53 %52 
					                               Private f32* %54 = OpAccessChain %22 %47 
					                                        f32 %55 = OpLoad %54 
					                               Private f32* %56 = OpAccessChain %22 %47 
					                                        f32 %57 = OpLoad %56 
					                                        f32 %58 = OpFAdd %55 %57 
					                               Private f32* %59 = OpAccessChain %22 %47 
					                                                    OpStore %59 %58 
					                               Private f32* %60 = OpAccessChain %22 %47 
					                                        f32 %61 = OpLoad %60 
					                                        f32 %63 = OpExtInst %1 37 %61 %62 
					                               Private f32* %64 = OpAccessChain %22 %47 
					                                                    OpStore %64 %63 
					                                      f32_3 %65 = OpLoad %22 
					                                      f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
					                                      f32_4 %67 = OpLoad %36 
					                                      f32_4 %68 = OpFMul %66 %67 
					                             Uniform f32_4* %69 = OpAccessChain %27 %38 
					                                      f32_4 %70 = OpLoad %69 
					                                      f32_4 %71 = OpFAdd %68 %70 
					                                                    OpStore %36 %71 
					                                      f32_4 %74 = OpLoad %36 
					                                                    OpStore %73 %74 
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