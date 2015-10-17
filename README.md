# TweenTrain Plugin for CoronaSDK

|:--|:--|
|Type|    [Library](https://docs.coronalabs.com/api/type/Library.html)|
|Version| 0.5.0 |
|Platforms| All|
|Download| Waiting for review |


## Overview

The tweentrain plugin is a helper class for [CoronaSDK transition API](https://docs.coronalabs.com/api/library/transition/index.html). It provides to run the scheduled transitions.It also supports the implementation of seting the target's properties and executing it's own functions.

It is controlled by [CoronaSDK transition API](https://docs.coronalabs.com/api/library/transition/index.html). Therefore, free to use `transition.cancel()` to cancel all transitions that executed by tweentrain.

## Syntax

	local tweentrain = require( "plugin.tweentrain" )

## Functions

##### tweentrain.start()
##### tweentrain.set()
##### tweentrain.pause()
##### tweentrain.resume()
##### tweentrain.cancel()

## Project Settings

To use this plugin, add an entry into the plugins table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

	settings =
	{
	    plugins =
	    {
	        ["plugin.tweentrain"] =
	        {
	            publisherId = "com.erinylin"
	        },
	    },      
	}

## Example
	
	-- Load plugin library
	local tweentrain = require "plugin.tweentrain"

	local cX, cY = display.contentCenterX, display.contentCenterY
	local rect = display.newRect( cX, cY, 100, 100 )  
	tweentrain.set( rect,  
	    -- sets target.alpha = 0 
	    { "set", {alpha = 0} }, 
	    -- executes target's setFillColor function  
	    { "func:setFillColor", 1,1,1,1 },  
	    { "transition:fadeIn", {time=300} }, 
	    -- -- next Y value equals target.y-100
	    { "transition:to", {y="-100", transition="inBack", time=300} },  
	    { "func:setFillColor", 1,0,1,1 },  
	    -- -- next Y value equals target.y+100
	    { "transition:to", {y="100", transition="inSine", time=200} },  
	    -- waits for 300 ms.  
	    { "sleep", 300 }
	)  
	-- looping the scheduled transitions  
	tweentrain.start( rect, 0 )

	local label_under = display.newText( "tweentrain" , cX, cY,  native.systemFontBold , 50)
	local label = display.newText( "tweentrain" , cX, cY,  native.systemFontBold , 50)
	tweentrain.set( label,
	    { "transition:to", {rotation= 5, transition="outSine", time=150} }, 
	    { "transition:to", {rotation=-5, transition="outSine", time=150} },  
	    { "transition:to", {rotation=0, transition="outBack", time=200} },  
	    -- waits for 300 ms.  
	    { "sleep", 300 }
	)  
	-- looping the scheduled transitions    
	tweentrain.start( label, 0 )
