﻿Shader "Custom/SimpleLambert" {
	Properties{
		_MainTex("Texture",2D) = "white"

	}
		SubShader{
			Tags { "RenderType" = "Opaque" }
			LOD 200

			CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf SimpleLambert

		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0

		sampler2D _MainTex;

		struct Input {
			float2 uv_MainTex;
		};



		// Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
		// See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
		// #pragma instancing_options assumeuniformscaling
		UNITY_INSTANCING_BUFFER_START(Props)
			// put more per-instance properties here
		UNITY_INSTANCING_BUFFER_END(Props)

		void surf(Input IN, inout SurfaceOutput o) {
			o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
		}

		half4 LightingSimpleLambert(SurfaceOutput s, half3 lightDir,
			half atten)
		{
			half NdotL = dot(s.Normal, lightDir);
			half4	color;

			color.rgb		= s.Albedo * _LightColor0.rgb * (NdotL * atten);
			color.a			= s.Alpha;

			return color;
		}


		ENDCG
	}
	FallBack "Diffuse"
}
