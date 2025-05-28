Shader "Hidden/BlurAndFlares" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "" {}
		_NonBlurredTex ("Base (RGB)", 2D) = "" {}
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 6766
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					varying mediump vec2 xlv_TEXCOORD0;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 color_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  color_1 = tmpvar_2;
					  gl_FragData[0] = (color_1 / (1.5 + dot (color_1.xyz, vec3(0.22, 0.707, 0.071))));
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
					varying mediump vec2 xlv_TEXCOORD0;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 color_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  color_1 = tmpvar_2;
					  gl_FragData[0] = (color_1 / (1.5 + dot (color_1.xyz, vec3(0.22, 0.707, 0.071))));
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
					varying mediump vec2 xlv_TEXCOORD0;
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
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 color_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  color_1 = tmpvar_2;
					  gl_FragData[0] = (color_1 / (1.5 + dot (color_1.xyz, vec3(0.22, 0.707, 0.071))));
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
					out mediump vec2 vs_TEXCOORD0;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					lowp vec4 u_xlat10_0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_1 = u_xlat16_1 + 1.5;
					    SV_Target0 = u_xlat10_0 / vec4(u_xlat16_1);
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
					out mediump vec2 vs_TEXCOORD0;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					lowp vec4 u_xlat10_0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_1 = u_xlat16_1 + 1.5;
					    SV_Target0 = u_xlat10_0 / vec4(u_xlat16_1);
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
					out mediump vec2 vs_TEXCOORD0;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					lowp vec4 u_xlat10_0;
					mediump float u_xlat16_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_1 = u_xlat16_1 + 1.5;
					    SV_Target0 = u_xlat10_0 / vec4(u_xlat16_1);
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan hw_tier00 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 95
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Vertex %4 "main" %11 %79 %85 %87 
					                                              OpDecorate %11 Location 11 
					                                              OpDecorate %16 ArrayStride 16 
					                                              OpDecorate %17 ArrayStride 17 
					                                              OpMemberDecorate %18 0 Offset 18 
					                                              OpMemberDecorate %18 1 Offset 18 
					                                              OpDecorate %18 Block 
					                                              OpDecorate %20 DescriptorSet 20 
					                                              OpDecorate %20 Binding 20 
					                                              OpMemberDecorate %77 0 BuiltIn 77 
					                                              OpMemberDecorate %77 1 BuiltIn 77 
					                                              OpMemberDecorate %77 2 BuiltIn 77 
					                                              OpDecorate %77 Block 
					                                              OpDecorate %85 RelaxedPrecision 
					                                              OpDecorate %85 Location 85 
					                                              OpDecorate %87 RelaxedPrecision 
					                                              OpDecorate %87 Location 87 
					                                              OpDecorate %88 RelaxedPrecision 
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
					                                  u32 %75 = OpConstant 1 
					                                      %76 = OpTypeArray %6 %75 
					                                      %77 = OpTypeStruct %7 %6 %76 
					                                      %78 = OpTypePointer Output %77 
					 Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
					                                      %81 = OpTypePointer Output %7 
					                                      %83 = OpTypeVector %6 2 
					                                      %84 = OpTypePointer Output %83 
					                        Output f32_2* %85 = OpVariable Output 
					                                      %86 = OpTypePointer Input %83 
					                         Input f32_2* %87 = OpVariable Input 
					                                      %89 = OpTypePointer Output %6 
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
					                       Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
					                                f32_4 %69 = OpLoad %68 
					                                f32_4 %70 = OpLoad %9 
					                                f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
					                                f32_4 %72 = OpFMul %69 %71 
					                                f32_4 %73 = OpLoad %48 
					                                f32_4 %74 = OpFAdd %72 %73 
					                                              OpStore %9 %74 
					                                f32_4 %80 = OpLoad %9 
					                        Output f32_4* %82 = OpAccessChain %79 %22 
					                                              OpStore %82 %80 
					                                f32_2 %88 = OpLoad %87 
					                                              OpStore %85 %88 
					                          Output f32* %90 = OpAccessChain %79 %22 %75 
					                                  f32 %91 = OpLoad %90 
					                                  f32 %92 = OpFNegate %91 
					                          Output f32* %93 = OpAccessChain %79 %22 %75 
					                                              OpStore %93 %92 
					                                              OpReturn
					                                              OpFunctionEnd

					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 40
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %34 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %18 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %23 RelaxedPrecision 
					                                                    OpDecorate %24 RelaxedPrecision 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %30 RelaxedPrecision 
					                                                    OpDecorate %32 RelaxedPrecision 
					                                                    OpDecorate %34 RelaxedPrecision 
					                                                    OpDecorate %34 Location 34 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %38 RelaxedPrecision 
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
					                                            %20 = OpTypePointer Private %6 
					                               Private f32* %21 = OpVariable Private 
					                                            %22 = OpTypeVector %6 3 
					                                        f32 %25 = OpConstant 3.674022E-40 
					                                        f32 %26 = OpConstant 3.674022E-40 
					                                        f32 %27 = OpConstant 3.674022E-40 
					                                      f32_3 %28 = OpConstantComposite %25 %26 %27 
					                                        f32 %31 = OpConstant 3.674022E-40 
					                                            %33 = OpTypePointer Output %7 
					                              Output f32_4* %34 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                                      f32_4 %23 = OpLoad %9 
					                                      f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
					                                        f32 %29 = OpDot %24 %28 
					                                                    OpStore %21 %29 
					                                        f32 %30 = OpLoad %21 
					                                        f32 %32 = OpFAdd %30 %31 
					                                                    OpStore %21 %32 
					                                      f32_4 %35 = OpLoad %9 
					                                        f32 %36 = OpLoad %21 
					                                      f32_4 %37 = OpCompositeConstruct %36 %36 %36 %36 
					                                      f32_4 %38 = OpFDiv %35 %37 
					                                                    OpStore %34 %38 
					                                                    OpReturn
					                                                    OpFunctionEnd
"
				}
				SubProgram "vulkan hw_tier01 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 95
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Vertex %4 "main" %11 %79 %85 %87 
					                                              OpDecorate %11 Location 11 
					                                              OpDecorate %16 ArrayStride 16 
					                                              OpDecorate %17 ArrayStride 17 
					                                              OpMemberDecorate %18 0 Offset 18 
					                                              OpMemberDecorate %18 1 Offset 18 
					                                              OpDecorate %18 Block 
					                                              OpDecorate %20 DescriptorSet 20 
					                                              OpDecorate %20 Binding 20 
					                                              OpMemberDecorate %77 0 BuiltIn 77 
					                                              OpMemberDecorate %77 1 BuiltIn 77 
					                                              OpMemberDecorate %77 2 BuiltIn 77 
					                                              OpDecorate %77 Block 
					                                              OpDecorate %85 RelaxedPrecision 
					                                              OpDecorate %85 Location 85 
					                                              OpDecorate %87 RelaxedPrecision 
					                                              OpDecorate %87 Location 87 
					                                              OpDecorate %88 RelaxedPrecision 
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
					                                  u32 %75 = OpConstant 1 
					                                      %76 = OpTypeArray %6 %75 
					                                      %77 = OpTypeStruct %7 %6 %76 
					                                      %78 = OpTypePointer Output %77 
					 Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
					                                      %81 = OpTypePointer Output %7 
					                                      %83 = OpTypeVector %6 2 
					                                      %84 = OpTypePointer Output %83 
					                        Output f32_2* %85 = OpVariable Output 
					                                      %86 = OpTypePointer Input %83 
					                         Input f32_2* %87 = OpVariable Input 
					                                      %89 = OpTypePointer Output %6 
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
					                       Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
					                                f32_4 %69 = OpLoad %68 
					                                f32_4 %70 = OpLoad %9 
					                                f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
					                                f32_4 %72 = OpFMul %69 %71 
					                                f32_4 %73 = OpLoad %48 
					                                f32_4 %74 = OpFAdd %72 %73 
					                                              OpStore %9 %74 
					                                f32_4 %80 = OpLoad %9 
					                        Output f32_4* %82 = OpAccessChain %79 %22 
					                                              OpStore %82 %80 
					                                f32_2 %88 = OpLoad %87 
					                                              OpStore %85 %88 
					                          Output f32* %90 = OpAccessChain %79 %22 %75 
					                                  f32 %91 = OpLoad %90 
					                                  f32 %92 = OpFNegate %91 
					                          Output f32* %93 = OpAccessChain %79 %22 %75 
					                                              OpStore %93 %92 
					                                              OpReturn
					                                              OpFunctionEnd

					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 40
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %34 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %18 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %23 RelaxedPrecision 
					                                                    OpDecorate %24 RelaxedPrecision 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %30 RelaxedPrecision 
					                                                    OpDecorate %32 RelaxedPrecision 
					                                                    OpDecorate %34 RelaxedPrecision 
					                                                    OpDecorate %34 Location 34 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %38 RelaxedPrecision 
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
					                                            %20 = OpTypePointer Private %6 
					                               Private f32* %21 = OpVariable Private 
					                                            %22 = OpTypeVector %6 3 
					                                        f32 %25 = OpConstant 3.674022E-40 
					                                        f32 %26 = OpConstant 3.674022E-40 
					                                        f32 %27 = OpConstant 3.674022E-40 
					                                      f32_3 %28 = OpConstantComposite %25 %26 %27 
					                                        f32 %31 = OpConstant 3.674022E-40 
					                                            %33 = OpTypePointer Output %7 
					                              Output f32_4* %34 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                                      f32_4 %23 = OpLoad %9 
					                                      f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
					                                        f32 %29 = OpDot %24 %28 
					                                                    OpStore %21 %29 
					                                        f32 %30 = OpLoad %21 
					                                        f32 %32 = OpFAdd %30 %31 
					                                                    OpStore %21 %32 
					                                      f32_4 %35 = OpLoad %9 
					                                        f32 %36 = OpLoad %21 
					                                      f32_4 %37 = OpCompositeConstruct %36 %36 %36 %36 
					                                      f32_4 %38 = OpFDiv %35 %37 
					                                                    OpStore %34 %38 
					                                                    OpReturn
					                                                    OpFunctionEnd
"
				}
				SubProgram "vulkan hw_tier02 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 95
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Vertex %4 "main" %11 %79 %85 %87 
					                                              OpDecorate %11 Location 11 
					                                              OpDecorate %16 ArrayStride 16 
					                                              OpDecorate %17 ArrayStride 17 
					                                              OpMemberDecorate %18 0 Offset 18 
					                                              OpMemberDecorate %18 1 Offset 18 
					                                              OpDecorate %18 Block 
					                                              OpDecorate %20 DescriptorSet 20 
					                                              OpDecorate %20 Binding 20 
					                                              OpMemberDecorate %77 0 BuiltIn 77 
					                                              OpMemberDecorate %77 1 BuiltIn 77 
					                                              OpMemberDecorate %77 2 BuiltIn 77 
					                                              OpDecorate %77 Block 
					                                              OpDecorate %85 RelaxedPrecision 
					                                              OpDecorate %85 Location 85 
					                                              OpDecorate %87 RelaxedPrecision 
					                                              OpDecorate %87 Location 87 
					                                              OpDecorate %88 RelaxedPrecision 
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
					                                  u32 %75 = OpConstant 1 
					                                      %76 = OpTypeArray %6 %75 
					                                      %77 = OpTypeStruct %7 %6 %76 
					                                      %78 = OpTypePointer Output %77 
					 Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
					                                      %81 = OpTypePointer Output %7 
					                                      %83 = OpTypeVector %6 2 
					                                      %84 = OpTypePointer Output %83 
					                        Output f32_2* %85 = OpVariable Output 
					                                      %86 = OpTypePointer Input %83 
					                         Input f32_2* %87 = OpVariable Input 
					                                      %89 = OpTypePointer Output %6 
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
					                       Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
					                                f32_4 %69 = OpLoad %68 
					                                f32_4 %70 = OpLoad %9 
					                                f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
					                                f32_4 %72 = OpFMul %69 %71 
					                                f32_4 %73 = OpLoad %48 
					                                f32_4 %74 = OpFAdd %72 %73 
					                                              OpStore %9 %74 
					                                f32_4 %80 = OpLoad %9 
					                        Output f32_4* %82 = OpAccessChain %79 %22 
					                                              OpStore %82 %80 
					                                f32_2 %88 = OpLoad %87 
					                                              OpStore %85 %88 
					                          Output f32* %90 = OpAccessChain %79 %22 %75 
					                                  f32 %91 = OpLoad %90 
					                                  f32 %92 = OpFNegate %91 
					                          Output f32* %93 = OpAccessChain %79 %22 %75 
					                                              OpStore %93 %92 
					                                              OpReturn
					                                              OpFunctionEnd

					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 40
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %34 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %18 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %23 RelaxedPrecision 
					                                                    OpDecorate %24 RelaxedPrecision 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %30 RelaxedPrecision 
					                                                    OpDecorate %32 RelaxedPrecision 
					                                                    OpDecorate %34 RelaxedPrecision 
					                                                    OpDecorate %34 Location 34 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %38 RelaxedPrecision 
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
					                                            %20 = OpTypePointer Private %6 
					                               Private f32* %21 = OpVariable Private 
					                                            %22 = OpTypeVector %6 3 
					                                        f32 %25 = OpConstant 3.674022E-40 
					                                        f32 %26 = OpConstant 3.674022E-40 
					                                        f32 %27 = OpConstant 3.674022E-40 
					                                      f32_3 %28 = OpConstantComposite %25 %26 %27 
					                                        f32 %31 = OpConstant 3.674022E-40 
					                                            %33 = OpTypePointer Output %7 
					                              Output f32_4* %34 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                                      f32_4 %23 = OpLoad %9 
					                                      f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
					                                        f32 %29 = OpDot %24 %28 
					                                                    OpStore %21 %29 
					                                        f32 %30 = OpLoad %21 
					                                        f32 %32 = OpFAdd %30 %31 
					                                                    OpStore %21 %32 
					                                      f32_4 %35 = OpLoad %9 
					                                        f32 %36 = OpLoad %21 
					                                      f32_4 %37 = OpCompositeConstruct %36 %36 %36 %36 
					                                      f32_4 %38 = OpFDiv %35 %37 
					                                                    OpStore %34 %38 
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
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 103039
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform mediump vec4 _Offsets;
					uniform mediump float _StretchWidth;
					varying mediump vec2 xlv_TEXCOORD0;
					varying mediump vec2 xlv_TEXCOORD0_1;
					varying mediump vec2 xlv_TEXCOORD0_2;
					varying mediump vec2 xlv_TEXCOORD0_3;
					varying mediump vec2 xlv_TEXCOORD0_4;
					varying mediump vec2 xlv_TEXCOORD0_5;
					varying mediump vec2 xlv_TEXCOORD0_6;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  mediump float tmpvar_2;
					  tmpvar_2 = (_StretchWidth * 2.0);
					  mediump float tmpvar_3;
					  tmpvar_3 = (_StretchWidth * 4.0);
					  mediump float tmpvar_4;
					  tmpvar_4 = (_StretchWidth * 6.0);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  xlv_TEXCOORD0_1 = (_glesMultiTexCoord0.xy + (tmpvar_2 * _Offsets.xy));
					  xlv_TEXCOORD0_2 = (_glesMultiTexCoord0.xy - (tmpvar_2 * _Offsets.xy));
					  xlv_TEXCOORD0_3 = (_glesMultiTexCoord0.xy + (tmpvar_3 * _Offsets.xy));
					  xlv_TEXCOORD0_4 = (_glesMultiTexCoord0.xy - (tmpvar_3 * _Offsets.xy));
					  xlv_TEXCOORD0_5 = (_glesMultiTexCoord0.xy + (tmpvar_4 * _Offsets.xy));
					  xlv_TEXCOORD0_6 = (_glesMultiTexCoord0.xy - (tmpvar_4 * _Offsets.xy));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying mediump vec2 xlv_TEXCOORD0;
					varying mediump vec2 xlv_TEXCOORD0_1;
					varying mediump vec2 xlv_TEXCOORD0_2;
					varying mediump vec2 xlv_TEXCOORD0_3;
					varying mediump vec2 xlv_TEXCOORD0_4;
					varying mediump vec2 xlv_TEXCOORD0_5;
					varying mediump vec2 xlv_TEXCOORD0_6;
					void main ()
					{
					  mediump vec4 color_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  color_1 = tmpvar_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0_1);
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0_2);
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0_3);
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0_4);
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0_5);
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0_6);
					  mediump vec4 tmpvar_9;
					  tmpvar_9 = max (max (max (color_1, tmpvar_3), max (tmpvar_4, tmpvar_5)), max (max (tmpvar_6, tmpvar_7), tmpvar_8));
					  color_1 = tmpvar_9;
					  gl_FragData[0] = tmpvar_9;
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
					uniform mediump vec4 _Offsets;
					uniform mediump float _StretchWidth;
					varying mediump vec2 xlv_TEXCOORD0;
					varying mediump vec2 xlv_TEXCOORD0_1;
					varying mediump vec2 xlv_TEXCOORD0_2;
					varying mediump vec2 xlv_TEXCOORD0_3;
					varying mediump vec2 xlv_TEXCOORD0_4;
					varying mediump vec2 xlv_TEXCOORD0_5;
					varying mediump vec2 xlv_TEXCOORD0_6;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  mediump float tmpvar_2;
					  tmpvar_2 = (_StretchWidth * 2.0);
					  mediump float tmpvar_3;
					  tmpvar_3 = (_StretchWidth * 4.0);
					  mediump float tmpvar_4;
					  tmpvar_4 = (_StretchWidth * 6.0);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  xlv_TEXCOORD0_1 = (_glesMultiTexCoord0.xy + (tmpvar_2 * _Offsets.xy));
					  xlv_TEXCOORD0_2 = (_glesMultiTexCoord0.xy - (tmpvar_2 * _Offsets.xy));
					  xlv_TEXCOORD0_3 = (_glesMultiTexCoord0.xy + (tmpvar_3 * _Offsets.xy));
					  xlv_TEXCOORD0_4 = (_glesMultiTexCoord0.xy - (tmpvar_3 * _Offsets.xy));
					  xlv_TEXCOORD0_5 = (_glesMultiTexCoord0.xy + (tmpvar_4 * _Offsets.xy));
					  xlv_TEXCOORD0_6 = (_glesMultiTexCoord0.xy - (tmpvar_4 * _Offsets.xy));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying mediump vec2 xlv_TEXCOORD0;
					varying mediump vec2 xlv_TEXCOORD0_1;
					varying mediump vec2 xlv_TEXCOORD0_2;
					varying mediump vec2 xlv_TEXCOORD0_3;
					varying mediump vec2 xlv_TEXCOORD0_4;
					varying mediump vec2 xlv_TEXCOORD0_5;
					varying mediump vec2 xlv_TEXCOORD0_6;
					void main ()
					{
					  mediump vec4 color_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  color_1 = tmpvar_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0_1);
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0_2);
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0_3);
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0_4);
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0_5);
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0_6);
					  mediump vec4 tmpvar_9;
					  tmpvar_9 = max (max (max (color_1, tmpvar_3), max (tmpvar_4, tmpvar_5)), max (max (tmpvar_6, tmpvar_7), tmpvar_8));
					  color_1 = tmpvar_9;
					  gl_FragData[0] = tmpvar_9;
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
					uniform mediump vec4 _Offsets;
					uniform mediump float _StretchWidth;
					varying mediump vec2 xlv_TEXCOORD0;
					varying mediump vec2 xlv_TEXCOORD0_1;
					varying mediump vec2 xlv_TEXCOORD0_2;
					varying mediump vec2 xlv_TEXCOORD0_3;
					varying mediump vec2 xlv_TEXCOORD0_4;
					varying mediump vec2 xlv_TEXCOORD0_5;
					varying mediump vec2 xlv_TEXCOORD0_6;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  mediump float tmpvar_2;
					  tmpvar_2 = (_StretchWidth * 2.0);
					  mediump float tmpvar_3;
					  tmpvar_3 = (_StretchWidth * 4.0);
					  mediump float tmpvar_4;
					  tmpvar_4 = (_StretchWidth * 6.0);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  xlv_TEXCOORD0_1 = (_glesMultiTexCoord0.xy + (tmpvar_2 * _Offsets.xy));
					  xlv_TEXCOORD0_2 = (_glesMultiTexCoord0.xy - (tmpvar_2 * _Offsets.xy));
					  xlv_TEXCOORD0_3 = (_glesMultiTexCoord0.xy + (tmpvar_3 * _Offsets.xy));
					  xlv_TEXCOORD0_4 = (_glesMultiTexCoord0.xy - (tmpvar_3 * _Offsets.xy));
					  xlv_TEXCOORD0_5 = (_glesMultiTexCoord0.xy + (tmpvar_4 * _Offsets.xy));
					  xlv_TEXCOORD0_6 = (_glesMultiTexCoord0.xy - (tmpvar_4 * _Offsets.xy));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying mediump vec2 xlv_TEXCOORD0;
					varying mediump vec2 xlv_TEXCOORD0_1;
					varying mediump vec2 xlv_TEXCOORD0_2;
					varying mediump vec2 xlv_TEXCOORD0_3;
					varying mediump vec2 xlv_TEXCOORD0_4;
					varying mediump vec2 xlv_TEXCOORD0_5;
					varying mediump vec2 xlv_TEXCOORD0_6;
					void main ()
					{
					  mediump vec4 color_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  color_1 = tmpvar_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0_1);
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0_2);
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0_3);
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0_4);
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0_5);
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0_6);
					  mediump vec4 tmpvar_9;
					  tmpvar_9 = max (max (max (color_1, tmpvar_3), max (tmpvar_4, tmpvar_5)), max (max (tmpvar_6, tmpvar_7), tmpvar_8));
					  color_1 = tmpvar_9;
					  gl_FragData[0] = tmpvar_9;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	mediump vec4 _Offsets;
					uniform 	mediump float _StretchWidth;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD1;
					out mediump vec2 vs_TEXCOORD2;
					out mediump vec2 vs_TEXCOORD3;
					out mediump vec2 vs_TEXCOORD4;
					out mediump vec2 vs_TEXCOORD5;
					out mediump vec2 vs_TEXCOORD6;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					vec4 u_xlat1;
					mediump float u_xlat16_2;
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
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat16_2 = _StretchWidth + _StretchWidth;
					    vs_TEXCOORD1.xy = vec2(u_xlat16_2) * _Offsets.xy + in_TEXCOORD0.xy;
					    vs_TEXCOORD2.xy = (-vec2(u_xlat16_2)) * _Offsets.xy + in_TEXCOORD0.xy;
					    u_xlat16_0 = vec4(_StretchWidth) * vec4(4.0, 4.0, 6.0, 6.0);
					    vs_TEXCOORD3.xy = u_xlat16_0.xy * _Offsets.xy + in_TEXCOORD0.xy;
					    vs_TEXCOORD4.xy = (-u_xlat16_0.xy) * _Offsets.xy + in_TEXCOORD0.xy;
					    vs_TEXCOORD5.xy = u_xlat16_0.zw * _Offsets.xy + in_TEXCOORD0.xy;
					    vs_TEXCOORD6.xy = (-u_xlat16_0.zw) * _Offsets.xy + in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec2 vs_TEXCOORD1;
					in mediump vec2 vs_TEXCOORD2;
					in mediump vec2 vs_TEXCOORD3;
					in mediump vec2 vs_TEXCOORD4;
					in mediump vec2 vs_TEXCOORD5;
					in mediump vec2 vs_TEXCOORD6;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = max(u_xlat10_0, u_xlat10_1);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = max(u_xlat16_0, u_xlat10_1);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = max(u_xlat16_0, u_xlat10_1);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat16_0 = max(u_xlat16_0, u_xlat10_1);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD5.xy);
					    u_xlat16_0 = max(u_xlat16_0, u_xlat10_1);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD6.xy);
					    u_xlat16_0 = max(u_xlat16_0, u_xlat10_1);
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
					uniform 	mediump vec4 _Offsets;
					uniform 	mediump float _StretchWidth;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD1;
					out mediump vec2 vs_TEXCOORD2;
					out mediump vec2 vs_TEXCOORD3;
					out mediump vec2 vs_TEXCOORD4;
					out mediump vec2 vs_TEXCOORD5;
					out mediump vec2 vs_TEXCOORD6;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					vec4 u_xlat1;
					mediump float u_xlat16_2;
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
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat16_2 = _StretchWidth + _StretchWidth;
					    vs_TEXCOORD1.xy = vec2(u_xlat16_2) * _Offsets.xy + in_TEXCOORD0.xy;
					    vs_TEXCOORD2.xy = (-vec2(u_xlat16_2)) * _Offsets.xy + in_TEXCOORD0.xy;
					    u_xlat16_0 = vec4(_StretchWidth) * vec4(4.0, 4.0, 6.0, 6.0);
					    vs_TEXCOORD3.xy = u_xlat16_0.xy * _Offsets.xy + in_TEXCOORD0.xy;
					    vs_TEXCOORD4.xy = (-u_xlat16_0.xy) * _Offsets.xy + in_TEXCOORD0.xy;
					    vs_TEXCOORD5.xy = u_xlat16_0.zw * _Offsets.xy + in_TEXCOORD0.xy;
					    vs_TEXCOORD6.xy = (-u_xlat16_0.zw) * _Offsets.xy + in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec2 vs_TEXCOORD1;
					in mediump vec2 vs_TEXCOORD2;
					in mediump vec2 vs_TEXCOORD3;
					in mediump vec2 vs_TEXCOORD4;
					in mediump vec2 vs_TEXCOORD5;
					in mediump vec2 vs_TEXCOORD6;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = max(u_xlat10_0, u_xlat10_1);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = max(u_xlat16_0, u_xlat10_1);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = max(u_xlat16_0, u_xlat10_1);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat16_0 = max(u_xlat16_0, u_xlat10_1);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD5.xy);
					    u_xlat16_0 = max(u_xlat16_0, u_xlat10_1);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD6.xy);
					    u_xlat16_0 = max(u_xlat16_0, u_xlat10_1);
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
					uniform 	mediump vec4 _Offsets;
					uniform 	mediump float _StretchWidth;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD1;
					out mediump vec2 vs_TEXCOORD2;
					out mediump vec2 vs_TEXCOORD3;
					out mediump vec2 vs_TEXCOORD4;
					out mediump vec2 vs_TEXCOORD5;
					out mediump vec2 vs_TEXCOORD6;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					vec4 u_xlat1;
					mediump float u_xlat16_2;
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
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat16_2 = _StretchWidth + _StretchWidth;
					    vs_TEXCOORD1.xy = vec2(u_xlat16_2) * _Offsets.xy + in_TEXCOORD0.xy;
					    vs_TEXCOORD2.xy = (-vec2(u_xlat16_2)) * _Offsets.xy + in_TEXCOORD0.xy;
					    u_xlat16_0 = vec4(_StretchWidth) * vec4(4.0, 4.0, 6.0, 6.0);
					    vs_TEXCOORD3.xy = u_xlat16_0.xy * _Offsets.xy + in_TEXCOORD0.xy;
					    vs_TEXCOORD4.xy = (-u_xlat16_0.xy) * _Offsets.xy + in_TEXCOORD0.xy;
					    vs_TEXCOORD5.xy = u_xlat16_0.zw * _Offsets.xy + in_TEXCOORD0.xy;
					    vs_TEXCOORD6.xy = (-u_xlat16_0.zw) * _Offsets.xy + in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec2 vs_TEXCOORD1;
					in mediump vec2 vs_TEXCOORD2;
					in mediump vec2 vs_TEXCOORD3;
					in mediump vec2 vs_TEXCOORD4;
					in mediump vec2 vs_TEXCOORD5;
					in mediump vec2 vs_TEXCOORD6;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = max(u_xlat10_0, u_xlat10_1);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = max(u_xlat16_0, u_xlat10_1);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = max(u_xlat16_0, u_xlat10_1);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat16_0 = max(u_xlat16_0, u_xlat10_1);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD5.xy);
					    u_xlat16_0 = max(u_xlat16_0, u_xlat10_1);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD6.xy);
					    u_xlat16_0 = max(u_xlat16_0, u_xlat10_1);
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
					; Bound: 168
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %11 %79 %85 %87 %97 %106 %124 %133 %143 %152 
					                                                      OpDecorate %11 Location 11 
					                                                      OpDecorate %16 ArrayStride 16 
					                                                      OpDecorate %17 ArrayStride 17 
					                                                      OpMemberDecorate %18 0 Offset 18 
					                                                      OpMemberDecorate %18 1 Offset 18 
					                                                      OpMemberDecorate %18 2 RelaxedPrecision 
					                                                      OpMemberDecorate %18 2 Offset 18 
					                                                      OpMemberDecorate %18 3 RelaxedPrecision 
					                                                      OpMemberDecorate %18 3 Offset 18 
					                                                      OpDecorate %18 Block 
					                                                      OpDecorate %20 DescriptorSet 20 
					                                                      OpDecorate %20 Binding 20 
					                                                      OpMemberDecorate %77 0 BuiltIn 77 
					                                                      OpMemberDecorate %77 1 BuiltIn 77 
					                                                      OpMemberDecorate %77 2 BuiltIn 77 
					                                                      OpDecorate %77 Block 
					                                                      OpDecorate %85 RelaxedPrecision 
					                                                      OpDecorate %85 Location 85 
					                                                      OpDecorate %87 RelaxedPrecision 
					                                                      OpDecorate %87 Location 87 
					                                                      OpDecorate %88 RelaxedPrecision 
					                                                      OpDecorate %90 RelaxedPrecision 
					                                                      OpDecorate %93 RelaxedPrecision 
					                                                      OpDecorate %95 RelaxedPrecision 
					                                                      OpDecorate %96 RelaxedPrecision 
					                                                      OpDecorate %97 RelaxedPrecision 
					                                                      OpDecorate %97 Location 97 
					                                                      OpDecorate %98 RelaxedPrecision 
					                                                      OpDecorate %99 RelaxedPrecision 
					                                                      OpDecorate %101 RelaxedPrecision 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %104 RelaxedPrecision 
					                                                      OpDecorate %105 RelaxedPrecision 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate %106 Location 106 
					                                                      OpDecorate %107 RelaxedPrecision 
					                                                      OpDecorate %108 RelaxedPrecision 
					                                                      OpDecorate %109 RelaxedPrecision 
					                                                      OpDecorate %111 RelaxedPrecision 
					                                                      OpDecorate %112 RelaxedPrecision 
					                                                      OpDecorate %113 RelaxedPrecision 
					                                                      OpDecorate %114 RelaxedPrecision 
					                                                      OpDecorate %115 RelaxedPrecision 
					                                                      OpDecorate %116 RelaxedPrecision 
					                                                      OpDecorate %118 RelaxedPrecision 
					                                                      OpDecorate %119 RelaxedPrecision 
					                                                      OpDecorate %123 RelaxedPrecision 
					                                                      OpDecorate %124 RelaxedPrecision 
					                                                      OpDecorate %124 Location 124 
					                                                      OpDecorate %125 RelaxedPrecision 
					                                                      OpDecorate %126 RelaxedPrecision 
					                                                      OpDecorate %128 RelaxedPrecision 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %130 RelaxedPrecision 
					                                                      OpDecorate %131 RelaxedPrecision 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %133 RelaxedPrecision 
					                                                      OpDecorate %133 Location 133 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
					                                                      OpDecorate %138 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %140 RelaxedPrecision 
					                                                      OpDecorate %141 RelaxedPrecision 
					                                                      OpDecorate %142 RelaxedPrecision 
					                                                      OpDecorate %143 RelaxedPrecision 
					                                                      OpDecorate %143 Location 143 
					                                                      OpDecorate %144 RelaxedPrecision 
					                                                      OpDecorate %145 RelaxedPrecision 
					                                                      OpDecorate %147 RelaxedPrecision 
					                                                      OpDecorate %148 RelaxedPrecision 
					                                                      OpDecorate %149 RelaxedPrecision 
					                                                      OpDecorate %150 RelaxedPrecision 
					                                                      OpDecorate %151 RelaxedPrecision 
					                                                      OpDecorate %152 RelaxedPrecision 
					                                                      OpDecorate %152 Location 152 
					                                                      OpDecorate %153 RelaxedPrecision 
					                                                      OpDecorate %154 RelaxedPrecision 
					                                                      OpDecorate %155 RelaxedPrecision 
					                                                      OpDecorate %157 RelaxedPrecision 
					                                                      OpDecorate %158 RelaxedPrecision 
					                                                      OpDecorate %159 RelaxedPrecision 
					                                                      OpDecorate %160 RelaxedPrecision 
					                                                      OpDecorate %161 RelaxedPrecision 
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
					                                              %18 = OpTypeStruct %16 %17 %7 %6 
					                                              %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32;}* %20 = OpVariable Uniform 
					                                              %21 = OpTypeInt 32 1 
					                                          i32 %22 = OpConstant 0 
					                                          i32 %23 = OpConstant 1 
					                                              %24 = OpTypePointer Uniform %7 
					                                          i32 %35 = OpConstant 2 
					                                          i32 %44 = OpConstant 3 
					                               Private f32_4* %48 = OpVariable Private 
					                                          u32 %75 = OpConstant 1 
					                                              %76 = OpTypeArray %6 %75 
					                                              %77 = OpTypeStruct %7 %6 %76 
					                                              %78 = OpTypePointer Output %77 
					         Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
					                                              %81 = OpTypePointer Output %7 
					                                              %83 = OpTypeVector %6 2 
					                                              %84 = OpTypePointer Output %83 
					                                Output f32_2* %85 = OpVariable Output 
					                                              %86 = OpTypePointer Input %83 
					                                 Input f32_2* %87 = OpVariable Input 
					                                              %89 = OpTypePointer Private %6 
					                                 Private f32* %90 = OpVariable Private 
					                                              %91 = OpTypePointer Uniform %6 
					                                Output f32_2* %97 = OpVariable Output 
					                               Output f32_2* %106 = OpVariable Output 
					                              Private f32_4* %116 = OpVariable Private 
					                                         f32 %120 = OpConstant 3.674022E-40 
					                                         f32 %121 = OpConstant 3.674022E-40 
					                                       f32_4 %122 = OpConstantComposite %120 %120 %121 %121 
					                               Output f32_2* %124 = OpVariable Output 
					                               Output f32_2* %133 = OpVariable Output 
					                               Output f32_2* %143 = OpVariable Output 
					                               Output f32_2* %152 = OpVariable Output 
					                                             %162 = OpTypePointer Output %6 
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
					                               Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
					                                        f32_4 %69 = OpLoad %68 
					                                        f32_4 %70 = OpLoad %9 
					                                        f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
					                                        f32_4 %72 = OpFMul %69 %71 
					                                        f32_4 %73 = OpLoad %48 
					                                        f32_4 %74 = OpFAdd %72 %73 
					                                                      OpStore %9 %74 
					                                        f32_4 %80 = OpLoad %9 
					                                Output f32_4* %82 = OpAccessChain %79 %22 
					                                                      OpStore %82 %80 
					                                        f32_2 %88 = OpLoad %87 
					                                                      OpStore %85 %88 
					                                 Uniform f32* %92 = OpAccessChain %20 %44 
					                                          f32 %93 = OpLoad %92 
					                                 Uniform f32* %94 = OpAccessChain %20 %44 
					                                          f32 %95 = OpLoad %94 
					                                          f32 %96 = OpFAdd %93 %95 
					                                                      OpStore %90 %96 
					                                          f32 %98 = OpLoad %90 
					                                        f32_2 %99 = OpCompositeConstruct %98 %98 
					                              Uniform f32_4* %100 = OpAccessChain %20 %35 
					                                       f32_4 %101 = OpLoad %100 
					                                       f32_2 %102 = OpVectorShuffle %101 %101 0 1 
					                                       f32_2 %103 = OpFMul %99 %102 
					                                       f32_2 %104 = OpLoad %87 
					                                       f32_2 %105 = OpFAdd %103 %104 
					                                                      OpStore %97 %105 
					                                         f32 %107 = OpLoad %90 
					                                       f32_2 %108 = OpCompositeConstruct %107 %107 
					                                       f32_2 %109 = OpFNegate %108 
					                              Uniform f32_4* %110 = OpAccessChain %20 %35 
					                                       f32_4 %111 = OpLoad %110 
					                                       f32_2 %112 = OpVectorShuffle %111 %111 0 1 
					                                       f32_2 %113 = OpFMul %109 %112 
					                                       f32_2 %114 = OpLoad %87 
					                                       f32_2 %115 = OpFAdd %113 %114 
					                                                      OpStore %106 %115 
					                                Uniform f32* %117 = OpAccessChain %20 %44 
					                                         f32 %118 = OpLoad %117 
					                                       f32_4 %119 = OpCompositeConstruct %118 %118 %118 %118 
					                                       f32_4 %123 = OpFMul %119 %122 
					                                                      OpStore %116 %123 
					                                       f32_4 %125 = OpLoad %116 
					                                       f32_2 %126 = OpVectorShuffle %125 %125 0 1 
					                              Uniform f32_4* %127 = OpAccessChain %20 %35 
					                                       f32_4 %128 = OpLoad %127 
					                                       f32_2 %129 = OpVectorShuffle %128 %128 0 1 
					                                       f32_2 %130 = OpFMul %126 %129 
					                                       f32_2 %131 = OpLoad %87 
					                                       f32_2 %132 = OpFAdd %130 %131 
					                                                      OpStore %124 %132 
					                                       f32_4 %134 = OpLoad %116 
					                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
					                                       f32_2 %136 = OpFNegate %135 
					                              Uniform f32_4* %137 = OpAccessChain %20 %35 
					                                       f32_4 %138 = OpLoad %137 
					                                       f32_2 %139 = OpVectorShuffle %138 %138 0 1 
					                                       f32_2 %140 = OpFMul %136 %139 
					                                       f32_2 %141 = OpLoad %87 
					                                       f32_2 %142 = OpFAdd %140 %141 
					                                                      OpStore %133 %142 
					                                       f32_4 %144 = OpLoad %116 
					                                       f32_2 %145 = OpVectorShuffle %144 %144 2 3 
					                              Uniform f32_4* %146 = OpAccessChain %20 %35 
					                                       f32_4 %147 = OpLoad %146 
					                                       f32_2 %148 = OpVectorShuffle %147 %147 0 1 
					                                       f32_2 %149 = OpFMul %145 %148 
					                                       f32_2 %150 = OpLoad %87 
					                                       f32_2 %151 = OpFAdd %149 %150 
					                                                      OpStore %143 %151 
					                                       f32_4 %153 = OpLoad %116 
					                                       f32_2 %154 = OpVectorShuffle %153 %153 2 3 
					                                       f32_2 %155 = OpFNegate %154 
					                              Uniform f32_4* %156 = OpAccessChain %20 %35 
					                                       f32_4 %157 = OpLoad %156 
					                                       f32_2 %158 = OpVectorShuffle %157 %157 0 1 
					                                       f32_2 %159 = OpFMul %155 %158 
					                                       f32_2 %160 = OpLoad %87 
					                                       f32_2 %161 = OpFAdd %159 %160 
					                                                      OpStore %152 %161 
					                                 Output f32* %163 = OpAccessChain %79 %22 %75 
					                                         f32 %164 = OpLoad %163 
					                                         f32 %165 = OpFNegate %164 
					                                 Output f32* %166 = OpAccessChain %79 %22 %75 
					                                                      OpStore %166 %165 
					                                                      OpReturn
					                                                      OpFunctionEnd

					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 68
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %22 %30 %37 %44 %51 %58 %65 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %18 RelaxedPrecision 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %22 Location 22 
					                                                    OpDecorate %23 RelaxedPrecision 
					                                                    OpDecorate %25 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %28 RelaxedPrecision 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %30 RelaxedPrecision 
					                                                    OpDecorate %30 Location 30 
					                                                    OpDecorate %31 RelaxedPrecision 
					                                                    OpDecorate %33 RelaxedPrecision 
					                                                    OpDecorate %34 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %37 Location 37 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %40 RelaxedPrecision 
					                                                    OpDecorate %41 RelaxedPrecision 
					                                                    OpDecorate %42 RelaxedPrecision 
					                                                    OpDecorate %43 RelaxedPrecision 
					                                                    OpDecorate %44 RelaxedPrecision 
					                                                    OpDecorate %44 Location 44 
					                                                    OpDecorate %45 RelaxedPrecision 
					                                                    OpDecorate %47 RelaxedPrecision 
					                                                    OpDecorate %48 RelaxedPrecision 
					                                                    OpDecorate %49 RelaxedPrecision 
					                                                    OpDecorate %50 RelaxedPrecision 
					                                                    OpDecorate %51 RelaxedPrecision 
					                                                    OpDecorate %51 Location 51 
					                                                    OpDecorate %52 RelaxedPrecision 
					                                                    OpDecorate %54 RelaxedPrecision 
					                                                    OpDecorate %55 RelaxedPrecision 
					                                                    OpDecorate %56 RelaxedPrecision 
					                                                    OpDecorate %57 RelaxedPrecision 
					                                                    OpDecorate %58 RelaxedPrecision 
					                                                    OpDecorate %58 Location 58 
					                                                    OpDecorate %59 RelaxedPrecision 
					                                                    OpDecorate %61 RelaxedPrecision 
					                                                    OpDecorate %62 RelaxedPrecision 
					                                                    OpDecorate %63 RelaxedPrecision 
					                                                    OpDecorate %65 RelaxedPrecision 
					                                                    OpDecorate %65 Location 65 
					                                                    OpDecorate %66 RelaxedPrecision 
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
					                               Input f32_2* %22 = OpVariable Input 
					                             Private f32_4* %25 = OpVariable Private 
					                               Input f32_2* %30 = OpVariable Input 
					                               Input f32_2* %37 = OpVariable Input 
					                               Input f32_2* %44 = OpVariable Input 
					                               Input f32_2* %51 = OpVariable Input 
					                               Input f32_2* %58 = OpVariable Input 
					                                            %64 = OpTypePointer Output %7 
					                              Output f32_4* %65 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                 read_only Texture2DSampled %21 = OpLoad %13 
					                                      f32_2 %23 = OpLoad %22 
					                                      f32_4 %24 = OpImageSampleImplicitLod %21 %23 
					                                                    OpStore %20 %24 
					                                      f32_4 %26 = OpLoad %9 
					                                      f32_4 %27 = OpLoad %20 
					                                      f32_4 %28 = OpExtInst %1 40 %26 %27 
					                                                    OpStore %25 %28 
					                 read_only Texture2DSampled %29 = OpLoad %13 
					                                      f32_2 %31 = OpLoad %30 
					                                      f32_4 %32 = OpImageSampleImplicitLod %29 %31 
					                                                    OpStore %20 %32 
					                                      f32_4 %33 = OpLoad %25 
					                                      f32_4 %34 = OpLoad %20 
					                                      f32_4 %35 = OpExtInst %1 40 %33 %34 
					                                                    OpStore %25 %35 
					                 read_only Texture2DSampled %36 = OpLoad %13 
					                                      f32_2 %38 = OpLoad %37 
					                                      f32_4 %39 = OpImageSampleImplicitLod %36 %38 
					                                                    OpStore %20 %39 
					                                      f32_4 %40 = OpLoad %25 
					                                      f32_4 %41 = OpLoad %20 
					                                      f32_4 %42 = OpExtInst %1 40 %40 %41 
					                                                    OpStore %25 %42 
					                 read_only Texture2DSampled %43 = OpLoad %13 
					                                      f32_2 %45 = OpLoad %44 
					                                      f32_4 %46 = OpImageSampleImplicitLod %43 %45 
					                                                    OpStore %20 %46 
					                                      f32_4 %47 = OpLoad %25 
					                                      f32_4 %48 = OpLoad %20 
					                                      f32_4 %49 = OpExtInst %1 40 %47 %48 
					                                                    OpStore %25 %49 
					                 read_only Texture2DSampled %50 = OpLoad %13 
					                                      f32_2 %52 = OpLoad %51 
					                                      f32_4 %53 = OpImageSampleImplicitLod %50 %52 
					                                                    OpStore %20 %53 
					                                      f32_4 %54 = OpLoad %25 
					                                      f32_4 %55 = OpLoad %20 
					                                      f32_4 %56 = OpExtInst %1 40 %54 %55 
					                                                    OpStore %25 %56 
					                 read_only Texture2DSampled %57 = OpLoad %13 
					                                      f32_2 %59 = OpLoad %58 
					                                      f32_4 %60 = OpImageSampleImplicitLod %57 %59 
					                                                    OpStore %20 %60 
					                                      f32_4 %61 = OpLoad %25 
					                                      f32_4 %62 = OpLoad %20 
					                                      f32_4 %63 = OpExtInst %1 40 %61 %62 
					                                                    OpStore %25 %63 
					                                      f32_4 %66 = OpLoad %25 
					                                                    OpStore %65 %66 
					                                                    OpReturn
					                                                    OpFunctionEnd
