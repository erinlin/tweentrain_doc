-- 
-- tweentrain Library Plugin Test Project
-- 
-- Sample code is MIT licensed
-- Copyright (C) 2015 Erin Lin. All Rights Reserved.
--
------------------------------------------------------------

-- Load plugin library
local tweentrain = require "plugin.tweentrain"
local cX, cY =  display.contentCenterX, display.contentCenterY
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
-- looping the transitions  
tweentrain.start( rect , 0)

local label_under = display.newText( "tweentrain" , cX, cY,  native.systemFontBold , 50)
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

-- - cumtomed Table  
local K = {}  
local M = {}

function K:sayHello()  
    print("Hello, I am K.")  
end

function M:sayHello()  
    print("Hello everyone, I am M.")  
end

tweentrain.set( K,  
    { "sleep", 500 },  
    { "func:sayHello" }
)
  
tweentrain.set( M,  
    { "sleep", 2000 },  
    { "func:sayHello" }  
)
-- say hello once  
tweentrain.start( K )  
tweentrain.start( M )

timer.performWithDelay( 3000, function()  
    -- run again 
    tweentrain.start(K)
    tweentrain.start(M)  
end )