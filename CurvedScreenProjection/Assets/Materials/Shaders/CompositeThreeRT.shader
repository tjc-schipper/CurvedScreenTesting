// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "CompositeThreeRenderTextures"
{
	Properties
	{
		_RT2("RT2", 2D) = "white" {}
		_RT1("RT1", 2D) = "white" {}
		_RT0("RT0", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha noshadow noambient novertexlights nolightmap  nodynlightmap nodirlightmap nofog nometa noforwardadd 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _RT0;
		uniform float4 _RT0_ST;
		uniform sampler2D _RT1;
		uniform float4 _RT1_ST;
		uniform sampler2D _RT2;
		uniform float4 _RT2_ST;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_RT0 = i.uv_texcoord * _RT0_ST.xy + _RT0_ST.zw;
			float2 break4_g19 = uv_RT0;
			float temp_output_20_0_g19 = 3.0;
			float2 appendResult9_g19 = (float2(( ( break4_g19.x - ( 0.0 / temp_output_20_0_g19 ) ) * temp_output_20_0_g19 ) , break4_g19.y));
			float2 temp_output_97_0 = appendResult9_g19;
			float temp_output_3_0_g22 = temp_output_97_0.x;
			float2 uv_RT1 = i.uv_texcoord * _RT1_ST.xy + _RT1_ST.zw;
			float2 break4_g26 = uv_RT1;
			float temp_output_20_0_g26 = 3.0;
			float2 appendResult9_g26 = (float2(( ( break4_g26.x - ( 1.0 / temp_output_20_0_g26 ) ) * temp_output_20_0_g26 ) , break4_g26.y));
			float2 temp_output_95_0 = appendResult9_g26;
			float temp_output_3_0_g25 = temp_output_95_0.x;
			float2 uv_RT2 = i.uv_texcoord * _RT2_ST.xy + _RT2_ST.zw;
			float2 break4_g24 = uv_RT2;
			float temp_output_20_0_g24 = 3.0;
			float2 appendResult9_g24 = (float2(( ( break4_g24.x - ( 2.0 / temp_output_20_0_g24 ) ) * temp_output_20_0_g24 ) , break4_g24.y));
			float2 temp_output_96_0 = appendResult9_g24;
			float temp_output_3_0_g23 = temp_output_96_0.x;
			o.Emission = ( ( tex2D( _RT0, temp_output_97_0 ) * ( step( 0.0 , temp_output_3_0_g22 ) * step( temp_output_3_0_g22 , 1.0 ) ) ) + ( tex2D( _RT1, temp_output_95_0 ) * ( step( 0.0 , temp_output_3_0_g25 ) * step( temp_output_3_0_g25 , 1.0 ) ) ) + ( tex2D( _RT2, temp_output_96_0 ) * ( step( 0.0 , temp_output_3_0_g23 ) * step( temp_output_3_0_g23 , 1.0 ) ) ) ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15401
23;230;2546;1364;1898.177;-354.524;2.473577;True;True
Node;AmplifyShaderEditor.TexturePropertyNode;69;-695.8212,1647.687;Float;True;Property;_RT2;RT2;0;0;Create;True;0;0;False;0;8ae875d43f66dc8458056f8a02a92e36;8ae875d43f66dc8458056f8a02a92e36;False;white;Auto;Texture2D;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.TexturePropertyNode;32;-683.1436,624.1934;Float;True;Property;_RT0;RT0;2;0;Create;True;0;0;False;0;8ae875d43f66dc8458056f8a02a92e36;8ae875d43f66dc8458056f8a02a92e36;False;white;Auto;Texture2D;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.TexturePropertyNode;63;-688.6133,1160.151;Float;True;Property;_RT1;RT1;1;0;Create;True;0;0;False;0;8ae875d43f66dc8458056f8a02a92e36;8ae875d43f66dc8458056f8a02a92e36;False;white;Auto;Texture2D;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;70;-392.1203,1795;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;64;-384.9123,1307.464;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;48;-383.2795,749.0118;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;97;-91.0686,754.231;Float;False;OffsetThirdScreenUVs;-1;;19;13771742691a06342a168bcc1e2ae350;0;3;22;FLOAT2;0,0;False;20;FLOAT;3;False;19;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;96;-86.81948,1802.26;Float;False;OffsetThirdScreenUVs;-1;;24;13771742691a06342a168bcc1e2ae350;0;3;22;FLOAT2;0,0;False;20;FLOAT;3;False;19;FLOAT;2;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;95;-79.6112,1314.724;Float;False;OffsetThirdScreenUVs;-1;;26;13771742691a06342a168bcc1e2ae350;0;3;22;FLOAT2;0,0;False;20;FLOAT;3;False;19;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.BreakToComponentsNode;85;372.116,1919.89;Float;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.BreakToComponentsNode;81;348.2605,886.3819;Float;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.BreakToComponentsNode;82;345.8499,1434.687;Float;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SamplerNode;72;347.1058,1653.088;Float;True;Property;_TextureSample2;Texture Sample 2;3;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;101;756.5342,1921.319;Float;False;IsBetweenAandB;-1;;23;e1358023165e9bc469472f86fb960a2e;0;3;3;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;100;754.2697,1432.116;Float;False;IsBetweenAandB;-1;;25;e1358023165e9bc469472f86fb960a2e;0;3;3;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;102;752.6791,819.811;Float;False;IsBetweenAandB;-1;;22;e1358023165e9bc469472f86fb960a2e;0;3;3;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;46;345.826,622.808;Float;True;Property;_TextureSample0;Texture Sample 0;1;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;65;352.2847,1165.552;Float;True;Property;_TextureSample1;Texture Sample 1;3;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;87;1023.771,1661.229;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;78;1026.642,625.8123;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;84;1024.232,1168.39;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;103;1428.207,1149.094;Float;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;6;1882.878,943.0344;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;CompositeThreeRenderTextures;False;False;False;False;True;True;True;True;True;True;True;True;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;False;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;70;2;69;0
WireConnection;64;2;63;0
WireConnection;48;2;32;0
WireConnection;97;22;48;0
WireConnection;96;22;70;0
WireConnection;95;22;64;0
WireConnection;85;0;96;0
WireConnection;81;0;97;0
WireConnection;82;0;95;0
WireConnection;72;0;69;0
WireConnection;72;1;96;0
WireConnection;101;3;85;0
WireConnection;100;3;82;0
WireConnection;102;3;81;0
WireConnection;46;0;32;0
WireConnection;46;1;97;0
WireConnection;65;0;63;0
WireConnection;65;1;95;0
WireConnection;87;0;72;0
WireConnection;87;1;101;0
WireConnection;78;0;46;0
WireConnection;78;1;102;0
WireConnection;84;0;65;0
WireConnection;84;1;100;0
WireConnection;103;0;78;0
WireConnection;103;1;84;0
WireConnection;103;2;87;0
WireConnection;6;2;103;0
ASEEND*/
//CHKSM=AA24FDD4A78B1074BB75E142CDEC4ED2896163A5