"
				}
				SubProgram "vulkan hw_tier01 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 168
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %11 %79 %85 %87 %97 %106 %124 %133 %143 %152 
					                                                      OpDecorate %11 Location 11 
					                                                      OpDecorate %16 ArrayStride 16 
					                                                      OpDecorate %17 ArrayStride 17 
					                                                      OpMemberDecorate %18 0 Offset 18 
					                                                      OpMemberDecorate %18 1 Offset 18 
					                                                      OpMemberDecorate %18 2 RelaxedPrecision 
					                                                      OpMemberDecorate %18 2 Offset 18 
					                                                      OpMemberDecorate %18 3 RelaxedPrecision 
					                                                      OpMemberDecorate %18 3 Offset 18 
					                                                      OpDecorate %18 Block 
					                                                      OpDecorate %20 DescriptorSet 20 
					                                                      OpDecorate %20 Binding 20 
					                                                      OpMemberDecorate %77 0 BuiltIn 77 
					                                                      OpMemberDecorate %77 1 BuiltIn 77 
					                                                      OpMemberDecorate %77 2 BuiltIn 77 
					                                                      OpDecorate %77 Block 
					                                                      OpDecorate %85 RelaxedPrecision 
					                                                      OpDecorate %85 Location 85 
					                                                      OpDecorate %87 RelaxedPrecision 
					                                                      OpDecorate %87 Location 87 
					                                                      OpDecorate %88 RelaxedPrecision 
					                                                      OpDecorate %90 RelaxedPrecision 
					                                                      OpDecorate %93 RelaxedPrecision 
					                                                      OpDecorate %95 RelaxedPrecision 
					                                                      OpDecorate %96 RelaxedPrecision 
					                                                      OpDecorate %97 RelaxedPrecision 
					                                                      OpDecorate %97 Location 97 
					                                                      OpDecorate %98 RelaxedPrecision 
					                                                      OpDecorate %99 RelaxedPrecision 
					                                                      OpDecorate %101 RelaxedPrecision 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %104 RelaxedPrecision 
					                                                      OpDecorate %105 RelaxedPrecision 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate %106 Location 106 
					                                                      OpDecorate %107 RelaxedPrecision 
					                                                      OpDecorate %108 RelaxedPrecision 
					                                                      OpDecorate %109 RelaxedPrecision 
					                                                      OpDecorate %111 RelaxedPrecision 
					                                                      OpDecorate %112 RelaxedPrecision 
					                                                      OpDecorate %113 RelaxedPrecision 
					                                                      OpDecorate %114 RelaxedPrecision 
					                                                      OpDecorate %115 RelaxedPrecision 
					                                                      OpDecorate %116 RelaxedPrecision 
					                                                      OpDecorate %118 RelaxedPrecision 
					                                                      OpDecorate %119 RelaxedPrecision 
					                                                      OpDecorate %123 RelaxedPrecision 
					                                                      OpDecorate %124 RelaxedPrecision 
					                                                      OpDecorate %124 Location 124 
					                                                      OpDecorate %125 RelaxedPrecision 
					                                                      OpDecorate %126 RelaxedPrecision 
					                                                      OpDecorate %128 RelaxedPrecision 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %130 RelaxedPrecision 
					                                                      OpDecorate %131 RelaxedPrecision 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %133 RelaxedPrecision 
					                                                      OpDecorate %133 Location 133 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
					                                                      OpDecorate %138 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %140 RelaxedPrecision 
					                                                      OpDecorate %141 RelaxedPrecision 
					                                                      OpDecorate %142 RelaxedPrecision 
					                                                      OpDecorate %143 RelaxedPrecision 
					                                                      OpDecorate %143 Location 143 
					                                                      OpDecorate %144 RelaxedPrecision 
					                                                      OpDecorate %145 RelaxedPrecision 
					                                                      OpDecorate %147 RelaxedPrecision 
					                                                      OpDecorate %148 RelaxedPrecision 
					                                                      OpDecorate %149 RelaxedPrecision 
					                                                      OpDecorate %150 RelaxedPrecision 
					                                                      OpDecorate %151 RelaxedPrecision 
					                                                      OpDecorate %152 RelaxedPrecision 
					                                                      OpDecorate %152 Location 152 
					                                                      OpDecorate %153 RelaxedPrecision 
					                                                      OpDecorate %154 RelaxedPrecision 
					                                                      OpDecorate %155 RelaxedPrecision 
					                                                      OpDecorate %157 RelaxedPrecision 
					                                                      OpDecorate %158 RelaxedPrecision 
					                                                      OpDecorate %159 RelaxedPrecision 
					                                                      OpDecorate %160 RelaxedPrecision 
					                                                      OpDecorate %161 RelaxedPrecision 
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
					                                              %18 = OpTypeStruct %16 %17 %7 %6 
					                                              %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32;}* %20 = OpVariable Uniform 
					                                              %21 = OpTypeInt 32 1 
					                                          i32 %22 = OpConstant 0 
					                                          i32 %23 = OpConstant 1 
					                                              %24 = OpTypePointer Uniform %7 
					                                          i32 %35 = OpConstant 2 
					                                          i32 %44 = OpConstant 3 
					                               Private f32_4* %48 = OpVariable Private 
					                                          u32 %75 = OpConstant 1 
					                                              %76 = OpTypeArray %6 %75 
					                                              %77 = OpTypeStruct %7 %6 %76 
					                                              %78 = OpTypePointer Output %77 
					         Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
					                                              %81 = OpTypePointer Output %7 
					                                              %83 = OpTypeVector %6 2 
					                                              %84 = OpTypePointer Output %83 
					                                Output f32_2* %85 = OpVariable Output 
					                                              %86 = OpTypePointer Input %83 
					                                 Input f32_2* %87 = OpVariable Input 
					                                              %89 = OpTypePointer Private %6 
					                                 Private f32* %90 = OpVariable Private 
					                                              %91 = OpTypePointer Uniform %6 
					                                Output f32_2* %97 = OpVariable Output 
					                               Output f32_2* %106 = OpVariable Output 
					                              Private f32_4* %116 = OpVariable Private 
					                                         f32 %120 = OpConstant 3.674022E-40 
					                                         f32 %121 = OpConstant 3.674022E-40 
					                                       f32_4 %122 = OpConstantComposite %120 %120 %121 %121 
					                               Output f32_2* %124 = OpVariable Output 
					                               Output f32_2* %133 = OpVariable Output 
					                               Output f32_2* %143 = OpVariable Output 
					                               Output f32_2* %152 = OpVariable Output 
					                                             %162 = OpTypePointer Output %6 
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
					                               Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
					                                        f32_4 %69 = OpLoad %68 
					                                        f32_4 %70 = OpLoad %9 
					                                        f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
					                                        f32_4 %72 = OpFMul %69 %71 
					                                        f32_4 %73 = OpLoad %48 
					                                        f32_4 %74 = OpFAdd %72 %73 
					                                                      OpStore %9 %74 
					                                        f32_4 %80 = OpLoad %9 
					                                Output f32_4* %82 = OpAccessChain %79 %22 
					                                                      OpStore %82 %80 
					                                        f32_2 %88 = OpLoad %87 
					                                                      OpStore %85 %88 
					                                 Uniform f32* %92 = OpAccessChain %20 %44 
					                                          f32 %93 = OpLoad %92 
					                                 Uniform f32* %94 = OpAccessChain %20 %44 
					                                          f32 %95 = OpLoad %94 
					                                          f32 %96 = OpFAdd %93 %95 
					                                                      OpStore %90 %96 
					                                          f32 %98 = OpLoad %90 
					                                        f32_2 %99 = OpCompositeConstruct %98 %98 
					                              Uniform f32_4* %100 = OpAccessChain %20 %35 
					                                       f32_4 %101 = OpLoad %100 
					                                       f32_2 %102 = OpVectorShuffle %101 %101 0 1 
					                                       f32_2 %103 = OpFMul %99 %102 
					                                       f32_2 %104 = OpLoad %87 
					                                       f32_2 %105 = OpFAdd %103 %104 
					                                                      OpStore %97 %105 
					                                         f32 %107 = OpLoad %90 
					                                       f32_2 %108 = OpCompositeConstruct %107 %107 
					                                       f32_2 %109 = OpFNegate %108 
					                              Uniform f32_4* %110 = OpAccessChain %20 %35 
					                                       f32_4 %111 = OpLoad %110 
					                                       f32_2 %112 = OpVectorShuffle %111 %111 0 1 
					                                       f32_2 %113 = OpFMul %109 %112 
					                                       f32_2 %114 = OpLoad %87 
					                                       f32_2 %115 = OpFAdd %113 %114 
					                                                      OpStore %106 %115 
					                                Uniform f32* %117 = OpAccessChain %20 %44 
					                                         f32 %118 = OpLoad %117 
					                                       f32_4 %119 = OpCompositeConstruct %118 %118 %118 %118 
					                                       f32_4 %123 = OpFMul %119 %122 
					                                                      OpStore %116 %123 
					                                       f32_4 %125 = OpLoad %116 
					                                       f32_2 %126 = OpVectorShuffle %125 %125 0 1 
					                              Uniform f32_4* %127 = OpAccessChain %20 %35 
					                                       f32_4 %128 = OpLoad %127 
					                                       f32_2 %129 = OpVectorShuffle %128 %128 0 1 
					                                       f32_2 %130 = OpFMul %126 %129 
					                                       f32_2 %131 = OpLoad %87 
					                                       f32_2 %132 = OpFAdd %130 %131 
					                                                      OpStore %124 %132 
					                                       f32_4 %134 = OpLoad %116 
					                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
					                                       f32_2 %136 = OpFNegate %135 
					                              Uniform f32_4* %137 = OpAccessChain %20 %35 
					                                       f32_4 %138 = OpLoad %137 
					                                       f32_2 %139 = OpVectorShuffle %138 %138 0 1 
					                                       f32_2 %140 = OpFMul %136 %139 
					                                       f32_2 %141 = OpLoad %87 
					                                       f32_2 %142 = OpFAdd %140 %141 
					                                                      OpStore %133 %142 
					                                       f32_4 %144 = OpLoad %116 
					                                       f32_2 %145 = OpVectorShuffle %144 %144 2 3 
					                              Uniform f32_4* %146 = OpAccessChain %20 %35 
					                                       f32_4 %147 = OpLoad %146 
					                                       f32_2 %148 = OpVectorShuffle %147 %147 0 1 
					                                       f32_2 %149 = OpFMul %145 %148 
					                                       f32_2 %150 = OpLoad %87 
					                                       f32_2 %151 = OpFAdd %149 %150 
					                                                      OpStore %143 %151 
					                                       f32_4 %153 = OpLoad %116 
					                                       f32_2 %154 = OpVectorShuffle %153 %153 2 3 
					                                       f32_2 %155 = OpFNegate %154 
					                              Uniform f32_4* %156 = OpAccessChain %20 %35 
					                                       f32_4 %157 = OpLoad %156 
					                                       f32_2 %158 = OpVectorShuffle %157 %157 0 1 
					                                       f32_2 %159 = OpFMul %155 %158 
					                                       f32_2 %160 = OpLoad %87 
					                                       f32_2 %161 = OpFAdd %159 %160 
					                                                      OpStore %152 %161 
					                                 Output f32* %163 = OpAccessChain %79 %22 %75 
					                                         f32 %164 = OpLoad %163 
					                                         f32 %165 = OpFNegate %164 
					                                 Output f32* %166 = OpAccessChain %79 %22 %75 
					                                                      OpStore %166 %165 
					                                                      OpReturn
					                                                      OpFunctionEnd

					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 68
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %22 %30 %37 %44 %51 %58 %65 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %18 RelaxedPrecision 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %22 Location 22 
					                                                    OpDecorate %23 RelaxedPrecision 
					                                                    OpDecorate %25 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %28 RelaxedPrecision 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %30 RelaxedPrecision 
					                                                    OpDecorate %30 Location 30 
					                                                    OpDecorate %31 RelaxedPrecision 
					                                                    OpDecorate %33 RelaxedPrecision 
					                                                    OpDecorate %34 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %37 Location 37 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %40 RelaxedPrecision 
					                                                    OpDecorate %41 RelaxedPrecision 
					                                                    OpDecorate %42 RelaxedPrecision 
					                                                    OpDecorate %43 RelaxedPrecision 
					                                                    OpDecorate %44 RelaxedPrecision 
					                                                    OpDecorate %44 Location 44 
					                                                    OpDecorate %45 RelaxedPrecision 
					                                                    OpDecorate %47 RelaxedPrecision 
					                                                    OpDecorate %48 RelaxedPrecision 
					                                                    OpDecorate %49 RelaxedPrecision 
					                                                    OpDecorate %50 RelaxedPrecision 
					                                                    OpDecorate %51 RelaxedPrecision 
					                                                    OpDecorate %51 Location 51 
					                                                    OpDecorate %52 RelaxedPrecision 
					                                                    OpDecorate %54 RelaxedPrecision 
					                                                    OpDecorate %55 RelaxedPrecision 
					                                                    OpDecorate %56 RelaxedPrecision 
					                                                    OpDecorate %57 RelaxedPrecision 
					                                                    OpDecorate %58 RelaxedPrecision 
					                                                    OpDecorate %58 Location 58 
					                                                    OpDecorate %59 RelaxedPrecision 
					                                                    OpDecorate %61 RelaxedPrecision 
					                                                    OpDecorate %62 RelaxedPrecision 
					                                                    OpDecorate %63 RelaxedPrecision 
					                                                    OpDecorate %65 RelaxedPrecision 
					                                                    OpDecorate %65 Location 65 
					                                                    OpDecorate %66 RelaxedPrecision 
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
					                               Input f32_2* %22 = OpVariable Input 
					                             Private f32_4* %25 = OpVariable Private 
					                               Input f32_2* %30 = OpVariable Input 
					                               Input f32_2* %37 = OpVariable Input 
					                               Input f32_2* %44 = OpVariable Input 
					                               Input f32_2* %51 = OpVariable Input 
					                               Input f32_2* %58 = OpVariable Input 
					                                            %64 = OpTypePointer Output %7 
					                              Output f32_4* %65 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                 read_only Texture2DSampled %21 = OpLoad %13 
					                                      f32_2 %23 = OpLoad %22 
					                                      f32_4 %24 = OpImageSampleImplicitLod %21 %23 
					                                                    OpStore %20 %24 
					                                      f32_4 %26 = OpLoad %9 
					                                      f32_4 %27 = OpLoad %20 
					                                      f32_4 %28 = OpExtInst %1 40 %26 %27 
					                                                    OpStore %25 %28 
					                 read_only Texture2DSampled %29 = OpLoad %13 
					                                      f32_2 %31 = OpLoad %30 
					                                      f32_4 %32 = OpImageSampleImplicitLod %29 %31 
					                                                    OpStore %20 %32 
					                                      f32_4 %33 = OpLoad %25 
					                                      f32_4 %34 = OpLoad %20 
					                                      f32_4 %35 = OpExtInst %1 40 %33 %34 
					                                                    OpStore %25 %35 
					                 read_only Texture2DSampled %36 = OpLoad %13 
					                                      f32_2 %38 = OpLoad %37 
					                                      f32_4 %39 = OpImageSampleImplicitLod %36 %38 
					                                                    OpStore %20 %39 
					                                      f32_4 %40 = OpLoad %25 
					                                      f32_4 %41 = OpLoad %20 
					                                      f32_4 %42 = OpExtInst %1 40 %40 %41 
					                                                    OpStore %25 %42 
					                 read_only Texture2DSampled %43 = OpLoad %13 
					                                      f32_2 %45 = OpLoad %44 
					                                      f32_4 %46 = OpImageSampleImplicitLod %43 %45 
					                                                    OpStore %20 %46 
					                                      f32_4 %47 = OpLoad %25 
					                                      f32_4 %48 = OpLoad %20 
					                                      f32_4 %49 = OpExtInst %1 40 %47 %48 
					                                                    OpStore %25 %49 
					                 read_only Texture2DSampled %50 = OpLoad %13 
					                                      f32_2 %52 = OpLoad %51 
					                                      f32_4 %53 = OpImageSampleImplicitLod %50 %52 
					                                                    OpStore %20 %53 
					                                      f32_4 %54 = OpLoad %25 
					                                      f32_4 %55 = OpLoad %20 
					                                      f32_4 %56 = OpExtInst %1 40 %54 %55 
					                                                    OpStore %25 %56 
					                 read_only Texture2DSampled %57 = OpLoad %13 
					                                      f32_2 %59 = OpLoad %58 
					                                      f32_4 %60 = OpImageSampleImplicitLod %57 %59 
					                                                    OpStore %20 %60 
					                                      f32_4 %61 = OpLoad %25 
					                                      f32_4 %62 = OpLoad %20 
					                                      f32_4 %63 = OpExtInst %1 40 %61 %62 
					                                                    OpStore %25 %63 
					                                      f32_4 %66 = OpLoad %25 
					                                                    OpStore %65 %66 
					                                                    OpReturn
					                                                    OpFunctionEnd
