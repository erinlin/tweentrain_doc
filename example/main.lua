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
local rect = display.newRect( 0, cY-50, 20, 20 ) 
-------------------------------------
-- reset rect's x
-------------------------------------
function rect:setPosition()
    self.x = self.x % display.contentWidth
end

tweentrain.set( rect,  
    -- executes target's setPosition function  
    { "func:setPosition" },  
    -- sets target.alpha = 0, target.x = target.x + 20
    { "set", {alpha = 0, x="20"} }, 
    -- executes target's setFillColor function  
    { "func:setFillColor", 1,1,1,1 },  
    { "transition:fadeIn", {time=300} }, 
    -- -- next Y value equals target.y-100
    { "transition:to", {y="-100", transition="outSine", time=300} },  
    { "func:setFillColor", 1,0,1,1 },  
    -- -- next Y value equals target.y+100
    { "transition:to", {y="100", transition="inSine", time=200} }, 
    -- waits for 300 ms.  
    { "sleep", 300 }
)  
--looping
tweentrain.start( rect , 0 )

local label_under = display.newText( "tweentrain" , cX, cY,  native.systemFontBold , 50)
local label = display.newText( "tweentrain" , cX, cY,  native.systemFontBold , 50)
tweentrain.set( label,
    { "set", {rotation = 0} }, 
    { "transition:to", {rotation= 360, transition="outBack", time=800} }, 
    { "transition:to", {rotation=300, transition="inBack", time=500} },  
    { "transition:to", {rotation=360, transition="outBounce", time=500} },  
    -- waits for 300 ms.  
    { "sleep", 300 }
)  
-- looping the transitions    
tweentrain.start( label, 0 )

-------------------------------------
-- apply touch event to label 
-------------------------------------
local click_index = 1
label:addEventListener( "touch", function(e)
    if e.phase=="ended" then
        local boo = click_index%2==1
        click_index = click_index + 1
        if boo then
            tweentrain.pause( label )
        else
            tweentrain.resume( label )
        end
    end
end )

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

local rect1 = display.newRect( cX, cY, 10, 10 ) 

rect1:setFillColor(0,1,0,1)

timer.performWithDelay( 800, function()  
    local dic = math.random(-200,200)
    local moveX = math.random(-120,120)
    tweentrain.set( rect1,
        { "transition:to", {y=tostring(dic), x=tostring(moveX)  , transition="outSine", time=400} }, 
        { "transition:to", {y=tostring(-dic), x=tostring(-moveX) , transition="inSine", time=200} }, 
        -- waits for 300 ms.  
        { "sleep", 100 }
    )  
    -- play once the queued up transitions, will auto clear last settings.
    tweentrain.start( rect1 )  
end, 0 )


