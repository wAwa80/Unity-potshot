Shader "Mobile/Particles/Additive Alpha" {
	Properties {
		_TintColor ("Tint Color", Vector) = (0.5,0.5,0.5,0.5)
		_MainTex ("Particle Texture", 2D) = "white" {}
	}
	SubShader {
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha One, SrcAlpha One
			ZClip Off
			ZWrite Off
			Cull Off
			Fog {
				Mode Off
			}
			GpuProgramID 64899
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 _MainTex_ST;
					varying lowp vec4 xlv_COLOR0;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  mediump vec4 tmpvar_2;
					  tmpvar_2 = clamp (_glesColor, 0.0, 1.0);
					  tmpvar_1 = tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  xlv_COLOR0 = tmpvar_1;
					  highp vec2 tmpvar_4;
					  tmpvar_4 = (_glesMultiTexCoord0.xy * _MainTex_ST.xy);
					  xlv_TEXCOORD0 = (tmpvar_4 + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = (tmpvar_4 + _MainTex_ST.zw);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform lowp vec4 _TintColor;
					varying lowp vec4 xlv_COLOR0;
					varying highp vec2 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 col_1;
					  col_1 = (_TintColor * xlv_COLOR0);
					  col_1 = (texture2D (_MainTex, xlv_TEXCOORD1) * col_1);
					  col_1 = (col_1 * 2.0);
					  gl_FragData[0] = col_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 _MainTex_ST;
					varying lowp vec4 xlv_COLOR0;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  mediump vec4 tmpvar_2;
					  tmpvar_2 = clamp (_glesColor, 0.0, 1.0);
					  tmpvar_1 = tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  xlv_COLOR0 = tmpvar_1;
					  highp vec2 tmpvar_4;
					  tmpvar_4 = (_glesMultiTexCoord0.xy * _MainTex_ST.xy);
					  xlv_TEXCOORD0 = (tmpvar_4 + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = (tmpvar_4 + _MainTex_ST.zw);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform lowp vec4 _TintColor;
					varying lowp vec4 xlv_COLOR0;
					varying highp vec2 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 col_1;
					  col_1 = (_TintColor * xlv_COLOR0);
					  col_1 = (texture2D (_MainTex, xlv_TEXCOORD1) * col_1);
					  col_1 = (col_1 * 2.0);
					  gl_FragData[0] = col_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 _MainTex_ST;
					varying lowp vec4 xlv_COLOR0;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  mediump vec4 tmpvar_2;
					  tmpvar_2 = clamp (_glesColor, 0.0, 1.0);
					  tmpvar_1 = tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  xlv_COLOR0 = tmpvar_1;
					  highp vec2 tmpvar_4;
					  tmpvar_4 = (_glesMultiTexCoord0.xy * _MainTex_ST.xy);
					  xlv_TEXCOORD0 = (tmpvar_4 + _MainTex_ST.zw);
					  xlv_TEXCOORD1 = (tmpvar_4 + _MainTex_ST.zw);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform lowp vec4 _TintColor;
					varying lowp vec4 xlv_COLOR0;
					varying highp vec2 xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 col_1;
					  col_1 = (_TintColor * xlv_COLOR0);
					  col_1 = (texture2D (_MainTex, xlv_TEXCOORD1) * col_1);
					  col_1 = (col_1 * 2.0);
					  gl_FragData[0] = col_1;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _MainTex_ST;
					in highp vec3 in_POSITION0;
					in mediump vec4 in_COLOR0;
					in highp vec3 in_TEXCOORD0;
					out mediump vec4 vs_COLOR0;
					out highp vec2 vs_TEXCOORD0;
					highp  vec4 phase0_Output0_1;
					out highp vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    vs_COLOR0 = in_COLOR0;
					#ifdef UNITY_ADRENO_ES3
					    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
					#else
					    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
					#endif
					    phase0_Output0_1 = in_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 _TintColor;
					uniform lowp sampler2D _MainTex;
					in mediump vec4 vs_COLOR0;
					in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat16_0 = vs_COLOR0 * _TintColor;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat16_0 * u_xlat10_1;
					    SV_Target0 = u_xlat16_0 + u_xlat16_0;
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
					uniform 	vec4 _MainTex_ST;
					in highp vec3 in_POSITION0;
					in mediump vec4 in_COLOR0;
					in highp vec3 in_TEXCOORD0;
					out mediump vec4 vs_COLOR0;
					out highp vec2 vs_TEXCOORD0;
					highp  vec4 phase0_Output0_1;
					out highp vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    vs_COLOR0 = in_COLOR0;
					#ifdef UNITY_ADRENO_ES3
					    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
					#else
					    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
					#endif
					    phase0_Output0_1 = in_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 _TintColor;
					uniform lowp sampler2D _MainTex;
					in mediump vec4 vs_COLOR0;
					in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat16_0 = vs_COLOR0 * _TintColor;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat16_0 * u_xlat10_1;
					    SV_Target0 = u_xlat16_0 + u_xlat16_0;
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
					uniform 	vec4 _MainTex_ST;
					in highp vec3 in_POSITION0;
					in mediump vec4 in_COLOR0;
					in highp vec3 in_TEXCOORD0;
					out mediump vec4 vs_COLOR0;
					out highp vec2 vs_TEXCOORD0;
					highp  vec4 phase0_Output0_1;
					out highp vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    vs_COLOR0 = in_COLOR0;
					#ifdef UNITY_ADRENO_ES3
					    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
					#else
					    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
					#endif
					    phase0_Output0_1 = in_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump vec4 _TintColor;
					uniform lowp sampler2D _MainTex;
					in mediump vec4 vs_COLOR0;
					in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					mediump vec4 u_xlat16_0;
					lowp vec4 u_xlat10_1;
					void main()
					{
					    u_xlat16_0 = vs_COLOR0 * _TintColor;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat16_0 = u_xlat16_0 * u_xlat10_1;
					    SV_Target0 = u_xlat16_0 + u_xlat16_0;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan hw_tier00 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 119
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %9 %11 %23 %45 %96 %107 %110 
					                                                     OpDecorate %9 RelaxedPrecision 
					                                                     OpDecorate %9 Location 9 
					                                                     OpDecorate %11 RelaxedPrecision 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %12 RelaxedPrecision 
					                                                     OpDecorate %13 RelaxedPrecision 
					                                                     OpDecorate %16 RelaxedPrecision 
					                                                     OpDecorate %17 RelaxedPrecision 
					                                                     OpDecorate %18 RelaxedPrecision 
					                                                     OpDecorate %23 Location 23 
					                                                     OpDecorate %28 ArrayStride 28 
					                                                     OpDecorate %29 ArrayStride 29 
					                                                     OpMemberDecorate %30 0 Offset 30 
					                                                     OpMemberDecorate %30 1 Offset 30 
					                                                     OpMemberDecorate %30 2 Offset 30 
					                                                     OpDecorate %30 Block 
					                                                     OpDecorate %32 DescriptorSet 32 
					                                                     OpDecorate %32 Binding 32 
					                                                     OpDecorate %45 Location 45 
					                                                     OpMemberDecorate %94 0 BuiltIn 94 
					                                                     OpMemberDecorate %94 1 BuiltIn 94 
					                                                     OpMemberDecorate %94 2 BuiltIn 94 
					                                                     OpDecorate %94 Block 
					                                                     OpDecorate %107 Location 107 
					                                                     OpDecorate %110 Location 110 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Output %7 
					                                Output f32_4* %9 = OpVariable Output 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                         f32 %14 = OpConstant 3.674022E-40 
					                                         f32 %15 = OpConstant 3.674022E-40 
					                                             %19 = OpTypePointer Private %7 
					                              Private f32_4* %20 = OpVariable Private 
					                                             %21 = OpTypeVector %6 3 
					                                             %22 = OpTypePointer Input %21 
					                                Input f32_3* %23 = OpVariable Input 
					                                             %26 = OpTypeInt 32 0 
					                                         u32 %27 = OpConstant 4 
					                                             %28 = OpTypeArray %7 %27 
					                                             %29 = OpTypeArray %7 %27 
					                                             %30 = OpTypeStruct %28 %29 %7 
					                                             %31 = OpTypePointer Uniform %30 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %32 = OpVariable Uniform 
					                                             %33 = OpTypeInt 32 1 
					                                         i32 %34 = OpConstant 2 
					                                             %35 = OpTypePointer Uniform %7 
					                              Private f32_4* %44 = OpVariable Private 
					                                Input f32_3* %45 = OpVariable Input 
					                                         i32 %48 = OpConstant 0 
					                                         i32 %49 = OpConstant 1 
					                                         i32 %68 = OpConstant 3 
					                              Private f32_4* %72 = OpVariable Private 
					                                         u32 %92 = OpConstant 1 
					                                             %93 = OpTypeArray %6 %92 
					                                             %94 = OpTypeStruct %7 %6 %93 
					                                             %95 = OpTypePointer Output %94 
					        Output struct {f32_4; f32; f32[1];}* %96 = OpVariable Output 
					                                            %105 = OpTypeVector %6 2 
					                                            %106 = OpTypePointer Output %105 
					                              Output f32_2* %107 = OpVariable Output 
					                              Output f32_2* %110 = OpVariable Output 
					                                            %113 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                       f32_4 %12 = OpLoad %11 
					                                                     OpStore %9 %12 
					                                       f32_4 %13 = OpLoad %9 
					                                       f32_4 %16 = OpCompositeConstruct %14 %14 %14 %14 
					                                       f32_4 %17 = OpCompositeConstruct %15 %15 %15 %15 
					                                       f32_4 %18 = OpExtInst %1 43 %13 %16 %17 
					                                                     OpStore %9 %18 
					                                       f32_3 %24 = OpLoad %23 
					                                       f32_4 %25 = OpVectorShuffle %24 %24 0 1 0 1 
					                              Uniform f32_4* %36 = OpAccessChain %32 %34 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpVectorShuffle %37 %37 0 1 0 1 
					                                       f32_4 %39 = OpFMul %25 %38 
					                              Uniform f32_4* %40 = OpAccessChain %32 %34 
					                                       f32_4 %41 = OpLoad %40 
					                                       f32_4 %42 = OpVectorShuffle %41 %41 2 3 2 3 
					                                       f32_4 %43 = OpFAdd %39 %42 
					                                                     OpStore %20 %43 
					                                       f32_3 %46 = OpLoad %45 
					                                       f32_4 %47 = OpVectorShuffle %46 %46 1 1 1 1 
					                              Uniform f32_4* %50 = OpAccessChain %32 %48 %49 
					                                       f32_4 %51 = OpLoad %50 
					                                       f32_4 %52 = OpFMul %47 %51 
					                                                     OpStore %44 %52 
					                              Uniform f32_4* %53 = OpAccessChain %32 %48 %48 
					                                       f32_4 %54 = OpLoad %53 
					                                       f32_3 %55 = OpLoad %45 
					                                       f32_4 %56 = OpVectorShuffle %55 %55 0 0 0 0 
					                                       f32_4 %57 = OpFMul %54 %56 
					                                       f32_4 %58 = OpLoad %44 
					                                       f32_4 %59 = OpFAdd %57 %58 
					                                                     OpStore %44 %59 
					                              Uniform f32_4* %60 = OpAccessChain %32 %48 %34 
					                                       f32_4 %61 = OpLoad %60 
					                                       f32_3 %62 = OpLoad %45 
					                                       f32_4 %63 = OpVectorShuffle %62 %62 2 2 2 2 
					                                       f32_4 %64 = OpFMul %61 %63 
					                                       f32_4 %65 = OpLoad %44 
					                                       f32_4 %66 = OpFAdd %64 %65 
					                                                     OpStore %44 %66 
					                                       f32_4 %67 = OpLoad %44 
					                              Uniform f32_4* %69 = OpAccessChain %32 %48 %68 
					                                       f32_4 %70 = OpLoad %69 
					                                       f32_4 %71 = OpFAdd %67 %70 
					                                                     OpStore %44 %71 
					                                       f32_4 %73 = OpLoad %44 
					                                       f32_4 %74 = OpVectorShuffle %73 %73 1 1 1 1 
					                              Uniform f32_4* %75 = OpAccessChain %32 %49 %49 
					                                       f32_4 %76 = OpLoad %75 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                                     OpStore %72 %77 
					                              Uniform f32_4* %78 = OpAccessChain %32 %49 %48 
					                                       f32_4 %79 = OpLoad %78 
					                                       f32_4 %80 = OpLoad %44 
					                                       f32_4 %81 = OpVectorShuffle %80 %80 0 0 0 0 
					                                       f32_4 %82 = OpFMul %79 %81 
					                                       f32_4 %83 = OpLoad %72 
					                                       f32_4 %84 = OpFAdd %82 %83 
					                                                     OpStore %72 %84 
					                              Uniform f32_4* %85 = OpAccessChain %32 %49 %34 
					                                       f32_4 %86 = OpLoad %85 
					                                       f32_4 %87 = OpLoad %44 
					                                       f32_4 %88 = OpVectorShuffle %87 %87 2 2 2 2 
					                                       f32_4 %89 = OpFMul %86 %88 
					                                       f32_4 %90 = OpLoad %72 
					                                       f32_4 %91 = OpFAdd %89 %90 
					                                                     OpStore %72 %91 
					                              Uniform f32_4* %97 = OpAccessChain %32 %49 %68 
					                                       f32_4 %98 = OpLoad %97 
					                                       f32_4 %99 = OpLoad %44 
					                                      f32_4 %100 = OpVectorShuffle %99 %99 3 3 3 3 
					                                      f32_4 %101 = OpFMul %98 %100 
					                                      f32_4 %102 = OpLoad %72 
					                                      f32_4 %103 = OpFAdd %101 %102 
					                              Output f32_4* %104 = OpAccessChain %96 %48 
					                                                     OpStore %104 %103 
					                                      f32_4 %108 = OpLoad %20 
					                                      f32_2 %109 = OpVectorShuffle %108 %108 0 1 
					                                                     OpStore %107 %109 
					                                      f32_4 %111 = OpLoad %20 
					                                      f32_2 %112 = OpVectorShuffle %111 %111 2 3 
					                                                     OpStore %110 %112 
					                                Output f32* %114 = OpAccessChain %96 %48 %92 
					                                        f32 %115 = OpLoad %114 
					                                        f32 %116 = OpFNegate %115 
					                                Output f32* %117 = OpAccessChain %96 %48 %92 
					                                                     OpStore %117 %116 
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
					                                                    OpEntryPoint Fragment %4 "main" %11 %30 %37 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %11 RelaxedPrecision 
					                                                    OpDecorate %11 Location 11 
					                                                    OpDecorate %12 RelaxedPrecision 
					                                                    OpMemberDecorate %13 0 RelaxedPrecision 
					                                                    OpMemberDecorate %13 0 Offset 13 
					                                                    OpDecorate %13 Block 
					                                                    OpDecorate %15 DescriptorSet 15 
					                                                    OpDecorate %15 Binding 15 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %26 DescriptorSet 26 
					                                                    OpDecorate %26 Binding 26 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %30 Location 30 
					                                                    OpDecorate %33 RelaxedPrecision 
					                                                    OpDecorate %34 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %37 Location 37 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %39 RelaxedPrecision 
					                                                    OpDecorate %40 RelaxedPrecision 
					                                             %2 = OpTypeVoid 
					                                             %3 = OpTypeFunction %2 
					                                             %6 = OpTypeFloat 32 
					                                             %7 = OpTypeVector %6 4 
					                                             %8 = OpTypePointer Private %7 
					                              Private f32_4* %9 = OpVariable Private 
					                                            %10 = OpTypePointer Input %7 
					                               Input f32_4* %11 = OpVariable Input 
					                                            %13 = OpTypeStruct %7 
					                                            %14 = OpTypePointer Uniform %13 
					                   Uniform struct {f32_4;}* %15 = OpVariable Uniform 
					                                            %16 = OpTypeInt 32 1 
					                                        i32 %17 = OpConstant 0 
					                                            %18 = OpTypePointer Uniform %7 
					                             Private f32_4* %22 = OpVariable Private 
					                                            %23 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %24 = OpTypeSampledImage %23 
					                                            %25 = OpTypePointer UniformConstant %24 
					UniformConstant read_only Texture2DSampled* %26 = OpVariable UniformConstant 
					                                            %28 = OpTypeVector %6 2 
					                                            %29 = OpTypePointer Input %28 
					                               Input f32_2* %30 = OpVariable Input 
					                                            %36 = OpTypePointer Output %7 
					                              Output f32_4* %37 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                                      f32_4 %12 = OpLoad %11 
					                             Uniform f32_4* %19 = OpAccessChain %15 %17 
					                                      f32_4 %20 = OpLoad %19 
					                                      f32_4 %21 = OpFMul %12 %20 
					                                                    OpStore %9 %21 
					                 read_only Texture2DSampled %27 = OpLoad %26 
					                                      f32_2 %31 = OpLoad %30 
					                                      f32_4 %32 = OpImageSampleImplicitLod %27 %31 
					                                                    OpStore %22 %32 
					                                      f32_4 %33 = OpLoad %9 
					                                      f32_4 %34 = OpLoad %22 
					                                      f32_4 %35 = OpFMul %33 %34 
					                                                    OpStore %9 %35 
					                                      f32_4 %38 = OpLoad %9 
					                                      f32_4 %39 = OpLoad %9 
					                                      f32_4 %40 = OpFAdd %38 %39 
					                                                    OpStore %37 %40 
					                                                    OpReturn
					                                                    OpFunctionEnd
"
				}
				SubProgram "vulkan hw_tier01 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 119
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %9 %11 %23 %45 %96 %107 %110 
					                                                     OpDecorate %9 RelaxedPrecision 
					                                                     OpDecorate %9 Location 9 
					                                                     OpDecorate %11 RelaxedPrecision 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %12 RelaxedPrecision 
					                                                     OpDecorate %13 RelaxedPrecision 
					                                                     OpDecorate %16 RelaxedPrecision 
					                                                     OpDecorate %17 RelaxedPrecision 
					                                                     OpDecorate %18 RelaxedPrecision 
					                                                     OpDecorate %23 Location 23 
					                                                     OpDecorate %28 ArrayStride 28 
					                                                     OpDecorate %29 ArrayStride 29 
					                                                     OpMemberDecorate %30 0 Offset 30 
					                                                     OpMemberDecorate %30 1 Offset 30 
					                                                     OpMemberDecorate %30 2 Offset 30 
					                                                     OpDecorate %30 Block 
					                                                     OpDecorate %32 DescriptorSet 32 
					                                                     OpDecorate %32 Binding 32 
					                                                     OpDecorate %45 Location 45 
					                                                     OpMemberDecorate %94 0 BuiltIn 94 
					                                                     OpMemberDecorate %94 1 BuiltIn 94 
					                                                     OpMemberDecorate %94 2 BuiltIn 94 
					                                                     OpDecorate %94 Block 
					                                                     OpDecorate %107 Location 107 
					                                                     OpDecorate %110 Location 110 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Output %7 
					                                Output f32_4* %9 = OpVariable Output 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                         f32 %14 = OpConstant 3.674022E-40 
					                                         f32 %15 = OpConstant 3.674022E-40 
					                                             %19 = OpTypePointer Private %7 
					                              Private f32_4* %20 = OpVariable Private 
					                                             %21 = OpTypeVector %6 3 
					                                             %22 = OpTypePointer Input %21 
					                                Input f32_3* %23 = OpVariable Input 
					                                             %26 = OpTypeInt 32 0 
					                                         u32 %27 = OpConstant 4 
					                                             %28 = OpTypeArray %7 %27 
					                                             %29 = OpTypeArray %7 %27 
					                                             %30 = OpTypeStruct %28 %29 %7 
					                                             %31 = OpTypePointer Uniform %30 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %32 = OpVariable Uniform 
					                                             %33 = OpTypeInt 32 1 
					                                         i32 %34 = OpConstant 2 
					                                             %35 = OpTypePointer Uniform %7 
					                              Private f32_4* %44 = OpVariable Private 
					                                Input f32_3* %45 = OpVariable Input 
					                                         i32 %48 = OpConstant 0 
					                                         i32 %49 = OpConstant 1 
					                                         i32 %68 = OpConstant 3 
					                              Private f32_4* %72 = OpVariable Private 
					                                         u32 %92 = OpConstant 1 
					                                             %93 = OpTypeArray %6 %92 
					                                             %94 = OpTypeStruct %7 %6 %93 
					                                             %95 = OpTypePointer Output %94 
					        Output struct {f32_4; f32; f32[1];}* %96 = OpVariable Output 
					                                            %105 = OpTypeVector %6 2 
					                                            %106 = OpTypePointer Output %105 
					                              Output f32_2* %107 = OpVariable Output 
					                              Output f32_2* %110 = OpVariable Output 
					                                            %113 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                       f32_4 %12 = OpLoad %11 
					                                                     OpStore %9 %12 
					                                       f32_4 %13 = OpLoad %9 
					                                       f32_4 %16 = OpCompositeConstruct %14 %14 %14 %14 
					                                       f32_4 %17 = OpCompositeConstruct %15 %15 %15 %15 
					                                       f32_4 %18 = OpExtInst %1 43 %13 %16 %17 
					                                                     OpStore %9 %18 
					                                       f32_3 %24 = OpLoad %23 
					                                       f32_4 %25 = OpVectorShuffle %24 %24 0 1 0 1 
					                              Uniform f32_4* %36 = OpAccessChain %32 %34 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpVectorShuffle %37 %37 0 1 0 1 
					                                       f32_4 %39 = OpFMul %25 %38 
					                              Uniform f32_4* %40 = OpAccessChain %32 %34 
					                                       f32_4 %41 = OpLoad %40 
					                                       f32_4 %42 = OpVectorShuffle %41 %41 2 3 2 3 
					                                       f32_4 %43 = OpFAdd %39 %42 
					                                                     OpStore %20 %43 
					                                       f32_3 %46 = OpLoad %45 
					                                       f32_4 %47 = OpVectorShuffle %46 %46 1 1 1 1 
					                              Uniform f32_4* %50 = OpAccessChain %32 %48 %49 
					                                       f32_4 %51 = OpLoad %50 
					                                       f32_4 %52 = OpFMul %47 %51 
					                                                     OpStore %44 %52 
					                              Uniform f32_4* %53 = OpAccessChain %32 %48 %48 
					                                       f32_4 %54 = OpLoad %53 
					                                       f32_3 %55 = OpLoad %45 
					                                       f32_4 %56 = OpVectorShuffle %55 %55 0 0 0 0 
					                                       f32_4 %57 = OpFMul %54 %56 
					                                       f32_4 %58 = OpLoad %44 
					                                       f32_4 %59 = OpFAdd %57 %58 
					                                                     OpStore %44 %59 
					                              Uniform f32_4* %60 = OpAccessChain %32 %48 %34 
					                                       f32_4 %61 = OpLoad %60 
					                                       f32_3 %62 = OpLoad %45 
					                                       f32_4 %63 = OpVectorShuffle %62 %62 2 2 2 2 
					                                       f32_4 %64 = OpFMul %61 %63 
					                                       f32_4 %65 = OpLoad %44 
					                                       f32_4 %66 = OpFAdd %64 %65 
					                                                     OpStore %44 %66 
					                                       f32_4 %67 = OpLoad %44 
					                              Uniform f32_4* %69 = OpAccessChain %32 %48 %68 
					                                       f32_4 %70 = OpLoad %69 
					                                       f32_4 %71 = OpFAdd %67 %70 
					                                                     OpStore %44 %71 
					                                       f32_4 %73 = OpLoad %44 
					                                       f32_4 %74 = OpVectorShuffle %73 %73 1 1 1 1 
					                              Uniform f32_4* %75 = OpAccessChain %32 %49 %49 
					                                       f32_4 %76 = OpLoad %75 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                                     OpStore %72 %77 
					                              Uniform f32_4* %78 = OpAccessChain %32 %49 %48 
					                                       f32_4 %79 = OpLoad %78 
					                                       f32_4 %80 = OpLoad %44 
					                                       f32_4 %81 = OpVectorShuffle %80 %80 0 0 0 0 
					                                       f32_4 %82 = OpFMul %79 %81 
					                                       f32_4 %83 = OpLoad %72 
					                                       f32_4 %84 = OpFAdd %82 %83 
					                                                     OpStore %72 %84 
					                              Uniform f32_4* %85 = OpAccessChain %32 %49 %34 
					                                       f32_4 %86 = OpLoad %85 
					                                       f32_4 %87 = OpLoad %44 
					                                       f32_4 %88 = OpVectorShuffle %87 %87 2 2 2 2 
					                                       f32_4 %89 = OpFMul %86 %88 
					                                       f32_4 %90 = OpLoad %72 
					                                       f32_4 %91 = OpFAdd %89 %90 
					                                                     OpStore %72 %91 
					                              Uniform f32_4* %97 = OpAccessChain %32 %49 %68 
					                                       f32_4 %98 = OpLoad %97 
					                                       f32_4 %99 = OpLoad %44 
					                                      f32_4 %100 = OpVectorShuffle %99 %99 3 3 3 3 
					                                      f32_4 %101 = OpFMul %98 %100 
					                                      f32_4 %102 = OpLoad %72 
					                                      f32_4 %103 = OpFAdd %101 %102 
					                              Output f32_4* %104 = OpAccessChain %96 %48 
					                                                     OpStore %104 %103 
					                                      f32_4 %108 = OpLoad %20 
					                                      f32_2 %109 = OpVectorShuffle %108 %108 0 1 
					                                                     OpStore %107 %109 
					                                      f32_4 %111 = OpLoad %20 
					                                      f32_2 %112 = OpVectorShuffle %111 %111 2 3 
					                                                     OpStore %110 %112 
					                                Output f32* %114 = OpAccessChain %96 %48 %92 
					                                        f32 %115 = OpLoad %114 
					                                        f32 %116 = OpFNegate %115 
					                                Output f32* %117 = OpAccessChain %96 %48 %92 
					                                                     OpStore %117 %116 
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
					                                                    OpEntryPoint Fragment %4 "main" %11 %30 %37 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %11 RelaxedPrecision 
					                                                    OpDecorate %11 Location 11 
					                                                    OpDecorate %12 RelaxedPrecision 
					                                                    OpMemberDecorate %13 0 RelaxedPrecision 
					                                                    OpMemberDecorate %13 0 Offset 13 
					                                                    OpDecorate %13 Block 
					                                                    OpDecorate %15 DescriptorSet 15 
					                                                    OpDecorate %15 Binding 15 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %26 DescriptorSet 26 
					                                                    OpDecorate %26 Binding 26 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %30 Location 30 
					                                                    OpDecorate %33 RelaxedPrecision 
					                                                    OpDecorate %34 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %37 Location 37 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %39 RelaxedPrecision 
					                                                    OpDecorate %40 RelaxedPrecision 
					                                             %2 = OpTypeVoid 
					                                             %3 = OpTypeFunction %2 
					                                             %6 = OpTypeFloat 32 
					                                             %7 = OpTypeVector %6 4 
					                                             %8 = OpTypePointer Private %7 
					                              Private f32_4* %9 = OpVariable Private 
					                                            %10 = OpTypePointer Input %7 
					                               Input f32_4* %11 = OpVariable Input 
					                                            %13 = OpTypeStruct %7 
					                                            %14 = OpTypePointer Uniform %13 
					                   Uniform struct {f32_4;}* %15 = OpVariable Uniform 
					                                            %16 = OpTypeInt 32 1 
					                                        i32 %17 = OpConstant 0 
					                                            %18 = OpTypePointer Uniform %7 
					                             Private f32_4* %22 = OpVariable Private 
					                                            %23 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %24 = OpTypeSampledImage %23 
					                                            %25 = OpTypePointer UniformConstant %24 
					UniformConstant read_only Texture2DSampled* %26 = OpVariable UniformConstant 
					                                            %28 = OpTypeVector %6 2 
					                                            %29 = OpTypePointer Input %28 
					                               Input f32_2* %30 = OpVariable Input 
					                                            %36 = OpTypePointer Output %7 
					                              Output f32_4* %37 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                                      f32_4 %12 = OpLoad %11 
					                             Uniform f32_4* %19 = OpAccessChain %15 %17 
					                                      f32_4 %20 = OpLoad %19 
					                                      f32_4 %21 = OpFMul %12 %20 
					                                                    OpStore %9 %21 
					                 read_only Texture2DSampled %27 = OpLoad %26 
					                                      f32_2 %31 = OpLoad %30 
					                                      f32_4 %32 = OpImageSampleImplicitLod %27 %31 
					                                                    OpStore %22 %32 
					                                      f32_4 %33 = OpLoad %9 
					                                      f32_4 %34 = OpLoad %22 
					                                      f32_4 %35 = OpFMul %33 %34 
					                                                    OpStore %9 %35 
					                                      f32_4 %38 = OpLoad %9 
					                                      f32_4 %39 = OpLoad %9 
					                                      f32_4 %40 = OpFAdd %38 %39 
					                                                    OpStore %37 %40 
					                                                    OpReturn
					                                                    OpFunctionEnd
"
				}
				SubProgram "vulkan hw_tier02 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 119
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %9 %11 %23 %45 %96 %107 %110 
					                                                     OpDecorate %9 RelaxedPrecision 
					                                                     OpDecorate %9 Location 9 
					                                                     OpDecorate %11 RelaxedPrecision 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %12 RelaxedPrecision 
					                                                     OpDecorate %13 RelaxedPrecision 
					                                                     OpDecorate %16 RelaxedPrecision 
					                                                     OpDecorate %17 RelaxedPrecision 
					                                                     OpDecorate %18 RelaxedPrecision 
					                                                     OpDecorate %23 Location 23 
					                                                     OpDecorate %28 ArrayStride 28 
					                                                     OpDecorate %29 ArrayStride 29 
					                                                     OpMemberDecorate %30 0 Offset 30 
					                                                     OpMemberDecorate %30 1 Offset 30 
					                                                     OpMemberDecorate %30 2 Offset 30 
					                                                     OpDecorate %30 Block 
					                                                     OpDecorate %32 DescriptorSet 32 
					                                                     OpDecorate %32 Binding 32 
					                                                     OpDecorate %45 Location 45 
					                                                     OpMemberDecorate %94 0 BuiltIn 94 
					                                                     OpMemberDecorate %94 1 BuiltIn 94 
					                                                     OpMemberDecorate %94 2 BuiltIn 94 
					                                                     OpDecorate %94 Block 
					                                                     OpDecorate %107 Location 107 
					                                                     OpDecorate %110 Location 110 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Output %7 
					                                Output f32_4* %9 = OpVariable Output 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                         f32 %14 = OpConstant 3.674022E-40 
					                                         f32 %15 = OpConstant 3.674022E-40 
					                                             %19 = OpTypePointer Private %7 
					                              Private f32_4* %20 = OpVariable Private 
					                                             %21 = OpTypeVector %6 3 
					                                             %22 = OpTypePointer Input %21 
					                                Input f32_3* %23 = OpVariable Input 
					                                             %26 = OpTypeInt 32 0 
					                                         u32 %27 = OpConstant 4 
					                                             %28 = OpTypeArray %7 %27 
					                                             %29 = OpTypeArray %7 %27 
					                                             %30 = OpTypeStruct %28 %29 %7 
					                                             %31 = OpTypePointer Uniform %30 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %32 = OpVariable Uniform 
					                                             %33 = OpTypeInt 32 1 
					                                         i32 %34 = OpConstant 2 
					                                             %35 = OpTypePointer Uniform %7 
					                              Private f32_4* %44 = OpVariable Private 
					                                Input f32_3* %45 = OpVariable Input 
					                                         i32 %48 = OpConstant 0 
					                                         i32 %49 = OpConstant 1 
					                                         i32 %68 = OpConstant 3 
					                              Private f32_4* %72 = OpVariable Private 
					                                         u32 %92 = OpConstant 1 
					                                             %93 = OpTypeArray %6 %92 
					                                             %94 = OpTypeStruct %7 %6 %93 
					                                             %95 = OpTypePointer Output %94 
					        Output struct {f32_4; f32; f32[1];}* %96 = OpVariable Output 
					                                            %105 = OpTypeVector %6 2 
					                                            %106 = OpTypePointer Output %105 
					                              Output f32_2* %107 = OpVariable Output 
					                              Output f32_2* %110 = OpVariable Output 
					                                            %113 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                       f32_4 %12 = OpLoad %11 
					                                                     OpStore %9 %12 
					                                       f32_4 %13 = OpLoad %9 
					                                       f32_4 %16 = OpCompositeConstruct %14 %14 %14 %14 
					                                       f32_4 %17 = OpCompositeConstruct %15 %15 %15 %15 
					                                       f32_4 %18 = OpExtInst %1 43 %13 %16 %17 
					                                                     OpStore %9 %18 
					                                       f32_3 %24 = OpLoad %23 
					                                       f32_4 %25 = OpVectorShuffle %24 %24 0 1 0 1 
					                              Uniform f32_4* %36 = OpAccessChain %32 %34 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpVectorShuffle %37 %37 0 1 0 1 
					                                       f32_4 %39 = OpFMul %25 %38 
					                              Uniform f32_4* %40 = OpAccessChain %32 %34 
					                                       f32_4 %41 = OpLoad %40 
					                                       f32_4 %42 = OpVectorShuffle %41 %41 2 3 2 3 
					                                       f32_4 %43 = OpFAdd %39 %42 
					                                                     OpStore %20 %43 
					                                       f32_3 %46 = OpLoad %45 
					                                       f32_4 %47 = OpVectorShuffle %46 %46 1 1 1 1 
					                              Uniform f32_4* %50 = OpAccessChain %32 %48 %49 
					                                       f32_4 %51 = OpLoad %50 
					                                       f32_4 %52 = OpFMul %47 %51 
					                                                     OpStore %44 %52 
					                              Uniform f32_4* %53 = OpAccessChain %32 %48 %48 
					                                       f32_4 %54 = OpLoad %53 
					                                       f32_3 %55 = OpLoad %45 
					                                       f32_4 %56 = OpVectorShuffle %55 %55 0 0 0 0 
					                                       f32_4 %57 = OpFMul %54 %56 
					                                       f32_4 %58 = OpLoad %44 
					                                       f32_4 %59 = OpFAdd %57 %58 
					                                                     OpStore %44 %59 
					                              Uniform f32_4* %60 = OpAccessChain %32 %48 %34 
					                                       f32_4 %61 = OpLoad %60 
					                                       f32_3 %62 = OpLoad %45 
					                                       f32_4 %63 = OpVectorShuffle %62 %62 2 2 2 2 
					                                       f32_4 %64 = OpFMul %61 %63 
					                                       f32_4 %65 = OpLoad %44 
					                                       f32_4 %66 = OpFAdd %64 %65 
					                                                     OpStore %44 %66 
					                                       f32_4 %67 = OpLoad %44 
					                              Uniform f32_4* %69 = OpAccessChain %32 %48 %68 
					                                       f32_4 %70 = OpLoad %69 
					                                       f32_4 %71 = OpFAdd %67 %70 
					                                                     OpStore %44 %71 
					                                       f32_4 %73 = OpLoad %44 
					                                       f32_4 %74 = OpVectorShuffle %73 %73 1 1 1 1 
					                              Uniform f32_4* %75 = OpAccessChain %32 %49 %49 
					                                       f32_4 %76 = OpLoad %75 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                                     OpStore %72 %77 
					                              Uniform f32_4* %78 = OpAccessChain %32 %49 %48 
					                                       f32_4 %79 = OpLoad %78 
					                                       f32_4 %80 = OpLoad %44 
					                                       f32_4 %81 = OpVectorShuffle %80 %80 0 0 0 0 
					                                       f32_4 %82 = OpFMul %79 %81 
					                                       f32_4 %83 = OpLoad %72 
					                                       f32_4 %84 = OpFAdd %82 %83 
					                                                     OpStore %72 %84 
					                              Uniform f32_4* %85 = OpAccessChain %32 %49 %34 
					                                       f32_4 %86 = OpLoad %85 
					                                       f32_4 %87 = OpLoad %44 
					                                       f32_4 %88 = OpVectorShuffle %87 %87 2 2 2 2 
					                                       f32_4 %89 = OpFMul %86 %88 
					                                       f32_4 %90 = OpLoad %72 
					                                       f32_4 %91 = OpFAdd %89 %90 
					                                                     OpStore %72 %91 
					                              Uniform f32_4* %97 = OpAccessChain %32 %49 %68 
					                                       f32_4 %98 = OpLoad %97 
					                                       f32_4 %99 = OpLoad %44 
					                                      f32_4 %100 = OpVectorShuffle %99 %99 3 3 3 3 
					                                      f32_4 %101 = OpFMul %98 %100 
					                                      f32_4 %102 = OpLoad %72 
					                                      f32_4 %103 = OpFAdd %101 %102 
					                              Output f32_4* %104 = OpAccessChain %96 %48 
					                                                     OpStore %104 %103 
					                                      f32_4 %108 = OpLoad %20 
					                                      f32_2 %109 = OpVectorShuffle %108 %108 0 1 
					                                                     OpStore %107 %109 
					                                      f32_4 %111 = OpLoad %20 
					                                      f32_2 %112 = OpVectorShuffle %111 %111 2 3 
					                                                     OpStore %110 %112 
					                                Output f32* %114 = OpAccessChain %96 %48 %92 
					                                        f32 %115 = OpLoad %114 
					                                        f32 %116 = OpFNegate %115 
					                                Output f32* %117 = OpAccessChain %96 %48 %92 
					                                                     OpStore %117 %116 
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
					                                                    OpEntryPoint Fragment %4 "main" %11 %30 %37 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %9 RelaxedPrecision 
					                                                    OpDecorate %11 RelaxedPrecision 
					                                                    OpDecorate %11 Location 11 
					                                                    OpDecorate %12 RelaxedPrecision 
					                                                    OpMemberDecorate %13 0 RelaxedPrecision 
					                                                    OpMemberDecorate %13 0 Offset 13 
					                                                    OpDecorate %13 Block 
					                                                    OpDecorate %15 DescriptorSet 15 
					                                                    OpDecorate %15 Binding 15 
					                                                    OpDecorate %20 RelaxedPrecision 
					                                                    OpDecorate %21 RelaxedPrecision 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %26 DescriptorSet 26 
					                                                    OpDecorate %26 Binding 26 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %30 Location 30 
					                                                    OpDecorate %33 RelaxedPrecision 
					                                                    OpDecorate %34 RelaxedPrecision 
					                                                    OpDecorate %35 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %37 Location 37 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %39 RelaxedPrecision 
					                                                    OpDecorate %40 RelaxedPrecision 
					                                             %2 = OpTypeVoid 
					                                             %3 = OpTypeFunction %2 
					                                             %6 = OpTypeFloat 32 
					                                             %7 = OpTypeVector %6 4 
					                                             %8 = OpTypePointer Private %7 
					                              Private f32_4* %9 = OpVariable Private 
					                                            %10 = OpTypePointer Input %7 
					                               Input f32_4* %11 = OpVariable Input 
					                                            %13 = OpTypeStruct %7 
					                                            %14 = OpTypePointer Uniform %13 
					                   Uniform struct {f32_4;}* %15 = OpVariable Uniform 
					                                            %16 = OpTypeInt 32 1 
					                                        i32 %17 = OpConstant 0 
					                                            %18 = OpTypePointer Uniform %7 
					                             Private f32_4* %22 = OpVariable Private 
					                                            %23 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %24 = OpTypeSampledImage %23 
					                                            %25 = OpTypePointer UniformConstant %24 
					UniformConstant read_only Texture2DSampled* %26 = OpVariable UniformConstant 
					                                            %28 = OpTypeVector %6 2 
					                                            %29 = OpTypePointer Input %28 
					                               Input f32_2* %30 = OpVariable Input 
					                                            %36 = OpTypePointer Output %7 
					                              Output f32_4* %37 = OpVariable Output 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                                      f32_4 %12 = OpLoad %11 
					                             Uniform f32_4* %19 = OpAccessChain %15 %17 
					                                      f32_4 %20 = OpLoad %19 
					                                      f32_4 %21 = OpFMul %12 %20 
					                                                    OpStore %9 %21 
					                 read_only Texture2DSampled %27 = OpLoad %26 
					                                      f32_2 %31 = OpLoad %30 
					                                      f32_4 %32 = OpImageSampleImplicitLod %27 %31 
					                                                    OpStore %22 %32 
					                                      f32_4 %33 = OpLoad %9 
					                                      f32_4 %34 = OpLoad %22 
					                                      f32_4 %35 = OpFMul %33 %34 
					                                                    OpStore %9 %35 
					                                      f32_4 %38 = OpLoad %9 
					                                      f32_4 %39 = OpLoad %9 
					                                      f32_4 %40 = OpFAdd %38 %39 
					                                                    OpStore %37 %40 
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
	SubShader {
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha One, SrcAlpha One
			ZClip Off
			ZWrite Off
			Cull Off
			Fog {
				Mode Off
			}
			GpuProgramID 77046
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 _MainTex_ST;
					varying lowp vec4 xlv_COLOR0;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  mediump vec4 tmpvar_2;
					  tmpvar_2 = clamp (_glesColor, 0.0, 1.0);
					  tmpvar_1 = tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  xlv_COLOR0 = tmpvar_1;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying lowp vec4 xlv_COLOR0;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR0);
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 _MainTex_ST;
					varying lowp vec4 xlv_COLOR0;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  mediump vec4 tmpvar_2;
					  tmpvar_2 = clamp (_glesColor, 0.0, 1.0);
					  tmpvar_1 = tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  xlv_COLOR0 = tmpvar_1;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying lowp vec4 xlv_COLOR0;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR0);
					  gl_FragData[0] = tmpvar_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 _MainTex_ST;
					varying lowp vec4 xlv_COLOR0;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  mediump vec4 tmpvar_2;
					  tmpvar_2 = clamp (_glesColor, 0.0, 1.0);
					  tmpvar_1 = tmpvar_2;
					  highp vec4 tmpvar_3;
					  tmpvar_3.w = 1.0;
					  tmpvar_3.xyz = _glesVertex.xyz;
					  xlv_COLOR0 = tmpvar_1;
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					varying lowp vec4 xlv_COLOR0;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * xlv_COLOR0);
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
					uniform 	vec4 _MainTex_ST;
					in highp vec3 in_POSITION0;
					in mediump vec4 in_COLOR0;
					in highp vec3 in_TEXCOORD0;
					out mediump vec4 vs_COLOR0;
					out highp vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    vs_COLOR0 = in_COLOR0;
					#ifdef UNITY_ADRENO_ES3
					    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
					#else
					    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
					#endif
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec4 vs_COLOR0;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					lowp vec4 u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0 = u_xlat10_0 * vs_COLOR0;
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
					uniform 	vec4 _MainTex_ST;
					in highp vec3 in_POSITION0;
					in mediump vec4 in_COLOR0;
					in highp vec3 in_TEXCOORD0;
					out mediump vec4 vs_COLOR0;
					out highp vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    vs_COLOR0 = in_COLOR0;
					#ifdef UNITY_ADRENO_ES3
					    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
					#else
					    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
					#endif
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec4 vs_COLOR0;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					lowp vec4 u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0 = u_xlat10_0 * vs_COLOR0;
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
					uniform 	vec4 _MainTex_ST;
					in highp vec3 in_POSITION0;
					in mediump vec4 in_COLOR0;
					in highp vec3 in_TEXCOORD0;
					out mediump vec4 vs_COLOR0;
					out highp vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    vs_COLOR0 = in_COLOR0;
					#ifdef UNITY_ADRENO_ES3
					    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
					#else
					    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
					#endif
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					uniform lowp sampler2D _MainTex;
					in mediump vec4 vs_COLOR0;
					in highp vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					lowp vec4 u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0 = u_xlat10_0 * vs_COLOR0;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan hw_tier00 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 113
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %9 %11 %21 %24 %47 %98 
					                                                     OpDecorate %9 RelaxedPrecision 
					                                                     OpDecorate %9 Location 9 
					                                                     OpDecorate %11 RelaxedPrecision 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %12 RelaxedPrecision 
					                                                     OpDecorate %13 RelaxedPrecision 
					                                                     OpDecorate %16 RelaxedPrecision 
					                                                     OpDecorate %17 RelaxedPrecision 
					                                                     OpDecorate %18 RelaxedPrecision 
					                                                     OpDecorate %21 Location 21 
					                                                     OpDecorate %24 Location 24 
					                                                     OpDecorate %29 ArrayStride 29 
					                                                     OpDecorate %30 ArrayStride 30 
					                                                     OpMemberDecorate %31 0 Offset 31 
					                                                     OpMemberDecorate %31 1 Offset 31 
					                                                     OpMemberDecorate %31 2 Offset 31 
					                                                     OpDecorate %31 Block 
					                                                     OpDecorate %33 DescriptorSet 33 
					                                                     OpDecorate %33 Binding 33 
					                                                     OpDecorate %47 Location 47 
					                                                     OpMemberDecorate %96 0 BuiltIn 96 
					                                                     OpMemberDecorate %96 1 BuiltIn 96 
					                                                     OpMemberDecorate %96 2 BuiltIn 96 
					                                                     OpDecorate %96 Block 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Output %7 
					                                Output f32_4* %9 = OpVariable Output 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                         f32 %14 = OpConstant 3.674022E-40 
					                                         f32 %15 = OpConstant 3.674022E-40 
					                                             %19 = OpTypeVector %6 2 
					                                             %20 = OpTypePointer Output %19 
					                               Output f32_2* %21 = OpVariable Output 
					                                             %22 = OpTypeVector %6 3 
					                                             %23 = OpTypePointer Input %22 
					                                Input f32_3* %24 = OpVariable Input 
					                                             %27 = OpTypeInt 32 0 
					                                         u32 %28 = OpConstant 4 
					                                             %29 = OpTypeArray %7 %28 
					                                             %30 = OpTypeArray %7 %28 
					                                             %31 = OpTypeStruct %29 %30 %7 
					                                             %32 = OpTypePointer Uniform %31 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %33 = OpVariable Uniform 
					                                             %34 = OpTypeInt 32 1 
					                                         i32 %35 = OpConstant 2 
					                                             %36 = OpTypePointer Uniform %7 
					                                             %45 = OpTypePointer Private %7 
					                              Private f32_4* %46 = OpVariable Private 
					                                Input f32_3* %47 = OpVariable Input 
					                                         i32 %50 = OpConstant 0 
					                                         i32 %51 = OpConstant 1 
					                                         i32 %70 = OpConstant 3 
					                              Private f32_4* %74 = OpVariable Private 
					                                         u32 %94 = OpConstant 1 
					                                             %95 = OpTypeArray %6 %94 
					                                             %96 = OpTypeStruct %7 %6 %95 
					                                             %97 = OpTypePointer Output %96 
					        Output struct {f32_4; f32; f32[1];}* %98 = OpVariable Output 
					                                            %107 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                       f32_4 %12 = OpLoad %11 
					                                                     OpStore %9 %12 
					                                       f32_4 %13 = OpLoad %9 
					                                       f32_4 %16 = OpCompositeConstruct %14 %14 %14 %14 
					                                       f32_4 %17 = OpCompositeConstruct %15 %15 %15 %15 
					                                       f32_4 %18 = OpExtInst %1 43 %13 %16 %17 
					                                                     OpStore %9 %18 
					                                       f32_3 %25 = OpLoad %24 
					                                       f32_2 %26 = OpVectorShuffle %25 %25 0 1 
					                              Uniform f32_4* %37 = OpAccessChain %33 %35 
					                                       f32_4 %38 = OpLoad %37 
					                                       f32_2 %39 = OpVectorShuffle %38 %38 0 1 
					                                       f32_2 %40 = OpFMul %26 %39 
					                              Uniform f32_4* %41 = OpAccessChain %33 %35 
					                                       f32_4 %42 = OpLoad %41 
					                                       f32_2 %43 = OpVectorShuffle %42 %42 2 3 
					                                       f32_2 %44 = OpFAdd %40 %43 
					                                                     OpStore %21 %44 
					                                       f32_3 %48 = OpLoad %47 
					                                       f32_4 %49 = OpVectorShuffle %48 %48 1 1 1 1 
					                              Uniform f32_4* %52 = OpAccessChain %33 %50 %51 
					                                       f32_4 %53 = OpLoad %52 
					                                       f32_4 %54 = OpFMul %49 %53 
					                                                     OpStore %46 %54 
					                              Uniform f32_4* %55 = OpAccessChain %33 %50 %50 
					                                       f32_4 %56 = OpLoad %55 
					                                       f32_3 %57 = OpLoad %47 
					                                       f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
					                                       f32_4 %59 = OpFMul %56 %58 
					                                       f32_4 %60 = OpLoad %46 
					                                       f32_4 %61 = OpFAdd %59 %60 
					                                                     OpStore %46 %61 
					                              Uniform f32_4* %62 = OpAccessChain %33 %50 %35 
					                                       f32_4 %63 = OpLoad %62 
					                                       f32_3 %64 = OpLoad %47 
					                                       f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
					                                       f32_4 %66 = OpFMul %63 %65 
					                                       f32_4 %67 = OpLoad %46 
					                                       f32_4 %68 = OpFAdd %66 %67 
					                                                     OpStore %46 %68 
					                                       f32_4 %69 = OpLoad %46 
					                              Uniform f32_4* %71 = OpAccessChain %33 %50 %70 
					                                       f32_4 %72 = OpLoad %71 
					                                       f32_4 %73 = OpFAdd %69 %72 
					                                                     OpStore %46 %73 
					                                       f32_4 %75 = OpLoad %46 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 1 1 1 1 
					                              Uniform f32_4* %77 = OpAccessChain %33 %51 %51 
					                                       f32_4 %78 = OpLoad %77 
					                                       f32_4 %79 = OpFMul %76 %78 
					                                                     OpStore %74 %79 
					                              Uniform f32_4* %80 = OpAccessChain %33 %51 %50 
					                                       f32_4 %81 = OpLoad %80 
					                                       f32_4 %82 = OpLoad %46 
					                                       f32_4 %83 = OpVectorShuffle %82 %82 0 0 0 0 
					                                       f32_4 %84 = OpFMul %81 %83 
					                                       f32_4 %85 = OpLoad %74 
					                                       f32_4 %86 = OpFAdd %84 %85 
					                                                     OpStore %74 %86 
					                              Uniform f32_4* %87 = OpAccessChain %33 %51 %35 
					                                       f32_4 %88 = OpLoad %87 
					                                       f32_4 %89 = OpLoad %46 
					                                       f32_4 %90 = OpVectorShuffle %89 %89 2 2 2 2 
					                                       f32_4 %91 = OpFMul %88 %90 
					                                       f32_4 %92 = OpLoad %74 
					                                       f32_4 %93 = OpFAdd %91 %92 
					                                                     OpStore %74 %93 
					                              Uniform f32_4* %99 = OpAccessChain %33 %51 %70 
					                                      f32_4 %100 = OpLoad %99 
					                                      f32_4 %101 = OpLoad %46 
					                                      f32_4 %102 = OpVectorShuffle %101 %101 3 3 3 3 
					                                      f32_4 %103 = OpFMul %100 %102 
					                                      f32_4 %104 = OpLoad %74 
					                                      f32_4 %105 = OpFAdd %103 %104 
					                              Output f32_4* %106 = OpAccessChain %98 %50 
					                                                     OpStore %106 %105 
					                                Output f32* %108 = OpAccessChain %98 %50 %94 
					                                        f32 %109 = OpLoad %108 
					                                        f32 %110 = OpFNegate %109 
					                                Output f32* %111 = OpAccessChain %98 %50 %94 
					                                                     OpStore %111 %110 
					                                                     OpReturn
					                                                     OpFunctionEnd

					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 28
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %21 %24 
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
					                                                    OpDecorate %24 RelaxedPrecision 
					                                                    OpDecorate %24 Location 24 
					                                                    OpDecorate %25 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
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
					                                            %23 = OpTypePointer Input %7 
					                               Input f32_4* %24 = OpVariable Input 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                                      f32_4 %22 = OpLoad %9 
					                                      f32_4 %25 = OpLoad %24 
					                                      f32_4 %26 = OpFMul %22 %25 
					                                                    OpStore %21 %26 
					                                                    OpReturn
					                                                    OpFunctionEnd
"
				}
				SubProgram "vulkan hw_tier01 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 113
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %9 %11 %21 %24 %47 %98 
					                                                     OpDecorate %9 RelaxedPrecision 
					                                                     OpDecorate %9 Location 9 
					                                                     OpDecorate %11 RelaxedPrecision 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %12 RelaxedPrecision 
					                                                     OpDecorate %13 RelaxedPrecision 
					                                                     OpDecorate %16 RelaxedPrecision 
					                                                     OpDecorate %17 RelaxedPrecision 
					                                                     OpDecorate %18 RelaxedPrecision 
					                                                     OpDecorate %21 Location 21 
					                                                     OpDecorate %24 Location 24 
					                                                     OpDecorate %29 ArrayStride 29 
					                                                     OpDecorate %30 ArrayStride 30 
					                                                     OpMemberDecorate %31 0 Offset 31 
					                                                     OpMemberDecorate %31 1 Offset 31 
					                                                     OpMemberDecorate %31 2 Offset 31 
					                                                     OpDecorate %31 Block 
					                                                     OpDecorate %33 DescriptorSet 33 
					                                                     OpDecorate %33 Binding 33 
					                                                     OpDecorate %47 Location 47 
					                                                     OpMemberDecorate %96 0 BuiltIn 96 
					                                                     OpMemberDecorate %96 1 BuiltIn 96 
					                                                     OpMemberDecorate %96 2 BuiltIn 96 
					                                                     OpDecorate %96 Block 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Output %7 
					                                Output f32_4* %9 = OpVariable Output 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                         f32 %14 = OpConstant 3.674022E-40 
					                                         f32 %15 = OpConstant 3.674022E-40 
					                                             %19 = OpTypeVector %6 2 
					                                             %20 = OpTypePointer Output %19 
					                               Output f32_2* %21 = OpVariable Output 
					                                             %22 = OpTypeVector %6 3 
					                                             %23 = OpTypePointer Input %22 
					                                Input f32_3* %24 = OpVariable Input 
					                                             %27 = OpTypeInt 32 0 
					                                         u32 %28 = OpConstant 4 
					                                             %29 = OpTypeArray %7 %28 
					                                             %30 = OpTypeArray %7 %28 
					                                             %31 = OpTypeStruct %29 %30 %7 
					                                             %32 = OpTypePointer Uniform %31 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %33 = OpVariable Uniform 
					                                             %34 = OpTypeInt 32 1 
					                                         i32 %35 = OpConstant 2 
					                                             %36 = OpTypePointer Uniform %7 
					                                             %45 = OpTypePointer Private %7 
					                              Private f32_4* %46 = OpVariable Private 
					                                Input f32_3* %47 = OpVariable Input 
					                                         i32 %50 = OpConstant 0 
					                                         i32 %51 = OpConstant 1 
					                                         i32 %70 = OpConstant 3 
					                              Private f32_4* %74 = OpVariable Private 
					                                         u32 %94 = OpConstant 1 
					                                             %95 = OpTypeArray %6 %94 
					                                             %96 = OpTypeStruct %7 %6 %95 
					                                             %97 = OpTypePointer Output %96 
					        Output struct {f32_4; f32; f32[1];}* %98 = OpVariable Output 
					                                            %107 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                       f32_4 %12 = OpLoad %11 
					                                                     OpStore %9 %12 
					                                       f32_4 %13 = OpLoad %9 
					                                       f32_4 %16 = OpCompositeConstruct %14 %14 %14 %14 
					                                       f32_4 %17 = OpCompositeConstruct %15 %15 %15 %15 
					                                       f32_4 %18 = OpExtInst %1 43 %13 %16 %17 
					                                                     OpStore %9 %18 
					                                       f32_3 %25 = OpLoad %24 
					                                       f32_2 %26 = OpVectorShuffle %25 %25 0 1 
					                              Uniform f32_4* %37 = OpAccessChain %33 %35 
					                                       f32_4 %38 = OpLoad %37 
					                                       f32_2 %39 = OpVectorShuffle %38 %38 0 1 
					                                       f32_2 %40 = OpFMul %26 %39 
					                              Uniform f32_4* %41 = OpAccessChain %33 %35 
					                                       f32_4 %42 = OpLoad %41 
					                                       f32_2 %43 = OpVectorShuffle %42 %42 2 3 
					                                       f32_2 %44 = OpFAdd %40 %43 
					                                                     OpStore %21 %44 
					                                       f32_3 %48 = OpLoad %47 
					                                       f32_4 %49 = OpVectorShuffle %48 %48 1 1 1 1 
					                              Uniform f32_4* %52 = OpAccessChain %33 %50 %51 
					                                       f32_4 %53 = OpLoad %52 
					                                       f32_4 %54 = OpFMul %49 %53 
					                                                     OpStore %46 %54 
					                              Uniform f32_4* %55 = OpAccessChain %33 %50 %50 
					                                       f32_4 %56 = OpLoad %55 
					                                       f32_3 %57 = OpLoad %47 
					                                       f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
					                                       f32_4 %59 = OpFMul %56 %58 
					                                       f32_4 %60 = OpLoad %46 
					                                       f32_4 %61 = OpFAdd %59 %60 
					                                                     OpStore %46 %61 
					                              Uniform f32_4* %62 = OpAccessChain %33 %50 %35 
					                                       f32_4 %63 = OpLoad %62 
					                                       f32_3 %64 = OpLoad %47 
					                                       f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
					                                       f32_4 %66 = OpFMul %63 %65 
					                                       f32_4 %67 = OpLoad %46 
					                                       f32_4 %68 = OpFAdd %66 %67 
					                                                     OpStore %46 %68 
					                                       f32_4 %69 = OpLoad %46 
					                              Uniform f32_4* %71 = OpAccessChain %33 %50 %70 
					                                       f32_4 %72 = OpLoad %71 
					                                       f32_4 %73 = OpFAdd %69 %72 
					                                                     OpStore %46 %73 
					                                       f32_4 %75 = OpLoad %46 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 1 1 1 1 
					                              Uniform f32_4* %77 = OpAccessChain %33 %51 %51 
					                                       f32_4 %78 = OpLoad %77 
					                                       f32_4 %79 = OpFMul %76 %78 
					                                                     OpStore %74 %79 
					                              Uniform f32_4* %80 = OpAccessChain %33 %51 %50 
					                                       f32_4 %81 = OpLoad %80 
					                                       f32_4 %82 = OpLoad %46 
					                                       f32_4 %83 = OpVectorShuffle %82 %82 0 0 0 0 
					                                       f32_4 %84 = OpFMul %81 %83 
					                                       f32_4 %85 = OpLoad %74 
					                                       f32_4 %86 = OpFAdd %84 %85 
					                                                     OpStore %74 %86 
					                              Uniform f32_4* %87 = OpAccessChain %33 %51 %35 
					                                       f32_4 %88 = OpLoad %87 
					                                       f32_4 %89 = OpLoad %46 
					                                       f32_4 %90 = OpVectorShuffle %89 %89 2 2 2 2 
					                                       f32_4 %91 = OpFMul %88 %90 
					                                       f32_4 %92 = OpLoad %74 
					                                       f32_4 %93 = OpFAdd %91 %92 
					                                                     OpStore %74 %93 
					                              Uniform f32_4* %99 = OpAccessChain %33 %51 %70 
					                                      f32_4 %100 = OpLoad %99 
					                                      f32_4 %101 = OpLoad %46 
					                                      f32_4 %102 = OpVectorShuffle %101 %101 3 3 3 3 
					                                      f32_4 %103 = OpFMul %100 %102 
					                                      f32_4 %104 = OpLoad %74 
					                                      f32_4 %105 = OpFAdd %103 %104 
					                              Output f32_4* %106 = OpAccessChain %98 %50 
					                                                     OpStore %106 %105 
					                                Output f32* %108 = OpAccessChain %98 %50 %94 
					                                        f32 %109 = OpLoad %108 
					                                        f32 %110 = OpFNegate %109 
					                                Output f32* %111 = OpAccessChain %98 %50 %94 
					                                                     OpStore %111 %110 
					                                                     OpReturn
					                                                     OpFunctionEnd

					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 28
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %21 %24 
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
					                                                    OpDecorate %24 RelaxedPrecision 
					                                                    OpDecorate %24 Location 24 
					                                                    OpDecorate %25 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
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
					                                            %23 = OpTypePointer Input %7 
					                               Input f32_4* %24 = OpVariable Input 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                                      f32_4 %22 = OpLoad %9 
					                                      f32_4 %25 = OpLoad %24 
					                                      f32_4 %26 = OpFMul %22 %25 
					                                                    OpStore %21 %26 
					                                                    OpReturn
					                                                    OpFunctionEnd
