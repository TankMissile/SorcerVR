// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.29 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.29;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:3,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:2865,x:32719,y:32712,varname:node_2865,prsc:2|diff-513-OUT,spec-358-OUT,gloss-1813-OUT,normal-2556-OUT,emission-7852-OUT;n:type:ShaderForge.SFN_Tex2d,id:7736,x:31139,y:32024,ptovrint:True,ptlb:baseTex,ptin:_MainTex,varname:_MainTex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9c14bf6652f9f478abe665a89169e15d,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:5964,x:31723,y:33129,ptovrint:True,ptlb:Normal Map,ptin:_BumpMap,varname:_BumpMap,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:dcb6f23987bc0460982205ae16b26826,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Slider,id:358,x:32146,y:32740,ptovrint:False,ptlb:Metallic,ptin:_Metallic,varname:node_358,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5441754,max:1;n:type:ShaderForge.SFN_Slider,id:1813,x:32243,y:32924,ptovrint:False,ptlb:Gloss,ptin:_Gloss,varname:_Metallic_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.4920894,max:1;n:type:ShaderForge.SFN_Multiply,id:1359,x:32180,y:33114,varname:node_1359,prsc:2|A-3873-OUT,B-3374-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3374,x:31878,y:33328,ptovrint:False,ptlb:normalPower,ptin:_normalPower,varname:node_3374,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Append,id:6489,x:32384,y:33238,varname:node_6489,prsc:2|A-1359-OUT,B-5964-B;n:type:ShaderForge.SFN_ComponentMask,id:3873,x:31959,y:33034,varname:node_3873,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-5964-RGB;n:type:ShaderForge.SFN_Tex2d,id:3949,x:30679,y:32556,ptovrint:False,ptlb:noise,ptin:_noise,varname:node_3949,prsc:2,glob:False,taghide:True,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:ec847e9f3fa1e4a108edde6736b6ca44,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:1944,x:31503,y:32002,varname:node_1944,prsc:2|A-7739-RGB,B-7736-RGB;n:type:ShaderForge.SFN_Color,id:7739,x:31195,y:31800,ptovrint:False,ptlb:node_7739,ptin:_node_7739,varname:node_7739,prsc:2,glob:False,taghide:True,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.2,c3:0,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:7852,x:32363,y:33057,ptovrint:False,ptlb:emissive,ptin:_emissive,varname:node_7852,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:8920,x:31651,y:32097,varname:node_8920,prsc:2|A-1944-OUT,B-5636-OUT;n:type:ShaderForge.SFN_Vector1,id:5636,x:31157,y:32214,varname:node_5636,prsc:2,v1:1.6;n:type:ShaderForge.SFN_NormalBlend,id:2556,x:32449,y:33400,varname:node_2556,prsc:2|BSE-6489-OUT,DTL-2131-OUT;n:type:ShaderForge.SFN_Tex2d,id:5152,x:31725,y:33458,ptovrint:False,ptlb:noramal2,ptin:_noramal2,varname:node_5152,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:544b08c66409e4049a8762793d0e6a0f,ntxv:3,isnm:True;n:type:ShaderForge.SFN_ComponentMask,id:9805,x:31945,y:33458,varname:node_9805,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-5152-RGB;n:type:ShaderForge.SFN_Multiply,id:8553,x:32138,y:33458,varname:node_8553,prsc:2|A-9805-OUT,B-503-OUT;n:type:ShaderForge.SFN_ValueProperty,id:503,x:31879,y:33628,ptovrint:False,ptlb:normalPower2,ptin:_normalPower2,varname:node_503,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:10;n:type:ShaderForge.SFN_Append,id:2131,x:32300,y:33541,varname:node_2131,prsc:2|A-8553-OUT,B-5152-B;n:type:ShaderForge.SFN_Tex2d,id:2180,x:31092,y:32957,ptovrint:False,ptlb:node_2180,ptin:_node_2180,varname:node_2180,prsc:2,glob:False,taghide:True,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0b365c3f883d54bbf8994ed5f1b892b9,ntxv:0,isnm:False|UVIN-729-OUT;n:type:ShaderForge.SFN_TexCoord,id:3575,x:30582,y:32866,varname:node_3575,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:729,x:30905,y:32957,varname:node_729,prsc:2|A-3575-UVOUT,B-4049-OUT;n:type:ShaderForge.SFN_Tex2d,id:921,x:30182,y:32836,ptovrint:False,ptlb:node_921,ptin:_node_921,varname:node_921,prsc:2,glob:False,taghide:True,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:dcb6f23987bc0460982205ae16b26826,ntxv:3,isnm:True|UVIN-8511-UVOUT;n:type:ShaderForge.SFN_Panner,id:8511,x:29954,y:32815,varname:node_8511,prsc:2,spu:0,spv:0.02|UVIN-170-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:170,x:29709,y:32798,varname:node_170,prsc:2,uv:0;n:type:ShaderForge.SFN_Tex2d,id:8617,x:30182,y:33027,ptovrint:False,ptlb:node_8617,ptin:_node_8617,varname:node_8617,prsc:2,glob:False,taghide:True,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:dcb6f23987bc0460982205ae16b26826,ntxv:3,isnm:True|UVIN-3898-UVOUT;n:type:ShaderForge.SFN_Panner,id:3898,x:29938,y:33027,varname:node_3898,prsc:2,spu:-0.02,spv:0.05|UVIN-170-UVOUT;n:type:ShaderForge.SFN_Panner,id:7441,x:29913,y:33212,varname:node_7441,prsc:2,spu:0.03,spv:-0.03|UVIN-170-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:5202,x:30201,y:33256,ptovrint:False,ptlb:node_5202,ptin:_node_5202,varname:node_5202,prsc:2,glob:False,taghide:True,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:dcb6f23987bc0460982205ae16b26826,ntxv:3,isnm:True|UVIN-7441-UVOUT;n:type:ShaderForge.SFN_Add,id:3293,x:30377,y:32933,varname:node_3293,prsc:2|A-921-RGB,B-8617-RGB;n:type:ShaderForge.SFN_Add,id:8045,x:30499,y:33122,varname:node_8045,prsc:2|A-3293-OUT,B-5202-RGB;n:type:ShaderForge.SFN_Divide,id:6940,x:30673,y:33122,varname:node_6940,prsc:2|A-8045-OUT,B-9517-OUT;n:type:ShaderForge.SFN_Vector1,id:9517,x:30480,y:33288,varname:node_9517,prsc:2,v1:2;n:type:ShaderForge.SFN_ComponentMask,id:4049,x:30844,y:33148,varname:node_4049,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-6940-OUT;n:type:ShaderForge.SFN_Multiply,id:6386,x:31294,y:32993,varname:node_6386,prsc:2|A-2180-R,B-4049-OUT;n:type:ShaderForge.SFN_Power,id:1353,x:31476,y:32993,varname:node_1353,prsc:2|VAL-6386-OUT,EXP-5968-OUT;n:type:ShaderForge.SFN_Multiply,id:4584,x:31723,y:32929,varname:node_4584,prsc:2|A-1353-OUT,B-4456-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5968,x:31252,y:33186,ptovrint:False,ptlb:fireDensity,ptin:_fireDensity,varname:node_5968,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.9;n:type:ShaderForge.SFN_ValueProperty,id:4456,x:31428,y:33196,ptovrint:False,ptlb:firePower,ptin:_firePower,varname:node_4456,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:15;n:type:ShaderForge.SFN_Multiply,id:8815,x:31841,y:32806,varname:node_8815,prsc:2|A-3894-RGB,B-4584-OUT;n:type:ShaderForge.SFN_Color,id:3894,x:31563,y:32705,ptovrint:False,ptlb:node_3894,ptin:_node_3894,varname:node_3894,prsc:2,glob:False,taghide:True,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:30,c2:2,c3:0,c4:1;n:type:ShaderForge.SFN_Power,id:5353,x:31159,y:32681,varname:node_5353,prsc:2|VAL-1080-OUT,EXP-8714-OUT;n:type:ShaderForge.SFN_Multiply,id:1080,x:30955,y:32681,varname:node_1080,prsc:2|A-3949-R,B-5574-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5574,x:30748,y:32788,ptovrint:False,ptlb:fireRange,ptin:_fireRange,varname:node_5574,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_ValueProperty,id:8714,x:30905,y:32843,ptovrint:False,ptlb:fireRangePower,ptin:_fireRangePower,varname:node_8714,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:50;n:type:ShaderForge.SFN_Lerp,id:513,x:31952,y:32586,varname:node_513,prsc:2|A-8920-OUT,B-8815-OUT,T-5353-OUT;proporder:5964-7736-358-1813-3374-3949-7739-7852-5152-503-2180-921-8617-5202-5968-4456-3894-5574-8714;pass:END;sub:END;*/

