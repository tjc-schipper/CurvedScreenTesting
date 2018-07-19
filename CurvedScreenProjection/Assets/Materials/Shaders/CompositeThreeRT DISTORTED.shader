// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "CompositeThreeRenderTextures"
{
	Properties
	{
		_Left("Left", 2D) = "white" {}
		_Mid("Mid", 2D) = "white" {}
		_Right("Right", 2D) = "white" {}
		_BarrelDistortion("Barrel Distortion", Range( 0 , 6)) = 4.467494
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

		uniform sampler2D _Left;
		uniform float4 _Left_ST;
		uniform float _BarrelDistortion;
		uniform sampler2D _Mid;
		uniform float4 _Mid_ST;
		uniform sampler2D _Right;
		uniform float4 _Right_ST;


		inline float MyCustomExpression37_g87( float y , float x , float power )
		{
			return y*(1-abs(x)*power);
		}


		inline float MyCustomExpression37_g80( float y , float x , float power )
		{
			return y*(1-abs(x)*power);
		}


		inline float MyCustomExpression37_g77( float y , float x , float power )
		{
			return y*(1-abs(x)*power);
		}


		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Left = i.uv_texcoord * _Left_ST.xy + _Left_ST.zw;
			float2 break4_g33 = uv_Left;
			float temp_output_20_0_g33 = 3.0;
			float2 appendResult9_g33 = (float2(( ( break4_g33.x - ( 0.0 / temp_output_20_0_g33 ) ) * temp_output_20_0_g33 ) , break4_g33.y));
			float2 temp_output_97_0 = appendResult9_g33;
			float2 break5_g87 = ( ( temp_output_97_0 * float2( 2,2 ) ) - float2( -1,-1 ) );
			float y37_g87 = break5_g87.y;
			float x37_g87 = break5_g87.x;
			float power37_g87 = _BarrelDistortion;
			float localMyCustomExpression37_g87 = MyCustomExpression37_g87( y37_g87 , x37_g87 , power37_g87 );
			float2 appendResult30_g87 = (float2(break5_g87.x , localMyCustomExpression37_g87));
			float temp_output_3_0_g84 = temp_output_97_0.x;
			float2 uv_Mid = i.uv_texcoord * _Mid_ST.xy + _Mid_ST.zw;
			float2 break4_g34 = uv_Mid;
			float temp_output_20_0_g34 = 3.0;
			float2 appendResult9_g34 = (float2(( ( break4_g34.x - ( 1.0 / temp_output_20_0_g34 ) ) * temp_output_20_0_g34 ) , break4_g34.y));
			float2 temp_output_95_0 = appendResult9_g34;
			float2 break5_g80 = ( ( temp_output_95_0 * float2( 2,2 ) ) - float2( -1,-1 ) );
			float y37_g80 = break5_g80.y;
			float x37_g80 = break5_g80.x;
			float power37_g80 = _BarrelDistortion;
			float localMyCustomExpression37_g80 = MyCustomExpression37_g80( y37_g80 , x37_g80 , power37_g80 );
			float2 appendResult30_g80 = (float2(break5_g80.x , localMyCustomExpression37_g80));
			float temp_output_3_0_g85 = temp_output_95_0.x;
			float2 uv_Right = i.uv_texcoord * _Right_ST.xy + _Right_ST.zw;
			float2 break4_g32 = uv_Right;
			float temp_output_20_0_g32 = 3.0;
			float2 appendResult9_g32 = (float2(( ( break4_g32.x - ( 2.0 / temp_output_20_0_g32 ) ) * temp_output_20_0_g32 ) , break4_g32.y));
			float2 temp_output_96_0 = appendResult9_g32;
			float2 break5_g77 = ( ( temp_output_96_0 * float2( 2,2 ) ) - float2( -1,-1 ) );
			float y37_g77 = break5_g77.y;
			float x37_g77 = break5_g77.x;
			float power37_g77 = _BarrelDistortion;
			float localMyCustomExpression37_g77 = MyCustomExpression37_g77( y37_g77 , x37_g77 , power37_g77 );
			float2 appendResult30_g77 = (float2(break5_g77.x , localMyCustomExpression37_g77));
			float temp_output_3_0_g86 = temp_output_96_0.x;
			o.Emission = ( ( tex2D( _Left, ( ( appendResult30_g87 + float2( 1,0 ) ) / float2( 2,0 ) ) ) * ( step( 0.0 , temp_output_3_0_g84 ) * step( temp_output_3_0_g84 , 1.0 ) ) ) + ( tex2D( _Mid, ( ( appendResult30_g80 + float2( 1,0 ) ) / float2( 2,0 ) ) ) * ( step( 0.0 , temp_output_3_0_g85 ) * step( temp_output_3_0_g85 , 1.0 ) ) ) + ( tex2D( _Right, ( ( appendResult30_g77 + float2( 1,0 ) ) / float2( 2,0 ) ) ) * ( step( 0.0 , temp_output_3_0_g86 ) * step( temp_output_3_0_g86 , 1.0 ) ) ) ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=15401
595;29;1930;1364;1413.442;-179.726;1.881464;True;True
Node;AmplifyShaderEditor.TexturePropertyNode;69;-1297.172,1649.143;Float;True;Property;_Right;Right;2;0;Create;True;0;0;False;0;3fb4cd7658a84e34a907f209e3d64c5d;3fb4cd7658a84e34a907f209e3d64c5d;False;white;Auto;Texture2D;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.TexturePropertyNode;32;-1284.494,625.6495;Float;True;Property;_Left;Left;0;0;Create;True;0;0;False;0;8ae875d43f66dc8458056f8a02a92e36;8ae875d43f66dc8458056f8a02a92e36;False;white;Auto;Texture2D;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.TexturePropertyNode;63;-1289.964,1161.607;Float;True;Property;_Mid;Mid;1;0;Create;True;0;0;False;0;0a963746043d66b4996b8bf07ad6b7de;0a963746043d66b4996b8bf07ad6b7de;False;white;Auto;Texture2D;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;70;-993.4708,1796.456;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;64;-986.2628,1308.92;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;48;-984.6301,750.4678;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;96;-560,1792;Float;False;OffsetThirdScreenUVs;-1;;32;13771742691a06342a168bcc1e2ae350;0;3;22;FLOAT2;0,0;False;20;FLOAT;3;False;19;FLOAT;2;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;107;-794.8922,1054.297;Float;False;Property;_BarrelDistortion;Barrel Distortion;3;0;Create;True;0;0;False;0;4.467494;0.105;0;6;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;97;-560,752;Float;False;OffsetThirdScreenUVs;-1;;33;13771742691a06342a168bcc1e2ae350;0;3;22;FLOAT2;0,0;False;20;FLOAT;3;False;19;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;95;-544,1312;Float;False;OffsetThirdScreenUVs;-1;;34;13771742691a06342a168bcc1e2ae350;0;3;22;FLOAT2;0,0;False;20;FLOAT;3;False;19;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;111;-43.56857,1242.128;Float;False;BarrelDistort;-1;;80;e8b2af0acac05a84498ed85367803d83;0;2;13;FLOAT;0;False;4;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.BreakToComponentsNode;81;348.2605,886.3819;Float;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.FunctionNode;113;-40.65585,729.5969;Float;False;BarrelDistort;-1;;87;e8b2af0acac05a84498ed85367803d83;0;2;13;FLOAT;0;False;4;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.BreakToComponentsNode;82;345.8499,1434.687;Float;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.BreakToComponentsNode;85;372.116,1919.89;Float;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.FunctionNode;112;-39.20039,1760.484;Float;False;BarrelDistort;-1;;77;e8b2af0acac05a84498ed85367803d83;0;2;13;FLOAT;0;False;4;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;72;347.1058,1653.088;Float;True;Property;_TextureSample2;Texture Sample 2;3;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;102;752.6791,819.811;Float;False;IsBetweenAandB;-1;;84;e1358023165e9bc469472f86fb960a2e;0;3;3;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;46;345.826,622.808;Float;True;Property;_TextureSample0;Texture Sample 0;1;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;65;352.2847,1165.552;Float;True;Property;_TextureSample1;Texture Sample 1;3;0;Create;True;0;0;False;0;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;101;756.5342,1921.319;Float;False;IsBetweenAandB;-1;;86;e1358023165e9bc469472f86fb960a2e;0;3;3;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;100;754.2697,1432.116;Float;False;IsBetweenAandB;-1;;85;e1358023165e9bc469472f86fb960a2e;0;3;3;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;84;1024.232,1168.39;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;87;1023.771,1661.229;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;78;1026.642,625.8123;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;103;1428.207,1149.094;Float;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;6;1882.878,943.0344;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;CompositeThreeRenderTextures;False;False;False;False;True;True;True;True;True;True;True;True;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;False;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;-1;False;-1;-1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;70;2;69;0
WireConnection;64;2;63;0
WireConnection;48;2;32;0
WireConnection;96;22;70;0
WireConnection;97;22;48;0
WireConnection;95;22;64;0
WireConnection;111;13;107;0
WireConnection;111;4;95;0
WireConnection;81;0;97;0
WireConnection;113;13;107;0
WireConnection;113;4;97;0
WireConnection;82;0;95;0
WireConnection;85;0;96;0
WireConnection;112;13;107;0
WireConnection;112;4;96;0
WireConnection;72;0;69;0
WireConnection;72;1;112;0
WireConnection;102;3;81;0
WireConnection;46;0;32;0
WireConnection;46;1;113;0
WireConnection;65;0;63;0
WireConnection;65;1;111;0
WireConnection;101;3;85;0
WireConnection;100;3;82;0
WireConnection;84;0;65;0
WireConnection;84;1;100;0
WireConnection;87;0;72;0
WireConnection;87;1;101;0
WireConnection;78;0;46;0
WireConnection;78;1;102;0
WireConnection;103;0;78;0
WireConnection;103;1;84;0
WireConnection;103;2;87;0
WireConnection;6;2;103;0
ASEEND*/
//CHKSM=51CD617563BE0B0DA47289A82027C152232B4A44