"
				}
				SubProgram "vulkan hw_tier02 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 113
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %9 %11 %21 %24 %47 %98 
					                                                     OpDecorate %9 RelaxedPrecision 
					                                                     OpDecorate %9 Location 9 
					                                                     OpDecorate %11 RelaxedPrecision 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %12 RelaxedPrecision 
					                                                     OpDecorate %13 RelaxedPrecision 
					                                                     OpDecorate %16 RelaxedPrecision 
					                                                     OpDecorate %17 RelaxedPrecision 
					                                                     OpDecorate %18 RelaxedPrecision 
					                                                     OpDecorate %21 Location 21 
					                                                     OpDecorate %24 Location 24 
					                                                     OpDecorate %29 ArrayStride 29 
					                                                     OpDecorate %30 ArrayStride 30 
					                                                     OpMemberDecorate %31 0 Offset 31 
					                                                     OpMemberDecorate %31 1 Offset 31 
					                                                     OpMemberDecorate %31 2 Offset 31 
					                                                     OpDecorate %31 Block 
					                                                     OpDecorate %33 DescriptorSet 33 
					                                                     OpDecorate %33 Binding 33 
					                                                     OpDecorate %47 Location 47 
					                                                     OpMemberDecorate %96 0 BuiltIn 96 
					                                                     OpMemberDecorate %96 1 BuiltIn 96 
					                                                     OpMemberDecorate %96 2 BuiltIn 96 
					                                                     OpDecorate %96 Block 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Output %7 
					                                Output f32_4* %9 = OpVariable Output 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                         f32 %14 = OpConstant 3.674022E-40 
					                                         f32 %15 = OpConstant 3.674022E-40 
					                                             %19 = OpTypeVector %6 2 
					                                             %20 = OpTypePointer Output %19 
					                               Output f32_2* %21 = OpVariable Output 
					                                             %22 = OpTypeVector %6 3 
					                                             %23 = OpTypePointer Input %22 
					                                Input f32_3* %24 = OpVariable Input 
					                                             %27 = OpTypeInt 32 0 
					                                         u32 %28 = OpConstant 4 
					                                             %29 = OpTypeArray %7 %28 
					                                             %30 = OpTypeArray %7 %28 
					                                             %31 = OpTypeStruct %29 %30 %7 
					                                             %32 = OpTypePointer Uniform %31 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %33 = OpVariable Uniform 
					                                             %34 = OpTypeInt 32 1 
					                                         i32 %35 = OpConstant 2 
					                                             %36 = OpTypePointer Uniform %7 
					                                             %45 = OpTypePointer Private %7 
					                              Private f32_4* %46 = OpVariable Private 
					                                Input f32_3* %47 = OpVariable Input 
					                                         i32 %50 = OpConstant 0 
					                                         i32 %51 = OpConstant 1 
					                                         i32 %70 = OpConstant 3 
					                              Private f32_4* %74 = OpVariable Private 
					                                         u32 %94 = OpConstant 1 
					                                             %95 = OpTypeArray %6 %94 
					                                             %96 = OpTypeStruct %7 %6 %95 
					                                             %97 = OpTypePointer Output %96 
					        Output struct {f32_4; f32; f32[1];}* %98 = OpVariable Output 
					                                            %107 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                       f32_4 %12 = OpLoad %11 
					                                                     OpStore %9 %12 
					                                       f32_4 %13 = OpLoad %9 
					                                       f32_4 %16 = OpCompositeConstruct %14 %14 %14 %14 
					                                       f32_4 %17 = OpCompositeConstruct %15 %15 %15 %15 
					                                       f32_4 %18 = OpExtInst %1 43 %13 %16 %17 
					                                                     OpStore %9 %18 
					                                       f32_3 %25 = OpLoad %24 
					                                       f32_2 %26 = OpVectorShuffle %25 %25 0 1 
					                              Uniform f32_4* %37 = OpAccessChain %33 %35 
					                                       f32_4 %38 = OpLoad %37 
					                                       f32_2 %39 = OpVectorShuffle %38 %38 0 1 
					                                       f32_2 %40 = OpFMul %26 %39 
					                              Uniform f32_4* %41 = OpAccessChain %33 %35 
					                                       f32_4 %42 = OpLoad %41 
					                                       f32_2 %43 = OpVectorShuffle %42 %42 2 3 
					                                       f32_2 %44 = OpFAdd %40 %43 
					                                                     OpStore %21 %44 
					                                       f32_3 %48 = OpLoad %47 
					                                       f32_4 %49 = OpVectorShuffle %48 %48 1 1 1 1 
					                              Uniform f32_4* %52 = OpAccessChain %33 %50 %51 
					                                       f32_4 %53 = OpLoad %52 
					                                       f32_4 %54 = OpFMul %49 %53 
					                                                     OpStore %46 %54 
					                              Uniform f32_4* %55 = OpAccessChain %33 %50 %50 
					                                       f32_4 %56 = OpLoad %55 
					                                       f32_3 %57 = OpLoad %47 
					                                       f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
					                                       f32_4 %59 = OpFMul %56 %58 
					                                       f32_4 %60 = OpLoad %46 
					                                       f32_4 %61 = OpFAdd %59 %60 
					                                                     OpStore %46 %61 
					                              Uniform f32_4* %62 = OpAccessChain %33 %50 %35 
					                                       f32_4 %63 = OpLoad %62 
					                                       f32_3 %64 = OpLoad %47 
					                                       f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
					                                       f32_4 %66 = OpFMul %63 %65 
					                                       f32_4 %67 = OpLoad %46 
					                                       f32_4 %68 = OpFAdd %66 %67 
					                                                     OpStore %46 %68 
					                                       f32_4 %69 = OpLoad %46 
					                              Uniform f32_4* %71 = OpAccessChain %33 %50 %70 
					                                       f32_4 %72 = OpLoad %71 
					                                       f32_4 %73 = OpFAdd %69 %72 
					                                                     OpStore %46 %73 
					                                       f32_4 %75 = OpLoad %46 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 1 1 1 1 
					                              Uniform f32_4* %77 = OpAccessChain %33 %51 %51 
					                                       f32_4 %78 = OpLoad %77 
					                                       f32_4 %79 = OpFMul %76 %78 
					                                                     OpStore %74 %79 
					                              Uniform f32_4* %80 = OpAccessChain %33 %51 %50 
					                                       f32_4 %81 = OpLoad %80 
					                                       f32_4 %82 = OpLoad %46 
					                                       f32_4 %83 = OpVectorShuffle %82 %82 0 0 0 0 
					                                       f32_4 %84 = OpFMul %81 %83 
					                                       f32_4 %85 = OpLoad %74 
					                                       f32_4 %86 = OpFAdd %84 %85 
					                                                     OpStore %74 %86 
					                              Uniform f32_4* %87 = OpAccessChain %33 %51 %35 
					                                       f32_4 %88 = OpLoad %87 
					                                       f32_4 %89 = OpLoad %46 
					                                       f32_4 %90 = OpVectorShuffle %89 %89 2 2 2 2 
					                                       f32_4 %91 = OpFMul %88 %90 
					                                       f32_4 %92 = OpLoad %74 
					                                       f32_4 %93 = OpFAdd %91 %92 
					                                                     OpStore %74 %93 
					                              Uniform f32_4* %99 = OpAccessChain %33 %51 %70 
					                                      f32_4 %100 = OpLoad %99 
					                                      f32_4 %101 = OpLoad %46 
					                                      f32_4 %102 = OpVectorShuffle %101 %101 3 3 3 3 
					                                      f32_4 %103 = OpFMul %100 %102 
					                                      f32_4 %104 = OpLoad %74 
					                                      f32_4 %105 = OpFAdd %103 %104 
					                              Output f32_4* %106 = OpAccessChain %98 %50 
					                                                     OpStore %106 %105 
					                                Output f32* %108 = OpAccessChain %98 %50 %94 
					                                        f32 %109 = OpLoad %108 
					                                        f32 %110 = OpFNegate %109 
					                                Output f32* %111 = OpAccessChain %98 %50 %94 
					                                                     OpStore %111 %110 
					                                                     OpReturn
					                                                     OpFunctionEnd

					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 28
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %17 %21 %24 
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
					                                                    OpDecorate %24 RelaxedPrecision 
					                                                    OpDecorate %24 Location 24 
					                                                    OpDecorate %25 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
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
					                                            %23 = OpTypePointer Input %7 
					                               Input f32_4* %24 = OpVariable Input 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                 read_only Texture2DSampled %14 = OpLoad %13 
					                                      f32_2 %18 = OpLoad %17 
					                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                                    OpStore %9 %19 
					                                      f32_4 %22 = OpLoad %9 
					                                      f32_4 %25 = OpLoad %24 
					                                      f32_4 %26 = OpFMul %22 %25 
					                                                    OpStore %21 %26 
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