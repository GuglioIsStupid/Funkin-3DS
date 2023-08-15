---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Nawias.
--- DateTime: 10.04.2022 16:14
---
dslayout = {}
dslayout.color = {r = 0.2, g = 0.2, b = 0.2, a = 1}
dslayout.title = "3DS Demo"
dslayout.bottomScreen = nil
dslayout.blendMode = love.graphics.getBlendMode()
function dslayout:init(config)
    dslayout.bottomScreen = love.graphics.newCanvas(320,240)
    if(config ~= nil and config.color ~= nil) then
        dslayout.color = config.color
    end
    if(config ~= nil and config.title ~= nil) then
        dslayout.title = config.title
    end
    if(love.window.setTitle ~= nil) then
        love.window.setTitle(dslayout.title)
    end
end
function dslayout:draw(screen, topScreen, bottomScreen)
    if(screen ~= "bottom") then topScreen() end
    if(screen == nil) then
        screen = "dbottom"
        love.graphics.setCanvas(dslayout.bottomScreen)
        love.graphics.clear()
    end
    if(screen == "bottom" or screen == "dbottom") then
        if(screen == "dbottom") then
            dslayout.blendMode = love.graphics.getBlendMode();
            love.graphics.setBlendMode("alpha", "premultiplied")
        end
        bottomScreen() 
    end
    if(screen == "dbottom") then
        local r,g,b,a = love.graphics.getColor()
        love.graphics.setBlendMode(dslayout.blendMode)
        love.graphics.setCanvas()
        love.graphics.draw(dslayout.bottomScreen,40, 240);
        love.graphics.setColor(dslayout.color.r, dslayout.color.g, dslayout.color.b, dslayout.color.a)
        love.graphics.rectangle("fill",0,240,40,240)
        love.graphics.rectangle("fill",360,240,40,240)
        love.graphics.setColor(r,g,b,a)
    end
end

function dslayout:mousemoved(x,y,dx,dy,istouch)
    if(x < 40 or y < 240 or x > 360) then return end
    if(love.mouse ~= nil and not (love.mouse.isDown(1))) then return end
    if(love.touchmoved ~= nil) then love.touchmoved(0,x-40,y-240,dx,dy,1) end
end

function dslayout:mousepressed(x,y,button,istouch,presses)
    if(x < 40 or y < 240 or x > 360) then return end
    if(button ~= 1) then return end
    if(love.touchpressed ~= nil) then love.touchpressed(0,x-40,y-240,0,0,1) end
end
function dslayout:mousereleased(x,y,button,istouch,presses)
    if(x < 40 or y < 240 or x > 360) then return end
    if(button ~= 1) then return end
    if(love.touchreleased ~= nil) then love.touchreleased(0,x-40,y-240,0,0,1) end
end

-- extra ds functions that aren't on love2d normally - Guglio
love.graphics.set3D = love.graphics.set3D or function() end
love.graphics.setScreen = love.graphics.setScreen or function() end
love.graphics.setDepth = love.graphics.setDepth or function() end