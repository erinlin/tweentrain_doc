# tweentrain.start()

|:--|:--|
|Type|    [Function](https://docs.coronalabs.com/api/type/Function.html)|
|Return| none|

## Overview
To start the scheduled transitions. 

## Syntax

    tweentrain.start( target [, iterations]  )

##### target (required)
Table Type. Any object that behaves like a table, for example display objects.

##### iterations (optional)
Number type. Specifies the number of iterations for the set of transitions will repeat. By default, the iteration value is 1.

## Example
    
    local cX, cY = display.contentCenterX, display.contentCenterY
    local label = display.newText( "tweentrain" , cX, cY,  native.systemFontBold , 50)
    tweentrain.set( label,
        { "transition:to", {rotation= 5, transition="outSine", time=150} }, 
        { "transition:to", {rotation=-5, transition="outSine", time=150} },  
        { "transition:to", {rotation=0, transition="outBack", time=200} },  
        -- waits for 300 ms.  
        { "sleep", 300 }
    )  
    -- looping the transitions    
    tweentrain.start( label, 0 )