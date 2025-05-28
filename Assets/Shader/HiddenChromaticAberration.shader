Shader "Hidden/ChromaticAberration" {
	Properties {
		_MainTex ("Base", 2D) = "" {}
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 17646
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
					uniform highp vec4 _MainTex_TexelSize;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 c_1;
					  lowp vec4 tmpvar_2;
					  highp vec2 P_3;
					  highp vec2 tmpvar_4;
					  tmpvar_4 = (_MainTex_TexelSize.xy * 0.5);
					  P_3 = (xlv_TEXCOORD0 + tmpvar_4);
					  tmpvar_2 = texture2D (_MainTex, P_3);
					  c_1 = tmpvar_2;
					  lowp vec4 tmpvar_5;
					  highp vec2 P_6;
					  P_6 = (xlv_TEXCOORD0 - tmpvar_4);
					  tmpvar_5 = texture2D (_MainTex, P_6);
					  c_1 = (c_1 + tmpvar_5);
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  highp vec2 tmpvar_9;
					  tmpvar_9 = (_MainTex_TexelSize.xy * vec2(0.5, -0.5));
					  P_8 = (xlv_TEXCOORD0 + tmpvar_9);
					  tmpvar_7 = texture2D (_MainTex, P_8);
					  c_1 = (c_1 + tmpvar_7);
					  lowp vec4 tmpvar_10;
					  highp vec2 P_11;
					  P_11 = (xlv_TEXCOORD0 - tmpvar_9);
					  tmpvar_10 = texture2D (_MainTex, P_11);
					  c_1 = (c_1 + tmpvar_10);
					  gl_FragData[0] = (c_1 / 4.0);
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
					uniform highp vec4 _MainTex_TexelSize;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 c_1;
					  lowp vec4 tmpvar_2;
					  highp vec2 P_3;
					  highp vec2 tmpvar_4;
					  tmpvar_4 = (_MainTex_TexelSize.xy * 0.5);
					  P_3 = (xlv_TEXCOORD0 + tmpvar_4);
					  tmpvar_2 = texture2D (_MainTex, P_3);
					  c_1 = tmpvar_2;
					  lowp vec4 tmpvar_5;
					  highp vec2 P_6;
					  P_6 = (xlv_TEXCOORD0 - tmpvar_4);
					  tmpvar_5 = texture2D (_MainTex, P_6);
					  c_1 = (c_1 + tmpvar_5);
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  highp vec2 tmpvar_9;
					  tmpvar_9 = (_MainTex_TexelSize.xy * vec2(0.5, -0.5));
					  P_8 = (xlv_TEXCOORD0 + tmpvar_9);
					  tmpvar_7 = texture2D (_MainTex, P_8);
					  c_1 = (c_1 + tmpvar_7);
					  lowp vec4 tmpvar_10;
					  highp vec2 P_11;
					  P_11 = (xlv_TEXCOORD0 - tmpvar_9);
					  tmpvar_10 = texture2D (_MainTex, P_11);
					  c_1 = (c_1 + tmpvar_10);
					  gl_FragData[0] = (c_1 / 4.0);
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
					uniform highp vec4 _MainTex_TexelSize;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 c_1;
					  lowp vec4 tmpvar_2;
					  highp vec2 P_3;
					  highp vec2 tmpvar_4;
					  tmpvar_4 = (_MainTex_TexelSize.xy * 0.5);
					  P_3 = (xlv_TEXCOORD0 + tmpvar_4);
					  tmpvar_2 = texture2D (_MainTex, P_3);
					  c_1 = tmpvar_2;
					  lowp vec4 tmpvar_5;
					  highp vec2 P_6;
					  P_6 = (xlv_TEXCOORD0 - tmpvar_4);
					  tmpvar_5 = texture2D (_MainTex, P_6);
					  c_1 = (c_1 + tmpvar_5);
					  lowp vec4 tmpvar_7;
					  highp vec2 P_8;
					  highp vec2 tmpvar_9;
					  tmpvar_9 = (_MainTex_TexelSize.xy * vec2(0.5, -0.5));
					  P_8 = (xlv_TEXCOORD0 + tmpvar_9);
					  tmpvar_7 = texture2D (_MainTex, P_8);
					  c_1 = (c_1 + tmpvar_7);
					  lowp vec4 tmpvar_10;
					  highp vec2 P_11;
					  P_11 = (xlv_TEXCOORD0 - tmpvar_9);
					  tmpvar_10 = texture2D (_MainTex, P_11);
					  c_1 = (c_1 + tmpvar_10);
					  gl_FragData[0] = (c_1 / 4.0);
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform lowp sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					vec4 u_xlat2;
					lowp vec4 u_xlat10_2;
					lowp vec4 u_xlat10_3;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.5, 0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat2 = (-_MainTex_TexelSize.xyxy) * vec4(0.5, 0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_1 = u_xlat10_1 + u_xlat10_3;
					    u_xlat16_0 = u_xlat10_0 + u_xlat16_1;
					    u_xlat16_0 = u_xlat10_2 + u_xlat16_0;
					    SV_Target0 = u_xlat16_0 * vec4(0.25, 0.25, 0.25, 0.25);
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform lowp sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					vec4 u_xlat2;
					lowp vec4 u_xlat10_2;
					lowp vec4 u_xlat10_3;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.5, 0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat2 = (-_MainTex_TexelSize.xyxy) * vec4(0.5, 0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_1 = u_xlat10_1 + u_xlat10_3;
					    u_xlat16_0 = u_xlat10_0 + u_xlat16_1;
					    u_xlat16_0 = u_xlat10_2 + u_xlat16_0;
					    SV_Target0 = u_xlat16_0 * vec4(0.25, 0.25, 0.25, 0.25);
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform lowp sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					vec4 u_xlat2;
					lowp vec4 u_xlat10_2;
					lowp vec4 u_xlat10_3;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.5, 0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat2 = (-_MainTex_TexelSize.xyxy) * vec4(0.5, 0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_1 = u_xlat10_1 + u_xlat10_3;
					    u_xlat16_0 = u_xlat10_0 + u_xlat16_1;
					    u_xlat16_0 = u_xlat10_2 + u_xlat16_0;
					    SV_Target0 = u_xlat16_0 * vec4(0.25, 0.25, 0.25, 0.25);
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
					; Bound: 80
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %25 %74 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpMemberDecorate %10 0 Offset 10 
					                                                    OpDecorate %10 Block 
					                                                    OpDecorate %12 DescriptorSet 12 
					                                                    OpDecorate %12 Binding 12 
					                                                    OpDecorate %25 Location 25 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %33 RelaxedPrecision 
					                                                    OpDecorate %33 DescriptorSet 33 
					                                                    OpDecorate %33 Binding 33 
					                                                    OpDecorate %34 RelaxedPrecision 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %39 RelaxedPrecision 
					                                                    OpDecorate %52 RelaxedPrecision 
					                                                    OpDecorate %53 RelaxedPrecision 
					                                                    OpDecorate %57 RelaxedPrecision 
					                                                    OpDecorate %58 RelaxedPrecision 
					                                                    OpDecorate %62 RelaxedPrecision 
					                                                    OpDecorate %63 RelaxedPrecision 
					                                                    OpDecorate %64 RelaxedPrecision 
					                                                    OpDecorate %65 RelaxedPrecision 
					                                                    OpDecorate %66 RelaxedPrecision 
					                                                    OpDecorate %67 RelaxedPrecision 
					                                                    OpDecorate %68 RelaxedPrecision 
					                                                    OpDecorate %69 RelaxedPrecision 
					                                                    OpDecorate %70 RelaxedPrecision 
					                                                    OpDecorate %71 RelaxedPrecision 
					                                                    OpDecorate %72 RelaxedPrecision 
					                                                    OpDecorate %74 RelaxedPrecision 
					                                                    OpDecorate %74 Location 74 
					                                                    OpDecorate %75 RelaxedPrecision 
					                                                    OpDecorate %78 RelaxedPrecision 
					                                             %2 = OpTypeVoid 
					                                             %3 = OpTypeFunction %2 
					                                             %6 = OpTypeFloat 32 
					                                             %7 = OpTypeVector %6 4 
					                                             %8 = OpTypePointer Private %7 
					                              Private f32_4* %9 = OpVariable Private 
					                                            %10 = OpTypeStruct %7 
					                                            %11 = OpTypePointer Uniform %10 
					                   Uniform struct {f32_4;}* %12 = OpVariable Uniform 
					                                            %13 = OpTypeInt 32 1 
					                                        i32 %14 = OpConstant 0 
					                                            %15 = OpTypePointer Uniform %7 
					                                        f32 %19 = OpConstant 3.674022E-40 
					                                        f32 %20 = OpConstant 3.674022E-40 
					                                      f32_4 %21 = OpConstantComposite %19 %19 %19 %20 
					                                            %23 = OpTypeVector %6 2 
					                                            %24 = OpTypePointer Input %23 
					                               Input f32_2* %25 = OpVariable Input 
					                             Private f32_4* %29 = OpVariable Private 
					                                            %30 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %31 = OpTypeSampledImage %30 
					                                            %32 = OpTypePointer UniformConstant %31 
					UniformConstant read_only Texture2DSampled* %33 = OpVariable UniformConstant 
					                             Private f32_4* %38 = OpVariable Private 
					                             Private f32_4* %43 = OpVariable Private 
					                             Private f32_4* %52 = OpVariable Private 
					                             Private f32_4* %57 = OpVariable Private 
					                             Private f32_4* %62 = OpVariable Private 
					                             Private f32_4* %66 = OpVariable Private 
					                                            %73 = OpTypePointer Output %7 
					                              Output f32_4* %74 = OpVariable Output 
					                                        f32 %76 = OpConstant 3.674022E-40 
					                                      f32_4 %77 = OpConstantComposite %76 %76 %76 %76 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                             Uniform f32_4* %16 = OpAccessChain %12 %14 
					                                      f32_4 %17 = OpLoad %16 
					                                      f32_4 %18 = OpVectorShuffle %17 %17 0 1 0 1 
					                                      f32_4 %22 = OpFMul %18 %21 
					                                      f32_2 %26 = OpLoad %25 
					                                      f32_4 %27 = OpVectorShuffle %26 %26 0 1 0 1 
					                                      f32_4 %28 = OpFAdd %22 %27 
					                                                    OpStore %9 %28 
					                 read_only Texture2DSampled %34 = OpLoad %33 
					                                      f32_4 %35 = OpLoad %9 
					                                      f32_2 %36 = OpVectorShuffle %35 %35 0 1 
					                                      f32_4 %37 = OpImageSampleImplicitLod %34 %36 
					                                                    OpStore %29 %37 
					                 read_only Texture2DSampled %39 = OpLoad %33 
					                                      f32_4 %40 = OpLoad %9 
					                                      f32_2 %41 = OpVectorShuffle %40 %40 2 3 
					                                      f32_4 %42 = OpImageSampleImplicitLod %39 %41 
					                                                    OpStore %38 %42 
					                             Uniform f32_4* %44 = OpAccessChain %12 %14 
					                                      f32_4 %45 = OpLoad %44 
					                                      f32_4 %46 = OpVectorShuffle %45 %45 0 1 0 1 
					                                      f32_4 %47 = OpFNegate %46 
					                                      f32_4 %48 = OpFMul %47 %21 
					                                      f32_2 %49 = OpLoad %25 
					                                      f32_4 %50 = OpVectorShuffle %49 %49 0 1 0 1 
					                                      f32_4 %51 = OpFAdd %48 %50 
					                                                    OpStore %43 %51 
					                 read_only Texture2DSampled %53 = OpLoad %33 
					                                      f32_4 %54 = OpLoad %43 
					                                      f32_2 %55 = OpVectorShuffle %54 %54 0 1 
					                                      f32_4 %56 = OpImageSampleImplicitLod %53 %55 
					                                                    OpStore %52 %56 
					                 read_only Texture2DSampled %58 = OpLoad %33 
					                                      f32_4 %59 = OpLoad %43 
					                                      f32_2 %60 = OpVectorShuffle %59 %59 2 3 
					                                      f32_4 %61 = OpImageSampleImplicitLod %58 %60 
					                                                    OpStore %57 %61 
					                                      f32_4 %63 = OpLoad %29 
					                                      f32_4 %64 = OpLoad %52 
					                                      f32_4 %65 = OpFAdd %63 %64 
					                                                    OpStore %62 %65 
					                                      f32_4 %67 = OpLoad %38 
					                                      f32_4 %68 = OpLoad %62 
					                                      f32_4 %69 = OpFAdd %67 %68 
					                                                    OpStore %66 %69 
					                                      f32_4 %70 = OpLoad %57 
					                                      f32_4 %71 = OpLoad %66 
					                                      f32_4 %72 = OpFAdd %70 %71 
					                                                    OpStore %66 %72 
					                                      f32_4 %75 = OpLoad %66 
					                                      f32_4 %78 = OpFMul %75 %77 
					                                                    OpStore %74 %78 
					                                                    OpReturn
					                                                    OpFunctionEnd"
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
					; Bound: 80
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %25 %74 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpMemberDecorate %10 0 Offset 10 
					                                                    OpDecorate %10 Block 
					                                                    OpDecorate %12 DescriptorSet 12 
					                                                    OpDecorate %12 Binding 12 
					                                                    OpDecorate %25 Location 25 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %33 RelaxedPrecision 
					                                                    OpDecorate %33 DescriptorSet 33 
					                                                    OpDecorate %33 Binding 33 
					                                                    OpDecorate %34 RelaxedPrecision 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %39 RelaxedPrecision 
					                                                    OpDecorate %52 RelaxedPrecision 
					                                                    OpDecorate %53 RelaxedPrecision 
					                                                    OpDecorate %57 RelaxedPrecision 
					                                                    OpDecorate %58 RelaxedPrecision 
					                                                    OpDecorate %62 RelaxedPrecision 
					                                                    OpDecorate %63 RelaxedPrecision 
					                                                    OpDecorate %64 RelaxedPrecision 
					                                                    OpDecorate %65 RelaxedPrecision 
					                                                    OpDecorate %66 RelaxedPrecision 
					                                                    OpDecorate %67 RelaxedPrecision 
					                                                    OpDecorate %68 RelaxedPrecision 
					                                                    OpDecorate %69 RelaxedPrecision 
					                                                    OpDecorate %70 RelaxedPrecision 
					                                                    OpDecorate %71 RelaxedPrecision 
					                                                    OpDecorate %72 RelaxedPrecision 
					                                                    OpDecorate %74 RelaxedPrecision 
					                                                    OpDecorate %74 Location 74 
					                                                    OpDecorate %75 RelaxedPrecision 
					                                                    OpDecorate %78 RelaxedPrecision 
					                                             %2 = OpTypeVoid 
					                                             %3 = OpTypeFunction %2 
					                                             %6 = OpTypeFloat 32 
					                                             %7 = OpTypeVector %6 4 
					                                             %8 = OpTypePointer Private %7 
					                              Private f32_4* %9 = OpVariable Private 
					                                            %10 = OpTypeStruct %7 
					                                            %11 = OpTypePointer Uniform %10 
					                   Uniform struct {f32_4;}* %12 = OpVariable Uniform 
					                                            %13 = OpTypeInt 32 1 
					                                        i32 %14 = OpConstant 0 
					                                            %15 = OpTypePointer Uniform %7 
					                                        f32 %19 = OpConstant 3.674022E-40 
					                                        f32 %20 = OpConstant 3.674022E-40 
					                                      f32_4 %21 = OpConstantComposite %19 %19 %19 %20 
					                                            %23 = OpTypeVector %6 2 
					                                            %24 = OpTypePointer Input %23 
					                               Input f32_2* %25 = OpVariable Input 
					                             Private f32_4* %29 = OpVariable Private 
					                                            %30 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %31 = OpTypeSampledImage %30 
					                                            %32 = OpTypePointer UniformConstant %31 
					UniformConstant read_only Texture2DSampled* %33 = OpVariable UniformConstant 
					                             Private f32_4* %38 = OpVariable Private 
					                             Private f32_4* %43 = OpVariable Private 
					                             Private f32_4* %52 = OpVariable Private 
					                             Private f32_4* %57 = OpVariable Private 
					                             Private f32_4* %62 = OpVariable Private 
					                             Private f32_4* %66 = OpVariable Private 
					                                            %73 = OpTypePointer Output %7 
					                              Output f32_4* %74 = OpVariable Output 
					                                        f32 %76 = OpConstant 3.674022E-40 
					                                      f32_4 %77 = OpConstantComposite %76 %76 %76 %76 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                             Uniform f32_4* %16 = OpAccessChain %12 %14 
					                                      f32_4 %17 = OpLoad %16 
					                                      f32_4 %18 = OpVectorShuffle %17 %17 0 1 0 1 
					                                      f32_4 %22 = OpFMul %18 %21 
					                                      f32_2 %26 = OpLoad %25 
					                                      f32_4 %27 = OpVectorShuffle %26 %26 0 1 0 1 
					                                      f32_4 %28 = OpFAdd %22 %27 
					                                                    OpStore %9 %28 
					                 read_only Texture2DSampled %34 = OpLoad %33 
					                                      f32_4 %35 = OpLoad %9 
					                                      f32_2 %36 = OpVectorShuffle %35 %35 0 1 
					                                      f32_4 %37 = OpImageSampleImplicitLod %34 %36 
					                                                    OpStore %29 %37 
					                 read_only Texture2DSampled %39 = OpLoad %33 
					                                      f32_4 %40 = OpLoad %9 
					                                      f32_2 %41 = OpVectorShuffle %40 %40 2 3 
					                                      f32_4 %42 = OpImageSampleImplicitLod %39 %41 
					                                                    OpStore %38 %42 
					                             Uniform f32_4* %44 = OpAccessChain %12 %14 
					                                      f32_4 %45 = OpLoad %44 
					                                      f32_4 %46 = OpVectorShuffle %45 %45 0 1 0 1 
					                                      f32_4 %47 = OpFNegate %46 
					                                      f32_4 %48 = OpFMul %47 %21 
					                                      f32_2 %49 = OpLoad %25 
					                                      f32_4 %50 = OpVectorShuffle %49 %49 0 1 0 1 
					                                      f32_4 %51 = OpFAdd %48 %50 
					                                                    OpStore %43 %51 
					                 read_only Texture2DSampled %53 = OpLoad %33 
					                                      f32_4 %54 = OpLoad %43 
					                                      f32_2 %55 = OpVectorShuffle %54 %54 0 1 
					                                      f32_4 %56 = OpImageSampleImplicitLod %53 %55 
					                                                    OpStore %52 %56 
					                 read_only Texture2DSampled %58 = OpLoad %33 
					                                      f32_4 %59 = OpLoad %43 
					                                      f32_2 %60 = OpVectorShuffle %59 %59 2 3 
					                                      f32_4 %61 = OpImageSampleImplicitLod %58 %60 
					                                                    OpStore %57 %61 
					                                      f32_4 %63 = OpLoad %29 
					                                      f32_4 %64 = OpLoad %52 
					                                      f32_4 %65 = OpFAdd %63 %64 
					                                                    OpStore %62 %65 
					                                      f32_4 %67 = OpLoad %38 
					                                      f32_4 %68 = OpLoad %62 
					                                      f32_4 %69 = OpFAdd %67 %68 
					                                                    OpStore %66 %69 
					                                      f32_4 %70 = OpLoad %57 
					                                      f32_4 %71 = OpLoad %66 
					                                      f32_4 %72 = OpFAdd %70 %71 
					                                                    OpStore %66 %72 
					                                      f32_4 %75 = OpLoad %66 
					                                      f32_4 %78 = OpFMul %75 %77 
					                                                    OpStore %74 %78 
					                                                    OpReturn
					                                                    OpFunctionEnd"
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
					; Bound: 80
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %25 %74 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpMemberDecorate %10 0 Offset 10 
					                                                    OpDecorate %10 Block 
					                                                    OpDecorate %12 DescriptorSet 12 
					                                                    OpDecorate %12 Binding 12 
					                                                    OpDecorate %25 Location 25 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %33 RelaxedPrecision 
					                                                    OpDecorate %33 DescriptorSet 33 
					                                                    OpDecorate %33 Binding 33 
					                                                    OpDecorate %34 RelaxedPrecision 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %39 RelaxedPrecision 
					                                                    OpDecorate %52 RelaxedPrecision 
					                                                    OpDecorate %53 RelaxedPrecision 
					                                                    OpDecorate %57 RelaxedPrecision 
					                                                    OpDecorate %58 RelaxedPrecision 
					                                                    OpDecorate %62 RelaxedPrecision 
					                                                    OpDecorate %63 RelaxedPrecision 
					                                                    OpDecorate %64 RelaxedPrecision 
					                                                    OpDecorate %65 RelaxedPrecision 
					                                                    OpDecorate %66 RelaxedPrecision 
					                                                    OpDecorate %67 RelaxedPrecision 
					                                                    OpDecorate %68 RelaxedPrecision 
					                                                    OpDecorate %69 RelaxedPrecision 
					                                                    OpDecorate %70 RelaxedPrecision 
					                                                    OpDecorate %71 RelaxedPrecision 
					                                                    OpDecorate %72 RelaxedPrecision 
					                                                    OpDecorate %74 RelaxedPrecision 
					                                                    OpDecorate %74 Location 74 
					                                                    OpDecorate %75 RelaxedPrecision 
					                                                    OpDecorate %78 RelaxedPrecision 
					                                             %2 = OpTypeVoid 
					                                             %3 = OpTypeFunction %2 
					                                             %6 = OpTypeFloat 32 
					                                             %7 = OpTypeVector %6 4 
					                                             %8 = OpTypePointer Private %7 
					                              Private f32_4* %9 = OpVariable Private 
					                                            %10 = OpTypeStruct %7 
					                                            %11 = OpTypePointer Uniform %10 
					                   Uniform struct {f32_4;}* %12 = OpVariable Uniform 
					                                            %13 = OpTypeInt 32 1 
					                                        i32 %14 = OpConstant 0 
					                                            %15 = OpTypePointer Uniform %7 
					                                        f32 %19 = OpConstant 3.674022E-40 
					                                        f32 %20 = OpConstant 3.674022E-40 
					                                      f32_4 %21 = OpConstantComposite %19 %19 %19 %20 
					                                            %23 = OpTypeVector %6 2 
					                                            %24 = OpTypePointer Input %23 
					                               Input f32_2* %25 = OpVariable Input 
					                             Private f32_4* %29 = OpVariable Private 
					                                            %30 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %31 = OpTypeSampledImage %30 
					                                            %32 = OpTypePointer UniformConstant %31 
					UniformConstant read_only Texture2DSampled* %33 = OpVariable UniformConstant 
					                             Private f32_4* %38 = OpVariable Private 
					                             Private f32_4* %43 = OpVariable Private 
					                             Private f32_4* %52 = OpVariable Private 
					                             Private f32_4* %57 = OpVariable Private 
					                             Private f32_4* %62 = OpVariable Private 
					                             Private f32_4* %66 = OpVariable Private 
					                                            %73 = OpTypePointer Output %7 
					                              Output f32_4* %74 = OpVariable Output 
					                                        f32 %76 = OpConstant 3.674022E-40 
					                                      f32_4 %77 = OpConstantComposite %76 %76 %76 %76 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                             Uniform f32_4* %16 = OpAccessChain %12 %14 
					                                      f32_4 %17 = OpLoad %16 
					                                      f32_4 %18 = OpVectorShuffle %17 %17 0 1 0 1 
					                                      f32_4 %22 = OpFMul %18 %21 
					                                      f32_2 %26 = OpLoad %25 
					                                      f32_4 %27 = OpVectorShuffle %26 %26 0 1 0 1 
					                                      f32_4 %28 = OpFAdd %22 %27 
					                                                    OpStore %9 %28 
					                 read_only Texture2DSampled %34 = OpLoad %33 
					                                      f32_4 %35 = OpLoad %9 
					                                      f32_2 %36 = OpVectorShuffle %35 %35 0 1 
					                                      f32_4 %37 = OpImageSampleImplicitLod %34 %36 
					                                                    OpStore %29 %37 
					                 read_only Texture2DSampled %39 = OpLoad %33 
					                                      f32_4 %40 = OpLoad %9 
					                                      f32_2 %41 = OpVectorShuffle %40 %40 2 3 
					                                      f32_4 %42 = OpImageSampleImplicitLod %39 %41 
					                                                    OpStore %38 %42 
					                             Uniform f32_4* %44 = OpAccessChain %12 %14 
					                                      f32_4 %45 = OpLoad %44 
					                                      f32_4 %46 = OpVectorShuffle %45 %45 0 1 0 1 
					                                      f32_4 %47 = OpFNegate %46 
					                                      f32_4 %48 = OpFMul %47 %21 
					                                      f32_2 %49 = OpLoad %25 
					                                      f32_4 %50 = OpVectorShuffle %49 %49 0 1 0 1 
					                                      f32_4 %51 = OpFAdd %48 %50 
					                                                    OpStore %43 %51 
					                 read_only Texture2DSampled %53 = OpLoad %33 
					                                      f32_4 %54 = OpLoad %43 
					                                      f32_2 %55 = OpVectorShuffle %54 %54 0 1 
					                                      f32_4 %56 = OpImageSampleImplicitLod %53 %55 
					                                                    OpStore %52 %56 
					                 read_only Texture2DSampled %58 = OpLoad %33 
					                                      f32_4 %59 = OpLoad %43 
					                                      f32_2 %60 = OpVectorShuffle %59 %59 2 3 
					                                      f32_4 %61 = OpImageSampleImplicitLod %58 %60 
					                                                    OpStore %57 %61 
					                                      f32_4 %63 = OpLoad %29 
					                                      f32_4 %64 = OpLoad %52 
					                                      f32_4 %65 = OpFAdd %63 %64 
					                                                    OpStore %62 %65 
					                                      f32_4 %67 = OpLoad %38 
					                                      f32_4 %68 = OpLoad %62 
					                                      f32_4 %69 = OpFAdd %67 %68 
					                                                    OpStore %66 %69 
					                                      f32_4 %70 = OpLoad %57 
					                                      f32_4 %71 = OpLoad %66 
					                                      f32_4 %72 = OpFAdd %70 %71 
					                                                    OpStore %66 %72 
					                                      f32_4 %75 = OpLoad %66 
					                                      f32_4 %78 = OpFMul %75 %77 
					                                                    OpStore %74 %78 
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
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 108323
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
					uniform highp vec4 _MainTex_TexelSize;
					uniform mediump float _ChromaticAberration;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 color_1;
					  mediump vec2 uvG_2;
					  mediump vec2 uv_3;
					  mediump vec2 coords_4;
					  coords_4 = xlv_TEXCOORD0;
					  uv_3 = xlv_TEXCOORD0;
					  coords_4 = ((coords_4 - 0.5) * 2.0);
					  mediump float tmpvar_5;
					  tmpvar_5 = dot (coords_4, coords_4);
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (uv_3 - ((_MainTex_TexelSize.xy * _ChromaticAberration) * (coords_4 * tmpvar_5)));
					  uvG_2 = tmpvar_6;
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, uv_3);
					  color_1.xzw = tmpvar_7.xzw;
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, uvG_2);
					  color_1.y = tmpvar_8.y;
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
					uniform highp vec4 _MainTex_TexelSize;
					uniform mediump float _ChromaticAberration;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 color_1;
					  mediump vec2 uvG_2;
					  mediump vec2 uv_3;
					  mediump vec2 coords_4;
					  coords_4 = xlv_TEXCOORD0;
					  uv_3 = xlv_TEXCOORD0;
					  coords_4 = ((coords_4 - 0.5) * 2.0);
					  mediump float tmpvar_5;
					  tmpvar_5 = dot (coords_4, coords_4);
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (uv_3 - ((_MainTex_TexelSize.xy * _ChromaticAberration) * (coords_4 * tmpvar_5)));
					  uvG_2 = tmpvar_6;
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, uv_3);
					  color_1.xzw = tmpvar_7.xzw;
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, uvG_2);
					  color_1.y = tmpvar_8.y;
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
					uniform highp vec4 _MainTex_TexelSize;
					uniform mediump float _ChromaticAberration;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 color_1;
					  mediump vec2 uvG_2;
					  mediump vec2 uv_3;
					  mediump vec2 coords_4;
					  coords_4 = xlv_TEXCOORD0;
					  uv_3 = xlv_TEXCOORD0;
					  coords_4 = ((coords_4 - 0.5) * 2.0);
					  mediump float tmpvar_5;
					  tmpvar_5 = dot (coords_4, coords_4);
					  highp vec2 tmpvar_6;
					  tmpvar_6 = (uv_3 - ((_MainTex_TexelSize.xy * _ChromaticAberration) * (coords_4 * tmpvar_5)));
					  uvG_2 = tmpvar_6;
					  lowp vec4 tmpvar_7;
					  tmpvar_7 = texture2D (_MainTex, uv_3);
					  color_1.xzw = tmpvar_7.xzw;
					  lowp vec4 tmpvar_8;
					  tmpvar_8 = texture2D (_MainTex, uvG_2);
					  color_1.y = tmpvar_8.y;
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	mediump float _ChromaticAberration;
					uniform lowp sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec2 u_xlat16_1;
					void main()
					{
					    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(_ChromaticAberration);
					    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_1.xy = u_xlat16_1.xy + u_xlat16_1.xy;
					    u_xlat0.xy = u_xlat0.xy * u_xlat16_1.xy;
					    u_xlat16_1.x = dot(u_xlat16_1.xy, u_xlat16_1.xy);
					    u_xlat0.xy = (-u_xlat0.xy) * u_xlat16_1.xx + vs_TEXCOORD0.xy;
					    u_xlat0.y = texture(_MainTex, u_xlat0.xy).y;
					    u_xlat0.xzw = texture(_MainTex, vs_TEXCOORD0.xy).xzw;
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	mediump float _ChromaticAberration;
					uniform lowp sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec2 u_xlat16_1;
					void main()
					{
					    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(_ChromaticAberration);
					    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_1.xy = u_xlat16_1.xy + u_xlat16_1.xy;
					    u_xlat0.xy = u_xlat0.xy * u_xlat16_1.xy;
					    u_xlat16_1.x = dot(u_xlat16_1.xy, u_xlat16_1.xy);
					    u_xlat0.xy = (-u_xlat0.xy) * u_xlat16_1.xx + vs_TEXCOORD0.xy;
					    u_xlat0.y = texture(_MainTex, u_xlat0.xy).y;
					    u_xlat0.xzw = texture(_MainTex, vs_TEXCOORD0.xy).xzw;
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	mediump float _ChromaticAberration;
					uniform lowp sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					mediump vec2 u_xlat16_1;
					void main()
					{
					    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(_ChromaticAberration);
					    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat16_1.xy = u_xlat16_1.xy + u_xlat16_1.xy;
					    u_xlat0.xy = u_xlat0.xy * u_xlat16_1.xy;
					    u_xlat16_1.x = dot(u_xlat16_1.xy, u_xlat16_1.xy);
					    u_xlat0.xy = (-u_xlat0.xy) * u_xlat16_1.xx + vs_TEXCOORD0.xy;
					    u_xlat0.y = texture(_MainTex, u_xlat0.xy).y;
					    u_xlat0.xzw = texture(_MainTex, vs_TEXCOORD0.xy).xzw;
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
					; Bound: 84
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %31 %81 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpMemberDecorate %10 0 Offset 10 
					                                                    OpMemberDecorate %10 1 RelaxedPrecision 
					                                                    OpMemberDecorate %10 1 Offset 10 
					                                                    OpDecorate %10 Block 
					                                                    OpDecorate %12 DescriptorSet 12 
					                                                    OpDecorate %12 Binding 12 
					                                                    OpDecorate %23 RelaxedPrecision 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %31 Location 31 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %41 RelaxedPrecision 
					                                                    OpDecorate %45 RelaxedPrecision 
					                                                    OpDecorate %46 RelaxedPrecision 
					                                                    OpDecorate %47 RelaxedPrecision 
					                                                    OpDecorate %55 RelaxedPrecision 
					                                                    OpDecorate %56 RelaxedPrecision 
					                                                    OpDecorate %65 RelaxedPrecision 
					                                                    OpDecorate %65 DescriptorSet 65 
					                                                    OpDecorate %65 Binding 65 
					                                                    OpDecorate %66 RelaxedPrecision 
					                                                    OpDecorate %71 RelaxedPrecision 
					                                                    OpDecorate %73 RelaxedPrecision 
					                                                    OpDecorate %77 RelaxedPrecision 
					                                                    OpDecorate %81 RelaxedPrecision 
					                                                    OpDecorate %81 Location 81 
					                                             %2 = OpTypeVoid 
					                                             %3 = OpTypeFunction %2 
					                                             %6 = OpTypeFloat 32 
					                                             %7 = OpTypeVector %6 4 
					                                             %8 = OpTypePointer Private %7 
					                              Private f32_4* %9 = OpVariable Private 
					                                            %10 = OpTypeStruct %7 %6 
					                                            %11 = OpTypePointer Uniform %10 
					              Uniform struct {f32_4; f32;}* %12 = OpVariable Uniform 
					                                            %13 = OpTypeInt 32 1 
					                                        i32 %14 = OpConstant 0 
					                                            %15 = OpTypeVector %6 2 
					                                            %16 = OpTypePointer Uniform %7 
					                                        i32 %20 = OpConstant 1 
					                                            %21 = OpTypePointer Uniform %6 
					                                            %28 = OpTypePointer Private %15 
					                             Private f32_2* %29 = OpVariable Private 
					                                            %30 = OpTypePointer Input %15 
					                               Input f32_2* %31 = OpVariable Input 
					                                        f32 %33 = OpConstant 3.674022E-40 
					                                      f32_2 %34 = OpConstantComposite %33 %33 
					                                            %48 = OpTypeInt 32 0 
					                                        u32 %49 = OpConstant 0 
					                                            %50 = OpTypePointer Private %6 
					                                            %62 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %63 = OpTypeSampledImage %62 
					                                            %64 = OpTypePointer UniformConstant %63 
					UniformConstant read_only Texture2DSampled* %65 = OpVariable UniformConstant 
					                                        u32 %70 = OpConstant 1 
					                                            %76 = OpTypeVector %6 3 
					                                            %80 = OpTypePointer Output %7 
					                              Output f32_4* %81 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                             Uniform f32_4* %17 = OpAccessChain %12 %14 
					                                      f32_4 %18 = OpLoad %17 
					                                      f32_2 %19 = OpVectorShuffle %18 %18 0 1 
					                               Uniform f32* %22 = OpAccessChain %12 %20 
					                                        f32 %23 = OpLoad %22 
					                                      f32_2 %24 = OpCompositeConstruct %23 %23 
					                                      f32_2 %25 = OpFMul %19 %24 
					                                      f32_4 %26 = OpLoad %9 
					                                      f32_4 %27 = OpVectorShuffle %26 %25 4 5 2 3 
					                                                    OpStore %9 %27 
					                                      f32_2 %32 = OpLoad %31 
					                                      f32_2 %35 = OpFAdd %32 %34 
					                                                    OpStore %29 %35 
					                                      f32_2 %36 = OpLoad %29 
					                                      f32_2 %37 = OpLoad %29 
					                                      f32_2 %38 = OpFAdd %36 %37 
					                                                    OpStore %29 %38 
					                                      f32_4 %39 = OpLoad %9 
					                                      f32_2 %40 = OpVectorShuffle %39 %39 0 1 
					                                      f32_2 %41 = OpLoad %29 
					                                      f32_2 %42 = OpFMul %40 %41 
					                                      f32_4 %43 = OpLoad %9 
					                                      f32_4 %44 = OpVectorShuffle %43 %42 4 5 2 3 
					                                                    OpStore %9 %44 
					                                      f32_2 %45 = OpLoad %29 
					                                      f32_2 %46 = OpLoad %29 
					                                        f32 %47 = OpDot %45 %46 
					                               Private f32* %51 = OpAccessChain %29 %49 
					                                                    OpStore %51 %47 
					                                      f32_4 %52 = OpLoad %9 
					                                      f32_2 %53 = OpVectorShuffle %52 %52 0 1 
					                                      f32_2 %54 = OpFNegate %53 
					                                      f32_2 %55 = OpLoad %29 
					                                      f32_2 %56 = OpVectorShuffle %55 %55 0 0 
					                                      f32_2 %57 = OpFMul %54 %56 
					                                      f32_2 %58 = OpLoad %31 
					                                      f32_2 %59 = OpFAdd %57 %58 
					                                      f32_4 %60 = OpLoad %9 
					                                      f32_4 %61 = OpVectorShuffle %60 %59 4 5 2 3 
					                                                    OpStore %9 %61 
					                 read_only Texture2DSampled %66 = OpLoad %65 
					                                      f32_4 %67 = OpLoad %9 
					                                      f32_2 %68 = OpVectorShuffle %67 %67 0 1 
					                                      f32_4 %69 = OpImageSampleImplicitLod %66 %68 
					                                        f32 %71 = OpCompositeExtract %69 1 
					                               Private f32* %72 = OpAccessChain %9 %70 
					                                                    OpStore %72 %71 
					                 read_only Texture2DSampled %73 = OpLoad %65 
					                                      f32_2 %74 = OpLoad %31 
					                                      f32_4 %75 = OpImageSampleImplicitLod %73 %74 
					                                      f32_3 %77 = OpVectorShuffle %75 %75 0 2 3 
					                                      f32_4 %78 = OpLoad %9 
					                                      f32_4 %79 = OpVectorShuffle %78 %77 4 1 5 6 
					                                                    OpStore %9 %79 
					                                      f32_4 %82 = OpLoad %9 
					                                                    OpStore %81 %82 
					                                                    OpReturn
					                                                    OpFunctionEnd"
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
					; Bound: 84
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %31 %81 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpMemberDecorate %10 0 Offset 10 
					                                                    OpMemberDecorate %10 1 RelaxedPrecision 
					                                                    OpMemberDecorate %10 1 Offset 10 
					                                                    OpDecorate %10 Block 
					                                                    OpDecorate %12 DescriptorSet 12 
					                                                    OpDecorate %12 Binding 12 
					                                                    OpDecorate %23 RelaxedPrecision 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %31 Location 31 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %41 RelaxedPrecision 
					                                                    OpDecorate %45 RelaxedPrecision 
					                                                    OpDecorate %46 RelaxedPrecision 
					                                                    OpDecorate %47 RelaxedPrecision 
					                                                    OpDecorate %55 RelaxedPrecision 
					                                                    OpDecorate %56 RelaxedPrecision 
					                                                    OpDecorate %65 RelaxedPrecision 
					                                                    OpDecorate %65 DescriptorSet 65 
					                                                    OpDecorate %65 Binding 65 
					                                                    OpDecorate %66 RelaxedPrecision 
					                                                    OpDecorate %71 RelaxedPrecision 
					                                                    OpDecorate %73 RelaxedPrecision 
					                                                    OpDecorate %77 RelaxedPrecision 
					                                                    OpDecorate %81 RelaxedPrecision 
					                                                    OpDecorate %81 Location 81 
					                                             %2 = OpTypeVoid 
					                                             %3 = OpTypeFunction %2 
					                                             %6 = OpTypeFloat 32 
					                                             %7 = OpTypeVector %6 4 
					                                             %8 = OpTypePointer Private %7 
					                              Private f32_4* %9 = OpVariable Private 
					                                            %10 = OpTypeStruct %7 %6 
					                                            %11 = OpTypePointer Uniform %10 
					              Uniform struct {f32_4; f32;}* %12 = OpVariable Uniform 
					                                            %13 = OpTypeInt 32 1 
					                                        i32 %14 = OpConstant 0 
					                                            %15 = OpTypeVector %6 2 
					                                            %16 = OpTypePointer Uniform %7 
					                                        i32 %20 = OpConstant 1 
					                                            %21 = OpTypePointer Uniform %6 
					                                            %28 = OpTypePointer Private %15 
					                             Private f32_2* %29 = OpVariable Private 
					                                            %30 = OpTypePointer Input %15 
					                               Input f32_2* %31 = OpVariable Input 
					                                        f32 %33 = OpConstant 3.674022E-40 
					                                      f32_2 %34 = OpConstantComposite %33 %33 
					                                            %48 = OpTypeInt 32 0 
					                                        u32 %49 = OpConstant 0 
					                                            %50 = OpTypePointer Private %6 
					                                            %62 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %63 = OpTypeSampledImage %62 
					                                            %64 = OpTypePointer UniformConstant %63 
					UniformConstant read_only Texture2DSampled* %65 = OpVariable UniformConstant 
					                                        u32 %70 = OpConstant 1 
					                                            %76 = OpTypeVector %6 3 
					                                            %80 = OpTypePointer Output %7 
					                              Output f32_4* %81 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                             Uniform f32_4* %17 = OpAccessChain %12 %14 
					                                      f32_4 %18 = OpLoad %17 
					                                      f32_2 %19 = OpVectorShuffle %18 %18 0 1 
					                               Uniform f32* %22 = OpAccessChain %12 %20 
					                                        f32 %23 = OpLoad %22 
					                                      f32_2 %24 = OpCompositeConstruct %23 %23 
					                                      f32_2 %25 = OpFMul %19 %24 
					                                      f32_4 %26 = OpLoad %9 
					                                      f32_4 %27 = OpVectorShuffle %26 %25 4 5 2 3 
					                                                    OpStore %9 %27 
					                                      f32_2 %32 = OpLoad %31 
					                                      f32_2 %35 = OpFAdd %32 %34 
					                                                    OpStore %29 %35 
					                                      f32_2 %36 = OpLoad %29 
					                                      f32_2 %37 = OpLoad %29 
					                                      f32_2 %38 = OpFAdd %36 %37 
					                                                    OpStore %29 %38 
					                                      f32_4 %39 = OpLoad %9 
					                                      f32_2 %40 = OpVectorShuffle %39 %39 0 1 
					                                      f32_2 %41 = OpLoad %29 
					                                      f32_2 %42 = OpFMul %40 %41 
					                                      f32_4 %43 = OpLoad %9 
					                                      f32_4 %44 = OpVectorShuffle %43 %42 4 5 2 3 
					                                                    OpStore %9 %44 
					                                      f32_2 %45 = OpLoad %29 
					                                      f32_2 %46 = OpLoad %29 
					                                        f32 %47 = OpDot %45 %46 
					                               Private f32* %51 = OpAccessChain %29 %49 
					                                                    OpStore %51 %47 
					                                      f32_4 %52 = OpLoad %9 
					                                      f32_2 %53 = OpVectorShuffle %52 %52 0 1 
					                                      f32_2 %54 = OpFNegate %53 
					                                      f32_2 %55 = OpLoad %29 
					                                      f32_2 %56 = OpVectorShuffle %55 %55 0 0 
					                                      f32_2 %57 = OpFMul %54 %56 
					                                      f32_2 %58 = OpLoad %31 
					                                      f32_2 %59 = OpFAdd %57 %58 
					                                      f32_4 %60 = OpLoad %9 
					                                      f32_4 %61 = OpVectorShuffle %60 %59 4 5 2 3 
					                                                    OpStore %9 %61 
					                 read_only Texture2DSampled %66 = OpLoad %65 
					                                      f32_4 %67 = OpLoad %9 
					                                      f32_2 %68 = OpVectorShuffle %67 %67 0 1 
					                                      f32_4 %69 = OpImageSampleImplicitLod %66 %68 
					                                        f32 %71 = OpCompositeExtract %69 1 
					                               Private f32* %72 = OpAccessChain %9 %70 
					                                                    OpStore %72 %71 
					                 read_only Texture2DSampled %73 = OpLoad %65 
					                                      f32_2 %74 = OpLoad %31 
					                                      f32_4 %75 = OpImageSampleImplicitLod %73 %74 
					                                      f32_3 %77 = OpVectorShuffle %75 %75 0 2 3 
					                                      f32_4 %78 = OpLoad %9 
					                                      f32_4 %79 = OpVectorShuffle %78 %77 4 1 5 6 
					                                                    OpStore %9 %79 
					                                      f32_4 %82 = OpLoad %9 
					                                                    OpStore %81 %82 
					                                                    OpReturn
					                                                    OpFunctionEnd"
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
					; Bound: 84
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %31 %81 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpMemberDecorate %10 0 Offset 10 
					                                                    OpMemberDecorate %10 1 RelaxedPrecision 
					                                                    OpMemberDecorate %10 1 Offset 10 
					                                                    OpDecorate %10 Block 
					                                                    OpDecorate %12 DescriptorSet 12 
					                                                    OpDecorate %12 Binding 12 
					                                                    OpDecorate %23 RelaxedPrecision 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %31 Location 31 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %41 RelaxedPrecision 
					                                                    OpDecorate %45 RelaxedPrecision 
					                                                    OpDecorate %46 RelaxedPrecision 
					                                                    OpDecorate %47 RelaxedPrecision 
					                                                    OpDecorate %55 RelaxedPrecision 
					                                                    OpDecorate %56 RelaxedPrecision 
					                                                    OpDecorate %65 RelaxedPrecision 
					                                                    OpDecorate %65 DescriptorSet 65 
					                                                    OpDecorate %65 Binding 65 
					                                                    OpDecorate %66 RelaxedPrecision 
					                                                    OpDecorate %71 RelaxedPrecision 
					                                                    OpDecorate %73 RelaxedPrecision 
					                                                    OpDecorate %77 RelaxedPrecision 
					                                                    OpDecorate %81 RelaxedPrecision 
					                                                    OpDecorate %81 Location 81 
					                                             %2 = OpTypeVoid 
					                                             %3 = OpTypeFunction %2 
					                                             %6 = OpTypeFloat 32 
					                                             %7 = OpTypeVector %6 4 
					                                             %8 = OpTypePointer Private %7 
					                              Private f32_4* %9 = OpVariable Private 
					                                            %10 = OpTypeStruct %7 %6 
					                                            %11 = OpTypePointer Uniform %10 
					              Uniform struct {f32_4; f32;}* %12 = OpVariable Uniform 
					                                            %13 = OpTypeInt 32 1 
					                                        i32 %14 = OpConstant 0 
					                                            %15 = OpTypeVector %6 2 
					                                            %16 = OpTypePointer Uniform %7 
					                                        i32 %20 = OpConstant 1 
					                                            %21 = OpTypePointer Uniform %6 
					                                            %28 = OpTypePointer Private %15 
					                             Private f32_2* %29 = OpVariable Private 
					                                            %30 = OpTypePointer Input %15 
					                               Input f32_2* %31 = OpVariable Input 
					                                        f32 %33 = OpConstant 3.674022E-40 
					                                      f32_2 %34 = OpConstantComposite %33 %33 
					                                            %48 = OpTypeInt 32 0 
					                                        u32 %49 = OpConstant 0 
					                                            %50 = OpTypePointer Private %6 
					                                            %62 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %63 = OpTypeSampledImage %62 
					                                            %64 = OpTypePointer UniformConstant %63 
					UniformConstant read_only Texture2DSampled* %65 = OpVariable UniformConstant 
					                                        u32 %70 = OpConstant 1 
					                                            %76 = OpTypeVector %6 3 
					                                            %80 = OpTypePointer Output %7 
					                              Output f32_4* %81 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                             Uniform f32_4* %17 = OpAccessChain %12 %14 
					                                      f32_4 %18 = OpLoad %17 
					                                      f32_2 %19 = OpVectorShuffle %18 %18 0 1 
					                               Uniform f32* %22 = OpAccessChain %12 %20 
					                                        f32 %23 = OpLoad %22 
					                                      f32_2 %24 = OpCompositeConstruct %23 %23 
					                                      f32_2 %25 = OpFMul %19 %24 
					                                      f32_4 %26 = OpLoad %9 
					                                      f32_4 %27 = OpVectorShuffle %26 %25 4 5 2 3 
					                                                    OpStore %9 %27 
					                                      f32_2 %32 = OpLoad %31 
					                                      f32_2 %35 = OpFAdd %32 %34 
					                                                    OpStore %29 %35 
					                                      f32_2 %36 = OpLoad %29 
					                                      f32_2 %37 = OpLoad %29 
					                                      f32_2 %38 = OpFAdd %36 %37 
					                                                    OpStore %29 %38 
					                                      f32_4 %39 = OpLoad %9 
					                                      f32_2 %40 = OpVectorShuffle %39 %39 0 1 
					                                      f32_2 %41 = OpLoad %29 
					                                      f32_2 %42 = OpFMul %40 %41 
					                                      f32_4 %43 = OpLoad %9 
					                                      f32_4 %44 = OpVectorShuffle %43 %42 4 5 2 3 
					                                                    OpStore %9 %44 
					                                      f32_2 %45 = OpLoad %29 
					                                      f32_2 %46 = OpLoad %29 
					                                        f32 %47 = OpDot %45 %46 
					                               Private f32* %51 = OpAccessChain %29 %49 
					                                                    OpStore %51 %47 
					                                      f32_4 %52 = OpLoad %9 
					                                      f32_2 %53 = OpVectorShuffle %52 %52 0 1 
					                                      f32_2 %54 = OpFNegate %53 
					                                      f32_2 %55 = OpLoad %29 
					                                      f32_2 %56 = OpVectorShuffle %55 %55 0 0 
					                                      f32_2 %57 = OpFMul %54 %56 
					                                      f32_2 %58 = OpLoad %31 
					                                      f32_2 %59 = OpFAdd %57 %58 
					                                      f32_4 %60 = OpLoad %9 
					                                      f32_4 %61 = OpVectorShuffle %60 %59 4 5 2 3 
					                                                    OpStore %9 %61 
					                 read_only Texture2DSampled %66 = OpLoad %65 
					                                      f32_4 %67 = OpLoad %9 
					                                      f32_2 %68 = OpVectorShuffle %67 %67 0 1 
					                                      f32_4 %69 = OpImageSampleImplicitLod %66 %68 
					                                        f32 %71 = OpCompositeExtract %69 1 
					                               Private f32* %72 = OpAccessChain %9 %70 
					                                                    OpStore %72 %71 
					                 read_only Texture2DSampled %73 = OpLoad %65 
					                                      f32_2 %74 = OpLoad %31 
					                                      f32_4 %75 = OpImageSampleImplicitLod %73 %74 
					                                      f32_3 %77 = OpVectorShuffle %75 %75 0 2 3 
					                                      f32_4 %78 = OpLoad %9 
					                                      f32_4 %79 = OpVectorShuffle %78 %77 4 1 5 6 
					                                                    OpStore %9 %79 
					                                      f32_4 %82 = OpLoad %9 
					                                                    OpStore %81 %82 
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
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 138271
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
					uniform highp vec4 _MainTex_TexelSize;
					uniform mediump float _ChromaticAberration;
					uniform mediump float _AxialAberration;
					uniform mediump float _Luminance;
					uniform mediump vec2 _BlurDistance;
					mediump vec2 SmallDiscKernel[9];
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  SmallDiscKernel[0] = vec2(-0.926212, -0.40581);
					  SmallDiscKernel[1] = vec2(-0.695914, 0.457137);
					  SmallDiscKernel[2] = vec2(-0.203345, 0.820716);
					  SmallDiscKernel[3] = vec2(0.96234, -0.194983);
					  SmallDiscKernel[4] = vec2(0.473434, -0.480026);
					  SmallDiscKernel[5] = vec2(0.519456, 0.767022);
					  SmallDiscKernel[6] = vec2(0.185461, -0.893124);
					  SmallDiscKernel[7] = vec2(0.89642, 0.412458);
					  SmallDiscKernel[8] = vec2(-0.32194, -0.932615);
					  mediump vec4 blurredTap_2;
					  mediump float maxOfs_3;
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
					  maxOfs_3 = clamp (max (_AxialAberration, (
					    (_ChromaticAberration * tmpvar_7)
					   * tmpvar_7)), _BlurDistance.x, _BlurDistance.y);
					  blurredTap_2 = (color_4 * 0.1);
					  for (highp int l_1 = 0; l_1 < 9; l_1++) {
					    mediump vec3 tap_9;
					    mediump vec2 sampleUV_10;
					    highp vec2 tmpvar_11;
					    tmpvar_11 = (uv_5 + ((SmallDiscKernel[l_1] * _MainTex_TexelSize.xy) * maxOfs_3));
					    sampleUV_10 = tmpvar_11;
					    lowp vec3 tmpvar_12;
					    tmpvar_12 = texture2D (_MainTex, sampleUV_10).xyz;
					    tap_9 = tmpvar_12;
					    blurredTap_2.xyz = (blurredTap_2.xyz + tap_9);
					  };
					  blurredTap_2.xyz = (blurredTap_2.xyz / 9.2);
					  color_4.xz = mix (color_4.xz, blurredTap_2.xz, vec2(clamp ((_Luminance * 
					    dot (abs((blurredTap_2.xyz - color_4.xyz)), vec3(0.22, 0.707, 0.071))
					  ), 0.0, 1.0)));
					  gl_FragData[0] = color_4;
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
					uniform highp vec4 _MainTex_TexelSize;
					uniform mediump float _ChromaticAberration;
					uniform mediump float _AxialAberration;
					uniform mediump float _Luminance;
					uniform mediump vec2 _BlurDistance;
					mediump vec2 SmallDiscKernel[9];
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  SmallDiscKernel[0] = vec2(-0.926212, -0.40581);
					  SmallDiscKernel[1] = vec2(-0.695914, 0.457137);
					  SmallDiscKernel[2] = vec2(-0.203345, 0.820716);
					  SmallDiscKernel[3] = vec2(0.96234, -0.194983);
					  SmallDiscKernel[4] = vec2(0.473434, -0.480026);
					  SmallDiscKernel[5] = vec2(0.519456, 0.767022);
					  SmallDiscKernel[6] = vec2(0.185461, -0.893124);
					  SmallDiscKernel[7] = vec2(0.89642, 0.412458);
					  SmallDiscKernel[8] = vec2(-0.32194, -0.932615);
					  mediump vec4 blurredTap_2;
					  mediump float maxOfs_3;
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
					  maxOfs_3 = clamp (max (_AxialAberration, (
					    (_ChromaticAberration * tmpvar_7)
					   * tmpvar_7)), _BlurDistance.x, _BlurDistance.y);
					  blurredTap_2 = (color_4 * 0.1);
					  for (highp int l_1 = 0; l_1 < 9; l_1++) {
					    mediump vec3 tap_9;
					    mediump vec2 sampleUV_10;
					    highp vec2 tmpvar_11;
					    tmpvar_11 = (uv_5 + ((SmallDiscKernel[l_1] * _MainTex_TexelSize.xy) * maxOfs_3));
					    sampleUV_10 = tmpvar_11;
					    lowp vec3 tmpvar_12;
					    tmpvar_12 = texture2D (_MainTex, sampleUV_10).xyz;
					    tap_9 = tmpvar_12;
					    blurredTap_2.xyz = (blurredTap_2.xyz + tap_9);
					  };
					  blurredTap_2.xyz = (blurredTap_2.xyz / 9.2);
					  color_4.xz = mix (color_4.xz, blurredTap_2.xz, vec2(clamp ((_Luminance * 
					    dot (abs((blurredTap_2.xyz - color_4.xyz)), vec3(0.22, 0.707, 0.071))
					  ), 0.0, 1.0)));
					  gl_FragData[0] = color_4;
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
					uniform highp vec4 _MainTex_TexelSize;
					uniform mediump float _ChromaticAberration;
					uniform mediump float _AxialAberration;
					uniform mediump float _Luminance;
					uniform mediump vec2 _BlurDistance;
					mediump vec2 SmallDiscKernel[9];
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  SmallDiscKernel[0] = vec2(-0.926212, -0.40581);
					  SmallDiscKernel[1] = vec2(-0.695914, 0.457137);
					  SmallDiscKernel[2] = vec2(-0.203345, 0.820716);
					  SmallDiscKernel[3] = vec2(0.96234, -0.194983);
					  SmallDiscKernel[4] = vec2(0.473434, -0.480026);
					  SmallDiscKernel[5] = vec2(0.519456, 0.767022);
					  SmallDiscKernel[6] = vec2(0.185461, -0.893124);
					  SmallDiscKernel[7] = vec2(0.89642, 0.412458);
					  SmallDiscKernel[8] = vec2(-0.32194, -0.932615);
					  mediump vec4 blurredTap_2;
					  mediump float maxOfs_3;
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
					  maxOfs_3 = clamp (max (_AxialAberration, (
					    (_ChromaticAberration * tmpvar_7)
					   * tmpvar_7)), _BlurDistance.x, _BlurDistance.y);
					  blurredTap_2 = (color_4 * 0.1);
					  for (highp int l_1 = 0; l_1 < 9; l_1++) {
					    mediump vec3 tap_9;
					    mediump vec2 sampleUV_10;
					    highp vec2 tmpvar_11;
					    tmpvar_11 = (uv_5 + ((SmallDiscKernel[l_1] * _MainTex_TexelSize.xy) * maxOfs_3));
					    sampleUV_10 = tmpvar_11;
					    lowp vec3 tmpvar_12;
					    tmpvar_12 = texture2D (_MainTex, sampleUV_10).xyz;
					    tap_9 = tmpvar_12;
					    blurredTap_2.xyz = (blurredTap_2.xyz + tap_9);
					  };
					  blurredTap_2.xyz = (blurredTap_2.xyz / 9.2);
					  color_4.xz = mix (color_4.xz, blurredTap_2.xz, vec2(clamp ((_Luminance * 
					    dot (abs((blurredTap_2.xyz - color_4.xyz)), vec3(0.22, 0.707, 0.071))
					  ), 0.0, 1.0)));
					  gl_FragData[0] = color_4;
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
					vec2 ImmCB_0_0_0[9];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	mediump float _ChromaticAberration;
					uniform 	mediump float _AxialAberration;
					uniform 	mediump float _Luminance;
					uniform 	mediump vec2 _BlurDistance;
					uniform lowp sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec2 u_xlat0;
					lowp vec4 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					vec2 u_xlat3;
					lowp vec3 u_xlat10_3;
					bool u_xlatb3;
					mediump vec3 u_xlat16_5;
					int u_xlati14;
					void main()
					{
						ImmCB_0_0_0[0] = vec2(-0.926212013, -0.405809999);
						ImmCB_0_0_0[1] = vec2(-0.69591397, 0.457136989);
						ImmCB_0_0_0[2] = vec2(-0.203345001, 0.820716023);
						ImmCB_0_0_0[3] = vec2(0.962339997, -0.194983006);
						ImmCB_0_0_0[4] = vec2(0.473434001, -0.480026007);
						ImmCB_0_0_0[5] = vec2(0.519456029, 0.767022014);
						ImmCB_0_0_0[6] = vec2(0.185461, -0.893123984);
						ImmCB_0_0_0[7] = vec2(0.896420002, 0.412458003);
						ImmCB_0_0_0[8] = vec2(-0.321940005, -0.932614982);
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat0.xy = u_xlat0.xy + u_xlat0.xy;
					    u_xlat16_1.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
					    u_xlat16_1.x = u_xlat16_1.x * _ChromaticAberration;
					    u_xlat16_1.x = max(u_xlat16_1.x, _AxialAberration);
					    u_xlat16_1.x = max(u_xlat16_1.x, _BlurDistance.x);
					    u_xlat16_1.x = min(u_xlat16_1.x, _BlurDistance.y);
					    u_xlat16_2.xyz = u_xlat10_0.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
					    u_xlat16_5.xyz = u_xlat16_2.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<9 ; u_xlati_loop_1++)
					    {
					        u_xlat3.xy = _MainTex_TexelSize.xy * ImmCB_0_0_0[u_xlati_loop_1].xy;
					        u_xlat3.xy = u_xlat3.xy * u_xlat16_1.xx + vs_TEXCOORD0.xy;
					        u_xlat10_3.xyz = texture(_MainTex, u_xlat3.xy).xyz;
					        u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat10_3.xyz;
					    }
					    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(0.108695656, 0.108695656, 0.108695656) + (-u_xlat10_0.xyz);
					    u_xlat16_5.x = dot(abs(u_xlat16_1.xyz), vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_5.x = u_xlat16_5.x * _Luminance;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
					#else
					    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
					#endif
					    SV_Target0.xz = u_xlat16_5.xx * u_xlat16_1.xz + u_xlat10_0.xz;
					    SV_Target0.yw = u_xlat10_0.yw;
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
					vec2 ImmCB_0_0_0[9];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	mediump float _ChromaticAberration;
					uniform 	mediump float _AxialAberration;
					uniform 	mediump float _Luminance;
					uniform 	mediump vec2 _BlurDistance;
					uniform lowp sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec2 u_xlat0;
					lowp vec4 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					vec2 u_xlat3;
					lowp vec3 u_xlat10_3;
					bool u_xlatb3;
					mediump vec3 u_xlat16_5;
					int u_xlati14;
					void main()
					{
						ImmCB_0_0_0[0] = vec2(-0.926212013, -0.405809999);
						ImmCB_0_0_0[1] = vec2(-0.69591397, 0.457136989);
						ImmCB_0_0_0[2] = vec2(-0.203345001, 0.820716023);
						ImmCB_0_0_0[3] = vec2(0.962339997, -0.194983006);
						ImmCB_0_0_0[4] = vec2(0.473434001, -0.480026007);
						ImmCB_0_0_0[5] = vec2(0.519456029, 0.767022014);
						ImmCB_0_0_0[6] = vec2(0.185461, -0.893123984);
						ImmCB_0_0_0[7] = vec2(0.896420002, 0.412458003);
						ImmCB_0_0_0[8] = vec2(-0.321940005, -0.932614982);
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat0.xy = u_xlat0.xy + u_xlat0.xy;
					    u_xlat16_1.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
					    u_xlat16_1.x = u_xlat16_1.x * _ChromaticAberration;
					    u_xlat16_1.x = max(u_xlat16_1.x, _AxialAberration);
					    u_xlat16_1.x = max(u_xlat16_1.x, _BlurDistance.x);
					    u_xlat16_1.x = min(u_xlat16_1.x, _BlurDistance.y);
					    u_xlat16_2.xyz = u_xlat10_0.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
					    u_xlat16_5.xyz = u_xlat16_2.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<9 ; u_xlati_loop_1++)
					    {
					        u_xlat3.xy = _MainTex_TexelSize.xy * ImmCB_0_0_0[u_xlati_loop_1].xy;
					        u_xlat3.xy = u_xlat3.xy * u_xlat16_1.xx + vs_TEXCOORD0.xy;
					        u_xlat10_3.xyz = texture(_MainTex, u_xlat3.xy).xyz;
					        u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat10_3.xyz;
					    }
					    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(0.108695656, 0.108695656, 0.108695656) + (-u_xlat10_0.xyz);
					    u_xlat16_5.x = dot(abs(u_xlat16_1.xyz), vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_5.x = u_xlat16_5.x * _Luminance;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
					#else
					    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
					#endif
					    SV_Target0.xz = u_xlat16_5.xx * u_xlat16_1.xz + u_xlat10_0.xz;
					    SV_Target0.yw = u_xlat10_0.yw;
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
					vec2 ImmCB_0_0_0[9];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	mediump float _ChromaticAberration;
					uniform 	mediump float _AxialAberration;
					uniform 	mediump float _Luminance;
					uniform 	mediump vec2 _BlurDistance;
					uniform lowp sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec2 u_xlat0;
					lowp vec4 u_xlat10_0;
					mediump vec3 u_xlat16_1;
					mediump vec3 u_xlat16_2;
					vec2 u_xlat3;
					lowp vec3 u_xlat10_3;
					bool u_xlatb3;
					mediump vec3 u_xlat16_5;
					int u_xlati14;
					void main()
					{
						ImmCB_0_0_0[0] = vec2(-0.926212013, -0.405809999);
						ImmCB_0_0_0[1] = vec2(-0.69591397, 0.457136989);
						ImmCB_0_0_0[2] = vec2(-0.203345001, 0.820716023);
						ImmCB_0_0_0[3] = vec2(0.962339997, -0.194983006);
						ImmCB_0_0_0[4] = vec2(0.473434001, -0.480026007);
						ImmCB_0_0_0[5] = vec2(0.519456029, 0.767022014);
						ImmCB_0_0_0[6] = vec2(0.185461, -0.893123984);
						ImmCB_0_0_0[7] = vec2(0.896420002, 0.412458003);
						ImmCB_0_0_0[8] = vec2(-0.321940005, -0.932614982);
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat0.xy = u_xlat0.xy + u_xlat0.xy;
					    u_xlat16_1.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
					    u_xlat16_1.x = u_xlat16_1.x * _ChromaticAberration;
					    u_xlat16_1.x = max(u_xlat16_1.x, _AxialAberration);
					    u_xlat16_1.x = max(u_xlat16_1.x, _BlurDistance.x);
					    u_xlat16_1.x = min(u_xlat16_1.x, _BlurDistance.y);
					    u_xlat16_2.xyz = u_xlat10_0.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
					    u_xlat16_5.xyz = u_xlat16_2.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<9 ; u_xlati_loop_1++)
					    {
					        u_xlat3.xy = _MainTex_TexelSize.xy * ImmCB_0_0_0[u_xlati_loop_1].xy;
					        u_xlat3.xy = u_xlat3.xy * u_xlat16_1.xx + vs_TEXCOORD0.xy;
					        u_xlat10_3.xyz = texture(_MainTex, u_xlat3.xy).xyz;
					        u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat10_3.xyz;
					    }
					    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(0.108695656, 0.108695656, 0.108695656) + (-u_xlat10_0.xyz);
					    u_xlat16_5.x = dot(abs(u_xlat16_1.xyz), vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_5.x = u_xlat16_5.x * _Luminance;
					#ifdef UNITY_ADRENO_ES3
					    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
					#else
					    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
					#endif
					    SV_Target0.xz = u_xlat16_5.xx * u_xlat16_1.xz + u_xlat10_0.xz;
					    SV_Target0.yw = u_xlat10_0.yw;
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
					; Bound: 217
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %62 %197 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpDecorate %62 Location 62 
					                                                      OpDecorate %72 RelaxedPrecision 
					                                                      OpDecorate %81 RelaxedPrecision 
					                                                      OpDecorate %85 RelaxedPrecision 
					                                                      OpDecorate %85 DescriptorSet 85 
					                                                      OpDecorate %85 Binding 85 
					                                                      OpDecorate %86 RelaxedPrecision 
					                                                      OpDecorate %90 RelaxedPrecision 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %93 RelaxedPrecision 
					                                                      OpDecorate %96 RelaxedPrecision 
					                                                      OpMemberDecorate %97 0 Offset 97 
					                                                      OpMemberDecorate %97 1 RelaxedPrecision 
					                                                      OpMemberDecorate %97 1 Offset 97 
					                                                      OpMemberDecorate %97 2 RelaxedPrecision 
					                                                      OpMemberDecorate %97 2 Offset 97 
					                                                      OpMemberDecorate %97 3 RelaxedPrecision 
					                                                      OpMemberDecorate %97 3 Offset 97 
					                                                      OpMemberDecorate %97 4 RelaxedPrecision 
					                                                      OpMemberDecorate %97 4 Offset 97 
					                                                      OpDecorate %97 Block 
					                                                      OpDecorate %99 DescriptorSet 99 
					                                                      OpDecorate %99 Binding 99 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate %108 RelaxedPrecision 
					                                                      OpDecorate %109 RelaxedPrecision 
					                                                      OpDecorate %112 RelaxedPrecision 
					                                                      OpDecorate %114 RelaxedPrecision 
					                                                      OpDecorate %115 RelaxedPrecision 
					                                                      OpDecorate %118 RelaxedPrecision 
					                                                      OpDecorate %121 RelaxedPrecision 
					                                                      OpDecorate %122 RelaxedPrecision 
					                                                      OpDecorate %124 RelaxedPrecision 
					                                                      OpDecorate %125 RelaxedPrecision 
					                                                      OpDecorate %126 RelaxedPrecision 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %130 RelaxedPrecision 
					                                                      OpDecorate %131 RelaxedPrecision 
					                                                      OpDecorate %153 RelaxedPrecision 
					                                                      OpDecorate %154 RelaxedPrecision 
					                                                      OpDecorate %158 RelaxedPrecision 
					                                                      OpDecorate %159 RelaxedPrecision 
					                                                      OpDecorate %162 RelaxedPrecision 
					                                                      OpDecorate %163 RelaxedPrecision 
					                                                      OpDecorate %164 RelaxedPrecision 
					                                                      OpDecorate %165 RelaxedPrecision 
					                                                      OpDecorate %168 RelaxedPrecision 
					                                                      OpDecorate %171 RelaxedPrecision 
					                                                      OpDecorate %172 RelaxedPrecision 
					                                                      OpDecorate %173 RelaxedPrecision 
					                                                      OpDecorate %174 RelaxedPrecision 
					                                                      OpDecorate %175 RelaxedPrecision 
					                                                      OpDecorate %176 RelaxedPrecision 
					                                                      OpDecorate %177 RelaxedPrecision 
					                                                      OpDecorate %182 RelaxedPrecision 
					                                                      OpDecorate %185 RelaxedPrecision 
					                                                      OpDecorate %187 RelaxedPrecision 
					                                                      OpDecorate %188 RelaxedPrecision 
					                                                      OpDecorate %191 RelaxedPrecision 
					                                                      OpDecorate %194 RelaxedPrecision 
					                                                      OpDecorate %197 RelaxedPrecision 
					                                                      OpDecorate %197 Location 197 
					                                                      OpDecorate %198 RelaxedPrecision 
					                                                      OpDecorate %199 RelaxedPrecision 
					                                                      OpDecorate %200 RelaxedPrecision 
					                                                      OpDecorate %201 RelaxedPrecision 
					                                                      OpDecorate %202 RelaxedPrecision 
					                                                      OpDecorate %203 RelaxedPrecision 
					                                                      OpDecorate %204 RelaxedPrecision 
					                                                      OpDecorate %205 RelaxedPrecision 
					                                                      OpDecorate %208 RelaxedPrecision 
					                                                      OpDecorate %209 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 2 
					                                               %8 = OpTypeInt 32 0 
					                                           u32 %9 = OpConstant 9 
					                                              %10 = OpTypeArray %7 %9 
					                                              %11 = OpTypePointer Private %10 
					                            Private f32_2[9]* %12 = OpVariable Private 
					                                              %13 = OpTypeInt 32 1 
					                                          i32 %14 = OpConstant 0 
					                                          f32 %15 = OpConstant 3.674022E-40 
					                                          f32 %16 = OpConstant 3.674022E-40 
					                                        f32_2 %17 = OpConstantComposite %15 %16 
					                                              %18 = OpTypePointer Private %7 
					                                          i32 %20 = OpConstant 1 
					                                          f32 %21 = OpConstant 3.674022E-40 
					                                          f32 %22 = OpConstant 3.674022E-40 
					                                        f32_2 %23 = OpConstantComposite %21 %22 
					                                          i32 %25 = OpConstant 2 
					                                          f32 %26 = OpConstant 3.674022E-40 
					                                          f32 %27 = OpConstant 3.674022E-40 
					                                        f32_2 %28 = OpConstantComposite %26 %27 
					                                          i32 %30 = OpConstant 3 
					                                          f32 %31 = OpConstant 3.674022E-40 
					                                          f32 %32 = OpConstant 3.674022E-40 
					                                        f32_2 %33 = OpConstantComposite %31 %32 
					                                          i32 %35 = OpConstant 4 
					                                          f32 %36 = OpConstant 3.674022E-40 
					                                          f32 %37 = OpConstant 3.674022E-40 
					                                        f32_2 %38 = OpConstantComposite %36 %37 
					                                          i32 %40 = OpConstant 5 
					                                          f32 %41 = OpConstant 3.674022E-40 
					                                          f32 %42 = OpConstant 3.674022E-40 
					                                        f32_2 %43 = OpConstantComposite %41 %42 
					                                          i32 %45 = OpConstant 6 
					                                          f32 %46 = OpConstant 3.674022E-40 
					                                          f32 %47 = OpConstant 3.674022E-40 
					                                        f32_2 %48 = OpConstantComposite %46 %47 
					                                          i32 %50 = OpConstant 7 
					                                          f32 %51 = OpConstant 3.674022E-40 
					                                          f32 %52 = OpConstant 3.674022E-40 
					                                        f32_2 %53 = OpConstantComposite %51 %52 
					                                          i32 %55 = OpConstant 8 
					                                          f32 %56 = OpConstant 3.674022E-40 
					                                          f32 %57 = OpConstant 3.674022E-40 
					                                        f32_2 %58 = OpConstantComposite %56 %57 
					                               Private f32_2* %60 = OpVariable Private 
					                                              %61 = OpTypePointer Input %7 
					                                 Input f32_2* %62 = OpVariable Input 
					                                          f32 %64 = OpConstant 3.674022E-40 
					                                        f32_2 %65 = OpConstantComposite %64 %64 
					                                              %70 = OpTypeVector %6 3 
					                                              %71 = OpTypePointer Private %70 
					                               Private f32_3* %72 = OpVariable Private 
					                                          u32 %76 = OpConstant 0 
					                                              %77 = OpTypePointer Private %6 
					                                              %79 = OpTypeVector %6 4 
					                                              %80 = OpTypePointer Private %79 
					                               Private f32_4* %81 = OpVariable Private 
					                                              %82 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %83 = OpTypeSampledImage %82 
					                                              %84 = OpTypePointer UniformConstant %83 
					  UniformConstant read_only Texture2DSampled* %85 = OpVariable UniformConstant 
					                                              %97 = OpTypeStruct %79 %6 %6 %6 %7 
					                                              %98 = OpTypePointer Uniform %97 
					Uniform struct {f32_4; f32; f32; f32; f32_2;}* %99 = OpVariable Uniform 
					                                             %100 = OpTypePointer Uniform %6 
					                                         u32 %119 = OpConstant 1 
					                              Private f32_3* %124 = OpVariable Private 
					                                         f32 %127 = OpConstant 3.674022E-40 
					                                       f32_3 %128 = OpConstantComposite %127 %127 %127 
					                              Private f32_3* %130 = OpVariable Private 
					                                             %132 = OpTypePointer Function %13 
					                                         i32 %140 = OpConstant 9 
					                                             %141 = OpTypeBool 
					                              Private f32_2* %143 = OpVariable Private 
					                                             %144 = OpTypePointer Uniform %79 
					                              Private f32_3* %158 = OpVariable Private 
					                                         f32 %169 = OpConstant 3.674022E-40 
					                                       f32_3 %170 = OpConstantComposite %169 %169 %169 
					                                         f32 %178 = OpConstant 3.674022E-40 
					                                         f32 %179 = OpConstant 3.674022E-40 
					                                         f32 %180 = OpConstant 3.674022E-40 
					                                       f32_3 %181 = OpConstantComposite %178 %179 %180 
					                                         f32 %192 = OpConstant 3.674022E-40 
					                                         f32 %193 = OpConstant 3.674022E-40 
					                                             %196 = OpTypePointer Output %79 
					                               Output f32_4* %197 = OpVariable Output 
					                                             %213 = OpTypePointer Private %141 
					                               Private bool* %214 = OpVariable Private 
					                                             %215 = OpTypePointer Private %13 
					                                Private i32* %216 = OpVariable Private 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function i32* %133 = OpVariable Function 
					                               Private f32_2* %19 = OpAccessChain %12 %14 
					                                                      OpStore %19 %17 
					                               Private f32_2* %24 = OpAccessChain %12 %20 
					                                                      OpStore %24 %23 
					                               Private f32_2* %29 = OpAccessChain %12 %25 
					                                                      OpStore %29 %28 
					                               Private f32_2* %34 = OpAccessChain %12 %30 
					                                                      OpStore %34 %33 
					                               Private f32_2* %39 = OpAccessChain %12 %35 
					                                                      OpStore %39 %38 
					                               Private f32_2* %44 = OpAccessChain %12 %40 
					                                                      OpStore %44 %43 
					                               Private f32_2* %49 = OpAccessChain %12 %45 
					                                                      OpStore %49 %48 
					                               Private f32_2* %54 = OpAccessChain %12 %50 
					                                                      OpStore %54 %53 
					                               Private f32_2* %59 = OpAccessChain %12 %55 
					                                                      OpStore %59 %58 
					                                        f32_2 %63 = OpLoad %62 
					                                        f32_2 %66 = OpFAdd %63 %65 
					                                                      OpStore %60 %66 
					                                        f32_2 %67 = OpLoad %60 
					                                        f32_2 %68 = OpLoad %60 
					                                        f32_2 %69 = OpFAdd %67 %68 
					                                                      OpStore %60 %69 
					                                        f32_2 %73 = OpLoad %60 
					                                        f32_2 %74 = OpLoad %60 
					                                          f32 %75 = OpDot %73 %74 
					                                 Private f32* %78 = OpAccessChain %72 %76 
					                                                      OpStore %78 %75 
					                   read_only Texture2DSampled %86 = OpLoad %85 
					                                        f32_2 %87 = OpLoad %62 
					                                        f32_4 %88 = OpImageSampleImplicitLod %86 %87 
					                                                      OpStore %81 %88 
					                                 Private f32* %89 = OpAccessChain %72 %76 
					                                          f32 %90 = OpLoad %89 
					                                 Private f32* %91 = OpAccessChain %72 %76 
					                                          f32 %92 = OpLoad %91 
					                                          f32 %93 = OpFMul %90 %92 
					                                 Private f32* %94 = OpAccessChain %72 %76 
					                                                      OpStore %94 %93 
					                                 Private f32* %95 = OpAccessChain %72 %76 
					                                          f32 %96 = OpLoad %95 
					                                Uniform f32* %101 = OpAccessChain %99 %20 
					                                         f32 %102 = OpLoad %101 
					                                         f32 %103 = OpFMul %96 %102 
					                                Private f32* %104 = OpAccessChain %72 %76 
					                                                      OpStore %104 %103 
					                                Private f32* %105 = OpAccessChain %72 %76 
					                                         f32 %106 = OpLoad %105 
					                                Uniform f32* %107 = OpAccessChain %99 %25 
					                                         f32 %108 = OpLoad %107 
					                                         f32 %109 = OpExtInst %1 40 %106 %108 
					                                Private f32* %110 = OpAccessChain %72 %76 
					                                                      OpStore %110 %109 
					                                Private f32* %111 = OpAccessChain %72 %76 
					                                         f32 %112 = OpLoad %111 
					                                Uniform f32* %113 = OpAccessChain %99 %35 %76 
					                                         f32 %114 = OpLoad %113 
					                                         f32 %115 = OpExtInst %1 40 %112 %114 
					                                Private f32* %116 = OpAccessChain %72 %76 
					                                                      OpStore %116 %115 
					                                Private f32* %117 = OpAccessChain %72 %76 
					                                         f32 %118 = OpLoad %117 
					                                Uniform f32* %120 = OpAccessChain %99 %35 %119 
					                                         f32 %121 = OpLoad %120 
					                                         f32 %122 = OpExtInst %1 37 %118 %121 
					                                Private f32* %123 = OpAccessChain %72 %76 
					                                                      OpStore %123 %122 
					                                       f32_4 %125 = OpLoad %81 
					                                       f32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
					                                       f32_3 %129 = OpFMul %126 %128 
					                                                      OpStore %124 %129 
					                                       f32_3 %131 = OpLoad %124 
					                                                      OpStore %130 %131 
					                                                      OpStore %133 %14 
					                                                      OpBranch %134 
					                                             %134 = OpLabel 
					                                                      OpLoopMerge %136 %137 None 
					                                                      OpBranch %138 
					                                             %138 = OpLabel 
					                                         i32 %139 = OpLoad %133 
					                                        bool %142 = OpSLessThan %139 %140 
					                                                      OpBranchConditional %142 %135 %136 
					                                             %135 = OpLabel 
					                              Uniform f32_4* %145 = OpAccessChain %99 %14 
					                                       f32_4 %146 = OpLoad %145 
					                                       f32_2 %147 = OpVectorShuffle %146 %146 0 1 
					                                         i32 %148 = OpLoad %133 
					                              Private f32_2* %149 = OpAccessChain %12 %148 
					                                       f32_2 %150 = OpLoad %149 
					                                       f32_2 %151 = OpFMul %147 %150 
					                                                      OpStore %143 %151 
					                                       f32_2 %152 = OpLoad %143 
					                                       f32_3 %153 = OpLoad %72 
					                                       f32_2 %154 = OpVectorShuffle %153 %153 0 0 
					                                       f32_2 %155 = OpFMul %152 %154 
					                                       f32_2 %156 = OpLoad %62 
					                                       f32_2 %157 = OpFAdd %155 %156 
					                                                      OpStore %143 %157 
					                  read_only Texture2DSampled %159 = OpLoad %85 
					                                       f32_2 %160 = OpLoad %143 
					                                       f32_4 %161 = OpImageSampleImplicitLod %159 %160 
					                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
					                                                      OpStore %158 %162 
					                                       f32_3 %163 = OpLoad %130 
					                                       f32_3 %164 = OpLoad %158 
					                                       f32_3 %165 = OpFAdd %163 %164 
					                                                      OpStore %130 %165 
					                                                      OpBranch %137 
					                                             %137 = OpLabel 
					                                         i32 %166 = OpLoad %133 
					                                         i32 %167 = OpIAdd %166 %20 
					                                                      OpStore %133 %167 
					                                                      OpBranch %134 
					                                             %136 = OpLabel 
					                                       f32_3 %168 = OpLoad %130 
					                                       f32_3 %171 = OpFMul %168 %170 
					                                       f32_4 %172 = OpLoad %81 
					                                       f32_3 %173 = OpVectorShuffle %172 %172 0 1 2 
					                                       f32_3 %174 = OpFNegate %173 
					                                       f32_3 %175 = OpFAdd %171 %174 
					                                                      OpStore %72 %175 
					                                       f32_3 %176 = OpLoad %72 
					                                       f32_3 %177 = OpExtInst %1 4 %176 
					                                         f32 %182 = OpDot %177 %181 
					                                Private f32* %183 = OpAccessChain %130 %76 
					                                                      OpStore %183 %182 
					                                Private f32* %184 = OpAccessChain %130 %76 
					                                         f32 %185 = OpLoad %184 
					                                Uniform f32* %186 = OpAccessChain %99 %30 
					                                         f32 %187 = OpLoad %186 
					                                         f32 %188 = OpFMul %185 %187 
					                                Private f32* %189 = OpAccessChain %130 %76 
					                                                      OpStore %189 %188 
					                                Private f32* %190 = OpAccessChain %130 %76 
					                                         f32 %191 = OpLoad %190 
					                                         f32 %194 = OpExtInst %1 43 %191 %192 %193 
					                                Private f32* %195 = OpAccessChain %130 %76 
					                                                      OpStore %195 %194 
					                                       f32_3 %198 = OpLoad %130 
					                                       f32_2 %199 = OpVectorShuffle %198 %198 0 0 
					                                       f32_3 %200 = OpLoad %72 
					                                       f32_2 %201 = OpVectorShuffle %200 %200 0 2 
					                                       f32_2 %202 = OpFMul %199 %201 
					                                       f32_4 %203 = OpLoad %81 
					                                       f32_2 %204 = OpVectorShuffle %203 %203 0 2 
					                                       f32_2 %205 = OpFAdd %202 %204 
					                                       f32_4 %206 = OpLoad %197 
					                                       f32_4 %207 = OpVectorShuffle %206 %205 4 1 5 3 
					                                                      OpStore %197 %207 
					                                       f32_4 %208 = OpLoad %81 
					                                       f32_2 %209 = OpVectorShuffle %208 %208 1 3 
					                                       f32_4 %210 = OpLoad %197 
					                                       f32_4 %211 = OpVectorShuffle %210 %209 0 4 2 5 
					                                                      OpStore %197 %211 
					                                                      OpReturn
					                                                      OpFunctionEnd"
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
					; Bound: 217
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %62 %197 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpDecorate %62 Location 62 
					                                                      OpDecorate %72 RelaxedPrecision 
					                                                      OpDecorate %81 RelaxedPrecision 
					                                                      OpDecorate %85 RelaxedPrecision 
					                                                      OpDecorate %85 DescriptorSet 85 
					                                                      OpDecorate %85 Binding 85 
					                                                      OpDecorate %86 RelaxedPrecision 
					                                                      OpDecorate %90 RelaxedPrecision 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %93 RelaxedPrecision 
					                                                      OpDecorate %96 RelaxedPrecision 
					                                                      OpMemberDecorate %97 0 Offset 97 
					                                                      OpMemberDecorate %97 1 RelaxedPrecision 
					                                                      OpMemberDecorate %97 1 Offset 97 
					                                                      OpMemberDecorate %97 2 RelaxedPrecision 
					                                                      OpMemberDecorate %97 2 Offset 97 
					                                                      OpMemberDecorate %97 3 RelaxedPrecision 
					                                                      OpMemberDecorate %97 3 Offset 97 
					                                                      OpMemberDecorate %97 4 RelaxedPrecision 
					                                                      OpMemberDecorate %97 4 Offset 97 
					                                                      OpDecorate %97 Block 
					                                                      OpDecorate %99 DescriptorSet 99 
					                                                      OpDecorate %99 Binding 99 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate %108 RelaxedPrecision 
					                                                      OpDecorate %109 RelaxedPrecision 
					                                                      OpDecorate %112 RelaxedPrecision 
					                                                      OpDecorate %114 RelaxedPrecision 
					                                                      OpDecorate %115 RelaxedPrecision 
					                                                      OpDecorate %118 RelaxedPrecision 
					                                                      OpDecorate %121 RelaxedPrecision 
					                                                      OpDecorate %122 RelaxedPrecision 
					                                                      OpDecorate %124 RelaxedPrecision 
					                                                      OpDecorate %125 RelaxedPrecision 
					                                                      OpDecorate %126 RelaxedPrecision 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %130 RelaxedPrecision 
					                                                      OpDecorate %131 RelaxedPrecision 
					                                                      OpDecorate %153 RelaxedPrecision 
					                                                      OpDecorate %154 RelaxedPrecision 
					                                                      OpDecorate %158 RelaxedPrecision 
					                                                      OpDecorate %159 RelaxedPrecision 
					                                                      OpDecorate %162 RelaxedPrecision 
					                                                      OpDecorate %163 RelaxedPrecision 
					                                                      OpDecorate %164 RelaxedPrecision 
					                                                      OpDecorate %165 RelaxedPrecision 
					                                                      OpDecorate %168 RelaxedPrecision 
					                                                      OpDecorate %171 RelaxedPrecision 
					                                                      OpDecorate %172 RelaxedPrecision 
					                                                      OpDecorate %173 RelaxedPrecision 
					                                                      OpDecorate %174 RelaxedPrecision 
					                                                      OpDecorate %175 RelaxedPrecision 
					                                                      OpDecorate %176 RelaxedPrecision 
					                                                      OpDecorate %177 RelaxedPrecision 
					                                                      OpDecorate %182 RelaxedPrecision 
					                                                      OpDecorate %185 RelaxedPrecision 
					                                                      OpDecorate %187 RelaxedPrecision 
					                                                      OpDecorate %188 RelaxedPrecision 
					                                                      OpDecorate %191 RelaxedPrecision 
					                                                      OpDecorate %194 RelaxedPrecision 
					                                                      OpDecorate %197 RelaxedPrecision 
					                                                      OpDecorate %197 Location 197 
					                                                      OpDecorate %198 RelaxedPrecision 
					                                                      OpDecorate %199 RelaxedPrecision 
					                                                      OpDecorate %200 RelaxedPrecision 
					                                                      OpDecorate %201 RelaxedPrecision 
					                                                      OpDecorate %202 RelaxedPrecision 
					                                                      OpDecorate %203 RelaxedPrecision 
					                                                      OpDecorate %204 RelaxedPrecision 
					                                                      OpDecorate %205 RelaxedPrecision 
					                                                      OpDecorate %208 RelaxedPrecision 
					                                                      OpDecorate %209 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 2 
					                                               %8 = OpTypeInt 32 0 
					                                           u32 %9 = OpConstant 9 
					                                              %10 = OpTypeArray %7 %9 
					                                              %11 = OpTypePointer Private %10 
					                            Private f32_2[9]* %12 = OpVariable Private 
					                                              %13 = OpTypeInt 32 1 
					                                          i32 %14 = OpConstant 0 
					                                          f32 %15 = OpConstant 3.674022E-40 
					                                          f32 %16 = OpConstant 3.674022E-40 
					                                        f32_2 %17 = OpConstantComposite %15 %16 
					                                              %18 = OpTypePointer Private %7 
					                                          i32 %20 = OpConstant 1 
					                                          f32 %21 = OpConstant 3.674022E-40 
					                                          f32 %22 = OpConstant 3.674022E-40 
					                                        f32_2 %23 = OpConstantComposite %21 %22 
					                                          i32 %25 = OpConstant 2 
					                                          f32 %26 = OpConstant 3.674022E-40 
					                                          f32 %27 = OpConstant 3.674022E-40 
					                                        f32_2 %28 = OpConstantComposite %26 %27 
					                                          i32 %30 = OpConstant 3 
					                                          f32 %31 = OpConstant 3.674022E-40 
					                                          f32 %32 = OpConstant 3.674022E-40 
					                                        f32_2 %33 = OpConstantComposite %31 %32 
					                                          i32 %35 = OpConstant 4 
					                                          f32 %36 = OpConstant 3.674022E-40 
					                                          f32 %37 = OpConstant 3.674022E-40 
					                                        f32_2 %38 = OpConstantComposite %36 %37 
					                                          i32 %40 = OpConstant 5 
					                                          f32 %41 = OpConstant 3.674022E-40 
					                                          f32 %42 = OpConstant 3.674022E-40 
					                                        f32_2 %43 = OpConstantComposite %41 %42 
					                                          i32 %45 = OpConstant 6 
					                                          f32 %46 = OpConstant 3.674022E-40 
					                                          f32 %47 = OpConstant 3.674022E-40 
					                                        f32_2 %48 = OpConstantComposite %46 %47 
					                                          i32 %50 = OpConstant 7 
					                                          f32 %51 = OpConstant 3.674022E-40 
					                                          f32 %52 = OpConstant 3.674022E-40 
					                                        f32_2 %53 = OpConstantComposite %51 %52 
					                                          i32 %55 = OpConstant 8 
					                                          f32 %56 = OpConstant 3.674022E-40 
					                                          f32 %57 = OpConstant 3.674022E-40 
					                                        f32_2 %58 = OpConstantComposite %56 %57 
					                               Private f32_2* %60 = OpVariable Private 
					                                              %61 = OpTypePointer Input %7 
					                                 Input f32_2* %62 = OpVariable Input 
					                                          f32 %64 = OpConstant 3.674022E-40 
					                                        f32_2 %65 = OpConstantComposite %64 %64 
					                                              %70 = OpTypeVector %6 3 
					                                              %71 = OpTypePointer Private %70 
					                               Private f32_3* %72 = OpVariable Private 
					                                          u32 %76 = OpConstant 0 
					                                              %77 = OpTypePointer Private %6 
					                                              %79 = OpTypeVector %6 4 
					                                              %80 = OpTypePointer Private %79 
					                               Private f32_4* %81 = OpVariable Private 
					                                              %82 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %83 = OpTypeSampledImage %82 
					                                              %84 = OpTypePointer UniformConstant %83 
					  UniformConstant read_only Texture2DSampled* %85 = OpVariable UniformConstant 
					                                              %97 = OpTypeStruct %79 %6 %6 %6 %7 
					                                              %98 = OpTypePointer Uniform %97 
					Uniform struct {f32_4; f32; f32; f32; f32_2;}* %99 = OpVariable Uniform 
					                                             %100 = OpTypePointer Uniform %6 
					                                         u32 %119 = OpConstant 1 
					                              Private f32_3* %124 = OpVariable Private 
					                                         f32 %127 = OpConstant 3.674022E-40 
					                                       f32_3 %128 = OpConstantComposite %127 %127 %127 
					                              Private f32_3* %130 = OpVariable Private 
					                                             %132 = OpTypePointer Function %13 
					                                         i32 %140 = OpConstant 9 
					                                             %141 = OpTypeBool 
					                              Private f32_2* %143 = OpVariable Private 
					                                             %144 = OpTypePointer Uniform %79 
					                              Private f32_3* %158 = OpVariable Private 
					                                         f32 %169 = OpConstant 3.674022E-40 
					                                       f32_3 %170 = OpConstantComposite %169 %169 %169 
					                                         f32 %178 = OpConstant 3.674022E-40 
					                                         f32 %179 = OpConstant 3.674022E-40 
					                                         f32 %180 = OpConstant 3.674022E-40 
					                                       f32_3 %181 = OpConstantComposite %178 %179 %180 
					                                         f32 %192 = OpConstant 3.674022E-40 
					                                         f32 %193 = OpConstant 3.674022E-40 
					                                             %196 = OpTypePointer Output %79 
					                               Output f32_4* %197 = OpVariable Output 
					                                             %213 = OpTypePointer Private %141 
					                               Private bool* %214 = OpVariable Private 
					                                             %215 = OpTypePointer Private %13 
					                                Private i32* %216 = OpVariable Private 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function i32* %133 = OpVariable Function 
					                               Private f32_2* %19 = OpAccessChain %12 %14 
					                                                      OpStore %19 %17 
					                               Private f32_2* %24 = OpAccessChain %12 %20 
					                                                      OpStore %24 %23 
					                               Private f32_2* %29 = OpAccessChain %12 %25 
					                                                      OpStore %29 %28 
					                               Private f32_2* %34 = OpAccessChain %12 %30 
					                                                      OpStore %34 %33 
					                               Private f32_2* %39 = OpAccessChain %12 %35 
					                                                      OpStore %39 %38 
					                               Private f32_2* %44 = OpAccessChain %12 %40 
					                                                      OpStore %44 %43 
					                               Private f32_2* %49 = OpAccessChain %12 %45 
					                                                      OpStore %49 %48 
					                               Private f32_2* %54 = OpAccessChain %12 %50 
					                                                      OpStore %54 %53 
					                               Private f32_2* %59 = OpAccessChain %12 %55 
					                                                      OpStore %59 %58 
					                                        f32_2 %63 = OpLoad %62 
					                                        f32_2 %66 = OpFAdd %63 %65 
					                                                      OpStore %60 %66 
					                                        f32_2 %67 = OpLoad %60 
					                                        f32_2 %68 = OpLoad %60 
					                                        f32_2 %69 = OpFAdd %67 %68 
					                                                      OpStore %60 %69 
					                                        f32_2 %73 = OpLoad %60 
					                                        f32_2 %74 = OpLoad %60 
					                                          f32 %75 = OpDot %73 %74 
					                                 Private f32* %78 = OpAccessChain %72 %76 
					                                                      OpStore %78 %75 
					                   read_only Texture2DSampled %86 = OpLoad %85 
					                                        f32_2 %87 = OpLoad %62 
					                                        f32_4 %88 = OpImageSampleImplicitLod %86 %87 
					                                                      OpStore %81 %88 
					                                 Private f32* %89 = OpAccessChain %72 %76 
					                                          f32 %90 = OpLoad %89 
					                                 Private f32* %91 = OpAccessChain %72 %76 
					                                          f32 %92 = OpLoad %91 
					                                          f32 %93 = OpFMul %90 %92 
					                                 Private f32* %94 = OpAccessChain %72 %76 
					                                                      OpStore %94 %93 
					                                 Private f32* %95 = OpAccessChain %72 %76 
					                                          f32 %96 = OpLoad %95 
					                                Uniform f32* %101 = OpAccessChain %99 %20 
					                                         f32 %102 = OpLoad %101 
					                                         f32 %103 = OpFMul %96 %102 
					                                Private f32* %104 = OpAccessChain %72 %76 
					                                                      OpStore %104 %103 
					                                Private f32* %105 = OpAccessChain %72 %76 
					                                         f32 %106 = OpLoad %105 
					                                Uniform f32* %107 = OpAccessChain %99 %25 
					                                         f32 %108 = OpLoad %107 
					                                         f32 %109 = OpExtInst %1 40 %106 %108 
					                                Private f32* %110 = OpAccessChain %72 %76 
					                                                      OpStore %110 %109 
					                                Private f32* %111 = OpAccessChain %72 %76 
					                                         f32 %112 = OpLoad %111 
					                                Uniform f32* %113 = OpAccessChain %99 %35 %76 
					                                         f32 %114 = OpLoad %113 
					                                         f32 %115 = OpExtInst %1 40 %112 %114 
					                                Private f32* %116 = OpAccessChain %72 %76 
					                                                      OpStore %116 %115 
					                                Private f32* %117 = OpAccessChain %72 %76 
					                                         f32 %118 = OpLoad %117 
					                                Uniform f32* %120 = OpAccessChain %99 %35 %119 
					                                         f32 %121 = OpLoad %120 
					                                         f32 %122 = OpExtInst %1 37 %118 %121 
					                                Private f32* %123 = OpAccessChain %72 %76 
					                                                      OpStore %123 %122 
					                                       f32_4 %125 = OpLoad %81 
					                                       f32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
					                                       f32_3 %129 = OpFMul %126 %128 
					                                                      OpStore %124 %129 
					                                       f32_3 %131 = OpLoad %124 
					                                                      OpStore %130 %131 
					                                                      OpStore %133 %14 
					                                                      OpBranch %134 
					                                             %134 = OpLabel 
					                                                      OpLoopMerge %136 %137 None 
					                                                      OpBranch %138 
					                                             %138 = OpLabel 
					                                         i32 %139 = OpLoad %133 
					                                        bool %142 = OpSLessThan %139 %140 
					                                                      OpBranchConditional %142 %135 %136 
					                                             %135 = OpLabel 
					                              Uniform f32_4* %145 = OpAccessChain %99 %14 
					                                       f32_4 %146 = OpLoad %145 
					                                       f32_2 %147 = OpVectorShuffle %146 %146 0 1 
					                                         i32 %148 = OpLoad %133 
					                              Private f32_2* %149 = OpAccessChain %12 %148 
					                                       f32_2 %150 = OpLoad %149 
					                                       f32_2 %151 = OpFMul %147 %150 
					                                                      OpStore %143 %151 
					                                       f32_2 %152 = OpLoad %143 
					                                       f32_3 %153 = OpLoad %72 
					                                       f32_2 %154 = OpVectorShuffle %153 %153 0 0 
					                                       f32_2 %155 = OpFMul %152 %154 
					                                       f32_2 %156 = OpLoad %62 
					                                       f32_2 %157 = OpFAdd %155 %156 
					                                                      OpStore %143 %157 
					                  read_only Texture2DSampled %159 = OpLoad %85 
					                                       f32_2 %160 = OpLoad %143 
					                                       f32_4 %161 = OpImageSampleImplicitLod %159 %160 
					                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
					                                                      OpStore %158 %162 
					                                       f32_3 %163 = OpLoad %130 
					                                       f32_3 %164 = OpLoad %158 
					                                       f32_3 %165 = OpFAdd %163 %164 
					                                                      OpStore %130 %165 
					                                                      OpBranch %137 
					                                             %137 = OpLabel 
					                                         i32 %166 = OpLoad %133 
					                                         i32 %167 = OpIAdd %166 %20 
					                                                      OpStore %133 %167 
					                                                      OpBranch %134 
					                                             %136 = OpLabel 
					                                       f32_3 %168 = OpLoad %130 
					                                       f32_3 %171 = OpFMul %168 %170 
					                                       f32_4 %172 = OpLoad %81 
					                                       f32_3 %173 = OpVectorShuffle %172 %172 0 1 2 
					                                       f32_3 %174 = OpFNegate %173 
					                                       f32_3 %175 = OpFAdd %171 %174 
					                                                      OpStore %72 %175 
					                                       f32_3 %176 = OpLoad %72 
					                                       f32_3 %177 = OpExtInst %1 4 %176 
					                                         f32 %182 = OpDot %177 %181 
					                                Private f32* %183 = OpAccessChain %130 %76 
					                                                      OpStore %183 %182 
					                                Private f32* %184 = OpAccessChain %130 %76 
					                                         f32 %185 = OpLoad %184 
					                                Uniform f32* %186 = OpAccessChain %99 %30 
					                                         f32 %187 = OpLoad %186 
					                                         f32 %188 = OpFMul %185 %187 
					                                Private f32* %189 = OpAccessChain %130 %76 
					                                                      OpStore %189 %188 
					                                Private f32* %190 = OpAccessChain %130 %76 
					                                         f32 %191 = OpLoad %190 
					                                         f32 %194 = OpExtInst %1 43 %191 %192 %193 
					                                Private f32* %195 = OpAccessChain %130 %76 
					                                                      OpStore %195 %194 
					                                       f32_3 %198 = OpLoad %130 
					                                       f32_2 %199 = OpVectorShuffle %198 %198 0 0 
					                                       f32_3 %200 = OpLoad %72 
					                                       f32_2 %201 = OpVectorShuffle %200 %200 0 2 
					                                       f32_2 %202 = OpFMul %199 %201 
					                                       f32_4 %203 = OpLoad %81 
					                                       f32_2 %204 = OpVectorShuffle %203 %203 0 2 
					                                       f32_2 %205 = OpFAdd %202 %204 
					                                       f32_4 %206 = OpLoad %197 
					                                       f32_4 %207 = OpVectorShuffle %206 %205 4 1 5 3 
					                                                      OpStore %197 %207 
					                                       f32_4 %208 = OpLoad %81 
					                                       f32_2 %209 = OpVectorShuffle %208 %208 1 3 
					                                       f32_4 %210 = OpLoad %197 
					                                       f32_4 %211 = OpVectorShuffle %210 %209 0 4 2 5 
					                                                      OpStore %197 %211 
					                                                      OpReturn
					                                                      OpFunctionEnd"
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
					; Bound: 217
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %62 %197 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpDecorate %62 Location 62 
					                                                      OpDecorate %72 RelaxedPrecision 
					                                                      OpDecorate %81 RelaxedPrecision 
					                                                      OpDecorate %85 RelaxedPrecision 
					                                                      OpDecorate %85 DescriptorSet 85 
					                                                      OpDecorate %85 Binding 85 
					                                                      OpDecorate %86 RelaxedPrecision 
					                                                      OpDecorate %90 RelaxedPrecision 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %93 RelaxedPrecision 
					                                                      OpDecorate %96 RelaxedPrecision 
					                                                      OpMemberDecorate %97 0 Offset 97 
					                                                      OpMemberDecorate %97 1 RelaxedPrecision 
					                                                      OpMemberDecorate %97 1 Offset 97 
					                                                      OpMemberDecorate %97 2 RelaxedPrecision 
					                                                      OpMemberDecorate %97 2 Offset 97 
					                                                      OpMemberDecorate %97 3 RelaxedPrecision 
					                                                      OpMemberDecorate %97 3 Offset 97 
					                                                      OpMemberDecorate %97 4 RelaxedPrecision 
					                                                      OpMemberDecorate %97 4 Offset 97 
					                                                      OpDecorate %97 Block 
					                                                      OpDecorate %99 DescriptorSet 99 
					                                                      OpDecorate %99 Binding 99 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate %108 RelaxedPrecision 
					                                                      OpDecorate %109 RelaxedPrecision 
					                                                      OpDecorate %112 RelaxedPrecision 
					                                                      OpDecorate %114 RelaxedPrecision 
					                                                      OpDecorate %115 RelaxedPrecision 
					                                                      OpDecorate %118 RelaxedPrecision 
					                                                      OpDecorate %121 RelaxedPrecision 
					                                                      OpDecorate %122 RelaxedPrecision 
					                                                      OpDecorate %124 RelaxedPrecision 
					                                                      OpDecorate %125 RelaxedPrecision 
					                                                      OpDecorate %126 RelaxedPrecision 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %130 RelaxedPrecision 
					                                                      OpDecorate %131 RelaxedPrecision 
					                                                      OpDecorate %153 RelaxedPrecision 
					                                                      OpDecorate %154 RelaxedPrecision 
					                                                      OpDecorate %158 RelaxedPrecision 
					                                                      OpDecorate %159 RelaxedPrecision 
					                                                      OpDecorate %162 RelaxedPrecision 
					                                                      OpDecorate %163 RelaxedPrecision 
					                                                      OpDecorate %164 RelaxedPrecision 
					                                                      OpDecorate %165 RelaxedPrecision 
					                                                      OpDecorate %168 RelaxedPrecision 
					                                                      OpDecorate %171 RelaxedPrecision 
					                                                      OpDecorate %172 RelaxedPrecision 
					                                                      OpDecorate %173 RelaxedPrecision 
					                                                      OpDecorate %174 RelaxedPrecision 
					                                                      OpDecorate %175 RelaxedPrecision 
					                                                      OpDecorate %176 RelaxedPrecision 
					                                                      OpDecorate %177 RelaxedPrecision 
					                                                      OpDecorate %182 RelaxedPrecision 
					                                                      OpDecorate %185 RelaxedPrecision 
					                                                      OpDecorate %187 RelaxedPrecision 
					                                                      OpDecorate %188 RelaxedPrecision 
					                                                      OpDecorate %191 RelaxedPrecision 
					                                                      OpDecorate %194 RelaxedPrecision 
					                                                      OpDecorate %197 RelaxedPrecision 
					                                                      OpDecorate %197 Location 197 
					                                                      OpDecorate %198 RelaxedPrecision 
					                                                      OpDecorate %199 RelaxedPrecision 
					                                                      OpDecorate %200 RelaxedPrecision 
					                                                      OpDecorate %201 RelaxedPrecision 
					                                                      OpDecorate %202 RelaxedPrecision 
					                                                      OpDecorate %203 RelaxedPrecision 
					                                                      OpDecorate %204 RelaxedPrecision 
					                                                      OpDecorate %205 RelaxedPrecision 
					                                                      OpDecorate %208 RelaxedPrecision 
					                                                      OpDecorate %209 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 2 
					                                               %8 = OpTypeInt 32 0 
					                                           u32 %9 = OpConstant 9 
					                                              %10 = OpTypeArray %7 %9 
					                                              %11 = OpTypePointer Private %10 
					                            Private f32_2[9]* %12 = OpVariable Private 
					                                              %13 = OpTypeInt 32 1 
					                                          i32 %14 = OpConstant 0 
					                                          f32 %15 = OpConstant 3.674022E-40 
					                                          f32 %16 = OpConstant 3.674022E-40 
					                                        f32_2 %17 = OpConstantComposite %15 %16 
					                                              %18 = OpTypePointer Private %7 
					                                          i32 %20 = OpConstant 1 
					                                          f32 %21 = OpConstant 3.674022E-40 
					                                          f32 %22 = OpConstant 3.674022E-40 
					                                        f32_2 %23 = OpConstantComposite %21 %22 
					                                          i32 %25 = OpConstant 2 
					                                          f32 %26 = OpConstant 3.674022E-40 
					                                          f32 %27 = OpConstant 3.674022E-40 
					                                        f32_2 %28 = OpConstantComposite %26 %27 
					                                          i32 %30 = OpConstant 3 
					                                          f32 %31 = OpConstant 3.674022E-40 
					                                          f32 %32 = OpConstant 3.674022E-40 
					                                        f32_2 %33 = OpConstantComposite %31 %32 
					                                          i32 %35 = OpConstant 4 
					                                          f32 %36 = OpConstant 3.674022E-40 
					                                          f32 %37 = OpConstant 3.674022E-40 
					                                        f32_2 %38 = OpConstantComposite %36 %37 
					                                          i32 %40 = OpConstant 5 
					                                          f32 %41 = OpConstant 3.674022E-40 
					                                          f32 %42 = OpConstant 3.674022E-40 
					                                        f32_2 %43 = OpConstantComposite %41 %42 
					                                          i32 %45 = OpConstant 6 
					                                          f32 %46 = OpConstant 3.674022E-40 
					                                          f32 %47 = OpConstant 3.674022E-40 
					                                        f32_2 %48 = OpConstantComposite %46 %47 
					                                          i32 %50 = OpConstant 7 
					                                          f32 %51 = OpConstant 3.674022E-40 
					                                          f32 %52 = OpConstant 3.674022E-40 
					                                        f32_2 %53 = OpConstantComposite %51 %52 
					                                          i32 %55 = OpConstant 8 
					                                          f32 %56 = OpConstant 3.674022E-40 
					                                          f32 %57 = OpConstant 3.674022E-40 
					                                        f32_2 %58 = OpConstantComposite %56 %57 
					                               Private f32_2* %60 = OpVariable Private 
					                                              %61 = OpTypePointer Input %7 
					                                 Input f32_2* %62 = OpVariable Input 
					                                          f32 %64 = OpConstant 3.674022E-40 
					                                        f32_2 %65 = OpConstantComposite %64 %64 
					                                              %70 = OpTypeVector %6 3 
					                                              %71 = OpTypePointer Private %70 
					                               Private f32_3* %72 = OpVariable Private 
					                                          u32 %76 = OpConstant 0 
					                                              %77 = OpTypePointer Private %6 
					                                              %79 = OpTypeVector %6 4 
					                                              %80 = OpTypePointer Private %79 
					                               Private f32_4* %81 = OpVariable Private 
					                                              %82 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %83 = OpTypeSampledImage %82 
					                                              %84 = OpTypePointer UniformConstant %83 
					  UniformConstant read_only Texture2DSampled* %85 = OpVariable UniformConstant 
					                                              %97 = OpTypeStruct %79 %6 %6 %6 %7 
					                                              %98 = OpTypePointer Uniform %97 
					Uniform struct {f32_4; f32; f32; f32; f32_2;}* %99 = OpVariable Uniform 
					                                             %100 = OpTypePointer Uniform %6 
					                                         u32 %119 = OpConstant 1 
					                              Private f32_3* %124 = OpVariable Private 
					                                         f32 %127 = OpConstant 3.674022E-40 
					                                       f32_3 %128 = OpConstantComposite %127 %127 %127 
					                              Private f32_3* %130 = OpVariable Private 
					                                             %132 = OpTypePointer Function %13 
					                                         i32 %140 = OpConstant 9 
					                                             %141 = OpTypeBool 
					                              Private f32_2* %143 = OpVariable Private 
					                                             %144 = OpTypePointer Uniform %79 
					                              Private f32_3* %158 = OpVariable Private 
					                                         f32 %169 = OpConstant 3.674022E-40 
					                                       f32_3 %170 = OpConstantComposite %169 %169 %169 
					                                         f32 %178 = OpConstant 3.674022E-40 
					                                         f32 %179 = OpConstant 3.674022E-40 
					                                         f32 %180 = OpConstant 3.674022E-40 
					                                       f32_3 %181 = OpConstantComposite %178 %179 %180 
					                                         f32 %192 = OpConstant 3.674022E-40 
					                                         f32 %193 = OpConstant 3.674022E-40 
					                                             %196 = OpTypePointer Output %79 
					                               Output f32_4* %197 = OpVariable Output 
					                                             %213 = OpTypePointer Private %141 
					                               Private bool* %214 = OpVariable Private 
					                                             %215 = OpTypePointer Private %13 
					                                Private i32* %216 = OpVariable Private 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function i32* %133 = OpVariable Function 
					                               Private f32_2* %19 = OpAccessChain %12 %14 
					                                                      OpStore %19 %17 
					                               Private f32_2* %24 = OpAccessChain %12 %20 
					                                                      OpStore %24 %23 
					                               Private f32_2* %29 = OpAccessChain %12 %25 
					                                                      OpStore %29 %28 
					                               Private f32_2* %34 = OpAccessChain %12 %30 
					                                                      OpStore %34 %33 
					                               Private f32_2* %39 = OpAccessChain %12 %35 
					                                                      OpStore %39 %38 
					                               Private f32_2* %44 = OpAccessChain %12 %40 
					                                                      OpStore %44 %43 
					                               Private f32_2* %49 = OpAccessChain %12 %45 
					                                                      OpStore %49 %48 
					                               Private f32_2* %54 = OpAccessChain %12 %50 
					                                                      OpStore %54 %53 
					                               Private f32_2* %59 = OpAccessChain %12 %55 
					                                                      OpStore %59 %58 
					                                        f32_2 %63 = OpLoad %62 
					                                        f32_2 %66 = OpFAdd %63 %65 
					                                                      OpStore %60 %66 
					                                        f32_2 %67 = OpLoad %60 
					                                        f32_2 %68 = OpLoad %60 
					                                        f32_2 %69 = OpFAdd %67 %68 
					                                                      OpStore %60 %69 
					                                        f32_2 %73 = OpLoad %60 
					                                        f32_2 %74 = OpLoad %60 
					                                          f32 %75 = OpDot %73 %74 
					                                 Private f32* %78 = OpAccessChain %72 %76 
					                                                      OpStore %78 %75 
					                   read_only Texture2DSampled %86 = OpLoad %85 
					                                        f32_2 %87 = OpLoad %62 
					                                        f32_4 %88 = OpImageSampleImplicitLod %86 %87 
					                                                      OpStore %81 %88 
					                                 Private f32* %89 = OpAccessChain %72 %76 
					                                          f32 %90 = OpLoad %89 
					                                 Private f32* %91 = OpAccessChain %72 %76 
					                                          f32 %92 = OpLoad %91 
					                                          f32 %93 = OpFMul %90 %92 
					                                 Private f32* %94 = OpAccessChain %72 %76 
					                                                      OpStore %94 %93 
					                                 Private f32* %95 = OpAccessChain %72 %76 
					                                          f32 %96 = OpLoad %95 
					                                Uniform f32* %101 = OpAccessChain %99 %20 
					                                         f32 %102 = OpLoad %101 
					                                         f32 %103 = OpFMul %96 %102 
					                                Private f32* %104 = OpAccessChain %72 %76 
					                                                      OpStore %104 %103 
					                                Private f32* %105 = OpAccessChain %72 %76 
					                                         f32 %106 = OpLoad %105 
					                                Uniform f32* %107 = OpAccessChain %99 %25 
					                                         f32 %108 = OpLoad %107 
					                                         f32 %109 = OpExtInst %1 40 %106 %108 
					                                Private f32* %110 = OpAccessChain %72 %76 
					                                                      OpStore %110 %109 
					                                Private f32* %111 = OpAccessChain %72 %76 
					                                         f32 %112 = OpLoad %111 
					                                Uniform f32* %113 = OpAccessChain %99 %35 %76 
					                                         f32 %114 = OpLoad %113 
					                                         f32 %115 = OpExtInst %1 40 %112 %114 
					                                Private f32* %116 = OpAccessChain %72 %76 
					                                                      OpStore %116 %115 
					                                Private f32* %117 = OpAccessChain %72 %76 
					                                         f32 %118 = OpLoad %117 
					                                Uniform f32* %120 = OpAccessChain %99 %35 %119 
					                                         f32 %121 = OpLoad %120 
					                                         f32 %122 = OpExtInst %1 37 %118 %121 
					                                Private f32* %123 = OpAccessChain %72 %76 
					                                                      OpStore %123 %122 
					                                       f32_4 %125 = OpLoad %81 
					                                       f32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
					                                       f32_3 %129 = OpFMul %126 %128 
					                                                      OpStore %124 %129 
					                                       f32_3 %131 = OpLoad %124 
					                                                      OpStore %130 %131 
					                                                      OpStore %133 %14 
					                                                      OpBranch %134 
					                                             %134 = OpLabel 
					                                                      OpLoopMerge %136 %137 None 
					                                                      OpBranch %138 
					                                             %138 = OpLabel 
					                                         i32 %139 = OpLoad %133 
					                                        bool %142 = OpSLessThan %139 %140 
					                                                      OpBranchConditional %142 %135 %136 
					                                             %135 = OpLabel 
					                              Uniform f32_4* %145 = OpAccessChain %99 %14 
					                                       f32_4 %146 = OpLoad %145 
					                                       f32_2 %147 = OpVectorShuffle %146 %146 0 1 
					                                         i32 %148 = OpLoad %133 
					                              Private f32_2* %149 = OpAccessChain %12 %148 
					                                       f32_2 %150 = OpLoad %149 
					                                       f32_2 %151 = OpFMul %147 %150 
					                                                      OpStore %143 %151 
					                                       f32_2 %152 = OpLoad %143 
					                                       f32_3 %153 = OpLoad %72 
					                                       f32_2 %154 = OpVectorShuffle %153 %153 0 0 
					                                       f32_2 %155 = OpFMul %152 %154 
					                                       f32_2 %156 = OpLoad %62 
					                                       f32_2 %157 = OpFAdd %155 %156 
					                                                      OpStore %143 %157 
					                  read_only Texture2DSampled %159 = OpLoad %85 
					                                       f32_2 %160 = OpLoad %143 
					                                       f32_4 %161 = OpImageSampleImplicitLod %159 %160 
					                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
					                                                      OpStore %158 %162 
					                                       f32_3 %163 = OpLoad %130 
					                                       f32_3 %164 = OpLoad %158 
					                                       f32_3 %165 = OpFAdd %163 %164 
					                                                      OpStore %130 %165 
					                                                      OpBranch %137 
					                                             %137 = OpLabel 
					                                         i32 %166 = OpLoad %133 
					                                         i32 %167 = OpIAdd %166 %20 
					                                                      OpStore %133 %167 
					                                                      OpBranch %134 
					                                             %136 = OpLabel 
					                                       f32_3 %168 = OpLoad %130 
					                                       f32_3 %171 = OpFMul %168 %170 
					                                       f32_4 %172 = OpLoad %81 
					                                       f32_3 %173 = OpVectorShuffle %172 %172 0 1 2 
					                                       f32_3 %174 = OpFNegate %173 
					                                       f32_3 %175 = OpFAdd %171 %174 
					                                                      OpStore %72 %175 
					                                       f32_3 %176 = OpLoad %72 
					                                       f32_3 %177 = OpExtInst %1 4 %176 
					                                         f32 %182 = OpDot %177 %181 
					                                Private f32* %183 = OpAccessChain %130 %76 
					                                                      OpStore %183 %182 
					                                Private f32* %184 = OpAccessChain %130 %76 
					                                         f32 %185 = OpLoad %184 
					                                Uniform f32* %186 = OpAccessChain %99 %30 
					                                         f32 %187 = OpLoad %186 
					                                         f32 %188 = OpFMul %185 %187 
					                                Private f32* %189 = OpAccessChain %130 %76 
					                                                      OpStore %189 %188 
					                                Private f32* %190 = OpAccessChain %130 %76 
					                                         f32 %191 = OpLoad %190 
					                                         f32 %194 = OpExtInst %1 43 %191 %192 %193 
					                                Private f32* %195 = OpAccessChain %130 %76 
					                                                      OpStore %195 %194 
					                                       f32_3 %198 = OpLoad %130 
					                                       f32_2 %199 = OpVectorShuffle %198 %198 0 0 
					                                       f32_3 %200 = OpLoad %72 
					                                       f32_2 %201 = OpVectorShuffle %200 %200 0 2 
					                                       f32_2 %202 = OpFMul %199 %201 
					                                       f32_4 %203 = OpLoad %81 
					                                       f32_2 %204 = OpVectorShuffle %203 %203 0 2 
					                                       f32_2 %205 = OpFAdd %202 %204 
					                                       f32_4 %206 = OpLoad %197 
					                                       f32_4 %207 = OpVectorShuffle %206 %205 4 1 5 3 
					                                                      OpStore %197 %207 
					                                       f32_4 %208 = OpLoad %81 
					                                       f32_2 %209 = OpVectorShuffle %208 %208 1 3 
					                                       f32_4 %210 = OpLoad %197 
					                                       f32_4 %211 = OpVectorShuffle %210 %209 0 4 2 5 
					                                                      OpStore %197 %211 
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