"
				}
				SubProgram "vulkan hw_tier02 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 168
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %11 %79 %85 %87 %97 %106 %124 %133 %143 %152 
					                                                      OpDecorate %11 Location 11 
					                                                      OpDecorate %16 ArrayStride 16 
					                                                      OpDecorate %17 ArrayStride 17 
					                                                      OpMemberDecorate %18 0 Offset 18 
					                                                      OpMemberDecorate %18 1 Offset 18 
					                                                      OpMemberDecorate %18 2 RelaxedPrecision 
					                                                      OpMemberDecorate %18 2 Offset 18 
					                                                      OpMemberDecorate %18 3 RelaxedPrecision 
					                                                      OpMemberDecorate %18 3 Offset 18 
					                                                      OpDecorate %18 Block 
					                                                      OpDecorate %20 DescriptorSet 20 
					                                                      OpDecorate %20 Binding 20 
					                                                      OpMemberDecorate %77 0 BuiltIn 77 
					                                                      OpMemberDecorate %77 1 BuiltIn 77 
					                                                      OpMemberDecorate %77 2 BuiltIn 77 
					                                                      OpDecorate %77 Block 
					                                                      OpDecorate %85 RelaxedPrecision 
					                                                      OpDecorate %85 Location 85 
					                                                      OpDecorate %87 RelaxedPrecision 
					                                                      OpDecorate %87 Location 87 
					                                                      OpDecorate %88 RelaxedPrecision 
					                                                      OpDecorate %90 RelaxedPrecision 
					                                                      OpDecorate %93 RelaxedPrecision 
					                                                      OpDecorate %95 RelaxedPrecision 
					                                                      OpDecorate %96 RelaxedPrecision 
					                                                      OpDecorate %97 RelaxedPrecision 
					                                                      OpDecorate %97 Location 97 
					                                                      OpDecorate %98 RelaxedPrecision 
					                                                      OpDecorate %99 RelaxedPrecision 
					                                                      OpDecorate %101 RelaxedPrecision 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %104 RelaxedPrecision 
					                                                      OpDecorate %105 RelaxedPrecision 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate %106 Location 106 
					                                                      OpDecorate %107 RelaxedPrecision 
					                                                      OpDecorate %108 RelaxedPrecision 
					                                                      OpDecorate %109 RelaxedPrecision 
					                                                      OpDecorate %111 RelaxedPrecision 
					                                                      OpDecorate %112 RelaxedPrecision 
					                                                      OpDecorate %113 RelaxedPrecision 
					                                                      OpDecorate %114 RelaxedPrecision 
					                                                      OpDecorate %115 RelaxedPrecision 
					                                                      OpDecorate %116 RelaxedPrecision 
					                                                      OpDecorate %118 RelaxedPrecision 
					                                                      OpDecorate %119 RelaxedPrecision 
					                                                      OpDecorate %123 RelaxedPrecision 
					                                                      OpDecorate %124 RelaxedPrecision 
					                                                      OpDecorate %124 Location 124 
					                                                      OpDecorate %125 RelaxedPrecision 
					                                                      OpDecorate %126 RelaxedPrecision 
					                                                      OpDecorate %128 RelaxedPrecision 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %130 RelaxedPrecision 
					                                                      OpDecorate %131 RelaxedPrecision 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %133 RelaxedPrecision 
					                                                      OpDecorate %133 Location 133 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
					                                                      OpDecorate %138 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %140 RelaxedPrecision 
					                                                      OpDecorate %141 RelaxedPrecision 
					                                                      OpDecorate %142 RelaxedPrecision 
					                                                      OpDecorate %143 RelaxedPrecision 
					                                                      OpDecorate %143 Location 143 
					                                                      OpDecorate %144 RelaxedPrecision 
					                                                      OpDecorate %145 RelaxedPrecision 
					                                                      OpDecorate %147 RelaxedPrecision 
					                                                      OpDecorate %148 RelaxedPrecision 
					                                                      OpDecorate %149 RelaxedPrecision 
					                                                      OpDecorate %150 RelaxedPrecision 
					                                                      OpDecorate %151 RelaxedPrecision 
					                                                      OpDecorate %152 RelaxedPrecision 
					                                                      OpDecorate %152 Location 152 
					                                                      OpDecorate %153 RelaxedPrecision 
					                                                      OpDecorate %154 RelaxedPrecision 
					                                                      OpDecorate %155 RelaxedPrecision 
					                                                      OpDecorate %157 RelaxedPrecision 
					                                                      OpDecorate %158 RelaxedPrecision 
					                                                      OpDecorate %159 RelaxedPrecision 
					                                                      OpDecorate %160 RelaxedPrecision 
					                                                      OpDecorate %161 RelaxedPrecision 
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
					                                              %18 = OpTypeStruct %16 %17 %7 %6 
					                                              %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32;}* %20 = OpVariable Uniform 
					                                              %21 = OpTypeInt 32 1 
					                                          i32 %22 = OpConstant 0 
					                                          i32 %23 = OpConstant 1 
					                                              %24 = OpTypePointer Uniform %7 
					                                          i32 %35 = OpConstant 2 
					                                          i32 %44 = OpConstant 3 
					                               Private f32_4* %48 = OpVariable Private 
					                                          u32 %75 = OpConstant 1 
					                                              %76 = OpTypeArray %6 %75 
					                                              %77 = OpTypeStruct %7 %6 %76 
					                                              %78 = OpTypePointer Output %77 
					         Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
					                                              %81 = OpTypePointer Output %7 
					                                              %83 = OpTypeVector %6 2 
					                                              %84 = OpTypePointer Output %83 
					                                Output f32_2* %85 = OpVariable Output 
					                                              %86 = OpTypePointer Input %83 
					                                 Input f32_2* %87 = OpVariable Input 
					                                              %89 = OpTypePointer Private %6 
					                                 Private f32* %90 = OpVariable Private 
					                                              %91 = OpTypePointer Uniform %6 
					                                Output f32_2* %97 = OpVariable Output 
					                               Output f32_2* %106 = OpVariable Output 
					                              Private f32_4* %116 = OpVariable Private 
					                                         f32 %120 = OpConstant 3.674022E-40 
					                                         f32 %121 = OpConstant 3.674022E-40 
					                                       f32_4 %122 = OpConstantComposite %120 %120 %121 %121 
					                               Output f32_2* %124 = OpVariable Output 
					                               Output f32_2* %133 = OpVariable Output 
					                               Output f32_2* %143 = OpVariable Output 
					                               Output f32_2* %152 = OpVariable Output 
					                                             %162 = OpTypePointer Output %6 
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
					                               Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
					                                        f32_4 %69 = OpLoad %68 
					                                        f32_4 %70 = OpLoad %9 
					                                        f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
					                                        f32_4 %72 = OpFMul %69 %71 
					                                        f32_4 %73 = OpLoad %48 
					                                        f32_4 %74 = OpFAdd %72 %73 
					                                                      OpStore %9 %74 
					                                        f32_4 %80 = OpLoad %9 
					                                Output f32_4* %82 = OpAccessChain %79 %22 
					                                                      OpStore %82 %80 
					                                        f32_2 %88 = OpLoad %87 
					                                                      OpStore %85 %88 
					                                 Uniform f32* %92 = OpAccessChain %20 %44 
					                                          f32 %93 = OpLoad %92 
					                                 Uniform f32* %94 = OpAccessChain %20 %44 
					                                          f32 %95 = OpLoad %94 
					                                          f32 %96 = OpFAdd %93 %95 
					                                                      OpStore %90 %96 
					                                          f32 %98 = OpLoad %90 
					                                        f32_2 %99 = OpCompositeConstruct %98 %98 
					                              Uniform f32_4* %100 = OpAccessChain %20 %35 
					                                       f32_4 %101 = OpLoad %100 
					                                       f32_2 %102 = OpVectorShuffle %101 %101 0 1 
					                                       f32_2 %103 = OpFMul %99 %102 
					                                       f32_2 %104 = OpLoad %87 
					                                       f32_2 %105 = OpFAdd %103 %104 
					                                                      OpStore %97 %105 
					                                         f32 %107 = OpLoad %90 
					                                       f32_2 %108 = OpCompositeConstruct %107 %107 
					                                       f32_2 %109 = OpFNegate %108 
					                              Uniform f32_4* %110 = OpAccessChain %20 %35 
					                                       f32_4 %111 = OpLoad %110 
					                                       f32_2 %112 = OpVectorShuffle %111 %111 0 1 
					                                       f32_2 %113 = OpFMul %109 %112 
					                                       f32_2 %114 = OpLoad %87 
					                                       f32_2 %115 = OpFAdd %113 %114 
					                                                      OpStore %106 %115 
					                                Uniform f32* %117 = OpAccessChain %20 %44 
					                                         f32 %118 = OpLoad %117 
					                                       f32_4 %119 = OpCompositeConstruct %118 %118 %118 %118 
					                                       f32_4 %123 = OpFMul %119 %122 
					                                                      OpStore %116 %123 
					                                       f32_4 %125 = OpLoad %116 
					                                       f32_2 %126 = OpVectorShuffle %125 %125 0 1 
					                              Uniform f32_4* %127 = OpAccessChain %20 %35 
					                                       f32_4 %128 = OpLoad %127 
					                                       f32_2 %129 = OpVectorShuffle %128 %128 0 1 
					                                       f32_2 %130 = OpFMul %126 %129 
					                                       f32_2 %131 = OpLoad %87 
					                                       f32_2 %132 = OpFAdd %130 %131 
					                                                      OpStore %124 %132 
					                                       f32_4 %134 = OpLoad %116 
					                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
					                                       f32_2 %136 = OpFNegate %135 
					                              Uniform f32_4* %137 = OpAccessChain %20 %35 
					                                       f32_4 %138 = OpLoad %137 
					                                       f32_2 %139 = OpVectorShuffle %138 %138 0 1 
					                                       f32_2 %140 = OpFMul %136 %139 
					                                       f32_2 %141 = OpLoad %87 
					                                       f32_2 %142 = OpFAdd %140 %141 
					                                                      OpStore %133 %142 
					                                       f32_4 %144 = OpLoad %116 
					                                       f32_2 %145 = OpVectorShuffle %144 %144 2 3 
					                              Uniform f32_4* %146 = OpAccessChain %20 %35 
					                                       f32_4 %147 = OpLoad %146 
					                                       f32_2 %148 = OpVectorShuffle %147 %147 0 1 
					                                       f32_2 %149 = OpFMul %145 %148 
					                                       f32_2 %150 = OpLoad %87 
					                                       f32_2 %151 = OpFAdd %149 %150 
					                                                      OpStore %143 %151 
					                                       f32_4 %153 = OpLoad %116 
					                                       f32_2 %154 = OpVectorShuffle %153 %153 2 3 
					                                       f32_2 %155 = OpFNegate %154 
					                              Uniform f32_4* %156 = OpAccessChain %20 %35 
					                                       f32_4 %157 = OpLoad %156 
					                                       f32_2 %158 = OpVectorShuffle %157 %157 0 1 
					                                       f32_2 %159 = OpFMul %155 %158 
					                                       f32_2 %160 = OpLoad %87 
					                                       f32_2 %161 = OpFAdd %159 %160 
					                                                      OpStore %152 %161 
					                                 Output f32* %163 = OpAccessChain %79 %22 %75 
					                                         f32 %164 = OpLoad %163 
					                                         f32 %165 = OpFNegate %164 
					                                 Output f32* %166 = OpAccessChain %79 %22 %75 
					                                                      OpStore %166 %165 
					                                                      OpReturn
					                                                      OpFunctionEnd

					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 68
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %22 %30 %37 %44 %51 %58 %65 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %18 RelaxedPrecision 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %22 Location 22 
					                                                    OpDecorate %23 RelaxedPrecision 
					                                                    OpDecorate %25 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %28 RelaxedPrecision 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %30 RelaxedPrecision 
					                                                    OpDecorate %30 Location 30 
					                                                    OpDecorate %31 RelaxedPrecision 
					                                                    OpDecorate %33 RelaxedPrecision 
					                                                    OpDecorate %34 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %37 Location 37 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %40 RelaxedPrecision 
					                                                    OpDecorate %41 RelaxedPrecision 
					                                                    OpDecorate %42 RelaxedPrecision 
					                                                    OpDecorate %43 RelaxedPrecision 
					                                                    OpDecorate %44 RelaxedPrecision 
					                                                    OpDecorate %44 Location 44 
					                                                    OpDecorate %45 RelaxedPrecision 
					                                                    OpDecorate %47 RelaxedPrecision 
					                                                    OpDecorate %48 RelaxedPrecision 
					                                                    OpDecorate %49 RelaxedPrecision 
					                                                    OpDecorate %50 RelaxedPrecision 
					                                                    OpDecorate %51 RelaxedPrecision 
					                                                    OpDecorate %51 Location 51 
					                                                    OpDecorate %52 RelaxedPrecision 
					                                                    OpDecorate %54 RelaxedPrecision 
					                                                    OpDecorate %55 RelaxedPrecision 
					                                                    OpDecorate %56 RelaxedPrecision 
					                                                    OpDecorate %57 RelaxedPrecision 
					                                                    OpDecorate %58 RelaxedPrecision 
					                                                    OpDecorate %58 Location 58 
					                                                    OpDecorate %59 RelaxedPrecision 
					                                                    OpDecorate %61 RelaxedPrecision 
					                                                    OpDecorate %62 RelaxedPrecision 
					                                                    OpDecorate %63 RelaxedPrecision 
					                                                    OpDecorate %65 RelaxedPrecision 
					                                                    OpDecorate %65 Location 65 
					                                                    OpDecorate %66 RelaxedPrecision 
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
					                               Input f32_2* %22 = OpVariable Input 
					                             Private f32_4* %25 = OpVariable Private 
					                               Input f32_2* %30 = OpVariable Input 
					                               Input f32_2* %37 = OpVariable Input 
					                               Input f32_2* %44 = OpVariable Input 
					                               Input f32_2* %51 = OpVariable Input 
					                               Input f32_2* %58 = OpVariable Input 
					                                            %64 = OpTypePointer Output %7 
					                              Output f32_4* %65 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                 read_only Texture2DSampled %21 = OpLoad %13 
					                                      f32_2 %23 = OpLoad %22 
					                                      f32_4 %24 = OpImageSampleImplicitLod %21 %23 
					                                                    OpStore %20 %24 
					                                      f32_4 %26 = OpLoad %9 
					                                      f32_4 %27 = OpLoad %20 
					                                      f32_4 %28 = OpExtInst %1 40 %26 %27 
					                                                    OpStore %25 %28 
					                 read_only Texture2DSampled %29 = OpLoad %13 
					                                      f32_2 %31 = OpLoad %30 
					                                      f32_4 %32 = OpImageSampleImplicitLod %29 %31 
					                                                    OpStore %20 %32 
					                                      f32_4 %33 = OpLoad %25 
					                                      f32_4 %34 = OpLoad %20 
					                                      f32_4 %35 = OpExtInst %1 40 %33 %34 
					                                                    OpStore %25 %35 
					                 read_only Texture2DSampled %36 = OpLoad %13 
					                                      f32_2 %38 = OpLoad %37 
					                                      f32_4 %39 = OpImageSampleImplicitLod %36 %38 
					                                                    OpStore %20 %39 
					                                      f32_4 %40 = OpLoad %25 
					                                      f32_4 %41 = OpLoad %20 
					                                      f32_4 %42 = OpExtInst %1 40 %40 %41 
					                                                    OpStore %25 %42 
					                 read_only Texture2DSampled %43 = OpLoad %13 
					                                      f32_2 %45 = OpLoad %44 
					                                      f32_4 %46 = OpImageSampleImplicitLod %43 %45 
					                                                    OpStore %20 %46 
					                                      f32_4 %47 = OpLoad %25 
					                                      f32_4 %48 = OpLoad %20 
					                                      f32_4 %49 = OpExtInst %1 40 %47 %48 
					                                                    OpStore %25 %49 
					                 read_only Texture2DSampled %50 = OpLoad %13 
					                                      f32_2 %52 = OpLoad %51 
					                                      f32_4 %53 = OpImageSampleImplicitLod %50 %52 
					                                                    OpStore %20 %53 
					                                      f32_4 %54 = OpLoad %25 
					                                      f32_4 %55 = OpLoad %20 
					                                      f32_4 %56 = OpExtInst %1 40 %54 %55 
					                                                    OpStore %25 %56 
					                 read_only Texture2DSampled %57 = OpLoad %13 
					                                      f32_2 %59 = OpLoad %58 
					                                      f32_4 %60 = OpImageSampleImplicitLod %57 %59 
					                                                    OpStore %20 %60 
					                                      f32_4 %61 = OpLoad %25 
					                                      f32_4 %62 = OpLoad %20 
					                                      f32_4 %63 = OpExtInst %1 40 %61 %62 
					                                                    OpStore %25 %63 
					                                      f32_4 %66 = OpLoad %25 
					                                                    OpStore %65 %66 
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
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 145540
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform mediump vec4 _Offsets;
					uniform mediump vec4 _MainTex_TexelSize;
					varying mediump vec2 xlv_TEXCOORD0;
					varying mediump vec2 xlv_TEXCOORD0_1;
					varying mediump vec2 xlv_TEXCOORD0_2;
					varying mediump vec2 xlv_TEXCOORD0_3;
					varying mediump vec2 xlv_TEXCOORD0_4;
					varying mediump vec2 xlv_TEXCOORD0_5;
					varying mediump vec2 xlv_TEXCOORD0_6;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  mediump vec2 tmpvar_2;
					  tmpvar_2 = (0.5 * _MainTex_TexelSize.xy);
					  mediump vec2 tmpvar_3;
					  tmpvar_3 = (1.5 * _MainTex_TexelSize.xy);
					  mediump vec2 tmpvar_4;
					  tmpvar_4 = (2.5 * _MainTex_TexelSize.xy);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  xlv_TEXCOORD0_1 = (_glesMultiTexCoord0.xy + (tmpvar_2 * _Offsets.xy));
					  xlv_TEXCOORD0_2 = (_glesMultiTexCoord0.xy - (tmpvar_2 * _Offsets.xy));
					  xlv_TEXCOORD0_3 = (_glesMultiTexCoord0.xy + (tmpvar_3 * _Offsets.xy));
					  xlv_TEXCOORD0_4 = (_glesMultiTexCoord0.xy - (tmpvar_3 * _Offsets.xy));
					  xlv_TEXCOORD0_5 = (_glesMultiTexCoord0.xy + (tmpvar_4 * _Offsets.xy));
					  xlv_TEXCOORD0_6 = (_glesMultiTexCoord0.xy - (tmpvar_4 * _Offsets.xy));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump vec4 _TintColor;
					uniform mediump vec2 _Threshhold;
					uniform mediump float _Saturation;
					uniform sampler2D _MainTex;
					varying mediump vec2 xlv_TEXCOORD0;
					varying mediump vec2 xlv_TEXCOORD0_1;
					varying mediump vec2 xlv_TEXCOORD0_2;
					varying mediump vec2 xlv_TEXCOORD0_3;
					varying mediump vec2 xlv_TEXCOORD0_4;
					varying mediump vec2 xlv_TEXCOORD0_5;
					varying mediump vec2 xlv_TEXCOORD0_6;
					void main ()
					{
					  mediump vec4 color_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  color_1 = tmpvar_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0_1);
					  color_1 = (color_1 + tmpvar_3);
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0_2);
					  color_1 = (color_1 + tmpvar_4);
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0_3);
					  color_1 = (color_1 + tmpvar_5);
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0_4);
					  color_1 = (color_1 + tmpvar_6);
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0_5);
					  color_1 = (color_1 + tmpvar_7);
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0_6);
					  color_1 = (color_1 + tmpvar_8);
					  mediump vec4 tmpvar_9;
					  tmpvar_9 = max (((color_1 / 7.0) - _Threshhold.xxxx), vec4(0.0, 0.0, 0.0, 0.0));
					  color_1.w = tmpvar_9.w;
					  color_1.xyz = (mix (vec3(dot (tmpvar_9.xyz, vec3(0.22, 0.707, 0.071))), tmpvar_9.xyz, vec3(_Saturation)) * _TintColor.xyz);
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
					uniform mediump vec4 _Offsets;
					uniform mediump vec4 _MainTex_TexelSize;
					varying mediump vec2 xlv_TEXCOORD0;
					varying mediump vec2 xlv_TEXCOORD0_1;
					varying mediump vec2 xlv_TEXCOORD0_2;
					varying mediump vec2 xlv_TEXCOORD0_3;
					varying mediump vec2 xlv_TEXCOORD0_4;
					varying mediump vec2 xlv_TEXCOORD0_5;
					varying mediump vec2 xlv_TEXCOORD0_6;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  mediump vec2 tmpvar_2;
					  tmpvar_2 = (0.5 * _MainTex_TexelSize.xy);
					  mediump vec2 tmpvar_3;
					  tmpvar_3 = (1.5 * _MainTex_TexelSize.xy);
					  mediump vec2 tmpvar_4;
					  tmpvar_4 = (2.5 * _MainTex_TexelSize.xy);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  xlv_TEXCOORD0_1 = (_glesMultiTexCoord0.xy + (tmpvar_2 * _Offsets.xy));
					  xlv_TEXCOORD0_2 = (_glesMultiTexCoord0.xy - (tmpvar_2 * _Offsets.xy));
					  xlv_TEXCOORD0_3 = (_glesMultiTexCoord0.xy + (tmpvar_3 * _Offsets.xy));
					  xlv_TEXCOORD0_4 = (_glesMultiTexCoord0.xy - (tmpvar_3 * _Offsets.xy));
					  xlv_TEXCOORD0_5 = (_glesMultiTexCoord0.xy + (tmpvar_4 * _Offsets.xy));
					  xlv_TEXCOORD0_6 = (_glesMultiTexCoord0.xy - (tmpvar_4 * _Offsets.xy));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump vec4 _TintColor;
					uniform mediump vec2 _Threshhold;
					uniform mediump float _Saturation;
					uniform sampler2D _MainTex;
					varying mediump vec2 xlv_TEXCOORD0;
					varying mediump vec2 xlv_TEXCOORD0_1;
					varying mediump vec2 xlv_TEXCOORD0_2;
					varying mediump vec2 xlv_TEXCOORD0_3;
					varying mediump vec2 xlv_TEXCOORD0_4;
					varying mediump vec2 xlv_TEXCOORD0_5;
					varying mediump vec2 xlv_TEXCOORD0_6;
					void main ()
					{
					  mediump vec4 color_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  color_1 = tmpvar_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0_1);
					  color_1 = (color_1 + tmpvar_3);
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0_2);
					  color_1 = (color_1 + tmpvar_4);
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0_3);
					  color_1 = (color_1 + tmpvar_5);
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0_4);
					  color_1 = (color_1 + tmpvar_6);
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0_5);
					  color_1 = (color_1 + tmpvar_7);
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0_6);
					  color_1 = (color_1 + tmpvar_8);
					  mediump vec4 tmpvar_9;
					  tmpvar_9 = max (((color_1 / 7.0) - _Threshhold.xxxx), vec4(0.0, 0.0, 0.0, 0.0));
					  color_1.w = tmpvar_9.w;
					  color_1.xyz = (mix (vec3(dot (tmpvar_9.xyz, vec3(0.22, 0.707, 0.071))), tmpvar_9.xyz, vec3(_Saturation)) * _TintColor.xyz);
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
					uniform mediump vec4 _Offsets;
					uniform mediump vec4 _MainTex_TexelSize;
					varying mediump vec2 xlv_TEXCOORD0;
					varying mediump vec2 xlv_TEXCOORD0_1;
					varying mediump vec2 xlv_TEXCOORD0_2;
					varying mediump vec2 xlv_TEXCOORD0_3;
					varying mediump vec2 xlv_TEXCOORD0_4;
					varying mediump vec2 xlv_TEXCOORD0_5;
					varying mediump vec2 xlv_TEXCOORD0_6;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  mediump vec2 tmpvar_2;
					  tmpvar_2 = (0.5 * _MainTex_TexelSize.xy);
					  mediump vec2 tmpvar_3;
					  tmpvar_3 = (1.5 * _MainTex_TexelSize.xy);
					  mediump vec2 tmpvar_4;
					  tmpvar_4 = (2.5 * _MainTex_TexelSize.xy);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  xlv_TEXCOORD0_1 = (_glesMultiTexCoord0.xy + (tmpvar_2 * _Offsets.xy));
					  xlv_TEXCOORD0_2 = (_glesMultiTexCoord0.xy - (tmpvar_2 * _Offsets.xy));
					  xlv_TEXCOORD0_3 = (_glesMultiTexCoord0.xy + (tmpvar_3 * _Offsets.xy));
					  xlv_TEXCOORD0_4 = (_glesMultiTexCoord0.xy - (tmpvar_3 * _Offsets.xy));
					  xlv_TEXCOORD0_5 = (_glesMultiTexCoord0.xy + (tmpvar_4 * _Offsets.xy));
					  xlv_TEXCOORD0_6 = (_glesMultiTexCoord0.xy - (tmpvar_4 * _Offsets.xy));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump vec4 _TintColor;
					uniform mediump vec2 _Threshhold;
					uniform mediump float _Saturation;
					uniform sampler2D _MainTex;
					varying mediump vec2 xlv_TEXCOORD0;
					varying mediump vec2 xlv_TEXCOORD0_1;
					varying mediump vec2 xlv_TEXCOORD0_2;
					varying mediump vec2 xlv_TEXCOORD0_3;
					varying mediump vec2 xlv_TEXCOORD0_4;
					varying mediump vec2 xlv_TEXCOORD0_5;
					varying mediump vec2 xlv_TEXCOORD0_6;
					void main ()
					{
					  mediump vec4 color_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  color_1 = tmpvar_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0_1);
					  color_1 = (color_1 + tmpvar_3);
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0_2);
					  color_1 = (color_1 + tmpvar_4);
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0_3);
					  color_1 = (color_1 + tmpvar_5);
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0_4);
					  color_1 = (color_1 + tmpvar_6);
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0_5);
					  color_1 = (color_1 + tmpvar_7);
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0_6);
					  color_1 = (color_1 + tmpvar_8);
					  mediump vec4 tmpvar_9;
					  tmpvar_9 = max (((color_1 / 7.0) - _Threshhold.xxxx), vec4(0.0, 0.0, 0.0, 0.0));
					  color_1.w = tmpvar_9.w;
					  color_1.xyz = (mix (vec3(dot (tmpvar_9.xyz, vec3(0.22, 0.707, 0.071))), tmpvar_9.xyz, vec3(_Saturation)) * _TintColor.xyz);
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
					uniform 	mediump vec4 _Offsets;
					uniform 	mediump vec4 _MainTex_TexelSize;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD1;
					out mediump vec2 vs_TEXCOORD2;
					out mediump vec2 vs_TEXCOORD3;
					out mediump vec2 vs_TEXCOORD4;
					out mediump vec2 vs_TEXCOORD5;
					out mediump vec2 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec2 u_xlat16_2;
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
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat16_2.xy = _Offsets.xy * _MainTex_TexelSize.xy;
					    vs_TEXCOORD1.xy = u_xlat16_2.xy * vec2(0.5, 0.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD2.xy = (-u_xlat16_2.xy) * vec2(0.5, 0.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD3.xy = u_xlat16_2.xy * vec2(1.5, 1.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD4.xy = (-u_xlat16_2.xy) * vec2(1.5, 1.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD5.xy = u_xlat16_2.xy * vec2(2.5, 2.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD6.xy = (-u_xlat16_2.xy) * vec2(2.5, 2.5) + in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 _TintColor;
					uniform 	mediump vec2 _Threshhold;
					uniform 	mediump float _Saturation;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec2 vs_TEXCOORD1;
					in mediump vec2 vs_TEXCOORD2;
					in mediump vec2 vs_TEXCOORD3;
					in mediump vec2 vs_TEXCOORD4;
					in mediump vec2 vs_TEXCOORD5;
					in mediump vec2 vs_TEXCOORD6;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_5;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat10_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD5.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD6.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149) + (-_Threshhold.xxyx.yyyy);
					    u_xlat16_0 = max(u_xlat16_0, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat16_2.x = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_5.xyz = u_xlat16_0.xyz + (-u_xlat16_2.xxx);
					    SV_Target0.w = u_xlat16_0.w;
					    u_xlat16_2.xyz = vec3(vec3(_Saturation, _Saturation, _Saturation)) * u_xlat16_5.xyz + u_xlat16_2.xxx;
					    SV_Target0.xyz = u_xlat16_2.xyz * _TintColor.xyz;
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
					uniform 	mediump vec4 _Offsets;
					uniform 	mediump vec4 _MainTex_TexelSize;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD1;
					out mediump vec2 vs_TEXCOORD2;
					out mediump vec2 vs_TEXCOORD3;
					out mediump vec2 vs_TEXCOORD4;
					out mediump vec2 vs_TEXCOORD5;
					out mediump vec2 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec2 u_xlat16_2;
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
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat16_2.xy = _Offsets.xy * _MainTex_TexelSize.xy;
					    vs_TEXCOORD1.xy = u_xlat16_2.xy * vec2(0.5, 0.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD2.xy = (-u_xlat16_2.xy) * vec2(0.5, 0.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD3.xy = u_xlat16_2.xy * vec2(1.5, 1.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD4.xy = (-u_xlat16_2.xy) * vec2(1.5, 1.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD5.xy = u_xlat16_2.xy * vec2(2.5, 2.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD6.xy = (-u_xlat16_2.xy) * vec2(2.5, 2.5) + in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 _TintColor;
					uniform 	mediump vec2 _Threshhold;
					uniform 	mediump float _Saturation;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec2 vs_TEXCOORD1;
					in mediump vec2 vs_TEXCOORD2;
					in mediump vec2 vs_TEXCOORD3;
					in mediump vec2 vs_TEXCOORD4;
					in mediump vec2 vs_TEXCOORD5;
					in mediump vec2 vs_TEXCOORD6;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_5;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat10_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD5.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD6.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149) + (-_Threshhold.xxyx.yyyy);
					    u_xlat16_0 = max(u_xlat16_0, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat16_2.x = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_5.xyz = u_xlat16_0.xyz + (-u_xlat16_2.xxx);
					    SV_Target0.w = u_xlat16_0.w;
					    u_xlat16_2.xyz = vec3(vec3(_Saturation, _Saturation, _Saturation)) * u_xlat16_5.xyz + u_xlat16_2.xxx;
					    SV_Target0.xyz = u_xlat16_2.xyz * _TintColor.xyz;
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
					uniform 	mediump vec4 _Offsets;
					uniform 	mediump vec4 _MainTex_TexelSize;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD1;
					out mediump vec2 vs_TEXCOORD2;
					out mediump vec2 vs_TEXCOORD3;
					out mediump vec2 vs_TEXCOORD4;
					out mediump vec2 vs_TEXCOORD5;
					out mediump vec2 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec2 u_xlat16_2;
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
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat16_2.xy = _Offsets.xy * _MainTex_TexelSize.xy;
					    vs_TEXCOORD1.xy = u_xlat16_2.xy * vec2(0.5, 0.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD2.xy = (-u_xlat16_2.xy) * vec2(0.5, 0.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD3.xy = u_xlat16_2.xy * vec2(1.5, 1.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD4.xy = (-u_xlat16_2.xy) * vec2(1.5, 1.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD5.xy = u_xlat16_2.xy * vec2(2.5, 2.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD6.xy = (-u_xlat16_2.xy) * vec2(2.5, 2.5) + in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 _TintColor;
					uniform 	mediump vec2 _Threshhold;
					uniform 	mediump float _Saturation;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec2 vs_TEXCOORD1;
					in mediump vec2 vs_TEXCOORD2;
					in mediump vec2 vs_TEXCOORD3;
					in mediump vec2 vs_TEXCOORD4;
					in mediump vec2 vs_TEXCOORD5;
					in mediump vec2 vs_TEXCOORD6;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump vec3 u_xlat16_2;
					mediump vec3 u_xlat16_5;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat10_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD5.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD6.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.142857149, 0.142857149, 0.142857149, 0.142857149) + (-_Threshhold.xxyx.yyyy);
					    u_xlat16_0 = max(u_xlat16_0, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat16_2.x = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_5.xyz = u_xlat16_0.xyz + (-u_xlat16_2.xxx);
					    SV_Target0.w = u_xlat16_0.w;
					    u_xlat16_2.xyz = vec3(vec3(_Saturation, _Saturation, _Saturation)) * u_xlat16_5.xyz + u_xlat16_2.xxx;
					    SV_Target0.xyz = u_xlat16_2.xyz * _TintColor.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan hw_tier00 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 143
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %11 %79 %85 %87 %98 %105 %111 %118 %124 %131 
					                                                      OpDecorate %11 Location 11 
					                                                      OpDecorate %16 ArrayStride 16 
					                                                      OpDecorate %17 ArrayStride 17 
					                                                      OpMemberDecorate %18 0 Offset 18 
					                                                      OpMemberDecorate %18 1 Offset 18 
					                                                      OpMemberDecorate %18 2 RelaxedPrecision 
					                                                      OpMemberDecorate %18 2 Offset 18 
					                                                      OpMemberDecorate %18 3 RelaxedPrecision 
					                                                      OpMemberDecorate %18 3 Offset 18 
					                                                      OpDecorate %18 Block 
					                                                      OpDecorate %20 DescriptorSet 20 
					                                                      OpDecorate %20 Binding 20 
					                                                      OpMemberDecorate %77 0 BuiltIn 77 
					                                                      OpMemberDecorate %77 1 BuiltIn 77 
					                                                      OpMemberDecorate %77 2 BuiltIn 77 
					                                                      OpDecorate %77 Block 
					                                                      OpDecorate %85 RelaxedPrecision 
					                                                      OpDecorate %85 Location 85 
					                                                      OpDecorate %87 RelaxedPrecision 
					                                                      OpDecorate %87 Location 87 
					                                                      OpDecorate %88 RelaxedPrecision 
					                                                      OpDecorate %90 RelaxedPrecision 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %93 RelaxedPrecision 
					                                                      OpDecorate %95 RelaxedPrecision 
					                                                      OpDecorate %96 RelaxedPrecision 
					                                                      OpDecorate %97 RelaxedPrecision 
					                                                      OpDecorate %98 RelaxedPrecision 
					                                                      OpDecorate %98 Location 98 
					                                                      OpDecorate %99 RelaxedPrecision 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %104 RelaxedPrecision 
					                                                      OpDecorate %105 RelaxedPrecision 
					                                                      OpDecorate %105 Location 105 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate %107 RelaxedPrecision 
					                                                      OpDecorate %108 RelaxedPrecision 
					                                                      OpDecorate %109 RelaxedPrecision 
					                                                      OpDecorate %110 RelaxedPrecision 
					                                                      OpDecorate %111 RelaxedPrecision 
					                                                      OpDecorate %111 Location 111 
					                                                      OpDecorate %112 RelaxedPrecision 
					                                                      OpDecorate %115 RelaxedPrecision 
					                                                      OpDecorate %116 RelaxedPrecision 
					                                                      OpDecorate %117 RelaxedPrecision 
					                                                      OpDecorate %118 RelaxedPrecision 
					                                                      OpDecorate %118 Location 118 
					                                                      OpDecorate %119 RelaxedPrecision 
					                                                      OpDecorate %120 RelaxedPrecision 
					                                                      OpDecorate %121 RelaxedPrecision 
					                                                      OpDecorate %122 RelaxedPrecision 
					                                                      OpDecorate %123 RelaxedPrecision 
					                                                      OpDecorate %124 RelaxedPrecision 
					                                                      OpDecorate %124 Location 124 
					                                                      OpDecorate %125 RelaxedPrecision 
					                                                      OpDecorate %128 RelaxedPrecision 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %130 RelaxedPrecision 
					                                                      OpDecorate %131 RelaxedPrecision 
					                                                      OpDecorate %131 Location 131 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %133 RelaxedPrecision 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
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
					                                              %18 = OpTypeStruct %16 %17 %7 %7 
					                                              %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4;}* %20 = OpVariable Uniform 
					                                              %21 = OpTypeInt 32 1 
					                                          i32 %22 = OpConstant 0 
					                                          i32 %23 = OpConstant 1 
					                                              %24 = OpTypePointer Uniform %7 
					                                          i32 %35 = OpConstant 2 
					                                          i32 %44 = OpConstant 3 
					                               Private f32_4* %48 = OpVariable Private 
					                                          u32 %75 = OpConstant 1 
					                                              %76 = OpTypeArray %6 %75 
					                                              %77 = OpTypeStruct %7 %6 %76 
					                                              %78 = OpTypePointer Output %77 
					         Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
					                                              %81 = OpTypePointer Output %7 
					                                              %83 = OpTypeVector %6 2 
					                                              %84 = OpTypePointer Output %83 
					                                Output f32_2* %85 = OpVariable Output 
					                                              %86 = OpTypePointer Input %83 
					                                 Input f32_2* %87 = OpVariable Input 
					                                              %89 = OpTypePointer Private %83 
					                               Private f32_2* %90 = OpVariable Private 
					                                Output f32_2* %98 = OpVariable Output 
					                                         f32 %100 = OpConstant 3.674022E-40 
					                                       f32_2 %101 = OpConstantComposite %100 %100 
					                               Output f32_2* %105 = OpVariable Output 
					                               Output f32_2* %111 = OpVariable Output 
					                                         f32 %113 = OpConstant 3.674022E-40 
					                                       f32_2 %114 = OpConstantComposite %113 %113 
					                               Output f32_2* %118 = OpVariable Output 
					                               Output f32_2* %124 = OpVariable Output 
					                                         f32 %126 = OpConstant 3.674022E-40 
					                                       f32_2 %127 = OpConstantComposite %126 %126 
					                               Output f32_2* %131 = OpVariable Output 
					                                             %137 = OpTypePointer Output %6 
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
					                               Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
					                                        f32_4 %69 = OpLoad %68 
					                                        f32_4 %70 = OpLoad %9 
					                                        f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
					                                        f32_4 %72 = OpFMul %69 %71 
					                                        f32_4 %73 = OpLoad %48 
					                                        f32_4 %74 = OpFAdd %72 %73 
					                                                      OpStore %9 %74 
					                                        f32_4 %80 = OpLoad %9 
					                                Output f32_4* %82 = OpAccessChain %79 %22 
					                                                      OpStore %82 %80 
					                                        f32_2 %88 = OpLoad %87 
					                                                      OpStore %85 %88 
					                               Uniform f32_4* %91 = OpAccessChain %20 %35 
					                                        f32_4 %92 = OpLoad %91 
					                                        f32_2 %93 = OpVectorShuffle %92 %92 0 1 
					                               Uniform f32_4* %94 = OpAccessChain %20 %44 
					                                        f32_4 %95 = OpLoad %94 
					                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
					                                        f32_2 %97 = OpFMul %93 %96 
					                                                      OpStore %90 %97 
					                                        f32_2 %99 = OpLoad %90 
					                                       f32_2 %102 = OpFMul %99 %101 
					                                       f32_2 %103 = OpLoad %87 
					                                       f32_2 %104 = OpFAdd %102 %103 
					                                                      OpStore %98 %104 
					                                       f32_2 %106 = OpLoad %90 
					                                       f32_2 %107 = OpFNegate %106 
					                                       f32_2 %108 = OpFMul %107 %101 
					                                       f32_2 %109 = OpLoad %87 
					                                       f32_2 %110 = OpFAdd %108 %109 
					                                                      OpStore %105 %110 
					                                       f32_2 %112 = OpLoad %90 
					                                       f32_2 %115 = OpFMul %112 %114 
					                                       f32_2 %116 = OpLoad %87 
					                                       f32_2 %117 = OpFAdd %115 %116 
					                                                      OpStore %111 %117 
					                                       f32_2 %119 = OpLoad %90 
					                                       f32_2 %120 = OpFNegate %119 
					                                       f32_2 %121 = OpFMul %120 %114 
					                                       f32_2 %122 = OpLoad %87 
					                                       f32_2 %123 = OpFAdd %121 %122 
					                                                      OpStore %118 %123 
					                                       f32_2 %125 = OpLoad %90 
					                                       f32_2 %128 = OpFMul %125 %127 
					                                       f32_2 %129 = OpLoad %87 
					                                       f32_2 %130 = OpFAdd %128 %129 
					                                                      OpStore %124 %130 
					                                       f32_2 %132 = OpLoad %90 
					                                       f32_2 %133 = OpFNegate %132 
					                                       f32_2 %134 = OpFMul %133 %127 
					                                       f32_2 %135 = OpLoad %87 
					                                       f32_2 %136 = OpFAdd %134 %135 
					                                                      OpStore %131 %136 
					                                 Output f32* %138 = OpAccessChain %79 %22 %75 
					                                         f32 %139 = OpLoad %138 
					                                         f32 %140 = OpFNegate %139 
					                                 Output f32* %141 = OpAccessChain %79 %22 %75 
					                                                      OpStore %141 %140 
					                                                      OpReturn
					                                                      OpFunctionEnd

					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 139
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %22 %30 %37 %44 %51 %58 %105 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %18 RelaxedPrecision 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %22 Location 22 
					                                                    OpDecorate %23 RelaxedPrecision 
					                                                    OpDecorate %25 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %28 RelaxedPrecision 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %30 RelaxedPrecision 
					                                                    OpDecorate %30 Location 30 
					                                                    OpDecorate %31 RelaxedPrecision 
					                                                    OpDecorate %33 RelaxedPrecision 
					                                                    OpDecorate %34 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %37 Location 37 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %40 RelaxedPrecision 
					                                                    OpDecorate %41 RelaxedPrecision 
					                                                    OpDecorate %42 RelaxedPrecision 
					                                                    OpDecorate %43 RelaxedPrecision 
					                                                    OpDecorate %44 RelaxedPrecision 
					                                                    OpDecorate %44 Location 44 
					                                                    OpDecorate %45 RelaxedPrecision 
					                                                    OpDecorate %47 RelaxedPrecision 
					                                                    OpDecorate %48 RelaxedPrecision 
					                                                    OpDecorate %49 RelaxedPrecision 
					                                                    OpDecorate %50 RelaxedPrecision 
					                                                    OpDecorate %51 RelaxedPrecision 
					                                                    OpDecorate %51 Location 51 
					                                                    OpDecorate %52 RelaxedPrecision 
					                                                    OpDecorate %54 RelaxedPrecision 
					                                                    OpDecorate %55 RelaxedPrecision 
					                                                    OpDecorate %56 RelaxedPrecision 
					                                                    OpDecorate %57 RelaxedPrecision 
					                                                    OpDecorate %58 RelaxedPrecision 
					                                                    OpDecorate %58 Location 58 
					                                                    OpDecorate %59 RelaxedPrecision 
					                                                    OpDecorate %61 RelaxedPrecision 
					                                                    OpDecorate %62 RelaxedPrecision 
					                                                    OpDecorate %63 RelaxedPrecision 
					                                                    OpDecorate %64 RelaxedPrecision 
					                                                    OpDecorate %67 RelaxedPrecision 
					                                                    OpMemberDecorate %68 0 RelaxedPrecision 
					                                                    OpMemberDecorate %68 0 Offset 68 
					                                                    OpMemberDecorate %68 1 RelaxedPrecision 
					                                                    OpMemberDecorate %68 1 Offset 68 
					                                                    OpMemberDecorate %68 2 RelaxedPrecision 
					                                                    OpMemberDecorate %68 2 Offset 68 
					                                                    OpDecorate %68 Block 
					                                                    OpDecorate %70 DescriptorSet 70 
					                                                    OpDecorate %70 Binding 70 
					                                                    OpDecorate %75 RelaxedPrecision 
					                                                    OpDecorate %76 RelaxedPrecision 
					                                                    OpDecorate %77 RelaxedPrecision 
					                                                    OpDecorate %78 RelaxedPrecision 
					                                                    OpDecorate %79 RelaxedPrecision 
					                                                    OpDecorate %82 RelaxedPrecision 
					                                                    OpDecorate %85 RelaxedPrecision 
					                                                    OpDecorate %86 RelaxedPrecision 
					                                                    OpDecorate %87 RelaxedPrecision 
					                                                    OpDecorate %92 RelaxedPrecision 
					                                                    OpDecorate %97 RelaxedPrecision 
					                                                    OpDecorate %98 RelaxedPrecision 
					                                                    OpDecorate %99 RelaxedPrecision 
					                                                    OpDecorate %100 RelaxedPrecision 
					                                                    OpDecorate %101 RelaxedPrecision 
					                                                    OpDecorate %102 RelaxedPrecision 
					                                                    OpDecorate %103 RelaxedPrecision 
					                                                    OpDecorate %105 RelaxedPrecision 
					                                                    OpDecorate %105 Location 105 
					                                                    OpDecorate %108 RelaxedPrecision 
					                                                    OpDecorate %114 RelaxedPrecision 
					                                                    OpDecorate %116 RelaxedPrecision 
					                                                    OpDecorate %118 RelaxedPrecision 
					                                                    OpDecorate %119 RelaxedPrecision 
					                                                    OpDecorate %120 RelaxedPrecision 
					                                                    OpDecorate %121 RelaxedPrecision 
					                                                    OpDecorate %122 RelaxedPrecision 
					                                                    OpDecorate %123 RelaxedPrecision 
					                                                    OpDecorate %124 RelaxedPrecision 
					                                                    OpDecorate %125 RelaxedPrecision 
					                                                    OpDecorate %126 RelaxedPrecision 
					                                                    OpDecorate %127 RelaxedPrecision 
					                                                    OpDecorate %128 RelaxedPrecision 
					                                                    OpDecorate %129 RelaxedPrecision 
					                                                    OpDecorate %133 RelaxedPrecision 
					                                                    OpDecorate %134 RelaxedPrecision 
					                                                    OpDecorate %135 RelaxedPrecision 
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
					                               Input f32_2* %22 = OpVariable Input 
					                             Private f32_4* %25 = OpVariable Private 
					                               Input f32_2* %30 = OpVariable Input 
					                               Input f32_2* %37 = OpVariable Input 
					                               Input f32_2* %44 = OpVariable Input 
					                               Input f32_2* %51 = OpVariable Input 
					                               Input f32_2* %58 = OpVariable Input 
					                                        f32 %65 = OpConstant 3.674022E-40 
					                                      f32_4 %66 = OpConstantComposite %65 %65 %65 %65 
					                                            %68 = OpTypeStruct %7 %15 %6 
					                                            %69 = OpTypePointer Uniform %68 
					       Uniform struct {f32_4; f32_2; f32;}* %70 = OpVariable Uniform 
					                                            %71 = OpTypeInt 32 1 
					                                        i32 %72 = OpConstant 1 
					                                            %73 = OpTypePointer Uniform %15 
					                                        f32 %80 = OpConstant 3.674022E-40 
					                                      f32_4 %81 = OpConstantComposite %80 %80 %80 %80 
					                                            %83 = OpTypeVector %6 3 
					                                            %84 = OpTypePointer Private %83 
					                             Private f32_3* %85 = OpVariable Private 
					                                        f32 %88 = OpConstant 3.674022E-40 
					                                        f32 %89 = OpConstant 3.674022E-40 
					                                        f32 %90 = OpConstant 3.674022E-40 
					                                      f32_3 %91 = OpConstantComposite %88 %89 %90 
					                                            %93 = OpTypeInt 32 0 
					                                        u32 %94 = OpConstant 0 
					                                            %95 = OpTypePointer Private %6 
					                             Private f32_3* %97 = OpVariable Private 
					                                           %104 = OpTypePointer Output %7 
					                             Output f32_4* %105 = OpVariable Output 
					                                       u32 %106 = OpConstant 3 
					                                           %109 = OpTypePointer Output %6 
					                                       i32 %111 = OpConstant 2 
					                                           %112 = OpTypePointer Uniform %6 
					                                       i32 %130 = OpConstant 0 
					                                           %131 = OpTypePointer Uniform %7 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                 read_only Texture2DSampled %21 = OpLoad %13 
					                                      f32_2 %23 = OpLoad %22 
					                                      f32_4 %24 = OpImageSampleImplicitLod %21 %23 
					                                                    OpStore %20 %24 
					                                      f32_4 %26 = OpLoad %9 
					                                      f32_4 %27 = OpLoad %20 
					                                      f32_4 %28 = OpFAdd %26 %27 
					                                                    OpStore %25 %28 
					                 read_only Texture2DSampled %29 = OpLoad %13 
					                                      f32_2 %31 = OpLoad %30 
					                                      f32_4 %32 = OpImageSampleImplicitLod %29 %31 
					                                                    OpStore %20 %32 
					                                      f32_4 %33 = OpLoad %25 
					                                      f32_4 %34 = OpLoad %20 
					                                      f32_4 %35 = OpFAdd %33 %34 
					                                                    OpStore %25 %35 
					                 read_only Texture2DSampled %36 = OpLoad %13 
					                                      f32_2 %38 = OpLoad %37 
					                                      f32_4 %39 = OpImageSampleImplicitLod %36 %38 
					                                                    OpStore %20 %39 
					                                      f32_4 %40 = OpLoad %25 
					                                      f32_4 %41 = OpLoad %20 
					                                      f32_4 %42 = OpFAdd %40 %41 
					                                                    OpStore %25 %42 
					                 read_only Texture2DSampled %43 = OpLoad %13 
					                                      f32_2 %45 = OpLoad %44 
					                                      f32_4 %46 = OpImageSampleImplicitLod %43 %45 
					                                                    OpStore %20 %46 
					                                      f32_4 %47 = OpLoad %25 
					                                      f32_4 %48 = OpLoad %20 
					                                      f32_4 %49 = OpFAdd %47 %48 
					                                                    OpStore %25 %49 
					                 read_only Texture2DSampled %50 = OpLoad %13 
					                                      f32_2 %52 = OpLoad %51 
					                                      f32_4 %53 = OpImageSampleImplicitLod %50 %52 
					                                                    OpStore %20 %53 
					                                      f32_4 %54 = OpLoad %25 
					                                      f32_4 %55 = OpLoad %20 
					                                      f32_4 %56 = OpFAdd %54 %55 
					                                                    OpStore %25 %56 
					                 read_only Texture2DSampled %57 = OpLoad %13 
					                                      f32_2 %59 = OpLoad %58 
					                                      f32_4 %60 = OpImageSampleImplicitLod %57 %59 
					                                                    OpStore %20 %60 
					                                      f32_4 %61 = OpLoad %25 
					                                      f32_4 %62 = OpLoad %20 
					                                      f32_4 %63 = OpFAdd %61 %62 
					                                                    OpStore %25 %63 
					                                      f32_4 %64 = OpLoad %25 
					                                      f32_4 %67 = OpFMul %64 %66 
					                             Uniform f32_2* %74 = OpAccessChain %70 %72 
					                                      f32_2 %75 = OpLoad %74 
					                                      f32_4 %76 = OpVectorShuffle %75 %75 0 0 0 0 
					                                      f32_4 %77 = OpFNegate %76 
					                                      f32_4 %78 = OpFAdd %67 %77 
					                                                    OpStore %25 %78 
					                                      f32_4 %79 = OpLoad %25 
					                                      f32_4 %82 = OpExtInst %1 40 %79 %81 
					                                                    OpStore %25 %82 
					                                      f32_4 %86 = OpLoad %25 
					                                      f32_3 %87 = OpVectorShuffle %86 %86 0 1 2 
					                                        f32 %92 = OpDot %87 %91 
					                               Private f32* %96 = OpAccessChain %85 %94 
					                                                    OpStore %96 %92 
					                                      f32_4 %98 = OpLoad %25 
					                                      f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
					                                     f32_3 %100 = OpLoad %85 
					                                     f32_3 %101 = OpVectorShuffle %100 %100 0 0 0 
					                                     f32_3 %102 = OpFNegate %101 
					                                     f32_3 %103 = OpFAdd %99 %102 
					                                                    OpStore %97 %103 
					                              Private f32* %107 = OpAccessChain %25 %106 
					                                       f32 %108 = OpLoad %107 
					                               Output f32* %110 = OpAccessChain %105 %106 
					                                                    OpStore %110 %108 
					                              Uniform f32* %113 = OpAccessChain %70 %111 
					                                       f32 %114 = OpLoad %113 
					                              Uniform f32* %115 = OpAccessChain %70 %111 
					                                       f32 %116 = OpLoad %115 
					                              Uniform f32* %117 = OpAccessChain %70 %111 
					                                       f32 %118 = OpLoad %117 
					                                     f32_3 %119 = OpCompositeConstruct %114 %116 %118 
					                                       f32 %120 = OpCompositeExtract %119 0 
					                                       f32 %121 = OpCompositeExtract %119 1 
					                                       f32 %122 = OpCompositeExtract %119 2 
					                                     f32_3 %123 = OpCompositeConstruct %120 %121 %122 
					                                     f32_3 %124 = OpLoad %97 
					                                     f32_3 %125 = OpFMul %123 %124 
					                                     f32_3 %126 = OpLoad %85 
					                                     f32_3 %127 = OpVectorShuffle %126 %126 0 0 0 
					                                     f32_3 %128 = OpFAdd %125 %127 
					                                                    OpStore %85 %128 
					                                     f32_3 %129 = OpLoad %85 
					                            Uniform f32_4* %132 = OpAccessChain %70 %130 
					                                     f32_4 %133 = OpLoad %132 
					                                     f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
					                                     f32_3 %135 = OpFMul %129 %134 
					                                     f32_4 %136 = OpLoad %105 
					                                     f32_4 %137 = OpVectorShuffle %136 %135 4 5 6 3 
					                                                    OpStore %105 %137 
					                                                    OpReturn
					                                                    OpFunctionEnd
"
				}
				SubProgram "vulkan hw_tier01 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 143
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %11 %79 %85 %87 %98 %105 %111 %118 %124 %131 
					                                                      OpDecorate %11 Location 11 
					                                                      OpDecorate %16 ArrayStride 16 
					                                                      OpDecorate %17 ArrayStride 17 
					                                                      OpMemberDecorate %18 0 Offset 18 
					                                                      OpMemberDecorate %18 1 Offset 18 
					                                                      OpMemberDecorate %18 2 RelaxedPrecision 
					                                                      OpMemberDecorate %18 2 Offset 18 
					                                                      OpMemberDecorate %18 3 RelaxedPrecision 
					                                                      OpMemberDecorate %18 3 Offset 18 
					                                                      OpDecorate %18 Block 
					                                                      OpDecorate %20 DescriptorSet 20 
					                                                      OpDecorate %20 Binding 20 
					                                                      OpMemberDecorate %77 0 BuiltIn 77 
					                                                      OpMemberDecorate %77 1 BuiltIn 77 
					                                                      OpMemberDecorate %77 2 BuiltIn 77 
					                                                      OpDecorate %77 Block 
					                                                      OpDecorate %85 RelaxedPrecision 
					                                                      OpDecorate %85 Location 85 
					                                                      OpDecorate %87 RelaxedPrecision 
					                                                      OpDecorate %87 Location 87 
					                                                      OpDecorate %88 RelaxedPrecision 
					                                                      OpDecorate %90 RelaxedPrecision 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %93 RelaxedPrecision 
					                                                      OpDecorate %95 RelaxedPrecision 
					                                                      OpDecorate %96 RelaxedPrecision 
					                                                      OpDecorate %97 RelaxedPrecision 
					                                                      OpDecorate %98 RelaxedPrecision 
					                                                      OpDecorate %98 Location 98 
					                                                      OpDecorate %99 RelaxedPrecision 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %104 RelaxedPrecision 
					                                                      OpDecorate %105 RelaxedPrecision 
					                                                      OpDecorate %105 Location 105 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate %107 RelaxedPrecision 
					                                                      OpDecorate %108 RelaxedPrecision 
					                                                      OpDecorate %109 RelaxedPrecision 
					                                                      OpDecorate %110 RelaxedPrecision 
					                                                      OpDecorate %111 RelaxedPrecision 
					                                                      OpDecorate %111 Location 111 
					                                                      OpDecorate %112 RelaxedPrecision 
					                                                      OpDecorate %115 RelaxedPrecision 
					                                                      OpDecorate %116 RelaxedPrecision 
					                                                      OpDecorate %117 RelaxedPrecision 
					                                                      OpDecorate %118 RelaxedPrecision 
					                                                      OpDecorate %118 Location 118 
					                                                      OpDecorate %119 RelaxedPrecision 
					                                                      OpDecorate %120 RelaxedPrecision 
					                                                      OpDecorate %121 RelaxedPrecision 
					                                                      OpDecorate %122 RelaxedPrecision 
					                                                      OpDecorate %123 RelaxedPrecision 
					                                                      OpDecorate %124 RelaxedPrecision 
					                                                      OpDecorate %124 Location 124 
					                                                      OpDecorate %125 RelaxedPrecision 
					                                                      OpDecorate %128 RelaxedPrecision 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %130 RelaxedPrecision 
					                                                      OpDecorate %131 RelaxedPrecision 
					                                                      OpDecorate %131 Location 131 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %133 RelaxedPrecision 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
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
					                                              %18 = OpTypeStruct %16 %17 %7 %7 
					                                              %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4;}* %20 = OpVariable Uniform 
					                                              %21 = OpTypeInt 32 1 
					                                          i32 %22 = OpConstant 0 
					                                          i32 %23 = OpConstant 1 
					                                              %24 = OpTypePointer Uniform %7 
					                                          i32 %35 = OpConstant 2 
					                                          i32 %44 = OpConstant 3 
					                               Private f32_4* %48 = OpVariable Private 
					                                          u32 %75 = OpConstant 1 
					                                              %76 = OpTypeArray %6 %75 
					                                              %77 = OpTypeStruct %7 %6 %76 
					                                              %78 = OpTypePointer Output %77 
					         Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
					                                              %81 = OpTypePointer Output %7 
					                                              %83 = OpTypeVector %6 2 
					                                              %84 = OpTypePointer Output %83 
					                                Output f32_2* %85 = OpVariable Output 
					                                              %86 = OpTypePointer Input %83 
					                                 Input f32_2* %87 = OpVariable Input 
					                                              %89 = OpTypePointer Private %83 
					                               Private f32_2* %90 = OpVariable Private 
					                                Output f32_2* %98 = OpVariable Output 
					                                         f32 %100 = OpConstant 3.674022E-40 
					                                       f32_2 %101 = OpConstantComposite %100 %100 
					                               Output f32_2* %105 = OpVariable Output 
					                               Output f32_2* %111 = OpVariable Output 
					                                         f32 %113 = OpConstant 3.674022E-40 
					                                       f32_2 %114 = OpConstantComposite %113 %113 
					                               Output f32_2* %118 = OpVariable Output 
					                               Output f32_2* %124 = OpVariable Output 
					                                         f32 %126 = OpConstant 3.674022E-40 
					                                       f32_2 %127 = OpConstantComposite %126 %126 
					                               Output f32_2* %131 = OpVariable Output 
					                                             %137 = OpTypePointer Output %6 
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
					                               Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
					                                        f32_4 %69 = OpLoad %68 
					                                        f32_4 %70 = OpLoad %9 
					                                        f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
					                                        f32_4 %72 = OpFMul %69 %71 
					                                        f32_4 %73 = OpLoad %48 
					                                        f32_4 %74 = OpFAdd %72 %73 
					                                                      OpStore %9 %74 
					                                        f32_4 %80 = OpLoad %9 
					                                Output f32_4* %82 = OpAccessChain %79 %22 
					                                                      OpStore %82 %80 
					                                        f32_2 %88 = OpLoad %87 
					                                                      OpStore %85 %88 
					                               Uniform f32_4* %91 = OpAccessChain %20 %35 
					                                        f32_4 %92 = OpLoad %91 
					                                        f32_2 %93 = OpVectorShuffle %92 %92 0 1 
					                               Uniform f32_4* %94 = OpAccessChain %20 %44 
					                                        f32_4 %95 = OpLoad %94 
					                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
					                                        f32_2 %97 = OpFMul %93 %96 
					                                                      OpStore %90 %97 
					                                        f32_2 %99 = OpLoad %90 
					                                       f32_2 %102 = OpFMul %99 %101 
					                                       f32_2 %103 = OpLoad %87 
					                                       f32_2 %104 = OpFAdd %102 %103 
					                                                      OpStore %98 %104 
					                                       f32_2 %106 = OpLoad %90 
					                                       f32_2 %107 = OpFNegate %106 
					                                       f32_2 %108 = OpFMul %107 %101 
					                                       f32_2 %109 = OpLoad %87 
					                                       f32_2 %110 = OpFAdd %108 %109 
					                                                      OpStore %105 %110 
					                                       f32_2 %112 = OpLoad %90 
					                                       f32_2 %115 = OpFMul %112 %114 
					                                       f32_2 %116 = OpLoad %87 
					                                       f32_2 %117 = OpFAdd %115 %116 
					                                                      OpStore %111 %117 
					                                       f32_2 %119 = OpLoad %90 
					                                       f32_2 %120 = OpFNegate %119 
					                                       f32_2 %121 = OpFMul %120 %114 
					                                       f32_2 %122 = OpLoad %87 
					                                       f32_2 %123 = OpFAdd %121 %122 
					                                                      OpStore %118 %123 
					                                       f32_2 %125 = OpLoad %90 
					                                       f32_2 %128 = OpFMul %125 %127 
					                                       f32_2 %129 = OpLoad %87 
					                                       f32_2 %130 = OpFAdd %128 %129 
					                                                      OpStore %124 %130 
					                                       f32_2 %132 = OpLoad %90 
					                                       f32_2 %133 = OpFNegate %132 
					                                       f32_2 %134 = OpFMul %133 %127 
					                                       f32_2 %135 = OpLoad %87 
					                                       f32_2 %136 = OpFAdd %134 %135 
					                                                      OpStore %131 %136 
					                                 Output f32* %138 = OpAccessChain %79 %22 %75 
					                                         f32 %139 = OpLoad %138 
					                                         f32 %140 = OpFNegate %139 
					                                 Output f32* %141 = OpAccessChain %79 %22 %75 
					                                                      OpStore %141 %140 
					                                                      OpReturn
					                                                      OpFunctionEnd

					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 139
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %22 %30 %37 %44 %51 %58 %105 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %18 RelaxedPrecision 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %22 Location 22 
					                                                    OpDecorate %23 RelaxedPrecision 
					                                                    OpDecorate %25 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %28 RelaxedPrecision 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %30 RelaxedPrecision 
					                                                    OpDecorate %30 Location 30 
					                                                    OpDecorate %31 RelaxedPrecision 
					                                                    OpDecorate %33 RelaxedPrecision 
					                                                    OpDecorate %34 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %37 Location 37 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %40 RelaxedPrecision 
					                                                    OpDecorate %41 RelaxedPrecision 
					                                                    OpDecorate %42 RelaxedPrecision 
					                                                    OpDecorate %43 RelaxedPrecision 
					                                                    OpDecorate %44 RelaxedPrecision 
					                                                    OpDecorate %44 Location 44 
					                                                    OpDecorate %45 RelaxedPrecision 
					                                                    OpDecorate %47 RelaxedPrecision 
					                                                    OpDecorate %48 RelaxedPrecision 
					                                                    OpDecorate %49 RelaxedPrecision 
					                                                    OpDecorate %50 RelaxedPrecision 
					                                                    OpDecorate %51 RelaxedPrecision 
					                                                    OpDecorate %51 Location 51 
					                                                    OpDecorate %52 RelaxedPrecision 
					                                                    OpDecorate %54 RelaxedPrecision 
					                                                    OpDecorate %55 RelaxedPrecision 
					                                                    OpDecorate %56 RelaxedPrecision 
					                                                    OpDecorate %57 RelaxedPrecision 
					                                                    OpDecorate %58 RelaxedPrecision 
					                                                    OpDecorate %58 Location 58 
					                                                    OpDecorate %59 RelaxedPrecision 
					                                                    OpDecorate %61 RelaxedPrecision 
					                                                    OpDecorate %62 RelaxedPrecision 
					                                                    OpDecorate %63 RelaxedPrecision 
					                                                    OpDecorate %64 RelaxedPrecision 
					                                                    OpDecorate %67 RelaxedPrecision 
					                                                    OpMemberDecorate %68 0 RelaxedPrecision 
					                                                    OpMemberDecorate %68 0 Offset 68 
					                                                    OpMemberDecorate %68 1 RelaxedPrecision 
					                                                    OpMemberDecorate %68 1 Offset 68 
					                                                    OpMemberDecorate %68 2 RelaxedPrecision 
					                                                    OpMemberDecorate %68 2 Offset 68 
					                                                    OpDecorate %68 Block 
					                                                    OpDecorate %70 DescriptorSet 70 
					                                                    OpDecorate %70 Binding 70 
					                                                    OpDecorate %75 RelaxedPrecision 
					                                                    OpDecorate %76 RelaxedPrecision 
					                                                    OpDecorate %77 RelaxedPrecision 
					                                                    OpDecorate %78 RelaxedPrecision 
					                                                    OpDecorate %79 RelaxedPrecision 
					                                                    OpDecorate %82 RelaxedPrecision 
					                                                    OpDecorate %85 RelaxedPrecision 
					                                                    OpDecorate %86 RelaxedPrecision 
					                                                    OpDecorate %87 RelaxedPrecision 
					                                                    OpDecorate %92 RelaxedPrecision 
					                                                    OpDecorate %97 RelaxedPrecision 
					                                                    OpDecorate %98 RelaxedPrecision 
					                                                    OpDecorate %99 RelaxedPrecision 
					                                                    OpDecorate %100 RelaxedPrecision 
					                                                    OpDecorate %101 RelaxedPrecision 
					                                                    OpDecorate %102 RelaxedPrecision 
					                                                    OpDecorate %103 RelaxedPrecision 
					                                                    OpDecorate %105 RelaxedPrecision 
					                                                    OpDecorate %105 Location 105 
					                                                    OpDecorate %108 RelaxedPrecision 
					                                                    OpDecorate %114 RelaxedPrecision 
					                                                    OpDecorate %116 RelaxedPrecision 
					                                                    OpDecorate %118 RelaxedPrecision 
					                                                    OpDecorate %119 RelaxedPrecision 
					                                                    OpDecorate %120 RelaxedPrecision 
					                                                    OpDecorate %121 RelaxedPrecision 
					                                                    OpDecorate %122 RelaxedPrecision 
					                                                    OpDecorate %123 RelaxedPrecision 
					                                                    OpDecorate %124 RelaxedPrecision 
					                                                    OpDecorate %125 RelaxedPrecision 
					                                                    OpDecorate %126 RelaxedPrecision 
					                                                    OpDecorate %127 RelaxedPrecision 
					                                                    OpDecorate %128 RelaxedPrecision 
					                                                    OpDecorate %129 RelaxedPrecision 
					                                                    OpDecorate %133 RelaxedPrecision 
					                                                    OpDecorate %134 RelaxedPrecision 
					                                                    OpDecorate %135 RelaxedPrecision 
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
					                               Input f32_2* %22 = OpVariable Input 
					                             Private f32_4* %25 = OpVariable Private 
					                               Input f32_2* %30 = OpVariable Input 
					                               Input f32_2* %37 = OpVariable Input 
					                               Input f32_2* %44 = OpVariable Input 
					                               Input f32_2* %51 = OpVariable Input 
					                               Input f32_2* %58 = OpVariable Input 
					                                        f32 %65 = OpConstant 3.674022E-40 
					                                      f32_4 %66 = OpConstantComposite %65 %65 %65 %65 
					                                            %68 = OpTypeStruct %7 %15 %6 
					                                            %69 = OpTypePointer Uniform %68 
					       Uniform struct {f32_4; f32_2; f32;}* %70 = OpVariable Uniform 
					                                            %71 = OpTypeInt 32 1 
					                                        i32 %72 = OpConstant 1 
					                                            %73 = OpTypePointer Uniform %15 
					                                        f32 %80 = OpConstant 3.674022E-40 
					                                      f32_4 %81 = OpConstantComposite %80 %80 %80 %80 
					                                            %83 = OpTypeVector %6 3 
					                                            %84 = OpTypePointer Private %83 
					                             Private f32_3* %85 = OpVariable Private 
					                                        f32 %88 = OpConstant 3.674022E-40 
					                                        f32 %89 = OpConstant 3.674022E-40 
					                                        f32 %90 = OpConstant 3.674022E-40 
					                                      f32_3 %91 = OpConstantComposite %88 %89 %90 
					                                            %93 = OpTypeInt 32 0 
					                                        u32 %94 = OpConstant 0 
					                                            %95 = OpTypePointer Private %6 
					                             Private f32_3* %97 = OpVariable Private 
					                                           %104 = OpTypePointer Output %7 
					                             Output f32_4* %105 = OpVariable Output 
					                                       u32 %106 = OpConstant 3 
					                                           %109 = OpTypePointer Output %6 
					                                       i32 %111 = OpConstant 2 
					                                           %112 = OpTypePointer Uniform %6 
					                                       i32 %130 = OpConstant 0 
					                                           %131 = OpTypePointer Uniform %7 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                 read_only Texture2DSampled %21 = OpLoad %13 
					                                      f32_2 %23 = OpLoad %22 
					                                      f32_4 %24 = OpImageSampleImplicitLod %21 %23 
					                                                    OpStore %20 %24 
					                                      f32_4 %26 = OpLoad %9 
					                                      f32_4 %27 = OpLoad %20 
					                                      f32_4 %28 = OpFAdd %26 %27 
					                                                    OpStore %25 %28 
					                 read_only Texture2DSampled %29 = OpLoad %13 
					                                      f32_2 %31 = OpLoad %30 
					                                      f32_4 %32 = OpImageSampleImplicitLod %29 %31 
					                                                    OpStore %20 %32 
					                                      f32_4 %33 = OpLoad %25 
					                                      f32_4 %34 = OpLoad %20 
					                                      f32_4 %35 = OpFAdd %33 %34 
					                                                    OpStore %25 %35 
					                 read_only Texture2DSampled %36 = OpLoad %13 
					                                      f32_2 %38 = OpLoad %37 
					                                      f32_4 %39 = OpImageSampleImplicitLod %36 %38 
					                                                    OpStore %20 %39 
					                                      f32_4 %40 = OpLoad %25 
					                                      f32_4 %41 = OpLoad %20 
					                                      f32_4 %42 = OpFAdd %40 %41 
					                                                    OpStore %25 %42 
					                 read_only Texture2DSampled %43 = OpLoad %13 
					                                      f32_2 %45 = OpLoad %44 
					                                      f32_4 %46 = OpImageSampleImplicitLod %43 %45 
					                                                    OpStore %20 %46 
					                                      f32_4 %47 = OpLoad %25 
					                                      f32_4 %48 = OpLoad %20 
					                                      f32_4 %49 = OpFAdd %47 %48 
					                                                    OpStore %25 %49 
					                 read_only Texture2DSampled %50 = OpLoad %13 
					                                      f32_2 %52 = OpLoad %51 
					                                      f32_4 %53 = OpImageSampleImplicitLod %50 %52 
					                                                    OpStore %20 %53 
					                                      f32_4 %54 = OpLoad %25 
					                                      f32_4 %55 = OpLoad %20 
					                                      f32_4 %56 = OpFAdd %54 %55 
					                                                    OpStore %25 %56 
					                 read_only Texture2DSampled %57 = OpLoad %13 
					                                      f32_2 %59 = OpLoad %58 
					                                      f32_4 %60 = OpImageSampleImplicitLod %57 %59 
					                                                    OpStore %20 %60 
					                                      f32_4 %61 = OpLoad %25 
					                                      f32_4 %62 = OpLoad %20 
					                                      f32_4 %63 = OpFAdd %61 %62 
					                                                    OpStore %25 %63 
					                                      f32_4 %64 = OpLoad %25 
					                                      f32_4 %67 = OpFMul %64 %66 
					                             Uniform f32_2* %74 = OpAccessChain %70 %72 
					                                      f32_2 %75 = OpLoad %74 
					                                      f32_4 %76 = OpVectorShuffle %75 %75 0 0 0 0 
					                                      f32_4 %77 = OpFNegate %76 
					                                      f32_4 %78 = OpFAdd %67 %77 
					                                                    OpStore %25 %78 
					                                      f32_4 %79 = OpLoad %25 
					                                      f32_4 %82 = OpExtInst %1 40 %79 %81 
					                                                    OpStore %25 %82 
					                                      f32_4 %86 = OpLoad %25 
					                                      f32_3 %87 = OpVectorShuffle %86 %86 0 1 2 
					                                        f32 %92 = OpDot %87 %91 
					                               Private f32* %96 = OpAccessChain %85 %94 
					                                                    OpStore %96 %92 
					                                      f32_4 %98 = OpLoad %25 
					                                      f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
					                                     f32_3 %100 = OpLoad %85 
					                                     f32_3 %101 = OpVectorShuffle %100 %100 0 0 0 
					                                     f32_3 %102 = OpFNegate %101 
					                                     f32_3 %103 = OpFAdd %99 %102 
					                                                    OpStore %97 %103 
					                              Private f32* %107 = OpAccessChain %25 %106 
					                                       f32 %108 = OpLoad %107 
					                               Output f32* %110 = OpAccessChain %105 %106 
					                                                    OpStore %110 %108 
					                              Uniform f32* %113 = OpAccessChain %70 %111 
					                                       f32 %114 = OpLoad %113 
					                              Uniform f32* %115 = OpAccessChain %70 %111 
					                                       f32 %116 = OpLoad %115 
					                              Uniform f32* %117 = OpAccessChain %70 %111 
					                                       f32 %118 = OpLoad %117 
					                                     f32_3 %119 = OpCompositeConstruct %114 %116 %118 
					                                       f32 %120 = OpCompositeExtract %119 0 
					                                       f32 %121 = OpCompositeExtract %119 1 
					                                       f32 %122 = OpCompositeExtract %119 2 
					                                     f32_3 %123 = OpCompositeConstruct %120 %121 %122 
					                                     f32_3 %124 = OpLoad %97 
					                                     f32_3 %125 = OpFMul %123 %124 
					                                     f32_3 %126 = OpLoad %85 
					                                     f32_3 %127 = OpVectorShuffle %126 %126 0 0 0 
					                                     f32_3 %128 = OpFAdd %125 %127 
					                                                    OpStore %85 %128 
					                                     f32_3 %129 = OpLoad %85 
					                            Uniform f32_4* %132 = OpAccessChain %70 %130 
					                                     f32_4 %133 = OpLoad %132 
					                                     f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
					                                     f32_3 %135 = OpFMul %129 %134 
					                                     f32_4 %136 = OpLoad %105 
					                                     f32_4 %137 = OpVectorShuffle %136 %135 4 5 6 3 
					                                                    OpStore %105 %137 
					                                                    OpReturn
					                                                    OpFunctionEnd
"
				}
				SubProgram "vulkan hw_tier02 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 143
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %11 %79 %85 %87 %98 %105 %111 %118 %124 %131 
					                                                      OpDecorate %11 Location 11 
					                                                      OpDecorate %16 ArrayStride 16 
					                                                      OpDecorate %17 ArrayStride 17 
					                                                      OpMemberDecorate %18 0 Offset 18 
					                                                      OpMemberDecorate %18 1 Offset 18 
					                                                      OpMemberDecorate %18 2 RelaxedPrecision 
					                                                      OpMemberDecorate %18 2 Offset 18 
					                                                      OpMemberDecorate %18 3 RelaxedPrecision 
					                                                      OpMemberDecorate %18 3 Offset 18 
					                                                      OpDecorate %18 Block 
					                                                      OpDecorate %20 DescriptorSet 20 
					                                                      OpDecorate %20 Binding 20 
					                                                      OpMemberDecorate %77 0 BuiltIn 77 
					                                                      OpMemberDecorate %77 1 BuiltIn 77 
					                                                      OpMemberDecorate %77 2 BuiltIn 77 
					                                                      OpDecorate %77 Block 
					                                                      OpDecorate %85 RelaxedPrecision 
					                                                      OpDecorate %85 Location 85 
					                                                      OpDecorate %87 RelaxedPrecision 
					                                                      OpDecorate %87 Location 87 
					                                                      OpDecorate %88 RelaxedPrecision 
					                                                      OpDecorate %90 RelaxedPrecision 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %93 RelaxedPrecision 
					                                                      OpDecorate %95 RelaxedPrecision 
					                                                      OpDecorate %96 RelaxedPrecision 
					                                                      OpDecorate %97 RelaxedPrecision 
					                                                      OpDecorate %98 RelaxedPrecision 
					                                                      OpDecorate %98 Location 98 
					                                                      OpDecorate %99 RelaxedPrecision 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %104 RelaxedPrecision 
					                                                      OpDecorate %105 RelaxedPrecision 
					                                                      OpDecorate %105 Location 105 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate %107 RelaxedPrecision 
					                                                      OpDecorate %108 RelaxedPrecision 
					                                                      OpDecorate %109 RelaxedPrecision 
					                                                      OpDecorate %110 RelaxedPrecision 
					                                                      OpDecorate %111 RelaxedPrecision 
					                                                      OpDecorate %111 Location 111 
					                                                      OpDecorate %112 RelaxedPrecision 
					                                                      OpDecorate %115 RelaxedPrecision 
					                                                      OpDecorate %116 RelaxedPrecision 
					                                                      OpDecorate %117 RelaxedPrecision 
					                                                      OpDecorate %118 RelaxedPrecision 
					                                                      OpDecorate %118 Location 118 
					                                                      OpDecorate %119 RelaxedPrecision 
					                                                      OpDecorate %120 RelaxedPrecision 
					                                                      OpDecorate %121 RelaxedPrecision 
					                                                      OpDecorate %122 RelaxedPrecision 
					                                                      OpDecorate %123 RelaxedPrecision 
					                                                      OpDecorate %124 RelaxedPrecision 
					                                                      OpDecorate %124 Location 124 
					                                                      OpDecorate %125 RelaxedPrecision 
					                                                      OpDecorate %128 RelaxedPrecision 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %130 RelaxedPrecision 
					                                                      OpDecorate %131 RelaxedPrecision 
					                                                      OpDecorate %131 Location 131 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %133 RelaxedPrecision 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
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
					                                              %18 = OpTypeStruct %16 %17 %7 %7 
					                                              %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4;}* %20 = OpVariable Uniform 
					                                              %21 = OpTypeInt 32 1 
					                                          i32 %22 = OpConstant 0 
					                                          i32 %23 = OpConstant 1 
					                                              %24 = OpTypePointer Uniform %7 
					                                          i32 %35 = OpConstant 2 
					                                          i32 %44 = OpConstant 3 
					                               Private f32_4* %48 = OpVariable Private 
					                                          u32 %75 = OpConstant 1 
					                                              %76 = OpTypeArray %6 %75 
					                                              %77 = OpTypeStruct %7 %6 %76 
					                                              %78 = OpTypePointer Output %77 
					         Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
					                                              %81 = OpTypePointer Output %7 
					                                              %83 = OpTypeVector %6 2 
					                                              %84 = OpTypePointer Output %83 
					                                Output f32_2* %85 = OpVariable Output 
					                                              %86 = OpTypePointer Input %83 
					                                 Input f32_2* %87 = OpVariable Input 
					                                              %89 = OpTypePointer Private %83 
					                               Private f32_2* %90 = OpVariable Private 
					                                Output f32_2* %98 = OpVariable Output 
					                                         f32 %100 = OpConstant 3.674022E-40 
					                                       f32_2 %101 = OpConstantComposite %100 %100 
					                               Output f32_2* %105 = OpVariable Output 
					                               Output f32_2* %111 = OpVariable Output 
					                                         f32 %113 = OpConstant 3.674022E-40 
					                                       f32_2 %114 = OpConstantComposite %113 %113 
					                               Output f32_2* %118 = OpVariable Output 
					                               Output f32_2* %124 = OpVariable Output 
					                                         f32 %126 = OpConstant 3.674022E-40 
					                                       f32_2 %127 = OpConstantComposite %126 %126 
					                               Output f32_2* %131 = OpVariable Output 
					                                             %137 = OpTypePointer Output %6 
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
					                               Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
					                                        f32_4 %69 = OpLoad %68 
					                                        f32_4 %70 = OpLoad %9 
					                                        f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
					                                        f32_4 %72 = OpFMul %69 %71 
					                                        f32_4 %73 = OpLoad %48 
					                                        f32_4 %74 = OpFAdd %72 %73 
					                                                      OpStore %9 %74 
					                                        f32_4 %80 = OpLoad %9 
					                                Output f32_4* %82 = OpAccessChain %79 %22 
					                                                      OpStore %82 %80 
					                                        f32_2 %88 = OpLoad %87 
					                                                      OpStore %85 %88 
					                               Uniform f32_4* %91 = OpAccessChain %20 %35 
					                                        f32_4 %92 = OpLoad %91 
					                                        f32_2 %93 = OpVectorShuffle %92 %92 0 1 
					                               Uniform f32_4* %94 = OpAccessChain %20 %44 
					                                        f32_4 %95 = OpLoad %94 
					                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
					                                        f32_2 %97 = OpFMul %93 %96 
					                                                      OpStore %90 %97 
					                                        f32_2 %99 = OpLoad %90 
					                                       f32_2 %102 = OpFMul %99 %101 
					                                       f32_2 %103 = OpLoad %87 
					                                       f32_2 %104 = OpFAdd %102 %103 
					                                                      OpStore %98 %104 
					                                       f32_2 %106 = OpLoad %90 
					                                       f32_2 %107 = OpFNegate %106 
					                                       f32_2 %108 = OpFMul %107 %101 
					                                       f32_2 %109 = OpLoad %87 
					                                       f32_2 %110 = OpFAdd %108 %109 
					                                                      OpStore %105 %110 
					                                       f32_2 %112 = OpLoad %90 
					                                       f32_2 %115 = OpFMul %112 %114 
					                                       f32_2 %116 = OpLoad %87 
					                                       f32_2 %117 = OpFAdd %115 %116 
					                                                      OpStore %111 %117 
					                                       f32_2 %119 = OpLoad %90 
					                                       f32_2 %120 = OpFNegate %119 
					                                       f32_2 %121 = OpFMul %120 %114 
					                                       f32_2 %122 = OpLoad %87 
					                                       f32_2 %123 = OpFAdd %121 %122 
					                                                      OpStore %118 %123 
					                                       f32_2 %125 = OpLoad %90 
					                                       f32_2 %128 = OpFMul %125 %127 
					                                       f32_2 %129 = OpLoad %87 
					                                       f32_2 %130 = OpFAdd %128 %129 
					                                                      OpStore %124 %130 
					                                       f32_2 %132 = OpLoad %90 
					                                       f32_2 %133 = OpFNegate %132 
					                                       f32_2 %134 = OpFMul %133 %127 
					                                       f32_2 %135 = OpLoad %87 
					                                       f32_2 %136 = OpFAdd %134 %135 
					                                                      OpStore %131 %136 
					                                 Output f32* %138 = OpAccessChain %79 %22 %75 
					                                         f32 %139 = OpLoad %138 
					                                         f32 %140 = OpFNegate %139 
					                                 Output f32* %141 = OpAccessChain %79 %22 %75 
					                                                      OpStore %141 %140 
					                                                      OpReturn
					                                                      OpFunctionEnd

					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 139
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %22 %30 %37 %44 %51 %58 %105 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %18 RelaxedPrecision 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %22 Location 22 
					                                                    OpDecorate %23 RelaxedPrecision 
					                                                    OpDecorate %25 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %28 RelaxedPrecision 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %30 RelaxedPrecision 
					                                                    OpDecorate %30 Location 30 
					                                                    OpDecorate %31 RelaxedPrecision 
					                                                    OpDecorate %33 RelaxedPrecision 
					                                                    OpDecorate %34 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %37 Location 37 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %40 RelaxedPrecision 
					                                                    OpDecorate %41 RelaxedPrecision 
					                                                    OpDecorate %42 RelaxedPrecision 
					                                                    OpDecorate %43 RelaxedPrecision 
					                                                    OpDecorate %44 RelaxedPrecision 
					                                                    OpDecorate %44 Location 44 
					                                                    OpDecorate %45 RelaxedPrecision 
					                                                    OpDecorate %47 RelaxedPrecision 
					                                                    OpDecorate %48 RelaxedPrecision 
					                                                    OpDecorate %49 RelaxedPrecision 
					                                                    OpDecorate %50 RelaxedPrecision 
					                                                    OpDecorate %51 RelaxedPrecision 
					                                                    OpDecorate %51 Location 51 
					                                                    OpDecorate %52 RelaxedPrecision 
					                                                    OpDecorate %54 RelaxedPrecision 
					                                                    OpDecorate %55 RelaxedPrecision 
					                                                    OpDecorate %56 RelaxedPrecision 
					                                                    OpDecorate %57 RelaxedPrecision 
					                                                    OpDecorate %58 RelaxedPrecision 
					                                                    OpDecorate %58 Location 58 
					                                                    OpDecorate %59 RelaxedPrecision 
					                                                    OpDecorate %61 RelaxedPrecision 
					                                                    OpDecorate %62 RelaxedPrecision 
					                                                    OpDecorate %63 RelaxedPrecision 
					                                                    OpDecorate %64 RelaxedPrecision 
					                                                    OpDecorate %67 RelaxedPrecision 
					                                                    OpMemberDecorate %68 0 RelaxedPrecision 
					                                                    OpMemberDecorate %68 0 Offset 68 
					                                                    OpMemberDecorate %68 1 RelaxedPrecision 
					                                                    OpMemberDecorate %68 1 Offset 68 
					                                                    OpMemberDecorate %68 2 RelaxedPrecision 
					                                                    OpMemberDecorate %68 2 Offset 68 
					                                                    OpDecorate %68 Block 
					                                                    OpDecorate %70 DescriptorSet 70 
					                                                    OpDecorate %70 Binding 70 
					                                                    OpDecorate %75 RelaxedPrecision 
					                                                    OpDecorate %76 RelaxedPrecision 
					                                                    OpDecorate %77 RelaxedPrecision 
					                                                    OpDecorate %78 RelaxedPrecision 
					                                                    OpDecorate %79 RelaxedPrecision 
					                                                    OpDecorate %82 RelaxedPrecision 
					                                                    OpDecorate %85 RelaxedPrecision 
					                                                    OpDecorate %86 RelaxedPrecision 
					                                                    OpDecorate %87 RelaxedPrecision 
					                                                    OpDecorate %92 RelaxedPrecision 
					                                                    OpDecorate %97 RelaxedPrecision 
					                                                    OpDecorate %98 RelaxedPrecision 
					                                                    OpDecorate %99 RelaxedPrecision 
					                                                    OpDecorate %100 RelaxedPrecision 
					                                                    OpDecorate %101 RelaxedPrecision 
					                                                    OpDecorate %102 RelaxedPrecision 
					                                                    OpDecorate %103 RelaxedPrecision 
					                                                    OpDecorate %105 RelaxedPrecision 
					                                                    OpDecorate %105 Location 105 
					                                                    OpDecorate %108 RelaxedPrecision 
					                                                    OpDecorate %114 RelaxedPrecision 
					                                                    OpDecorate %116 RelaxedPrecision 
					                                                    OpDecorate %118 RelaxedPrecision 
					                                                    OpDecorate %119 RelaxedPrecision 
					                                                    OpDecorate %120 RelaxedPrecision 
					                                                    OpDecorate %121 RelaxedPrecision 
					                                                    OpDecorate %122 RelaxedPrecision 
					                                                    OpDecorate %123 RelaxedPrecision 
					                                                    OpDecorate %124 RelaxedPrecision 
					                                                    OpDecorate %125 RelaxedPrecision 
					                                                    OpDecorate %126 RelaxedPrecision 
					                                                    OpDecorate %127 RelaxedPrecision 
					                                                    OpDecorate %128 RelaxedPrecision 
					                                                    OpDecorate %129 RelaxedPrecision 
					                                                    OpDecorate %133 RelaxedPrecision 
					                                                    OpDecorate %134 RelaxedPrecision 
					                                                    OpDecorate %135 RelaxedPrecision 
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
					                               Input f32_2* %22 = OpVariable Input 
					                             Private f32_4* %25 = OpVariable Private 
					                               Input f32_2* %30 = OpVariable Input 
					                               Input f32_2* %37 = OpVariable Input 
					                               Input f32_2* %44 = OpVariable Input 
					                               Input f32_2* %51 = OpVariable Input 
					                               Input f32_2* %58 = OpVariable Input 
					                                        f32 %65 = OpConstant 3.674022E-40 
					                                      f32_4 %66 = OpConstantComposite %65 %65 %65 %65 
					                                            %68 = OpTypeStruct %7 %15 %6 
					                                            %69 = OpTypePointer Uniform %68 
					       Uniform struct {f32_4; f32_2; f32;}* %70 = OpVariable Uniform 
					                                            %71 = OpTypeInt 32 1 
					                                        i32 %72 = OpConstant 1 
					                                            %73 = OpTypePointer Uniform %15 
					                                        f32 %80 = OpConstant 3.674022E-40 
					                                      f32_4 %81 = OpConstantComposite %80 %80 %80 %80 
					                                            %83 = OpTypeVector %6 3 
					                                            %84 = OpTypePointer Private %83 
					                             Private f32_3* %85 = OpVariable Private 
					                                        f32 %88 = OpConstant 3.674022E-40 
					                                        f32 %89 = OpConstant 3.674022E-40 
					                                        f32 %90 = OpConstant 3.674022E-40 
					                                      f32_3 %91 = OpConstantComposite %88 %89 %90 
					                                            %93 = OpTypeInt 32 0 
					                                        u32 %94 = OpConstant 0 
					                                            %95 = OpTypePointer Private %6 
					                             Private f32_3* %97 = OpVariable Private 
					                                           %104 = OpTypePointer Output %7 
					                             Output f32_4* %105 = OpVariable Output 
					                                       u32 %106 = OpConstant 3 
					                                           %109 = OpTypePointer Output %6 
					                                       i32 %111 = OpConstant 2 
					                                           %112 = OpTypePointer Uniform %6 
					                                       i32 %130 = OpConstant 0 
					                                           %131 = OpTypePointer Uniform %7 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                 read_only Texture2DSampled %21 = OpLoad %13 
					                                      f32_2 %23 = OpLoad %22 
					                                      f32_4 %24 = OpImageSampleImplicitLod %21 %23 
					                                                    OpStore %20 %24 
					                                      f32_4 %26 = OpLoad %9 
					                                      f32_4 %27 = OpLoad %20 
					                                      f32_4 %28 = OpFAdd %26 %27 
					                                                    OpStore %25 %28 
					                 read_only Texture2DSampled %29 = OpLoad %13 
					                                      f32_2 %31 = OpLoad %30 
					                                      f32_4 %32 = OpImageSampleImplicitLod %29 %31 
					                                                    OpStore %20 %32 
					                                      f32_4 %33 = OpLoad %25 
					                                      f32_4 %34 = OpLoad %20 
					                                      f32_4 %35 = OpFAdd %33 %34 
					                                                    OpStore %25 %35 
					                 read_only Texture2DSampled %36 = OpLoad %13 
					                                      f32_2 %38 = OpLoad %37 
					                                      f32_4 %39 = OpImageSampleImplicitLod %36 %38 
					                                                    OpStore %20 %39 
					                                      f32_4 %40 = OpLoad %25 
					                                      f32_4 %41 = OpLoad %20 
					                                      f32_4 %42 = OpFAdd %40 %41 
					                                                    OpStore %25 %42 
					                 read_only Texture2DSampled %43 = OpLoad %13 
					                                      f32_2 %45 = OpLoad %44 
					                                      f32_4 %46 = OpImageSampleImplicitLod %43 %45 
					                                                    OpStore %20 %46 
					                                      f32_4 %47 = OpLoad %25 
					                                      f32_4 %48 = OpLoad %20 
					                                      f32_4 %49 = OpFAdd %47 %48 
					                                                    OpStore %25 %49 
					                 read_only Texture2DSampled %50 = OpLoad %13 
					                                      f32_2 %52 = OpLoad %51 
					                                      f32_4 %53 = OpImageSampleImplicitLod %50 %52 
					                                                    OpStore %20 %53 
					                                      f32_4 %54 = OpLoad %25 
					                                      f32_4 %55 = OpLoad %20 
					                                      f32_4 %56 = OpFAdd %54 %55 
					                                                    OpStore %25 %56 
					                 read_only Texture2DSampled %57 = OpLoad %13 
					                                      f32_2 %59 = OpLoad %58 
					                                      f32_4 %60 = OpImageSampleImplicitLod %57 %59 
					                                                    OpStore %20 %60 
					                                      f32_4 %61 = OpLoad %25 
					                                      f32_4 %62 = OpLoad %20 
					                                      f32_4 %63 = OpFAdd %61 %62 
					                                                    OpStore %25 %63 
					                                      f32_4 %64 = OpLoad %25 
					                                      f32_4 %67 = OpFMul %64 %66 
					                             Uniform f32_2* %74 = OpAccessChain %70 %72 
					                                      f32_2 %75 = OpLoad %74 
					                                      f32_4 %76 = OpVectorShuffle %75 %75 0 0 0 0 
					                                      f32_4 %77 = OpFNegate %76 
					                                      f32_4 %78 = OpFAdd %67 %77 
					                                                    OpStore %25 %78 
					                                      f32_4 %79 = OpLoad %25 
					                                      f32_4 %82 = OpExtInst %1 40 %79 %81 
					                                                    OpStore %25 %82 
					                                      f32_4 %86 = OpLoad %25 
					                                      f32_3 %87 = OpVectorShuffle %86 %86 0 1 2 
					                                        f32 %92 = OpDot %87 %91 
					                               Private f32* %96 = OpAccessChain %85 %94 
					                                                    OpStore %96 %92 
					                                      f32_4 %98 = OpLoad %25 
					                                      f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
					                                     f32_3 %100 = OpLoad %85 
					                                     f32_3 %101 = OpVectorShuffle %100 %100 0 0 0 
					                                     f32_3 %102 = OpFNegate %101 
					                                     f32_3 %103 = OpFAdd %99 %102 
					                                                    OpStore %97 %103 
					                              Private f32* %107 = OpAccessChain %25 %106 
					                                       f32 %108 = OpLoad %107 
					                               Output f32* %110 = OpAccessChain %105 %106 
					                                                    OpStore %110 %108 
					                              Uniform f32* %113 = OpAccessChain %70 %111 
					                                       f32 %114 = OpLoad %113 
					                              Uniform f32* %115 = OpAccessChain %70 %111 
					                                       f32 %116 = OpLoad %115 
					                              Uniform f32* %117 = OpAccessChain %70 %111 
					                                       f32 %118 = OpLoad %117 
					                                     f32_3 %119 = OpCompositeConstruct %114 %116 %118 
					                                       f32 %120 = OpCompositeExtract %119 0 
					                                       f32 %121 = OpCompositeExtract %119 1 
					                                       f32 %122 = OpCompositeExtract %119 2 
					                                     f32_3 %123 = OpCompositeConstruct %120 %121 %122 
					                                     f32_3 %124 = OpLoad %97 
					                                     f32_3 %125 = OpFMul %123 %124 
					                                     f32_3 %126 = OpLoad %85 
					                                     f32_3 %127 = OpVectorShuffle %126 %126 0 0 0 
					                                     f32_3 %128 = OpFAdd %125 %127 
					                                                    OpStore %85 %128 
					                                     f32_3 %129 = OpLoad %85 
					                            Uniform f32_4* %132 = OpAccessChain %70 %130 
					                                     f32_4 %133 = OpLoad %132 
					                                     f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
					                                     f32_3 %135 = OpFMul %129 %134 
					                                     f32_4 %136 = OpLoad %105 
					                                     f32_4 %137 = OpVectorShuffle %136 %135 4 5 6 3 
					                                                    OpStore %105 %137 
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
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 205534
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform mediump vec4 _Offsets;
					uniform mediump vec4 _MainTex_TexelSize;
					varying mediump vec2 xlv_TEXCOORD0;
					varying mediump vec2 xlv_TEXCOORD0_1;
					varying mediump vec2 xlv_TEXCOORD0_2;
					varying mediump vec2 xlv_TEXCOORD0_3;
					varying mediump vec2 xlv_TEXCOORD0_4;
					varying mediump vec2 xlv_TEXCOORD0_5;
					varying mediump vec2 xlv_TEXCOORD0_6;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  mediump vec2 tmpvar_2;
					  tmpvar_2 = (0.5 * _MainTex_TexelSize.xy);
					  mediump vec2 tmpvar_3;
					  tmpvar_3 = (1.5 * _MainTex_TexelSize.xy);
					  mediump vec2 tmpvar_4;
					  tmpvar_4 = (2.5 * _MainTex_TexelSize.xy);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  xlv_TEXCOORD0_1 = (_glesMultiTexCoord0.xy + (tmpvar_2 * _Offsets.xy));
					  xlv_TEXCOORD0_2 = (_glesMultiTexCoord0.xy - (tmpvar_2 * _Offsets.xy));
					  xlv_TEXCOORD0_3 = (_glesMultiTexCoord0.xy + (tmpvar_3 * _Offsets.xy));
					  xlv_TEXCOORD0_4 = (_glesMultiTexCoord0.xy - (tmpvar_3 * _Offsets.xy));
					  xlv_TEXCOORD0_5 = (_glesMultiTexCoord0.xy + (tmpvar_4 * _Offsets.xy));
					  xlv_TEXCOORD0_6 = (_glesMultiTexCoord0.xy - (tmpvar_4 * _Offsets.xy));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying mediump vec2 xlv_TEXCOORD0;
					varying mediump vec2 xlv_TEXCOORD0_1;
					varying mediump vec2 xlv_TEXCOORD0_2;
					varying mediump vec2 xlv_TEXCOORD0_3;
					varying mediump vec2 xlv_TEXCOORD0_4;
					varying mediump vec2 xlv_TEXCOORD0_5;
					varying mediump vec2 xlv_TEXCOORD0_6;
					void main ()
					{
					  mediump vec4 color_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  color_1 = tmpvar_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0_1);
					  color_1 = (color_1 + tmpvar_3);
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0_2);
					  color_1 = (color_1 + tmpvar_4);
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0_3);
					  color_1 = (color_1 + tmpvar_5);
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0_4);
					  color_1 = (color_1 + tmpvar_6);
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0_5);
					  color_1 = (color_1 + tmpvar_7);
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0_6);
					  color_1 = (color_1 + tmpvar_8);
					  gl_FragData[0] = (color_1 / (7.5 + dot (color_1.xyz, vec3(0.22, 0.707, 0.071))));
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
					uniform mediump vec4 _Offsets;
					uniform mediump vec4 _MainTex_TexelSize;
					varying mediump vec2 xlv_TEXCOORD0;
					varying mediump vec2 xlv_TEXCOORD0_1;
					varying mediump vec2 xlv_TEXCOORD0_2;
					varying mediump vec2 xlv_TEXCOORD0_3;
					varying mediump vec2 xlv_TEXCOORD0_4;
					varying mediump vec2 xlv_TEXCOORD0_5;
					varying mediump vec2 xlv_TEXCOORD0_6;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  mediump vec2 tmpvar_2;
					  tmpvar_2 = (0.5 * _MainTex_TexelSize.xy);
					  mediump vec2 tmpvar_3;
					  tmpvar_3 = (1.5 * _MainTex_TexelSize.xy);
					  mediump vec2 tmpvar_4;
					  tmpvar_4 = (2.5 * _MainTex_TexelSize.xy);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  xlv_TEXCOORD0_1 = (_glesMultiTexCoord0.xy + (tmpvar_2 * _Offsets.xy));
					  xlv_TEXCOORD0_2 = (_glesMultiTexCoord0.xy - (tmpvar_2 * _Offsets.xy));
					  xlv_TEXCOORD0_3 = (_glesMultiTexCoord0.xy + (tmpvar_3 * _Offsets.xy));
					  xlv_TEXCOORD0_4 = (_glesMultiTexCoord0.xy - (tmpvar_3 * _Offsets.xy));
					  xlv_TEXCOORD0_5 = (_glesMultiTexCoord0.xy + (tmpvar_4 * _Offsets.xy));
					  xlv_TEXCOORD0_6 = (_glesMultiTexCoord0.xy - (tmpvar_4 * _Offsets.xy));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying mediump vec2 xlv_TEXCOORD0;
					varying mediump vec2 xlv_TEXCOORD0_1;
					varying mediump vec2 xlv_TEXCOORD0_2;
					varying mediump vec2 xlv_TEXCOORD0_3;
					varying mediump vec2 xlv_TEXCOORD0_4;
					varying mediump vec2 xlv_TEXCOORD0_5;
					varying mediump vec2 xlv_TEXCOORD0_6;
					void main ()
					{
					  mediump vec4 color_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  color_1 = tmpvar_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0_1);
					  color_1 = (color_1 + tmpvar_3);
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0_2);
					  color_1 = (color_1 + tmpvar_4);
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0_3);
					  color_1 = (color_1 + tmpvar_5);
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0_4);
					  color_1 = (color_1 + tmpvar_6);
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0_5);
					  color_1 = (color_1 + tmpvar_7);
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0_6);
					  color_1 = (color_1 + tmpvar_8);
					  gl_FragData[0] = (color_1 / (7.5 + dot (color_1.xyz, vec3(0.22, 0.707, 0.071))));
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
					uniform mediump vec4 _Offsets;
					uniform mediump vec4 _MainTex_TexelSize;
					varying mediump vec2 xlv_TEXCOORD0;
					varying mediump vec2 xlv_TEXCOORD0_1;
					varying mediump vec2 xlv_TEXCOORD0_2;
					varying mediump vec2 xlv_TEXCOORD0_3;
					varying mediump vec2 xlv_TEXCOORD0_4;
					varying mediump vec2 xlv_TEXCOORD0_5;
					varying mediump vec2 xlv_TEXCOORD0_6;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  mediump vec2 tmpvar_2;
					  tmpvar_2 = (0.5 * _MainTex_TexelSize.xy);
					  mediump vec2 tmpvar_3;
					  tmpvar_3 = (1.5 * _MainTex_TexelSize.xy);
					  mediump vec2 tmpvar_4;
					  tmpvar_4 = (2.5 * _MainTex_TexelSize.xy);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  xlv_TEXCOORD0_1 = (_glesMultiTexCoord0.xy + (tmpvar_2 * _Offsets.xy));
					  xlv_TEXCOORD0_2 = (_glesMultiTexCoord0.xy - (tmpvar_2 * _Offsets.xy));
					  xlv_TEXCOORD0_3 = (_glesMultiTexCoord0.xy + (tmpvar_3 * _Offsets.xy));
					  xlv_TEXCOORD0_4 = (_glesMultiTexCoord0.xy - (tmpvar_3 * _Offsets.xy));
					  xlv_TEXCOORD0_5 = (_glesMultiTexCoord0.xy + (tmpvar_4 * _Offsets.xy));
					  xlv_TEXCOORD0_6 = (_glesMultiTexCoord0.xy - (tmpvar_4 * _Offsets.xy));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying mediump vec2 xlv_TEXCOORD0;
					varying mediump vec2 xlv_TEXCOORD0_1;
					varying mediump vec2 xlv_TEXCOORD0_2;
					varying mediump vec2 xlv_TEXCOORD0_3;
					varying mediump vec2 xlv_TEXCOORD0_4;
					varying mediump vec2 xlv_TEXCOORD0_5;
					varying mediump vec2 xlv_TEXCOORD0_6;
					void main ()
					{
					  mediump vec4 color_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  color_1 = tmpvar_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0_1);
					  color_1 = (color_1 + tmpvar_3);
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0_2);
					  color_1 = (color_1 + tmpvar_4);
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0_3);
					  color_1 = (color_1 + tmpvar_5);
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0_4);
					  color_1 = (color_1 + tmpvar_6);
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0_5);
					  color_1 = (color_1 + tmpvar_7);
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0_6);
					  color_1 = (color_1 + tmpvar_8);
					  gl_FragData[0] = (color_1 / (7.5 + dot (color_1.xyz, vec3(0.22, 0.707, 0.071))));
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	mediump vec4 _Offsets;
					uniform 	mediump vec4 _MainTex_TexelSize;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD1;
					out mediump vec2 vs_TEXCOORD2;
					out mediump vec2 vs_TEXCOORD3;
					out mediump vec2 vs_TEXCOORD4;
					out mediump vec2 vs_TEXCOORD5;
					out mediump vec2 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec2 u_xlat16_2;
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
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat16_2.xy = _Offsets.xy * _MainTex_TexelSize.xy;
					    vs_TEXCOORD1.xy = u_xlat16_2.xy * vec2(0.5, 0.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD2.xy = (-u_xlat16_2.xy) * vec2(0.5, 0.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD3.xy = u_xlat16_2.xy * vec2(1.5, 1.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD4.xy = (-u_xlat16_2.xy) * vec2(1.5, 1.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD5.xy = u_xlat16_2.xy * vec2(2.5, 2.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD6.xy = (-u_xlat16_2.xy) * vec2(2.5, 2.5) + in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec2 vs_TEXCOORD1;
					in mediump vec2 vs_TEXCOORD2;
					in mediump vec2 vs_TEXCOORD3;
					in mediump vec2 vs_TEXCOORD4;
					in mediump vec2 vs_TEXCOORD5;
					in mediump vec2 vs_TEXCOORD6;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat10_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD5.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD6.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat16_2 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_2 = u_xlat16_2 + 7.5;
					    SV_Target0 = u_xlat16_0 / vec4(u_xlat16_2);
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
					uniform 	mediump vec4 _Offsets;
					uniform 	mediump vec4 _MainTex_TexelSize;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD1;
					out mediump vec2 vs_TEXCOORD2;
					out mediump vec2 vs_TEXCOORD3;
					out mediump vec2 vs_TEXCOORD4;
					out mediump vec2 vs_TEXCOORD5;
					out mediump vec2 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec2 u_xlat16_2;
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
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat16_2.xy = _Offsets.xy * _MainTex_TexelSize.xy;
					    vs_TEXCOORD1.xy = u_xlat16_2.xy * vec2(0.5, 0.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD2.xy = (-u_xlat16_2.xy) * vec2(0.5, 0.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD3.xy = u_xlat16_2.xy * vec2(1.5, 1.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD4.xy = (-u_xlat16_2.xy) * vec2(1.5, 1.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD5.xy = u_xlat16_2.xy * vec2(2.5, 2.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD6.xy = (-u_xlat16_2.xy) * vec2(2.5, 2.5) + in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec2 vs_TEXCOORD1;
					in mediump vec2 vs_TEXCOORD2;
					in mediump vec2 vs_TEXCOORD3;
					in mediump vec2 vs_TEXCOORD4;
					in mediump vec2 vs_TEXCOORD5;
					in mediump vec2 vs_TEXCOORD6;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat10_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD5.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD6.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat16_2 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_2 = u_xlat16_2 + 7.5;
					    SV_Target0 = u_xlat16_0 / vec4(u_xlat16_2);
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
					uniform 	mediump vec4 _Offsets;
					uniform 	mediump vec4 _MainTex_TexelSize;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD1;
					out mediump vec2 vs_TEXCOORD2;
					out mediump vec2 vs_TEXCOORD3;
					out mediump vec2 vs_TEXCOORD4;
					out mediump vec2 vs_TEXCOORD5;
					out mediump vec2 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					mediump vec2 u_xlat16_2;
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
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat16_2.xy = _Offsets.xy * _MainTex_TexelSize.xy;
					    vs_TEXCOORD1.xy = u_xlat16_2.xy * vec2(0.5, 0.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD2.xy = (-u_xlat16_2.xy) * vec2(0.5, 0.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD3.xy = u_xlat16_2.xy * vec2(1.5, 1.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD4.xy = (-u_xlat16_2.xy) * vec2(1.5, 1.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD5.xy = u_xlat16_2.xy * vec2(2.5, 2.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD6.xy = (-u_xlat16_2.xy) * vec2(2.5, 2.5) + in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec2 vs_TEXCOORD1;
					in mediump vec2 vs_TEXCOORD2;
					in mediump vec2 vs_TEXCOORD3;
					in mediump vec2 vs_TEXCOORD4;
					in mediump vec2 vs_TEXCOORD5;
					in mediump vec2 vs_TEXCOORD6;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					mediump float u_xlat16_2;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat10_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD5.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD6.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat16_2 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_2 = u_xlat16_2 + 7.5;
					    SV_Target0 = u_xlat16_0 / vec4(u_xlat16_2);
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan hw_tier00 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 143
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %11 %79 %85 %87 %98 %105 %111 %118 %124 %131 
					                                                      OpDecorate %11 Location 11 
					                                                      OpDecorate %16 ArrayStride 16 
					                                                      OpDecorate %17 ArrayStride 17 
					                                                      OpMemberDecorate %18 0 Offset 18 
					                                                      OpMemberDecorate %18 1 Offset 18 
					                                                      OpMemberDecorate %18 2 RelaxedPrecision 
					                                                      OpMemberDecorate %18 2 Offset 18 
					                                                      OpMemberDecorate %18 3 RelaxedPrecision 
					                                                      OpMemberDecorate %18 3 Offset 18 
					                                                      OpDecorate %18 Block 
					                                                      OpDecorate %20 DescriptorSet 20 
					                                                      OpDecorate %20 Binding 20 
					                                                      OpMemberDecorate %77 0 BuiltIn 77 
					                                                      OpMemberDecorate %77 1 BuiltIn 77 
					                                                      OpMemberDecorate %77 2 BuiltIn 77 
					                                                      OpDecorate %77 Block 
					                                                      OpDecorate %85 RelaxedPrecision 
					                                                      OpDecorate %85 Location 85 
					                                                      OpDecorate %87 RelaxedPrecision 
					                                                      OpDecorate %87 Location 87 
					                                                      OpDecorate %88 RelaxedPrecision 
					                                                      OpDecorate %90 RelaxedPrecision 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %93 RelaxedPrecision 
					                                                      OpDecorate %95 RelaxedPrecision 
					                                                      OpDecorate %96 RelaxedPrecision 
					                                                      OpDecorate %97 RelaxedPrecision 
					                                                      OpDecorate %98 RelaxedPrecision 
					                                                      OpDecorate %98 Location 98 
					                                                      OpDecorate %99 RelaxedPrecision 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %104 RelaxedPrecision 
					                                                      OpDecorate %105 RelaxedPrecision 
					                                                      OpDecorate %105 Location 105 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate %107 RelaxedPrecision 
					                                                      OpDecorate %108 RelaxedPrecision 
					                                                      OpDecorate %109 RelaxedPrecision 
					                                                      OpDecorate %110 RelaxedPrecision 
					                                                      OpDecorate %111 RelaxedPrecision 
					                                                      OpDecorate %111 Location 111 
					                                                      OpDecorate %112 RelaxedPrecision 
					                                                      OpDecorate %115 RelaxedPrecision 
					                                                      OpDecorate %116 RelaxedPrecision 
					                                                      OpDecorate %117 RelaxedPrecision 
					                                                      OpDecorate %118 RelaxedPrecision 
					                                                      OpDecorate %118 Location 118 
					                                                      OpDecorate %119 RelaxedPrecision 
					                                                      OpDecorate %120 RelaxedPrecision 
					                                                      OpDecorate %121 RelaxedPrecision 
					                                                      OpDecorate %122 RelaxedPrecision 
					                                                      OpDecorate %123 RelaxedPrecision 
					                                                      OpDecorate %124 RelaxedPrecision 
					                                                      OpDecorate %124 Location 124 
					                                                      OpDecorate %125 RelaxedPrecision 
					                                                      OpDecorate %128 RelaxedPrecision 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %130 RelaxedPrecision 
					                                                      OpDecorate %131 RelaxedPrecision 
					                                                      OpDecorate %131 Location 131 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %133 RelaxedPrecision 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
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
					                                              %18 = OpTypeStruct %16 %17 %7 %7 
					                                              %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4;}* %20 = OpVariable Uniform 
					                                              %21 = OpTypeInt 32 1 
					                                          i32 %22 = OpConstant 0 
					                                          i32 %23 = OpConstant 1 
					                                              %24 = OpTypePointer Uniform %7 
					                                          i32 %35 = OpConstant 2 
					                                          i32 %44 = OpConstant 3 
					                               Private f32_4* %48 = OpVariable Private 
					                                          u32 %75 = OpConstant 1 
					                                              %76 = OpTypeArray %6 %75 
					                                              %77 = OpTypeStruct %7 %6 %76 
					                                              %78 = OpTypePointer Output %77 
					         Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
					                                              %81 = OpTypePointer Output %7 
					                                              %83 = OpTypeVector %6 2 
					                                              %84 = OpTypePointer Output %83 
					                                Output f32_2* %85 = OpVariable Output 
					                                              %86 = OpTypePointer Input %83 
					                                 Input f32_2* %87 = OpVariable Input 
					                                              %89 = OpTypePointer Private %83 
					                               Private f32_2* %90 = OpVariable Private 
					                                Output f32_2* %98 = OpVariable Output 
					                                         f32 %100 = OpConstant 3.674022E-40 
					                                       f32_2 %101 = OpConstantComposite %100 %100 
					                               Output f32_2* %105 = OpVariable Output 
					                               Output f32_2* %111 = OpVariable Output 
					                                         f32 %113 = OpConstant 3.674022E-40 
					                                       f32_2 %114 = OpConstantComposite %113 %113 
					                               Output f32_2* %118 = OpVariable Output 
					                               Output f32_2* %124 = OpVariable Output 
					                                         f32 %126 = OpConstant 3.674022E-40 
					                                       f32_2 %127 = OpConstantComposite %126 %126 
					                               Output f32_2* %131 = OpVariable Output 
					                                             %137 = OpTypePointer Output %6 
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
					                               Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
					                                        f32_4 %69 = OpLoad %68 
					                                        f32_4 %70 = OpLoad %9 
					                                        f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
					                                        f32_4 %72 = OpFMul %69 %71 
					                                        f32_4 %73 = OpLoad %48 
					                                        f32_4 %74 = OpFAdd %72 %73 
					                                                      OpStore %9 %74 
					                                        f32_4 %80 = OpLoad %9 
					                                Output f32_4* %82 = OpAccessChain %79 %22 
					                                                      OpStore %82 %80 
					                                        f32_2 %88 = OpLoad %87 
					                                                      OpStore %85 %88 
					                               Uniform f32_4* %91 = OpAccessChain %20 %35 
					                                        f32_4 %92 = OpLoad %91 
					                                        f32_2 %93 = OpVectorShuffle %92 %92 0 1 
					                               Uniform f32_4* %94 = OpAccessChain %20 %44 
					                                        f32_4 %95 = OpLoad %94 
					                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
					                                        f32_2 %97 = OpFMul %93 %96 
					                                                      OpStore %90 %97 
					                                        f32_2 %99 = OpLoad %90 
					                                       f32_2 %102 = OpFMul %99 %101 
					                                       f32_2 %103 = OpLoad %87 
					                                       f32_2 %104 = OpFAdd %102 %103 
					                                                      OpStore %98 %104 
					                                       f32_2 %106 = OpLoad %90 
					                                       f32_2 %107 = OpFNegate %106 
					                                       f32_2 %108 = OpFMul %107 %101 
					                                       f32_2 %109 = OpLoad %87 
					                                       f32_2 %110 = OpFAdd %108 %109 
					                                                      OpStore %105 %110 
					                                       f32_2 %112 = OpLoad %90 
					                                       f32_2 %115 = OpFMul %112 %114 
					                                       f32_2 %116 = OpLoad %87 
					                                       f32_2 %117 = OpFAdd %115 %116 
					                                                      OpStore %111 %117 
					                                       f32_2 %119 = OpLoad %90 
					                                       f32_2 %120 = OpFNegate %119 
					                                       f32_2 %121 = OpFMul %120 %114 
					                                       f32_2 %122 = OpLoad %87 
					                                       f32_2 %123 = OpFAdd %121 %122 
					                                                      OpStore %118 %123 
					                                       f32_2 %125 = OpLoad %90 
					                                       f32_2 %128 = OpFMul %125 %127 
					                                       f32_2 %129 = OpLoad %87 
					                                       f32_2 %130 = OpFAdd %128 %129 
					                                                      OpStore %124 %130 
					                                       f32_2 %132 = OpLoad %90 
					                                       f32_2 %133 = OpFNegate %132 
					                                       f32_2 %134 = OpFMul %133 %127 
					                                       f32_2 %135 = OpLoad %87 
					                                       f32_2 %136 = OpFAdd %134 %135 
					                                                      OpStore %131 %136 
					                                 Output f32* %138 = OpAccessChain %79 %22 %75 
					                                         f32 %139 = OpLoad %138 
					                                         f32 %140 = OpFNegate %139 
					                                 Output f32* %141 = OpAccessChain %79 %22 %75 
					                                                      OpStore %141 %140 
					                                                      OpReturn
					                                                      OpFunctionEnd

					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 84
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %22 %30 %37 %44 %51 %58 %78 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %18 RelaxedPrecision 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %22 Location 22 
					                                                    OpDecorate %23 RelaxedPrecision 
					                                                    OpDecorate %25 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %28 RelaxedPrecision 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %30 RelaxedPrecision 
					                                                    OpDecorate %30 Location 30 
					                                                    OpDecorate %31 RelaxedPrecision 
					                                                    OpDecorate %33 RelaxedPrecision 
					                                                    OpDecorate %34 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %37 Location 37 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %40 RelaxedPrecision 
					                                                    OpDecorate %41 RelaxedPrecision 
					                                                    OpDecorate %42 RelaxedPrecision 
					                                                    OpDecorate %43 RelaxedPrecision 
					                                                    OpDecorate %44 RelaxedPrecision 
					                                                    OpDecorate %44 Location 44 
					                                                    OpDecorate %45 RelaxedPrecision 
					                                                    OpDecorate %47 RelaxedPrecision 
					                                                    OpDecorate %48 RelaxedPrecision 
					                                                    OpDecorate %49 RelaxedPrecision 
					                                                    OpDecorate %50 RelaxedPrecision 
					                                                    OpDecorate %51 RelaxedPrecision 
					                                                    OpDecorate %51 Location 51 
					                                                    OpDecorate %52 RelaxedPrecision 
					                                                    OpDecorate %54 RelaxedPrecision 
					                                                    OpDecorate %55 RelaxedPrecision 
					                                                    OpDecorate %56 RelaxedPrecision 
					                                                    OpDecorate %57 RelaxedPrecision 
					                                                    OpDecorate %58 RelaxedPrecision 
					                                                    OpDecorate %58 Location 58 
					                                                    OpDecorate %59 RelaxedPrecision 
					                                                    OpDecorate %61 RelaxedPrecision 
					                                                    OpDecorate %62 RelaxedPrecision 
					                                                    OpDecorate %63 RelaxedPrecision 
					                                                    OpDecorate %65 RelaxedPrecision 
					                                                    OpDecorate %67 RelaxedPrecision 
					                                                    OpDecorate %68 RelaxedPrecision 
					                                                    OpDecorate %73 RelaxedPrecision 
					                                                    OpDecorate %74 RelaxedPrecision 
					                                                    OpDecorate %76 RelaxedPrecision 
					                                                    OpDecorate %78 RelaxedPrecision 
					                                                    OpDecorate %78 Location 78 
					                                                    OpDecorate %79 RelaxedPrecision 
					                                                    OpDecorate %80 RelaxedPrecision 
					                                                    OpDecorate %81 RelaxedPrecision 
					                                                    OpDecorate %82 RelaxedPrecision 
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
					                               Input f32_2* %22 = OpVariable Input 
					                             Private f32_4* %25 = OpVariable Private 
					                               Input f32_2* %30 = OpVariable Input 
					                               Input f32_2* %37 = OpVariable Input 
					                               Input f32_2* %44 = OpVariable Input 
					                               Input f32_2* %51 = OpVariable Input 
					                               Input f32_2* %58 = OpVariable Input 
					                                            %64 = OpTypePointer Private %6 
					                               Private f32* %65 = OpVariable Private 
					                                            %66 = OpTypeVector %6 3 
					                                        f32 %69 = OpConstant 3.674022E-40 
					                                        f32 %70 = OpConstant 3.674022E-40 
					                                        f32 %71 = OpConstant 3.674022E-40 
					                                      f32_3 %72 = OpConstantComposite %69 %70 %71 
					                                        f32 %75 = OpConstant 3.674022E-40 
					                                            %77 = OpTypePointer Output %7 
					                              Output f32_4* %78 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                 read_only Texture2DSampled %21 = OpLoad %13 
					                                      f32_2 %23 = OpLoad %22 
					                                      f32_4 %24 = OpImageSampleImplicitLod %21 %23 
					                                                    OpStore %20 %24 
					                                      f32_4 %26 = OpLoad %9 
					                                      f32_4 %27 = OpLoad %20 
					                                      f32_4 %28 = OpFAdd %26 %27 
					                                                    OpStore %25 %28 
					                 read_only Texture2DSampled %29 = OpLoad %13 
					                                      f32_2 %31 = OpLoad %30 
					                                      f32_4 %32 = OpImageSampleImplicitLod %29 %31 
					                                                    OpStore %20 %32 
					                                      f32_4 %33 = OpLoad %25 
					                                      f32_4 %34 = OpLoad %20 
					                                      f32_4 %35 = OpFAdd %33 %34 
					                                                    OpStore %25 %35 
					                 read_only Texture2DSampled %36 = OpLoad %13 
					                                      f32_2 %38 = OpLoad %37 
					                                      f32_4 %39 = OpImageSampleImplicitLod %36 %38 
					                                                    OpStore %20 %39 
					                                      f32_4 %40 = OpLoad %25 
					                                      f32_4 %41 = OpLoad %20 
					                                      f32_4 %42 = OpFAdd %40 %41 
					                                                    OpStore %25 %42 
					                 read_only Texture2DSampled %43 = OpLoad %13 
					                                      f32_2 %45 = OpLoad %44 
					                                      f32_4 %46 = OpImageSampleImplicitLod %43 %45 
					                                                    OpStore %20 %46 
					                                      f32_4 %47 = OpLoad %25 
					                                      f32_4 %48 = OpLoad %20 
					                                      f32_4 %49 = OpFAdd %47 %48 
					                                                    OpStore %25 %49 
					                 read_only Texture2DSampled %50 = OpLoad %13 
					                                      f32_2 %52 = OpLoad %51 
					                                      f32_4 %53 = OpImageSampleImplicitLod %50 %52 
					                                                    OpStore %20 %53 
					                                      f32_4 %54 = OpLoad %25 
					                                      f32_4 %55 = OpLoad %20 
					                                      f32_4 %56 = OpFAdd %54 %55 
					                                                    OpStore %25 %56 
					                 read_only Texture2DSampled %57 = OpLoad %13 
					                                      f32_2 %59 = OpLoad %58 
					                                      f32_4 %60 = OpImageSampleImplicitLod %57 %59 
					                                                    OpStore %20 %60 
					                                      f32_4 %61 = OpLoad %25 
					                                      f32_4 %62 = OpLoad %20 
					                                      f32_4 %63 = OpFAdd %61 %62 
					                                                    OpStore %25 %63 
					                                      f32_4 %67 = OpLoad %25 
					                                      f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
					                                        f32 %73 = OpDot %68 %72 
					                                                    OpStore %65 %73 
					                                        f32 %74 = OpLoad %65 
					                                        f32 %76 = OpFAdd %74 %75 
					                                                    OpStore %65 %76 
					                                      f32_4 %79 = OpLoad %25 
					                                        f32 %80 = OpLoad %65 
					                                      f32_4 %81 = OpCompositeConstruct %80 %80 %80 %80 
					                                      f32_4 %82 = OpFDiv %79 %81 
					                                                    OpStore %78 %82 
					                                                    OpReturn
					                                                    OpFunctionEnd
"
				}
				SubProgram "vulkan hw_tier01 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 143
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %11 %79 %85 %87 %98 %105 %111 %118 %124 %131 
					                                                      OpDecorate %11 Location 11 
					                                                      OpDecorate %16 ArrayStride 16 
					                                                      OpDecorate %17 ArrayStride 17 
					                                                      OpMemberDecorate %18 0 Offset 18 
					                                                      OpMemberDecorate %18 1 Offset 18 
					                                                      OpMemberDecorate %18 2 RelaxedPrecision 
					                                                      OpMemberDecorate %18 2 Offset 18 
					                                                      OpMemberDecorate %18 3 RelaxedPrecision 
					                                                      OpMemberDecorate %18 3 Offset 18 
					                                                      OpDecorate %18 Block 
					                                                      OpDecorate %20 DescriptorSet 20 
					                                                      OpDecorate %20 Binding 20 
					                                                      OpMemberDecorate %77 0 BuiltIn 77 
					                                                      OpMemberDecorate %77 1 BuiltIn 77 
					                                                      OpMemberDecorate %77 2 BuiltIn 77 
					                                                      OpDecorate %77 Block 
					                                                      OpDecorate %85 RelaxedPrecision 
					                                                      OpDecorate %85 Location 85 
					                                                      OpDecorate %87 RelaxedPrecision 
					                                                      OpDecorate %87 Location 87 
					                                                      OpDecorate %88 RelaxedPrecision 
					                                                      OpDecorate %90 RelaxedPrecision 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %93 RelaxedPrecision 
					                                                      OpDecorate %95 RelaxedPrecision 
					                                                      OpDecorate %96 RelaxedPrecision 
					                                                      OpDecorate %97 RelaxedPrecision 
					                                                      OpDecorate %98 RelaxedPrecision 
					                                                      OpDecorate %98 Location 98 
					                                                      OpDecorate %99 RelaxedPrecision 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %104 RelaxedPrecision 
					                                                      OpDecorate %105 RelaxedPrecision 
					                                                      OpDecorate %105 Location 105 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate %107 RelaxedPrecision 
					                                                      OpDecorate %108 RelaxedPrecision 
					                                                      OpDecorate %109 RelaxedPrecision 
					                                                      OpDecorate %110 RelaxedPrecision 
					                                                      OpDecorate %111 RelaxedPrecision 
					                                                      OpDecorate %111 Location 111 
					                                                      OpDecorate %112 RelaxedPrecision 
					                                                      OpDecorate %115 RelaxedPrecision 
					                                                      OpDecorate %116 RelaxedPrecision 
					                                                      OpDecorate %117 RelaxedPrecision 
					                                                      OpDecorate %118 RelaxedPrecision 
					                                                      OpDecorate %118 Location 118 
					                                                      OpDecorate %119 RelaxedPrecision 
					                                                      OpDecorate %120 RelaxedPrecision 
					                                                      OpDecorate %121 RelaxedPrecision 
					                                                      OpDecorate %122 RelaxedPrecision 
					                                                      OpDecorate %123 RelaxedPrecision 
					                                                      OpDecorate %124 RelaxedPrecision 
					                                                      OpDecorate %124 Location 124 
					                                                      OpDecorate %125 RelaxedPrecision 
					                                                      OpDecorate %128 RelaxedPrecision 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %130 RelaxedPrecision 
					                                                      OpDecorate %131 RelaxedPrecision 
					                                                      OpDecorate %131 Location 131 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %133 RelaxedPrecision 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
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
					                                              %18 = OpTypeStruct %16 %17 %7 %7 
					                                              %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4;}* %20 = OpVariable Uniform 
					                                              %21 = OpTypeInt 32 1 
					                                          i32 %22 = OpConstant 0 
					                                          i32 %23 = OpConstant 1 
					                                              %24 = OpTypePointer Uniform %7 
					                                          i32 %35 = OpConstant 2 
					                                          i32 %44 = OpConstant 3 
					                               Private f32_4* %48 = OpVariable Private 
					                                          u32 %75 = OpConstant 1 
					                                              %76 = OpTypeArray %6 %75 
					                                              %77 = OpTypeStruct %7 %6 %76 
					                                              %78 = OpTypePointer Output %77 
					         Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
					                                              %81 = OpTypePointer Output %7 
					                                              %83 = OpTypeVector %6 2 
					                                              %84 = OpTypePointer Output %83 
					                                Output f32_2* %85 = OpVariable Output 
					                                              %86 = OpTypePointer Input %83 
					                                 Input f32_2* %87 = OpVariable Input 
					                                              %89 = OpTypePointer Private %83 
					                               Private f32_2* %90 = OpVariable Private 
					                                Output f32_2* %98 = OpVariable Output 
					                                         f32 %100 = OpConstant 3.674022E-40 
					                                       f32_2 %101 = OpConstantComposite %100 %100 
					                               Output f32_2* %105 = OpVariable Output 
					                               Output f32_2* %111 = OpVariable Output 
					                                         f32 %113 = OpConstant 3.674022E-40 
					                                       f32_2 %114 = OpConstantComposite %113 %113 
					                               Output f32_2* %118 = OpVariable Output 
					                               Output f32_2* %124 = OpVariable Output 
					                                         f32 %126 = OpConstant 3.674022E-40 
					                                       f32_2 %127 = OpConstantComposite %126 %126 
					                               Output f32_2* %131 = OpVariable Output 
					                                             %137 = OpTypePointer Output %6 
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
					                               Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
					                                        f32_4 %69 = OpLoad %68 
					                                        f32_4 %70 = OpLoad %9 
					                                        f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
					                                        f32_4 %72 = OpFMul %69 %71 
					                                        f32_4 %73 = OpLoad %48 
					                                        f32_4 %74 = OpFAdd %72 %73 
					                                                      OpStore %9 %74 
					                                        f32_4 %80 = OpLoad %9 
					                                Output f32_4* %82 = OpAccessChain %79 %22 
					                                                      OpStore %82 %80 
					                                        f32_2 %88 = OpLoad %87 
					                                                      OpStore %85 %88 
					                               Uniform f32_4* %91 = OpAccessChain %20 %35 
					                                        f32_4 %92 = OpLoad %91 
					                                        f32_2 %93 = OpVectorShuffle %92 %92 0 1 
					                               Uniform f32_4* %94 = OpAccessChain %20 %44 
					                                        f32_4 %95 = OpLoad %94 
					                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
					                                        f32_2 %97 = OpFMul %93 %96 
					                                                      OpStore %90 %97 
					                                        f32_2 %99 = OpLoad %90 
					                                       f32_2 %102 = OpFMul %99 %101 
					                                       f32_2 %103 = OpLoad %87 
					                                       f32_2 %104 = OpFAdd %102 %103 
					                                                      OpStore %98 %104 
					                                       f32_2 %106 = OpLoad %90 
					                                       f32_2 %107 = OpFNegate %106 
					                                       f32_2 %108 = OpFMul %107 %101 
					                                       f32_2 %109 = OpLoad %87 
					                                       f32_2 %110 = OpFAdd %108 %109 
					                                                      OpStore %105 %110 
					                                       f32_2 %112 = OpLoad %90 
					                                       f32_2 %115 = OpFMul %112 %114 
					                                       f32_2 %116 = OpLoad %87 
					                                       f32_2 %117 = OpFAdd %115 %116 
					                                                      OpStore %111 %117 
					                                       f32_2 %119 = OpLoad %90 
					                                       f32_2 %120 = OpFNegate %119 
					                                       f32_2 %121 = OpFMul %120 %114 
					                                       f32_2 %122 = OpLoad %87 
					                                       f32_2 %123 = OpFAdd %121 %122 
					                                                      OpStore %118 %123 
					                                       f32_2 %125 = OpLoad %90 
					                                       f32_2 %128 = OpFMul %125 %127 
					                                       f32_2 %129 = OpLoad %87 
					                                       f32_2 %130 = OpFAdd %128 %129 
					                                                      OpStore %124 %130 
					                                       f32_2 %132 = OpLoad %90 
					                                       f32_2 %133 = OpFNegate %132 
					                                       f32_2 %134 = OpFMul %133 %127 
					                                       f32_2 %135 = OpLoad %87 
					                                       f32_2 %136 = OpFAdd %134 %135 
					                                                      OpStore %131 %136 
					                                 Output f32* %138 = OpAccessChain %79 %22 %75 
					                                         f32 %139 = OpLoad %138 
					                                         f32 %140 = OpFNegate %139 
					                                 Output f32* %141 = OpAccessChain %79 %22 %75 
					                                                      OpStore %141 %140 
					                                                      OpReturn
					                                                      OpFunctionEnd

					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 84
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %22 %30 %37 %44 %51 %58 %78 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %18 RelaxedPrecision 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %22 Location 22 
					                                                    OpDecorate %23 RelaxedPrecision 
					                                                    OpDecorate %25 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %28 RelaxedPrecision 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %30 RelaxedPrecision 
					                                                    OpDecorate %30 Location 30 
					                                                    OpDecorate %31 RelaxedPrecision 
					                                                    OpDecorate %33 RelaxedPrecision 
					                                                    OpDecorate %34 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %37 Location 37 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %40 RelaxedPrecision 
					                                                    OpDecorate %41 RelaxedPrecision 
					                                                    OpDecorate %42 RelaxedPrecision 
					                                                    OpDecorate %43 RelaxedPrecision 
					                                                    OpDecorate %44 RelaxedPrecision 
					                                                    OpDecorate %44 Location 44 
					                                                    OpDecorate %45 RelaxedPrecision 
					                                                    OpDecorate %47 RelaxedPrecision 
					                                                    OpDecorate %48 RelaxedPrecision 
					                                                    OpDecorate %49 RelaxedPrecision 
					                                                    OpDecorate %50 RelaxedPrecision 
					                                                    OpDecorate %51 RelaxedPrecision 
					                                                    OpDecorate %51 Location 51 
					                                                    OpDecorate %52 RelaxedPrecision 
					                                                    OpDecorate %54 RelaxedPrecision 
					                                                    OpDecorate %55 RelaxedPrecision 
					                                                    OpDecorate %56 RelaxedPrecision 
					                                                    OpDecorate %57 RelaxedPrecision 
					                                                    OpDecorate %58 RelaxedPrecision 
					                                                    OpDecorate %58 Location 58 
					                                                    OpDecorate %59 RelaxedPrecision 
					                                                    OpDecorate %61 RelaxedPrecision 
					                                                    OpDecorate %62 RelaxedPrecision 
					                                                    OpDecorate %63 RelaxedPrecision 
					                                                    OpDecorate %65 RelaxedPrecision 
					                                                    OpDecorate %67 RelaxedPrecision 
					                                                    OpDecorate %68 RelaxedPrecision 
					                                                    OpDecorate %73 RelaxedPrecision 
					                                                    OpDecorate %74 RelaxedPrecision 
					                                                    OpDecorate %76 RelaxedPrecision 
					                                                    OpDecorate %78 RelaxedPrecision 
					                                                    OpDecorate %78 Location 78 
					                                                    OpDecorate %79 RelaxedPrecision 
					                                                    OpDecorate %80 RelaxedPrecision 
					                                                    OpDecorate %81 RelaxedPrecision 
					                                                    OpDecorate %82 RelaxedPrecision 
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
					                               Input f32_2* %22 = OpVariable Input 
					                             Private f32_4* %25 = OpVariable Private 
					                               Input f32_2* %30 = OpVariable Input 
					                               Input f32_2* %37 = OpVariable Input 
					                               Input f32_2* %44 = OpVariable Input 
					                               Input f32_2* %51 = OpVariable Input 
					                               Input f32_2* %58 = OpVariable Input 
					                                            %64 = OpTypePointer Private %6 
					                               Private f32* %65 = OpVariable Private 
					                                            %66 = OpTypeVector %6 3 
					                                        f32 %69 = OpConstant 3.674022E-40 
					                                        f32 %70 = OpConstant 3.674022E-40 
					                                        f32 %71 = OpConstant 3.674022E-40 
					                                      f32_3 %72 = OpConstantComposite %69 %70 %71 
					                                        f32 %75 = OpConstant 3.674022E-40 
					                                            %77 = OpTypePointer Output %7 
					                              Output f32_4* %78 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                 read_only Texture2DSampled %21 = OpLoad %13 
					                                      f32_2 %23 = OpLoad %22 
					                                      f32_4 %24 = OpImageSampleImplicitLod %21 %23 
					                                                    OpStore %20 %24 
					                                      f32_4 %26 = OpLoad %9 
					                                      f32_4 %27 = OpLoad %20 
					                                      f32_4 %28 = OpFAdd %26 %27 
					                                                    OpStore %25 %28 
					                 read_only Texture2DSampled %29 = OpLoad %13 
					                                      f32_2 %31 = OpLoad %30 
					                                      f32_4 %32 = OpImageSampleImplicitLod %29 %31 
					                                                    OpStore %20 %32 
					                                      f32_4 %33 = OpLoad %25 
					                                      f32_4 %34 = OpLoad %20 
					                                      f32_4 %35 = OpFAdd %33 %34 
					                                                    OpStore %25 %35 
					                 read_only Texture2DSampled %36 = OpLoad %13 
					                                      f32_2 %38 = OpLoad %37 
					                                      f32_4 %39 = OpImageSampleImplicitLod %36 %38 
					                                                    OpStore %20 %39 
					                                      f32_4 %40 = OpLoad %25 
					                                      f32_4 %41 = OpLoad %20 
					                                      f32_4 %42 = OpFAdd %40 %41 
					                                                    OpStore %25 %42 
					                 read_only Texture2DSampled %43 = OpLoad %13 
					                                      f32_2 %45 = OpLoad %44 
					                                      f32_4 %46 = OpImageSampleImplicitLod %43 %45 
					                                                    OpStore %20 %46 
					                                      f32_4 %47 = OpLoad %25 
					                                      f32_4 %48 = OpLoad %20 
					                                      f32_4 %49 = OpFAdd %47 %48 
					                                                    OpStore %25 %49 
					                 read_only Texture2DSampled %50 = OpLoad %13 
					                                      f32_2 %52 = OpLoad %51 
					                                      f32_4 %53 = OpImageSampleImplicitLod %50 %52 
					                                                    OpStore %20 %53 
					                                      f32_4 %54 = OpLoad %25 
					                                      f32_4 %55 = OpLoad %20 
					                                      f32_4 %56 = OpFAdd %54 %55 
					                                                    OpStore %25 %56 
					                 read_only Texture2DSampled %57 = OpLoad %13 
					                                      f32_2 %59 = OpLoad %58 
					                                      f32_4 %60 = OpImageSampleImplicitLod %57 %59 
					                                                    OpStore %20 %60 
					                                      f32_4 %61 = OpLoad %25 
					                                      f32_4 %62 = OpLoad %20 
					                                      f32_4 %63 = OpFAdd %61 %62 
					                                                    OpStore %25 %63 
					                                      f32_4 %67 = OpLoad %25 
					                                      f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
					                                        f32 %73 = OpDot %68 %72 
					                                                    OpStore %65 %73 
					                                        f32 %74 = OpLoad %65 
					                                        f32 %76 = OpFAdd %74 %75 
					                                                    OpStore %65 %76 
					                                      f32_4 %79 = OpLoad %25 
					                                        f32 %80 = OpLoad %65 
					                                      f32_4 %81 = OpCompositeConstruct %80 %80 %80 %80 
					                                      f32_4 %82 = OpFDiv %79 %81 
					                                                    OpStore %78 %82 
					                                                    OpReturn
					                                                    OpFunctionEnd
"
				}
				SubProgram "vulkan hw_tier02 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 143
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %11 %79 %85 %87 %98 %105 %111 %118 %124 %131 
					                                                      OpDecorate %11 Location 11 
					                                                      OpDecorate %16 ArrayStride 16 
					                                                      OpDecorate %17 ArrayStride 17 
					                                                      OpMemberDecorate %18 0 Offset 18 
					                                                      OpMemberDecorate %18 1 Offset 18 
					                                                      OpMemberDecorate %18 2 RelaxedPrecision 
					                                                      OpMemberDecorate %18 2 Offset 18 
					                                                      OpMemberDecorate %18 3 RelaxedPrecision 
					                                                      OpMemberDecorate %18 3 Offset 18 
					                                                      OpDecorate %18 Block 
					                                                      OpDecorate %20 DescriptorSet 20 
					                                                      OpDecorate %20 Binding 20 
					                                                      OpMemberDecorate %77 0 BuiltIn 77 
					                                                      OpMemberDecorate %77 1 BuiltIn 77 
					                                                      OpMemberDecorate %77 2 BuiltIn 77 
					                                                      OpDecorate %77 Block 
					                                                      OpDecorate %85 RelaxedPrecision 
					                                                      OpDecorate %85 Location 85 
					                                                      OpDecorate %87 RelaxedPrecision 
					                                                      OpDecorate %87 Location 87 
					                                                      OpDecorate %88 RelaxedPrecision 
					                                                      OpDecorate %90 RelaxedPrecision 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %93 RelaxedPrecision 
					                                                      OpDecorate %95 RelaxedPrecision 
					                                                      OpDecorate %96 RelaxedPrecision 
					                                                      OpDecorate %97 RelaxedPrecision 
					                                                      OpDecorate %98 RelaxedPrecision 
					                                                      OpDecorate %98 Location 98 
					                                                      OpDecorate %99 RelaxedPrecision 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %104 RelaxedPrecision 
					                                                      OpDecorate %105 RelaxedPrecision 
					                                                      OpDecorate %105 Location 105 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate %107 RelaxedPrecision 
					                                                      OpDecorate %108 RelaxedPrecision 
					                                                      OpDecorate %109 RelaxedPrecision 
					                                                      OpDecorate %110 RelaxedPrecision 
					                                                      OpDecorate %111 RelaxedPrecision 
					                                                      OpDecorate %111 Location 111 
					                                                      OpDecorate %112 RelaxedPrecision 
					                                                      OpDecorate %115 RelaxedPrecision 
					                                                      OpDecorate %116 RelaxedPrecision 
					                                                      OpDecorate %117 RelaxedPrecision 
					                                                      OpDecorate %118 RelaxedPrecision 
					                                                      OpDecorate %118 Location 118 
					                                                      OpDecorate %119 RelaxedPrecision 
					                                                      OpDecorate %120 RelaxedPrecision 
					                                                      OpDecorate %121 RelaxedPrecision 
					                                                      OpDecorate %122 RelaxedPrecision 
					                                                      OpDecorate %123 RelaxedPrecision 
					                                                      OpDecorate %124 RelaxedPrecision 
					                                                      OpDecorate %124 Location 124 
					                                                      OpDecorate %125 RelaxedPrecision 
					                                                      OpDecorate %128 RelaxedPrecision 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %130 RelaxedPrecision 
					                                                      OpDecorate %131 RelaxedPrecision 
					                                                      OpDecorate %131 Location 131 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %133 RelaxedPrecision 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
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
					                                              %18 = OpTypeStruct %16 %17 %7 %7 
					                                              %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4;}* %20 = OpVariable Uniform 
					                                              %21 = OpTypeInt 32 1 
					                                          i32 %22 = OpConstant 0 
					                                          i32 %23 = OpConstant 1 
					                                              %24 = OpTypePointer Uniform %7 
					                                          i32 %35 = OpConstant 2 
					                                          i32 %44 = OpConstant 3 
					                               Private f32_4* %48 = OpVariable Private 
					                                          u32 %75 = OpConstant 1 
					                                              %76 = OpTypeArray %6 %75 
					                                              %77 = OpTypeStruct %7 %6 %76 
					                                              %78 = OpTypePointer Output %77 
					         Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
					                                              %81 = OpTypePointer Output %7 
					                                              %83 = OpTypeVector %6 2 
					                                              %84 = OpTypePointer Output %83 
					                                Output f32_2* %85 = OpVariable Output 
					                                              %86 = OpTypePointer Input %83 
					                                 Input f32_2* %87 = OpVariable Input 
					                                              %89 = OpTypePointer Private %83 
					                               Private f32_2* %90 = OpVariable Private 
					                                Output f32_2* %98 = OpVariable Output 
					                                         f32 %100 = OpConstant 3.674022E-40 
					                                       f32_2 %101 = OpConstantComposite %100 %100 
					                               Output f32_2* %105 = OpVariable Output 
					                               Output f32_2* %111 = OpVariable Output 
					                                         f32 %113 = OpConstant 3.674022E-40 
					                                       f32_2 %114 = OpConstantComposite %113 %113 
					                               Output f32_2* %118 = OpVariable Output 
					                               Output f32_2* %124 = OpVariable Output 
					                                         f32 %126 = OpConstant 3.674022E-40 
					                                       f32_2 %127 = OpConstantComposite %126 %126 
					                               Output f32_2* %131 = OpVariable Output 
					                                             %137 = OpTypePointer Output %6 
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
					                               Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
					                                        f32_4 %69 = OpLoad %68 
					                                        f32_4 %70 = OpLoad %9 
					                                        f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
					                                        f32_4 %72 = OpFMul %69 %71 
					                                        f32_4 %73 = OpLoad %48 
					                                        f32_4 %74 = OpFAdd %72 %73 
					                                                      OpStore %9 %74 
					                                        f32_4 %80 = OpLoad %9 
					                                Output f32_4* %82 = OpAccessChain %79 %22 
					                                                      OpStore %82 %80 
					                                        f32_2 %88 = OpLoad %87 
					                                                      OpStore %85 %88 
					                               Uniform f32_4* %91 = OpAccessChain %20 %35 
					                                        f32_4 %92 = OpLoad %91 
					                                        f32_2 %93 = OpVectorShuffle %92 %92 0 1 
					                               Uniform f32_4* %94 = OpAccessChain %20 %44 
					                                        f32_4 %95 = OpLoad %94 
					                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
					                                        f32_2 %97 = OpFMul %93 %96 
					                                                      OpStore %90 %97 
					                                        f32_2 %99 = OpLoad %90 
					                                       f32_2 %102 = OpFMul %99 %101 
					                                       f32_2 %103 = OpLoad %87 
					                                       f32_2 %104 = OpFAdd %102 %103 
					                                                      OpStore %98 %104 
					                                       f32_2 %106 = OpLoad %90 
					                                       f32_2 %107 = OpFNegate %106 
					                                       f32_2 %108 = OpFMul %107 %101 
					                                       f32_2 %109 = OpLoad %87 
					                                       f32_2 %110 = OpFAdd %108 %109 
					                                                      OpStore %105 %110 
					                                       f32_2 %112 = OpLoad %90 
					                                       f32_2 %115 = OpFMul %112 %114 
					                                       f32_2 %116 = OpLoad %87 
					                                       f32_2 %117 = OpFAdd %115 %116 
					                                                      OpStore %111 %117 
					                                       f32_2 %119 = OpLoad %90 
					                                       f32_2 %120 = OpFNegate %119 
					                                       f32_2 %121 = OpFMul %120 %114 
					                                       f32_2 %122 = OpLoad %87 
					                                       f32_2 %123 = OpFAdd %121 %122 
					                                                      OpStore %118 %123 
					                                       f32_2 %125 = OpLoad %90 
					                                       f32_2 %128 = OpFMul %125 %127 
					                                       f32_2 %129 = OpLoad %87 
					                                       f32_2 %130 = OpFAdd %128 %129 
					                                                      OpStore %124 %130 
					                                       f32_2 %132 = OpLoad %90 
					                                       f32_2 %133 = OpFNegate %132 
					                                       f32_2 %134 = OpFMul %133 %127 
					                                       f32_2 %135 = OpLoad %87 
					                                       f32_2 %136 = OpFAdd %134 %135 
					                                                      OpStore %131 %136 
					                                 Output f32* %138 = OpAccessChain %79 %22 %75 
					                                         f32 %139 = OpLoad %138 
					                                         f32 %140 = OpFNegate %139 
					                                 Output f32* %141 = OpAccessChain %79 %22 %75 
					                                                      OpStore %141 %140 
					                                                      OpReturn
					                                                      OpFunctionEnd

					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 84
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %22 %30 %37 %44 %51 %58 %78 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %18 RelaxedPrecision 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %22 Location 22 
					                                                    OpDecorate %23 RelaxedPrecision 
					                                                    OpDecorate %25 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %28 RelaxedPrecision 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %30 RelaxedPrecision 
					                                                    OpDecorate %30 Location 30 
					                                                    OpDecorate %31 RelaxedPrecision 
					                                                    OpDecorate %33 RelaxedPrecision 
					                                                    OpDecorate %34 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %37 Location 37 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %40 RelaxedPrecision 
					                                                    OpDecorate %41 RelaxedPrecision 
					                                                    OpDecorate %42 RelaxedPrecision 
					                                                    OpDecorate %43 RelaxedPrecision 
					                                                    OpDecorate %44 RelaxedPrecision 
					                                                    OpDecorate %44 Location 44 
					                                                    OpDecorate %45 RelaxedPrecision 
					                                                    OpDecorate %47 RelaxedPrecision 
					                                                    OpDecorate %48 RelaxedPrecision 
					                                                    OpDecorate %49 RelaxedPrecision 
					                                                    OpDecorate %50 RelaxedPrecision 
					                                                    OpDecorate %51 RelaxedPrecision 
					                                                    OpDecorate %51 Location 51 
					                                                    OpDecorate %52 RelaxedPrecision 
					                                                    OpDecorate %54 RelaxedPrecision 
					                                                    OpDecorate %55 RelaxedPrecision 
					                                                    OpDecorate %56 RelaxedPrecision 
					                                                    OpDecorate %57 RelaxedPrecision 
					                                                    OpDecorate %58 RelaxedPrecision 
					                                                    OpDecorate %58 Location 58 
					                                                    OpDecorate %59 RelaxedPrecision 
					                                                    OpDecorate %61 RelaxedPrecision 
					                                                    OpDecorate %62 RelaxedPrecision 
					                                                    OpDecorate %63 RelaxedPrecision 
					                                                    OpDecorate %65 RelaxedPrecision 
					                                                    OpDecorate %67 RelaxedPrecision 
					                                                    OpDecorate %68 RelaxedPrecision 
					                                                    OpDecorate %73 RelaxedPrecision 
					                                                    OpDecorate %74 RelaxedPrecision 
					                                                    OpDecorate %76 RelaxedPrecision 
					                                                    OpDecorate %78 RelaxedPrecision 
					                                                    OpDecorate %78 Location 78 
					                                                    OpDecorate %79 RelaxedPrecision 
					                                                    OpDecorate %80 RelaxedPrecision 
					                                                    OpDecorate %81 RelaxedPrecision 
					                                                    OpDecorate %82 RelaxedPrecision 
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
					                               Input f32_2* %22 = OpVariable Input 
					                             Private f32_4* %25 = OpVariable Private 
					                               Input f32_2* %30 = OpVariable Input 
					                               Input f32_2* %37 = OpVariable Input 
					                               Input f32_2* %44 = OpVariable Input 
					                               Input f32_2* %51 = OpVariable Input 
					                               Input f32_2* %58 = OpVariable Input 
					                                            %64 = OpTypePointer Private %6 
					                               Private f32* %65 = OpVariable Private 
					                                            %66 = OpTypeVector %6 3 
					                                        f32 %69 = OpConstant 3.674022E-40 
					                                        f32 %70 = OpConstant 3.674022E-40 
					                                        f32 %71 = OpConstant 3.674022E-40 
					                                      f32_3 %72 = OpConstantComposite %69 %70 %71 
					                                        f32 %75 = OpConstant 3.674022E-40 
					                                            %77 = OpTypePointer Output %7 
					                              Output f32_4* %78 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                 read_only Texture2DSampled %21 = OpLoad %13 
					                                      f32_2 %23 = OpLoad %22 
					                                      f32_4 %24 = OpImageSampleImplicitLod %21 %23 
					                                                    OpStore %20 %24 
					                                      f32_4 %26 = OpLoad %9 
					                                      f32_4 %27 = OpLoad %20 
					                                      f32_4 %28 = OpFAdd %26 %27 
					                                                    OpStore %25 %28 
					                 read_only Texture2DSampled %29 = OpLoad %13 
					                                      f32_2 %31 = OpLoad %30 
					                                      f32_4 %32 = OpImageSampleImplicitLod %29 %31 
					                                                    OpStore %20 %32 
					                                      f32_4 %33 = OpLoad %25 
					                                      f32_4 %34 = OpLoad %20 
					                                      f32_4 %35 = OpFAdd %33 %34 
					                                                    OpStore %25 %35 
					                 read_only Texture2DSampled %36 = OpLoad %13 
					                                      f32_2 %38 = OpLoad %37 
					                                      f32_4 %39 = OpImageSampleImplicitLod %36 %38 
					                                                    OpStore %20 %39 
					                                      f32_4 %40 = OpLoad %25 
					                                      f32_4 %41 = OpLoad %20 
					                                      f32_4 %42 = OpFAdd %40 %41 
					                                                    OpStore %25 %42 
					                 read_only Texture2DSampled %43 = OpLoad %13 
					                                      f32_2 %45 = OpLoad %44 
					                                      f32_4 %46 = OpImageSampleImplicitLod %43 %45 
					                                                    OpStore %20 %46 
					                                      f32_4 %47 = OpLoad %25 
					                                      f32_4 %48 = OpLoad %20 
					                                      f32_4 %49 = OpFAdd %47 %48 
					                                                    OpStore %25 %49 
					                 read_only Texture2DSampled %50 = OpLoad %13 
					                                      f32_2 %52 = OpLoad %51 
					                                      f32_4 %53 = OpImageSampleImplicitLod %50 %52 
					                                                    OpStore %20 %53 
					                                      f32_4 %54 = OpLoad %25 
					                                      f32_4 %55 = OpLoad %20 
					                                      f32_4 %56 = OpFAdd %54 %55 
					                                                    OpStore %25 %56 
					                 read_only Texture2DSampled %57 = OpLoad %13 
					                                      f32_2 %59 = OpLoad %58 
					                                      f32_4 %60 = OpImageSampleImplicitLod %57 %59 
					                                                    OpStore %20 %60 
					                                      f32_4 %61 = OpLoad %25 
					                                      f32_4 %62 = OpLoad %20 
					                                      f32_4 %63 = OpFAdd %61 %62 
					                                                    OpStore %25 %63 
					                                      f32_4 %67 = OpLoad %25 
					                                      f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
					                                        f32 %73 = OpDot %68 %72 
					                                                    OpStore %65 %73 
					                                        f32 %74 = OpLoad %65 
					                                        f32 %76 = OpFAdd %74 %75 
					                                                    OpStore %65 %76 
					                                      f32_4 %79 = OpLoad %25 
					                                        f32 %80 = OpLoad %65 
					                                      f32_4 %81 = OpCompositeConstruct %80 %80 %80 %80 
					                                      f32_4 %82 = OpFDiv %79 %81 
					                                                    OpStore %78 %82 
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
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 270892
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform mediump vec4 _Offsets;
					varying mediump vec2 xlv_TEXCOORD0;
					varying mediump vec4 xlv_TEXCOORD1;
					varying mediump vec4 xlv_TEXCOORD2;
					varying mediump vec4 xlv_TEXCOORD3;
					varying mediump vec4 xlv_TEXCOORD4;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  mediump vec4 tmpvar_2;
					  tmpvar_2 = (_Offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0));
					  xlv_TEXCOORD1 = (_glesMultiTexCoord0.xyxy + tmpvar_2);
					  xlv_TEXCOORD2 = (_glesMultiTexCoord0.xyxy + (tmpvar_2 * 2.0));
					  xlv_TEXCOORD3 = (_glesMultiTexCoord0.xyxy + (tmpvar_2 * 3.0));
					  xlv_TEXCOORD4 = (_glesMultiTexCoord0.xyxy + (tmpvar_2 * 5.0));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying mediump vec2 xlv_TEXCOORD0;
					varying mediump vec4 xlv_TEXCOORD1;
					varying mediump vec4 xlv_TEXCOORD2;
					varying mediump vec4 xlv_TEXCOORD3;
					varying mediump vec4 xlv_TEXCOORD4;
					void main ()
					{
					  mediump vec4 color_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  color_1 = (0.225 * tmpvar_2);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD1.xy);
					  color_1 = (color_1 + (0.15 * tmpvar_3));
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD1.zw);
					  color_1 = (color_1 + (0.15 * tmpvar_4));
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD2.xy);
					  color_1 = (color_1 + (0.11 * tmpvar_5));
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD2.zw);
					  color_1 = (color_1 + (0.11 * tmpvar_6));
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD3.xy);
					  color_1 = (color_1 + (0.075 * tmpvar_7));
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD3.zw);
					  color_1 = (color_1 + (0.075 * tmpvar_8));
					  lowp vec4 tmpvar_9;
					  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD4.xy);
					  color_1 = (color_1 + (0.0525 * tmpvar_9));
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD4.zw);
					  color_1 = (color_1 + (0.0525 * tmpvar_10));
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
					uniform mediump vec4 _Offsets;
					varying mediump vec2 xlv_TEXCOORD0;
					varying mediump vec4 xlv_TEXCOORD1;
					varying mediump vec4 xlv_TEXCOORD2;
					varying mediump vec4 xlv_TEXCOORD3;
					varying mediump vec4 xlv_TEXCOORD4;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  mediump vec4 tmpvar_2;
					  tmpvar_2 = (_Offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0));
					  xlv_TEXCOORD1 = (_glesMultiTexCoord0.xyxy + tmpvar_2);
					  xlv_TEXCOORD2 = (_glesMultiTexCoord0.xyxy + (tmpvar_2 * 2.0));
					  xlv_TEXCOORD3 = (_glesMultiTexCoord0.xyxy + (tmpvar_2 * 3.0));
					  xlv_TEXCOORD4 = (_glesMultiTexCoord0.xyxy + (tmpvar_2 * 5.0));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying mediump vec2 xlv_TEXCOORD0;
					varying mediump vec4 xlv_TEXCOORD1;
					varying mediump vec4 xlv_TEXCOORD2;
					varying mediump vec4 xlv_TEXCOORD3;
					varying mediump vec4 xlv_TEXCOORD4;
					void main ()
					{
					  mediump vec4 color_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  color_1 = (0.225 * tmpvar_2);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD1.xy);
					  color_1 = (color_1 + (0.15 * tmpvar_3));
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD1.zw);
					  color_1 = (color_1 + (0.15 * tmpvar_4));
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD2.xy);
					  color_1 = (color_1 + (0.11 * tmpvar_5));
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD2.zw);
					  color_1 = (color_1 + (0.11 * tmpvar_6));
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD3.xy);
					  color_1 = (color_1 + (0.075 * tmpvar_7));
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD3.zw);
					  color_1 = (color_1 + (0.075 * tmpvar_8));
					  lowp vec4 tmpvar_9;
					  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD4.xy);
					  color_1 = (color_1 + (0.0525 * tmpvar_9));
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD4.zw);
					  color_1 = (color_1 + (0.0525 * tmpvar_10));
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
					uniform mediump vec4 _Offsets;
					varying mediump vec2 xlv_TEXCOORD0;
					varying mediump vec4 xlv_TEXCOORD1;
					varying mediump vec4 xlv_TEXCOORD2;
					varying mediump vec4 xlv_TEXCOORD3;
					varying mediump vec4 xlv_TEXCOORD4;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1.w = 1.0;
					  tmpvar_1.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
					  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
					  mediump vec4 tmpvar_2;
					  tmpvar_2 = (_Offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0));
					  xlv_TEXCOORD1 = (_glesMultiTexCoord0.xyxy + tmpvar_2);
					  xlv_TEXCOORD2 = (_glesMultiTexCoord0.xyxy + (tmpvar_2 * 2.0));
					  xlv_TEXCOORD3 = (_glesMultiTexCoord0.xyxy + (tmpvar_2 * 3.0));
					  xlv_TEXCOORD4 = (_glesMultiTexCoord0.xyxy + (tmpvar_2 * 5.0));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying mediump vec2 xlv_TEXCOORD0;
					varying mediump vec4 xlv_TEXCOORD1;
					varying mediump vec4 xlv_TEXCOORD2;
					varying mediump vec4 xlv_TEXCOORD3;
					varying mediump vec4 xlv_TEXCOORD4;
					void main ()
					{
					  mediump vec4 color_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  color_1 = (0.225 * tmpvar_2);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD1.xy);
					  color_1 = (color_1 + (0.15 * tmpvar_3));
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD1.zw);
					  color_1 = (color_1 + (0.15 * tmpvar_4));
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD2.xy);
					  color_1 = (color_1 + (0.11 * tmpvar_5));
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD2.zw);
					  color_1 = (color_1 + (0.11 * tmpvar_6));
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD3.xy);
					  color_1 = (color_1 + (0.075 * tmpvar_7));
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD3.zw);
					  color_1 = (color_1 + (0.075 * tmpvar_8));
					  lowp vec4 tmpvar_9;
					  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD4.xy);
					  color_1 = (color_1 + (0.0525 * tmpvar_9));
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD4.zw);
					  color_1 = (color_1 + (0.0525 * tmpvar_10));
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
					uniform 	mediump vec4 _Offsets;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec4 vs_TEXCOORD1;
					out mediump vec4 vs_TEXCOORD2;
					out mediump vec4 vs_TEXCOORD3;
					out mediump vec4 vs_TEXCOORD4;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = _Offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = _Offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = _Offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD4 = _Offsets.xyxy * vec4(5.0, 5.0, -5.0, -5.0) + in_TEXCOORD0.xyxy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec4 vs_TEXCOORD1;
					in mediump vec4 vs_TEXCOORD2;
					in mediump vec4 vs_TEXCOORD3;
					in mediump vec4 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat10_0 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.224999994, 0.224999994, 0.224999994, 0.224999994) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.109999999, 0.109999999, 0.109999999, 0.109999999) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.109999999, 0.109999999, 0.109999999, 0.109999999) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.075000003, 0.075000003, 0.075000003, 0.075000003) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.075000003, 0.075000003, 0.075000003, 0.075000003) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.0524999984, 0.0524999984, 0.0524999984, 0.0524999984) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.0524999984, 0.0524999984, 0.0524999984, 0.0524999984) + u_xlat16_0;
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
					uniform 	mediump vec4 _Offsets;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec4 vs_TEXCOORD1;
					out mediump vec4 vs_TEXCOORD2;
					out mediump vec4 vs_TEXCOORD3;
					out mediump vec4 vs_TEXCOORD4;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = _Offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = _Offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = _Offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD4 = _Offsets.xyxy * vec4(5.0, 5.0, -5.0, -5.0) + in_TEXCOORD0.xyxy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec4 vs_TEXCOORD1;
					in mediump vec4 vs_TEXCOORD2;
					in mediump vec4 vs_TEXCOORD3;
					in mediump vec4 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat10_0 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.224999994, 0.224999994, 0.224999994, 0.224999994) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.109999999, 0.109999999, 0.109999999, 0.109999999) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.109999999, 0.109999999, 0.109999999, 0.109999999) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.075000003, 0.075000003, 0.075000003, 0.075000003) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.075000003, 0.075000003, 0.075000003, 0.075000003) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.0524999984, 0.0524999984, 0.0524999984, 0.0524999984) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.0524999984, 0.0524999984, 0.0524999984, 0.0524999984) + u_xlat16_0;
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
					uniform 	mediump vec4 _Offsets;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out mediump vec2 vs_TEXCOORD0;
					out mediump vec4 vs_TEXCOORD1;
					out mediump vec4 vs_TEXCOORD2;
					out mediump vec4 vs_TEXCOORD3;
					out mediump vec4 vs_TEXCOORD4;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = _Offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = _Offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = _Offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD4 = _Offsets.xyxy * vec4(5.0, 5.0, -5.0, -5.0) + in_TEXCOORD0.xyxy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform lowp sampler2D _MainTex;
					in mediump vec2 vs_TEXCOORD0;
					in mediump vec4 vs_TEXCOORD1;
					in mediump vec4 vs_TEXCOORD2;
					in mediump vec4 vs_TEXCOORD3;
					in mediump vec4 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat10_0 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.224999994, 0.224999994, 0.224999994, 0.224999994) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.109999999, 0.109999999, 0.109999999, 0.109999999) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.109999999, 0.109999999, 0.109999999, 0.109999999) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.075000003, 0.075000003, 0.075000003, 0.075000003) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.075000003, 0.075000003, 0.075000003, 0.075000003) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.0524999984, 0.0524999984, 0.0524999984, 0.0524999984) + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat16_0 = u_xlat10_1 * vec4(0.0524999984, 0.0524999984, 0.0524999984, 0.0524999984) + u_xlat16_0;
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
					; Bound: 139
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %79 %85 %87 %89 %100 %111 %122 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 RelaxedPrecision 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %77 0 BuiltIn 77 
					                                                     OpMemberDecorate %77 1 BuiltIn 77 
					                                                     OpMemberDecorate %77 2 BuiltIn 77 
					                                                     OpDecorate %77 Block 
					                                                     OpDecorate %85 RelaxedPrecision 
					                                                     OpDecorate %85 Location 85 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %87 Location 87 
					                                                     OpDecorate %88 RelaxedPrecision 
					                                                     OpDecorate %89 RelaxedPrecision 
					                                                     OpDecorate %89 Location 89 
					                                                     OpDecorate %91 RelaxedPrecision 
					                                                     OpDecorate %92 RelaxedPrecision 
					                                                     OpDecorate %96 RelaxedPrecision 
					                                                     OpDecorate %97 RelaxedPrecision 
					                                                     OpDecorate %98 RelaxedPrecision 
					                                                     OpDecorate %99 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %100 Location 100 
					                                                     OpDecorate %102 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %107 RelaxedPrecision 
					                                                     OpDecorate %108 RelaxedPrecision 
					                                                     OpDecorate %109 RelaxedPrecision 
					                                                     OpDecorate %110 RelaxedPrecision 
					                                                     OpDecorate %111 RelaxedPrecision 
					                                                     OpDecorate %111 Location 111 
					                                                     OpDecorate %113 RelaxedPrecision 
					                                                     OpDecorate %114 RelaxedPrecision 
					                                                     OpDecorate %118 RelaxedPrecision 
					                                                     OpDecorate %119 RelaxedPrecision 
					                                                     OpDecorate %120 RelaxedPrecision 
					                                                     OpDecorate %121 RelaxedPrecision 
					                                                     OpDecorate %122 RelaxedPrecision 
					                                                     OpDecorate %122 Location 122 
					                                                     OpDecorate %124 RelaxedPrecision 
					                                                     OpDecorate %125 RelaxedPrecision 
					                                                     OpDecorate %129 RelaxedPrecision 
					                                                     OpDecorate %130 RelaxedPrecision 
					                                                     OpDecorate %131 RelaxedPrecision 
					                                                     OpDecorate %132 RelaxedPrecision 
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
					                                         u32 %75 = OpConstant 1 
					                                             %76 = OpTypeArray %6 %75 
					                                             %77 = OpTypeStruct %7 %6 %76 
					                                             %78 = OpTypePointer Output %77 
					        Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
					                                             %81 = OpTypePointer Output %7 
					                                             %83 = OpTypeVector %6 2 
					                                             %84 = OpTypePointer Output %83 
					                               Output f32_2* %85 = OpVariable Output 
					                                             %86 = OpTypePointer Input %83 
					                                Input f32_2* %87 = OpVariable Input 
					                               Output f32_4* %89 = OpVariable Output 
					                                         f32 %93 = OpConstant 3.674022E-40 
					                                         f32 %94 = OpConstant 3.674022E-40 
					                                       f32_4 %95 = OpConstantComposite %93 %93 %94 %94 
					                              Output f32_4* %100 = OpVariable Output 
					                                        f32 %104 = OpConstant 3.674022E-40 
					                                        f32 %105 = OpConstant 3.674022E-40 
					                                      f32_4 %106 = OpConstantComposite %104 %104 %105 %105 
					                              Output f32_4* %111 = OpVariable Output 
					                                        f32 %115 = OpConstant 3.674022E-40 
					                                        f32 %116 = OpConstant 3.674022E-40 
					                                      f32_4 %117 = OpConstantComposite %115 %115 %116 %116 
					                              Output f32_4* %122 = OpVariable Output 
					                                        f32 %126 = OpConstant 3.674022E-40 
					                                        f32 %127 = OpConstant 3.674022E-40 
					                                      f32_4 %128 = OpConstantComposite %126 %126 %127 %127 
					                                            %133 = OpTypePointer Output %6 
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
					                              Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
					                                       f32_4 %69 = OpLoad %68 
					                                       f32_4 %70 = OpLoad %9 
					                                       f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
					                                       f32_4 %72 = OpFMul %69 %71 
					                                       f32_4 %73 = OpLoad %48 
					                                       f32_4 %74 = OpFAdd %72 %73 
					                                                     OpStore %9 %74 
					                                       f32_4 %80 = OpLoad %9 
					                               Output f32_4* %82 = OpAccessChain %79 %22 
					                                                     OpStore %82 %80 
					                                       f32_2 %88 = OpLoad %87 
					                                                     OpStore %85 %88 
					                              Uniform f32_4* %90 = OpAccessChain %20 %35 
					                                       f32_4 %91 = OpLoad %90 
					                                       f32_4 %92 = OpVectorShuffle %91 %91 0 1 0 1 
					                                       f32_4 %96 = OpFMul %92 %95 
					                                       f32_2 %97 = OpLoad %87 
					                                       f32_4 %98 = OpVectorShuffle %97 %97 0 1 0 1 
					                                       f32_4 %99 = OpFAdd %96 %98 
					                                                     OpStore %89 %99 
					                             Uniform f32_4* %101 = OpAccessChain %20 %35 
					                                      f32_4 %102 = OpLoad %101 
					                                      f32_4 %103 = OpVectorShuffle %102 %102 0 1 0 1 
					                                      f32_4 %107 = OpFMul %103 %106 
					                                      f32_2 %108 = OpLoad %87 
					                                      f32_4 %109 = OpVectorShuffle %108 %108 0 1 0 1 
					                                      f32_4 %110 = OpFAdd %107 %109 
					                                                     OpStore %100 %110 
					                             Uniform f32_4* %112 = OpAccessChain %20 %35 
					                                      f32_4 %113 = OpLoad %112 
					                                      f32_4 %114 = OpVectorShuffle %113 %113 0 1 0 1 
					                                      f32_4 %118 = OpFMul %114 %117 
					                                      f32_2 %119 = OpLoad %87 
					                                      f32_4 %120 = OpVectorShuffle %119 %119 0 1 0 1 
					                                      f32_4 %121 = OpFAdd %118 %120 
					                                                     OpStore %111 %121 
					                             Uniform f32_4* %123 = OpAccessChain %20 %35 
					                                      f32_4 %124 = OpLoad %123 
					                                      f32_4 %125 = OpVectorShuffle %124 %124 0 1 0 1 
					                                      f32_4 %129 = OpFMul %125 %128 
					                                      f32_2 %130 = OpLoad %87 
					                                      f32_4 %131 = OpVectorShuffle %130 %130 0 1 0 1 
					                                      f32_4 %132 = OpFAdd %129 %131 
					                                                     OpStore %122 %132 
					                                Output f32* %134 = OpAccessChain %79 %22 %75 
					                                        f32 %135 = OpLoad %134 
					                                        f32 %136 = OpFNegate %135 
					                                Output f32* %137 = OpAccessChain %79 %22 %75 
					                                                     OpStore %137 %136 
					                                                     OpReturn
					                                                     OpFunctionEnd

					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 107
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %16 %29 %47 %66 %85 %104 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %16 RelaxedPrecision 
					                                                    OpDecorate %16 Location 16 
					                                                    OpDecorate %18 RelaxedPrecision 
					                                                    OpDecorate %19 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %25 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %29 Location 29 
					                                                    OpDecorate %30 RelaxedPrecision 
					                                                    OpDecorate %32 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %39 RelaxedPrecision 
					                                                    OpDecorate %40 RelaxedPrecision 
					                                                    OpDecorate %42 RelaxedPrecision 
					                                                    OpDecorate %43 RelaxedPrecision 
					                                                    OpDecorate %44 RelaxedPrecision 
					                                                    OpDecorate %45 RelaxedPrecision 
					                                                    OpDecorate %46 RelaxedPrecision 
					                                                    OpDecorate %47 RelaxedPrecision 
					                                                    OpDecorate %47 Location 47 
					                                                    OpDecorate %48 RelaxedPrecision 
					                                                    OpDecorate %49 RelaxedPrecision 
					                                                    OpDecorate %51 RelaxedPrecision 
					                                                    OpDecorate %54 RelaxedPrecision 
					                                                    OpDecorate %55 RelaxedPrecision 
					                                                    OpDecorate %56 RelaxedPrecision 
					                                                    OpDecorate %57 RelaxedPrecision 
					                                                    OpDecorate %58 RelaxedPrecision 
					                                                    OpDecorate %59 RelaxedPrecision 
					                                                    OpDecorate %61 RelaxedPrecision 
					                                                    OpDecorate %62 RelaxedPrecision 
					                                                    OpDecorate %63 RelaxedPrecision 
					                                                    OpDecorate %64 RelaxedPrecision 
					                                                    OpDecorate %65 RelaxedPrecision 
					                                                    OpDecorate %66 RelaxedPrecision 
					                                                    OpDecorate %66 Location 66 
					                                                    OpDecorate %67 RelaxedPrecision 
					                                                    OpDecorate %68 RelaxedPrecision 
					                                                    OpDecorate %70 RelaxedPrecision 
					                                                    OpDecorate %73 RelaxedPrecision 
					                                                    OpDecorate %74 RelaxedPrecision 
					                                                    OpDecorate %75 RelaxedPrecision 
					                                                    OpDecorate %76 RelaxedPrecision 
					                                                    OpDecorate %77 RelaxedPrecision 
					                                                    OpDecorate %78 RelaxedPrecision 
					                                                    OpDecorate %80 RelaxedPrecision 
					                                                    OpDecorate %81 RelaxedPrecision 
					                                                    OpDecorate %82 RelaxedPrecision 
					                                                    OpDecorate %83 RelaxedPrecision 
					                                                    OpDecorate %84 RelaxedPrecision 
					                                                    OpDecorate %85 RelaxedPrecision 
					                                                    OpDecorate %85 Location 85 
					                                                    OpDecorate %86 RelaxedPrecision 
					                                                    OpDecorate %87 RelaxedPrecision 
					                                                    OpDecorate %89 RelaxedPrecision 
					                                                    OpDecorate %92 RelaxedPrecision 
					                                                    OpDecorate %93 RelaxedPrecision 
					                                                    OpDecorate %94 RelaxedPrecision 
					                                                    OpDecorate %95 RelaxedPrecision 
					                                                    OpDecorate %96 RelaxedPrecision 
					                                                    OpDecorate %97 RelaxedPrecision 
					                                                    OpDecorate %99 RelaxedPrecision 
					                                                    OpDecorate %100 RelaxedPrecision 
					                                                    OpDecorate %101 RelaxedPrecision 
					                                                    OpDecorate %102 RelaxedPrecision 
					                                                    OpDecorate %104 RelaxedPrecision 
					                                                    OpDecorate %104 Location 104 
					                                                    OpDecorate %105 RelaxedPrecision 
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
					                               Input f32_4* %85 = OpVariable Input 
					                                        f32 %90 = OpConstant 3.674022E-40 
					                                      f32_4 %91 = OpConstantComposite %90 %90 %90 %90 
					                                           %103 = OpTypePointer Output %7 
					                             Output f32_4* %104 = OpVariable Output 
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
					                 read_only Texture2DSampled %84 = OpLoad %13 
					                                      f32_4 %86 = OpLoad %85 
					                                      f32_2 %87 = OpVectorShuffle %86 %86 0 1 
					                                      f32_4 %88 = OpImageSampleImplicitLod %84 %87 
					                                                    OpStore %26 %88 
					                                      f32_4 %89 = OpLoad %26 
					                                      f32_4 %92 = OpFMul %89 %91 
					                                      f32_4 %93 = OpLoad %21 
					                                      f32_4 %94 = OpFAdd %92 %93 
					                                                    OpStore %21 %94 
					                 read_only Texture2DSampled %95 = OpLoad %13 
					                                      f32_4 %96 = OpLoad %85 
					                                      f32_2 %97 = OpVectorShuffle %96 %96 2 3 
					                                      f32_4 %98 = OpImageSampleImplicitLod %95 %97 
					                                                    OpStore %26 %98 
					                                      f32_4 %99 = OpLoad %26 
					                                     f32_4 %100 = OpFMul %99 %91 
					                                     f32_4 %101 = OpLoad %21 
					                                     f32_4 %102 = OpFAdd %100 %101 
					                                                    OpStore %21 %102 
					                                     f32_4 %105 = OpLoad %21 
					                                                    OpStore %104 %105 
					                                                    OpReturn
					                                                    OpFunctionEnd
