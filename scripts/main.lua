display.setStatusBar (display.HiddenStatusBar)

local scriptPlayer = require ("Player")
local scriptInimigo = require ("Inimigo")
local scriptHUD = require ("HUD")
local scriptColetavel = require ("Coletavel")

local physics = require ("physics")
physics.start ()
physics.setGravity (0,9.8)
physics.setDrawMode ("normal")

local bg = display.newImageRect ("imagens/bg.png", 800*0.6, 600*0.6)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

local hud = scriptHUD.novo ()

local chao = display.newImageRect ("imagens/chao.png", 4503/9, 613/9)
chao.x = display.contentCenterX
chao.y = 306
chao.id = "chao"
physics.addBody (chao, "static", {friction = 1, box = {x=0, y=0, halfWidth= 480, halfHeight=40, angle=0}})

local inimigo = scriptInimigo.novo (400, 250)

local player = scriptPlayer.novo (40, 200, hud)

timer.performWithDelay (1000, function () local moeda1 = scriptColetavel.novaMoeda (math.random (0, 480), -100) end, 0, "timerMoeda")