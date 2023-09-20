local scriptPlayer = require ("player")
local perspective = require ("perspective")
local physics = require ("physics")

physics.start ()
physics.setGravity (0, 9.8)
physics.setDrawMode ("hybrid")

local camera = perspective.createView ()
camera:prependLayer () 

display.setStatusBar (display.HiddenStatusBar)

local bg = display.newImageRect ("bg.jpg", 283*6, 200*6)
bg.x, bg.y = display.contentCenterX, display.contentCenterY
camera:add (bg, 8)

local chao = display.newImageRect ("chao.jpg", 600*3, 69*3)
chao.x, chao.y = display.contentCenterX, 700
physics.addBody (chao, "static", {friction=1, box = {x=20, y=0, halfWidth=chao.width/2, halfHeight=chao.height/5}})
camera:add (chao, 7)

for i = 0, 4 do 
    local plataforma = display.newImageRect ("plataforma.png", 920*0.2, 560*0.2)
    plataforma.x = 100
    plataforma.y = 450
    plataforma.alpha = 0.8
    camera:add (plataforma, 7)
    physics.addBody (plataforma, "static", {friction=1})
end

for i = 0, 4 do 
    local plataforma2 = display.newImageRect ("plataforma.png", 920*0.2, 560*0.2)
    plataforma2.x = 400
    plataforma2.y = 360
    plataforma2.alpha = 0.8
    camera:add (plataforma2, 7)
    physics.addBody (plataforma2, "static", {friction=1})
end

for i = 0, 4 do 
    local plataforma3 = display.newImageRect ("plataforma.png", 920*0.2, 560*0.2)
    plataforma3.x = 100
    plataforma3.y = 200
    plataforma3.alpha = 0.8
    camera:add (plataforma3, 7)
    physics.addBody (plataforma3, "static", {friction=1})
end

for i = 0, 4 do 
    local plataforma4 = display.newImageRect ("plataforma.png", 920*0.2, 560*0.2)
    plataforma4.x = 400
    plataforma4.y = 100
    plataforma4.alpha = 0.8
    camera:add (plataforma4, 7)
    physics.addBody (plataforma4, "static", {friction=1})
end

local player = display.newImageRect ("player.png", 294/2.5, 364/2.5)
player.x, player.y = display.contentCenterX, 520
physics.addBody (player, "dynamic", {friction=2, box = {x=0, y=0, halfWidth=30, halfHeight=40, angle=0}})
camera:add (player, 1)
local Teclado = require ("player")


camera:setParallax (1, 0.9, 0.4, 0)

camera.damping = 10
camera:setFocus (player)
camera:track ()