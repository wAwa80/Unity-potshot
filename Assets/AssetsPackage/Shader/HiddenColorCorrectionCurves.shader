Shader "Hidden/ColorCorrectionCurves" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "" {}
		_RgbTex ("_RgbTex (RGB)", 2D) = "" {}
		_ZCurve ("_ZCurve (RGB)", 2D) = "" {}
		_RgbDepthTex ("_RgbDepthTex (RGB)", 2D) = "" {}
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 52737
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 _CameraDepthTexture_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
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
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _CameraDepthTexture_ST.xy) + _CameraDepthTexture_ST.zw);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec4 _ZBufferParams;
					uniform sampler2D _MainTex;
					uniform highp sampler2D _CameraDepthTexture;
					uniform sampler2D _RgbTex;
					uniform sampler2D _ZCurve;
					uniform sampler2D _RgbDepthTex;
					uniform lowp float _Saturation;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 depthBlue_1;
					  mediump vec3 depthGreen_2;
					  mediump vec3 depthRed_3;
					  mediump float zval_4;
					  mediump float theDepth_5;
					  mediump vec3 blue_6;
					  mediump vec3 green_7;
					  mediump vec3 red_8;
					  mediump vec4 color_9;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
					  color_9 = tmpvar_10;
					  mediump vec2 tmpvar_11;
					  tmpvar_11.x = color_9.x;
					  tmpvar_11.y = 0.125;
					  lowp vec3 tmpvar_12;
					  tmpvar_12 = (texture2D (_RgbTex, tmpvar_11).xyz * vec3(1.0, 0.0, 0.0));
					  red_8 = tmpvar_12;
					  mediump vec2 tmpvar_13;
					  tmpvar_13.x = color_9.y;
					  tmpvar_13.y = 0.375;
					  lowp vec3 tmpvar_14;
					  tmpvar_14 = (texture2D (_RgbTex, tmpvar_13).xyz * vec3(0.0, 1.0, 0.0));
					  green_7 = tmpvar_14;
					  mediump vec2 tmpvar_15;
					  tmpvar_15.x = color_9.z;
					  tmpvar_15.y = 0.625;
					  lowp vec3 tmpvar_16;
					  tmpvar_16 = (texture2D (_RgbTex, tmpvar_15).xyz * vec3(0.0, 0.0, 1.0));
					  blue_6 = tmpvar_16;
					  highp float tmpvar_17;
					  tmpvar_17 = texture2D (_CameraDepthTexture, xlv_TEXCOORD1).x;
					  theDepth_5 = tmpvar_17;
					  highp float z_18;
					  z_18 = theDepth_5;
					  highp vec2 tmpvar_19;
					  tmpvar_19.y = 0.5;
					  tmpvar_19.x = (1.0/(((_ZBufferParams.x * z_18) + _ZBufferParams.y)));
					  lowp float tmpvar_20;
					  tmpvar_20 = texture2D (_ZCurve, tmpvar_19).x;
					  zval_4 = tmpvar_20;
					  mediump vec2 tmpvar_21;
					  tmpvar_21.x = color_9.x;
					  tmpvar_21.y = 0.125;
					  lowp vec3 tmpvar_22;
					  tmpvar_22 = (texture2D (_RgbDepthTex, tmpvar_21).xyz * vec3(1.0, 0.0, 0.0));
					  depthRed_3 = tmpvar_22;
					  mediump vec2 tmpvar_23;
					  tmpvar_23.x = color_9.y;
					  tmpvar_23.y = 0.375;
					  lowp vec3 tmpvar_24;
					  tmpvar_24 = (texture2D (_RgbDepthTex, tmpvar_23).xyz * vec3(0.0, 1.0, 0.0));
					  depthGreen_2 = tmpvar_24;
					  mediump vec2 tmpvar_25;
					  tmpvar_25.x = color_9.z;
					  tmpvar_25.y = 0.625;
					  lowp vec3 tmpvar_26;
					  tmpvar_26 = (texture2D (_RgbDepthTex, tmpvar_25).xyz * vec3(0.0, 0.0, 1.0));
					  depthBlue_1 = tmpvar_26;
					  mediump vec4 tmpvar_27;
					  tmpvar_27.xyz = mix (((red_8 + green_7) + blue_6), ((depthRed_3 + depthBlue_1) + depthGreen_2), vec3(zval_4));
					  tmpvar_27.w = color_9.w;
					  color_9.w = tmpvar_27.w;
					  color_9.xyz = mix (vec3(dot (tmpvar_27.xyz, vec3(0.22, 0.707, 0.071))), tmpvar_27.xyz, vec3(_Saturation));
					  gl_FragData[0] = color_9;
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
					uniform highp vec4 _CameraDepthTexture_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
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
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _CameraDepthTexture_ST.xy) + _CameraDepthTexture_ST.zw);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec4 _ZBufferParams;
					uniform sampler2D _MainTex;
					uniform highp sampler2D _CameraDepthTexture;
					uniform sampler2D _RgbTex;
					uniform sampler2D _ZCurve;
					uniform sampler2D _RgbDepthTex;
					uniform lowp float _Saturation;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 depthBlue_1;
					  mediump vec3 depthGreen_2;
					  mediump vec3 depthRed_3;
					  mediump float zval_4;
					  mediump float theDepth_5;
					  mediump vec3 blue_6;
					  mediump vec3 green_7;
					  mediump vec3 red_8;
					  mediump vec4 color_9;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
					  color_9 = tmpvar_10;
					  mediump vec2 tmpvar_11;
					  tmpvar_11.x = color_9.x;
					  tmpvar_11.y = 0.125;
					  lowp vec3 tmpvar_12;
					  tmpvar_12 = (texture2D (_RgbTex, tmpvar_11).xyz * vec3(1.0, 0.0, 0.0));
					  red_8 = tmpvar_12;
					  mediump vec2 tmpvar_13;
					  tmpvar_13.x = color_9.y;
					  tmpvar_13.y = 0.375;
					  lowp vec3 tmpvar_14;
					  tmpvar_14 = (texture2D (_RgbTex, tmpvar_13).xyz * vec3(0.0, 1.0, 0.0));
					  green_7 = tmpvar_14;
					  mediump vec2 tmpvar_15;
					  tmpvar_15.x = color_9.z;
					  tmpvar_15.y = 0.625;
					  lowp vec3 tmpvar_16;
					  tmpvar_16 = (texture2D (_RgbTex, tmpvar_15).xyz * vec3(0.0, 0.0, 1.0));
					  blue_6 = tmpvar_16;
					  highp float tmpvar_17;
					  tmpvar_17 = texture2D (_CameraDepthTexture, xlv_TEXCOORD1).x;
					  theDepth_5 = tmpvar_17;
					  highp float z_18;
					  z_18 = theDepth_5;
					  highp vec2 tmpvar_19;
					  tmpvar_19.y = 0.5;
					  tmpvar_19.x = (1.0/(((_ZBufferParams.x * z_18) + _ZBufferParams.y)));
					  lowp float tmpvar_20;
					  tmpvar_20 = texture2D (_ZCurve, tmpvar_19).x;
					  zval_4 = tmpvar_20;
					  mediump vec2 tmpvar_21;
					  tmpvar_21.x = color_9.x;
					  tmpvar_21.y = 0.125;
					  lowp vec3 tmpvar_22;
					  tmpvar_22 = (texture2D (_RgbDepthTex, tmpvar_21).xyz * vec3(1.0, 0.0, 0.0));
					  depthRed_3 = tmpvar_22;
					  mediump vec2 tmpvar_23;
					  tmpvar_23.x = color_9.y;
					  tmpvar_23.y = 0.375;
					  lowp vec3 tmpvar_24;
					  tmpvar_24 = (texture2D (_RgbDepthTex, tmpvar_23).xyz * vec3(0.0, 1.0, 0.0));
					  depthGreen_2 = tmpvar_24;
					  mediump vec2 tmpvar_25;
					  tmpvar_25.x = color_9.z;
					  tmpvar_25.y = 0.625;
					  lowp vec3 tmpvar_26;
					  tmpvar_26 = (texture2D (_RgbDepthTex, tmpvar_25).xyz * vec3(0.0, 0.0, 1.0));
					  depthBlue_1 = tmpvar_26;
					  mediump vec4 tmpvar_27;
					  tmpvar_27.xyz = mix (((red_8 + green_7) + blue_6), ((depthRed_3 + depthBlue_1) + depthGreen_2), vec3(zval_4));
					  tmpvar_27.w = color_9.w;
					  color_9.w = tmpvar_27.w;
					  color_9.xyz = mix (vec3(dot (tmpvar_27.xyz, vec3(0.22, 0.707, 0.071))), tmpvar_27.xyz, vec3(_Saturation));
					  gl_FragData[0] = color_9;
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
					uniform highp vec4 _CameraDepthTexture_ST;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
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
					  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _CameraDepthTexture_ST.xy) + _CameraDepthTexture_ST.zw);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec4 _ZBufferParams;
					uniform sampler2D _MainTex;
					uniform highp sampler2D _CameraDepthTexture;
					uniform sampler2D _RgbTex;
					uniform sampler2D _ZCurve;
					uniform sampler2D _RgbDepthTex;
					uniform lowp float _Saturation;
					varying highp vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					void main ()
					{
					  mediump vec3 depthBlue_1;
					  mediump vec3 depthGreen_2;
					  mediump vec3 depthRed_3;
					  mediump float zval_4;
					  mediump float theDepth_5;
					  mediump vec3 blue_6;
					  mediump vec3 green_7;
					  mediump vec3 red_8;
					  mediump vec4 color_9;
					  lowp vec4 tmpvar_10;
					  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
					  color_9 = tmpvar_10;
					  mediump vec2 tmpvar_11;
					  tmpvar_11.x = color_9.x;
					  tmpvar_11.y = 0.125;
					  lowp vec3 tmpvar_12;
					  tmpvar_12 = (texture2D (_RgbTex, tmpvar_11).xyz * vec3(1.0, 0.0, 0.0));
					  red_8 = tmpvar_12;
					  mediump vec2 tmpvar_13;
					  tmpvar_13.x = color_9.y;
					  tmpvar_13.y = 0.375;
					  lowp vec3 tmpvar_14;
					  tmpvar_14 = (texture2D (_RgbTex, tmpvar_13).xyz * vec3(0.0, 1.0, 0.0));
					  green_7 = tmpvar_14;
					  mediump vec2 tmpvar_15;
					  tmpvar_15.x = color_9.z;
					  tmpvar_15.y = 0.625;
					  lowp vec3 tmpvar_16;
					  tmpvar_16 = (texture2D (_RgbTex, tmpvar_15).xyz * vec3(0.0, 0.0, 1.0));
					  blue_6 = tmpvar_16;
					  highp float tmpvar_17;
					  tmpvar_17 = texture2D (_CameraDepthTexture, xlv_TEXCOORD1).x;
					  theDepth_5 = tmpvar_17;
					  highp float z_18;
					  z_18 = theDepth_5;
					  highp vec2 tmpvar_19;
					  tmpvar_19.y = 0.5;
					  tmpvar_19.x = (1.0/(((_ZBufferParams.x * z_18) + _ZBufferParams.y)));
					  lowp float tmpvar_20;
					  tmpvar_20 = texture2D (_ZCurve, tmpvar_19).x;
					  zval_4 = tmpvar_20;
					  mediump vec2 tmpvar_21;
					  tmpvar_21.x = color_9.x;
					  tmpvar_21.y = 0.125;
					  lowp vec3 tmpvar_22;
					  tmpvar_22 = (texture2D (_RgbDepthTex, tmpvar_21).xyz * vec3(1.0, 0.0, 0.0));
					  depthRed_3 = tmpvar_22;
					  mediump vec2 tmpvar_23;
					  tmpvar_23.x = color_9.y;
					  tmpvar_23.y = 0.375;
					  lowp vec3 tmpvar_24;
					  tmpvar_24 = (texture2D (_RgbDepthTex, tmpvar_23).xyz * vec3(0.0, 1.0, 0.0));
					  depthGreen_2 = tmpvar_24;
					  mediump vec2 tmpvar_25;
					  tmpvar_25.x = color_9.z;
					  tmpvar_25.y = 0.625;
					  lowp vec3 tmpvar_26;
					  tmpvar_26 = (texture2D (_RgbDepthTex, tmpvar_25).xyz * vec3(0.0, 0.0, 1.0));
					  depthBlue_1 = tmpvar_26;
					  mediump vec4 tmpvar_27;
					  tmpvar_27.xyz = mix (((red_8 + green_7) + blue_6), ((depthRed_3 + depthBlue_1) + depthGreen_2), vec3(zval_4));
					  tmpvar_27.w = color_9.w;
					  color_9.w = tmpvar_27.w;
					  color_9.xyz = mix (vec3(dot (tmpvar_27.xyz, vec3(0.22, 0.707, 0.071))), tmpvar_27.xyz, vec3(_Saturation));
					  gl_FragData[0] = color_9;
					}
					
					
					#endif"
				}
				SubProgram "gles3 hw_tier00 " {
					"!!!!GLES3
					#ifdef VERTEX
					#version 300 es
					
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					uniform 	vec4 _CameraDepthTexture_ST;
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
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _CameraDepthTexture_ST.xy + _CameraDepthTexture_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _ZBufferParams;
					uniform 	mediump float _Saturation;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _RgbTex;
					uniform highp sampler2D _CameraDepthTexture;
					uniform lowp sampler2D _ZCurve;
					uniform lowp sampler2D _RgbDepthTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec2 u_xlat1;
					mediump vec3 u_xlat16_2;
					lowp vec3 u_xlat10_2;
					lowp vec3 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					mediump vec3 u_xlat16_5;
					mediump vec3 u_xlat16_6;
					vec2 u_xlat15;
					mediump float u_xlat16_26;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy).xzyw;
					    u_xlat1.x = u_xlat0.y;
					    u_xlat1.y = float(0.625);
					    u_xlat15.y = float(0.5);
					    u_xlat10_2.xyz = texture(_RgbDepthTex, u_xlat1.xy).xyz;
					    u_xlat10_3.xyz = texture(_RgbTex, u_xlat1.xy).xyz;
					    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(0.0, 0.0, 1.0);
					    SV_Target0.w = u_xlat0.w;
					    u_xlat0.y = float(0.125);
					    u_xlat0.w = float(0.375);
					    u_xlat10_4.xyz = texture(_RgbDepthTex, u_xlat0.xy).xyz;
					    u_xlat16_5.xyz = u_xlat10_4.xyz * vec3(1.0, 0.0, 0.0) + u_xlat16_2.xyz;
					    u_xlat10_2.xyz = texture(_RgbDepthTex, u_xlat0.zw).xyz;
					    u_xlat16_5.xyz = u_xlat10_2.xyz * vec3(0.0, 1.0, 0.0) + u_xlat16_5.xyz;
					    u_xlat10_2.xyz = texture(_RgbTex, u_xlat0.zw).xyz;
					    u_xlat10_0.xyz = texture(_RgbTex, u_xlat0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(0.0, 1.0, 0.0);
					    u_xlat16_6.xyz = u_xlat10_0.xyz * vec3(1.0, 0.0, 0.0) + u_xlat16_2.xyz;
					    u_xlat16_6.xyz = u_xlat10_3.xyz * vec3(0.0, 0.0, 1.0) + u_xlat16_6.xyz;
					    u_xlat16_5.xyz = u_xlat16_5.xyz + (-u_xlat16_6.xyz);
					    u_xlat0.x = texture(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat15.x = float(1.0) / u_xlat0.x;
					    u_xlat10_0.x = texture(_ZCurve, u_xlat15.xy).x;
					    u_xlat16_5.xyz = u_xlat10_0.xxx * u_xlat16_5.xyz + u_xlat16_6.xyz;
					    u_xlat16_26 = dot(u_xlat16_5.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_5.xyz = (-vec3(u_xlat16_26)) + u_xlat16_5.xyz;
					    SV_Target0.xyz = vec3(_Saturation) * u_xlat16_5.xyz + vec3(u_xlat16_26);
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
					uniform 	vec4 _CameraDepthTexture_ST;
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
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _CameraDepthTexture_ST.xy + _CameraDepthTexture_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _ZBufferParams;
					uniform 	mediump float _Saturation;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _RgbTex;
					uniform highp sampler2D _CameraDepthTexture;
					uniform lowp sampler2D _ZCurve;
					uniform lowp sampler2D _RgbDepthTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec2 u_xlat1;
					mediump vec3 u_xlat16_2;
					lowp vec3 u_xlat10_2;
					lowp vec3 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					mediump vec3 u_xlat16_5;
					mediump vec3 u_xlat16_6;
					vec2 u_xlat15;
					mediump float u_xlat16_26;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy).xzyw;
					    u_xlat1.x = u_xlat0.y;
					    u_xlat1.y = float(0.625);
					    u_xlat15.y = float(0.5);
					    u_xlat10_2.xyz = texture(_RgbDepthTex, u_xlat1.xy).xyz;
					    u_xlat10_3.xyz = texture(_RgbTex, u_xlat1.xy).xyz;
					    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(0.0, 0.0, 1.0);
					    SV_Target0.w = u_xlat0.w;
					    u_xlat0.y = float(0.125);
					    u_xlat0.w = float(0.375);
					    u_xlat10_4.xyz = texture(_RgbDepthTex, u_xlat0.xy).xyz;
					    u_xlat16_5.xyz = u_xlat10_4.xyz * vec3(1.0, 0.0, 0.0) + u_xlat16_2.xyz;
					    u_xlat10_2.xyz = texture(_RgbDepthTex, u_xlat0.zw).xyz;
					    u_xlat16_5.xyz = u_xlat10_2.xyz * vec3(0.0, 1.0, 0.0) + u_xlat16_5.xyz;
					    u_xlat10_2.xyz = texture(_RgbTex, u_xlat0.zw).xyz;
					    u_xlat10_0.xyz = texture(_RgbTex, u_xlat0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(0.0, 1.0, 0.0);
					    u_xlat16_6.xyz = u_xlat10_0.xyz * vec3(1.0, 0.0, 0.0) + u_xlat16_2.xyz;
					    u_xlat16_6.xyz = u_xlat10_3.xyz * vec3(0.0, 0.0, 1.0) + u_xlat16_6.xyz;
					    u_xlat16_5.xyz = u_xlat16_5.xyz + (-u_xlat16_6.xyz);
					    u_xlat0.x = texture(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat15.x = float(1.0) / u_xlat0.x;
					    u_xlat10_0.x = texture(_ZCurve, u_xlat15.xy).x;
					    u_xlat16_5.xyz = u_xlat10_0.xxx * u_xlat16_5.xyz + u_xlat16_6.xyz;
					    u_xlat16_26 = dot(u_xlat16_5.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_5.xyz = (-vec3(u_xlat16_26)) + u_xlat16_5.xyz;
					    SV_Target0.xyz = vec3(_Saturation) * u_xlat16_5.xyz + vec3(u_xlat16_26);
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
					uniform 	vec4 _CameraDepthTexture_ST;
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
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _CameraDepthTexture_ST.xy + _CameraDepthTexture_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 300 es
					
					precision highp int;
					uniform 	vec4 _ZBufferParams;
					uniform 	mediump float _Saturation;
					uniform lowp sampler2D _MainTex;
					uniform lowp sampler2D _RgbTex;
					uniform highp sampler2D _CameraDepthTexture;
					uniform lowp sampler2D _ZCurve;
					uniform lowp sampler2D _RgbDepthTex;
					in highp vec2 vs_TEXCOORD0;
					in highp vec2 vs_TEXCOORD1;
					layout(location = 0) out mediump vec4 SV_Target0;
					vec4 u_xlat0;
					lowp vec3 u_xlat10_0;
					vec2 u_xlat1;
					mediump vec3 u_xlat16_2;
					lowp vec3 u_xlat10_2;
					lowp vec3 u_xlat10_3;
					lowp vec3 u_xlat10_4;
					mediump vec3 u_xlat16_5;
					mediump vec3 u_xlat16_6;
					vec2 u_xlat15;
					mediump float u_xlat16_26;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy).xzyw;
					    u_xlat1.x = u_xlat0.y;
					    u_xlat1.y = float(0.625);
					    u_xlat15.y = float(0.5);
					    u_xlat10_2.xyz = texture(_RgbDepthTex, u_xlat1.xy).xyz;
					    u_xlat10_3.xyz = texture(_RgbTex, u_xlat1.xy).xyz;
					    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(0.0, 0.0, 1.0);
					    SV_Target0.w = u_xlat0.w;
					    u_xlat0.y = float(0.125);
					    u_xlat0.w = float(0.375);
					    u_xlat10_4.xyz = texture(_RgbDepthTex, u_xlat0.xy).xyz;
					    u_xlat16_5.xyz = u_xlat10_4.xyz * vec3(1.0, 0.0, 0.0) + u_xlat16_2.xyz;
					    u_xlat10_2.xyz = texture(_RgbDepthTex, u_xlat0.zw).xyz;
					    u_xlat16_5.xyz = u_xlat10_2.xyz * vec3(0.0, 1.0, 0.0) + u_xlat16_5.xyz;
					    u_xlat10_2.xyz = texture(_RgbTex, u_xlat0.zw).xyz;
					    u_xlat10_0.xyz = texture(_RgbTex, u_xlat0.xy).xyz;
					    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(0.0, 1.0, 0.0);
					    u_xlat16_6.xyz = u_xlat10_0.xyz * vec3(1.0, 0.0, 0.0) + u_xlat16_2.xyz;
					    u_xlat16_6.xyz = u_xlat10_3.xyz * vec3(0.0, 0.0, 1.0) + u_xlat16_6.xyz;
					    u_xlat16_5.xyz = u_xlat16_5.xyz + (-u_xlat16_6.xyz);
					    u_xlat0.x = texture(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat15.x = float(1.0) / u_xlat0.x;
					    u_xlat10_0.x = texture(_ZCurve, u_xlat15.xy).x;
					    u_xlat16_5.xyz = u_xlat10_0.xxx * u_xlat16_5.xyz + u_xlat16_6.xyz;
					    u_xlat16_26 = dot(u_xlat16_5.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat16_5.xyz = (-vec3(u_xlat16_26)) + u_xlat16_5.xyz;
					    SV_Target0.xyz = vec3(_Saturation) * u_xlat16_5.xyz + vec3(u_xlat16_26);
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan hw_tier00 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 136
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %11 %72 %94 %112 %129 
					                                                      OpDecorate %11 Location 11 
					                                                      OpDecorate %16 ArrayStride 16 
					                                                      OpDecorate %17 ArrayStride 17 
					                                                      OpMemberDecorate %18 0 Offset 18 
					                                                      OpMemberDecorate %18 1 Offset 18 
					                                                      OpMemberDecorate %18 2 Offset 18 
					                                                      OpMemberDecorate %18 3 Offset 18 
					                                                      OpDecorate %18 Block 
					                                                      OpDecorate %20 DescriptorSet 20 
					                                                      OpDecorate %20 Binding 20 
					                                                      OpMemberDecorate %70 0 BuiltIn 70 
					                                                      OpMemberDecorate %70 1 BuiltIn 70 
					                                                      OpMemberDecorate %70 2 BuiltIn 70 
					                                                      OpDecorate %70 Block 
					                                                      OpDecorate %94 RelaxedPrecision 
					                                                      OpDecorate %94 Location 94 
					                                                      OpDecorate %95 RelaxedPrecision 
					                                                      OpDecorate %112 Location 112 
					                                                      OpDecorate %129 Location 129 
					                                                      OpDecorate %130 RelaxedPrecision 
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
					                                              %90 = OpTypeVector %6 2 
					                                              %91 = OpTypePointer Private %90 
					                               Private f32_2* %92 = OpVariable Private 
					                                              %93 = OpTypePointer Input %90 
					                                 Input f32_2* %94 = OpVariable Input 
					                                             %104 = OpTypePointer Private %6 
					                                Private f32* %105 = OpVariable Private 
					                                         f32 %109 = OpConstant 3.674022E-40 
					                                             %111 = OpTypePointer Output %90 
					                               Output f32_2* %112 = OpVariable Output 
					                                             %113 = OpTypePointer Function %6 
					                                             %123 = OpTypePointer Output %6 
					                                         u32 %125 = OpConstant 0 
					                               Output f32_2* %129 = OpVariable Output 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %114 = OpVariable Function 
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
					                                 Uniform f32* %86 = OpAccessChain %20 %44 %68 
					                                          f32 %87 = OpLoad %86 
					                                         bool %89 = OpFOrdLessThan %87 %88 
					                                                      OpStore %84 %89 
					                                        f32_2 %95 = OpLoad %94 
					                               Uniform f32_4* %96 = OpAccessChain %20 %35 
					                                        f32_4 %97 = OpLoad %96 
					                                        f32_2 %98 = OpVectorShuffle %97 %97 0 1 
					                                        f32_2 %99 = OpFMul %95 %98 
					                              Uniform f32_4* %100 = OpAccessChain %20 %35 
					                                       f32_4 %101 = OpLoad %100 
					                                       f32_2 %102 = OpVectorShuffle %101 %101 2 3 
					                                       f32_2 %103 = OpFAdd %99 %102 
					                                                      OpStore %92 %103 
					                                Private f32* %106 = OpAccessChain %92 %68 
					                                         f32 %107 = OpLoad %106 
					                                         f32 %108 = OpFNegate %107 
					                                         f32 %110 = OpFAdd %108 %109 
					                                                      OpStore %105 %110 
					                                        bool %115 = OpLoad %84 
					                                                      OpSelectionMerge %117 None 
					                                                      OpBranchConditional %115 %116 %119 
					                                             %116 = OpLabel 
					                                         f32 %118 = OpLoad %105 
					                                                      OpStore %114 %118 
					                                                      OpBranch %117 
					                                             %119 = OpLabel 
					                                Private f32* %120 = OpAccessChain %92 %68 
					                                         f32 %121 = OpLoad %120 
					                                                      OpStore %114 %121 
					                                                      OpBranch %117 
					                                             %117 = OpLabel 
					                                         f32 %122 = OpLoad %114 
					                                 Output f32* %124 = OpAccessChain %112 %68 
					                                                      OpStore %124 %122 
					                                Private f32* %126 = OpAccessChain %92 %125 
					                                         f32 %127 = OpLoad %126 
					                                 Output f32* %128 = OpAccessChain %112 %125 
					                                                      OpStore %128 %127 
					                                       f32_2 %130 = OpLoad %94 
					                                                      OpStore %129 %130 
					                                 Output f32* %131 = OpAccessChain %72 %22 %68 
					                                         f32 %132 = OpLoad %131 
					                                         f32 %133 = OpFNegate %132 
					                                 Output f32* %134 = OpAccessChain %72 %22 %68 
					                                                      OpStore %134 %133 
					                                                      OpReturn
					                                                      OpFunctionEnd

					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 176
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Fragment %4 "main" %17 %56 %116 
					                                                     OpExecutionMode %4 OriginUpperLeft 
					                                                     OpDecorate %13 RelaxedPrecision 
					                                                     OpDecorate %13 DescriptorSet 13 
					                                                     OpDecorate %13 Binding 13 
					                                                     OpDecorate %14 RelaxedPrecision 
					                                                     OpDecorate %17 Location 17 
					                                                     OpDecorate %20 RelaxedPrecision 
					                                                     OpDecorate %37 RelaxedPrecision 
					                                                     OpDecorate %38 RelaxedPrecision 
					                                                     OpDecorate %38 DescriptorSet 38 
					                                                     OpDecorate %38 Binding 38 
					                                                     OpDecorate %39 RelaxedPrecision 
					                                                     OpDecorate %42 RelaxedPrecision 
					                                                     OpDecorate %43 RelaxedPrecision 
					                                                     OpDecorate %44 RelaxedPrecision 
					                                                     OpDecorate %44 DescriptorSet 44 
					                                                     OpDecorate %44 Binding 44 
					                                                     OpDecorate %45 RelaxedPrecision 
					                                                     OpDecorate %48 RelaxedPrecision 
					                                                     OpDecorate %49 RelaxedPrecision 
					                                                     OpDecorate %50 RelaxedPrecision 
					                                                     OpDecorate %54 RelaxedPrecision 
					                                                     OpDecorate %56 RelaxedPrecision 
					                                                     OpDecorate %56 Location 56 
					                                                     OpDecorate %66 RelaxedPrecision 
					                                                     OpDecorate %67 RelaxedPrecision 
					                                                     OpDecorate %71 RelaxedPrecision 
					                                                     OpDecorate %72 RelaxedPrecision 
					                                                     OpDecorate %73 RelaxedPrecision 
					                                                     OpDecorate %75 RelaxedPrecision 
					                                                     OpDecorate %76 RelaxedPrecision 
					                                                     OpDecorate %77 RelaxedPrecision 
					                                                     OpDecorate %78 RelaxedPrecision 
					                                                     OpDecorate %82 RelaxedPrecision 
					                                                     OpDecorate %83 RelaxedPrecision 
					                                                     OpDecorate %85 RelaxedPrecision 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %88 RelaxedPrecision 
					                                                     OpDecorate %92 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %94 RelaxedPrecision 
					                                                     OpDecorate %98 RelaxedPrecision 
					                                                     OpDecorate %99 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %102 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 RelaxedPrecision 
					                                                     OpDecorate %105 RelaxedPrecision 
					                                                     OpDecorate %106 RelaxedPrecision 
					                                                     OpDecorate %107 RelaxedPrecision 
					                                                     OpDecorate %108 RelaxedPrecision 
					                                                     OpDecorate %109 RelaxedPrecision 
					                                                     OpDecorate %110 RelaxedPrecision 
					                                                     OpDecorate %111 RelaxedPrecision 
					                                                     OpDecorate %112 RelaxedPrecision 
					                                                     OpDecorate %113 RelaxedPrecision 
					                                                     OpDecorate %114 DescriptorSet 114 
					                                                     OpDecorate %114 Binding 114 
					                                                     OpDecorate %116 Location 116 
					                                                     OpMemberDecorate %121 0 Offset 121 
					                                                     OpMemberDecorate %121 1 RelaxedPrecision 
					                                                     OpMemberDecorate %121 1 Offset 121 
					                                                     OpDecorate %121 Block 
					                                                     OpDecorate %123 DescriptorSet 123 
					                                                     OpDecorate %123 Binding 123 
					                                                     OpDecorate %140 RelaxedPrecision 
					                                                     OpDecorate %140 DescriptorSet 140 
					                                                     OpDecorate %140 Binding 140 
					                                                     OpDecorate %141 RelaxedPrecision 
					                                                     OpDecorate %144 RelaxedPrecision 
					                                                     OpDecorate %146 RelaxedPrecision 
					                                                     OpDecorate %147 RelaxedPrecision 
					                                                     OpDecorate %148 RelaxedPrecision 
					                                                     OpDecorate %149 RelaxedPrecision 
					                                                     OpDecorate %150 RelaxedPrecision 
					                                                     OpDecorate %151 RelaxedPrecision 
					                                                     OpDecorate %152 RelaxedPrecision 
					                                                     OpDecorate %153 RelaxedPrecision 
					                                                     OpDecorate %158 RelaxedPrecision 
					                                                     OpDecorate %159 RelaxedPrecision 
					                                                     OpDecorate %160 RelaxedPrecision 
					                                                     OpDecorate %161 RelaxedPrecision 
					                                                     OpDecorate %162 RelaxedPrecision 
					                                                     OpDecorate %163 RelaxedPrecision 
					                                                     OpDecorate %166 RelaxedPrecision 
					                                                     OpDecorate %167 RelaxedPrecision 
					                                                     OpDecorate %168 RelaxedPrecision 
					                                                     OpDecorate %169 RelaxedPrecision 
					                                                     OpDecorate %170 RelaxedPrecision 
					                                                     OpDecorate %171 RelaxedPrecision 
					                                                     OpDecorate %172 RelaxedPrecision 
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
					                                             %21 = OpTypePointer Private %15 
					                              Private f32_2* %22 = OpVariable Private 
					                                             %23 = OpTypeInt 32 0 
					                                         u32 %24 = OpConstant 1 
					                                             %25 = OpTypePointer Private %6 
					                                         u32 %28 = OpConstant 0 
					                                         f32 %30 = OpConstant 3.674022E-40 
					                              Private f32_2* %32 = OpVariable Private 
					                                         f32 %33 = OpConstant 3.674022E-40 
					                                             %35 = OpTypeVector %6 3 
					                                             %36 = OpTypePointer Private %35 
					                              Private f32_3* %37 = OpVariable Private 
					 UniformConstant read_only Texture2DSampled* %38 = OpVariable UniformConstant 
					                              Private f32_3* %43 = OpVariable Private 
					 UniformConstant read_only Texture2DSampled* %44 = OpVariable UniformConstant 
					                              Private f32_3* %49 = OpVariable Private 
					                                         f32 %51 = OpConstant 3.674022E-40 
					                                         f32 %52 = OpConstant 3.674022E-40 
					                                       f32_3 %53 = OpConstantComposite %51 %51 %52 
					                                             %55 = OpTypePointer Output %7 
					                               Output f32_4* %56 = OpVariable Output 
					                                         u32 %57 = OpConstant 3 
					                                             %60 = OpTypePointer Output %6 
					                                         f32 %62 = OpConstant 3.674022E-40 
					                                         f32 %64 = OpConstant 3.674022E-40 
					                              Private f32_3* %66 = OpVariable Private 
					                              Private f32_3* %72 = OpVariable Private 
					                                       f32_3 %74 = OpConstantComposite %52 %51 %51 
					                                       f32_3 %84 = OpConstantComposite %51 %52 %51 
					                              Private f32_3* %93 = OpVariable Private 
					                             Private f32_3* %101 = OpVariable Private 
					UniformConstant read_only Texture2DSampled* %114 = OpVariable UniformConstant 
					                               Input f32_2* %116 = OpVariable Input 
					                                            %121 = OpTypeStruct %7 %6 
					                                            %122 = OpTypePointer Uniform %121 
					              Uniform struct {f32_4; f32;}* %123 = OpVariable Uniform 
					                                            %124 = OpTypeInt 32 1 
					                                        i32 %125 = OpConstant 0 
					                                            %126 = OpTypePointer Uniform %6 
					UniformConstant read_only Texture2DSampled* %140 = OpVariable UniformConstant 
					                               Private f32* %152 = OpVariable Private 
					                                        f32 %154 = OpConstant 3.674022E-40 
					                                        f32 %155 = OpConstant 3.674022E-40 
					                                        f32 %156 = OpConstant 3.674022E-40 
					                                      f32_3 %157 = OpConstantComposite %154 %155 %156 
					                                        i32 %164 = OpConstant 1 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                  read_only Texture2DSampled %14 = OpLoad %13 
					                                       f32_2 %18 = OpLoad %17 
					                                       f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                       f32_4 %20 = OpVectorShuffle %19 %19 0 2 1 3 
					                                                     OpStore %9 %20 
					                                Private f32* %26 = OpAccessChain %9 %24 
					                                         f32 %27 = OpLoad %26 
					                                Private f32* %29 = OpAccessChain %22 %28 
					                                                     OpStore %29 %27 
					                                Private f32* %31 = OpAccessChain %22 %24 
					                                                     OpStore %31 %30 
					                                Private f32* %34 = OpAccessChain %32 %24 
					                                                     OpStore %34 %33 
					                  read_only Texture2DSampled %39 = OpLoad %38 
					                                       f32_2 %40 = OpLoad %22 
					                                       f32_4 %41 = OpImageSampleImplicitLod %39 %40 
					                                       f32_3 %42 = OpVectorShuffle %41 %41 0 1 2 
					                                                     OpStore %37 %42 
					                  read_only Texture2DSampled %45 = OpLoad %44 
					                                       f32_2 %46 = OpLoad %22 
					                                       f32_4 %47 = OpImageSampleImplicitLod %45 %46 
					                                       f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
					                                                     OpStore %43 %48 
					                                       f32_3 %50 = OpLoad %37 
					                                       f32_3 %54 = OpFMul %50 %53 
					                                                     OpStore %49 %54 
					                                Private f32* %58 = OpAccessChain %9 %57 
					                                         f32 %59 = OpLoad %58 
					                                 Output f32* %61 = OpAccessChain %56 %57 
					                                                     OpStore %61 %59 
					                                Private f32* %63 = OpAccessChain %9 %24 
					                                                     OpStore %63 %62 
					                                Private f32* %65 = OpAccessChain %9 %57 
					                                                     OpStore %65 %64 
					                  read_only Texture2DSampled %67 = OpLoad %38 
					                                       f32_4 %68 = OpLoad %9 
					                                       f32_2 %69 = OpVectorShuffle %68 %68 0 1 
					                                       f32_4 %70 = OpImageSampleImplicitLod %67 %69 
					                                       f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
					                                                     OpStore %66 %71 
					                                       f32_3 %73 = OpLoad %66 
					                                       f32_3 %75 = OpFMul %73 %74 
					                                       f32_3 %76 = OpLoad %49 
					                                       f32_3 %77 = OpFAdd %75 %76 
					                                                     OpStore %72 %77 
					                  read_only Texture2DSampled %78 = OpLoad %38 
					                                       f32_4 %79 = OpLoad %9 
					                                       f32_2 %80 = OpVectorShuffle %79 %79 2 3 
					                                       f32_4 %81 = OpImageSampleImplicitLod %78 %80 
					                                       f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
					                                                     OpStore %37 %82 
					                                       f32_3 %83 = OpLoad %37 
					                                       f32_3 %85 = OpFMul %83 %84 
					                                       f32_3 %86 = OpLoad %72 
					                                       f32_3 %87 = OpFAdd %85 %86 
					                                                     OpStore %72 %87 
					                  read_only Texture2DSampled %88 = OpLoad %44 
					                                       f32_4 %89 = OpLoad %9 
					                                       f32_2 %90 = OpVectorShuffle %89 %89 2 3 
					                                       f32_4 %91 = OpImageSampleImplicitLod %88 %90 
					                                       f32_3 %92 = OpVectorShuffle %91 %91 0 1 2 
					                                                     OpStore %37 %92 
					                  read_only Texture2DSampled %94 = OpLoad %44 
					                                       f32_4 %95 = OpLoad %9 
					                                       f32_2 %96 = OpVectorShuffle %95 %95 0 1 
					                                       f32_4 %97 = OpImageSampleImplicitLod %94 %96 
					                                       f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
					                                                     OpStore %93 %98 
					                                       f32_3 %99 = OpLoad %37 
					                                      f32_3 %100 = OpFMul %99 %84 
					                                                     OpStore %49 %100 
					                                      f32_3 %102 = OpLoad %93 
					                                      f32_3 %103 = OpFMul %102 %74 
					                                      f32_3 %104 = OpLoad %49 
					                                      f32_3 %105 = OpFAdd %103 %104 
					                                                     OpStore %101 %105 
					                                      f32_3 %106 = OpLoad %43 
					                                      f32_3 %107 = OpFMul %106 %53 
					                                      f32_3 %108 = OpLoad %101 
					                                      f32_3 %109 = OpFAdd %107 %108 
					                                                     OpStore %101 %109 
					                                      f32_3 %110 = OpLoad %72 
					                                      f32_3 %111 = OpLoad %101 
					                                      f32_3 %112 = OpFNegate %111 
					                                      f32_3 %113 = OpFAdd %110 %112 
					                                                     OpStore %72 %113 
					                 read_only Texture2DSampled %115 = OpLoad %114 
					                                      f32_2 %117 = OpLoad %116 
					                                      f32_4 %118 = OpImageSampleImplicitLod %115 %117 
					                                        f32 %119 = OpCompositeExtract %118 0 
					                               Private f32* %120 = OpAccessChain %9 %28 
					                                                     OpStore %120 %119 
					                               Uniform f32* %127 = OpAccessChain %123 %125 %28 
					                                        f32 %128 = OpLoad %127 
					                               Private f32* %129 = OpAccessChain %9 %28 
					                                        f32 %130 = OpLoad %129 
					                                        f32 %131 = OpFMul %128 %130 
					                               Uniform f32* %132 = OpAccessChain %123 %125 %24 
					                                        f32 %133 = OpLoad %132 
					                                        f32 %134 = OpFAdd %131 %133 
					                               Private f32* %135 = OpAccessChain %9 %28 
					                                                     OpStore %135 %134 
					                               Private f32* %136 = OpAccessChain %9 %28 
					                                        f32 %137 = OpLoad %136 
					                                        f32 %138 = OpFDiv %52 %137 
					                               Private f32* %139 = OpAccessChain %32 %28 
					                                                     OpStore %139 %138 
					                 read_only Texture2DSampled %141 = OpLoad %140 
					                                      f32_2 %142 = OpLoad %32 
					                                      f32_4 %143 = OpImageSampleImplicitLod %141 %142 
					                                        f32 %144 = OpCompositeExtract %143 0 
					                               Private f32* %145 = OpAccessChain %93 %28 
					                                                     OpStore %145 %144 
					                                      f32_3 %146 = OpLoad %93 
					                                      f32_3 %147 = OpVectorShuffle %146 %146 0 0 0 
					                                      f32_3 %148 = OpLoad %72 
					                                      f32_3 %149 = OpFMul %147 %148 
					                                      f32_3 %150 = OpLoad %101 
					                                      f32_3 %151 = OpFAdd %149 %150 
					                                                     OpStore %72 %151 
					                                      f32_3 %153 = OpLoad %72 
					                                        f32 %158 = OpDot %153 %157 
					                                                     OpStore %152 %158 
					                                        f32 %159 = OpLoad %152 
					                                      f32_3 %160 = OpCompositeConstruct %159 %159 %159 
					                                      f32_3 %161 = OpFNegate %160 
					                                      f32_3 %162 = OpLoad %72 
					                                      f32_3 %163 = OpFAdd %161 %162 
					                                                     OpStore %72 %163 
					                               Uniform f32* %165 = OpAccessChain %123 %164 
					                                        f32 %166 = OpLoad %165 
					                                      f32_3 %167 = OpCompositeConstruct %166 %166 %166 
					                                      f32_3 %168 = OpLoad %72 
					                                      f32_3 %169 = OpFMul %167 %168 
					                                        f32 %170 = OpLoad %152 
					                                      f32_3 %171 = OpCompositeConstruct %170 %170 %170 
					                                      f32_3 %172 = OpFAdd %169 %171 
					                                      f32_4 %173 = OpLoad %56 
					                                      f32_4 %174 = OpVectorShuffle %173 %172 4 5 6 3 
					                                                     OpStore %56 %174 
					                                                     OpReturn
					                                                     OpFunctionEnd
"
				}
				SubProgram "vulkan hw_tier01 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 136
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %11 %72 %94 %112 %129 
					                                                      OpDecorate %11 Location 11 
					                                                      OpDecorate %16 ArrayStride 16 
					                                                      OpDecorate %17 ArrayStride 17 
					                                                      OpMemberDecorate %18 0 Offset 18 
					                                                      OpMemberDecorate %18 1 Offset 18 
					                                                      OpMemberDecorate %18 2 Offset 18 
					                                                      OpMemberDecorate %18 3 Offset 18 
					                                                      OpDecorate %18 Block 
					                                                      OpDecorate %20 DescriptorSet 20 
					                                                      OpDecorate %20 Binding 20 
					                                                      OpMemberDecorate %70 0 BuiltIn 70 
					                                                      OpMemberDecorate %70 1 BuiltIn 70 
					                                                      OpMemberDecorate %70 2 BuiltIn 70 
					                                                      OpDecorate %70 Block 
					                                                      OpDecorate %94 RelaxedPrecision 
					                                                      OpDecorate %94 Location 94 
					                                                      OpDecorate %95 RelaxedPrecision 
					                                                      OpDecorate %112 Location 112 
					                                                      OpDecorate %129 Location 129 
					                                                      OpDecorate %130 RelaxedPrecision 
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
					                                              %90 = OpTypeVector %6 2 
					                                              %91 = OpTypePointer Private %90 
					                               Private f32_2* %92 = OpVariable Private 
					                                              %93 = OpTypePointer Input %90 
					                                 Input f32_2* %94 = OpVariable Input 
					                                             %104 = OpTypePointer Private %6 
					                                Private f32* %105 = OpVariable Private 
					                                         f32 %109 = OpConstant 3.674022E-40 
					                                             %111 = OpTypePointer Output %90 
					                               Output f32_2* %112 = OpVariable Output 
					                                             %113 = OpTypePointer Function %6 
					                                             %123 = OpTypePointer Output %6 
					                                         u32 %125 = OpConstant 0 
					                               Output f32_2* %129 = OpVariable Output 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %114 = OpVariable Function 
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
					                                 Uniform f32* %86 = OpAccessChain %20 %44 %68 
					                                          f32 %87 = OpLoad %86 
					                                         bool %89 = OpFOrdLessThan %87 %88 
					                                                      OpStore %84 %89 
					                                        f32_2 %95 = OpLoad %94 
					                               Uniform f32_4* %96 = OpAccessChain %20 %35 
					                                        f32_4 %97 = OpLoad %96 
					                                        f32_2 %98 = OpVectorShuffle %97 %97 0 1 
					                                        f32_2 %99 = OpFMul %95 %98 
					                              Uniform f32_4* %100 = OpAccessChain %20 %35 
					                                       f32_4 %101 = OpLoad %100 
					                                       f32_2 %102 = OpVectorShuffle %101 %101 2 3 
					                                       f32_2 %103 = OpFAdd %99 %102 
					                                                      OpStore %92 %103 
					                                Private f32* %106 = OpAccessChain %92 %68 
					                                         f32 %107 = OpLoad %106 
					                                         f32 %108 = OpFNegate %107 
					                                         f32 %110 = OpFAdd %108 %109 
					                                                      OpStore %105 %110 
					                                        bool %115 = OpLoad %84 
					                                                      OpSelectionMerge %117 None 
					                                                      OpBranchConditional %115 %116 %119 
					                                             %116 = OpLabel 
					                                         f32 %118 = OpLoad %105 
					                                                      OpStore %114 %118 
					                                                      OpBranch %117 
					                                             %119 = OpLabel 
					                                Private f32* %120 = OpAccessChain %92 %68 
					                                         f32 %121 = OpLoad %120 
					                                                      OpStore %114 %121 
					                                                      OpBranch %117 
					                                             %117 = OpLabel 
					                                         f32 %122 = OpLoad %114 
					                                 Output f32* %124 = OpAccessChain %112 %68 
					                                                      OpStore %124 %122 
					                                Private f32* %126 = OpAccessChain %92 %125 
					                                         f32 %127 = OpLoad %126 
					                                 Output f32* %128 = OpAccessChain %112 %125 
					                                                      OpStore %128 %127 
					                                       f32_2 %130 = OpLoad %94 
					                                                      OpStore %129 %130 
					                                 Output f32* %131 = OpAccessChain %72 %22 %68 
					                                         f32 %132 = OpLoad %131 
					                                         f32 %133 = OpFNegate %132 
					                                 Output f32* %134 = OpAccessChain %72 %22 %68 
					                                                      OpStore %134 %133 
					                                                      OpReturn
					                                                      OpFunctionEnd

					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 176
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Fragment %4 "main" %17 %56 %116 
					                                                     OpExecutionMode %4 OriginUpperLeft 
					                                                     OpDecorate %13 RelaxedPrecision 
					                                                     OpDecorate %13 DescriptorSet 13 
					                                                     OpDecorate %13 Binding 13 
					                                                     OpDecorate %14 RelaxedPrecision 
					                                                     OpDecorate %17 Location 17 
					                                                     OpDecorate %20 RelaxedPrecision 
					                                                     OpDecorate %37 RelaxedPrecision 
					                                                     OpDecorate %38 RelaxedPrecision 
					                                                     OpDecorate %38 DescriptorSet 38 
					                                                     OpDecorate %38 Binding 38 
					                                                     OpDecorate %39 RelaxedPrecision 
					                                                     OpDecorate %42 RelaxedPrecision 
					                                                     OpDecorate %43 RelaxedPrecision 
					                                                     OpDecorate %44 RelaxedPrecision 
					                                                     OpDecorate %44 DescriptorSet 44 
					                                                     OpDecorate %44 Binding 44 
					                                                     OpDecorate %45 RelaxedPrecision 
					                                                     OpDecorate %48 RelaxedPrecision 
					                                                     OpDecorate %49 RelaxedPrecision 
					                                                     OpDecorate %50 RelaxedPrecision 
					                                                     OpDecorate %54 RelaxedPrecision 
					                                                     OpDecorate %56 RelaxedPrecision 
					                                                     OpDecorate %56 Location 56 
					                                                     OpDecorate %66 RelaxedPrecision 
					                                                     OpDecorate %67 RelaxedPrecision 
					                                                     OpDecorate %71 RelaxedPrecision 
					                                                     OpDecorate %72 RelaxedPrecision 
					                                                     OpDecorate %73 RelaxedPrecision 
					                                                     OpDecorate %75 RelaxedPrecision 
					                                                     OpDecorate %76 RelaxedPrecision 
					                                                     OpDecorate %77 RelaxedPrecision 
					                                                     OpDecorate %78 RelaxedPrecision 
					                                                     OpDecorate %82 RelaxedPrecision 
					                                                     OpDecorate %83 RelaxedPrecision 
					                                                     OpDecorate %85 RelaxedPrecision 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %88 RelaxedPrecision 
					                                                     OpDecorate %92 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %94 RelaxedPrecision 
					                                                     OpDecorate %98 RelaxedPrecision 
					                                                     OpDecorate %99 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %102 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 RelaxedPrecision 
					                                                     OpDecorate %105 RelaxedPrecision 
					                                                     OpDecorate %106 RelaxedPrecision 
					                                                     OpDecorate %107 RelaxedPrecision 
					                                                     OpDecorate %108 RelaxedPrecision 
					                                                     OpDecorate %109 RelaxedPrecision 
					                                                     OpDecorate %110 RelaxedPrecision 
					                                                     OpDecorate %111 RelaxedPrecision 
					                                                     OpDecorate %112 RelaxedPrecision 
					                                                     OpDecorate %113 RelaxedPrecision 
					                                                     OpDecorate %114 DescriptorSet 114 
					                                                     OpDecorate %114 Binding 114 
					                                                     OpDecorate %116 Location 116 
					                                                     OpMemberDecorate %121 0 Offset 121 
					                                                     OpMemberDecorate %121 1 RelaxedPrecision 
					                                                     OpMemberDecorate %121 1 Offset 121 
					                                                     OpDecorate %121 Block 
					                                                     OpDecorate %123 DescriptorSet 123 
					                                                     OpDecorate %123 Binding 123 
					                                                     OpDecorate %140 RelaxedPrecision 
					                                                     OpDecorate %140 DescriptorSet 140 
					                                                     OpDecorate %140 Binding 140 
					                                                     OpDecorate %141 RelaxedPrecision 
					                                                     OpDecorate %144 RelaxedPrecision 
					                                                     OpDecorate %146 RelaxedPrecision 
					                                                     OpDecorate %147 RelaxedPrecision 
					                                                     OpDecorate %148 RelaxedPrecision 
					                                                     OpDecorate %149 RelaxedPrecision 
					                                                     OpDecorate %150 RelaxedPrecision 
					                                                     OpDecorate %151 RelaxedPrecision 
					                                                     OpDecorate %152 RelaxedPrecision 
					                                                     OpDecorate %153 RelaxedPrecision 
					                                                     OpDecorate %158 RelaxedPrecision 
					                                                     OpDecorate %159 RelaxedPrecision 
					                                                     OpDecorate %160 RelaxedPrecision 
					                                                     OpDecorate %161 RelaxedPrecision 
					                                                     OpDecorate %162 RelaxedPrecision 
					                                                     OpDecorate %163 RelaxedPrecision 
					                                                     OpDecorate %166 RelaxedPrecision 
					                                                     OpDecorate %167 RelaxedPrecision 
					                                                     OpDecorate %168 RelaxedPrecision 
					                                                     OpDecorate %169 RelaxedPrecision 
					                                                     OpDecorate %170 RelaxedPrecision 
					                                                     OpDecorate %171 RelaxedPrecision 
					                                                     OpDecorate %172 RelaxedPrecision 
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
					                                             %21 = OpTypePointer Private %15 
					                              Private f32_2* %22 = OpVariable Private 
					                                             %23 = OpTypeInt 32 0 
					                                         u32 %24 = OpConstant 1 
					                                             %25 = OpTypePointer Private %6 
					                                         u32 %28 = OpConstant 0 
					                                         f32 %30 = OpConstant 3.674022E-40 
					                              Private f32_2* %32 = OpVariable Private 
					                                         f32 %33 = OpConstant 3.674022E-40 
					                                             %35 = OpTypeVector %6 3 
					                                             %36 = OpTypePointer Private %35 
					                              Private f32_3* %37 = OpVariable Private 
					 UniformConstant read_only Texture2DSampled* %38 = OpVariable UniformConstant 
					                              Private f32_3* %43 = OpVariable Private 
					 UniformConstant read_only Texture2DSampled* %44 = OpVariable UniformConstant 
					                              Private f32_3* %49 = OpVariable Private 
					                                         f32 %51 = OpConstant 3.674022E-40 
					                                         f32 %52 = OpConstant 3.674022E-40 
					                                       f32_3 %53 = OpConstantComposite %51 %51 %52 
					                                             %55 = OpTypePointer Output %7 
					                               Output f32_4* %56 = OpVariable Output 
					                                         u32 %57 = OpConstant 3 
					                                             %60 = OpTypePointer Output %6 
					                                         f32 %62 = OpConstant 3.674022E-40 
					                                         f32 %64 = OpConstant 3.674022E-40 
					                              Private f32_3* %66 = OpVariable Private 
					                              Private f32_3* %72 = OpVariable Private 
					                                       f32_3 %74 = OpConstantComposite %52 %51 %51 
					                                       f32_3 %84 = OpConstantComposite %51 %52 %51 
					                              Private f32_3* %93 = OpVariable Private 
					                             Private f32_3* %101 = OpVariable Private 
					UniformConstant read_only Texture2DSampled* %114 = OpVariable UniformConstant 
					                               Input f32_2* %116 = OpVariable Input 
					                                            %121 = OpTypeStruct %7 %6 
					                                            %122 = OpTypePointer Uniform %121 
					              Uniform struct {f32_4; f32;}* %123 = OpVariable Uniform 
					                                            %124 = OpTypeInt 32 1 
					                                        i32 %125 = OpConstant 0 
					                                            %126 = OpTypePointer Uniform %6 
					UniformConstant read_only Texture2DSampled* %140 = OpVariable UniformConstant 
					                               Private f32* %152 = OpVariable Private 
					                                        f32 %154 = OpConstant 3.674022E-40 
					                                        f32 %155 = OpConstant 3.674022E-40 
					                                        f32 %156 = OpConstant 3.674022E-40 
					                                      f32_3 %157 = OpConstantComposite %154 %155 %156 
					                                        i32 %164 = OpConstant 1 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                  read_only Texture2DSampled %14 = OpLoad %13 
					                                       f32_2 %18 = OpLoad %17 
					                                       f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                       f32_4 %20 = OpVectorShuffle %19 %19 0 2 1 3 
					                                                     OpStore %9 %20 
					                                Private f32* %26 = OpAccessChain %9 %24 
					                                         f32 %27 = OpLoad %26 
					                                Private f32* %29 = OpAccessChain %22 %28 
					                                                     OpStore %29 %27 
					                                Private f32* %31 = OpAccessChain %22 %24 
					                                                     OpStore %31 %30 
					                                Private f32* %34 = OpAccessChain %32 %24 
					                                                     OpStore %34 %33 
					                  read_only Texture2DSampled %39 = OpLoad %38 
					                                       f32_2 %40 = OpLoad %22 
					                                       f32_4 %41 = OpImageSampleImplicitLod %39 %40 
					                                       f32_3 %42 = OpVectorShuffle %41 %41 0 1 2 
					                                                     OpStore %37 %42 
					                  read_only Texture2DSampled %45 = OpLoad %44 
					                                       f32_2 %46 = OpLoad %22 
					                                       f32_4 %47 = OpImageSampleImplicitLod %45 %46 
					                                       f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
					                                                     OpStore %43 %48 
					                                       f32_3 %50 = OpLoad %37 
					                                       f32_3 %54 = OpFMul %50 %53 
					                                                     OpStore %49 %54 
					                                Private f32* %58 = OpAccessChain %9 %57 
					                                         f32 %59 = OpLoad %58 
					                                 Output f32* %61 = OpAccessChain %56 %57 
					                                                     OpStore %61 %59 
					                                Private f32* %63 = OpAccessChain %9 %24 
					                                                     OpStore %63 %62 
					                                Private f32* %65 = OpAccessChain %9 %57 
					                                                     OpStore %65 %64 
					                  read_only Texture2DSampled %67 = OpLoad %38 
					                                       f32_4 %68 = OpLoad %9 
					                                       f32_2 %69 = OpVectorShuffle %68 %68 0 1 
					                                       f32_4 %70 = OpImageSampleImplicitLod %67 %69 
					                                       f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
					                                                     OpStore %66 %71 
					                                       f32_3 %73 = OpLoad %66 
					                                       f32_3 %75 = OpFMul %73 %74 
					                                       f32_3 %76 = OpLoad %49 
					                                       f32_3 %77 = OpFAdd %75 %76 
					                                                     OpStore %72 %77 
					                  read_only Texture2DSampled %78 = OpLoad %38 
					                                       f32_4 %79 = OpLoad %9 
					                                       f32_2 %80 = OpVectorShuffle %79 %79 2 3 
					                                       f32_4 %81 = OpImageSampleImplicitLod %78 %80 
					                                       f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
					                                                     OpStore %37 %82 
					                                       f32_3 %83 = OpLoad %37 
					                                       f32_3 %85 = OpFMul %83 %84 
					                                       f32_3 %86 = OpLoad %72 
					                                       f32_3 %87 = OpFAdd %85 %86 
					                                                     OpStore %72 %87 
					                  read_only Texture2DSampled %88 = OpLoad %44 
					                                       f32_4 %89 = OpLoad %9 
					                                       f32_2 %90 = OpVectorShuffle %89 %89 2 3 
					                                       f32_4 %91 = OpImageSampleImplicitLod %88 %90 
					                                       f32_3 %92 = OpVectorShuffle %91 %91 0 1 2 
					                                                     OpStore %37 %92 
					                  read_only Texture2DSampled %94 = OpLoad %44 
					                                       f32_4 %95 = OpLoad %9 
					                                       f32_2 %96 = OpVectorShuffle %95 %95 0 1 
					                                       f32_4 %97 = OpImageSampleImplicitLod %94 %96 
					                                       f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
					                                                     OpStore %93 %98 
					                                       f32_3 %99 = OpLoad %37 
					                                      f32_3 %100 = OpFMul %99 %84 
					                                                     OpStore %49 %100 
					                                      f32_3 %102 = OpLoad %93 
					                                      f32_3 %103 = OpFMul %102 %74 
					                                      f32_3 %104 = OpLoad %49 
					                                      f32_3 %105 = OpFAdd %103 %104 
					                                                     OpStore %101 %105 
					                                      f32_3 %106 = OpLoad %43 
					                                      f32_3 %107 = OpFMul %106 %53 
					                                      f32_3 %108 = OpLoad %101 
					                                      f32_3 %109 = OpFAdd %107 %108 
					                                                     OpStore %101 %109 
					                                      f32_3 %110 = OpLoad %72 
					                                      f32_3 %111 = OpLoad %101 
					                                      f32_3 %112 = OpFNegate %111 
					                                      f32_3 %113 = OpFAdd %110 %112 
					                                                     OpStore %72 %113 
					                 read_only Texture2DSampled %115 = OpLoad %114 
					                                      f32_2 %117 = OpLoad %116 
					                                      f32_4 %118 = OpImageSampleImplicitLod %115 %117 
					                                        f32 %119 = OpCompositeExtract %118 0 
					                               Private f32* %120 = OpAccessChain %9 %28 
					                                                     OpStore %120 %119 
					                               Uniform f32* %127 = OpAccessChain %123 %125 %28 
					                                        f32 %128 = OpLoad %127 
					                               Private f32* %129 = OpAccessChain %9 %28 
					                                        f32 %130 = OpLoad %129 
					                                        f32 %131 = OpFMul %128 %130 
					                               Uniform f32* %132 = OpAccessChain %123 %125 %24 
					                                        f32 %133 = OpLoad %132 
					                                        f32 %134 = OpFAdd %131 %133 
					                               Private f32* %135 = OpAccessChain %9 %28 
					                                                     OpStore %135 %134 
					                               Private f32* %136 = OpAccessChain %9 %28 
					                                        f32 %137 = OpLoad %136 
					                                        f32 %138 = OpFDiv %52 %137 
					                               Private f32* %139 = OpAccessChain %32 %28 
					                                                     OpStore %139 %138 
					                 read_only Texture2DSampled %141 = OpLoad %140 
					                                      f32_2 %142 = OpLoad %32 
					                                      f32_4 %143 = OpImageSampleImplicitLod %141 %142 
					                                        f32 %144 = OpCompositeExtract %143 0 
					                               Private f32* %145 = OpAccessChain %93 %28 
					                                                     OpStore %145 %144 
					                                      f32_3 %146 = OpLoad %93 
					                                      f32_3 %147 = OpVectorShuffle %146 %146 0 0 0 
					                                      f32_3 %148 = OpLoad %72 
					                                      f32_3 %149 = OpFMul %147 %148 
					                                      f32_3 %150 = OpLoad %101 
					                                      f32_3 %151 = OpFAdd %149 %150 
					                                                     OpStore %72 %151 
					                                      f32_3 %153 = OpLoad %72 
					                                        f32 %158 = OpDot %153 %157 
					                                                     OpStore %152 %158 
					                                        f32 %159 = OpLoad %152 
					                                      f32_3 %160 = OpCompositeConstruct %159 %159 %159 
					                                      f32_3 %161 = OpFNegate %160 
					                                      f32_3 %162 = OpLoad %72 
					                                      f32_3 %163 = OpFAdd %161 %162 
					                                                     OpStore %72 %163 
					                               Uniform f32* %165 = OpAccessChain %123 %164 
					                                        f32 %166 = OpLoad %165 
					                                      f32_3 %167 = OpCompositeConstruct %166 %166 %166 
					                                      f32_3 %168 = OpLoad %72 
					                                      f32_3 %169 = OpFMul %167 %168 
					                                        f32 %170 = OpLoad %152 
					                                      f32_3 %171 = OpCompositeConstruct %170 %170 %170 
					                                      f32_3 %172 = OpFAdd %169 %171 
					                                      f32_4 %173 = OpLoad %56 
					                                      f32_4 %174 = OpVectorShuffle %173 %172 4 5 6 3 
					                                                     OpStore %56 %174 
					                                                     OpReturn
					                                                     OpFunctionEnd
"
				}
				SubProgram "vulkan hw_tier02 " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 136
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %11 %72 %94 %112 %129 
					                                                      OpDecorate %11 Location 11 
					                                                      OpDecorate %16 ArrayStride 16 
					                                                      OpDecorate %17 ArrayStride 17 
					                                                      OpMemberDecorate %18 0 Offset 18 
					                                                      OpMemberDecorate %18 1 Offset 18 
					                                                      OpMemberDecorate %18 2 Offset 18 
					                                                      OpMemberDecorate %18 3 Offset 18 
					                                                      OpDecorate %18 Block 
					                                                      OpDecorate %20 DescriptorSet 20 
					                                                      OpDecorate %20 Binding 20 
					                                                      OpMemberDecorate %70 0 BuiltIn 70 
					                                                      OpMemberDecorate %70 1 BuiltIn 70 
					                                                      OpMemberDecorate %70 2 BuiltIn 70 
					                                                      OpDecorate %70 Block 
					                                                      OpDecorate %94 RelaxedPrecision 
					                                                      OpDecorate %94 Location 94 
					                                                      OpDecorate %95 RelaxedPrecision 
					                                                      OpDecorate %112 Location 112 
					                                                      OpDecorate %129 Location 129 
					                                                      OpDecorate %130 RelaxedPrecision 
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
					                                              %90 = OpTypeVector %6 2 
					                                              %91 = OpTypePointer Private %90 
					                               Private f32_2* %92 = OpVariable Private 
					                                              %93 = OpTypePointer Input %90 
					                                 Input f32_2* %94 = OpVariable Input 
					                                             %104 = OpTypePointer Private %6 
					                                Private f32* %105 = OpVariable Private 
					                                         f32 %109 = OpConstant 3.674022E-40 
					                                             %111 = OpTypePointer Output %90 
					                               Output f32_2* %112 = OpVariable Output 
					                                             %113 = OpTypePointer Function %6 
					                                             %123 = OpTypePointer Output %6 
					                                         u32 %125 = OpConstant 0 
					                               Output f32_2* %129 = OpVariable Output 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %114 = OpVariable Function 
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
					                                 Uniform f32* %86 = OpAccessChain %20 %44 %68 
					                                          f32 %87 = OpLoad %86 
					                                         bool %89 = OpFOrdLessThan %87 %88 
					                                                      OpStore %84 %89 
					                                        f32_2 %95 = OpLoad %94 
					                               Uniform f32_4* %96 = OpAccessChain %20 %35 
					                                        f32_4 %97 = OpLoad %96 
					                                        f32_2 %98 = OpVectorShuffle %97 %97 0 1 
					                                        f32_2 %99 = OpFMul %95 %98 
					                              Uniform f32_4* %100 = OpAccessChain %20 %35 
					                                       f32_4 %101 = OpLoad %100 
					                                       f32_2 %102 = OpVectorShuffle %101 %101 2 3 
					                                       f32_2 %103 = OpFAdd %99 %102 
					                                                      OpStore %92 %103 
					                                Private f32* %106 = OpAccessChain %92 %68 
					                                         f32 %107 = OpLoad %106 
					                                         f32 %108 = OpFNegate %107 
					                                         f32 %110 = OpFAdd %108 %109 
					                                                      OpStore %105 %110 
					                                        bool %115 = OpLoad %84 
					                                                      OpSelectionMerge %117 None 
					                                                      OpBranchConditional %115 %116 %119 
					                                             %116 = OpLabel 
					                                         f32 %118 = OpLoad %105 
					                                                      OpStore %114 %118 
					                                                      OpBranch %117 
					                                             %119 = OpLabel 
					                                Private f32* %120 = OpAccessChain %92 %68 
					                                         f32 %121 = OpLoad %120 
					                                                      OpStore %114 %121 
					                                                      OpBranch %117 
					                                             %117 = OpLabel 
					                                         f32 %122 = OpLoad %114 
					                                 Output f32* %124 = OpAccessChain %112 %68 
					                                                      OpStore %124 %122 
					                                Private f32* %126 = OpAccessChain %92 %125 
					                                         f32 %127 = OpLoad %126 
					                                 Output f32* %128 = OpAccessChain %112 %125 
					                                                      OpStore %128 %127 
					                                       f32_2 %130 = OpLoad %94 
					                                                      OpStore %129 %130 
					                                 Output f32* %131 = OpAccessChain %72 %22 %68 
					                                         f32 %132 = OpLoad %131 
					                                         f32 %133 = OpFNegate %132 
					                                 Output f32* %134 = OpAccessChain %72 %22 %68 
					                                                      OpStore %134 %133 
					                                                      OpReturn
					                                                      OpFunctionEnd

					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 1
					; Bound: 176
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Fragment %4 "main" %17 %56 %116 
					                                                     OpExecutionMode %4 OriginUpperLeft 
					                                                     OpDecorate %13 RelaxedPrecision 
					                                                     OpDecorate %13 DescriptorSet 13 
					                                                     OpDecorate %13 Binding 13 
					                                                     OpDecorate %14 RelaxedPrecision 
					                                                     OpDecorate %17 Location 17 
					                                                     OpDecorate %20 RelaxedPrecision 
					                                                     OpDecorate %37 RelaxedPrecision 
					                                                     OpDecorate %38 RelaxedPrecision 
					                                                     OpDecorate %38 DescriptorSet 38 
					                                                     OpDecorate %38 Binding 38 
					                                                     OpDecorate %39 RelaxedPrecision 
					                                                     OpDecorate %42 RelaxedPrecision 
					                                                     OpDecorate %43 RelaxedPrecision 
					                                                     OpDecorate %44 RelaxedPrecision 
					                                                     OpDecorate %44 DescriptorSet 44 
					                                                     OpDecorate %44 Binding 44 
					                                                     OpDecorate %45 RelaxedPrecision 
					                                                     OpDecorate %48 RelaxedPrecision 
					                                                     OpDecorate %49 RelaxedPrecision 
					                                                     OpDecorate %50 RelaxedPrecision 
					                                                     OpDecorate %54 RelaxedPrecision 
					                                                     OpDecorate %56 RelaxedPrecision 
					                                                     OpDecorate %56 Location 56 
					                                                     OpDecorate %66 RelaxedPrecision 
					                                                     OpDecorate %67 RelaxedPrecision 
					                                                     OpDecorate %71 RelaxedPrecision 
					                                                     OpDecorate %72 RelaxedPrecision 
					                                                     OpDecorate %73 RelaxedPrecision 
					                                                     OpDecorate %75 RelaxedPrecision 
					                                                     OpDecorate %76 RelaxedPrecision 
					                                                     OpDecorate %77 RelaxedPrecision 
					                                                     OpDecorate %78 RelaxedPrecision 
					                                                     OpDecorate %82 RelaxedPrecision 
					                                                     OpDecorate %83 RelaxedPrecision 
					                                                     OpDecorate %85 RelaxedPrecision 
					                                                     OpDecorate %86 RelaxedPrecision 
					                                                     OpDecorate %87 RelaxedPrecision 
					                                                     OpDecorate %88 RelaxedPrecision 
					                                                     OpDecorate %92 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %94 RelaxedPrecision 
					                                                     OpDecorate %98 RelaxedPrecision 
					                                                     OpDecorate %99 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %102 RelaxedPrecision 
					                                                     OpDecorate %103 RelaxedPrecision 
					                                                     OpDecorate %104 RelaxedPrecision 
					                                                     OpDecorate %105 RelaxedPrecision 
					                                                     OpDecorate %106 RelaxedPrecision 
					                                                     OpDecorate %107 RelaxedPrecision 
					                                                     OpDecorate %108 RelaxedPrecision 
					                                                     OpDecorate %109 RelaxedPrecision 
					                                                     OpDecorate %110 RelaxedPrecision 
					                                                     OpDecorate %111 RelaxedPrecision 
					                                                     OpDecorate %112 RelaxedPrecision 
					                                                     OpDecorate %113 RelaxedPrecision 
					                                                     OpDecorate %114 DescriptorSet 114 
					                                                     OpDecorate %114 Binding 114 
					                                                     OpDecorate %116 Location 116 
					                                                     OpMemberDecorate %121 0 Offset 121 
					                                                     OpMemberDecorate %121 1 RelaxedPrecision 
					                                                     OpMemberDecorate %121 1 Offset 121 
					                                                     OpDecorate %121 Block 
					                                                     OpDecorate %123 DescriptorSet 123 
					                                                     OpDecorate %123 Binding 123 
					                                                     OpDecorate %140 RelaxedPrecision 
					                                                     OpDecorate %140 DescriptorSet 140 
					                                                     OpDecorate %140 Binding 140 
					                                                     OpDecorate %141 RelaxedPrecision 
					                                                     OpDecorate %144 RelaxedPrecision 
					                                                     OpDecorate %146 RelaxedPrecision 
					                                                     OpDecorate %147 RelaxedPrecision 
					                                                     OpDecorate %148 RelaxedPrecision 
					                                                     OpDecorate %149 RelaxedPrecision 
					                                                     OpDecorate %150 RelaxedPrecision 
					                                                     OpDecorate %151 RelaxedPrecision 
					                                                     OpDecorate %152 RelaxedPrecision 
					                                                     OpDecorate %153 RelaxedPrecision 
					                                                     OpDecorate %158 RelaxedPrecision 
					                                                     OpDecorate %159 RelaxedPrecision 
					                                                     OpDecorate %160 RelaxedPrecision 
					                                                     OpDecorate %161 RelaxedPrecision 
					                                                     OpDecorate %162 RelaxedPrecision 
					                                                     OpDecorate %163 RelaxedPrecision 
					                                                     OpDecorate %166 RelaxedPrecision 
					                                                     OpDecorate %167 RelaxedPrecision 
					                                                     OpDecorate %168 RelaxedPrecision 
					                                                     OpDecorate %169 RelaxedPrecision 
					                                                     OpDecorate %170 RelaxedPrecision 
					                                                     OpDecorate %171 RelaxedPrecision 
					                                                     OpDecorate %172 RelaxedPrecision 
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
					                                             %21 = OpTypePointer Private %15 
					                              Private f32_2* %22 = OpVariable Private 
					                                             %23 = OpTypeInt 32 0 
					                                         u32 %24 = OpConstant 1 
					                                             %25 = OpTypePointer Private %6 
					                                         u32 %28 = OpConstant 0 
					                                         f32 %30 = OpConstant 3.674022E-40 
					                              Private f32_2* %32 = OpVariable Private 
					                                         f32 %33 = OpConstant 3.674022E-40 
					                                             %35 = OpTypeVector %6 3 
					                                             %36 = OpTypePointer Private %35 
					                              Private f32_3* %37 = OpVariable Private 
					 UniformConstant read_only Texture2DSampled* %38 = OpVariable UniformConstant 
					                              Private f32_3* %43 = OpVariable Private 
					 UniformConstant read_only Texture2DSampled* %44 = OpVariable UniformConstant 
					                              Private f32_3* %49 = OpVariable Private 
					                                         f32 %51 = OpConstant 3.674022E-40 
					                                         f32 %52 = OpConstant 3.674022E-40 
					                                       f32_3 %53 = OpConstantComposite %51 %51 %52 
					                                             %55 = OpTypePointer Output %7 
					                               Output f32_4* %56 = OpVariable Output 
					                                         u32 %57 = OpConstant 3 
					                                             %60 = OpTypePointer Output %6 
					                                         f32 %62 = OpConstant 3.674022E-40 
					                                         f32 %64 = OpConstant 3.674022E-40 
					                              Private f32_3* %66 = OpVariable Private 
					                              Private f32_3* %72 = OpVariable Private 
					                                       f32_3 %74 = OpConstantComposite %52 %51 %51 
					                                       f32_3 %84 = OpConstantComposite %51 %52 %51 
					                              Private f32_3* %93 = OpVariable Private 
					                             Private f32_3* %101 = OpVariable Private 
					UniformConstant read_only Texture2DSampled* %114 = OpVariable UniformConstant 
					                               Input f32_2* %116 = OpVariable Input 
					                                            %121 = OpTypeStruct %7 %6 
					                                            %122 = OpTypePointer Uniform %121 
					              Uniform struct {f32_4; f32;}* %123 = OpVariable Uniform 
					                                            %124 = OpTypeInt 32 1 
					                                        i32 %125 = OpConstant 0 
					                                            %126 = OpTypePointer Uniform %6 
					UniformConstant read_only Texture2DSampled* %140 = OpVariable UniformConstant 
					                               Private f32* %152 = OpVariable Private 
					                                        f32 %154 = OpConstant 3.674022E-40 
					                                        f32 %155 = OpConstant 3.674022E-40 
					                                        f32 %156 = OpConstant 3.674022E-40 
					                                      f32_3 %157 = OpConstantComposite %154 %155 %156 
					                                        i32 %164 = OpConstant 1 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                  read_only Texture2DSampled %14 = OpLoad %13 
					                                       f32_2 %18 = OpLoad %17 
					                                       f32_4 %19 = OpImageSampleImplicitLod %14 %18 
					                                       f32_4 %20 = OpVectorShuffle %19 %19 0 2 1 3 
					                                                     OpStore %9 %20 
					                                Private f32* %26 = OpAccessChain %9 %24 
					                                         f32 %27 = OpLoad %26 
					                                Private f32* %29 = OpAccessChain %22 %28 
					                                                     OpStore %29 %27 
					                                Private f32* %31 = OpAccessChain %22 %24 
					                                                     OpStore %31 %30 
					                                Private f32* %34 = OpAccessChain %32 %24 
					                                                     OpStore %34 %33 
					                  read_only Texture2DSampled %39 = OpLoad %38 
					                                       f32_2 %40 = OpLoad %22 
					                                       f32_4 %41 = OpImageSampleImplicitLod %39 %40 
					                                       f32_3 %42 = OpVectorShuffle %41 %41 0 1 2 
					                                                     OpStore %37 %42 
					                  read_only Texture2DSampled %45 = OpLoad %44 
					                                       f32_2 %46 = OpLoad %22 
					                                       f32_4 %47 = OpImageSampleImplicitLod %45 %46 
					                                       f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
					                                                     OpStore %43 %48 
					                                       f32_3 %50 = OpLoad %37 
					                                       f32_3 %54 = OpFMul %50 %53 
					                                                     OpStore %49 %54 
					                                Private f32* %58 = OpAccessChain %9 %57 
					                                         f32 %59 = OpLoad %58 
					                                 Output f32* %61 = OpAccessChain %56 %57 
					                                                     OpStore %61 %59 
					                                Private f32* %63 = OpAccessChain %9 %24 
					                                                     OpStore %63 %62 
					                                Private f32* %65 = OpAccessChain %9 %57 
					                                                     OpStore %65 %64 
					                  read_only Texture2DSampled %67 = OpLoad %38 
					                                       f32_4 %68 = OpLoad %9 
					                                       f32_2 %69 = OpVectorShuffle %68 %68 0 1 
					                                       f32_4 %70 = OpImageSampleImplicitLod %67 %69 
					                                       f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
					                                                     OpStore %66 %71 
					                                       f32_3 %73 = OpLoad %66 
					                                       f32_3 %75 = OpFMul %73 %74 
					                                       f32_3 %76 = OpLoad %49 
					                                       f32_3 %77 = OpFAdd %75 %76 
					                                                     OpStore %72 %77 
					                  read_only Texture2DSampled %78 = OpLoad %38 
					                                       f32_4 %79 = OpLoad %9 
					                                       f32_2 %80 = OpVectorShuffle %79 %79 2 3 
					                                       f32_4 %81 = OpImageSampleImplicitLod %78 %80 
					                                       f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
					                                                     OpStore %37 %82 
					                                       f32_3 %83 = OpLoad %37 
					                                       f32_3 %85 = OpFMul %83 %84 
					                                       f32_3 %86 = OpLoad %72 
					                                       f32_3 %87 = OpFAdd %85 %86 
					                                                     OpStore %72 %87 
					                  read_only Texture2DSampled %88 = OpLoad %44 
					                                       f32_4 %89 = OpLoad %9 
					                                       f32_2 %90 = OpVectorShuffle %89 %89 2 3 
					                                       f32_4 %91 = OpImageSampleImplicitLod %88 %90 
					                                       f32_3 %92 = OpVectorShuffle %91 %91 0 1 2 
					                                                     OpStore %37 %92 
					                  read_only Texture2DSampled %94 = OpLoad %44 
					                                       f32_4 %95 = OpLoad %9 
					                                       f32_2 %96 = OpVectorShuffle %95 %95 0 1 
					                                       f32_4 %97 = OpImageSampleImplicitLod %94 %96 
					                                       f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
					                                                     OpStore %93 %98 
					                                       f32_3 %99 = OpLoad %37 
					                                      f32_3 %100 = OpFMul %99 %84 
					                                                     OpStore %49 %100 
					                                      f32_3 %102 = OpLoad %93 
					                                      f32_3 %103 = OpFMul %102 %74 
					                                      f32_3 %104 = OpLoad %49 
					                                      f32_3 %105 = OpFAdd %103 %104 
					                                                     OpStore %101 %105 
					                                      f32_3 %106 = OpLoad %43 
					                                      f32_3 %107 = OpFMul %106 %53 
					                                      f32_3 %108 = OpLoad %101 
					                                      f32_3 %109 = OpFAdd %107 %108 
					                                                     OpStore %101 %109 
					                                      f32_3 %110 = OpLoad %72 
					                                      f32_3 %111 = OpLoad %101 
					                                      f32_3 %112 = OpFNegate %111 
					                                      f32_3 %113 = OpFAdd %110 %112 
					                                                     OpStore %72 %113 
					                 read_only Texture2DSampled %115 = OpLoad %114 
					                                      f32_2 %117 = OpLoad %116 
					                                      f32_4 %118 = OpImageSampleImplicitLod %115 %117 
					                                        f32 %119 = OpCompositeExtract %118 0 
					                               Private f32* %120 = OpAccessChain %9 %28 
					                                                     OpStore %120 %119 
					                               Uniform f32* %127 = OpAccessChain %123 %125 %28 
					                                        f32 %128 = OpLoad %127 
					                               Private f32* %129 = OpAccessChain %9 %28 
					                                        f32 %130 = OpLoad %129 
					                                        f32 %131 = OpFMul %128 %130 
					                               Uniform f32* %132 = OpAccessChain %123 %125 %24 
					                                        f32 %133 = OpLoad %132 
					                                        f32 %134 = OpFAdd %131 %133 
					                               Private f32* %135 = OpAccessChain %9 %28 
					                                                     OpStore %135 %134 
					                               Private f32* %136 = OpAccessChain %9 %28 
					                                        f32 %137 = OpLoad %136 
					                                        f32 %138 = OpFDiv %52 %137 
					                               Private f32* %139 = OpAccessChain %32 %28 
					                                                     OpStore %139 %138 
					                 read_only Texture2DSampled %141 = OpLoad %140 
					                                      f32_2 %142 = OpLoad %32 
					                                      f32_4 %143 = OpImageSampleImplicitLod %141 %142 
					                                        f32 %144 = OpCompositeExtract %143 0 
					                               Private f32* %145 = OpAccessChain %93 %28 
					                                                     OpStore %145 %144 
					                                      f32_3 %146 = OpLoad %93 
					                                      f32_3 %147 = OpVectorShuffle %146 %146 0 0 0 
					                                      f32_3 %148 = OpLoad %72 
					                                      f32_3 %149 = OpFMul %147 %148 
					                                      f32_3 %150 = OpLoad %101 
					                                      f32_3 %151 = OpFAdd %149 %150 
					                                                     OpStore %72 %151 
					                                      f32_3 %153 = OpLoad %72 
					                                        f32 %158 = OpDot %153 %157 
					                                                     OpStore %152 %158 
					                                        f32 %159 = OpLoad %152 
					                                      f32_3 %160 = OpCompositeConstruct %159 %159 %159 
					                                      f32_3 %161 = OpFNegate %160 
					                                      f32_3 %162 = OpLoad %72 
					                                      f32_3 %163 = OpFAdd %161 %162 
					                                                     OpStore %72 %163 
					                               Uniform f32* %165 = OpAccessChain %123 %164 
					                                        f32 %166 = OpLoad %165 
					                                      f32_3 %167 = OpCompositeConstruct %166 %166 %166 
					                                      f32_3 %168 = OpLoad %72 
					                                      f32_3 %169 = OpFMul %167 %168 
					                                        f32 %170 = OpLoad %152 
					                                      f32_3 %171 = OpCompositeConstruct %170 %170 %170 
					                                      f32_3 %172 = OpFAdd %169 %171 
					                                      f32_4 %173 = OpLoad %56 
					                                      f32_4 %174 = OpVectorShuffle %173 %172 4 5 6 3 
					                                                     OpStore %56 %174 
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