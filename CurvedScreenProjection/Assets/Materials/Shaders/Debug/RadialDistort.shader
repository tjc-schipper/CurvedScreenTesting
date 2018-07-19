// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "RadialDistort"
{
	Properties
	{
		_InputTexture("Input Texture", 2D) = "white" {}
		_Distortion("Distortion", Range( 0 , 1)) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha noshadow 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _InputTexture;
		uniform float4 _InputTexture_ST;
		uniform float _Distortion;


		inline float MyCustomExpression37_g4( float y , float x , float power )
		{
			return y*(1-abs(x)*power);
		}


		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_InputTexture = i.uv_texcoord * _InputTexture_ST.xy + _InputTexture_ST.zw;
			float2 break5_g4 = ( ( uv_InputTexture * float2( 2,2 ) ) - float2( 1,1 ) );
			float y37_g4 = break5_g4.y;
			float x37_g4 = break5_g4.x;
			float power37_g4 = _Distortion;
			float localMyCustomExpression37_g4 = MyCustomExpression37_g4( y37_g4 , x37_g4 , power37_g4 );
			float2 appendResult30_g4 = (float2(break5_g4.x , localMyCustomExpression37_g4));
			o.Emission = tex2D( _InputTexture, appendResult30_g4 ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15401
47;29;1930;1364;1329;468;1;True;True
Node;AmplifyShaderEditor.TexturePropertyNode;6;-1455,-20;Float;True;Property;_InputTexture;Input Texture;0;0;Create;True;0;0;False;0;9dfcbafc0cb387540b0479f17afc3de3;9dfcbafc0cb387540b0479f17afc3de3;False;white;Auto;Texture2D;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.RangedFloatNode;9;-839,-272;Float;False;Property;_Distortion;Distortion;1;0;Create;True;0;0;False;0;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;4;-1206,-187;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;12;-541,-192;Float;False;BarrelDistort;-1;;4;e8b2af0acac05a84498ed85367803d83;0;2;13;FLOAT;0;False;4;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;5;-270,-28;Float;True;Property;_TextureSample0;Texture Sample 0;1;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;163,-68;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;RadialDistort;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;False;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;4;2;6;0
WireConnection;12;13;9;0
WireConnection;12;4;4;0
WireConnection;5;0;6;0
WireConnection;5;1;12;0
WireConnection;0;2;5;0
ASEEND*/
//CHKSM=BBBDE1578AEA99BE10CB7FEEBFA1D09BCB932100