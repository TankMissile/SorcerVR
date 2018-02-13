// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.27 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.27;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:True,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True;n:type:ShaderForge.SFN_Final,id:4795,x:34643,y:32696,varname:node_4795,prsc:2|emission-3898-OUT;n:type:ShaderForge.SFN_Tex2d,id:6074,x:31441,y:32813,ptovrint:False,ptlb:maskTex,ptin:_maskTex,varname:_MainTex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:00d1dc61304fe4183bb5dae9ee4dd842,ntxv:0,isnm:False;n:type:ShaderForge.SFN_VertexColor,id:2053,x:34045,y:32813,varname:node_2053,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:880,x:34068,y:32743,ptovrint:False,ptlb:emissive,ptin:_emissive,varname:node_880,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:3898,x:34315,y:32662,varname:node_3898,prsc:2|A-1907-OUT,B-880-OUT,C-2053-RGB,D-673-OUT;n:type:ShaderForge.SFN_Power,id:1567,x:33501,y:33037,varname:node_1567,prsc:2|VAL-4535-A,EXP-9704-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9704,x:33241,y:33052,ptovrint:False,ptlb:alphaDensity,ptin:_alphaDensity,varname:node_9704,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:8940,x:33734,y:33162,ptovrint:False,ptlb:alphaPower,ptin:_alphaPower,varname:node_8940,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:673,x:34045,y:33066,varname:node_673,prsc:2|A-750-OUT,B-8940-OUT,C-9816-OUT,D-2931-OUT;n:type:ShaderForge.SFN_Power,id:1946,x:32130,y:33157,varname:node_1946,prsc:2|VAL-7024-OUT,EXP-854-OUT;n:type:ShaderForge.SFN_Multiply,id:4537,x:32599,y:33466,varname:node_4537,prsc:2|A-1946-OUT,B-854-OUT;n:type:ShaderForge.SFN_VertexColor,id:4031,x:31381,y:33024,varname:node_4031,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:9645,x:31735,y:33415,ptovrint:False,ptlb:dynCorrect,ptin:_dynCorrect,varname:node_9645,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:854,x:31926,y:33362,varname:node_854,prsc:2|A-4031-A,B-9645-OUT;n:type:ShaderForge.SFN_If,id:4651,x:31575,y:33314,varname:node_4651,prsc:2|A-4031-A,B-2861-OUT,GT-4031-A,EQ-4031-A,LT-2861-OUT;n:type:ShaderForge.SFN_Vector1,id:2861,x:31361,y:33240,varname:node_2861,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Tex2d,id:4535,x:33114,y:32584,ptovrint:False,ptlb:baseTex,ptin:_baseTex,varname:node_4535,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:331fbce87b1084596aa97c50f3362199,ntxv:0,isnm:False;n:type:ShaderForge.SFN_SwitchProperty,id:1523,x:33904,y:32471,ptovrint:False,ptlb:useTexColor,ptin:_useTexColor,varname:node_1523,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-4904-OUT,B-4535-RGB;n:type:ShaderForge.SFN_Add,id:321,x:33443,y:32637,varname:node_321,prsc:2|A-4535-R,B-4535-G,C-4535-B;n:type:ShaderForge.SFN_Divide,id:4904,x:33644,y:32637,varname:node_4904,prsc:2|A-321-OUT,B-9557-OUT;n:type:ShaderForge.SFN_Vector1,id:9557,x:33407,y:32784,varname:node_9557,prsc:2,v1:3;n:type:ShaderForge.SFN_Power,id:1907,x:34085,y:32563,varname:node_1907,prsc:2|VAL-1523-OUT,EXP-485-OUT;n:type:ShaderForge.SFN_ValueProperty,id:485,x:33879,y:32715,ptovrint:False,ptlb:texDensity,ptin:_texDensity,varname:node_485,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_DepthBlend,id:2546,x:33536,y:33367,varname:node_2546,prsc:2|DIST-6055-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:9816,x:33701,y:33277,ptovrint:False,ptlb:useDepthBlend,ptin:_useDepthBlend,varname:node_9816,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-1744-OUT,B-2546-OUT;n:type:ShaderForge.SFN_Vector1,id:1744,x:33548,y:33288,varname:node_1744,prsc:2,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:6055,x:33286,y:33344,ptovrint:False,ptlb:depthBlend,ptin:_depthBlend,varname:node_6055,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_SwitchProperty,id:750,x:33764,y:32968,ptovrint:False,ptlb:haveAlpha,ptin:_haveAlpha,varname:node_750,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-9790-OUT,B-1567-OUT;n:type:ShaderForge.SFN_Power,id:9790,x:33577,y:32895,varname:node_9790,prsc:2|VAL-4904-OUT,EXP-9704-OUT;n:type:ShaderForge.SFN_OneMinus,id:7024,x:31732,y:32809,varname:node_7024,prsc:2|IN-6074-RGB;n:type:ShaderForge.SFN_ComponentMask,id:2931,x:33613,y:33604,varname:node_2931,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-1946-OUT;proporder:6074-880-9704-8940-9645-4535-1523-485-9816-6055-750;pass:END;sub:END;*/

Shader "KY/ab_sw_dyn2_two" {
    Properties {
        _maskTex ("maskTex", 2D) = "white" {}
        _emissive ("emissive", Float ) = 1
        _alphaDensity ("alphaDensity", Float ) = 1
        _alphaPower ("alphaPower", Float ) = 1
        _dynCorrect ("dynCorrect", Float ) = 1
        _baseTex ("baseTex", 2D) = "white" {}
        [MaterialToggle] _useTexColor ("useTexColor", Float ) = 0
        _texDensity ("texDensity", Float ) = 1
        [MaterialToggle] _useDepthBlend ("useDepthBlend", Float ) = 1
        _depthBlend ("depthBlend", Float ) = 1
        [MaterialToggle] _haveAlpha ("haveAlpha", Float ) = 0
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One One
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _CameraDepthTexture;
            uniform sampler2D _maskTex; uniform float4 _maskTex_ST;
            uniform float _emissive;
            uniform float _alphaDensity;
            uniform float _alphaPower;
            uniform float _dynCorrect;
            uniform sampler2D _baseTex; uniform float4 _baseTex_ST;
            uniform fixed _useTexColor;
            uniform float _texDensity;
            uniform fixed _useDepthBlend;
            uniform float _depthBlend;
            uniform fixed _haveAlpha;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
                float4 projPos : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos(v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
////// Lighting:
////// Emissive:
                float4 _baseTex_var = tex2D(_baseTex,TRANSFORM_TEX(i.uv0, _baseTex));
                float node_4904 = ((_baseTex_var.r+_baseTex_var.g+_baseTex_var.b)/3.0);
                float4 _maskTex_var = tex2D(_maskTex,TRANSFORM_TEX(i.uv0, _maskTex));
                float node_854 = (i.vertexColor.a*_dynCorrect);
                float3 node_1946 = pow((1.0 - _maskTex_var.rgb),node_854);
                float3 emissive = (pow(lerp( node_4904, _baseTex_var.rgb, _useTexColor ),_texDensity)*_emissive*i.vertexColor.rgb*(lerp( pow(node_4904,_alphaDensity), pow(_baseTex_var.a,_alphaDensity), _haveAlpha )*_alphaPower*lerp( 1.0, saturate((sceneZ-partZ)/_depthBlend), _useDepthBlend )*node_1946.r));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