"
				}
				SubProgram "vulkan hw_tier01 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 139
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %79 %85 %87 %89 %100 %111 %122 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 RelaxedPrecision 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %77 0 BuiltIn 77 
					                                                     OpMemberDecorate %77 1 BuiltIn 77 
					                                                     OpMemberDecorate %77 2 BuiltIn 77 
					                                                     OpDecorate %77 Block 
					                                                     OpDecorate %85 RelaxedPrecision 
					                                                     OpDecorate %85 Location 85 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %87 Location 87 
					                                                     OpDecorate %88 RelaxedPrecision 
					                                                     OpDecorate %89 RelaxedPrecision 
					                                                     OpDecorate %89 Location 89 
					                                                     OpDecorate %91 RelaxedPrecision 
					                                                     OpDecorate %92 RelaxedPrecision 
					                                                     OpDecorate %96 RelaxedPrecision 
					                                                     OpDecorate %97 RelaxedPrecision 
					                                                     OpDecorate %98 RelaxedPrecision 
					                                                     OpDecorate %99 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %100 Location 100 
					                                                     OpDecorate %102 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %107 RelaxedPrecision 
					                                                     OpDecorate %108 RelaxedPrecision 
					                                                     OpDecorate %109 RelaxedPrecision 
					                                                     OpDecorate %110 RelaxedPrecision 
					                                                     OpDecorate %111 RelaxedPrecision 
					                                                     OpDecorate %111 Location 111 
					                                                     OpDecorate %113 RelaxedPrecision 
					                                                     OpDecorate %114 RelaxedPrecision 
					                                                     OpDecorate %118 RelaxedPrecision 
					                                                     OpDecorate %119 RelaxedPrecision 
					                                                     OpDecorate %120 RelaxedPrecision 
					                                                     OpDecorate %121 RelaxedPrecision 
					                                                     OpDecorate %122 RelaxedPrecision 
					                                                     OpDecorate %122 Location 122 
					                                                     OpDecorate %124 RelaxedPrecision 
					                                                     OpDecorate %125 RelaxedPrecision 
					                                                     OpDecorate %129 RelaxedPrecision 
					                                                     OpDecorate %130 RelaxedPrecision 
					                                                     OpDecorate %131 RelaxedPrecision 
					                                                     OpDecorate %132 RelaxedPrecision 
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
					                                         u32 %75 = OpConstant 1 
					                                             %76 = OpTypeArray %6 %75 
					                                             %77 = OpTypeStruct %7 %6 %76 
					                                             %78 = OpTypePointer Output %77 
					        Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
					                                             %81 = OpTypePointer Output %7 
					                                             %83 = OpTypeVector %6 2 
					                                             %84 = OpTypePointer Output %83 
					                               Output f32_2* %85 = OpVariable Output 
					                                             %86 = OpTypePointer Input %83 
					                                Input f32_2* %87 = OpVariable Input 
					                               Output f32_4* %89 = OpVariable Output 
					                                         f32 %93 = OpConstant 3.674022E-40 
					                                         f32 %94 = OpConstant 3.674022E-40 
					                                       f32_4 %95 = OpConstantComposite %93 %93 %94 %94 
					                              Output f32_4* %100 = OpVariable Output 
					                                        f32 %104 = OpConstant 3.674022E-40 
					                                        f32 %105 = OpConstant 3.674022E-40 
					                                      f32_4 %106 = OpConstantComposite %104 %104 %105 %105 
					                              Output f32_4* %111 = OpVariable Output 
					                                        f32 %115 = OpConstant 3.674022E-40 
					                                        f32 %116 = OpConstant 3.674022E-40 
					                                      f32_4 %117 = OpConstantComposite %115 %115 %116 %116 
					                              Output f32_4* %122 = OpVariable Output 
					                                        f32 %126 = OpConstant 3.674022E-40 
					                                        f32 %127 = OpConstant 3.674022E-40 
					                                      f32_4 %128 = OpConstantComposite %126 %126 %127 %127 
					                                            %133 = OpTypePointer Output %6 
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
					                              Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
					                                       f32_4 %69 = OpLoad %68 
					                                       f32_4 %70 = OpLoad %9 
					                                       f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
					                                       f32_4 %72 = OpFMul %69 %71 
					                                       f32_4 %73 = OpLoad %48 
					                                       f32_4 %74 = OpFAdd %72 %73 
					                                                     OpStore %9 %74 
					                                       f32_4 %80 = OpLoad %9 
					                               Output f32_4* %82 = OpAccessChain %79 %22 
					                                                     OpStore %82 %80 
					                                       f32_2 %88 = OpLoad %87 
					                                                     OpStore %85 %88 
					                              Uniform f32_4* %90 = OpAccessChain %20 %35 
					                                       f32_4 %91 = OpLoad %90 
					                                       f32_4 %92 = OpVectorShuffle %91 %91 0 1 0 1 
					                                       f32_4 %96 = OpFMul %92 %95 
					                                       f32_2 %97 = OpLoad %87 
					                                       f32_4 %98 = OpVectorShuffle %97 %97 0 1 0 1 
					                                       f32_4 %99 = OpFAdd %96 %98 
					                                                     OpStore %89 %99 
					                             Uniform f32_4* %101 = OpAccessChain %20 %35 
					                                      f32_4 %102 = OpLoad %101 
					                                      f32_4 %103 = OpVectorShuffle %102 %102 0 1 0 1 
					                                      f32_4 %107 = OpFMul %103 %106 
					                                      f32_2 %108 = OpLoad %87 
					                                      f32_4 %109 = OpVectorShuffle %108 %108 0 1 0 1 
					                                      f32_4 %110 = OpFAdd %107 %109 
					                                                     OpStore %100 %110 
					                             Uniform f32_4* %112 = OpAccessChain %20 %35 
					                                      f32_4 %113 = OpLoad %112 
					                                      f32_4 %114 = OpVectorShuffle %113 %113 0 1 0 1 
					                                      f32_4 %118 = OpFMul %114 %117 
					                                      f32_2 %119 = OpLoad %87 
					                                      f32_4 %120 = OpVectorShuffle %119 %119 0 1 0 1 
					                                      f32_4 %121 = OpFAdd %118 %120 
					                                                     OpStore %111 %121 
					                             Uniform f32_4* %123 = OpAccessChain %20 %35 
					                                      f32_4 %124 = OpLoad %123 
					                                      f32_4 %125 = OpVectorShuffle %124 %124 0 1 0 1 
					                                      f32_4 %129 = OpFMul %125 %128 
					                                      f32_2 %130 = OpLoad %87 
					                                      f32_4 %131 = OpVectorShuffle %130 %130 0 1 0 1 
					                                      f32_4 %132 = OpFAdd %129 %131 
					                                                     OpStore %122 %132 
					                                Output f32* %134 = OpAccessChain %79 %22 %75 
					                                        f32 %135 = OpLoad %134 
					                                        f32 %136 = OpFNegate %135 
					                                Output f32* %137 = OpAccessChain %79 %22 %75 
					                                                     OpStore %137 %136 
					                                                     OpReturn
					                                                     OpFunctionEnd

					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 107
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %16 %29 %47 %66 %85 %104 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %16 RelaxedPrecision 
					                                                    OpDecorate %16 Location 16 
					                                                    OpDecorate %18 RelaxedPrecision 
					                                                    OpDecorate %19 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %25 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %29 Location 29 
					                                                    OpDecorate %30 RelaxedPrecision 
					                                                    OpDecorate %32 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %39 RelaxedPrecision 
					                                                    OpDecorate %40 RelaxedPrecision 
					                                                    OpDecorate %42 RelaxedPrecision 
					                                                    OpDecorate %43 RelaxedPrecision 
					                                                    OpDecorate %44 RelaxedPrecision 
					                                                    OpDecorate %45 RelaxedPrecision 
					                                                    OpDecorate %46 RelaxedPrecision 
					                                                    OpDecorate %47 RelaxedPrecision 
					                                                    OpDecorate %47 Location 47 
					                                                    OpDecorate %48 RelaxedPrecision 
					                                                    OpDecorate %49 RelaxedPrecision 
					                                                    OpDecorate %51 RelaxedPrecision 
					                                                    OpDecorate %54 RelaxedPrecision 
					                                                    OpDecorate %55 RelaxedPrecision 
					                                                    OpDecorate %56 RelaxedPrecision 
					                                                    OpDecorate %57 RelaxedPrecision 
					                                                    OpDecorate %58 RelaxedPrecision 
					                                                    OpDecorate %59 RelaxedPrecision 
					                                                    OpDecorate %61 RelaxedPrecision 
					                                                    OpDecorate %62 RelaxedPrecision 
					                                                    OpDecorate %63 RelaxedPrecision 
					                                                    OpDecorate %64 RelaxedPrecision 
					                                                    OpDecorate %65 RelaxedPrecision 
					                                                    OpDecorate %66 RelaxedPrecision 
					                                                    OpDecorate %66 Location 66 
					                                                    OpDecorate %67 RelaxedPrecision 
					                                                    OpDecorate %68 RelaxedPrecision 
					                                                    OpDecorate %70 RelaxedPrecision 
					                                                    OpDecorate %73 RelaxedPrecision 
					                                                    OpDecorate %74 RelaxedPrecision 
					                                                    OpDecorate %75 RelaxedPrecision 
					                                                    OpDecorate %76 RelaxedPrecision 
					                                                    OpDecorate %77 RelaxedPrecision 
					                                                    OpDecorate %78 RelaxedPrecision 
					                                                    OpDecorate %80 RelaxedPrecision 
					                                                    OpDecorate %81 RelaxedPrecision 
					                                                    OpDecorate %82 RelaxedPrecision 
					                                                    OpDecorate %83 RelaxedPrecision 
					                                                    OpDecorate %84 RelaxedPrecision 
					                                                    OpDecorate %85 RelaxedPrecision 
					                                                    OpDecorate %85 Location 85 
					                                                    OpDecorate %86 RelaxedPrecision 
					                                                    OpDecorate %87 RelaxedPrecision 
					                                                    OpDecorate %89 RelaxedPrecision 
					                                                    OpDecorate %92 RelaxedPrecision 
					                                                    OpDecorate %93 RelaxedPrecision 
					                                                    OpDecorate %94 RelaxedPrecision 
					                                                    OpDecorate %95 RelaxedPrecision 
					                                                    OpDecorate %96 RelaxedPrecision 
					                                                    OpDecorate %97 RelaxedPrecision 
					                                                    OpDecorate %99 RelaxedPrecision 
					                                                    OpDecorate %100 RelaxedPrecision 
					                                                    OpDecorate %101 RelaxedPrecision 
					                                                    OpDecorate %102 RelaxedPrecision 
					                                                    OpDecorate %104 RelaxedPrecision 
					                                                    OpDecorate %104 Location 104 
					                                                    OpDecorate %105 RelaxedPrecision 
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
					                               Input f32_4* %85 = OpVariable Input 
					                                        f32 %90 = OpConstant 3.674022E-40 
					                                      f32_4 %91 = OpConstantComposite %90 %90 %90 %90 
					                                           %103 = OpTypePointer Output %7 
					                             Output f32_4* %104 = OpVariable Output 
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
					                 read_only Texture2DSampled %84 = OpLoad %13 
					                                      f32_4 %86 = OpLoad %85 
					                                      f32_2 %87 = OpVectorShuffle %86 %86 0 1 
					                                      f32_4 %88 = OpImageSampleImplicitLod %84 %87 
					                                                    OpStore %26 %88 
					                                      f32_4 %89 = OpLoad %26 
					                                      f32_4 %92 = OpFMul %89 %91 
					                                      f32_4 %93 = OpLoad %21 
					                                      f32_4 %94 = OpFAdd %92 %93 
					                                                    OpStore %21 %94 
					                 read_only Texture2DSampled %95 = OpLoad %13 
					                                      f32_4 %96 = OpLoad %85 
					                                      f32_2 %97 = OpVectorShuffle %96 %96 2 3 
					                                      f32_4 %98 = OpImageSampleImplicitLod %95 %97 
					                                                    OpStore %26 %98 
					                                      f32_4 %99 = OpLoad %26 
					                                     f32_4 %100 = OpFMul %99 %91 
					                                     f32_4 %101 = OpLoad %21 
					                                     f32_4 %102 = OpFAdd %100 %101 
					                                                    OpStore %21 %102 
					                                     f32_4 %105 = OpLoad %21 
					                                                    OpStore %104 %105 
					                                                    OpReturn
					                                                    OpFunctionEnd
