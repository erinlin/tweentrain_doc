# tweentrain.set()
[< BACK](README.md)

|:--|:--|
|Type|    [Function](https://docs.coronalabs.com/api/type/Function.html)|
|Return| none|

## Overview
To schedule transitions. The scheduled data will be cached until  be canceled or be set again.

## Syntax

    tweentrain.set( target , params[, other params,,,] )

##### target (required)
Table type. Any object that behaves like a table, for example display objects.

##### params (required)
Table type. A table that specifies `action syntax` and the properties of the transition, target's properties or paramaters of target's function.
    
    -- Syntax: { "action syntax", param[,,,] }

    -- a string type value for DisplayObject represents the relative position, 
    -- supports to set x, y, xScale, yScale, alpha, width, height and rotation.
    -- Ex. the new value of y equals target.y + 50
    { "transition:to", {y="50", time=300} }

     -- transition paramater also can be set by string type.
    { "transition:to", { x=300, transition="outSine", time=500} }

    -- executes target's setFillColor function
    { "func:setFillColor",1,1,1,1 }

    -- set target.rotation = 120 immediately
    { "set", {rotation = 120} }, 

#### Action Synta
The type of action paramater must be a String.

| Supported Syntax ||
| Syntax | Description |
|:--|:--|
|{ `"transition:to"`, params }| same as transition.* |
|{ `"transition:from"`, params }| same as transition.*  |
|{ `"transition:fadeIn"`, params } | same as transition.* |
|{ `"transition:fadeOut"`, params }| same as transition.* |
|{ `"transition:moveBy"`, params }| same as transition.* |
|{ `"transition:moveTo"`, params }| same as transition.* |
|{ `"transition:scaleBy"`, params }| same as transition.* |
|{ `"transition:scaleTo"`, params }| same as transition.* |
|{ `"func:[function name]"`[, param,,,,] }| executes target's function |
|{ `"sleep"`, ms }| does nothing and waits for next action |
|{ `"set"`, params }| to set target's properties |


## Example
    
    local cX, cY = display.contentCenterX, display.contentCenterY
    local rect = display.newRect( cX, cY, 100, 100 )  
    tweentrain.set( rect,  
        -- set target.alpha = 0 
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
    -- looping the transitions  
    tweentrain.start( rect, 0 )