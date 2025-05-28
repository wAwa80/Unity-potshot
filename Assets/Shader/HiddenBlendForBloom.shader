Shader "Hidden/BlendForBloom" {
	Properties {
		_MainTex ("Screen Blended", 2D) = "" {}
		_ColorBuffer ("Color", 2D) = "" {}
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 41805
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
					  xlv_TEXCOORD0_1 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _ColorBuffer;
					uniform sampler2D _MainTex;
					uniform mediump float _Intensity;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
					void main ()
					{
					  mediump vec4 screencolor_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_ColorBuffer, xlv_TEXCOORD0_1);
					  screencolor_1 = tmpvar_3;
					  gl_FragData[0] = (1.0 - ((1.0 - 
					    (tmpvar_2 * _Intensity)
					  ) * (1.0 - screencolor_1)));
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
					  xlv_TEXCOORD0_1 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _ColorBuffer;
					uniform sampler2D _MainTex;
					uniform mediump float _Intensity;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
					void main ()
					{
					  mediump vec4 screencolor_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_ColorBuffer, xlv_TEXCOORD0_1);
					  screencolor_1 = tmpvar_3;
					  gl_FragData[0] = (1.0 - ((1.0 - 
					    (tmpvar_2 * _Intensity)
					  ) * (1.0 - screencolor_1)));
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
					  xlv_TEXCOORD0_1 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _ColorBuffer;
					uniform sampler2D _MainTex;
					uniform mediump float _Intensity;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
					void main ()
					{
					  mediump vec4 screencolor_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_ColorBuffer, xlv_TEXCOORD0_1);
					  screencolor_1 = tmpvar_3;
					  gl_FragData[0] = (1.0 - ((1.0 - 
					    (tmpvar_2 * _Intensity)
					  ) * (1.0 - screencolor_1)));
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
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump float _Intensity;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _ColorBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = (-u_xlat10_0) * vec4(_Intensity) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat10_1 = texture(_ColorBuffer, vs_TEXCOORD1.xy);
					    u_xlat16_1 = (-u_xlat10_1) + vec4(1.0, 1.0, 1.0, 1.0);
					    SV_Target0 = (-u_xlat16_0) * u_xlat16_1 + vec4(1.0, 1.0, 1.0, 1.0);
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
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump float _Intensity;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _ColorBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = (-u_xlat10_0) * vec4(_Intensity) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat10_1 = texture(_ColorBuffer, vs_TEXCOORD1.xy);
					    u_xlat16_1 = (-u_xlat10_1) + vec4(1.0, 1.0, 1.0, 1.0);
					    SV_Target0 = (-u_xlat16_0) * u_xlat16_1 + vec4(1.0, 1.0, 1.0, 1.0);
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
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump float _Intensity;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _ColorBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = (-u_xlat10_0) * vec4(_Intensity) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat10_1 = texture(_ColorBuffer, vs_TEXCOORD1.xy);
					    u_xlat16_1 = (-u_xlat10_1) + vec4(1.0, 1.0, 1.0, 1.0);
					    SV_Target0 = (-u_xlat16_0) * u_xlat16_1 + vec4(1.0, 1.0, 1.0, 1.0);
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
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %104 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %86 Location 86 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 Location 104 
					                                                     OpDecorate %113 RelaxedPrecision 
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
					                                             %88 = OpTypeBool 
					                                             %89 = OpTypePointer Private %88 
					                               Private bool* %90 = OpVariable Private 
					                                             %91 = OpTypePointer Uniform %6 
					                                         f32 %94 = OpConstant 3.674022E-40 
					                                             %96 = OpTypePointer Private %6 
					                                Private f32* %97 = OpVariable Private 
					                                             %98 = OpTypePointer Input %6 
					                                        f32 %102 = OpConstant 3.674022E-40 
					                              Output f32_2* %104 = OpVariable Output 
					                                            %105 = OpTypePointer Function %6 
					                                            %115 = OpTypePointer Output %6 
					                                        u32 %117 = OpConstant 0 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %106 = OpVariable Function 
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
					                                Uniform f32* %92 = OpAccessChain %20 %35 %68 
					                                         f32 %93 = OpLoad %92 
					                                        bool %95 = OpFOrdLessThan %93 %94 
					                                                     OpStore %90 %95 
					                                  Input f32* %99 = OpAccessChain %86 %68 
					                                        f32 %100 = OpLoad %99 
					                                        f32 %101 = OpFNegate %100 
					                                        f32 %103 = OpFAdd %101 %102 
					                                                     OpStore %97 %103 
					                                       bool %107 = OpLoad %90 
					                                                     OpSelectionMerge %109 None 
					                                                     OpBranchConditional %107 %108 %111 
					                                            %108 = OpLabel 
					                                        f32 %110 = OpLoad %97 
					                                                     OpStore %106 %110 
					                                                     OpBranch %109 
					                                            %111 = OpLabel 
					                                 Input f32* %112 = OpAccessChain %86 %68 
					                                        f32 %113 = OpLoad %112 
					                                                     OpStore %106 %113 
					                                                     OpBranch %109 
					                                            %109 = OpLabel 
					                                        f32 %114 = OpLoad %106 
					                                Output f32* %116 = OpAccessChain %104 %68 
					                                                     OpStore %116 %114 
					                                 Input f32* %118 = OpAccessChain %86 %117 
					                                        f32 %119 = OpLoad %118 
					                                Output f32* %120 = OpAccessChain %104 %117 
					                                                     OpStore %120 %119 
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
					; Bound: 54
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %39 %47 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpMemberDecorate %23 0 RelaxedPrecision 
					                                                    OpMemberDecorate %23 0 Offset 23 
					                                                    OpDecorate %23 Block 
					                                                    OpDecorate %25 DescriptorSet 25 
					                                                    OpDecorate %25 Binding 25 
					                                                    OpDecorate %30 RelaxedPrecision 
					                                                    OpDecorate %31 RelaxedPrecision 
					                                                    OpDecorate %32 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %37 DescriptorSet 37 
					                                                    OpDecorate %37 Binding 37 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %39 Location 39 
					                                                    OpDecorate %42 RelaxedPrecision 
					                                                    OpDecorate %43 RelaxedPrecision 
					                                                    OpDecorate %44 RelaxedPrecision 
					                                                    OpDecorate %45 RelaxedPrecision 
					                                                    OpDecorate %47 RelaxedPrecision 
					                                                    OpDecorate %47 Location 47 
					                                                    OpDecorate %48 RelaxedPrecision 
					                                                    OpDecorate %49 RelaxedPrecision 
					                                                    OpDecorate %50 RelaxedPrecision 
					                                                    OpDecorate %51 RelaxedPrecision 
					                                                    OpDecorate %52 RelaxedPrecision 
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
					                                            %23 = OpTypeStruct %6 
					                                            %24 = OpTypePointer Uniform %23 
					                     Uniform struct {f32;}* %25 = OpVariable Uniform 
					                                            %26 = OpTypeInt 32 1 
					                                        i32 %27 = OpConstant 0 
					                                            %28 = OpTypePointer Uniform %6 
					                                        f32 %33 = OpConstant 3.674022E-40 
					                                      f32_4 %34 = OpConstantComposite %33 %33 %33 %33 
					                             Private f32_4* %36 = OpVariable Private 
					UniformConstant read_only Texture2DSampled* %37 = OpVariable UniformConstant 
					                               Input f32_2* %39 = OpVariable Input 
					                             Private f32_4* %42 = OpVariable Private 
					                                            %46 = OpTypePointer Output %7 
					                              Output f32_4* %47 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                                      f32_4 %21 = OpLoad %9 
					                                      f32_4 %22 = OpFNegate %21 
					                               Uniform f32* %29 = OpAccessChain %25 %27 
					                                        f32 %30 = OpLoad %29 
					                                      f32_4 %31 = OpCompositeConstruct %30 %30 %30 %30 
					                                      f32_4 %32 = OpFMul %22 %31 
					                                      f32_4 %35 = OpFAdd %32 %34 
					                                                    OpStore %20 %35 
					                 read_only Texture2DSampled %38 = OpLoad %37 
					                                      f32_2 %40 = OpLoad %39 
					                                      f32_4 %41 = OpImageSampleImplicitLod %38 %40 
					                                                    OpStore %36 %41 
					                                      f32_4 %43 = OpLoad %36 
					                                      f32_4 %44 = OpFNegate %43 
					                                      f32_4 %45 = OpFAdd %44 %34 
					                                                    OpStore %42 %45 
					                                      f32_4 %48 = OpLoad %20 
					                                      f32_4 %49 = OpFNegate %48 
					                                      f32_4 %50 = OpLoad %42 
					                                      f32_4 %51 = OpFMul %49 %50 
					                                      f32_4 %52 = OpFAdd %51 %34 
					                                                    OpStore %47 %52 
					                                                    OpReturn
					                                                    OpFunctionEnd"
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
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %104 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %86 Location 86 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 Location 104 
					                                                     OpDecorate %113 RelaxedPrecision 
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
					                                             %88 = OpTypeBool 
					                                             %89 = OpTypePointer Private %88 
					                               Private bool* %90 = OpVariable Private 
					                                             %91 = OpTypePointer Uniform %6 
					                                         f32 %94 = OpConstant 3.674022E-40 
					                                             %96 = OpTypePointer Private %6 
					                                Private f32* %97 = OpVariable Private 
					                                             %98 = OpTypePointer Input %6 
					                                        f32 %102 = OpConstant 3.674022E-40 
					                              Output f32_2* %104 = OpVariable Output 
					                                            %105 = OpTypePointer Function %6 
					                                            %115 = OpTypePointer Output %6 
					                                        u32 %117 = OpConstant 0 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %106 = OpVariable Function 
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
					                                Uniform f32* %92 = OpAccessChain %20 %35 %68 
					                                         f32 %93 = OpLoad %92 
					                                        bool %95 = OpFOrdLessThan %93 %94 
					                                                     OpStore %90 %95 
					                                  Input f32* %99 = OpAccessChain %86 %68 
					                                        f32 %100 = OpLoad %99 
					                                        f32 %101 = OpFNegate %100 
					                                        f32 %103 = OpFAdd %101 %102 
					                                                     OpStore %97 %103 
					                                       bool %107 = OpLoad %90 
					                                                     OpSelectionMerge %109 None 
					                                                     OpBranchConditional %107 %108 %111 
					                                            %108 = OpLabel 
					                                        f32 %110 = OpLoad %97 
					                                                     OpStore %106 %110 
					                                                     OpBranch %109 
					                                            %111 = OpLabel 
					                                 Input f32* %112 = OpAccessChain %86 %68 
					                                        f32 %113 = OpLoad %112 
					                                                     OpStore %106 %113 
					                                                     OpBranch %109 
					                                            %109 = OpLabel 
					                                        f32 %114 = OpLoad %106 
					                                Output f32* %116 = OpAccessChain %104 %68 
					                                                     OpStore %116 %114 
					                                 Input f32* %118 = OpAccessChain %86 %117 
					                                        f32 %119 = OpLoad %118 
					                                Output f32* %120 = OpAccessChain %104 %117 
					                                                     OpStore %120 %119 
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
					; Bound: 54
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %39 %47 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpMemberDecorate %23 0 RelaxedPrecision 
					                                                    OpMemberDecorate %23 0 Offset 23 
					                                                    OpDecorate %23 Block 
					                                                    OpDecorate %25 DescriptorSet 25 
					                                                    OpDecorate %25 Binding 25 
					                                                    OpDecorate %30 RelaxedPrecision 
					                                                    OpDecorate %31 RelaxedPrecision 
					                                                    OpDecorate %32 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %37 DescriptorSet 37 
					                                                    OpDecorate %37 Binding 37 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %39 Location 39 
					                                                    OpDecorate %42 RelaxedPrecision 
					                                                    OpDecorate %43 RelaxedPrecision 
					                                                    OpDecorate %44 RelaxedPrecision 
					                                                    OpDecorate %45 RelaxedPrecision 
					                                                    OpDecorate %47 RelaxedPrecision 
					                                                    OpDecorate %47 Location 47 
					                                                    OpDecorate %48 RelaxedPrecision 
					                                                    OpDecorate %49 RelaxedPrecision 
					                                                    OpDecorate %50 RelaxedPrecision 
					                                                    OpDecorate %51 RelaxedPrecision 
					                                                    OpDecorate %52 RelaxedPrecision 
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
					                                            %23 = OpTypeStruct %6 
					                                            %24 = OpTypePointer Uniform %23 
					                     Uniform struct {f32;}* %25 = OpVariable Uniform 
					                                            %26 = OpTypeInt 32 1 
					                                        i32 %27 = OpConstant 0 
					                                            %28 = OpTypePointer Uniform %6 
					                                        f32 %33 = OpConstant 3.674022E-40 
					                                      f32_4 %34 = OpConstantComposite %33 %33 %33 %33 
					                             Private f32_4* %36 = OpVariable Private 
					UniformConstant read_only Texture2DSampled* %37 = OpVariable UniformConstant 
					                               Input f32_2* %39 = OpVariable Input 
					                             Private f32_4* %42 = OpVariable Private 
					                                            %46 = OpTypePointer Output %7 
					                              Output f32_4* %47 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                                      f32_4 %21 = OpLoad %9 
					                                      f32_4 %22 = OpFNegate %21 
					                               Uniform f32* %29 = OpAccessChain %25 %27 
					                                        f32 %30 = OpLoad %29 
					                                      f32_4 %31 = OpCompositeConstruct %30 %30 %30 %30 
					                                      f32_4 %32 = OpFMul %22 %31 
					                                      f32_4 %35 = OpFAdd %32 %34 
					                                                    OpStore %20 %35 
					                 read_only Texture2DSampled %38 = OpLoad %37 
					                                      f32_2 %40 = OpLoad %39 
					                                      f32_4 %41 = OpImageSampleImplicitLod %38 %40 
					                                                    OpStore %36 %41 
					                                      f32_4 %43 = OpLoad %36 
					                                      f32_4 %44 = OpFNegate %43 
					                                      f32_4 %45 = OpFAdd %44 %34 
					                                                    OpStore %42 %45 
					                                      f32_4 %48 = OpLoad %20 
					                                      f32_4 %49 = OpFNegate %48 
					                                      f32_4 %50 = OpLoad %42 
					                                      f32_4 %51 = OpFMul %49 %50 
					                                      f32_4 %52 = OpFAdd %51 %34 
					                                                    OpStore %47 %52 
					                                                    OpReturn
					                                                    OpFunctionEnd"
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
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %104 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %86 Location 86 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 Location 104 
					                                                     OpDecorate %113 RelaxedPrecision 
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
					                                             %88 = OpTypeBool 
					                                             %89 = OpTypePointer Private %88 
					                               Private bool* %90 = OpVariable Private 
					                                             %91 = OpTypePointer Uniform %6 
					                                         f32 %94 = OpConstant 3.674022E-40 
					                                             %96 = OpTypePointer Private %6 
					                                Private f32* %97 = OpVariable Private 
					                                             %98 = OpTypePointer Input %6 
					                                        f32 %102 = OpConstant 3.674022E-40 
					                              Output f32_2* %104 = OpVariable Output 
					                                            %105 = OpTypePointer Function %6 
					                                            %115 = OpTypePointer Output %6 
					                                        u32 %117 = OpConstant 0 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %106 = OpVariable Function 
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
					                                Uniform f32* %92 = OpAccessChain %20 %35 %68 
					                                         f32 %93 = OpLoad %92 
					                                        bool %95 = OpFOrdLessThan %93 %94 
					                                                     OpStore %90 %95 
					                                  Input f32* %99 = OpAccessChain %86 %68 
					                                        f32 %100 = OpLoad %99 
					                                        f32 %101 = OpFNegate %100 
					                                        f32 %103 = OpFAdd %101 %102 
					                                                     OpStore %97 %103 
					                                       bool %107 = OpLoad %90 
					                                                     OpSelectionMerge %109 None 
					                                                     OpBranchConditional %107 %108 %111 
					                                            %108 = OpLabel 
					                                        f32 %110 = OpLoad %97 
					                                                     OpStore %106 %110 
					                                                     OpBranch %109 
					                                            %111 = OpLabel 
					                                 Input f32* %112 = OpAccessChain %86 %68 
					                                        f32 %113 = OpLoad %112 
					                                                     OpStore %106 %113 
					                                                     OpBranch %109 
					                                            %109 = OpLabel 
					                                        f32 %114 = OpLoad %106 
					                                Output f32* %116 = OpAccessChain %104 %68 
					                                                     OpStore %116 %114 
					                                 Input f32* %118 = OpAccessChain %86 %117 
					                                        f32 %119 = OpLoad %118 
					                                Output f32* %120 = OpAccessChain %104 %117 
					                                                     OpStore %120 %119 
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
					; Bound: 54
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %39 %47 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpMemberDecorate %23 0 RelaxedPrecision 
					                                                    OpMemberDecorate %23 0 Offset 23 
					                                                    OpDecorate %23 Block 
					                                                    OpDecorate %25 DescriptorSet 25 
					                                                    OpDecorate %25 Binding 25 
					                                                    OpDecorate %30 RelaxedPrecision 
					                                                    OpDecorate %31 RelaxedPrecision 
					                                                    OpDecorate %32 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %37 DescriptorSet 37 
					                                                    OpDecorate %37 Binding 37 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %39 Location 39 
					                                                    OpDecorate %42 RelaxedPrecision 
					                                                    OpDecorate %43 RelaxedPrecision 
					                                                    OpDecorate %44 RelaxedPrecision 
					                                                    OpDecorate %45 RelaxedPrecision 
					                                                    OpDecorate %47 RelaxedPrecision 
					                                                    OpDecorate %47 Location 47 
					                                                    OpDecorate %48 RelaxedPrecision 
					                                                    OpDecorate %49 RelaxedPrecision 
					                                                    OpDecorate %50 RelaxedPrecision 
					                                                    OpDecorate %51 RelaxedPrecision 
					                                                    OpDecorate %52 RelaxedPrecision 
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
					                                            %23 = OpTypeStruct %6 
					                                            %24 = OpTypePointer Uniform %23 
					                     Uniform struct {f32;}* %25 = OpVariable Uniform 
					                                            %26 = OpTypeInt 32 1 
					                                        i32 %27 = OpConstant 0 
					                                            %28 = OpTypePointer Uniform %6 
					                                        f32 %33 = OpConstant 3.674022E-40 
					                                      f32_4 %34 = OpConstantComposite %33 %33 %33 %33 
					                             Private f32_4* %36 = OpVariable Private 
					UniformConstant read_only Texture2DSampled* %37 = OpVariable UniformConstant 
					                               Input f32_2* %39 = OpVariable Input 
					                             Private f32_4* %42 = OpVariable Private 
					                                            %46 = OpTypePointer Output %7 
					                              Output f32_4* %47 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                                      f32_4 %21 = OpLoad %9 
					                                      f32_4 %22 = OpFNegate %21 
					                               Uniform f32* %29 = OpAccessChain %25 %27 
					                                        f32 %30 = OpLoad %29 
					                                      f32_4 %31 = OpCompositeConstruct %30 %30 %30 %30 
					                                      f32_4 %32 = OpFMul %22 %31 
					                                      f32_4 %35 = OpFAdd %32 %34 
					                                                    OpStore %20 %35 
					                 read_only Texture2DSampled %38 = OpLoad %37 
					                                      f32_2 %40 = OpLoad %39 
					                                      f32_4 %41 = OpImageSampleImplicitLod %38 %40 
					                                                    OpStore %36 %41 
					                                      f32_4 %43 = OpLoad %36 
					                                      f32_4 %44 = OpFNegate %43 
					                                      f32_4 %45 = OpFAdd %44 %34 
					                                                    OpStore %42 %45 
					                                      f32_4 %48 = OpLoad %20 
					                                      f32_4 %49 = OpFNegate %48 
					                                      f32_4 %50 = OpLoad %42 
					                                      f32_4 %51 = OpFMul %49 %50 
					                                      f32_4 %52 = OpFAdd %51 %34 
					                                                    OpStore %47 %52 
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
			GpuProgramID 77482
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
					  xlv_TEXCOORD0_1 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _ColorBuffer;
					uniform sampler2D _MainTex;
					uniform mediump float _Intensity;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
					void main ()
					{
					  mediump vec4 screencolor_1;
					  mediump vec4 addedbloom_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  addedbloom_2 = tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_ColorBuffer, xlv_TEXCOORD0_1);
					  screencolor_1 = tmpvar_4;
					  gl_FragData[0] = ((_Intensity * addedbloom_2) + screencolor_1);
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
					  xlv_TEXCOORD0_1 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _ColorBuffer;
					uniform sampler2D _MainTex;
					uniform mediump float _Intensity;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
					void main ()
					{
					  mediump vec4 screencolor_1;
					  mediump vec4 addedbloom_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  addedbloom_2 = tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_ColorBuffer, xlv_TEXCOORD0_1);
					  screencolor_1 = tmpvar_4;
					  gl_FragData[0] = ((_Intensity * addedbloom_2) + screencolor_1);
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
					  xlv_TEXCOORD0_1 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _ColorBuffer;
					uniform sampler2D _MainTex;
					uniform mediump float _Intensity;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
					void main ()
					{
					  mediump vec4 screencolor_1;
					  mediump vec4 addedbloom_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  addedbloom_2 = tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_ColorBuffer, xlv_TEXCOORD0_1);
					  screencolor_1 = tmpvar_4;
					  gl_FragData[0] = ((_Intensity * addedbloom_2) + screencolor_1);
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
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump float _Intensity;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _ColorBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture(_ColorBuffer, vs_TEXCOORD1.xy);
					    SV_Target0 = vec4(_Intensity) * u_xlat10_0 + u_xlat10_1;
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
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump float _Intensity;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _ColorBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture(_ColorBuffer, vs_TEXCOORD1.xy);
					    SV_Target0 = vec4(_Intensity) * u_xlat10_0 + u_xlat10_1;
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
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump float _Intensity;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _ColorBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture(_ColorBuffer, vs_TEXCOORD1.xy);
					    SV_Target0 = vec4(_Intensity) * u_xlat10_0 + u_xlat10_1;
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
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %104 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %86 Location 86 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 Location 104 
					                                                     OpDecorate %113 RelaxedPrecision 
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
					                                             %88 = OpTypeBool 
					                                             %89 = OpTypePointer Private %88 
					                               Private bool* %90 = OpVariable Private 
					                                             %91 = OpTypePointer Uniform %6 
					                                         f32 %94 = OpConstant 3.674022E-40 
					                                             %96 = OpTypePointer Private %6 
					                                Private f32* %97 = OpVariable Private 
					                                             %98 = OpTypePointer Input %6 
					                                        f32 %102 = OpConstant 3.674022E-40 
					                              Output f32_2* %104 = OpVariable Output 
					                                            %105 = OpTypePointer Function %6 
					                                            %115 = OpTypePointer Output %6 
					                                        u32 %117 = OpConstant 0 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %106 = OpVariable Function 
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
					                                Uniform f32* %92 = OpAccessChain %20 %35 %68 
					                                         f32 %93 = OpLoad %92 
					                                        bool %95 = OpFOrdLessThan %93 %94 
					                                                     OpStore %90 %95 
					                                  Input f32* %99 = OpAccessChain %86 %68 
					                                        f32 %100 = OpLoad %99 
					                                        f32 %101 = OpFNegate %100 
					                                        f32 %103 = OpFAdd %101 %102 
					                                                     OpStore %97 %103 
					                                       bool %107 = OpLoad %90 
					                                                     OpSelectionMerge %109 None 
					                                                     OpBranchConditional %107 %108 %111 
					                                            %108 = OpLabel 
					                                        f32 %110 = OpLoad %97 
					                                                     OpStore %106 %110 
					                                                     OpBranch %109 
					                                            %111 = OpLabel 
					                                 Input f32* %112 = OpAccessChain %86 %68 
					                                        f32 %113 = OpLoad %112 
					                                                     OpStore %106 %113 
					                                                     OpBranch %109 
					                                            %109 = OpLabel 
					                                        f32 %114 = OpLoad %106 
					                                Output f32* %116 = OpAccessChain %104 %68 
					                                                     OpStore %116 %114 
					                                 Input f32* %118 = OpAccessChain %86 %117 
					                                        f32 %119 = OpLoad %118 
					                                Output f32* %120 = OpAccessChain %104 %117 
					                                                     OpStore %120 %119 
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
					; Bound: 42
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %23 %27 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %21 DescriptorSet 21 
					                                                    OpDecorate %21 Binding 21 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %23 Location 23 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %27 Location 27 
					                                                    OpMemberDecorate %28 0 RelaxedPrecision 
					                                                    OpMemberDecorate %28 0 Offset 28 
					                                                    OpDecorate %28 Block 
					                                                    OpDecorate %30 DescriptorSet 30 
					                                                    OpDecorate %30 Binding 30 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %39 RelaxedPrecision 
					                                                    OpDecorate %40 RelaxedPrecision 
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
					UniformConstant read_only Texture2DSampled* %21 = OpVariable UniformConstant 
					                               Input f32_2* %23 = OpVariable Input 
					                                            %26 = OpTypePointer Output %7 
					                              Output f32_4* %27 = OpVariable Output 
					                                            %28 = OpTypeStruct %6 
					                                            %29 = OpTypePointer Uniform %28 
					                     Uniform struct {f32;}* %30 = OpVariable Uniform 
					                                            %31 = OpTypeInt 32 1 
					                                        i32 %32 = OpConstant 0 
					                                            %33 = OpTypePointer Uniform %6 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                 read_only Texture2DSampled %22 = OpLoad %21 
					                                      f32_2 %24 = OpLoad %23 
					                                      f32_4 %25 = OpImageSampleImplicitLod %22 %24 
					                                                    OpStore %20 %25 
					                               Uniform f32* %34 = OpAccessChain %30 %32 
					                                        f32 %35 = OpLoad %34 
					                                      f32_4 %36 = OpCompositeConstruct %35 %35 %35 %35 
					                                      f32_4 %37 = OpLoad %9 
					                                      f32_4 %38 = OpFMul %36 %37 
					                                      f32_4 %39 = OpLoad %20 
					                                      f32_4 %40 = OpFAdd %38 %39 
					                                                    OpStore %27 %40 
					                                                    OpReturn
					                                                    OpFunctionEnd"
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
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %104 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %86 Location 86 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 Location 104 
					                                                     OpDecorate %113 RelaxedPrecision 
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
					                                             %88 = OpTypeBool 
					                                             %89 = OpTypePointer Private %88 
					                               Private bool* %90 = OpVariable Private 
					                                             %91 = OpTypePointer Uniform %6 
					                                         f32 %94 = OpConstant 3.674022E-40 
					                                             %96 = OpTypePointer Private %6 
					                                Private f32* %97 = OpVariable Private 
					                                             %98 = OpTypePointer Input %6 
					                                        f32 %102 = OpConstant 3.674022E-40 
					                              Output f32_2* %104 = OpVariable Output 
					                                            %105 = OpTypePointer Function %6 
					                                            %115 = OpTypePointer Output %6 
					                                        u32 %117 = OpConstant 0 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %106 = OpVariable Function 
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
					                                Uniform f32* %92 = OpAccessChain %20 %35 %68 
					                                         f32 %93 = OpLoad %92 
					                                        bool %95 = OpFOrdLessThan %93 %94 
					                                                     OpStore %90 %95 
					                                  Input f32* %99 = OpAccessChain %86 %68 
					                                        f32 %100 = OpLoad %99 
					                                        f32 %101 = OpFNegate %100 
					                                        f32 %103 = OpFAdd %101 %102 
					                                                     OpStore %97 %103 
					                                       bool %107 = OpLoad %90 
					                                                     OpSelectionMerge %109 None 
					                                                     OpBranchConditional %107 %108 %111 
					                                            %108 = OpLabel 
					                                        f32 %110 = OpLoad %97 
					                                                     OpStore %106 %110 
					                                                     OpBranch %109 
					                                            %111 = OpLabel 
					                                 Input f32* %112 = OpAccessChain %86 %68 
					                                        f32 %113 = OpLoad %112 
					                                                     OpStore %106 %113 
					                                                     OpBranch %109 
					                                            %109 = OpLabel 
					                                        f32 %114 = OpLoad %106 
					                                Output f32* %116 = OpAccessChain %104 %68 
					                                                     OpStore %116 %114 
					                                 Input f32* %118 = OpAccessChain %86 %117 
					                                        f32 %119 = OpLoad %118 
					                                Output f32* %120 = OpAccessChain %104 %117 
					                                                     OpStore %120 %119 
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
					; Bound: 42
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %23 %27 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %21 DescriptorSet 21 
					                                                    OpDecorate %21 Binding 21 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %23 Location 23 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %27 Location 27 
					                                                    OpMemberDecorate %28 0 RelaxedPrecision 
					                                                    OpMemberDecorate %28 0 Offset 28 
					                                                    OpDecorate %28 Block 
					                                                    OpDecorate %30 DescriptorSet 30 
					                                                    OpDecorate %30 Binding 30 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %39 RelaxedPrecision 
					                                                    OpDecorate %40 RelaxedPrecision 
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
					UniformConstant read_only Texture2DSampled* %21 = OpVariable UniformConstant 
					                               Input f32_2* %23 = OpVariable Input 
					                                            %26 = OpTypePointer Output %7 
					                              Output f32_4* %27 = OpVariable Output 
					                                            %28 = OpTypeStruct %6 
					                                            %29 = OpTypePointer Uniform %28 
					                     Uniform struct {f32;}* %30 = OpVariable Uniform 
					                                            %31 = OpTypeInt 32 1 
					                                        i32 %32 = OpConstant 0 
					                                            %33 = OpTypePointer Uniform %6 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                 read_only Texture2DSampled %22 = OpLoad %21 
					                                      f32_2 %24 = OpLoad %23 
					                                      f32_4 %25 = OpImageSampleImplicitLod %22 %24 
					                                                    OpStore %20 %25 
					                               Uniform f32* %34 = OpAccessChain %30 %32 
					                                        f32 %35 = OpLoad %34 
					                                      f32_4 %36 = OpCompositeConstruct %35 %35 %35 %35 
					                                      f32_4 %37 = OpLoad %9 
					                                      f32_4 %38 = OpFMul %36 %37 
					                                      f32_4 %39 = OpLoad %20 
					                                      f32_4 %40 = OpFAdd %38 %39 
					                                                    OpStore %27 %40 
					                                                    OpReturn
					                                                    OpFunctionEnd"
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
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %104 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %86 Location 86 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 Location 104 
					                                                     OpDecorate %113 RelaxedPrecision 
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
					                                             %88 = OpTypeBool 
					                                             %89 = OpTypePointer Private %88 
					                               Private bool* %90 = OpVariable Private 
					                                             %91 = OpTypePointer Uniform %6 
					                                         f32 %94 = OpConstant 3.674022E-40 
					                                             %96 = OpTypePointer Private %6 
					                                Private f32* %97 = OpVariable Private 
					                                             %98 = OpTypePointer Input %6 
					                                        f32 %102 = OpConstant 3.674022E-40 
					                              Output f32_2* %104 = OpVariable Output 
					                                            %105 = OpTypePointer Function %6 
					                                            %115 = OpTypePointer Output %6 
					                                        u32 %117 = OpConstant 0 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %106 = OpVariable Function 
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
					                                Uniform f32* %92 = OpAccessChain %20 %35 %68 
					                                         f32 %93 = OpLoad %92 
					                                        bool %95 = OpFOrdLessThan %93 %94 
					                                                     OpStore %90 %95 
					                                  Input f32* %99 = OpAccessChain %86 %68 
					                                        f32 %100 = OpLoad %99 
					                                        f32 %101 = OpFNegate %100 
					                                        f32 %103 = OpFAdd %101 %102 
					                                                     OpStore %97 %103 
					                                       bool %107 = OpLoad %90 
					                                                     OpSelectionMerge %109 None 
					                                                     OpBranchConditional %107 %108 %111 
					                                            %108 = OpLabel 
					                                        f32 %110 = OpLoad %97 
					                                                     OpStore %106 %110 
					                                                     OpBranch %109 
					                                            %111 = OpLabel 
					                                 Input f32* %112 = OpAccessChain %86 %68 
					                                        f32 %113 = OpLoad %112 
					                                                     OpStore %106 %113 
					                                                     OpBranch %109 
					                                            %109 = OpLabel 
					                                        f32 %114 = OpLoad %106 
					                                Output f32* %116 = OpAccessChain %104 %68 
					                                                     OpStore %116 %114 
					                                 Input f32* %118 = OpAccessChain %86 %117 
					                                        f32 %119 = OpLoad %118 
					                                Output f32* %120 = OpAccessChain %104 %117 
					                                                     OpStore %120 %119 
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
					; Bound: 42
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %23 %27 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %21 DescriptorSet 21 
					                                                    OpDecorate %21 Binding 21 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %23 Location 23 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %27 Location 27 
					                                                    OpMemberDecorate %28 0 RelaxedPrecision 
					                                                    OpMemberDecorate %28 0 Offset 28 
					                                                    OpDecorate %28 Block 
					                                                    OpDecorate %30 DescriptorSet 30 
					                                                    OpDecorate %30 Binding 30 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %39 RelaxedPrecision 
					                                                    OpDecorate %40 RelaxedPrecision 
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
					UniformConstant read_only Texture2DSampled* %21 = OpVariable UniformConstant 
					                               Input f32_2* %23 = OpVariable Input 
					                                            %26 = OpTypePointer Output %7 
					                              Output f32_4* %27 = OpVariable Output 
					                                            %28 = OpTypeStruct %6 
					                                            %29 = OpTypePointer Uniform %28 
					                     Uniform struct {f32;}* %30 = OpVariable Uniform 
					                                            %31 = OpTypeInt 32 1 
					                                        i32 %32 = OpConstant 0 
					                                            %33 = OpTypePointer Uniform %6 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                 read_only Texture2DSampled %22 = OpLoad %21 
					                                      f32_2 %24 = OpLoad %23 
					                                      f32_4 %25 = OpImageSampleImplicitLod %22 %24 
					                                                    OpStore %20 %25 
					                               Uniform f32* %34 = OpAccessChain %30 %32 
					                                        f32 %35 = OpLoad %34 
					                                      f32_4 %36 = OpCompositeConstruct %35 %35 %35 %35 
					                                      f32_4 %37 = OpLoad %9 
					                                      f32_4 %38 = OpFMul %36 %37 
					                                      f32_4 %39 = OpLoad %20 
					                                      f32_4 %40 = OpFAdd %38 %39 
					                                                    OpStore %27 %40 
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
			GpuProgramID 136742
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform mediump vec4 _MainTex_TexelSize;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
					varying highp vec2 xlv_TEXCOORD0_2;
					varying highp vec2 xlv_TEXCOORD0_3;
					varying highp vec2 xlv_TEXCOORD0_4;
					void main ()
					{
					  mediump vec2 tmpvar_1;
					  tmpvar_1 = _glesMultiTexCoord0.xy;
					  highp vec2 tmpvar_2;
					  highp vec2 tmpvar_3;
					  highp vec2 tmpvar_4;
					  highp vec2 tmpvar_5;
					  highp vec2 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_6 = tmpvar_1;
					  mediump vec2 tmpvar_8;
					  tmpvar_8 = (_MainTex_TexelSize.xy * 0.5);
					  tmpvar_2 = (_glesMultiTexCoord0.xy + tmpvar_8);
					  tmpvar_3 = (_glesMultiTexCoord0.xy - tmpvar_8);
					  mediump vec2 tmpvar_9;
					  tmpvar_9 = (_MainTex_TexelSize.xy * vec2(1.0, -1.0));
					  tmpvar_4 = (_glesMultiTexCoord0.xy - (tmpvar_9 * 0.5));
					  tmpvar_5 = (_glesMultiTexCoord0.xy + (tmpvar_9 * 0.5));
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD0_1 = tmpvar_3;
					  xlv_TEXCOORD0_2 = tmpvar_4;
					  xlv_TEXCOORD0_3 = tmpvar_5;
					  xlv_TEXCOORD0_4 = tmpvar_6;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
					varying highp vec2 xlv_TEXCOORD0_2;
					varying highp vec2 xlv_TEXCOORD0_3;
					varying highp vec2 xlv_TEXCOORD0_4;
					void main ()
					{
					  mediump vec4 outColor_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0_4);
					  outColor_1 = tmpvar_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0_1);
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0_2);
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0_3);
					  mediump vec4 tmpvar_7;
					  tmpvar_7 = max (max (outColor_1, tmpvar_3), max (max (tmpvar_4, tmpvar_5), tmpvar_6));
					  outColor_1 = tmpvar_7;
					  gl_FragData[0] = tmpvar_7;
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
					uniform mediump vec4 _MainTex_TexelSize;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
					varying highp vec2 xlv_TEXCOORD0_2;
					varying highp vec2 xlv_TEXCOORD0_3;
					varying highp vec2 xlv_TEXCOORD0_4;
					void main ()
					{
					  mediump vec2 tmpvar_1;
					  tmpvar_1 = _glesMultiTexCoord0.xy;
					  highp vec2 tmpvar_2;
					  highp vec2 tmpvar_3;
					  highp vec2 tmpvar_4;
					  highp vec2 tmpvar_5;
					  highp vec2 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_6 = tmpvar_1;
					  mediump vec2 tmpvar_8;
					  tmpvar_8 = (_MainTex_TexelSize.xy * 0.5);
					  tmpvar_2 = (_glesMultiTexCoord0.xy + tmpvar_8);
					  tmpvar_3 = (_glesMultiTexCoord0.xy - tmpvar_8);
					  mediump vec2 tmpvar_9;
					  tmpvar_9 = (_MainTex_TexelSize.xy * vec2(1.0, -1.0));
					  tmpvar_4 = (_glesMultiTexCoord0.xy - (tmpvar_9 * 0.5));
					  tmpvar_5 = (_glesMultiTexCoord0.xy + (tmpvar_9 * 0.5));
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD0_1 = tmpvar_3;
					  xlv_TEXCOORD0_2 = tmpvar_4;
					  xlv_TEXCOORD0_3 = tmpvar_5;
					  xlv_TEXCOORD0_4 = tmpvar_6;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
					varying highp vec2 xlv_TEXCOORD0_2;
					varying highp vec2 xlv_TEXCOORD0_3;
					varying highp vec2 xlv_TEXCOORD0_4;
					void main ()
					{
					  mediump vec4 outColor_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0_4);
					  outColor_1 = tmpvar_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0_1);
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0_2);
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0_3);
					  mediump vec4 tmpvar_7;
					  tmpvar_7 = max (max (outColor_1, tmpvar_3), max (max (tmpvar_4, tmpvar_5), tmpvar_6));
					  outColor_1 = tmpvar_7;
					  gl_FragData[0] = tmpvar_7;
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
					uniform mediump vec4 _MainTex_TexelSize;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
					varying highp vec2 xlv_TEXCOORD0_2;
					varying highp vec2 xlv_TEXCOORD0_3;
					varying highp vec2 xlv_TEXCOORD0_4;
					void main ()
					{
					  mediump vec2 tmpvar_1;
					  tmpvar_1 = _glesMultiTexCoord0.xy;
					  highp vec2 tmpvar_2;
					  highp vec2 tmpvar_3;
					  highp vec2 tmpvar_4;
					  highp vec2 tmpvar_5;
					  highp vec2 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_6 = tmpvar_1;
					  mediump vec2 tmpvar_8;
					  tmpvar_8 = (_MainTex_TexelSize.xy * 0.5);
					  tmpvar_2 = (_glesMultiTexCoord0.xy + tmpvar_8);
					  tmpvar_3 = (_glesMultiTexCoord0.xy - tmpvar_8);
					  mediump vec2 tmpvar_9;
					  tmpvar_9 = (_MainTex_TexelSize.xy * vec2(1.0, -1.0));
					  tmpvar_4 = (_glesMultiTexCoord0.xy - (tmpvar_9 * 0.5));
					  tmpvar_5 = (_glesMultiTexCoord0.xy + (tmpvar_9 * 0.5));
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD0_1 = tmpvar_3;
					  xlv_TEXCOORD0_2 = tmpvar_4;
					  xlv_TEXCOORD0_3 = tmpvar_5;
					  xlv_TEXCOORD0_4 = tmpvar_6;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
					varying highp vec2 xlv_TEXCOORD0_2;
					varying highp vec2 xlv_TEXCOORD0_3;
					varying highp vec2 xlv_TEXCOORD0_4;
					void main ()
					{
					  mediump vec4 outColor_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0_4);
					  outColor_1 = tmpvar_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0_1);
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0_2);
					  lowp vec4 tmpvar_6;
					  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0_3);
					  mediump vec4 tmpvar_7;
					  tmpvar_7 = max (max (outColor_1, tmpvar_3), max (max (tmpvar_4, tmpvar_5), tmpvar_6));
					  outColor_1 = tmpvar_7;
					  gl_FragData[0] = tmpvar_7;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	mediump vec4 _MainTex_TexelSize;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec2 vs_TEXCOORD1;
					out highp vec2 vs_TEXCOORD2;
					out highp vec2 vs_TEXCOORD3;
					out highp vec2 vs_TEXCOORD4;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
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
					    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(0.5, 0.5, 0.5, -0.5) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD0.xy = u_xlat16_0.xy;
					    vs_TEXCOORD3.xy = u_xlat16_0.zw;
					    u_xlat16_0 = (-_MainTex_TexelSize.xyxy) * vec4(0.5, 0.5, 0.5, -0.5) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD1.xy = u_xlat16_0.xy;
					    vs_TEXCOORD2.xy = u_xlat16_0.zw;
					    vs_TEXCOORD4.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform lowp sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					in highp vec2 vs_TEXCOORD2;
					in highp vec2 vs_TEXCOORD3;
					in highp vec2 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = max(u_xlat10_0, u_xlat10_1);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = max(u_xlat16_0, u_xlat10_1);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = max(u_xlat16_0, u_xlat10_1);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
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
					uniform 	mediump vec4 _MainTex_TexelSize;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec2 vs_TEXCOORD1;
					out highp vec2 vs_TEXCOORD2;
					out highp vec2 vs_TEXCOORD3;
					out highp vec2 vs_TEXCOORD4;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
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
					    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(0.5, 0.5, 0.5, -0.5) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD0.xy = u_xlat16_0.xy;
					    vs_TEXCOORD3.xy = u_xlat16_0.zw;
					    u_xlat16_0 = (-_MainTex_TexelSize.xyxy) * vec4(0.5, 0.5, 0.5, -0.5) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD1.xy = u_xlat16_0.xy;
					    vs_TEXCOORD2.xy = u_xlat16_0.zw;
					    vs_TEXCOORD4.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform lowp sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					in highp vec2 vs_TEXCOORD2;
					in highp vec2 vs_TEXCOORD3;
					in highp vec2 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = max(u_xlat10_0, u_xlat10_1);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = max(u_xlat16_0, u_xlat10_1);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = max(u_xlat16_0, u_xlat10_1);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
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
					uniform 	mediump vec4 _MainTex_TexelSize;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec2 vs_TEXCOORD1;
					out highp vec2 vs_TEXCOORD2;
					out highp vec2 vs_TEXCOORD3;
					out highp vec2 vs_TEXCOORD4;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
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
					    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(0.5, 0.5, 0.5, -0.5) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD0.xy = u_xlat16_0.xy;
					    vs_TEXCOORD3.xy = u_xlat16_0.zw;
					    u_xlat16_0 = (-_MainTex_TexelSize.xyxy) * vec4(0.5, 0.5, 0.5, -0.5) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD1.xy = u_xlat16_0.xy;
					    vs_TEXCOORD2.xy = u_xlat16_0.zw;
					    vs_TEXCOORD4.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform lowp sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					in highp vec2 vs_TEXCOORD2;
					in highp vec2 vs_TEXCOORD3;
					in highp vec2 vs_TEXCOORD4;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = max(u_xlat10_0, u_xlat10_1);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = max(u_xlat16_0, u_xlat10_1);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = max(u_xlat16_0, u_xlat10_1);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
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
					; Bound: 125
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %92 %97 %100 %111 %114 %117 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %82 RelaxedPrecision 
					                                                     OpDecorate %84 RelaxedPrecision 
					                                                     OpDecorate %85 RelaxedPrecision 
					                                                     OpDecorate %89 RelaxedPrecision 
					                                                     OpDecorate %92 RelaxedPrecision 
					                                                     OpDecorate %92 Location 92 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %94 RelaxedPrecision 
					                                                     OpDecorate %95 RelaxedPrecision 
					                                                     OpDecorate %97 Location 97 
					                                                     OpDecorate %98 RelaxedPrecision 
					                                                     OpDecorate %99 RelaxedPrecision 
					                                                     OpDecorate %100 Location 100 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %102 RelaxedPrecision 
					                                                     OpDecorate %104 RelaxedPrecision 
					                                                     OpDecorate %105 RelaxedPrecision 
					                                                     OpDecorate %106 RelaxedPrecision 
					                                                     OpDecorate %107 RelaxedPrecision 
					                                                     OpDecorate %108 RelaxedPrecision 
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
					                              Private f32_4* %82 = OpVariable Private 
					                                         f32 %86 = OpConstant 3.674022E-40 
					                                         f32 %87 = OpConstant 3.674022E-40 
					                                       f32_4 %88 = OpConstantComposite %86 %86 %86 %87 
					                                             %90 = OpTypeVector %6 2 
					                                             %91 = OpTypePointer Input %90 
					                                Input f32_2* %92 = OpVariable Input 
					                                             %96 = OpTypePointer Output %90 
					                               Output f32_2* %97 = OpVariable Output 
					                              Output f32_2* %100 = OpVariable Output 
					                              Output f32_2* %111 = OpVariable Output 
					                              Output f32_2* %114 = OpVariable Output 
					                              Output f32_2* %117 = OpVariable Output 
					                                            %119 = OpTypePointer Output %6 
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
					                              Uniform f32_4* %83 = OpAccessChain %20 %35 
					                                       f32_4 %84 = OpLoad %83 
					                                       f32_4 %85 = OpVectorShuffle %84 %84 0 1 0 1 
					                                       f32_4 %89 = OpFMul %85 %88 
					                                       f32_2 %93 = OpLoad %92 
					                                       f32_4 %94 = OpVectorShuffle %93 %93 0 1 0 1 
					                                       f32_4 %95 = OpFAdd %89 %94 
					                                                     OpStore %82 %95 
					                                       f32_4 %98 = OpLoad %82 
					                                       f32_2 %99 = OpVectorShuffle %98 %98 0 1 
					                                                     OpStore %97 %99 
					                                      f32_4 %101 = OpLoad %82 
					                                      f32_2 %102 = OpVectorShuffle %101 %101 2 3 
					                                                     OpStore %100 %102 
					                             Uniform f32_4* %103 = OpAccessChain %20 %35 
					                                      f32_4 %104 = OpLoad %103 
					                                      f32_4 %105 = OpVectorShuffle %104 %104 0 1 0 1 
					                                      f32_4 %106 = OpFNegate %105 
					                                      f32_4 %107 = OpFMul %106 %88 
					                                      f32_2 %108 = OpLoad %92 
					                                      f32_4 %109 = OpVectorShuffle %108 %108 0 1 0 1 
					                                      f32_4 %110 = OpFAdd %107 %109 
					                                                     OpStore %82 %110 
					                                      f32_4 %112 = OpLoad %82 
					                                      f32_2 %113 = OpVectorShuffle %112 %112 0 1 
					                                                     OpStore %111 %113 
					                                      f32_4 %115 = OpLoad %82 
					                                      f32_2 %116 = OpVectorShuffle %115 %115 2 3 
					                                                     OpStore %114 %116 
					                                      f32_2 %118 = OpLoad %92 
					                                                     OpStore %117 %118 
					                                Output f32* %120 = OpAccessChain %72 %22 %68 
					                                        f32 %121 = OpLoad %120 
					                                        f32 %122 = OpFNegate %121 
					                                Output f32* %123 = OpAccessChain %72 %22 %68 
					                                                     OpStore %123 %122 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 54
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %22 %30 %37 %44 %51 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 Location 22 
					                                                    OpDecorate %25 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %28 RelaxedPrecision 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %30 Location 30 
					                                                    OpDecorate %33 RelaxedPrecision 
					                                                    OpDecorate %34 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 Location 37 
					                                                    OpDecorate %40 RelaxedPrecision 
					                                                    OpDecorate %41 RelaxedPrecision 
					                                                    OpDecorate %42 RelaxedPrecision 
					                                                    OpDecorate %43 RelaxedPrecision 
					                                                    OpDecorate %44 Location 44 
					                                                    OpDecorate %47 RelaxedPrecision 
					                                                    OpDecorate %48 RelaxedPrecision 
					                                                    OpDecorate %49 RelaxedPrecision 
					                                                    OpDecorate %51 RelaxedPrecision 
					                                                    OpDecorate %51 Location 51 
					                                                    OpDecorate %52 RelaxedPrecision 
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
					                                            %50 = OpTypePointer Output %7 
					                              Output f32_4* %51 = OpVariable Output 
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
					                                      f32_4 %52 = OpLoad %25 
					                                                    OpStore %51 %52 
					                                                    OpReturn
					                                                    OpFunctionEnd"
				}
				SubProgram "vulkan hw_tier01 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 125
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %92 %97 %100 %111 %114 %117 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %82 RelaxedPrecision 
					                                                     OpDecorate %84 RelaxedPrecision 
					                                                     OpDecorate %85 RelaxedPrecision 
					                                                     OpDecorate %89 RelaxedPrecision 
					                                                     OpDecorate %92 RelaxedPrecision 
					                                                     OpDecorate %92 Location 92 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %94 RelaxedPrecision 
					                                                     OpDecorate %95 RelaxedPrecision 
					                                                     OpDecorate %97 Location 97 
					                                                     OpDecorate %98 RelaxedPrecision 
					                                                     OpDecorate %99 RelaxedPrecision 
					                                                     OpDecorate %100 Location 100 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %102 RelaxedPrecision 
					                                                     OpDecorate %104 RelaxedPrecision 
					                                                     OpDecorate %105 RelaxedPrecision 
					                                                     OpDecorate %106 RelaxedPrecision 
					                                                     OpDecorate %107 RelaxedPrecision 
					                                                     OpDecorate %108 RelaxedPrecision 
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
					                              Private f32_4* %82 = OpVariable Private 
					                                         f32 %86 = OpConstant 3.674022E-40 
					                                         f32 %87 = OpConstant 3.674022E-40 
					                                       f32_4 %88 = OpConstantComposite %86 %86 %86 %87 
					                                             %90 = OpTypeVector %6 2 
					                                             %91 = OpTypePointer Input %90 
					                                Input f32_2* %92 = OpVariable Input 
					                                             %96 = OpTypePointer Output %90 
					                               Output f32_2* %97 = OpVariable Output 
					                              Output f32_2* %100 = OpVariable Output 
					                              Output f32_2* %111 = OpVariable Output 
					                              Output f32_2* %114 = OpVariable Output 
					                              Output f32_2* %117 = OpVariable Output 
					                                            %119 = OpTypePointer Output %6 
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
					                              Uniform f32_4* %83 = OpAccessChain %20 %35 
					                                       f32_4 %84 = OpLoad %83 
					                                       f32_4 %85 = OpVectorShuffle %84 %84 0 1 0 1 
					                                       f32_4 %89 = OpFMul %85 %88 
					                                       f32_2 %93 = OpLoad %92 
					                                       f32_4 %94 = OpVectorShuffle %93 %93 0 1 0 1 
					                                       f32_4 %95 = OpFAdd %89 %94 
					                                                     OpStore %82 %95 
					                                       f32_4 %98 = OpLoad %82 
					                                       f32_2 %99 = OpVectorShuffle %98 %98 0 1 
					                                                     OpStore %97 %99 
					                                      f32_4 %101 = OpLoad %82 
					                                      f32_2 %102 = OpVectorShuffle %101 %101 2 3 
					                                                     OpStore %100 %102 
					                             Uniform f32_4* %103 = OpAccessChain %20 %35 
					                                      f32_4 %104 = OpLoad %103 
					                                      f32_4 %105 = OpVectorShuffle %104 %104 0 1 0 1 
					                                      f32_4 %106 = OpFNegate %105 
					                                      f32_4 %107 = OpFMul %106 %88 
					                                      f32_2 %108 = OpLoad %92 
					                                      f32_4 %109 = OpVectorShuffle %108 %108 0 1 0 1 
					                                      f32_4 %110 = OpFAdd %107 %109 
					                                                     OpStore %82 %110 
					                                      f32_4 %112 = OpLoad %82 
					                                      f32_2 %113 = OpVectorShuffle %112 %112 0 1 
					                                                     OpStore %111 %113 
					                                      f32_4 %115 = OpLoad %82 
					                                      f32_2 %116 = OpVectorShuffle %115 %115 2 3 
					                                                     OpStore %114 %116 
					                                      f32_2 %118 = OpLoad %92 
					                                                     OpStore %117 %118 
					                                Output f32* %120 = OpAccessChain %72 %22 %68 
					                                        f32 %121 = OpLoad %120 
					                                        f32 %122 = OpFNegate %121 
					                                Output f32* %123 = OpAccessChain %72 %22 %68 
					                                                     OpStore %123 %122 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 54
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %22 %30 %37 %44 %51 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 Location 22 
					                                                    OpDecorate %25 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %28 RelaxedPrecision 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %30 Location 30 
					                                                    OpDecorate %33 RelaxedPrecision 
					                                                    OpDecorate %34 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 Location 37 
					                                                    OpDecorate %40 RelaxedPrecision 
					                                                    OpDecorate %41 RelaxedPrecision 
					                                                    OpDecorate %42 RelaxedPrecision 
					                                                    OpDecorate %43 RelaxedPrecision 
					                                                    OpDecorate %44 Location 44 
					                                                    OpDecorate %47 RelaxedPrecision 
					                                                    OpDecorate %48 RelaxedPrecision 
					                                                    OpDecorate %49 RelaxedPrecision 
					                                                    OpDecorate %51 RelaxedPrecision 
					                                                    OpDecorate %51 Location 51 
					                                                    OpDecorate %52 RelaxedPrecision 
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
					                                            %50 = OpTypePointer Output %7 
					                              Output f32_4* %51 = OpVariable Output 
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
					                                      f32_4 %52 = OpLoad %25 
					                                                    OpStore %51 %52 
					                                                    OpReturn
					                                                    OpFunctionEnd"
				}
				SubProgram "vulkan hw_tier02 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 125
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %92 %97 %100 %111 %114 %117 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %82 RelaxedPrecision 
					                                                     OpDecorate %84 RelaxedPrecision 
					                                                     OpDecorate %85 RelaxedPrecision 
					                                                     OpDecorate %89 RelaxedPrecision 
					                                                     OpDecorate %92 RelaxedPrecision 
					                                                     OpDecorate %92 Location 92 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %94 RelaxedPrecision 
					                                                     OpDecorate %95 RelaxedPrecision 
					                                                     OpDecorate %97 Location 97 
					                                                     OpDecorate %98 RelaxedPrecision 
					                                                     OpDecorate %99 RelaxedPrecision 
					                                                     OpDecorate %100 Location 100 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %102 RelaxedPrecision 
					                                                     OpDecorate %104 RelaxedPrecision 
					                                                     OpDecorate %105 RelaxedPrecision 
					                                                     OpDecorate %106 RelaxedPrecision 
					                                                     OpDecorate %107 RelaxedPrecision 
					                                                     OpDecorate %108 RelaxedPrecision 
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
					                              Private f32_4* %82 = OpVariable Private 
					                                         f32 %86 = OpConstant 3.674022E-40 
					                                         f32 %87 = OpConstant 3.674022E-40 
					                                       f32_4 %88 = OpConstantComposite %86 %86 %86 %87 
					                                             %90 = OpTypeVector %6 2 
					                                             %91 = OpTypePointer Input %90 
					                                Input f32_2* %92 = OpVariable Input 
					                                             %96 = OpTypePointer Output %90 
					                               Output f32_2* %97 = OpVariable Output 
					                              Output f32_2* %100 = OpVariable Output 
					                              Output f32_2* %111 = OpVariable Output 
					                              Output f32_2* %114 = OpVariable Output 
					                              Output f32_2* %117 = OpVariable Output 
					                                            %119 = OpTypePointer Output %6 
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
					                              Uniform f32_4* %83 = OpAccessChain %20 %35 
					                                       f32_4 %84 = OpLoad %83 
					                                       f32_4 %85 = OpVectorShuffle %84 %84 0 1 0 1 
					                                       f32_4 %89 = OpFMul %85 %88 
					                                       f32_2 %93 = OpLoad %92 
					                                       f32_4 %94 = OpVectorShuffle %93 %93 0 1 0 1 
					                                       f32_4 %95 = OpFAdd %89 %94 
					                                                     OpStore %82 %95 
					                                       f32_4 %98 = OpLoad %82 
					                                       f32_2 %99 = OpVectorShuffle %98 %98 0 1 
					                                                     OpStore %97 %99 
					                                      f32_4 %101 = OpLoad %82 
					                                      f32_2 %102 = OpVectorShuffle %101 %101 2 3 
					                                                     OpStore %100 %102 
					                             Uniform f32_4* %103 = OpAccessChain %20 %35 
					                                      f32_4 %104 = OpLoad %103 
					                                      f32_4 %105 = OpVectorShuffle %104 %104 0 1 0 1 
					                                      f32_4 %106 = OpFNegate %105 
					                                      f32_4 %107 = OpFMul %106 %88 
					                                      f32_2 %108 = OpLoad %92 
					                                      f32_4 %109 = OpVectorShuffle %108 %108 0 1 0 1 
					                                      f32_4 %110 = OpFAdd %107 %109 
					                                                     OpStore %82 %110 
					                                      f32_4 %112 = OpLoad %82 
					                                      f32_2 %113 = OpVectorShuffle %112 %112 0 1 
					                                                     OpStore %111 %113 
					                                      f32_4 %115 = OpLoad %82 
					                                      f32_2 %116 = OpVectorShuffle %115 %115 2 3 
					                                                     OpStore %114 %116 
					                                      f32_2 %118 = OpLoad %92 
					                                                     OpStore %117 %118 
					                                Output f32* %120 = OpAccessChain %72 %22 %68 
					                                        f32 %121 = OpLoad %120 
					                                        f32 %122 = OpFNegate %121 
					                                Output f32* %123 = OpAccessChain %72 %22 %68 
					                                                     OpStore %123 %122 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 54
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %22 %30 %37 %44 %51 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 Location 22 
					                                                    OpDecorate %25 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %28 RelaxedPrecision 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %30 Location 30 
					                                                    OpDecorate %33 RelaxedPrecision 
					                                                    OpDecorate %34 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 Location 37 
					                                                    OpDecorate %40 RelaxedPrecision 
					                                                    OpDecorate %41 RelaxedPrecision 
					                                                    OpDecorate %42 RelaxedPrecision 
					                                                    OpDecorate %43 RelaxedPrecision 
					                                                    OpDecorate %44 Location 44 
					                                                    OpDecorate %47 RelaxedPrecision 
					                                                    OpDecorate %48 RelaxedPrecision 
					                                                    OpDecorate %49 RelaxedPrecision 
					                                                    OpDecorate %51 RelaxedPrecision 
					                                                    OpDecorate %51 Location 51 
					                                                    OpDecorate %52 RelaxedPrecision 
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
					                                            %50 = OpTypePointer Output %7 
					                              Output f32_4* %51 = OpVariable Output 
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
					                                      f32_4 %52 = OpLoad %25 
					                                                    OpStore %51 %52 
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
			GpuProgramID 238735
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
					  xlv_TEXCOORD0_1 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _ColorBuffer;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 tmpvar_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_ColorBuffer, xlv_TEXCOORD0);
					  tmpvar_1 = (tmpvar_2 * tmpvar_3);
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
					varying highp vec2 xlv_TEXCOORD0_1;
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
					  xlv_TEXCOORD0_1 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _ColorBuffer;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 tmpvar_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_ColorBuffer, xlv_TEXCOORD0);
					  tmpvar_1 = (tmpvar_2 * tmpvar_3);
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
					varying highp vec2 xlv_TEXCOORD0_1;
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
					  xlv_TEXCOORD0_1 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _ColorBuffer;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 tmpvar_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_ColorBuffer, xlv_TEXCOORD0);
					  tmpvar_1 = (tmpvar_2 * tmpvar_3);
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _ColorBuffer;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture(_ColorBuffer, vs_TEXCOORD0.xy);
					    u_xlat16_0 = u_xlat10_0 * u_xlat10_1;
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
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _ColorBuffer;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture(_ColorBuffer, vs_TEXCOORD0.xy);
					    u_xlat16_0 = u_xlat10_0 * u_xlat10_1;
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
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _ColorBuffer;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture(_ColorBuffer, vs_TEXCOORD0.xy);
					    u_xlat16_0 = u_xlat10_0 * u_xlat10_1;
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
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %104 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %86 Location 86 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 Location 104 
					                                                     OpDecorate %113 RelaxedPrecision 
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
					                                             %88 = OpTypeBool 
					                                             %89 = OpTypePointer Private %88 
					                               Private bool* %90 = OpVariable Private 
					                                             %91 = OpTypePointer Uniform %6 
					                                         f32 %94 = OpConstant 3.674022E-40 
					                                             %96 = OpTypePointer Private %6 
					                                Private f32* %97 = OpVariable Private 
					                                             %98 = OpTypePointer Input %6 
					                                        f32 %102 = OpConstant 3.674022E-40 
					                              Output f32_2* %104 = OpVariable Output 
					                                            %105 = OpTypePointer Function %6 
					                                            %115 = OpTypePointer Output %6 
					                                        u32 %117 = OpConstant 0 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %106 = OpVariable Function 
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
					                                Uniform f32* %92 = OpAccessChain %20 %35 %68 
					                                         f32 %93 = OpLoad %92 
					                                        bool %95 = OpFOrdLessThan %93 %94 
					                                                     OpStore %90 %95 
					                                  Input f32* %99 = OpAccessChain %86 %68 
					                                        f32 %100 = OpLoad %99 
					                                        f32 %101 = OpFNegate %100 
					                                        f32 %103 = OpFAdd %101 %102 
					                                                     OpStore %97 %103 
					                                       bool %107 = OpLoad %90 
					                                                     OpSelectionMerge %109 None 
					                                                     OpBranchConditional %107 %108 %111 
					                                            %108 = OpLabel 
					                                        f32 %110 = OpLoad %97 
					                                                     OpStore %106 %110 
					                                                     OpBranch %109 
					                                            %111 = OpLabel 
					                                 Input f32* %112 = OpAccessChain %86 %68 
					                                        f32 %113 = OpLoad %112 
					                                                     OpStore %106 %113 
					                                                     OpBranch %109 
					                                            %109 = OpLabel 
					                                        f32 %114 = OpLoad %106 
					                                Output f32* %116 = OpAccessChain %104 %68 
					                                                     OpStore %116 %114 
					                                 Input f32* %118 = OpAccessChain %86 %117 
					                                        f32 %119 = OpLoad %118 
					                                Output f32* %120 = OpAccessChain %104 %117 
					                                                     OpStore %120 %119 
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
					; Bound: 33
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %30 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %21 DescriptorSet 21 
					                                                    OpDecorate %21 Binding 21 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %25 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %28 RelaxedPrecision 
					                                                    OpDecorate %30 RelaxedPrecision 
					                                                    OpDecorate %30 Location 30 
					                                                    OpDecorate %31 RelaxedPrecision 
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
					UniformConstant read_only Texture2DSampled* %21 = OpVariable UniformConstant 
					                             Private f32_4* %25 = OpVariable Private 
					                                            %29 = OpTypePointer Output %7 
					                              Output f32_4* %30 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                 read_only Texture2DSampled %22 = OpLoad %21 
					                                      f32_2 %23 = OpLoad %17 
					                                      f32_4 %24 = OpImageSampleImplicitLod %22 %23 
					                                                    OpStore %20 %24 
					                                      f32_4 %26 = OpLoad %9 
					                                      f32_4 %27 = OpLoad %20 
					                                      f32_4 %28 = OpFMul %26 %27 
					                                                    OpStore %25 %28 
					                                      f32_4 %31 = OpLoad %25 
					                                                    OpStore %30 %31 
					                                                    OpReturn
					                                                    OpFunctionEnd"
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
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %104 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %86 Location 86 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 Location 104 
					                                                     OpDecorate %113 RelaxedPrecision 
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
					                                             %88 = OpTypeBool 
					                                             %89 = OpTypePointer Private %88 
					                               Private bool* %90 = OpVariable Private 
					                                             %91 = OpTypePointer Uniform %6 
					                                         f32 %94 = OpConstant 3.674022E-40 
					                                             %96 = OpTypePointer Private %6 
					                                Private f32* %97 = OpVariable Private 
					                                             %98 = OpTypePointer Input %6 
					                                        f32 %102 = OpConstant 3.674022E-40 
					                              Output f32_2* %104 = OpVariable Output 
					                                            %105 = OpTypePointer Function %6 
					                                            %115 = OpTypePointer Output %6 
					                                        u32 %117 = OpConstant 0 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %106 = OpVariable Function 
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
					                                Uniform f32* %92 = OpAccessChain %20 %35 %68 
					                                         f32 %93 = OpLoad %92 
					                                        bool %95 = OpFOrdLessThan %93 %94 
					                                                     OpStore %90 %95 
					                                  Input f32* %99 = OpAccessChain %86 %68 
					                                        f32 %100 = OpLoad %99 
					                                        f32 %101 = OpFNegate %100 
					                                        f32 %103 = OpFAdd %101 %102 
					                                                     OpStore %97 %103 
					                                       bool %107 = OpLoad %90 
					                                                     OpSelectionMerge %109 None 
					                                                     OpBranchConditional %107 %108 %111 
					                                            %108 = OpLabel 
					                                        f32 %110 = OpLoad %97 
					                                                     OpStore %106 %110 
					                                                     OpBranch %109 
					                                            %111 = OpLabel 
					                                 Input f32* %112 = OpAccessChain %86 %68 
					                                        f32 %113 = OpLoad %112 
					                                                     OpStore %106 %113 
					                                                     OpBranch %109 
					                                            %109 = OpLabel 
					                                        f32 %114 = OpLoad %106 
					                                Output f32* %116 = OpAccessChain %104 %68 
					                                                     OpStore %116 %114 
					                                 Input f32* %118 = OpAccessChain %86 %117 
					                                        f32 %119 = OpLoad %118 
					                                Output f32* %120 = OpAccessChain %104 %117 
					                                                     OpStore %120 %119 
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
					; Bound: 33
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %30 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %21 DescriptorSet 21 
					                                                    OpDecorate %21 Binding 21 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %25 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %28 RelaxedPrecision 
					                                                    OpDecorate %30 RelaxedPrecision 
					                                                    OpDecorate %30 Location 30 
					                                                    OpDecorate %31 RelaxedPrecision 
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
					UniformConstant read_only Texture2DSampled* %21 = OpVariable UniformConstant 
					                             Private f32_4* %25 = OpVariable Private 
					                                            %29 = OpTypePointer Output %7 
					                              Output f32_4* %30 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                 read_only Texture2DSampled %22 = OpLoad %21 
					                                      f32_2 %23 = OpLoad %17 
					                                      f32_4 %24 = OpImageSampleImplicitLod %22 %23 
					                                                    OpStore %20 %24 
					                                      f32_4 %26 = OpLoad %9 
					                                      f32_4 %27 = OpLoad %20 
					                                      f32_4 %28 = OpFMul %26 %27 
					                                                    OpStore %25 %28 
					                                      f32_4 %31 = OpLoad %25 
					                                                    OpStore %30 %31 
					                                                    OpReturn
					                                                    OpFunctionEnd"
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
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %104 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %86 Location 86 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 Location 104 
					                                                     OpDecorate %113 RelaxedPrecision 
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
					                                             %88 = OpTypeBool 
					                                             %89 = OpTypePointer Private %88 
					                               Private bool* %90 = OpVariable Private 
					                                             %91 = OpTypePointer Uniform %6 
					                                         f32 %94 = OpConstant 3.674022E-40 
					                                             %96 = OpTypePointer Private %6 
					                                Private f32* %97 = OpVariable Private 
					                                             %98 = OpTypePointer Input %6 
					                                        f32 %102 = OpConstant 3.674022E-40 
					                              Output f32_2* %104 = OpVariable Output 
					                                            %105 = OpTypePointer Function %6 
					                                            %115 = OpTypePointer Output %6 
					                                        u32 %117 = OpConstant 0 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %106 = OpVariable Function 
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
					                                Uniform f32* %92 = OpAccessChain %20 %35 %68 
					                                         f32 %93 = OpLoad %92 
					                                        bool %95 = OpFOrdLessThan %93 %94 
					                                                     OpStore %90 %95 
					                                  Input f32* %99 = OpAccessChain %86 %68 
					                                        f32 %100 = OpLoad %99 
					                                        f32 %101 = OpFNegate %100 
					                                        f32 %103 = OpFAdd %101 %102 
					                                                     OpStore %97 %103 
					                                       bool %107 = OpLoad %90 
					                                                     OpSelectionMerge %109 None 
					                                                     OpBranchConditional %107 %108 %111 
					                                            %108 = OpLabel 
					                                        f32 %110 = OpLoad %97 
					                                                     OpStore %106 %110 
					                                                     OpBranch %109 
					                                            %111 = OpLabel 
					                                 Input f32* %112 = OpAccessChain %86 %68 
					                                        f32 %113 = OpLoad %112 
					                                                     OpStore %106 %113 
					                                                     OpBranch %109 
					                                            %109 = OpLabel 
					                                        f32 %114 = OpLoad %106 
					                                Output f32* %116 = OpAccessChain %104 %68 
					                                                     OpStore %116 %114 
					                                 Input f32* %118 = OpAccessChain %86 %117 
					                                        f32 %119 = OpLoad %118 
					                                Output f32* %120 = OpAccessChain %104 %117 
					                                                     OpStore %120 %119 
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
					; Bound: 33
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %30 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %21 DescriptorSet 21 
					                                                    OpDecorate %21 Binding 21 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %25 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %28 RelaxedPrecision 
					                                                    OpDecorate %30 RelaxedPrecision 
					                                                    OpDecorate %30 Location 30 
					                                                    OpDecorate %31 RelaxedPrecision 
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
					UniformConstant read_only Texture2DSampled* %21 = OpVariable UniformConstant 
					                             Private f32_4* %25 = OpVariable Private 
					                                            %29 = OpTypePointer Output %7 
					                              Output f32_4* %30 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                 read_only Texture2DSampled %22 = OpLoad %21 
					                                      f32_2 %23 = OpLoad %17 
					                                      f32_4 %24 = OpImageSampleImplicitLod %22 %23 
					                                                    OpStore %20 %24 
					                                      f32_4 %26 = OpLoad %9 
					                                      f32_4 %27 = OpLoad %20 
					                                      f32_4 %28 = OpFMul %26 %27 
					                                                    OpStore %25 %28 
					                                      f32_4 %31 = OpLoad %25 
					                                                    OpStore %30 %31 
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
			GpuProgramID 318691
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
					  xlv_TEXCOORD0_1 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _ColorBuffer;
					uniform sampler2D _MainTex;
					uniform mediump float _Intensity;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
					void main ()
					{
					  mediump vec4 screencolor_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_ColorBuffer, xlv_TEXCOORD0_1);
					  screencolor_1 = tmpvar_3;
					  gl_FragData[0] = (1.0 - ((1.0 - 
					    (tmpvar_2 * _Intensity)
					  ) * (1.0 - screencolor_1)));
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
					  xlv_TEXCOORD0_1 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _ColorBuffer;
					uniform sampler2D _MainTex;
					uniform mediump float _Intensity;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
					void main ()
					{
					  mediump vec4 screencolor_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_ColorBuffer, xlv_TEXCOORD0_1);
					  screencolor_1 = tmpvar_3;
					  gl_FragData[0] = (1.0 - ((1.0 - 
					    (tmpvar_2 * _Intensity)
					  ) * (1.0 - screencolor_1)));
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
					  xlv_TEXCOORD0_1 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _ColorBuffer;
					uniform sampler2D _MainTex;
					uniform mediump float _Intensity;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
					void main ()
					{
					  mediump vec4 screencolor_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_ColorBuffer, xlv_TEXCOORD0_1);
					  screencolor_1 = tmpvar_3;
					  gl_FragData[0] = (1.0 - ((1.0 - 
					    (tmpvar_2 * _Intensity)
					  ) * (1.0 - screencolor_1)));
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
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump float _Intensity;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _ColorBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = (-u_xlat10_0) * vec4(_Intensity) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat10_1 = texture(_ColorBuffer, vs_TEXCOORD1.xy);
					    u_xlat16_1 = (-u_xlat10_1) + vec4(1.0, 1.0, 1.0, 1.0);
					    SV_Target0 = (-u_xlat16_0) * u_xlat16_1 + vec4(1.0, 1.0, 1.0, 1.0);
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
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump float _Intensity;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _ColorBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = (-u_xlat10_0) * vec4(_Intensity) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat10_1 = texture(_ColorBuffer, vs_TEXCOORD1.xy);
					    u_xlat16_1 = (-u_xlat10_1) + vec4(1.0, 1.0, 1.0, 1.0);
					    SV_Target0 = (-u_xlat16_0) * u_xlat16_1 + vec4(1.0, 1.0, 1.0, 1.0);
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
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump float _Intensity;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _ColorBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_0;
					mediump vec4 u_xlat16_1;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0 = (-u_xlat10_0) * vec4(_Intensity) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat10_1 = texture(_ColorBuffer, vs_TEXCOORD1.xy);
					    u_xlat16_1 = (-u_xlat10_1) + vec4(1.0, 1.0, 1.0, 1.0);
					    SV_Target0 = (-u_xlat16_0) * u_xlat16_1 + vec4(1.0, 1.0, 1.0, 1.0);
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
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %104 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %86 Location 86 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 Location 104 
					                                                     OpDecorate %113 RelaxedPrecision 
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
					                                             %88 = OpTypeBool 
					                                             %89 = OpTypePointer Private %88 
					                               Private bool* %90 = OpVariable Private 
					                                             %91 = OpTypePointer Uniform %6 
					                                         f32 %94 = OpConstant 3.674022E-40 
					                                             %96 = OpTypePointer Private %6 
					                                Private f32* %97 = OpVariable Private 
					                                             %98 = OpTypePointer Input %6 
					                                        f32 %102 = OpConstant 3.674022E-40 
					                              Output f32_2* %104 = OpVariable Output 
					                                            %105 = OpTypePointer Function %6 
					                                            %115 = OpTypePointer Output %6 
					                                        u32 %117 = OpConstant 0 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %106 = OpVariable Function 
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
					                                Uniform f32* %92 = OpAccessChain %20 %35 %68 
					                                         f32 %93 = OpLoad %92 
					                                        bool %95 = OpFOrdLessThan %93 %94 
					                                                     OpStore %90 %95 
					                                  Input f32* %99 = OpAccessChain %86 %68 
					                                        f32 %100 = OpLoad %99 
					                                        f32 %101 = OpFNegate %100 
					                                        f32 %103 = OpFAdd %101 %102 
					                                                     OpStore %97 %103 
					                                       bool %107 = OpLoad %90 
					                                                     OpSelectionMerge %109 None 
					                                                     OpBranchConditional %107 %108 %111 
					                                            %108 = OpLabel 
					                                        f32 %110 = OpLoad %97 
					                                                     OpStore %106 %110 
					                                                     OpBranch %109 
					                                            %111 = OpLabel 
					                                 Input f32* %112 = OpAccessChain %86 %68 
					                                        f32 %113 = OpLoad %112 
					                                                     OpStore %106 %113 
					                                                     OpBranch %109 
					                                            %109 = OpLabel 
					                                        f32 %114 = OpLoad %106 
					                                Output f32* %116 = OpAccessChain %104 %68 
					                                                     OpStore %116 %114 
					                                 Input f32* %118 = OpAccessChain %86 %117 
					                                        f32 %119 = OpLoad %118 
					                                Output f32* %120 = OpAccessChain %104 %117 
					                                                     OpStore %120 %119 
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
					; Bound: 54
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %39 %47 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpMemberDecorate %23 0 RelaxedPrecision 
					                                                    OpMemberDecorate %23 0 Offset 23 
					                                                    OpDecorate %23 Block 
					                                                    OpDecorate %25 DescriptorSet 25 
					                                                    OpDecorate %25 Binding 25 
					                                                    OpDecorate %30 RelaxedPrecision 
					                                                    OpDecorate %31 RelaxedPrecision 
					                                                    OpDecorate %32 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %37 DescriptorSet 37 
					                                                    OpDecorate %37 Binding 37 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %39 Location 39 
					                                                    OpDecorate %42 RelaxedPrecision 
					                                                    OpDecorate %43 RelaxedPrecision 
					                                                    OpDecorate %44 RelaxedPrecision 
					                                                    OpDecorate %45 RelaxedPrecision 
					                                                    OpDecorate %47 RelaxedPrecision 
					                                                    OpDecorate %47 Location 47 
					                                                    OpDecorate %48 RelaxedPrecision 
					                                                    OpDecorate %49 RelaxedPrecision 
					                                                    OpDecorate %50 RelaxedPrecision 
					                                                    OpDecorate %51 RelaxedPrecision 
					                                                    OpDecorate %52 RelaxedPrecision 
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
					                                            %23 = OpTypeStruct %6 
					                                            %24 = OpTypePointer Uniform %23 
					                     Uniform struct {f32;}* %25 = OpVariable Uniform 
					                                            %26 = OpTypeInt 32 1 
					                                        i32 %27 = OpConstant 0 
					                                            %28 = OpTypePointer Uniform %6 
					                                        f32 %33 = OpConstant 3.674022E-40 
					                                      f32_4 %34 = OpConstantComposite %33 %33 %33 %33 
					                             Private f32_4* %36 = OpVariable Private 
					UniformConstant read_only Texture2DSampled* %37 = OpVariable UniformConstant 
					                               Input f32_2* %39 = OpVariable Input 
					                             Private f32_4* %42 = OpVariable Private 
					                                            %46 = OpTypePointer Output %7 
					                              Output f32_4* %47 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                                      f32_4 %21 = OpLoad %9 
					                                      f32_4 %22 = OpFNegate %21 
					                               Uniform f32* %29 = OpAccessChain %25 %27 
					                                        f32 %30 = OpLoad %29 
					                                      f32_4 %31 = OpCompositeConstruct %30 %30 %30 %30 
					                                      f32_4 %32 = OpFMul %22 %31 
					                                      f32_4 %35 = OpFAdd %32 %34 
					                                                    OpStore %20 %35 
					                 read_only Texture2DSampled %38 = OpLoad %37 
					                                      f32_2 %40 = OpLoad %39 
					                                      f32_4 %41 = OpImageSampleImplicitLod %38 %40 
					                                                    OpStore %36 %41 
					                                      f32_4 %43 = OpLoad %36 
					                                      f32_4 %44 = OpFNegate %43 
					                                      f32_4 %45 = OpFAdd %44 %34 
					                                                    OpStore %42 %45 
					                                      f32_4 %48 = OpLoad %20 
					                                      f32_4 %49 = OpFNegate %48 
					                                      f32_4 %50 = OpLoad %42 
					                                      f32_4 %51 = OpFMul %49 %50 
					                                      f32_4 %52 = OpFAdd %51 %34 
					                                                    OpStore %47 %52 
					                                                    OpReturn
					                                                    OpFunctionEnd"
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
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %104 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %86 Location 86 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 Location 104 
					                                                     OpDecorate %113 RelaxedPrecision 
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
					                                             %88 = OpTypeBool 
					                                             %89 = OpTypePointer Private %88 
					                               Private bool* %90 = OpVariable Private 
					                                             %91 = OpTypePointer Uniform %6 
					                                         f32 %94 = OpConstant 3.674022E-40 
					                                             %96 = OpTypePointer Private %6 
					                                Private f32* %97 = OpVariable Private 
					                                             %98 = OpTypePointer Input %6 
					                                        f32 %102 = OpConstant 3.674022E-40 
					                              Output f32_2* %104 = OpVariable Output 
					                                            %105 = OpTypePointer Function %6 
					                                            %115 = OpTypePointer Output %6 
					                                        u32 %117 = OpConstant 0 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %106 = OpVariable Function 
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
					                                Uniform f32* %92 = OpAccessChain %20 %35 %68 
					                                         f32 %93 = OpLoad %92 
					                                        bool %95 = OpFOrdLessThan %93 %94 
					                                                     OpStore %90 %95 
					                                  Input f32* %99 = OpAccessChain %86 %68 
					                                        f32 %100 = OpLoad %99 
					                                        f32 %101 = OpFNegate %100 
					                                        f32 %103 = OpFAdd %101 %102 
					                                                     OpStore %97 %103 
					                                       bool %107 = OpLoad %90 
					                                                     OpSelectionMerge %109 None 
					                                                     OpBranchConditional %107 %108 %111 
					                                            %108 = OpLabel 
					                                        f32 %110 = OpLoad %97 
					                                                     OpStore %106 %110 
					                                                     OpBranch %109 
					                                            %111 = OpLabel 
					                                 Input f32* %112 = OpAccessChain %86 %68 
					                                        f32 %113 = OpLoad %112 
					                                                     OpStore %106 %113 
					                                                     OpBranch %109 
					                                            %109 = OpLabel 
					                                        f32 %114 = OpLoad %106 
					                                Output f32* %116 = OpAccessChain %104 %68 
					                                                     OpStore %116 %114 
					                                 Input f32* %118 = OpAccessChain %86 %117 
					                                        f32 %119 = OpLoad %118 
					                                Output f32* %120 = OpAccessChain %104 %117 
					                                                     OpStore %120 %119 
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
					; Bound: 54
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %39 %47 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpMemberDecorate %23 0 RelaxedPrecision 
					                                                    OpMemberDecorate %23 0 Offset 23 
					                                                    OpDecorate %23 Block 
					                                                    OpDecorate %25 DescriptorSet 25 
					                                                    OpDecorate %25 Binding 25 
					                                                    OpDecorate %30 RelaxedPrecision 
					                                                    OpDecorate %31 RelaxedPrecision 
					                                                    OpDecorate %32 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %37 DescriptorSet 37 
					                                                    OpDecorate %37 Binding 37 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %39 Location 39 
					                                                    OpDecorate %42 RelaxedPrecision 
					                                                    OpDecorate %43 RelaxedPrecision 
					                                                    OpDecorate %44 RelaxedPrecision 
					                                                    OpDecorate %45 RelaxedPrecision 
					                                                    OpDecorate %47 RelaxedPrecision 
					                                                    OpDecorate %47 Location 47 
					                                                    OpDecorate %48 RelaxedPrecision 
					                                                    OpDecorate %49 RelaxedPrecision 
					                                                    OpDecorate %50 RelaxedPrecision 
					                                                    OpDecorate %51 RelaxedPrecision 
					                                                    OpDecorate %52 RelaxedPrecision 
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
					                                            %23 = OpTypeStruct %6 
					                                            %24 = OpTypePointer Uniform %23 
					                     Uniform struct {f32;}* %25 = OpVariable Uniform 
					                                            %26 = OpTypeInt 32 1 
					                                        i32 %27 = OpConstant 0 
					                                            %28 = OpTypePointer Uniform %6 
					                                        f32 %33 = OpConstant 3.674022E-40 
					                                      f32_4 %34 = OpConstantComposite %33 %33 %33 %33 
					                             Private f32_4* %36 = OpVariable Private 
					UniformConstant read_only Texture2DSampled* %37 = OpVariable UniformConstant 
					                               Input f32_2* %39 = OpVariable Input 
					                             Private f32_4* %42 = OpVariable Private 
					                                            %46 = OpTypePointer Output %7 
					                              Output f32_4* %47 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                                      f32_4 %21 = OpLoad %9 
					                                      f32_4 %22 = OpFNegate %21 
					                               Uniform f32* %29 = OpAccessChain %25 %27 
					                                        f32 %30 = OpLoad %29 
					                                      f32_4 %31 = OpCompositeConstruct %30 %30 %30 %30 
					                                      f32_4 %32 = OpFMul %22 %31 
					                                      f32_4 %35 = OpFAdd %32 %34 
					                                                    OpStore %20 %35 
					                 read_only Texture2DSampled %38 = OpLoad %37 
					                                      f32_2 %40 = OpLoad %39 
					                                      f32_4 %41 = OpImageSampleImplicitLod %38 %40 
					                                                    OpStore %36 %41 
					                                      f32_4 %43 = OpLoad %36 
					                                      f32_4 %44 = OpFNegate %43 
					                                      f32_4 %45 = OpFAdd %44 %34 
					                                                    OpStore %42 %45 
					                                      f32_4 %48 = OpLoad %20 
					                                      f32_4 %49 = OpFNegate %48 
					                                      f32_4 %50 = OpLoad %42 
					                                      f32_4 %51 = OpFMul %49 %50 
					                                      f32_4 %52 = OpFAdd %51 %34 
					                                                    OpStore %47 %52 
					                                                    OpReturn
					                                                    OpFunctionEnd"
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
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %104 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %86 Location 86 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 Location 104 
					                                                     OpDecorate %113 RelaxedPrecision 
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
					                                             %88 = OpTypeBool 
					                                             %89 = OpTypePointer Private %88 
					                               Private bool* %90 = OpVariable Private 
					                                             %91 = OpTypePointer Uniform %6 
					                                         f32 %94 = OpConstant 3.674022E-40 
					                                             %96 = OpTypePointer Private %6 
					                                Private f32* %97 = OpVariable Private 
					                                             %98 = OpTypePointer Input %6 
					                                        f32 %102 = OpConstant 3.674022E-40 
					                              Output f32_2* %104 = OpVariable Output 
					                                            %105 = OpTypePointer Function %6 
					                                            %115 = OpTypePointer Output %6 
					                                        u32 %117 = OpConstant 0 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %106 = OpVariable Function 
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
					                                Uniform f32* %92 = OpAccessChain %20 %35 %68 
					                                         f32 %93 = OpLoad %92 
					                                        bool %95 = OpFOrdLessThan %93 %94 
					                                                     OpStore %90 %95 
					                                  Input f32* %99 = OpAccessChain %86 %68 
					                                        f32 %100 = OpLoad %99 
					                                        f32 %101 = OpFNegate %100 
					                                        f32 %103 = OpFAdd %101 %102 
					                                                     OpStore %97 %103 
					                                       bool %107 = OpLoad %90 
					                                                     OpSelectionMerge %109 None 
					                                                     OpBranchConditional %107 %108 %111 
					                                            %108 = OpLabel 
					                                        f32 %110 = OpLoad %97 
					                                                     OpStore %106 %110 
					                                                     OpBranch %109 
					                                            %111 = OpLabel 
					                                 Input f32* %112 = OpAccessChain %86 %68 
					                                        f32 %113 = OpLoad %112 
					                                                     OpStore %106 %113 
					                                                     OpBranch %109 
					                                            %109 = OpLabel 
					                                        f32 %114 = OpLoad %106 
					                                Output f32* %116 = OpAccessChain %104 %68 
					                                                     OpStore %116 %114 
					                                 Input f32* %118 = OpAccessChain %86 %117 
					                                        f32 %119 = OpLoad %118 
					                                Output f32* %120 = OpAccessChain %104 %117 
					                                                     OpStore %120 %119 
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
					; Bound: 54
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %39 %47 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpMemberDecorate %23 0 RelaxedPrecision 
					                                                    OpMemberDecorate %23 0 Offset 23 
					                                                    OpDecorate %23 Block 
					                                                    OpDecorate %25 DescriptorSet 25 
					                                                    OpDecorate %25 Binding 25 
					                                                    OpDecorate %30 RelaxedPrecision 
					                                                    OpDecorate %31 RelaxedPrecision 
					                                                    OpDecorate %32 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %37 DescriptorSet 37 
					                                                    OpDecorate %37 Binding 37 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %39 Location 39 
					                                                    OpDecorate %42 RelaxedPrecision 
					                                                    OpDecorate %43 RelaxedPrecision 
					                                                    OpDecorate %44 RelaxedPrecision 
					                                                    OpDecorate %45 RelaxedPrecision 
					                                                    OpDecorate %47 RelaxedPrecision 
					                                                    OpDecorate %47 Location 47 
					                                                    OpDecorate %48 RelaxedPrecision 
					                                                    OpDecorate %49 RelaxedPrecision 
					                                                    OpDecorate %50 RelaxedPrecision 
					                                                    OpDecorate %51 RelaxedPrecision 
					                                                    OpDecorate %52 RelaxedPrecision 
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
					                                            %23 = OpTypeStruct %6 
					                                            %24 = OpTypePointer Uniform %23 
					                     Uniform struct {f32;}* %25 = OpVariable Uniform 
					                                            %26 = OpTypeInt 32 1 
					                                        i32 %27 = OpConstant 0 
					                                            %28 = OpTypePointer Uniform %6 
					                                        f32 %33 = OpConstant 3.674022E-40 
					                                      f32_4 %34 = OpConstantComposite %33 %33 %33 %33 
					                             Private f32_4* %36 = OpVariable Private 
					UniformConstant read_only Texture2DSampled* %37 = OpVariable UniformConstant 
					                               Input f32_2* %39 = OpVariable Input 
					                             Private f32_4* %42 = OpVariable Private 
					                                            %46 = OpTypePointer Output %7 
					                              Output f32_4* %47 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                                      f32_4 %21 = OpLoad %9 
					                                      f32_4 %22 = OpFNegate %21 
					                               Uniform f32* %29 = OpAccessChain %25 %27 
					                                        f32 %30 = OpLoad %29 
					                                      f32_4 %31 = OpCompositeConstruct %30 %30 %30 %30 
					                                      f32_4 %32 = OpFMul %22 %31 
					                                      f32_4 %35 = OpFAdd %32 %34 
					                                                    OpStore %20 %35 
					                 read_only Texture2DSampled %38 = OpLoad %37 
					                                      f32_2 %40 = OpLoad %39 
					                                      f32_4 %41 = OpImageSampleImplicitLod %38 %40 
					                                                    OpStore %36 %41 
					                                      f32_4 %43 = OpLoad %36 
					                                      f32_4 %44 = OpFNegate %43 
					                                      f32_4 %45 = OpFAdd %44 %34 
					                                                    OpStore %42 %45 
					                                      f32_4 %48 = OpLoad %20 
					                                      f32_4 %49 = OpFNegate %48 
					                                      f32_4 %50 = OpLoad %42 
					                                      f32_4 %51 = OpFMul %49 %50 
					                                      f32_4 %52 = OpFAdd %51 %34 
					                                                    OpStore %47 %52 
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
			GpuProgramID 377898
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
					  xlv_TEXCOORD0_1 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _ColorBuffer;
					uniform sampler2D _MainTex;
					uniform mediump float _Intensity;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
					void main ()
					{
					  mediump vec4 screencolor_1;
					  mediump vec4 addedbloom_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  addedbloom_2 = tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_ColorBuffer, xlv_TEXCOORD0_1);
					  screencolor_1 = tmpvar_4;
					  gl_FragData[0] = ((_Intensity * addedbloom_2) + screencolor_1);
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
					  xlv_TEXCOORD0_1 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _ColorBuffer;
					uniform sampler2D _MainTex;
					uniform mediump float _Intensity;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
					void main ()
					{
					  mediump vec4 screencolor_1;
					  mediump vec4 addedbloom_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  addedbloom_2 = tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_ColorBuffer, xlv_TEXCOORD0_1);
					  screencolor_1 = tmpvar_4;
					  gl_FragData[0] = ((_Intensity * addedbloom_2) + screencolor_1);
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
					  xlv_TEXCOORD0_1 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _ColorBuffer;
					uniform sampler2D _MainTex;
					uniform mediump float _Intensity;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
					void main ()
					{
					  mediump vec4 screencolor_1;
					  mediump vec4 addedbloom_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  addedbloom_2 = tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_ColorBuffer, xlv_TEXCOORD0_1);
					  screencolor_1 = tmpvar_4;
					  gl_FragData[0] = ((_Intensity * addedbloom_2) + screencolor_1);
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
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump float _Intensity;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _ColorBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture(_ColorBuffer, vs_TEXCOORD1.xy);
					    SV_Target0 = vec4(_Intensity) * u_xlat10_0 + u_xlat10_1;
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
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump float _Intensity;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _ColorBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture(_ColorBuffer, vs_TEXCOORD1.xy);
					    SV_Target0 = vec4(_Intensity) * u_xlat10_0 + u_xlat10_1;
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
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump float _Intensity;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _ColorBuffer;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					lowp vec4 u_xlat10_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture(_ColorBuffer, vs_TEXCOORD1.xy);
					    SV_Target0 = vec4(_Intensity) * u_xlat10_0 + u_xlat10_1;
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
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %104 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %86 Location 86 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 Location 104 
					                                                     OpDecorate %113 RelaxedPrecision 
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
					                                             %88 = OpTypeBool 
					                                             %89 = OpTypePointer Private %88 
					                               Private bool* %90 = OpVariable Private 
					                                             %91 = OpTypePointer Uniform %6 
					                                         f32 %94 = OpConstant 3.674022E-40 
					                                             %96 = OpTypePointer Private %6 
					                                Private f32* %97 = OpVariable Private 
					                                             %98 = OpTypePointer Input %6 
					                                        f32 %102 = OpConstant 3.674022E-40 
					                              Output f32_2* %104 = OpVariable Output 
					                                            %105 = OpTypePointer Function %6 
					                                            %115 = OpTypePointer Output %6 
					                                        u32 %117 = OpConstant 0 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %106 = OpVariable Function 
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
					                                Uniform f32* %92 = OpAccessChain %20 %35 %68 
					                                         f32 %93 = OpLoad %92 
					                                        bool %95 = OpFOrdLessThan %93 %94 
					                                                     OpStore %90 %95 
					                                  Input f32* %99 = OpAccessChain %86 %68 
					                                        f32 %100 = OpLoad %99 
					                                        f32 %101 = OpFNegate %100 
					                                        f32 %103 = OpFAdd %101 %102 
					                                                     OpStore %97 %103 
					                                       bool %107 = OpLoad %90 
					                                                     OpSelectionMerge %109 None 
					                                                     OpBranchConditional %107 %108 %111 
					                                            %108 = OpLabel 
					                                        f32 %110 = OpLoad %97 
					                                                     OpStore %106 %110 
					                                                     OpBranch %109 
					                                            %111 = OpLabel 
					                                 Input f32* %112 = OpAccessChain %86 %68 
					                                        f32 %113 = OpLoad %112 
					                                                     OpStore %106 %113 
					                                                     OpBranch %109 
					                                            %109 = OpLabel 
					                                        f32 %114 = OpLoad %106 
					                                Output f32* %116 = OpAccessChain %104 %68 
					                                                     OpStore %116 %114 
					                                 Input f32* %118 = OpAccessChain %86 %117 
					                                        f32 %119 = OpLoad %118 
					                                Output f32* %120 = OpAccessChain %104 %117 
					                                                     OpStore %120 %119 
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
					; Bound: 42
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %23 %27 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %21 DescriptorSet 21 
					                                                    OpDecorate %21 Binding 21 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %23 Location 23 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %27 Location 27 
					                                                    OpMemberDecorate %28 0 RelaxedPrecision 
					                                                    OpMemberDecorate %28 0 Offset 28 
					                                                    OpDecorate %28 Block 
					                                                    OpDecorate %30 DescriptorSet 30 
					                                                    OpDecorate %30 Binding 30 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %39 RelaxedPrecision 
					                                                    OpDecorate %40 RelaxedPrecision 
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
					UniformConstant read_only Texture2DSampled* %21 = OpVariable UniformConstant 
					                               Input f32_2* %23 = OpVariable Input 
					                                            %26 = OpTypePointer Output %7 
					                              Output f32_4* %27 = OpVariable Output 
					                                            %28 = OpTypeStruct %6 
					                                            %29 = OpTypePointer Uniform %28 
					                     Uniform struct {f32;}* %30 = OpVariable Uniform 
					                                            %31 = OpTypeInt 32 1 
					                                        i32 %32 = OpConstant 0 
					                                            %33 = OpTypePointer Uniform %6 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                 read_only Texture2DSampled %22 = OpLoad %21 
					                                      f32_2 %24 = OpLoad %23 
					                                      f32_4 %25 = OpImageSampleImplicitLod %22 %24 
					                                                    OpStore %20 %25 
					                               Uniform f32* %34 = OpAccessChain %30 %32 
					                                        f32 %35 = OpLoad %34 
					                                      f32_4 %36 = OpCompositeConstruct %35 %35 %35 %35 
					                                      f32_4 %37 = OpLoad %9 
					                                      f32_4 %38 = OpFMul %36 %37 
					                                      f32_4 %39 = OpLoad %20 
					                                      f32_4 %40 = OpFAdd %38 %39 
					                                                    OpStore %27 %40 
					                                                    OpReturn
					                                                    OpFunctionEnd"
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
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %104 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %86 Location 86 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 Location 104 
					                                                     OpDecorate %113 RelaxedPrecision 
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
					                                             %88 = OpTypeBool 
					                                             %89 = OpTypePointer Private %88 
					                               Private bool* %90 = OpVariable Private 
					                                             %91 = OpTypePointer Uniform %6 
					                                         f32 %94 = OpConstant 3.674022E-40 
					                                             %96 = OpTypePointer Private %6 
					                                Private f32* %97 = OpVariable Private 
					                                             %98 = OpTypePointer Input %6 
					                                        f32 %102 = OpConstant 3.674022E-40 
					                              Output f32_2* %104 = OpVariable Output 
					                                            %105 = OpTypePointer Function %6 
					                                            %115 = OpTypePointer Output %6 
					                                        u32 %117 = OpConstant 0 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %106 = OpVariable Function 
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
					                                Uniform f32* %92 = OpAccessChain %20 %35 %68 
					                                         f32 %93 = OpLoad %92 
					                                        bool %95 = OpFOrdLessThan %93 %94 
					                                                     OpStore %90 %95 
					                                  Input f32* %99 = OpAccessChain %86 %68 
					                                        f32 %100 = OpLoad %99 
					                                        f32 %101 = OpFNegate %100 
					                                        f32 %103 = OpFAdd %101 %102 
					                                                     OpStore %97 %103 
					                                       bool %107 = OpLoad %90 
					                                                     OpSelectionMerge %109 None 
					                                                     OpBranchConditional %107 %108 %111 
					                                            %108 = OpLabel 
					                                        f32 %110 = OpLoad %97 
					                                                     OpStore %106 %110 
					                                                     OpBranch %109 
					                                            %111 = OpLabel 
					                                 Input f32* %112 = OpAccessChain %86 %68 
					                                        f32 %113 = OpLoad %112 
					                                                     OpStore %106 %113 
					                                                     OpBranch %109 
					                                            %109 = OpLabel 
					                                        f32 %114 = OpLoad %106 
					                                Output f32* %116 = OpAccessChain %104 %68 
					                                                     OpStore %116 %114 
					                                 Input f32* %118 = OpAccessChain %86 %117 
					                                        f32 %119 = OpLoad %118 
					                                Output f32* %120 = OpAccessChain %104 %117 
					                                                     OpStore %120 %119 
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
					; Bound: 42
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %23 %27 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %21 DescriptorSet 21 
					                                                    OpDecorate %21 Binding 21 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %23 Location 23 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %27 Location 27 
					                                                    OpMemberDecorate %28 0 RelaxedPrecision 
					                                                    OpMemberDecorate %28 0 Offset 28 
					                                                    OpDecorate %28 Block 
					                                                    OpDecorate %30 DescriptorSet 30 
					                                                    OpDecorate %30 Binding 30 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %39 RelaxedPrecision 
					                                                    OpDecorate %40 RelaxedPrecision 
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
					UniformConstant read_only Texture2DSampled* %21 = OpVariable UniformConstant 
					                               Input f32_2* %23 = OpVariable Input 
					                                            %26 = OpTypePointer Output %7 
					                              Output f32_4* %27 = OpVariable Output 
					                                            %28 = OpTypeStruct %6 
					                                            %29 = OpTypePointer Uniform %28 
					                     Uniform struct {f32;}* %30 = OpVariable Uniform 
					                                            %31 = OpTypeInt 32 1 
					                                        i32 %32 = OpConstant 0 
					                                            %33 = OpTypePointer Uniform %6 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                 read_only Texture2DSampled %22 = OpLoad %21 
					                                      f32_2 %24 = OpLoad %23 
					                                      f32_4 %25 = OpImageSampleImplicitLod %22 %24 
					                                                    OpStore %20 %25 
					                               Uniform f32* %34 = OpAccessChain %30 %32 
					                                        f32 %35 = OpLoad %34 
					                                      f32_4 %36 = OpCompositeConstruct %35 %35 %35 %35 
					                                      f32_4 %37 = OpLoad %9 
					                                      f32_4 %38 = OpFMul %36 %37 
					                                      f32_4 %39 = OpLoad %20 
					                                      f32_4 %40 = OpFAdd %38 %39 
					                                                    OpStore %27 %40 
					                                                    OpReturn
					                                                    OpFunctionEnd"
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
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %104 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %86 Location 86 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 Location 104 
					                                                     OpDecorate %113 RelaxedPrecision 
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
					                                             %88 = OpTypeBool 
					                                             %89 = OpTypePointer Private %88 
					                               Private bool* %90 = OpVariable Private 
					                                             %91 = OpTypePointer Uniform %6 
					                                         f32 %94 = OpConstant 3.674022E-40 
					                                             %96 = OpTypePointer Private %6 
					                                Private f32* %97 = OpVariable Private 
					                                             %98 = OpTypePointer Input %6 
					                                        f32 %102 = OpConstant 3.674022E-40 
					                              Output f32_2* %104 = OpVariable Output 
					                                            %105 = OpTypePointer Function %6 
					                                            %115 = OpTypePointer Output %6 
					                                        u32 %117 = OpConstant 0 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %106 = OpVariable Function 
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
					                                Uniform f32* %92 = OpAccessChain %20 %35 %68 
					                                         f32 %93 = OpLoad %92 
					                                        bool %95 = OpFOrdLessThan %93 %94 
					                                                     OpStore %90 %95 
					                                  Input f32* %99 = OpAccessChain %86 %68 
					                                        f32 %100 = OpLoad %99 
					                                        f32 %101 = OpFNegate %100 
					                                        f32 %103 = OpFAdd %101 %102 
					                                                     OpStore %97 %103 
					                                       bool %107 = OpLoad %90 
					                                                     OpSelectionMerge %109 None 
					                                                     OpBranchConditional %107 %108 %111 
					                                            %108 = OpLabel 
					                                        f32 %110 = OpLoad %97 
					                                                     OpStore %106 %110 
					                                                     OpBranch %109 
					                                            %111 = OpLabel 
					                                 Input f32* %112 = OpAccessChain %86 %68 
					                                        f32 %113 = OpLoad %112 
					                                                     OpStore %106 %113 
					                                                     OpBranch %109 
					                                            %109 = OpLabel 
					                                        f32 %114 = OpLoad %106 
					                                Output f32* %116 = OpAccessChain %104 %68 
					                                                     OpStore %116 %114 
					                                 Input f32* %118 = OpAccessChain %86 %117 
					                                        f32 %119 = OpLoad %118 
					                                Output f32* %120 = OpAccessChain %104 %117 
					                                                     OpStore %120 %119 
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
					; Bound: 42
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %23 %27 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %21 DescriptorSet 21 
					                                                    OpDecorate %21 Binding 21 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %23 Location 23 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %27 Location 27 
					                                                    OpMemberDecorate %28 0 RelaxedPrecision 
					                                                    OpMemberDecorate %28 0 Offset 28 
					                                                    OpDecorate %28 Block 
					                                                    OpDecorate %30 DescriptorSet 30 
					                                                    OpDecorate %30 Binding 30 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %39 RelaxedPrecision 
					                                                    OpDecorate %40 RelaxedPrecision 
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
					UniformConstant read_only Texture2DSampled* %21 = OpVariable UniformConstant 
					                               Input f32_2* %23 = OpVariable Input 
					                                            %26 = OpTypePointer Output %7 
					                              Output f32_4* %27 = OpVariable Output 
					                                            %28 = OpTypeStruct %6 
					                                            %29 = OpTypePointer Uniform %28 
					                     Uniform struct {f32;}* %30 = OpVariable Uniform 
					                                            %31 = OpTypeInt 32 1 
					                                        i32 %32 = OpConstant 0 
					                                            %33 = OpTypePointer Uniform %6 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                 read_only Texture2DSampled %22 = OpLoad %21 
					                                      f32_2 %24 = OpLoad %23 
					                                      f32_4 %25 = OpImageSampleImplicitLod %22 %24 
					                                                    OpStore %20 %25 
					                               Uniform f32* %34 = OpAccessChain %30 %32 
					                                        f32 %35 = OpLoad %34 
					                                      f32_4 %36 = OpCompositeConstruct %35 %35 %35 %35 
					                                      f32_4 %37 = OpLoad %9 
					                                      f32_4 %38 = OpFMul %36 %37 
					                                      f32_4 %39 = OpLoad %20 
					                                      f32_4 %40 = OpFAdd %38 %39 
					                                                    OpStore %27 %40 
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
			GpuProgramID 412730
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform mediump vec4 _MainTex_TexelSize;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
					varying highp vec2 xlv_TEXCOORD0_2;
					varying highp vec2 xlv_TEXCOORD0_3;
					varying highp vec2 xlv_TEXCOORD0_4;
					void main ()
					{
					  mediump vec2 tmpvar_1;
					  tmpvar_1 = _glesMultiTexCoord0.xy;
					  highp vec2 tmpvar_2;
					  highp vec2 tmpvar_3;
					  highp vec2 tmpvar_4;
					  highp vec2 tmpvar_5;
					  highp vec2 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_6 = tmpvar_1;
					  mediump vec2 tmpvar_8;
					  tmpvar_8 = (_MainTex_TexelSize.xy * 0.5);
					  tmpvar_2 = (_glesMultiTexCoord0.xy + tmpvar_8);
					  tmpvar_3 = (_glesMultiTexCoord0.xy - tmpvar_8);
					  mediump vec2 tmpvar_9;
					  tmpvar_9 = (_MainTex_TexelSize.xy * vec2(1.0, -1.0));
					  tmpvar_4 = (_glesMultiTexCoord0.xy - (tmpvar_9 * 0.5));
					  tmpvar_5 = (_glesMultiTexCoord0.xy + (tmpvar_9 * 0.5));
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD0_1 = tmpvar_3;
					  xlv_TEXCOORD0_2 = tmpvar_4;
					  xlv_TEXCOORD0_3 = tmpvar_5;
					  xlv_TEXCOORD0_4 = tmpvar_6;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
					varying highp vec2 xlv_TEXCOORD0_2;
					varying highp vec2 xlv_TEXCOORD0_3;
					void main ()
					{
					  mediump vec4 outColor_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  outColor_1 = tmpvar_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0_1);
					  outColor_1 = (outColor_1 + tmpvar_3);
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0_2);
					  outColor_1 = (outColor_1 + tmpvar_4);
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0_3);
					  outColor_1 = (outColor_1 + tmpvar_5);
					  gl_FragData[0] = (outColor_1 / 4.0);
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
					uniform mediump vec4 _MainTex_TexelSize;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
					varying highp vec2 xlv_TEXCOORD0_2;
					varying highp vec2 xlv_TEXCOORD0_3;
					varying highp vec2 xlv_TEXCOORD0_4;
					void main ()
					{
					  mediump vec2 tmpvar_1;
					  tmpvar_1 = _glesMultiTexCoord0.xy;
					  highp vec2 tmpvar_2;
					  highp vec2 tmpvar_3;
					  highp vec2 tmpvar_4;
					  highp vec2 tmpvar_5;
					  highp vec2 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_6 = tmpvar_1;
					  mediump vec2 tmpvar_8;
					  tmpvar_8 = (_MainTex_TexelSize.xy * 0.5);
					  tmpvar_2 = (_glesMultiTexCoord0.xy + tmpvar_8);
					  tmpvar_3 = (_glesMultiTexCoord0.xy - tmpvar_8);
					  mediump vec2 tmpvar_9;
					  tmpvar_9 = (_MainTex_TexelSize.xy * vec2(1.0, -1.0));
					  tmpvar_4 = (_glesMultiTexCoord0.xy - (tmpvar_9 * 0.5));
					  tmpvar_5 = (_glesMultiTexCoord0.xy + (tmpvar_9 * 0.5));
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD0_1 = tmpvar_3;
					  xlv_TEXCOORD0_2 = tmpvar_4;
					  xlv_TEXCOORD0_3 = tmpvar_5;
					  xlv_TEXCOORD0_4 = tmpvar_6;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
					varying highp vec2 xlv_TEXCOORD0_2;
					varying highp vec2 xlv_TEXCOORD0_3;
					void main ()
					{
					  mediump vec4 outColor_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  outColor_1 = tmpvar_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0_1);
					  outColor_1 = (outColor_1 + tmpvar_3);
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0_2);
					  outColor_1 = (outColor_1 + tmpvar_4);
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0_3);
					  outColor_1 = (outColor_1 + tmpvar_5);
					  gl_FragData[0] = (outColor_1 / 4.0);
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
					uniform mediump vec4 _MainTex_TexelSize;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
					varying highp vec2 xlv_TEXCOORD0_2;
					varying highp vec2 xlv_TEXCOORD0_3;
					varying highp vec2 xlv_TEXCOORD0_4;
					void main ()
					{
					  mediump vec2 tmpvar_1;
					  tmpvar_1 = _glesMultiTexCoord0.xy;
					  highp vec2 tmpvar_2;
					  highp vec2 tmpvar_3;
					  highp vec2 tmpvar_4;
					  highp vec2 tmpvar_5;
					  highp vec2 tmpvar_6;
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = _glesVertex.xyz;
					  tmpvar_6 = tmpvar_1;
					  mediump vec2 tmpvar_8;
					  tmpvar_8 = (_MainTex_TexelSize.xy * 0.5);
					  tmpvar_2 = (_glesMultiTexCoord0.xy + tmpvar_8);
					  tmpvar_3 = (_glesMultiTexCoord0.xy - tmpvar_8);
					  mediump vec2 tmpvar_9;
					  tmpvar_9 = (_MainTex_TexelSize.xy * vec2(1.0, -1.0));
					  tmpvar_4 = (_glesMultiTexCoord0.xy - (tmpvar_9 * 0.5));
					  tmpvar_5 = (_glesMultiTexCoord0.xy + (tmpvar_9 * 0.5));
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD0_1 = tmpvar_3;
					  xlv_TEXCOORD0_2 = tmpvar_4;
					  xlv_TEXCOORD0_3 = tmpvar_5;
					  xlv_TEXCOORD0_4 = tmpvar_6;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
					varying highp vec2 xlv_TEXCOORD0_2;
					varying highp vec2 xlv_TEXCOORD0_3;
					void main ()
					{
					  mediump vec4 outColor_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  outColor_1 = tmpvar_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0_1);
					  outColor_1 = (outColor_1 + tmpvar_3);
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0_2);
					  outColor_1 = (outColor_1 + tmpvar_4);
					  lowp vec4 tmpvar_5;
					  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0_3);
					  outColor_1 = (outColor_1 + tmpvar_5);
					  gl_FragData[0] = (outColor_1 / 4.0);
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	mediump vec4 _MainTex_TexelSize;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec2 vs_TEXCOORD1;
					out highp vec2 vs_TEXCOORD2;
					out highp vec2 vs_TEXCOORD3;
					out highp vec2 vs_TEXCOORD4;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
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
					    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(0.5, 0.5, 0.5, -0.5) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD0.xy = u_xlat16_0.xy;
					    vs_TEXCOORD3.xy = u_xlat16_0.zw;
					    u_xlat16_0 = (-_MainTex_TexelSize.xyxy) * vec4(0.5, 0.5, 0.5, -0.5) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD1.xy = u_xlat16_0.xy;
					    vs_TEXCOORD2.xy = u_xlat16_0.zw;
					    vs_TEXCOORD4.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
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
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat10_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
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
					uniform 	mediump vec4 _MainTex_TexelSize;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec2 vs_TEXCOORD1;
					out highp vec2 vs_TEXCOORD2;
					out highp vec2 vs_TEXCOORD3;
					out highp vec2 vs_TEXCOORD4;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
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
					    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(0.5, 0.5, 0.5, -0.5) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD0.xy = u_xlat16_0.xy;
					    vs_TEXCOORD3.xy = u_xlat16_0.zw;
					    u_xlat16_0 = (-_MainTex_TexelSize.xyxy) * vec4(0.5, 0.5, 0.5, -0.5) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD1.xy = u_xlat16_0.xy;
					    vs_TEXCOORD2.xy = u_xlat16_0.zw;
					    vs_TEXCOORD4.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
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
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat10_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
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
					uniform 	mediump vec4 _MainTex_TexelSize;
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
					out highp vec2 vs_TEXCOORD1;
					out highp vec2 vs_TEXCOORD2;
					out highp vec2 vs_TEXCOORD3;
					out highp vec2 vs_TEXCOORD4;
					vec4 u_xlat0;
					mediump vec4 u_xlat16_0;
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
					    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(0.5, 0.5, 0.5, -0.5) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD0.xy = u_xlat16_0.xy;
					    vs_TEXCOORD3.xy = u_xlat16_0.zw;
					    u_xlat16_0 = (-_MainTex_TexelSize.xyxy) * vec4(0.5, 0.5, 0.5, -0.5) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD1.xy = u_xlat16_0.xy;
					    vs_TEXCOORD2.xy = u_xlat16_0.zw;
					    vs_TEXCOORD4.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
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
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat10_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
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
					; Bound: 125
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %92 %97 %100 %111 %114 %117 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %82 RelaxedPrecision 
					                                                     OpDecorate %84 RelaxedPrecision 
					                                                     OpDecorate %85 RelaxedPrecision 
					                                                     OpDecorate %89 RelaxedPrecision 
					                                                     OpDecorate %92 RelaxedPrecision 
					                                                     OpDecorate %92 Location 92 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %94 RelaxedPrecision 
					                                                     OpDecorate %95 RelaxedPrecision 
					                                                     OpDecorate %97 Location 97 
					                                                     OpDecorate %98 RelaxedPrecision 
					                                                     OpDecorate %99 RelaxedPrecision 
					                                                     OpDecorate %100 Location 100 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %102 RelaxedPrecision 
					                                                     OpDecorate %104 RelaxedPrecision 
					                                                     OpDecorate %105 RelaxedPrecision 
					                                                     OpDecorate %106 RelaxedPrecision 
					                                                     OpDecorate %107 RelaxedPrecision 
					                                                     OpDecorate %108 RelaxedPrecision 
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
					                              Private f32_4* %82 = OpVariable Private 
					                                         f32 %86 = OpConstant 3.674022E-40 
					                                         f32 %87 = OpConstant 3.674022E-40 
					                                       f32_4 %88 = OpConstantComposite %86 %86 %86 %87 
					                                             %90 = OpTypeVector %6 2 
					                                             %91 = OpTypePointer Input %90 
					                                Input f32_2* %92 = OpVariable Input 
					                                             %96 = OpTypePointer Output %90 
					                               Output f32_2* %97 = OpVariable Output 
					                              Output f32_2* %100 = OpVariable Output 
					                              Output f32_2* %111 = OpVariable Output 
					                              Output f32_2* %114 = OpVariable Output 
					                              Output f32_2* %117 = OpVariable Output 
					                                            %119 = OpTypePointer Output %6 
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
					                              Uniform f32_4* %83 = OpAccessChain %20 %35 
					                                       f32_4 %84 = OpLoad %83 
					                                       f32_4 %85 = OpVectorShuffle %84 %84 0 1 0 1 
					                                       f32_4 %89 = OpFMul %85 %88 
					                                       f32_2 %93 = OpLoad %92 
					                                       f32_4 %94 = OpVectorShuffle %93 %93 0 1 0 1 
					                                       f32_4 %95 = OpFAdd %89 %94 
					                                                     OpStore %82 %95 
					                                       f32_4 %98 = OpLoad %82 
					                                       f32_2 %99 = OpVectorShuffle %98 %98 0 1 
					                                                     OpStore %97 %99 
					                                      f32_4 %101 = OpLoad %82 
					                                      f32_2 %102 = OpVectorShuffle %101 %101 2 3 
					                                                     OpStore %100 %102 
					                             Uniform f32_4* %103 = OpAccessChain %20 %35 
					                                      f32_4 %104 = OpLoad %103 
					                                      f32_4 %105 = OpVectorShuffle %104 %104 0 1 0 1 
					                                      f32_4 %106 = OpFNegate %105 
					                                      f32_4 %107 = OpFMul %106 %88 
					                                      f32_2 %108 = OpLoad %92 
					                                      f32_4 %109 = OpVectorShuffle %108 %108 0 1 0 1 
					                                      f32_4 %110 = OpFAdd %107 %109 
					                                                     OpStore %82 %110 
					                                      f32_4 %112 = OpLoad %82 
					                                      f32_2 %113 = OpVectorShuffle %112 %112 0 1 
					                                                     OpStore %111 %113 
					                                      f32_4 %115 = OpLoad %82 
					                                      f32_2 %116 = OpVectorShuffle %115 %115 2 3 
					                                                     OpStore %114 %116 
					                                      f32_2 %118 = OpLoad %92 
					                                                     OpStore %117 %118 
					                                Output f32* %120 = OpAccessChain %72 %22 %68 
					                                        f32 %121 = OpLoad %120 
					                                        f32 %122 = OpFNegate %121 
					                                Output f32* %123 = OpAccessChain %72 %22 %68 
					                                                     OpStore %123 %122 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 50
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %22 %30 %37 %44 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 Location 22 
					                                                    OpDecorate %25 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %28 RelaxedPrecision 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %30 Location 30 
					                                                    OpDecorate %33 RelaxedPrecision 
					                                                    OpDecorate %34 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 Location 37 
					                                                    OpDecorate %40 RelaxedPrecision 
					                                                    OpDecorate %41 RelaxedPrecision 
					                                                    OpDecorate %42 RelaxedPrecision 
					                                                    OpDecorate %44 RelaxedPrecision 
					                                                    OpDecorate %44 Location 44 
					                                                    OpDecorate %45 RelaxedPrecision 
					                                                    OpDecorate %48 RelaxedPrecision 
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
					                                            %43 = OpTypePointer Output %7 
					                              Output f32_4* %44 = OpVariable Output 
					                                        f32 %46 = OpConstant 3.674022E-40 
					                                      f32_4 %47 = OpConstantComposite %46 %46 %46 %46 
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
					                                      f32_4 %45 = OpLoad %25 
					                                      f32_4 %48 = OpFMul %45 %47 
					                                                    OpStore %44 %48 
					                                                    OpReturn
					                                                    OpFunctionEnd"
				}
				SubProgram "vulkan hw_tier01 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 125
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %92 %97 %100 %111 %114 %117 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %82 RelaxedPrecision 
					                                                     OpDecorate %84 RelaxedPrecision 
					                                                     OpDecorate %85 RelaxedPrecision 
					                                                     OpDecorate %89 RelaxedPrecision 
					                                                     OpDecorate %92 RelaxedPrecision 
					                                                     OpDecorate %92 Location 92 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %94 RelaxedPrecision 
					                                                     OpDecorate %95 RelaxedPrecision 
					                                                     OpDecorate %97 Location 97 
					                                                     OpDecorate %98 RelaxedPrecision 
					                                                     OpDecorate %99 RelaxedPrecision 
					                                                     OpDecorate %100 Location 100 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %102 RelaxedPrecision 
					                                                     OpDecorate %104 RelaxedPrecision 
					                                                     OpDecorate %105 RelaxedPrecision 
					                                                     OpDecorate %106 RelaxedPrecision 
					                                                     OpDecorate %107 RelaxedPrecision 
					                                                     OpDecorate %108 RelaxedPrecision 
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
					                              Private f32_4* %82 = OpVariable Private 
					                                         f32 %86 = OpConstant 3.674022E-40 
					                                         f32 %87 = OpConstant 3.674022E-40 
					                                       f32_4 %88 = OpConstantComposite %86 %86 %86 %87 
					                                             %90 = OpTypeVector %6 2 
					                                             %91 = OpTypePointer Input %90 
					                                Input f32_2* %92 = OpVariable Input 
					                                             %96 = OpTypePointer Output %90 
					                               Output f32_2* %97 = OpVariable Output 
					                              Output f32_2* %100 = OpVariable Output 
					                              Output f32_2* %111 = OpVariable Output 
					                              Output f32_2* %114 = OpVariable Output 
					                              Output f32_2* %117 = OpVariable Output 
					                                            %119 = OpTypePointer Output %6 
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
					                              Uniform f32_4* %83 = OpAccessChain %20 %35 
					                                       f32_4 %84 = OpLoad %83 
					                                       f32_4 %85 = OpVectorShuffle %84 %84 0 1 0 1 
					                                       f32_4 %89 = OpFMul %85 %88 
					                                       f32_2 %93 = OpLoad %92 
					                                       f32_4 %94 = OpVectorShuffle %93 %93 0 1 0 1 
					                                       f32_4 %95 = OpFAdd %89 %94 
					                                                     OpStore %82 %95 
					                                       f32_4 %98 = OpLoad %82 
					                                       f32_2 %99 = OpVectorShuffle %98 %98 0 1 
					                                                     OpStore %97 %99 
					                                      f32_4 %101 = OpLoad %82 
					                                      f32_2 %102 = OpVectorShuffle %101 %101 2 3 
					                                                     OpStore %100 %102 
					                             Uniform f32_4* %103 = OpAccessChain %20 %35 
					                                      f32_4 %104 = OpLoad %103 
					                                      f32_4 %105 = OpVectorShuffle %104 %104 0 1 0 1 
					                                      f32_4 %106 = OpFNegate %105 
					                                      f32_4 %107 = OpFMul %106 %88 
					                                      f32_2 %108 = OpLoad %92 
					                                      f32_4 %109 = OpVectorShuffle %108 %108 0 1 0 1 
					                                      f32_4 %110 = OpFAdd %107 %109 
					                                                     OpStore %82 %110 
					                                      f32_4 %112 = OpLoad %82 
					                                      f32_2 %113 = OpVectorShuffle %112 %112 0 1 
					                                                     OpStore %111 %113 
					                                      f32_4 %115 = OpLoad %82 
					                                      f32_2 %116 = OpVectorShuffle %115 %115 2 3 
					                                                     OpStore %114 %116 
					                                      f32_2 %118 = OpLoad %92 
					                                                     OpStore %117 %118 
					                                Output f32* %120 = OpAccessChain %72 %22 %68 
					                                        f32 %121 = OpLoad %120 
					                                        f32 %122 = OpFNegate %121 
					                                Output f32* %123 = OpAccessChain %72 %22 %68 
					                                                     OpStore %123 %122 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 50
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %22 %30 %37 %44 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 Location 22 
					                                                    OpDecorate %25 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %28 RelaxedPrecision 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %30 Location 30 
					                                                    OpDecorate %33 RelaxedPrecision 
					                                                    OpDecorate %34 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 Location 37 
					                                                    OpDecorate %40 RelaxedPrecision 
					                                                    OpDecorate %41 RelaxedPrecision 
					                                                    OpDecorate %42 RelaxedPrecision 
					                                                    OpDecorate %44 RelaxedPrecision 
					                                                    OpDecorate %44 Location 44 
					                                                    OpDecorate %45 RelaxedPrecision 
					                                                    OpDecorate %48 RelaxedPrecision 
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
					                                            %43 = OpTypePointer Output %7 
					                              Output f32_4* %44 = OpVariable Output 
					                                        f32 %46 = OpConstant 3.674022E-40 
					                                      f32_4 %47 = OpConstantComposite %46 %46 %46 %46 
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
					                                      f32_4 %45 = OpLoad %25 
					                                      f32_4 %48 = OpFMul %45 %47 
					                                                    OpStore %44 %48 
					                                                    OpReturn
					                                                    OpFunctionEnd"
				}
				SubProgram "vulkan hw_tier02 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 125
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %92 %97 %100 %111 %114 %117 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %82 RelaxedPrecision 
					                                                     OpDecorate %84 RelaxedPrecision 
					                                                     OpDecorate %85 RelaxedPrecision 
					                                                     OpDecorate %89 RelaxedPrecision 
					                                                     OpDecorate %92 RelaxedPrecision 
					                                                     OpDecorate %92 Location 92 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %94 RelaxedPrecision 
					                                                     OpDecorate %95 RelaxedPrecision 
					                                                     OpDecorate %97 Location 97 
					                                                     OpDecorate %98 RelaxedPrecision 
					                                                     OpDecorate %99 RelaxedPrecision 
					                                                     OpDecorate %100 Location 100 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %102 RelaxedPrecision 
					                                                     OpDecorate %104 RelaxedPrecision 
					                                                     OpDecorate %105 RelaxedPrecision 
					                                                     OpDecorate %106 RelaxedPrecision 
					                                                     OpDecorate %107 RelaxedPrecision 
					                                                     OpDecorate %108 RelaxedPrecision 
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
					                              Private f32_4* %82 = OpVariable Private 
					                                         f32 %86 = OpConstant 3.674022E-40 
					                                         f32 %87 = OpConstant 3.674022E-40 
					                                       f32_4 %88 = OpConstantComposite %86 %86 %86 %87 
					                                             %90 = OpTypeVector %6 2 
					                                             %91 = OpTypePointer Input %90 
					                                Input f32_2* %92 = OpVariable Input 
					                                             %96 = OpTypePointer Output %90 
					                               Output f32_2* %97 = OpVariable Output 
					                              Output f32_2* %100 = OpVariable Output 
					                              Output f32_2* %111 = OpVariable Output 
					                              Output f32_2* %114 = OpVariable Output 
					                              Output f32_2* %117 = OpVariable Output 
					                                            %119 = OpTypePointer Output %6 
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
					                              Uniform f32_4* %83 = OpAccessChain %20 %35 
					                                       f32_4 %84 = OpLoad %83 
					                                       f32_4 %85 = OpVectorShuffle %84 %84 0 1 0 1 
					                                       f32_4 %89 = OpFMul %85 %88 
					                                       f32_2 %93 = OpLoad %92 
					                                       f32_4 %94 = OpVectorShuffle %93 %93 0 1 0 1 
					                                       f32_4 %95 = OpFAdd %89 %94 
					                                                     OpStore %82 %95 
					                                       f32_4 %98 = OpLoad %82 
					                                       f32_2 %99 = OpVectorShuffle %98 %98 0 1 
					                                                     OpStore %97 %99 
					                                      f32_4 %101 = OpLoad %82 
					                                      f32_2 %102 = OpVectorShuffle %101 %101 2 3 
					                                                     OpStore %100 %102 
					                             Uniform f32_4* %103 = OpAccessChain %20 %35 
					                                      f32_4 %104 = OpLoad %103 
					                                      f32_4 %105 = OpVectorShuffle %104 %104 0 1 0 1 
					                                      f32_4 %106 = OpFNegate %105 
					                                      f32_4 %107 = OpFMul %106 %88 
					                                      f32_2 %108 = OpLoad %92 
					                                      f32_4 %109 = OpVectorShuffle %108 %108 0 1 0 1 
					                                      f32_4 %110 = OpFAdd %107 %109 
					                                                     OpStore %82 %110 
					                                      f32_4 %112 = OpLoad %82 
					                                      f32_2 %113 = OpVectorShuffle %112 %112 0 1 
					                                                     OpStore %111 %113 
					                                      f32_4 %115 = OpLoad %82 
					                                      f32_2 %116 = OpVectorShuffle %115 %115 2 3 
					                                                     OpStore %114 %116 
					                                      f32_2 %118 = OpLoad %92 
					                                                     OpStore %117 %118 
					                                Output f32* %120 = OpAccessChain %72 %22 %68 
					                                        f32 %121 = OpLoad %120 
					                                        f32 %122 = OpFNegate %121 
					                                Output f32* %123 = OpAccessChain %72 %22 %68 
					                                                     OpStore %123 %122 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 50
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %22 %30 %37 %44 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 Location 22 
					                                                    OpDecorate %25 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %28 RelaxedPrecision 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %30 Location 30 
					                                                    OpDecorate %33 RelaxedPrecision 
					                                                    OpDecorate %34 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 Location 37 
					                                                    OpDecorate %40 RelaxedPrecision 
					                                                    OpDecorate %41 RelaxedPrecision 
					                                                    OpDecorate %42 RelaxedPrecision 
					                                                    OpDecorate %44 RelaxedPrecision 
					                                                    OpDecorate %44 Location 44 
					                                                    OpDecorate %45 RelaxedPrecision 
					                                                    OpDecorate %48 RelaxedPrecision 
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
					                                            %43 = OpTypePointer Output %7 
					                              Output f32_4* %44 = OpVariable Output 
					                                        f32 %46 = OpConstant 3.674022E-40 
					                                      f32_4 %47 = OpConstantComposite %46 %46 %46 %46 
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
					                                      f32_4 %45 = OpLoad %25 
					                                      f32_4 %48 = OpFMul %45 %47 
					                                                    OpStore %44 %48 
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
			Blend Zero SrcAlpha, Zero SrcAlpha
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 504762
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
					  xlv_TEXCOORD0_1 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _ColorBuffer;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 tmpvar_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2.xyz = vec3(1.0, 1.0, 1.0);
					  tmpvar_2.w = texture2D (_ColorBuffer, xlv_TEXCOORD0).x;
					  tmpvar_1 = tmpvar_2;
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
					varying highp vec2 xlv_TEXCOORD0_1;
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
					  xlv_TEXCOORD0_1 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _ColorBuffer;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 tmpvar_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2.xyz = vec3(1.0, 1.0, 1.0);
					  tmpvar_2.w = texture2D (_ColorBuffer, xlv_TEXCOORD0).x;
					  tmpvar_1 = tmpvar_2;
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
					varying highp vec2 xlv_TEXCOORD0_1;
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
					  xlv_TEXCOORD0_1 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _ColorBuffer;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 tmpvar_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2.xyz = vec3(1.0, 1.0, 1.0);
					  tmpvar_2.w = texture2D (_ColorBuffer, xlv_TEXCOORD0).x;
					  tmpvar_1 = tmpvar_2;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform lowp sampler2D _ColorBuffer;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					lowp float u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture(_ColorBuffer, vs_TEXCOORD0.xy).x;
					    SV_Target0.w = u_xlat10_0;
					    SV_Target0.xyz = vec3(1.0, 1.0, 1.0);
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
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform lowp sampler2D _ColorBuffer;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					lowp float u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture(_ColorBuffer, vs_TEXCOORD0.xy).x;
					    SV_Target0.w = u_xlat10_0;
					    SV_Target0.xyz = vec3(1.0, 1.0, 1.0);
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
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform lowp sampler2D _ColorBuffer;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					lowp float u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture(_ColorBuffer, vs_TEXCOORD0.xy).x;
					    SV_Target0.w = u_xlat10_0;
					    SV_Target0.xyz = vec3(1.0, 1.0, 1.0);
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
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %104 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %86 Location 86 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 Location 104 
					                                                     OpDecorate %113 RelaxedPrecision 
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
					                                             %88 = OpTypeBool 
					                                             %89 = OpTypePointer Private %88 
					                               Private bool* %90 = OpVariable Private 
					                                             %91 = OpTypePointer Uniform %6 
					                                         f32 %94 = OpConstant 3.674022E-40 
					                                             %96 = OpTypePointer Private %6 
					                                Private f32* %97 = OpVariable Private 
					                                             %98 = OpTypePointer Input %6 
					                                        f32 %102 = OpConstant 3.674022E-40 
					                              Output f32_2* %104 = OpVariable Output 
					                                            %105 = OpTypePointer Function %6 
					                                            %115 = OpTypePointer Output %6 
					                                        u32 %117 = OpConstant 0 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %106 = OpVariable Function 
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
					                                Uniform f32* %92 = OpAccessChain %20 %35 %68 
					                                         f32 %93 = OpLoad %92 
					                                        bool %95 = OpFOrdLessThan %93 %94 
					                                                     OpStore %90 %95 
					                                  Input f32* %99 = OpAccessChain %86 %68 
					                                        f32 %100 = OpLoad %99 
					                                        f32 %101 = OpFNegate %100 
					                                        f32 %103 = OpFAdd %101 %102 
					                                                     OpStore %97 %103 
					                                       bool %107 = OpLoad %90 
					                                                     OpSelectionMerge %109 None 
					                                                     OpBranchConditional %107 %108 %111 
					                                            %108 = OpLabel 
					                                        f32 %110 = OpLoad %97 
					                                                     OpStore %106 %110 
					                                                     OpBranch %109 
					                                            %111 = OpLabel 
					                                 Input f32* %112 = OpAccessChain %86 %68 
					                                        f32 %113 = OpLoad %112 
					                                                     OpStore %106 %113 
					                                                     OpBranch %109 
					                                            %109 = OpLabel 
					                                        f32 %114 = OpLoad %106 
					                                Output f32* %116 = OpAccessChain %104 %68 
					                                                     OpStore %116 %114 
					                                 Input f32* %118 = OpAccessChain %86 %117 
					                                        f32 %119 = OpLoad %118 
					                                Output f32* %120 = OpAccessChain %104 %117 
					                                                     OpStore %120 %119 
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
					; Bound: 35
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %16 %24 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %8 RelaxedPrecision 
					                                                    OpDecorate %12 RelaxedPrecision 
					                                                    OpDecorate %12 DescriptorSet 12 
					                                                    OpDecorate %12 Binding 12 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %16 Location 16 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %24 RelaxedPrecision 
					                                                    OpDecorate %24 Location 24 
					                                                    OpDecorate %25 RelaxedPrecision 
					                                             %2 = OpTypeVoid 
					                                             %3 = OpTypeFunction %2 
					                                             %6 = OpTypeFloat 32 
					                                             %7 = OpTypePointer Private %6 
					                                Private f32* %8 = OpVariable Private 
					                                             %9 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %10 = OpTypeSampledImage %9 
					                                            %11 = OpTypePointer UniformConstant %10 
					UniformConstant read_only Texture2DSampled* %12 = OpVariable UniformConstant 
					                                            %14 = OpTypeVector %6 2 
					                                            %15 = OpTypePointer Input %14 
					                               Input f32_2* %16 = OpVariable Input 
					                                            %18 = OpTypeVector %6 4 
					                                            %20 = OpTypeInt 32 0 
					                                        u32 %21 = OpConstant 0 
					                                            %23 = OpTypePointer Output %18 
					                              Output f32_4* %24 = OpVariable Output 
					                                        u32 %26 = OpConstant 3 
					                                            %27 = OpTypePointer Output %6 
					                                            %29 = OpTypeVector %6 3 
					                                        f32 %30 = OpConstant 3.674022E-40 
					                                      f32_3 %31 = OpConstantComposite %30 %30 %30 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %13 = OpLoad %12 
					                                      f32_2 %17 = OpLoad %16 
					                                      f32_4 %19 = OpImageSampleImplicitLod %13 %17 
					                                        f32 %22 = OpCompositeExtract %19 0 
					                                                    OpStore %8 %22 
					                                        f32 %25 = OpLoad %8 
					                                Output f32* %28 = OpAccessChain %24 %26 
					                                                    OpStore %28 %25 
					                                      f32_4 %32 = OpLoad %24 
					                                      f32_4 %33 = OpVectorShuffle %32 %31 4 5 6 3 
					                                                    OpStore %24 %33 
					                                                    OpReturn
					                                                    OpFunctionEnd"
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
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %104 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %86 Location 86 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 Location 104 
					                                                     OpDecorate %113 RelaxedPrecision 
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
					                                             %88 = OpTypeBool 
					                                             %89 = OpTypePointer Private %88 
					                               Private bool* %90 = OpVariable Private 
					                                             %91 = OpTypePointer Uniform %6 
					                                         f32 %94 = OpConstant 3.674022E-40 
					                                             %96 = OpTypePointer Private %6 
					                                Private f32* %97 = OpVariable Private 
					                                             %98 = OpTypePointer Input %6 
					                                        f32 %102 = OpConstant 3.674022E-40 
					                              Output f32_2* %104 = OpVariable Output 
					                                            %105 = OpTypePointer Function %6 
					                                            %115 = OpTypePointer Output %6 
					                                        u32 %117 = OpConstant 0 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %106 = OpVariable Function 
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
					                                Uniform f32* %92 = OpAccessChain %20 %35 %68 
					                                         f32 %93 = OpLoad %92 
					                                        bool %95 = OpFOrdLessThan %93 %94 
					                                                     OpStore %90 %95 
					                                  Input f32* %99 = OpAccessChain %86 %68 
					                                        f32 %100 = OpLoad %99 
					                                        f32 %101 = OpFNegate %100 
					                                        f32 %103 = OpFAdd %101 %102 
					                                                     OpStore %97 %103 
					                                       bool %107 = OpLoad %90 
					                                                     OpSelectionMerge %109 None 
					                                                     OpBranchConditional %107 %108 %111 
					                                            %108 = OpLabel 
					                                        f32 %110 = OpLoad %97 
					                                                     OpStore %106 %110 
					                                                     OpBranch %109 
					                                            %111 = OpLabel 
					                                 Input f32* %112 = OpAccessChain %86 %68 
					                                        f32 %113 = OpLoad %112 
					                                                     OpStore %106 %113 
					                                                     OpBranch %109 
					                                            %109 = OpLabel 
					                                        f32 %114 = OpLoad %106 
					                                Output f32* %116 = OpAccessChain %104 %68 
					                                                     OpStore %116 %114 
					                                 Input f32* %118 = OpAccessChain %86 %117 
					                                        f32 %119 = OpLoad %118 
					                                Output f32* %120 = OpAccessChain %104 %117 
					                                                     OpStore %120 %119 
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
					; Bound: 35
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %16 %24 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %8 RelaxedPrecision 
					                                                    OpDecorate %12 RelaxedPrecision 
					                                                    OpDecorate %12 DescriptorSet 12 
					                                                    OpDecorate %12 Binding 12 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %16 Location 16 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %24 RelaxedPrecision 
					                                                    OpDecorate %24 Location 24 
					                                                    OpDecorate %25 RelaxedPrecision 
					                                             %2 = OpTypeVoid 
					                                             %3 = OpTypeFunction %2 
					                                             %6 = OpTypeFloat 32 
					                                             %7 = OpTypePointer Private %6 
					                                Private f32* %8 = OpVariable Private 
					                                             %9 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %10 = OpTypeSampledImage %9 
					                                            %11 = OpTypePointer UniformConstant %10 
					UniformConstant read_only Texture2DSampled* %12 = OpVariable UniformConstant 
					                                            %14 = OpTypeVector %6 2 
					                                            %15 = OpTypePointer Input %14 
					                               Input f32_2* %16 = OpVariable Input 
					                                            %18 = OpTypeVector %6 4 
					                                            %20 = OpTypeInt 32 0 
					                                        u32 %21 = OpConstant 0 
					                                            %23 = OpTypePointer Output %18 
					                              Output f32_4* %24 = OpVariable Output 
					                                        u32 %26 = OpConstant 3 
					                                            %27 = OpTypePointer Output %6 
					                                            %29 = OpTypeVector %6 3 
					                                        f32 %30 = OpConstant 3.674022E-40 
					                                      f32_3 %31 = OpConstantComposite %30 %30 %30 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %13 = OpLoad %12 
					                                      f32_2 %17 = OpLoad %16 
					                                      f32_4 %19 = OpImageSampleImplicitLod %13 %17 
					                                        f32 %22 = OpCompositeExtract %19 0 
					                                                    OpStore %8 %22 
					                                        f32 %25 = OpLoad %8 
					                                Output f32* %28 = OpAccessChain %24 %26 
					                                                    OpStore %28 %25 
					                                      f32_4 %32 = OpLoad %24 
					                                      f32_4 %33 = OpVectorShuffle %32 %31 4 5 6 3 
					                                                    OpStore %24 %33 
					                                                    OpReturn
					                                                    OpFunctionEnd"
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
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %104 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %86 Location 86 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 Location 104 
					                                                     OpDecorate %113 RelaxedPrecision 
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
					                                             %88 = OpTypeBool 
					                                             %89 = OpTypePointer Private %88 
					                               Private bool* %90 = OpVariable Private 
					                                             %91 = OpTypePointer Uniform %6 
					                                         f32 %94 = OpConstant 3.674022E-40 
					                                             %96 = OpTypePointer Private %6 
					                                Private f32* %97 = OpVariable Private 
					                                             %98 = OpTypePointer Input %6 
					                                        f32 %102 = OpConstant 3.674022E-40 
					                              Output f32_2* %104 = OpVariable Output 
					                                            %105 = OpTypePointer Function %6 
					                                            %115 = OpTypePointer Output %6 
					                                        u32 %117 = OpConstant 0 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %106 = OpVariable Function 
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
					                                Uniform f32* %92 = OpAccessChain %20 %35 %68 
					                                         f32 %93 = OpLoad %92 
					                                        bool %95 = OpFOrdLessThan %93 %94 
					                                                     OpStore %90 %95 
					                                  Input f32* %99 = OpAccessChain %86 %68 
					                                        f32 %100 = OpLoad %99 
					                                        f32 %101 = OpFNegate %100 
					                                        f32 %103 = OpFAdd %101 %102 
					                                                     OpStore %97 %103 
					                                       bool %107 = OpLoad %90 
					                                                     OpSelectionMerge %109 None 
					                                                     OpBranchConditional %107 %108 %111 
					                                            %108 = OpLabel 
					                                        f32 %110 = OpLoad %97 
					                                                     OpStore %106 %110 
					                                                     OpBranch %109 
					                                            %111 = OpLabel 
					                                 Input f32* %112 = OpAccessChain %86 %68 
					                                        f32 %113 = OpLoad %112 
					                                                     OpStore %106 %113 
					                                                     OpBranch %109 
					                                            %109 = OpLabel 
					                                        f32 %114 = OpLoad %106 
					                                Output f32* %116 = OpAccessChain %104 %68 
					                                                     OpStore %116 %114 
					                                 Input f32* %118 = OpAccessChain %86 %117 
					                                        f32 %119 = OpLoad %118 
					                                Output f32* %120 = OpAccessChain %104 %117 
					                                                     OpStore %120 %119 
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
					; Bound: 35
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %16 %24 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %8 RelaxedPrecision 
					                                                    OpDecorate %12 RelaxedPrecision 
					                                                    OpDecorate %12 DescriptorSet 12 
					                                                    OpDecorate %12 Binding 12 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %16 Location 16 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %24 RelaxedPrecision 
					                                                    OpDecorate %24 Location 24 
					                                                    OpDecorate %25 RelaxedPrecision 
					                                             %2 = OpTypeVoid 
					                                             %3 = OpTypeFunction %2 
					                                             %6 = OpTypeFloat 32 
					                                             %7 = OpTypePointer Private %6 
					                                Private f32* %8 = OpVariable Private 
					                                             %9 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %10 = OpTypeSampledImage %9 
					                                            %11 = OpTypePointer UniformConstant %10 
					UniformConstant read_only Texture2DSampled* %12 = OpVariable UniformConstant 
					                                            %14 = OpTypeVector %6 2 
					                                            %15 = OpTypePointer Input %14 
					                               Input f32_2* %16 = OpVariable Input 
					                                            %18 = OpTypeVector %6 4 
					                                            %20 = OpTypeInt 32 0 
					                                        u32 %21 = OpConstant 0 
					                                            %23 = OpTypePointer Output %18 
					                              Output f32_4* %24 = OpVariable Output 
					                                        u32 %26 = OpConstant 3 
					                                            %27 = OpTypePointer Output %6 
					                                            %29 = OpTypeVector %6 3 
					                                        f32 %30 = OpConstant 3.674022E-40 
					                                      f32_3 %31 = OpConstantComposite %30 %30 %30 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %13 = OpLoad %12 
					                                      f32_2 %17 = OpLoad %16 
					                                      f32_4 %19 = OpImageSampleImplicitLod %13 %17 
					                                        f32 %22 = OpCompositeExtract %19 0 
					                                                    OpStore %8 %22 
					                                        f32 %25 = OpLoad %8 
					                                Output f32* %28 = OpAccessChain %24 %26 
					                                                    OpStore %28 %25 
					                                      f32_4 %32 = OpLoad %24 
					                                      f32_4 %33 = OpVectorShuffle %32 %31 4 5 6 3 
					                                                    OpStore %24 %33 
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
			GpuProgramID 530775
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
					  xlv_TEXCOORD0_1 = tmpvar_3;
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
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
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
					  xlv_TEXCOORD0_1 = tmpvar_3;
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
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD0_1;
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
					  xlv_TEXCOORD0_1 = tmpvar_3;
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
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in highp vec4 in_POSITION0;
					in mediump vec2 in_TEXCOORD0;
					out highp vec2 vs_TEXCOORD0;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					layout(location = 0) out mediump vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
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
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					layout(location = 0) out mediump vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
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
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					layout(location = 0) out mediump vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
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
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %104 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %86 Location 86 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 Location 104 
					                                                     OpDecorate %113 RelaxedPrecision 
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
					                                             %88 = OpTypeBool 
					                                             %89 = OpTypePointer Private %88 
					                               Private bool* %90 = OpVariable Private 
					                                             %91 = OpTypePointer Uniform %6 
					                                         f32 %94 = OpConstant 3.674022E-40 
					                                             %96 = OpTypePointer Private %6 
					                                Private f32* %97 = OpVariable Private 
					                                             %98 = OpTypePointer Input %6 
					                                        f32 %102 = OpConstant 3.674022E-40 
					                              Output f32_2* %104 = OpVariable Output 
					                                            %105 = OpTypePointer Function %6 
					                                            %115 = OpTypePointer Output %6 
					                                        u32 %117 = OpConstant 0 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %106 = OpVariable Function 
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
					                                Uniform f32* %92 = OpAccessChain %20 %35 %68 
					                                         f32 %93 = OpLoad %92 
					                                        bool %95 = OpFOrdLessThan %93 %94 
					                                                     OpStore %90 %95 
					                                  Input f32* %99 = OpAccessChain %86 %68 
					                                        f32 %100 = OpLoad %99 
					                                        f32 %101 = OpFNegate %100 
					                                        f32 %103 = OpFAdd %101 %102 
					                                                     OpStore %97 %103 
					                                       bool %107 = OpLoad %90 
					                                                     OpSelectionMerge %109 None 
					                                                     OpBranchConditional %107 %108 %111 
					                                            %108 = OpLabel 
					                                        f32 %110 = OpLoad %97 
					                                                     OpStore %106 %110 
					                                                     OpBranch %109 
					                                            %111 = OpLabel 
					                                 Input f32* %112 = OpAccessChain %86 %68 
					                                        f32 %113 = OpLoad %112 
					                                                     OpStore %106 %113 
					                                                     OpBranch %109 
					                                            %109 = OpLabel 
					                                        f32 %114 = OpLoad %106 
					                                Output f32* %116 = OpAccessChain %104 %68 
					                                                     OpStore %116 %114 
					                                 Input f32* %118 = OpAccessChain %86 %117 
					                                        f32 %119 = OpLoad %118 
					                                Output f32* %120 = OpAccessChain %104 %117 
					                                                     OpStore %120 %119 
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
					; Bound: 13
					; Schema: 0
					                     OpCapability Shader 
					              %1 = OpExtInstImport "GLSL.std.450" 
					                     OpMemoryModel Logical GLSL450 
					                     OpEntryPoint Fragment %4 "main" %9 
					                     OpExecutionMode %4 OriginUpperLeft 
					                     OpDecorate %9 RelaxedPrecision 
					                     OpDecorate %9 Location 9 
					              %2 = OpTypeVoid 
					              %3 = OpTypeFunction %2 
					              %6 = OpTypeFloat 32 
					              %7 = OpTypeVector %6 4 
					              %8 = OpTypePointer Output %7 
					Output f32_4* %9 = OpVariable Output 
					         f32 %10 = OpConstant 3.674022E-40 
					       f32_4 %11 = OpConstantComposite %10 %10 %10 %10 
					         void %4 = OpFunction None %3 
					              %5 = OpLabel 
					                     OpStore %9 %11 
					                     OpReturn
					                     OpFunctionEnd"
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
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %104 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %86 Location 86 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 Location 104 
					                                                     OpDecorate %113 RelaxedPrecision 
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
					                                             %88 = OpTypeBool 
					                                             %89 = OpTypePointer Private %88 
					                               Private bool* %90 = OpVariable Private 
					                                             %91 = OpTypePointer Uniform %6 
					                                         f32 %94 = OpConstant 3.674022E-40 
					                                             %96 = OpTypePointer Private %6 
					                                Private f32* %97 = OpVariable Private 
					                                             %98 = OpTypePointer Input %6 
					                                        f32 %102 = OpConstant 3.674022E-40 
					                              Output f32_2* %104 = OpVariable Output 
					                                            %105 = OpTypePointer Function %6 
					                                            %115 = OpTypePointer Output %6 
					                                        u32 %117 = OpConstant 0 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %106 = OpVariable Function 
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
					                                Uniform f32* %92 = OpAccessChain %20 %35 %68 
					                                         f32 %93 = OpLoad %92 
					                                        bool %95 = OpFOrdLessThan %93 %94 
					                                                     OpStore %90 %95 
					                                  Input f32* %99 = OpAccessChain %86 %68 
					                                        f32 %100 = OpLoad %99 
					                                        f32 %101 = OpFNegate %100 
					                                        f32 %103 = OpFAdd %101 %102 
					                                                     OpStore %97 %103 
					                                       bool %107 = OpLoad %90 
					                                                     OpSelectionMerge %109 None 
					                                                     OpBranchConditional %107 %108 %111 
					                                            %108 = OpLabel 
					                                        f32 %110 = OpLoad %97 
					                                                     OpStore %106 %110 
					                                                     OpBranch %109 
					                                            %111 = OpLabel 
					                                 Input f32* %112 = OpAccessChain %86 %68 
					                                        f32 %113 = OpLoad %112 
					                                                     OpStore %106 %113 
					                                                     OpBranch %109 
					                                            %109 = OpLabel 
					                                        f32 %114 = OpLoad %106 
					                                Output f32* %116 = OpAccessChain %104 %68 
					                                                     OpStore %116 %114 
					                                 Input f32* %118 = OpAccessChain %86 %117 
					                                        f32 %119 = OpLoad %118 
					                                Output f32* %120 = OpAccessChain %104 %117 
					                                                     OpStore %120 %119 
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
					; Bound: 13
					; Schema: 0
					                     OpCapability Shader 
					              %1 = OpExtInstImport "GLSL.std.450" 
					                     OpMemoryModel Logical GLSL450 
					                     OpEntryPoint Fragment %4 "main" %9 
					                     OpExecutionMode %4 OriginUpperLeft 
					                     OpDecorate %9 RelaxedPrecision 
					                     OpDecorate %9 Location 9 
					              %2 = OpTypeVoid 
					              %3 = OpTypeFunction %2 
					              %6 = OpTypeFloat 32 
					              %7 = OpTypeVector %6 4 
					              %8 = OpTypePointer Output %7 
					Output f32_4* %9 = OpVariable Output 
					         f32 %10 = OpConstant 3.674022E-40 
					       f32_4 %11 = OpConstantComposite %10 %10 %10 %10 
					         void %4 = OpFunction None %3 
					              %5 = OpLabel 
					                     OpStore %9 %11 
					                     OpReturn
					                     OpFunctionEnd"
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
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %104 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %86 Location 86 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 Location 104 
					                                                     OpDecorate %113 RelaxedPrecision 
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
					                                             %88 = OpTypeBool 
					                                             %89 = OpTypePointer Private %88 
					                               Private bool* %90 = OpVariable Private 
					                                             %91 = OpTypePointer Uniform %6 
					                                         f32 %94 = OpConstant 3.674022E-40 
					                                             %96 = OpTypePointer Private %6 
					                                Private f32* %97 = OpVariable Private 
					                                             %98 = OpTypePointer Input %6 
					                                        f32 %102 = OpConstant 3.674022E-40 
					                              Output f32_2* %104 = OpVariable Output 
					                                            %105 = OpTypePointer Function %6 
					                                            %115 = OpTypePointer Output %6 
					                                        u32 %117 = OpConstant 0 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %106 = OpVariable Function 
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
					                                Uniform f32* %92 = OpAccessChain %20 %35 %68 
					                                         f32 %93 = OpLoad %92 
					                                        bool %95 = OpFOrdLessThan %93 %94 
					                                                     OpStore %90 %95 
					                                  Input f32* %99 = OpAccessChain %86 %68 
					                                        f32 %100 = OpLoad %99 
					                                        f32 %101 = OpFNegate %100 
					                                        f32 %103 = OpFAdd %101 %102 
					                                                     OpStore %97 %103 
					                                       bool %107 = OpLoad %90 
					                                                     OpSelectionMerge %109 None 
					                                                     OpBranchConditional %107 %108 %111 
					                                            %108 = OpLabel 
					                                        f32 %110 = OpLoad %97 
					                                                     OpStore %106 %110 
					                                                     OpBranch %109 
					                                            %111 = OpLabel 
					                                 Input f32* %112 = OpAccessChain %86 %68 
					                                        f32 %113 = OpLoad %112 
					                                                     OpStore %106 %113 
					                                                     OpBranch %109 
					                                            %109 = OpLabel 
					                                        f32 %114 = OpLoad %106 
					                                Output f32* %116 = OpAccessChain %104 %68 
					                                                     OpStore %116 %114 
					                                 Input f32* %118 = OpAccessChain %86 %117 
					                                        f32 %119 = OpLoad %118 
					                                Output f32* %120 = OpAccessChain %104 %117 
					                                                     OpStore %120 %119 
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
					; Bound: 13
					; Schema: 0
					                     OpCapability Shader 
					              %1 = OpExtInstImport "GLSL.std.450" 
					                     OpMemoryModel Logical GLSL450 
					                     OpEntryPoint Fragment %4 "main" %9 
					                     OpExecutionMode %4 OriginUpperLeft 
					                     OpDecorate %9 RelaxedPrecision 
					                     OpDecorate %9 Location 9 
					              %2 = OpTypeVoid 
					              %3 = OpTypeFunction %2 
					              %6 = OpTypeFloat 32 
					              %7 = OpTypeVector %6 4 
					              %8 = OpTypePointer Output %7 
					Output f32_4* %9 = OpVariable Output 
					         f32 %10 = OpConstant 3.674022E-40 
					       f32_4 %11 = OpConstantComposite %10 %10 %10 %10 
					         void %4 = OpFunction None %3 
					              %5 = OpLabel 
					                     OpStore %9 %11 
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
			Blend One One, One One
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 655047
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
					  xlv_TEXCOORD0_1 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform mediump float _Intensity;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 addedColors_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  addedColors_1 = tmpvar_2;
					  gl_FragData[0] = (addedColors_1 * _Intensity);
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
					  xlv_TEXCOORD0_1 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform mediump float _Intensity;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 addedColors_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  addedColors_1 = tmpvar_2;
					  gl_FragData[0] = (addedColors_1 * _Intensity);
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
					  xlv_TEXCOORD0_1 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform mediump float _Intensity;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 addedColors_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  addedColors_1 = tmpvar_2;
					  gl_FragData[0] = (addedColors_1 * _Intensity);
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
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump float _Intensity;
					uniform lowp sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					lowp vec4 u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0 = u_xlat10_0 * vec4(_Intensity);
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
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump float _Intensity;
					uniform lowp sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					lowp vec4 u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0 = u_xlat10_0 * vec4(_Intensity);
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
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump float _Intensity;
					uniform lowp sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					lowp vec4 u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0 = u_xlat10_0 * vec4(_Intensity);
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
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %104 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %86 Location 86 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 Location 104 
					                                                     OpDecorate %113 RelaxedPrecision 
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
					                                             %88 = OpTypeBool 
					                                             %89 = OpTypePointer Private %88 
					                               Private bool* %90 = OpVariable Private 
					                                             %91 = OpTypePointer Uniform %6 
					                                         f32 %94 = OpConstant 3.674022E-40 
					                                             %96 = OpTypePointer Private %6 
					                                Private f32* %97 = OpVariable Private 
					                                             %98 = OpTypePointer Input %6 
					                                        f32 %102 = OpConstant 3.674022E-40 
					                              Output f32_2* %104 = OpVariable Output 
					                                            %105 = OpTypePointer Function %6 
					                                            %115 = OpTypePointer Output %6 
					                                        u32 %117 = OpConstant 0 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %106 = OpVariable Function 
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
					                                Uniform f32* %92 = OpAccessChain %20 %35 %68 
					                                         f32 %93 = OpLoad %92 
					                                        bool %95 = OpFOrdLessThan %93 %94 
					                                                     OpStore %90 %95 
					                                  Input f32* %99 = OpAccessChain %86 %68 
					                                        f32 %100 = OpLoad %99 
					                                        f32 %101 = OpFNegate %100 
					                                        f32 %103 = OpFAdd %101 %102 
					                                                     OpStore %97 %103 
					                                       bool %107 = OpLoad %90 
					                                                     OpSelectionMerge %109 None 
					                                                     OpBranchConditional %107 %108 %111 
					                                            %108 = OpLabel 
					                                        f32 %110 = OpLoad %97 
					                                                     OpStore %106 %110 
					                                                     OpBranch %109 
					                                            %111 = OpLabel 
					                                 Input f32* %112 = OpAccessChain %86 %68 
					                                        f32 %113 = OpLoad %112 
					                                                     OpStore %106 %113 
					                                                     OpBranch %109 
					                                            %109 = OpLabel 
					                                        f32 %114 = OpLoad %106 
					                                Output f32* %116 = OpAccessChain %104 %68 
					                                                     OpStore %116 %114 
					                                 Input f32* %118 = OpAccessChain %86 %117 
					                                        f32 %119 = OpLoad %118 
					                                Output f32* %120 = OpAccessChain %104 %117 
					                                                     OpStore %120 %119 
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
					; Bound: 34
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %21 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %21 Location 21 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpMemberDecorate %23 0 RelaxedPrecision 
					                                                    OpMemberDecorate %23 0 Offset 23 
					                                                    OpDecorate %23 Block 
					                                                    OpDecorate %25 DescriptorSet 25 
					                                                    OpDecorate %25 Binding 25 
					                                                    OpDecorate %30 RelaxedPrecision 
					                                                    OpDecorate %31 RelaxedPrecision 
					                                                    OpDecorate %32 RelaxedPrecision 
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
					                                            %20 = OpTypePointer Output %7 
					                              Output f32_4* %21 = OpVariable Output 
					                                            %23 = OpTypeStruct %6 
					                                            %24 = OpTypePointer Uniform %23 
					                     Uniform struct {f32;}* %25 = OpVariable Uniform 
					                                            %26 = OpTypeInt 32 1 
					                                        i32 %27 = OpConstant 0 
					                                            %28 = OpTypePointer Uniform %6 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                                      f32_4 %22 = OpLoad %9 
					                               Uniform f32* %29 = OpAccessChain %25 %27 
					                                        f32 %30 = OpLoad %29 
					                                      f32_4 %31 = OpCompositeConstruct %30 %30 %30 %30 
					                                      f32_4 %32 = OpFMul %22 %31 
					                                                    OpStore %21 %32 
					                                                    OpReturn
					                                                    OpFunctionEnd"
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
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %104 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %86 Location 86 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 Location 104 
					                                                     OpDecorate %113 RelaxedPrecision 
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
					                                             %88 = OpTypeBool 
					                                             %89 = OpTypePointer Private %88 
					                               Private bool* %90 = OpVariable Private 
					                                             %91 = OpTypePointer Uniform %6 
					                                         f32 %94 = OpConstant 3.674022E-40 
					                                             %96 = OpTypePointer Private %6 
					                                Private f32* %97 = OpVariable Private 
					                                             %98 = OpTypePointer Input %6 
					                                        f32 %102 = OpConstant 3.674022E-40 
					                              Output f32_2* %104 = OpVariable Output 
					                                            %105 = OpTypePointer Function %6 
					                                            %115 = OpTypePointer Output %6 
					                                        u32 %117 = OpConstant 0 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %106 = OpVariable Function 
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
					                                Uniform f32* %92 = OpAccessChain %20 %35 %68 
					                                         f32 %93 = OpLoad %92 
					                                        bool %95 = OpFOrdLessThan %93 %94 
					                                                     OpStore %90 %95 
					                                  Input f32* %99 = OpAccessChain %86 %68 
					                                        f32 %100 = OpLoad %99 
					                                        f32 %101 = OpFNegate %100 
					                                        f32 %103 = OpFAdd %101 %102 
					                                                     OpStore %97 %103 
					                                       bool %107 = OpLoad %90 
					                                                     OpSelectionMerge %109 None 
					                                                     OpBranchConditional %107 %108 %111 
					                                            %108 = OpLabel 
					                                        f32 %110 = OpLoad %97 
					                                                     OpStore %106 %110 
					                                                     OpBranch %109 
					                                            %111 = OpLabel 
					                                 Input f32* %112 = OpAccessChain %86 %68 
					                                        f32 %113 = OpLoad %112 
					                                                     OpStore %106 %113 
					                                                     OpBranch %109 
					                                            %109 = OpLabel 
					                                        f32 %114 = OpLoad %106 
					                                Output f32* %116 = OpAccessChain %104 %68 
					                                                     OpStore %116 %114 
					                                 Input f32* %118 = OpAccessChain %86 %117 
					                                        f32 %119 = OpLoad %118 
					                                Output f32* %120 = OpAccessChain %104 %117 
					                                                     OpStore %120 %119 
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
					; Bound: 34
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %21 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %21 Location 21 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpMemberDecorate %23 0 RelaxedPrecision 
					                                                    OpMemberDecorate %23 0 Offset 23 
					                                                    OpDecorate %23 Block 
					                                                    OpDecorate %25 DescriptorSet 25 
					                                                    OpDecorate %25 Binding 25 
					                                                    OpDecorate %30 RelaxedPrecision 
					                                                    OpDecorate %31 RelaxedPrecision 
					                                                    OpDecorate %32 RelaxedPrecision 
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
					                                            %20 = OpTypePointer Output %7 
					                              Output f32_4* %21 = OpVariable Output 
					                                            %23 = OpTypeStruct %6 
					                                            %24 = OpTypePointer Uniform %23 
					                     Uniform struct {f32;}* %25 = OpVariable Uniform 
					                                            %26 = OpTypeInt 32 1 
					                                        i32 %27 = OpConstant 0 
					                                            %28 = OpTypePointer Uniform %6 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                                      f32_4 %22 = OpLoad %9 
					                               Uniform f32* %29 = OpAccessChain %25 %27 
					                                        f32 %30 = OpLoad %29 
					                                      f32_4 %31 = OpCompositeConstruct %30 %30 %30 %30 
					                                      f32_4 %32 = OpFMul %22 %31 
					                                                    OpStore %21 %32 
					                                                    OpReturn
					                                                    OpFunctionEnd"
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
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %104 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %86 Location 86 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 Location 104 
					                                                     OpDecorate %113 RelaxedPrecision 
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
					                                             %88 = OpTypeBool 
					                                             %89 = OpTypePointer Private %88 
					                               Private bool* %90 = OpVariable Private 
					                                             %91 = OpTypePointer Uniform %6 
					                                         f32 %94 = OpConstant 3.674022E-40 
					                                             %96 = OpTypePointer Private %6 
					                                Private f32* %97 = OpVariable Private 
					                                             %98 = OpTypePointer Input %6 
					                                        f32 %102 = OpConstant 3.674022E-40 
					                              Output f32_2* %104 = OpVariable Output 
					                                            %105 = OpTypePointer Function %6 
					                                            %115 = OpTypePointer Output %6 
					                                        u32 %117 = OpConstant 0 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %106 = OpVariable Function 
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
					                                Uniform f32* %92 = OpAccessChain %20 %35 %68 
					                                         f32 %93 = OpLoad %92 
					                                        bool %95 = OpFOrdLessThan %93 %94 
					                                                     OpStore %90 %95 
					                                  Input f32* %99 = OpAccessChain %86 %68 
					                                        f32 %100 = OpLoad %99 
					                                        f32 %101 = OpFNegate %100 
					                                        f32 %103 = OpFAdd %101 %102 
					                                                     OpStore %97 %103 
					                                       bool %107 = OpLoad %90 
					                                                     OpSelectionMerge %109 None 
					                                                     OpBranchConditional %107 %108 %111 
					                                            %108 = OpLabel 
					                                        f32 %110 = OpLoad %97 
					                                                     OpStore %106 %110 
					                                                     OpBranch %109 
					                                            %111 = OpLabel 
					                                 Input f32* %112 = OpAccessChain %86 %68 
					                                        f32 %113 = OpLoad %112 
					                                                     OpStore %106 %113 
					                                                     OpBranch %109 
					                                            %109 = OpLabel 
					                                        f32 %114 = OpLoad %106 
					                                Output f32* %116 = OpAccessChain %104 %68 
					                                                     OpStore %116 %114 
					                                 Input f32* %118 = OpAccessChain %86 %117 
					                                        f32 %119 = OpLoad %118 
					                                Output f32* %120 = OpAccessChain %104 %117 
					                                                     OpStore %120 %119 
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
					; Bound: 34
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %21 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %21 Location 21 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpMemberDecorate %23 0 RelaxedPrecision 
					                                                    OpMemberDecorate %23 0 Offset 23 
					                                                    OpDecorate %23 Block 
					                                                    OpDecorate %25 DescriptorSet 25 
					                                                    OpDecorate %25 Binding 25 
					                                                    OpDecorate %30 RelaxedPrecision 
					                                                    OpDecorate %31 RelaxedPrecision 
					                                                    OpDecorate %32 RelaxedPrecision 
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
					                                            %20 = OpTypePointer Output %7 
					                              Output f32_4* %21 = OpVariable Output 
					                                            %23 = OpTypeStruct %6 
					                                            %24 = OpTypePointer Uniform %23 
					                     Uniform struct {f32;}* %25 = OpVariable Uniform 
					                                            %26 = OpTypeInt 32 1 
					                                        i32 %27 = OpConstant 0 
					                                            %28 = OpTypePointer Uniform %6 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                                      f32_4 %22 = OpLoad %9 
					                               Uniform f32* %29 = OpAccessChain %25 %27 
					                                        f32 %30 = OpLoad %29 
					                                      f32_4 %31 = OpCompositeConstruct %30 %30 %30 %30 
					                                      f32_4 %32 = OpFMul %22 %31 
					                                                    OpStore %21 %32 
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
			Blend One One, One One
			BlendOp Max, Max
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 666066
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
					  xlv_TEXCOORD0_1 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 tmpvar_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tmpvar_1 = tmpvar_2;
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
					varying highp vec2 xlv_TEXCOORD0_1;
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
					  xlv_TEXCOORD0_1 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 tmpvar_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tmpvar_1 = tmpvar_2;
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
					varying highp vec2 xlv_TEXCOORD0_1;
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
					  xlv_TEXCOORD0_1 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec4 tmpvar_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tmpvar_1 = tmpvar_2;
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
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform lowp sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					lowp vec4 u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0 = u_xlat10_0;
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
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform lowp sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					lowp vec4 u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0 = u_xlat10_0;
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
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform lowp sampler2D _MainTex;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					lowp vec4 u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0 = u_xlat10_0;
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
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %104 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %86 Location 86 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 Location 104 
					                                                     OpDecorate %113 RelaxedPrecision 
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
					                                             %88 = OpTypeBool 
					                                             %89 = OpTypePointer Private %88 
					                               Private bool* %90 = OpVariable Private 
					                                             %91 = OpTypePointer Uniform %6 
					                                         f32 %94 = OpConstant 3.674022E-40 
					                                             %96 = OpTypePointer Private %6 
					                                Private f32* %97 = OpVariable Private 
					                                             %98 = OpTypePointer Input %6 
					                                        f32 %102 = OpConstant 3.674022E-40 
					                              Output f32_2* %104 = OpVariable Output 
					                                            %105 = OpTypePointer Function %6 
					                                            %115 = OpTypePointer Output %6 
					                                        u32 %117 = OpConstant 0 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %106 = OpVariable Function 
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
					                                Uniform f32* %92 = OpAccessChain %20 %35 %68 
					                                         f32 %93 = OpLoad %92 
					                                        bool %95 = OpFOrdLessThan %93 %94 
					                                                     OpStore %90 %95 
					                                  Input f32* %99 = OpAccessChain %86 %68 
					                                        f32 %100 = OpLoad %99 
					                                        f32 %101 = OpFNegate %100 
					                                        f32 %103 = OpFAdd %101 %102 
					                                                     OpStore %97 %103 
					                                       bool %107 = OpLoad %90 
					                                                     OpSelectionMerge %109 None 
					                                                     OpBranchConditional %107 %108 %111 
					                                            %108 = OpLabel 
					                                        f32 %110 = OpLoad %97 
					                                                     OpStore %106 %110 
					                                                     OpBranch %109 
					                                            %111 = OpLabel 
					                                 Input f32* %112 = OpAccessChain %86 %68 
					                                        f32 %113 = OpLoad %112 
					                                                     OpStore %106 %113 
					                                                     OpBranch %109 
					                                            %109 = OpLabel 
					                                        f32 %114 = OpLoad %106 
					                                Output f32* %116 = OpAccessChain %104 %68 
					                                                     OpStore %116 %114 
					                                 Input f32* %118 = OpAccessChain %86 %117 
					                                        f32 %119 = OpLoad %118 
					                                Output f32* %120 = OpAccessChain %104 %117 
					                                                     OpStore %120 %119 
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
					; Bound: 24
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %21 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %21 Location 21 
					                                                    OpDecorate %22 RelaxedPrecision 
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
					                                            %20 = OpTypePointer Output %7 
					                              Output f32_4* %21 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                                      f32_4 %22 = OpLoad %9 
					                                                    OpStore %21 %22 
					                                                    OpReturn
					                                                    OpFunctionEnd"
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
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %104 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %86 Location 86 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 Location 104 
					                                                     OpDecorate %113 RelaxedPrecision 
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
					                                             %88 = OpTypeBool 
					                                             %89 = OpTypePointer Private %88 
					                               Private bool* %90 = OpVariable Private 
					                                             %91 = OpTypePointer Uniform %6 
					                                         f32 %94 = OpConstant 3.674022E-40 
					                                             %96 = OpTypePointer Private %6 
					                                Private f32* %97 = OpVariable Private 
					                                             %98 = OpTypePointer Input %6 
					                                        f32 %102 = OpConstant 3.674022E-40 
					                              Output f32_2* %104 = OpVariable Output 
					                                            %105 = OpTypePointer Function %6 
					                                            %115 = OpTypePointer Output %6 
					                                        u32 %117 = OpConstant 0 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %106 = OpVariable Function 
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
					                                Uniform f32* %92 = OpAccessChain %20 %35 %68 
					                                         f32 %93 = OpLoad %92 
					                                        bool %95 = OpFOrdLessThan %93 %94 
					                                                     OpStore %90 %95 
					                                  Input f32* %99 = OpAccessChain %86 %68 
					                                        f32 %100 = OpLoad %99 
					                                        f32 %101 = OpFNegate %100 
					                                        f32 %103 = OpFAdd %101 %102 
					                                                     OpStore %97 %103 
					                                       bool %107 = OpLoad %90 
					                                                     OpSelectionMerge %109 None 
					                                                     OpBranchConditional %107 %108 %111 
					                                            %108 = OpLabel 
					                                        f32 %110 = OpLoad %97 
					                                                     OpStore %106 %110 
					                                                     OpBranch %109 
					                                            %111 = OpLabel 
					                                 Input f32* %112 = OpAccessChain %86 %68 
					                                        f32 %113 = OpLoad %112 
					                                                     OpStore %106 %113 
					                                                     OpBranch %109 
					                                            %109 = OpLabel 
					                                        f32 %114 = OpLoad %106 
					                                Output f32* %116 = OpAccessChain %104 %68 
					                                                     OpStore %116 %114 
					                                 Input f32* %118 = OpAccessChain %86 %117 
					                                        f32 %119 = OpLoad %118 
					                                Output f32* %120 = OpAccessChain %104 %117 
					                                                     OpStore %120 %119 
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
					; Bound: 24
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %21 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %21 Location 21 
					                                                    OpDecorate %22 RelaxedPrecision 
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
					                                            %20 = OpTypePointer Output %7 
					                              Output f32_4* %21 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                                      f32_4 %22 = OpLoad %9 
					                                                    OpStore %21 %22 
					                                                    OpReturn
					                                                    OpFunctionEnd"
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
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 %104 
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
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %84 Location 84 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %86 Location 86 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 Location 104 
					                                                     OpDecorate %113 RelaxedPrecision 
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
					                                             %88 = OpTypeBool 
					                                             %89 = OpTypePointer Private %88 
					                               Private bool* %90 = OpVariable Private 
					                                             %91 = OpTypePointer Uniform %6 
					                                         f32 %94 = OpConstant 3.674022E-40 
					                                             %96 = OpTypePointer Private %6 
					                                Private f32* %97 = OpVariable Private 
					                                             %98 = OpTypePointer Input %6 
					                                        f32 %102 = OpConstant 3.674022E-40 
					                              Output f32_2* %104 = OpVariable Output 
					                                            %105 = OpTypePointer Function %6 
					                                            %115 = OpTypePointer Output %6 
					                                        u32 %117 = OpConstant 0 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %106 = OpVariable Function 
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
					                                Uniform f32* %92 = OpAccessChain %20 %35 %68 
					                                         f32 %93 = OpLoad %92 
					                                        bool %95 = OpFOrdLessThan %93 %94 
					                                                     OpStore %90 %95 
					                                  Input f32* %99 = OpAccessChain %86 %68 
					                                        f32 %100 = OpLoad %99 
					                                        f32 %101 = OpFNegate %100 
					                                        f32 %103 = OpFAdd %101 %102 
					                                                     OpStore %97 %103 
					                                       bool %107 = OpLoad %90 
					                                                     OpSelectionMerge %109 None 
					                                                     OpBranchConditional %107 %108 %111 
					                                            %108 = OpLabel 
					                                        f32 %110 = OpLoad %97 
					                                                     OpStore %106 %110 
					                                                     OpBranch %109 
					                                            %111 = OpLabel 
					                                 Input f32* %112 = OpAccessChain %86 %68 
					                                        f32 %113 = OpLoad %112 
					                                                     OpStore %106 %113 
					                                                     OpBranch %109 
					                                            %109 = OpLabel 
					                                        f32 %114 = OpLoad %106 
					                                Output f32* %116 = OpAccessChain %104 %68 
					                                                     OpStore %116 %114 
					                                 Input f32* %118 = OpAccessChain %86 %117 
					                                        f32 %119 = OpLoad %118 
					                                Output f32* %120 = OpAccessChain %104 %117 
					                                                     OpStore %120 %119 
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
					; Bound: 24
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %21 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %13 RelaxedPrecision 
					                                                    OpDecorate %13 DescriptorSet 13 
					                                                    OpDecorate %13 Binding 13 
					                                                    OpDecorate %14 RelaxedPrecision 
					                                                    OpDecorate %17 Location 17 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %21 Location 21 
					                                                    OpDecorate %22 RelaxedPrecision 
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
					                                            %20 = OpTypePointer Output %7 
					                              Output f32_4* %21 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                                      f32_4 %22 = OpLoad %9 
					                                                    OpStore %21 %22 
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