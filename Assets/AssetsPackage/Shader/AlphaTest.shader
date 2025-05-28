Shader "Custom/AlphaTest" {
	Properties {
		_MainColor ("Main Color", Color) = (1, 1, 1, 1)
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TestVal ("Test Value", Range(0, 1)) = 0.5
	}
	SubShader {
		Tags { "Queue" = "Transparent" "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Lambert alphatest:_TestVal

		fixed4 _MainColor;
		sampler2D _MainTex;

		struct Input {
			float2 uv_MainTex;
		};

		void surf (Input IN, inout SurfaceOutput o) {
			half4 c = tex2D (_MainTex, IN.uv_MainTex);
			o.Albedo = _MainColor.rgb * c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}