"
				}
				SubProgram "vulkan hw_tier02 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 139
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %79 %85 %87 %89 %100 %111 %122 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 RelaxedPrecision 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %77 0 BuiltIn 77 
					                                                     OpMemberDecorate %77 1 BuiltIn 77 
					                                                     OpMemberDecorate %77 2 BuiltIn 77 
					                                                     OpDecorate %77 Block 
					                                                     OpDecorate %85 RelaxedPrecision 
					                                                     OpDecorate %85 Location 85 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %87 Location 87 
					                                                     OpDecorate %88 RelaxedPrecision 
					                                                     OpDecorate %89 RelaxedPrecision 
					                                                     OpDecorate %89 Location 89 
					                                                     OpDecorate %91 RelaxedPrecision 
					                                                     OpDecorate %92 RelaxedPrecision 
					                                                     OpDecorate %96 RelaxedPrecision 
					                                                     OpDecorate %97 RelaxedPrecision 
					                                                     OpDecorate %98 RelaxedPrecision 
					                                                     OpDecorate %99 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %100 Location 100 
					                                                     OpDecorate %102 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %107 RelaxedPrecision 
					                                                     OpDecorate %108 RelaxedPrecision 
					                                                     OpDecorate %109 RelaxedPrecision 
					                                                     OpDecorate %110 RelaxedPrecision 
					                                                     OpDecorate %111 RelaxedPrecision 
					                                                     OpDecorate %111 Location 111 
					                                                     OpDecorate %113 RelaxedPrecision 
					                                                     OpDecorate %114 RelaxedPrecision 
					                                                     OpDecorate %118 RelaxedPrecision 
					                                                     OpDecorate %119 RelaxedPrecision 
					                                                     OpDecorate %120 RelaxedPrecision 
					                                                     OpDecorate %121 RelaxedPrecision 
					                                                     OpDecorate %122 RelaxedPrecision 
					                                                     OpDecorate %122 Location 122 
					                                                     OpDecorate %124 RelaxedPrecision 
					                                                     OpDecorate %125 RelaxedPrecision 
					                                                     OpDecorate %129 RelaxedPrecision 
					                                                     OpDecorate %130 RelaxedPrecision 
					                                                     OpDecorate %131 RelaxedPrecision 
					                                                     OpDecorate %132 RelaxedPrecision 
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
					                                         u32 %75 = OpConstant 1 
					                                             %76 = OpTypeArray %6 %75 
					                                             %77 = OpTypeStruct %7 %6 %76 
					                                             %78 = OpTypePointer Output %77 
					        Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
					                                             %81 = OpTypePointer Output %7 
					                                             %83 = OpTypeVector %6 2 
					                                             %84 = OpTypePointer Output %83 
					                               Output f32_2* %85 = OpVariable Output 
					                                             %86 = OpTypePointer Input %83 
					                                Input f32_2* %87 = OpVariable Input 
					                               Output f32_4* %89 = OpVariable Output 
					                                         f32 %93 = OpConstant 3.674022E-40 
					                                         f32 %94 = OpConstant 3.674022E-40 
					                                       f32_4 %95 = OpConstantComposite %93 %93 %94 %94 
					                              Output f32_4* %100 = OpVariable Output 
					                                        f32 %104 = OpConstant 3.674022E-40 
					                                        f32 %105 = OpConstant 3.674022E-40 
					                                      f32_4 %106 = OpConstantComposite %104 %104 %105 %105 
					                              Output f32_4* %111 = OpVariable Output 
					                                        f32 %115 = OpConstant 3.674022E-40 
					                                        f32 %116 = OpConstant 3.674022E-40 
					                                      f32_4 %117 = OpConstantComposite %115 %115 %116 %116 
					                              Output f32_4* %122 = OpVariable Output 
					                                        f32 %126 = OpConstant 3.674022E-40 
					                                        f32 %127 = OpConstant 3.674022E-40 
					                                      f32_4 %128 = OpConstantComposite %126 %126 %127 %127 
					                                            %133 = OpTypePointer Output %6 
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
					                              Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
					                                       f32_4 %69 = OpLoad %68 
					                                       f32_4 %70 = OpLoad %9 
					                                       f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
					                                       f32_4 %72 = OpFMul %69 %71 
					                                       f32_4 %73 = OpLoad %48 
					                                       f32_4 %74 = OpFAdd %72 %73 
					                                                     OpStore %9 %74 
					                                       f32_4 %80 = OpLoad %9 
					                               Output f32_4* %82 = OpAccessChain %79 %22 
					                                                     OpStore %82 %80 
					                                       f32_2 %88 = OpLoad %87 
					                                                     OpStore %85 %88 
					                              Uniform f32_4* %90 = OpAccessChain %20 %35 
					                                       f32_4 %91 = OpLoad %90 
					                                       f32_4 %92 = OpVectorShuffle %91 %91 0 1 0 1 
					                                       f32_4 %96 = OpFMul %92 %95 
					                                       f32_2 %97 = OpLoad %87 
					                                       f32_4 %98 = OpVectorShuffle %97 %97 0 1 0 1 
					                                       f32_4 %99 = OpFAdd %96 %98 
					                                                     OpStore %89 %99 
					                             Uniform f32_4* %101 = OpAccessChain %20 %35 
					                                      f32_4 %102 = OpLoad %101 
					                                      f32_4 %103 = OpVectorShuffle %102 %102 0 1 0 1 
					                                      f32_4 %107 = OpFMul %103 %106 
					                                      f32_2 %108 = OpLoad %87 
					                                      f32_4 %109 = OpVectorShuffle %108 %108 0 1 0 1 
					                                      f32_4 %110 = OpFAdd %107 %109 
					                                                     OpStore %100 %110 
					                             Uniform f32_4* %112 = OpAccessChain %20 %35 
					                                      f32_4 %113 = OpLoad %112 
					                                      f32_4 %114 = OpVectorShuffle %113 %113 0 1 0 1 
					                                      f32_4 %118 = OpFMul %114 %117 
					                                      f32_2 %119 = OpLoad %87 
					                                      f32_4 %120 = OpVectorShuffle %119 %119 0 1 0 1 
					                                      f32_4 %121 = OpFAdd %118 %120 
					                                                     OpStore %111 %121 
					                             Uniform f32_4* %123 = OpAccessChain %20 %35 
					                                      f32_4 %124 = OpLoad %123 
					                                      f32_4 %125 = OpVectorShuffle %124 %124 0 1 0 1 
					                                      f32_4 %129 = OpFMul %125 %128 
					                                      f32_2 %130 = OpLoad %87 
					                                      f32_4 %131 = OpVectorShuffle %130 %130 0 1 0 1 
					                                      f32_4 %132 = OpFAdd %129 %131 
					                                                     OpStore %122 %132 
					                                Output f32* %134 = OpAccessChain %79 %22 %75 
					                                        f32 %135 = OpLoad %134 
					                                        f32 %136 = OpFNegate %135 
					                                Output f32* %137 = OpAccessChain %79 %22 %75 
					                                                     OpStore %137 %136 
					                                                     OpReturn
					                                                     OpFunctionEnd

					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 107
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %16 %29 %47 %66 %85 %104 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %16 RelaxedPrecision 
					                                                    OpDecorate %16 Location 16 
					                                                    OpDecorate %18 RelaxedPrecision 
					                                                    OpDecorate %19 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %25 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %29 Location 29 
					                                                    OpDecorate %30 RelaxedPrecision 
					                                                    OpDecorate %32 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %39 RelaxedPrecision 
					                                                    OpDecorate %40 RelaxedPrecision 
					                                                    OpDecorate %42 RelaxedPrecision 
					                                                    OpDecorate %43 RelaxedPrecision 
					                                                    OpDecorate %44 RelaxedPrecision 
					                                                    OpDecorate %45 RelaxedPrecision 
					                                                    OpDecorate %46 RelaxedPrecision 
					                                                    OpDecorate %47 RelaxedPrecision 
					                                                    OpDecorate %47 Location 47 
					                                                    OpDecorate %48 RelaxedPrecision 
					                                                    OpDecorate %49 RelaxedPrecision 
					                                                    OpDecorate %51 RelaxedPrecision 
					                                                    OpDecorate %54 RelaxedPrecision 
					                                                    OpDecorate %55 RelaxedPrecision 
					                                                    OpDecorate %56 RelaxedPrecision 
					                                                    OpDecorate %57 RelaxedPrecision 
					                                                    OpDecorate %58 RelaxedPrecision 
					                                                    OpDecorate %59 RelaxedPrecision 
					                                                    OpDecorate %61 RelaxedPrecision 
					                                                    OpDecorate %62 RelaxedPrecision 
					                                                    OpDecorate %63 RelaxedPrecision 
					                                                    OpDecorate %64 RelaxedPrecision 
					                                                    OpDecorate %65 RelaxedPrecision 
					                                                    OpDecorate %66 RelaxedPrecision 
					                                                    OpDecorate %66 Location 66 
					                                                    OpDecorate %67 RelaxedPrecision 
					                                                    OpDecorate %68 RelaxedPrecision 
					                                                    OpDecorate %70 RelaxedPrecision 
					                                                    OpDecorate %73 RelaxedPrecision 
					                                                    OpDecorate %74 RelaxedPrecision 
					                                                    OpDecorate %75 RelaxedPrecision 
					                                                    OpDecorate %76 RelaxedPrecision 
					                                                    OpDecorate %77 RelaxedPrecision 
					                                                    OpDecorate %78 RelaxedPrecision 
					                                                    OpDecorate %80 RelaxedPrecision 
					                                                    OpDecorate %81 RelaxedPrecision 
					                                                    OpDecorate %82 RelaxedPrecision 
					                                                    OpDecorate %83 RelaxedPrecision 
					                                                    OpDecorate %84 RelaxedPrecision 
					                                                    OpDecorate %85 RelaxedPrecision 
					                                                    OpDecorate %85 Location 85 
					                                                    OpDecorate %86 RelaxedPrecision 
					                                                    OpDecorate %87 RelaxedPrecision 
					                                                    OpDecorate %89 RelaxedPrecision 
					                                                    OpDecorate %92 RelaxedPrecision 
					                                                    OpDecorate %93 RelaxedPrecision 
					                                                    OpDecorate %94 RelaxedPrecision 
					                                                    OpDecorate %95 RelaxedPrecision 
					                                                    OpDecorate %96 RelaxedPrecision 
					                                                    OpDecorate %97 RelaxedPrecision 
					                                                    OpDecorate %99 RelaxedPrecision 
					                                                    OpDecorate %100 RelaxedPrecision 
					                                                    OpDecorate %101 RelaxedPrecision 
					                                                    OpDecorate %102 RelaxedPrecision 
					                                                    OpDecorate %104 RelaxedPrecision 
					                                                    OpDecorate %104 Location 104 
					                                                    OpDecorate %105 RelaxedPrecision 
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
					                               Input f32_4* %85 = OpVariable Input 
					                                        f32 %90 = OpConstant 3.674022E-40 
					                                      f32_4 %91 = OpConstantComposite %90 %90 %90 %90 
					                                           %103 = OpTypePointer Output %7 
					                             Output f32_4* %104 = OpVariable Output 
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
					                 read_only Texture2DSampled %84 = OpLoad %13 
					                                      f32_4 %86 = OpLoad %85 
					                                      f32_2 %87 = OpVectorShuffle %86 %86 0 1 
					                                      f32_4 %88 = OpImageSampleImplicitLod %84 %87 
					                                                    OpStore %26 %88 
					                                      f32_4 %89 = OpLoad %26 
					                                      f32_4 %92 = OpFMul %89 %91 
					                                      f32_4 %93 = OpLoad %21 
					                                      f32_4 %94 = OpFAdd %92 %93 
					                                                    OpStore %21 %94 
					                 read_only Texture2DSampled %95 = OpLoad %13 
					                                      f32_4 %96 = OpLoad %85 
					                                      f32_2 %97 = OpVectorShuffle %96 %96 2 3 
					                                      f32_4 %98 = OpImageSampleImplicitLod %95 %97 
					                                                    OpStore %26 %98 
					                                      f32_4 %99 = OpLoad %26 
					                                     f32_4 %100 = OpFMul %99 %91 
					                                     f32_4 %101 = OpLoad %21 
					                                     f32_4 %102 = OpFAdd %100 %101 
					                                                    OpStore %21 %102 
					                                     f32_4 %105 = OpLoad %21 
					                                                    OpStore %104 %105 
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