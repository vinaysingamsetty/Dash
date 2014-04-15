﻿/**
* TODO
*/
module graphics.shaders.glsl.ambientlight;

package:

/// TODO
immutable string ambientlightVS = q{
#version 400
    
    layout(location = 0) in vec3 vPosition_s;
    layout(location = 1) in vec2 vUV;
    
    out vec4 fPosition_s;
    out vec2 fUV;
    
    void main( void )
    {
        fPosition_s = vec4( vPosition_s, 1.0f );
        gl_Position = fPosition_s;
        fUV = vUV;
    }
};

/// TODO
immutable string ambientlightFS = q{
#version 400

    struct AmbientLight
    {
        vec3 color;
    };

    in vec4 fPosition;
    in vec2 fUV;
    
    // this diffuse should be set to the geometry output
    uniform sampler2D diffuseTexture;
    uniform AmbientLight light;
    
    // https://stackoverflow.com/questions/9222217/how-does-the-fragment-shader-know-what-variable-to-use-for-the-color-of-a-pixel
    out vec4 color;
    
    void main( void )
    {
        color = vec4( light.color * texture( diffuseTexture, fUV ).xyz, 1.0f );
    }
};