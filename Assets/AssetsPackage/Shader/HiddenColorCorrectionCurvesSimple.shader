Shader "Hidden/ColorCorrectionCurvesSimple" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "" {}
		_RgbTex ("_RgbTex (RGB)", 2D) = "" {}
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 16160
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
					uniform sampler2D _RgbTex;
					uniform lowp float _Saturation;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp float lum_1;
					  lowp vec4 color_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec2 tmpvar_4;
					  tmpvar_4.y = 0.125;
					  tmpvar_4.x = tmpvar_3.x;
					  lowp vec2 tmpvar_5;
					  tmpvar_5.y = 0.375;
					  tmpvar_5.x = tmpvar_3.y;
					  lowp vec2 tmpvar_6;
					  tmpvar_6.y = 0.625;
					  tmpvar_6.x = tmpvar_3.z;
					  lowp vec4 tmpvar_7;
					  tmpvar_7.xyz = (((texture2D (_RgbTex, tmpvar_4).xyz * vec3(1.0, 0.0, 0.0)) + (texture2D (_RgbTex, tmpvar_5).xyz * vec3(0.0, 1.0, 0.0))) + (texture2D (_RgbTex, tmpvar_6).xyz * vec3(0.0, 0.0, 1.0)));
					  tmpvar_7.w = tmpvar_3.w;
					  color_2.w = tmpvar_7.w;
					  mediump vec3 rgb_8;
					  rgb_8 = tmpvar_7.xyz;
					  mediump float tmpvar_9;
					  tmpvar_9 = dot (rgb_8, vec3(0.22, 0.707, 0.071));
					  lum_1 = tmpvar_9;
					  color_2.xyz = mix (vec3(lum_1), tmpvar_7.xyz, vec3(_Saturation));
					  gl_FragData[0] = color_2;
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
					uniform sampler2D _RgbTex;
					uniform lowp float _Saturation;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp float lum_1;
					  lowp vec4 color_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec2 tmpvar_4;
					  tmpvar_4.y = 0.125;
					  tmpvar_4.x = tmpvar_3.x;
					  lowp vec2 tmpvar_5;
					  tmpvar_5.y = 0.375;
					  tmpvar_5.x = tmpvar_3.y;
					  lowp vec2 tmpvar_6;
					  tmpvar_6.y = 0.625;
					  tmpvar_6.x = tmpvar_3.z;
					  lowp vec4 tmpvar_7;
					  tmpvar_7.xyz = (((texture2D (_RgbTex, tmpvar_4).xyz * vec3(1.0, 0.0, 0.0)) + (texture2D (_RgbTex, tmpvar_5).xyz * vec3(0.0, 1.0, 0.0))) + (texture2D (_RgbTex, tmpvar_6).xyz * vec3(0.0, 0.0, 1.0)));
					  tmpvar_7.w = tmpvar_3.w;
					  color_2.w = tmpvar_7.w;
					  mediump vec3 rgb_8;
					  rgb_8 = tmpvar_7.xyz;
					  mediump float tmpvar_9;
					  tmpvar_9 = dot (rgb_8, vec3(0.22, 0.707, 0.071));
					  lum_1 = tmpvar_9;
					  color_2.xyz = mix (vec3(lum_1), tmpvar_7.xyz, vec3(_Saturation));
					  gl_FragData[0] = color_2;
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
					uniform sampler2D _RgbTex;
					uniform lowp float _Saturation;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp float lum_1;
					  lowp vec4 color_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  lowp vec2 tmpvar_4;
					  tmpvar_4.y = 0.125;
					  tmpvar_4.x = tmpvar_3.x;
					  lowp vec2 tmpvar_5;
					  tmpvar_5.y = 0.375;
					  tmpvar_5.x = tmpvar_3.y;
					  lowp vec2 tmpvar_6;
					  tmpvar_6.y = 0.625;
					  tmpvar_6.x = tmpvar_3.z;
					  lowp vec4 tmpvar_7;
					  tmpvar_7.xyz = (((texture2D (_RgbTex, tmpvar_4).xyz * vec3(1.0, 0.0, 0.0)) + (texture2D (_RgbTex, tmpvar_5).xyz * vec3(0.0, 1.0, 0.0))) + (texture2D (_RgbTex, tmpvar_6).xyz * vec3(0.0, 0.0, 1.0)));
					  tmpvar_7.w = tmpvar_3.w;
					  color_2.w = tmpvar_7.w;
					  mediump vec3 rgb_8;
					  rgb_8 = tmpvar_7.xyz;
					  mediump float tmpvar_9;
					  tmpvar_9 = dot (rgb_8, vec3(0.22, 0.707, 0.071));
					  lum_1 = tmpvar_9;
					  color_2.xyz = mix (vec3(lum_1), tmpvar_7.xyz, vec3(_Saturation));
					  gl_FragData[0] = color_2;
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump float _Saturation;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _RgbTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					lowp vec3 u_xlat10_2;
					mediump vec3 u_xlat16_3;
					mediump float u_xlat16_15;
					void main()
					{
					    u_xlat0.y = float(0.125);
					    u_xlat0.w = float(0.375);
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy).zxyw;
					    u_xlat0.xz = u_xlat1.yz;
					    u_xlat10_2.xyz = texture(_RgbTex, u_xlat0.zw).xyz;
					    u_xlat10_0.xyz = texture(_RgbTex, u_xlat0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(0.0, 1.0, 0.0);
					    u_xlat16_3.xyz = u_xlat10_0.xyz * vec3(1.0, 0.0, 0.0) + u_xlat16_2.xyz;
					    SV_Target0.w = u_xlat1.w;
					    u_xlat1.y = 0.625;
					    u_xlat10_0.xyz = texture(_RgbTex, u_xlat1.xy).xyz;
					    u_xlat16_3.xyz = u_xlat10_0.xyz * vec3(0.0, 0.0, 1.0) + u_xlat16_3.xyz;
					    u_xlat16_15 = dot(u_xlat16_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_3.xyz = (-vec3(u_xlat16_15)) + u_xlat16_3.xyz;
					    SV_Target0.xyz = vec3(_Saturation) * u_xlat16_3.xyz + vec3(u_xlat16_15);
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump float _Saturation;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _RgbTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					lowp vec3 u_xlat10_2;
					mediump vec3 u_xlat16_3;
					mediump float u_xlat16_15;
					void main()
					{
					    u_xlat0.y = float(0.125);
					    u_xlat0.w = float(0.375);
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy).zxyw;
					    u_xlat0.xz = u_xlat1.yz;
					    u_xlat10_2.xyz = texture(_RgbTex, u_xlat0.zw).xyz;
					    u_xlat10_0.xyz = texture(_RgbTex, u_xlat0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(0.0, 1.0, 0.0);
					    u_xlat16_3.xyz = u_xlat10_0.xyz * vec3(1.0, 0.0, 0.0) + u_xlat16_2.xyz;
					    SV_Target0.w = u_xlat1.w;
					    u_xlat1.y = 0.625;
					    u_xlat10_0.xyz = texture(_RgbTex, u_xlat1.xy).xyz;
					    u_xlat16_3.xyz = u_xlat10_0.xyz * vec3(0.0, 0.0, 1.0) + u_xlat16_3.xyz;
					    u_xlat16_15 = dot(u_xlat16_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_3.xyz = (-vec3(u_xlat16_15)) + u_xlat16_3.xyz;
					    SV_Target0.xyz = vec3(_Saturation) * u_xlat16_3.xyz + vec3(u_xlat16_15);
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	mediump float _Saturation;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _RgbTex;
					in mediump vec2 vs_TEXCOORD0;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec4 u_xlat1;
					mediump vec3 u_xlat16_2;
					lowp vec3 u_xlat10_2;
					mediump vec3 u_xlat16_3;
					mediump float u_xlat16_15;
					void main()
					{
					    u_xlat0.y = float(0.125);
					    u_xlat0.w = float(0.375);
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy).zxyw;
					    u_xlat0.xz = u_xlat1.yz;
					    u_xlat10_2.xyz = texture(_RgbTex, u_xlat0.zw).xyz;
					    u_xlat10_0.xyz = texture(_RgbTex, u_xlat0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(0.0, 1.0, 0.0);
					    u_xlat16_3.xyz = u_xlat10_0.xyz * vec3(1.0, 0.0, 0.0) + u_xlat16_2.xyz;
					    SV_Target0.w = u_xlat1.w;
					    u_xlat1.y = 0.625;
					    u_xlat10_0.xyz = texture(_RgbTex, u_xlat1.xy).xyz;
					    u_xlat16_3.xyz = u_xlat10_0.xyz * vec3(0.0, 0.0, 1.0) + u_xlat16_3.xyz;
					    u_xlat16_15 = dot(u_xlat16_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_3.xyz = (-vec3(u_xlat16_15)) + u_xlat16_3.xyz;
					    SV_Target0.xyz = vec3(_Saturation) * u_xlat16_3.xyz + vec3(u_xlat16_15);
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
					                                              OpDecorate %84 RelaxedPrecision 
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
					; Bound: 108
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %26 %62 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %22 DescriptorSet 22 
					                                                    OpDecorate %22 Binding 22 
					                                                    OpDecorate %23 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %26 Location 26 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %37 DescriptorSet 37 
					                                                    OpDecorate %37 Binding 37 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %42 RelaxedPrecision 
					                                                    OpDecorate %43 RelaxedPrecision 
					                                                    OpDecorate %44 RelaxedPrecision 
					                                                    OpDecorate %48 RelaxedPrecision 
					                                                    OpDecorate %49 RelaxedPrecision 
					                                                    OpDecorate %50 RelaxedPrecision 
					                                                    OpDecorate %54 RelaxedPrecision 
					                                                    OpDecorate %55 RelaxedPrecision 
					                                                    OpDecorate %56 RelaxedPrecision 
					                                                    OpDecorate %58 RelaxedPrecision 
					                                                    OpDecorate %59 RelaxedPrecision 
					                                                    OpDecorate %60 RelaxedPrecision 
					                                                    OpDecorate %62 RelaxedPrecision 
					                                                    OpDecorate %62 Location 62 
					                                                    OpDecorate %69 RelaxedPrecision 
					                                                    OpDecorate %73 RelaxedPrecision 
					                                                    OpDecorate %74 RelaxedPrecision 
					                                                    OpDecorate %76 RelaxedPrecision 
					                                                    OpDecorate %77 RelaxedPrecision 
					                                                    OpDecorate %78 RelaxedPrecision 
					                                                    OpDecorate %79 RelaxedPrecision 
					                                                    OpDecorate %80 RelaxedPrecision 
					                                                    OpDecorate %85 RelaxedPrecision 
					                                                    OpDecorate %86 RelaxedPrecision 
					                                                    OpDecorate %87 RelaxedPrecision 
					                                                    OpDecorate %88 RelaxedPrecision 
					                                                    OpDecorate %89 RelaxedPrecision 
					                                                    OpDecorate %90 RelaxedPrecision 
					                                                    OpMemberDecorate %91 0 RelaxedPrecision 
					                                                    OpMemberDecorate %91 0 Offset 91 
					                                                    OpDecorate %91 Block 
					                                                    OpDecorate %93 DescriptorSet 93 
					                                                    OpDecorate %93 Binding 93 
					                                                    OpDecorate %98 RelaxedPrecision 
					                                                    OpDecorate %99 RelaxedPrecision 
					                                                    OpDecorate %100 RelaxedPrecision 
					                                                    OpDecorate %101 RelaxedPrecision 
					                                                    OpDecorate %102 RelaxedPrecision 
					                                                    OpDecorate %103 RelaxedPrecision 
					                                                    OpDecorate %104 RelaxedPrecision 
					                                             %2 = OpTypeVoid 
					                                             %3 = OpTypeFunction %2 
					                                             %6 = OpTypeFloat 32 
					                                             %7 = OpTypeVector %6 4 
					                                             %8 = OpTypePointer Private %7 
					                              Private f32_4* %9 = OpVariable Private 
					                                        f32 %10 = OpConstant 3.674022E-40 
					                                            %11 = OpTypeInt 32 0 
					                                        u32 %12 = OpConstant 1 
					                                            %13 = OpTypePointer Private %6 
					                                        f32 %15 = OpConstant 3.674022E-40 
					                                        u32 %16 = OpConstant 3 
					                             Private f32_4* %18 = OpVariable Private 
					                                            %19 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %20 = OpTypeSampledImage %19 
					                                            %21 = OpTypePointer UniformConstant %20 
					UniformConstant read_only Texture2DSampled* %22 = OpVariable UniformConstant 
					                                            %24 = OpTypeVector %6 2 
					                                            %25 = OpTypePointer Input %24 
					                               Input f32_2* %26 = OpVariable Input 
					                                            %34 = OpTypeVector %6 3 
					                                            %35 = OpTypePointer Private %34 
					                             Private f32_3* %36 = OpVariable Private 
					UniformConstant read_only Texture2DSampled* %37 = OpVariable UniformConstant 
					                             Private f32_3* %43 = OpVariable Private 
					                             Private f32_3* %49 = OpVariable Private 
					                                        f32 %51 = OpConstant 3.674022E-40 
					                                        f32 %52 = OpConstant 3.674022E-40 
					                                      f32_3 %53 = OpConstantComposite %51 %52 %51 
					                             Private f32_3* %55 = OpVariable Private 
					                                      f32_3 %57 = OpConstantComposite %52 %51 %51 
					                                            %61 = OpTypePointer Output %7 
					                              Output f32_4* %62 = OpVariable Output 
					                                            %65 = OpTypePointer Output %6 
					                                        f32 %67 = OpConstant 3.674022E-40 
					                                      f32_3 %75 = OpConstantComposite %51 %51 %52 
					                               Private f32* %79 = OpVariable Private 
					                                        f32 %81 = OpConstant 3.674022E-40 
					                                        f32 %82 = OpConstant 3.674022E-40 
					                                        f32 %83 = OpConstant 3.674022E-40 
					                                      f32_3 %84 = OpConstantComposite %81 %82 %83 
					                                            %91 = OpTypeStruct %6 
					                                            %92 = OpTypePointer Uniform %91 
					                     Uniform struct {f32;}* %93 = OpVariable Uniform 
					                                            %94 = OpTypeInt 32 1 
					                                        i32 %95 = OpConstant 0 
					                                            %96 = OpTypePointer Uniform %6 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                               Private f32* %14 = OpAccessChain %9 %12 
					                                                    OpStore %14 %10 
					                               Private f32* %17 = OpAccessChain %9 %16 
					                                                    OpStore %17 %15 
					                 read_only Texture2DSampled %23 = OpLoad %22 
					                                      f32_2 %27 = OpLoad %26 
					                                      f32_4 %28 = OpImageSampleImplicitLod %23 %27 
					                                      f32_4 %29 = OpVectorShuffle %28 %28 2 0 1 3 
					                                                    OpStore %18 %29 
					                                      f32_4 %30 = OpLoad %18 
					                                      f32_2 %31 = OpVectorShuffle %30 %30 1 2 
					                                      f32_4 %32 = OpLoad %9 
					                                      f32_4 %33 = OpVectorShuffle %32 %31 4 1 5 3 
					                                                    OpStore %9 %33 
					                 read_only Texture2DSampled %38 = OpLoad %37 
					                                      f32_4 %39 = OpLoad %9 
					                                      f32_2 %40 = OpVectorShuffle %39 %39 2 3 
					                                      f32_4 %41 = OpImageSampleImplicitLod %38 %40 
					                                      f32_3 %42 = OpVectorShuffle %41 %41 0 1 2 
					                                                    OpStore %36 %42 
					                 read_only Texture2DSampled %44 = OpLoad %37 
					                                      f32_4 %45 = OpLoad %9 
					                                      f32_2 %46 = OpVectorShuffle %45 %45 0 1 
					                                      f32_4 %47 = OpImageSampleImplicitLod %44 %46 
					                                      f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
					                                                    OpStore %43 %48 
					                                      f32_3 %50 = OpLoad %36 
					                                      f32_3 %54 = OpFMul %50 %53 
					                                                    OpStore %49 %54 
					                                      f32_3 %56 = OpLoad %43 
					                                      f32_3 %58 = OpFMul %56 %57 
					                                      f32_3 %59 = OpLoad %49 
					                                      f32_3 %60 = OpFAdd %58 %59 
					                                                    OpStore %55 %60 
					                               Private f32* %63 = OpAccessChain %18 %16 
					                                        f32 %64 = OpLoad %63 
					                                Output f32* %66 = OpAccessChain %62 %16 
					                                                    OpStore %66 %64 
					                               Private f32* %68 = OpAccessChain %18 %12 
					                                                    OpStore %68 %67 
					                 read_only Texture2DSampled %69 = OpLoad %37 
					                                      f32_4 %70 = OpLoad %18 
					                                      f32_2 %71 = OpVectorShuffle %70 %70 0 1 
					                                      f32_4 %72 = OpImageSampleImplicitLod %69 %71 
					                                      f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
					                                                    OpStore %43 %73 
					                                      f32_3 %74 = OpLoad %43 
					                                      f32_3 %76 = OpFMul %74 %75 
					                                      f32_3 %77 = OpLoad %55 
					                                      f32_3 %78 = OpFAdd %76 %77 
					                                                    OpStore %55 %78 
					                                      f32_3 %80 = OpLoad %55 
					                                        f32 %85 = OpDot %80 %84 
					                                                    OpStore %79 %85 
					                                        f32 %86 = OpLoad %79 
					                                      f32_3 %87 = OpCompositeConstruct %86 %86 %86 
					                                      f32_3 %88 = OpFNegate %87 
					                                      f32_3 %89 = OpLoad %55 
					                                      f32_3 %90 = OpFAdd %88 %89 
					                                                    OpStore %55 %90 
					                               Uniform f32* %97 = OpAccessChain %93 %95 
					                                        f32 %98 = OpLoad %97 
					                                      f32_3 %99 = OpCompositeConstruct %98 %98 %98 
					                                     f32_3 %100 = OpLoad %55 
					                                     f32_3 %101 = OpFMul %99 %100 
					                                       f32 %102 = OpLoad %79 
					                                     f32_3 %103 = OpCompositeConstruct %102 %102 %102 
					                                     f32_3 %104 = OpFAdd %101 %103 
					                                     f32_4 %105 = OpLoad %62 
					                                     f32_4 %106 = OpVectorShuffle %105 %104 4 5 6 3 
					                                                    OpStore %62 %106 
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
					                                              OpDecorate %84 RelaxedPrecision 
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
					; Bound: 108
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %26 %62 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %22 DescriptorSet 22 
					                                                    OpDecorate %22 Binding 22 
					                                                    OpDecorate %23 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %26 Location 26 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %37 DescriptorSet 37 
					                                                    OpDecorate %37 Binding 37 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %42 RelaxedPrecision 
					                                                    OpDecorate %43 RelaxedPrecision 
					                                                    OpDecorate %44 RelaxedPrecision 
					                                                    OpDecorate %48 RelaxedPrecision 
					                                                    OpDecorate %49 RelaxedPrecision 
					                                                    OpDecorate %50 RelaxedPrecision 
					                                                    OpDecorate %54 RelaxedPrecision 
					                                                    OpDecorate %55 RelaxedPrecision 
					                                                    OpDecorate %56 RelaxedPrecision 
					                                                    OpDecorate %58 RelaxedPrecision 
					                                                    OpDecorate %59 RelaxedPrecision 
					                                                    OpDecorate %60 RelaxedPrecision 
					                                                    OpDecorate %62 RelaxedPrecision 
					                                                    OpDecorate %62 Location 62 
					                                                    OpDecorate %69 RelaxedPrecision 
					                                                    OpDecorate %73 RelaxedPrecision 
					                                                    OpDecorate %74 RelaxedPrecision 
					                                                    OpDecorate %76 RelaxedPrecision 
					                                                    OpDecorate %77 RelaxedPrecision 
					                                                    OpDecorate %78 RelaxedPrecision 
					                                                    OpDecorate %79 RelaxedPrecision 
					                                                    OpDecorate %80 RelaxedPrecision 
					                                                    OpDecorate %85 RelaxedPrecision 
					                                                    OpDecorate %86 RelaxedPrecision 
					                                                    OpDecorate %87 RelaxedPrecision 
					                                                    OpDecorate %88 RelaxedPrecision 
					                                                    OpDecorate %89 RelaxedPrecision 
					                                                    OpDecorate %90 RelaxedPrecision 
					                                                    OpMemberDecorate %91 0 RelaxedPrecision 
					                                                    OpMemberDecorate %91 0 Offset 91 
					                                                    OpDecorate %91 Block 
					                                                    OpDecorate %93 DescriptorSet 93 
					                                                    OpDecorate %93 Binding 93 
					                                                    OpDecorate %98 RelaxedPrecision 
					                                                    OpDecorate %99 RelaxedPrecision 
					                                                    OpDecorate %100 RelaxedPrecision 
					                                                    OpDecorate %101 RelaxedPrecision 
					                                                    OpDecorate %102 RelaxedPrecision 
					                                                    OpDecorate %103 RelaxedPrecision 
					                                                    OpDecorate %104 RelaxedPrecision 
					                                             %2 = OpTypeVoid 
					                                             %3 = OpTypeFunction %2 
					                                             %6 = OpTypeFloat 32 
					                                             %7 = OpTypeVector %6 4 
					                                             %8 = OpTypePointer Private %7 
					                              Private f32_4* %9 = OpVariable Private 
					                                        f32 %10 = OpConstant 3.674022E-40 
					                                            %11 = OpTypeInt 32 0 
					                                        u32 %12 = OpConstant 1 
					                                            %13 = OpTypePointer Private %6 
					                                        f32 %15 = OpConstant 3.674022E-40 
					                                        u32 %16 = OpConstant 3 
					                             Private f32_4* %18 = OpVariable Private 
					                                            %19 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %20 = OpTypeSampledImage %19 
					                                            %21 = OpTypePointer UniformConstant %20 
					UniformConstant read_only Texture2DSampled* %22 = OpVariable UniformConstant 
					                                            %24 = OpTypeVector %6 2 
					                                            %25 = OpTypePointer Input %24 
					                               Input f32_2* %26 = OpVariable Input 
					                                            %34 = OpTypeVector %6 3 
					                                            %35 = OpTypePointer Private %34 
					                             Private f32_3* %36 = OpVariable Private 
					UniformConstant read_only Texture2DSampled* %37 = OpVariable UniformConstant 
					                             Private f32_3* %43 = OpVariable Private 
					                             Private f32_3* %49 = OpVariable Private 
					                                        f32 %51 = OpConstant 3.674022E-40 
					                                        f32 %52 = OpConstant 3.674022E-40 
					                                      f32_3 %53 = OpConstantComposite %51 %52 %51 
					                             Private f32_3* %55 = OpVariable Private 
					                                      f32_3 %57 = OpConstantComposite %52 %51 %51 
					                                            %61 = OpTypePointer Output %7 
					                              Output f32_4* %62 = OpVariable Output 
					                                            %65 = OpTypePointer Output %6 
					                                        f32 %67 = OpConstant 3.674022E-40 
					                                      f32_3 %75 = OpConstantComposite %51 %51 %52 
					                               Private f32* %79 = OpVariable Private 
					                                        f32 %81 = OpConstant 3.674022E-40 
					                                        f32 %82 = OpConstant 3.674022E-40 
					                                        f32 %83 = OpConstant 3.674022E-40 
					                                      f32_3 %84 = OpConstantComposite %81 %82 %83 
					                                            %91 = OpTypeStruct %6 
					                                            %92 = OpTypePointer Uniform %91 
					                     Uniform struct {f32;}* %93 = OpVariable Uniform 
					                                            %94 = OpTypeInt 32 1 
					                                        i32 %95 = OpConstant 0 
					                                            %96 = OpTypePointer Uniform %6 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                               Private f32* %14 = OpAccessChain %9 %12 
					                                                    OpStore %14 %10 
					                               Private f32* %17 = OpAccessChain %9 %16 
					                                                    OpStore %17 %15 
					                 read_only Texture2DSampled %23 = OpLoad %22 
					                                      f32_2 %27 = OpLoad %26 
					                                      f32_4 %28 = OpImageSampleImplicitLod %23 %27 
					                                      f32_4 %29 = OpVectorShuffle %28 %28 2 0 1 3 
					                                                    OpStore %18 %29 
					                                      f32_4 %30 = OpLoad %18 
					                                      f32_2 %31 = OpVectorShuffle %30 %30 1 2 
					                                      f32_4 %32 = OpLoad %9 
					                                      f32_4 %33 = OpVectorShuffle %32 %31 4 1 5 3 
					                                                    OpStore %9 %33 
					                 read_only Texture2DSampled %38 = OpLoad %37 
					                                      f32_4 %39 = OpLoad %9 
					                                      f32_2 %40 = OpVectorShuffle %39 %39 2 3 
					                                      f32_4 %41 = OpImageSampleImplicitLod %38 %40 
					                                      f32_3 %42 = OpVectorShuffle %41 %41 0 1 2 
					                                                    OpStore %36 %42 
					                 read_only Texture2DSampled %44 = OpLoad %37 
					                                      f32_4 %45 = OpLoad %9 
					                                      f32_2 %46 = OpVectorShuffle %45 %45 0 1 
					                                      f32_4 %47 = OpImageSampleImplicitLod %44 %46 
					                                      f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
					                                                    OpStore %43 %48 
					                                      f32_3 %50 = OpLoad %36 
					                                      f32_3 %54 = OpFMul %50 %53 
					                                                    OpStore %49 %54 
					                                      f32_3 %56 = OpLoad %43 
					                                      f32_3 %58 = OpFMul %56 %57 
					                                      f32_3 %59 = OpLoad %49 
					                                      f32_3 %60 = OpFAdd %58 %59 
					                                                    OpStore %55 %60 
					                               Private f32* %63 = OpAccessChain %18 %16 
					                                        f32 %64 = OpLoad %63 
					                                Output f32* %66 = OpAccessChain %62 %16 
					                                                    OpStore %66 %64 
					                               Private f32* %68 = OpAccessChain %18 %12 
					                                                    OpStore %68 %67 
					                 read_only Texture2DSampled %69 = OpLoad %37 
					                                      f32_4 %70 = OpLoad %18 
					                                      f32_2 %71 = OpVectorShuffle %70 %70 0 1 
					                                      f32_4 %72 = OpImageSampleImplicitLod %69 %71 
					                                      f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
					                                                    OpStore %43 %73 
					                                      f32_3 %74 = OpLoad %43 
					                                      f32_3 %76 = OpFMul %74 %75 
					                                      f32_3 %77 = OpLoad %55 
					                                      f32_3 %78 = OpFAdd %76 %77 
					                                                    OpStore %55 %78 
					                                      f32_3 %80 = OpLoad %55 
					                                        f32 %85 = OpDot %80 %84 
					                                                    OpStore %79 %85 
					                                        f32 %86 = OpLoad %79 
					                                      f32_3 %87 = OpCompositeConstruct %86 %86 %86 
					                                      f32_3 %88 = OpFNegate %87 
					                                      f32_3 %89 = OpLoad %55 
					                                      f32_3 %90 = OpFAdd %88 %89 
					                                                    OpStore %55 %90 
					                               Uniform f32* %97 = OpAccessChain %93 %95 
					                                        f32 %98 = OpLoad %97 
					                                      f32_3 %99 = OpCompositeConstruct %98 %98 %98 
					                                     f32_3 %100 = OpLoad %55 
					                                     f32_3 %101 = OpFMul %99 %100 
					                                       f32 %102 = OpLoad %79 
					                                     f32_3 %103 = OpCompositeConstruct %102 %102 %102 
					                                     f32_3 %104 = OpFAdd %101 %103 
					                                     f32_4 %105 = OpLoad %62 
					                                     f32_4 %106 = OpVectorShuffle %105 %104 4 5 6 3 
					                                                    OpStore %62 %106 
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
					                                              OpDecorate %84 RelaxedPrecision 
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
					; Bound: 108
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %26 %62 
					                                                    OpExecutionMode %4 OriginUpperLeft 
					                                                    OpDecorate %22 RelaxedPrecision 
					                                                    OpDecorate %22 DescriptorSet 22 
					                                                    OpDecorate %22 Binding 22 
					                                                    OpDecorate %23 RelaxedPrecision 
					                                                    OpDecorate %26 RelaxedPrecision 
					                                                    OpDecorate %26 Location 26 
					                                                    OpDecorate %27 RelaxedPrecision 
					                                                    OpDecorate %29 RelaxedPrecision 
					                                                    OpDecorate %36 RelaxedPrecision 
					                                                    OpDecorate %37 RelaxedPrecision 
					                                                    OpDecorate %37 DescriptorSet 37 
					                                                    OpDecorate %37 Binding 37 
					                                                    OpDecorate %38 RelaxedPrecision 
					                                                    OpDecorate %42 RelaxedPrecision 
					                                                    OpDecorate %43 RelaxedPrecision 
					                                                    OpDecorate %44 RelaxedPrecision 
					                                                    OpDecorate %48 RelaxedPrecision 
					                                                    OpDecorate %49 RelaxedPrecision 
					                                                    OpDecorate %50 RelaxedPrecision 
					                                                    OpDecorate %54 RelaxedPrecision 
					                                                    OpDecorate %55 RelaxedPrecision 
					                                                    OpDecorate %56 RelaxedPrecision 
					                                                    OpDecorate %58 RelaxedPrecision 
					                                                    OpDecorate %59 RelaxedPrecision 
					                                                    OpDecorate %60 RelaxedPrecision 
					                                                    OpDecorate %62 RelaxedPrecision 
					                                                    OpDecorate %62 Location 62 
					                                                    OpDecorate %69 RelaxedPrecision 
					                                                    OpDecorate %73 RelaxedPrecision 
					                                                    OpDecorate %74 RelaxedPrecision 
					                                                    OpDecorate %76 RelaxedPrecision 
					                                                    OpDecorate %77 RelaxedPrecision 
					                                                    OpDecorate %78 RelaxedPrecision 
					                                                    OpDecorate %79 RelaxedPrecision 
					                                                    OpDecorate %80 RelaxedPrecision 
					                                                    OpDecorate %85 RelaxedPrecision 
					                                                    OpDecorate %86 RelaxedPrecision 
					                                                    OpDecorate %87 RelaxedPrecision 
					                                                    OpDecorate %88 RelaxedPrecision 
					                                                    OpDecorate %89 RelaxedPrecision 
					                                                    OpDecorate %90 RelaxedPrecision 
					                                                    OpMemberDecorate %91 0 RelaxedPrecision 
					                                                    OpMemberDecorate %91 0 Offset 91 
					                                                    OpDecorate %91 Block 
					                                                    OpDecorate %93 DescriptorSet 93 
					                                                    OpDecorate %93 Binding 93 
					                                                    OpDecorate %98 RelaxedPrecision 
					                                                    OpDecorate %99 RelaxedPrecision 
					                                                    OpDecorate %100 RelaxedPrecision 
					                                                    OpDecorate %101 RelaxedPrecision 
					                                                    OpDecorate %102 RelaxedPrecision 
					                                                    OpDecorate %103 RelaxedPrecision 
					                                                    OpDecorate %104 RelaxedPrecision 
					                                             %2 = OpTypeVoid 
					                                             %3 = OpTypeFunction %2 
					                                             %6 = OpTypeFloat 32 
					                                             %7 = OpTypeVector %6 4 
					                                             %8 = OpTypePointer Private %7 
					                              Private f32_4* %9 = OpVariable Private 
					                                        f32 %10 = OpConstant 3.674022E-40 
					                                            %11 = OpTypeInt 32 0 
					                                        u32 %12 = OpConstant 1 
					                                            %13 = OpTypePointer Private %6 
					                                        f32 %15 = OpConstant 3.674022E-40 
					                                        u32 %16 = OpConstant 3 
					                             Private f32_4* %18 = OpVariable Private 
					                                            %19 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %20 = OpTypeSampledImage %19 
					                                            %21 = OpTypePointer UniformConstant %20 
					UniformConstant read_only Texture2DSampled* %22 = OpVariable UniformConstant 
					                                            %24 = OpTypeVector %6 2 
					                                            %25 = OpTypePointer Input %24 
					                               Input f32_2* %26 = OpVariable Input 
					                                            %34 = OpTypeVector %6 3 
					                                            %35 = OpTypePointer Private %34 
					                             Private f32_3* %36 = OpVariable Private 
					UniformConstant read_only Texture2DSampled* %37 = OpVariable UniformConstant 
					                             Private f32_3* %43 = OpVariable Private 
					                             Private f32_3* %49 = OpVariable Private 
					                                        f32 %51 = OpConstant 3.674022E-40 
					                                        f32 %52 = OpConstant 3.674022E-40 
					                                      f32_3 %53 = OpConstantComposite %51 %52 %51 
					                             Private f32_3* %55 = OpVariable Private 
					                                      f32_3 %57 = OpConstantComposite %52 %51 %51 
					                                            %61 = OpTypePointer Output %7 
					                              Output f32_4* %62 = OpVariable Output 
					                                            %65 = OpTypePointer Output %6 
					                                        f32 %67 = OpConstant 3.674022E-40 
					                                      f32_3 %75 = OpConstantComposite %51 %51 %52 
					                               Private f32* %79 = OpVariable Private 
					                                        f32 %81 = OpConstant 3.674022E-40 
					                                        f32 %82 = OpConstant 3.674022E-40 
					                                        f32 %83 = OpConstant 3.674022E-40 
					                                      f32_3 %84 = OpConstantComposite %81 %82 %83 
					                                            %91 = OpTypeStruct %6 
					                                            %92 = OpTypePointer Uniform %91 
					                     Uniform struct {f32;}* %93 = OpVariable Uniform 
					                                            %94 = OpTypeInt 32 1 
					                                        i32 %95 = OpConstant 0 
					                                            %96 = OpTypePointer Uniform %6 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                               Private f32* %14 = OpAccessChain %9 %12 
					                                                    OpStore %14 %10 
					                               Private f32* %17 = OpAccessChain %9 %16 
					                                                    OpStore %17 %15 
					                 read_only Texture2DSampled %23 = OpLoad %22 
					                                      f32_2 %27 = OpLoad %26 
					                                      f32_4 %28 = OpImageSampleImplicitLod %23 %27 
					                                      f32_4 %29 = OpVectorShuffle %28 %28 2 0 1 3 
					                                                    OpStore %18 %29 
					                                      f32_4 %30 = OpLoad %18 
					                                      f32_2 %31 = OpVectorShuffle %30 %30 1 2 
					                                      f32_4 %32 = OpLoad %9 
					                                      f32_4 %33 = OpVectorShuffle %32 %31 4 1 5 3 
					                                                    OpStore %9 %33 
					                 read_only Texture2DSampled %38 = OpLoad %37 
					                                      f32_4 %39 = OpLoad %9 
					                                      f32_2 %40 = OpVectorShuffle %39 %39 2 3 
					                                      f32_4 %41 = OpImageSampleImplicitLod %38 %40 
					                                      f32_3 %42 = OpVectorShuffle %41 %41 0 1 2 
					                                                    OpStore %36 %42 
					                 read_only Texture2DSampled %44 = OpLoad %37 
					                                      f32_4 %45 = OpLoad %9 
					                                      f32_2 %46 = OpVectorShuffle %45 %45 0 1 
					                                      f32_4 %47 = OpImageSampleImplicitLod %44 %46 
					                                      f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
					                                                    OpStore %43 %48 
					                                      f32_3 %50 = OpLoad %36 
					                                      f32_3 %54 = OpFMul %50 %53 
					                                                    OpStore %49 %54 
					                                      f32_3 %56 = OpLoad %43 
					                                      f32_3 %58 = OpFMul %56 %57 
					                                      f32_3 %59 = OpLoad %49 
					                                      f32_3 %60 = OpFAdd %58 %59 
					                                                    OpStore %55 %60 
					                               Private f32* %63 = OpAccessChain %18 %16 
					                                        f32 %64 = OpLoad %63 
					                                Output f32* %66 = OpAccessChain %62 %16 
					                                                    OpStore %66 %64 
					                               Private f32* %68 = OpAccessChain %18 %12 
					                                                    OpStore %68 %67 
					                 read_only Texture2DSampled %69 = OpLoad %37 
					                                      f32_4 %70 = OpLoad %18 
					                                      f32_2 %71 = OpVectorShuffle %70 %70 0 1 
					                                      f32_4 %72 = OpImageSampleImplicitLod %69 %71 
					                                      f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
					                                                    OpStore %43 %73 
					                                      f32_3 %74 = OpLoad %43 
					                                      f32_3 %76 = OpFMul %74 %75 
					                                      f32_3 %77 = OpLoad %55 
					                                      f32_3 %78 = OpFAdd %76 %77 
					                                                    OpStore %55 %78 
					                                      f32_3 %80 = OpLoad %55 
					                                        f32 %85 = OpDot %80 %84 
					                                                    OpStore %79 %85 
					                                        f32 %86 = OpLoad %79 
					                                      f32_3 %87 = OpCompositeConstruct %86 %86 %86 
					                                      f32_3 %88 = OpFNegate %87 
					                                      f32_3 %89 = OpLoad %55 
					                                      f32_3 %90 = OpFAdd %88 %89 
					                                                    OpStore %55 %90 
					                               Uniform f32* %97 = OpAccessChain %93 %95 
					                                        f32 %98 = OpLoad %97 
					                                      f32_3 %99 = OpCompositeConstruct %98 %98 %98 
					                                     f32_3 %100 = OpLoad %55 
					                                     f32_3 %101 = OpFMul %99 %100 
					                                       f32 %102 = OpLoad %79 
					                                     f32_3 %103 = OpCompositeConstruct %102 %102 %102 
					                                     f32_3 %104 = OpFAdd %101 %103 
					                                     f32_4 %105 = OpLoad %62 
					                                     f32_4 %106 = OpVectorShuffle %105 %104 4 5 6 3 
					                                                    OpStore %62 %106 
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