Shader "KY/lit_meteoB" {
    Properties {
        _BumpMap ("Normal Map", 2D) = "bump" {}
        _MainTex ("baseTex", 2D) = "white" {}
        _Metallic ("Metallic", Range(0, 1)) = 0.5441754
        _Gloss ("Gloss", Range(0, 1)) = 0.4920894
        _normalPower ("normalPower", Float ) = 2
        [HideInInspector]_noise ("noise", 2D) = "white" {}
        [HideInInspector]_node_7739 ("node_7739", Color) = (0.5,0.2,0,1)
        _emissive ("emissive", Float ) = 0
        _noramal2 ("noramal2", 2D) = "bump" {}
        _normalPower2 ("normalPower2", Float ) = 10
        [HideInInspector]_node_2180 ("node_2180", 2D) = "white" {}
        [HideInInspector]_node_921 ("node_921", 2D) = "bump" {}
        [HideInInspector]_node_8617 ("node_8617", 2D) = "bump" {}
        [HideInInspector]_node_5202 ("node_5202", 2D) = "bump" {}
        _fireDensity ("fireDensity", Float ) = 0.9
        _firePower ("firePower", Float ) = 15
        [HideInInspector]_node_3894 ("node_3894", Color) = (30,2,0,1)
        _fireRange ("fireRange", Float ) = 2
        _fireRangePower ("fireRangePower", Float ) = 50
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _BumpMap; uniform float4 _BumpMap_ST;
            uniform float _Metallic;
            uniform float _Gloss;
            uniform float _normalPower;
            uniform sampler2D _noise; uniform float4 _noise_ST;
            uniform float4 _node_7739;
            uniform float _emissive;
            uniform sampler2D _noramal2; uniform float4 _noramal2_ST;
            uniform float _normalPower2;
            uniform sampler2D _node_2180; uniform float4 _node_2180_ST;
            uniform sampler2D _node_921; uniform float4 _node_921_ST;
            uniform sampler2D _node_8617; uniform float4 _node_8617_ST;
            uniform sampler2D _node_5202; uniform float4 _node_5202_ST;
            uniform float _fireDensity;
            uniform float _firePower;
            uniform float4 _node_3894;
            uniform float _fireRange;
            uniform float _fireRangePower;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                LIGHTING_COORDS(7,8)
                #if defined(LIGHTMAP_ON) || defined(UNITY_SHOULD_SAMPLE_SH)
                    float4 ambientOrLightmapUV : TEXCOORD9;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                #ifdef LIGHTMAP_ON
                    o.ambientOrLightmapUV.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    o.ambientOrLightmapUV.zw = 0;
                #elif UNITY_SHOULD_SAMPLE_SH
                #endif
                #ifdef DYNAMICLIGHTMAP_ON
                    o.ambientOrLightmapUV.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
                #endif
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _BumpMap_var = UnpackNormal(tex2D(_BumpMap,TRANSFORM_TEX(i.uv0, _BumpMap)));
                float3 _noramal2_var = UnpackNormal(tex2D(_noramal2,TRANSFORM_TEX(i.uv0, _noramal2)));
                float3 node_2556_nrm_base = float3((_BumpMap_var.rgb.rg*_normalPower),_BumpMap_var.b) + float3(0,0,1);
                float3 node_2556_nrm_detail = float3((_noramal2_var.rgb.rg*_normalPower2),_noramal2_var.b) * float3(-1,-1,1);
                float3 node_2556_nrm_combined = node_2556_nrm_base*dot(node_2556_nrm_base, node_2556_nrm_detail)/node_2556_nrm_base.z - node_2556_nrm_detail;
                float3 node_2556 = node_2556_nrm_combined;
                float3 normalLocal = node_2556;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float gloss = _Gloss;
                float specPow = exp2( gloss * 10.0+1.0);
/////// GI Data:
                UnityLight light;
                #ifdef LIGHTMAP_OFF
                    light.color = lightColor;
                    light.dir = lightDirection;
                    light.ndotl = LambertTerm (normalDirection, light.dir);
                #else
                    light.color = half3(0.f, 0.f, 0.f);
                    light.ndotl = 0.0f;
                    light.dir = half3(0.f, 0.f, 0.f);
                #endif
                UnityGIInput d;
                d.light = light;
                d.worldPos = i.posWorld.xyz;
                d.worldViewDir = viewDirection;
                d.atten = attenuation;
                #if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
                    d.ambient = 0;
                    d.lightmapUV = i.ambientOrLightmapUV;
                #else
                    d.ambient = i.ambientOrLightmapUV;
                #endif
                d.boxMax[0] = unity_SpecCube0_BoxMax;
                d.boxMin[0] = unity_SpecCube0_BoxMin;
                d.probePosition[0] = unity_SpecCube0_ProbePosition;
                d.probeHDR[0] = unity_SpecCube0_HDR;
                d.boxMax[1] = unity_SpecCube1_BoxMax;
                d.boxMin[1] = unity_SpecCube1_BoxMin;
                d.probePosition[1] = unity_SpecCube1_ProbePosition;
                d.probeHDR[1] = unity_SpecCube1_HDR;
                Unity_GlossyEnvironmentData ugls_en_data;
                ugls_en_data.roughness = 1.0 - gloss;
                ugls_en_data.reflUVW = viewReflectDirection;
                UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data );
                lightDirection = gi.light.dir;
                lightColor = gi.light.color;
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float LdotH = max(0.0,dot(lightDirection, halfDirection));
                float3 specularColor = _Metallic;
                float specularMonochrome;
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float4 node_3378 = _Time + _TimeEditor;
                float2 node_8511 = (i.uv0+node_3378.g*float2(0,0.02));
                float3 _node_921_var = UnpackNormal(tex2D(_node_921,TRANSFORM_TEX(node_8511, _node_921)));
                float2 node_3898 = (i.uv0+node_3378.g*float2(-0.02,0.05));
                float3 _node_8617_var = UnpackNormal(tex2D(_node_8617,TRANSFORM_TEX(node_3898, _node_8617)));
                float2 node_7441 = (i.uv0+node_3378.g*float2(0.03,-0.03));
                float3 _node_5202_var = UnpackNormal(tex2D(_node_5202,TRANSFORM_TEX(node_7441, _node_5202)));
                float node_4049 = (((_node_921_var.rgb+_node_8617_var.rgb)+_node_5202_var.rgb)/2.0).r;
                float2 node_729 = (i.uv0+node_4049);
                float4 _node_2180_var = tex2D(_node_2180,TRANSFORM_TEX(node_729, _node_2180));
                float4 _noise_var = tex2D(_noise,TRANSFORM_TEX(i.uv0, _noise));
                float3 diffuseColor = lerp(((_node_7739.rgb*_MainTex_var.rgb)*1.6),(_node_3894.rgb*(pow((_node_2180_var.r*node_4049),_fireDensity)*_firePower)),pow((_noise_var.r*_fireRange),_fireRangePower)); // Need this for specular when using metallic
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, specularColor, specularColor, specularMonochrome );
                specularMonochrome = 1.0-specularMonochrome;
                float NdotV = max(0.0,dot( normalDirection, viewDirection ));
                float NdotH = max(0.0,dot( normalDirection, halfDirection ));
                float VdotH = max(0.0,dot( viewDirection, halfDirection ));
                float visTerm = SmithJointGGXVisibilityTerm( NdotL, NdotV, 1.0-gloss );
                float normTerm = max(0.0, GGXTerm(NdotH, 1.0-gloss));
                float specularPBL = (NdotL*visTerm*normTerm) * (UNITY_PI / 4);
                if (IsGammaSpace())
                    specularPBL = sqrt(max(1e-4h, specularPBL));
                specularPBL = max(0, specularPBL * NdotL);
                float3 directSpecular = (floor(attenuation) * _LightColor0.xyz)*specularPBL*FresnelTerm(specularColor, LdotH);
                half grazingTerm = saturate( gloss + specularMonochrome );
                float3 indirectSpecular = (gi.indirect.specular);
                indirectSpecular *= FresnelLerp (specularColor, grazingTerm, NdotV);
                float3 specular = (directSpecular + indirectSpecular);
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float nlPow5 = Pow5(1-NdotL);
                float nvPow5 = Pow5(1-NdotV);
                float3 directDiffuse = ((1 +(fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += gi.indirect.diffuse;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float3 emissive = float3(_emissive,_emissive,_emissive);
/// Final Color:
                float3 finalColor = diffuse + specular + emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _BumpMap; uniform float4 _BumpMap_ST;
            uniform float _Metallic;
            uniform float _Gloss;
            uniform float _normalPower;
            uniform sampler2D _noise; uniform float4 _noise_ST;
            uniform float4 _node_7739;
            uniform float _emissive;
            uniform sampler2D _noramal2; uniform float4 _noramal2_ST;
            uniform float _normalPower2;
            uniform sampler2D _node_2180; uniform float4 _node_2180_ST;
            uniform sampler2D _node_921; uniform float4 _node_921_ST;
            uniform sampler2D _node_8617; uniform float4 _node_8617_ST;
            uniform sampler2D _node_5202; uniform float4 _node_5202_ST;
            uniform float _fireDensity;
            uniform float _firePower;
            uniform float4 _node_3894;
            uniform float _fireRange;
            uniform float _fireRangePower;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                LIGHTING_COORDS(7,8)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _BumpMap_var = UnpackNormal(tex2D(_BumpMap,TRANSFORM_TEX(i.uv0, _BumpMap)));
                float3 _noramal2_var = UnpackNormal(tex2D(_noramal2,TRANSFORM_TEX(i.uv0, _noramal2)));
                float3 node_2556_nrm_base = float3((_BumpMap_var.rgb.rg*_normalPower),_BumpMap_var.b) + float3(0,0,1);
                float3 node_2556_nrm_detail = float3((_noramal2_var.rgb.rg*_normalPower2),_noramal2_var.b) * float3(-1,-1,1);
                float3 node_2556_nrm_combined = node_2556_nrm_base*dot(node_2556_nrm_base, node_2556_nrm_detail)/node_2556_nrm_base.z - node_2556_nrm_detail;
                float3 node_2556 = node_2556_nrm_combined;
                float3 normalLocal = node_2556;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float gloss = _Gloss;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float LdotH = max(0.0,dot(lightDirection, halfDirection));
                float3 specularColor = _Metallic;
                float specularMonochrome;
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float4 node_360 = _Time + _TimeEditor;
                float2 node_8511 = (i.uv0+node_360.g*float2(0,0.02));
                float3 _node_921_var = UnpackNormal(tex2D(_node_921,TRANSFORM_TEX(node_8511, _node_921)));
                float2 node_3898 = (i.uv0+node_360.g*float2(-0.02,0.05));
                float3 _node_8617_var = UnpackNormal(tex2D(_node_8617,TRANSFORM_TEX(node_3898, _node_8617)));
                float2 node_7441 = (i.uv0+node_360.g*float2(0.03,-0.03));
                float3 _node_5202_var = UnpackNormal(tex2D(_node_5202,TRANSFORM_TEX(node_7441, _node_5202)));
                float node_4049 = (((_node_921_var.rgb+_node_8617_var.rgb)+_node_5202_var.rgb)/2.0).r;
                float2 node_729 = (i.uv0+node_4049);
                float4 _node_2180_var = tex2D(_node_2180,TRANSFORM_TEX(node_729, _node_2180));
                float4 _noise_var = tex2D(_noise,TRANSFORM_TEX(i.uv0, _noise));
                float3 diffuseColor = lerp(((_node_7739.rgb*_MainTex_var.rgb)*1.6),(_node_3894.rgb*(pow((_node_2180_var.r*node_4049),_fireDensity)*_firePower)),pow((_noise_var.r*_fireRange),_fireRangePower)); // Need this for specular when using metallic
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, specularColor, specularColor, specularMonochrome );
                specularMonochrome = 1.0-specularMonochrome;
                float NdotV = max(0.0,dot( normalDirection, viewDirection ));
                float NdotH = max(0.0,dot( normalDirection, halfDirection ));
                float VdotH = max(0.0,dot( viewDirection, halfDirection ));
                float visTerm = SmithJointGGXVisibilityTerm( NdotL, NdotV, 1.0-gloss );
                float normTerm = max(0.0, GGXTerm(NdotH, 1.0-gloss));
                float specularPBL = (NdotL*visTerm*normTerm) * (UNITY_PI / 4);
                if (IsGammaSpace())
                    specularPBL = sqrt(max(1e-4h, specularPBL));
                specularPBL = max(0, specularPBL * NdotL);
                float3 directSpecular = attenColor*specularPBL*FresnelTerm(specularColor, LdotH);
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float nlPow5 = Pow5(1-NdotL);
                float nvPow5 = Pow5(1-NdotV);
                float3 directDiffuse = ((1 +(fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL) * attenColor;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
        Pass {
            Name "Meta"
            Tags {
                "LightMode"="Meta"
            }
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_META 1
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #include "UnityMetaPass.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _Metallic;
            uniform float _Gloss;
            uniform sampler2D _noise; uniform float4 _noise_ST;
            uniform float4 _node_7739;
            uniform float _emissive;
            uniform sampler2D _node_2180; uniform float4 _node_2180_ST;
            uniform sampler2D _node_921; uniform float4 _node_921_ST;
            uniform sampler2D _node_8617; uniform float4 _node_8617_ST;
            uniform sampler2D _node_5202; uniform float4 _node_5202_ST;
            uniform float _fireDensity;
            uniform float _firePower;
            uniform float4 _node_3894;
            uniform float _fireRange;
            uniform float _fireRangePower;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST );
                return o;
            }
            float4 frag(VertexOutput i) : SV_Target {
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                UnityMetaInput o;
                UNITY_INITIALIZE_OUTPUT( UnityMetaInput, o );
                
                o.Emission = float3(_emissive,_emissive,_emissive);
                
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float4 node_3460 = _Time + _TimeEditor;
                float2 node_8511 = (i.uv0+node_3460.g*float2(0,0.02));
                float3 _node_921_var = UnpackNormal(tex2D(_node_921,TRANSFORM_TEX(node_8511, _node_921)));
                float2 node_3898 = (i.uv0+node_3460.g*float2(-0.02,0.05));
                float3 _node_8617_var = UnpackNormal(tex2D(_node_8617,TRANSFORM_TEX(node_3898, _node_8617)));
                float2 node_7441 = (i.uv0+node_3460.g*float2(0.03,-0.03));
                float3 _node_5202_var = UnpackNormal(tex2D(_node_5202,TRANSFORM_TEX(node_7441, _node_5202)));
                float node_4049 = (((_node_921_var.rgb+_node_8617_var.rgb)+_node_5202_var.rgb)/2.0).r;
                float2 node_729 = (i.uv0+node_4049);
                float4 _node_2180_var = tex2D(_node_2180,TRANSFORM_TEX(node_729, _node_2180));
                float4 _noise_var = tex2D(_noise,TRANSFORM_TEX(i.uv0, _noise));
                float3 diffColor = lerp(((_node_7739.rgb*_MainTex_var.rgb)*1.6),(_node_3894.rgb*(pow((_node_2180_var.r*node_4049),_fireDensity)*_firePower)),pow((_noise_var.r*_fireRange),_fireRangePower));
                float specularMonochrome;
                float3 specColor;
                diffColor = DiffuseAndSpecularFromMetallic( diffColor, _Metallic, specColor, specularMonochrome );
                float roughness = 1.0 - _Gloss;
                o.Albedo = diffColor + specColor * roughness * roughness * 0.5;
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
