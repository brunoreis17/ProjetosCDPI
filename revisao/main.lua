display.setStatusBar (display.HiddenStatusBar)
local physics = require ("physics")
physics.start ()
physics.setGravity (0, 0)
physics.setDrawMode ("hybrid")

local grupoBg = display.newGroup()
local grupoMain = display.newGroup()
local grupoUI = display.newGroup()

local pontos = 0
local vidas = 5

local bgAudio =  audio.loadStream ("audio/bg.mp3")
audio.reserveChannels (1)
audio.setVolume (0.6, {channel=1})
audio.play (bgAudio, {channel=1, loops=1})


local bg = display.newImageRect (grupoBg, "imagens/back.jpg", 1920/1.8, 1920/1.8)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

local player = display.newImageRect (grupoMain, "imagens/player.png", 350/2, 433/2)
player.x = 120
player.y = 860
physics.addBody (player, "kinematic")
player.myName = "player"

local botaoCima = display.newImageRect ("button.png", 1280/22, 1279/22)
botaoCima.x = 300
botaoCima.y = 980
botaoCima.rotation = -90

local botaoBaixo = display.newImageRect ("button.png", 1280/22, 1279/22)
botaoBaixo.x = 500
botaoBaixo.y = 980
botaoBaixo.rotation = 90

local function cima ()
    player.y = player.y - 10
end

local function baixo ()
    player.y = player.y + 10
end

botaoCima:addEventListener ("touch",cima)
botaoBaixo:addEventListener ("touch", baixo)


local pontosText = display.newText (grupoUI, "Pontos: " .. pontos, 300, 50, native.systemFont, 40)
pontosText:setFillColor (0, 0, 0)

local vidasText = display.newText (grupoUI, "vidas: " .. vidas, 500, 50, native.systemFont, 40)

local botaoCirculo = display.newCircle (grupoMain, 400, 980, 35)
botaoCirculo:setFillColor (1, 0, 0)

local function atirar ()
    local poderPlayer = display.newImageRect (grupoMain, "imagens/poder.jpg", 284/2, 178/2)
    poderPlayer.x = player.x 
    poderPlayer.y = player.y
    local audioFeitico = audio.loadSound ("feitico.mp3")
    local parametros = {time=1000, fadein=200}
    physics.addBody (poderPlayer, "dynamic", {isSensor=true})
    transition.to (poderPlayer, {x=700, time=1000, onComplete = function () display.remove (poderPlayer)
    end})
poderPlayer.myName = "Stupefy"
poderPlayer:toBack ()

end

botaoCirculo:addEventListener ("tap", atirar)

local inimigo = display.newImageRect (grupoMain, "imagens/inimigo.png", 606/5, 1317/5)
inimigo.x = 640
inimigo.y = 860
inimigo.myName = "inimigo"
physics.addBody (inimigo, "kinematic")
local direcaoInimigo = "cima"

local function inimigoAtirar ()
    local poderInimigo = display.newImageRect (grupoMain, "imagens/poder.jpg", 284/4, 178/4)
    poderInimigo.x = inimigo.x - 90
    poderInimigo.y = inimigo.y
    poderInimigo.rotation = 180
    physics.addBody (poderInimigo, "dynamic", {isSensor=true})
    transition.to (poderInimigo, {x=50, time=1000, onComplete = function () display.remove (poderInimigo)
    end})
    poderInimigo.myName = "AvadaKedavra"
end

inimigo.timer = timer.performWithDelay (math.random (1000, 1500), inimigoAtirar, 0)

local function movimentarInimigo ()

    if not (inimigo.x == nil ) then

        if (direcaoInimigo == "cima" ) then 
            inimigo.y = inimigo.y - 2

            if (inimigo.y <= 200 ) then 
                direcaoInimigo = "baixo"
            end

        elseif (direcaoInimigo == "baixo" ) then
            inimigo.y = inimigo.y + 2

            if (inimigo.y >=600 ) then
                direcaoInimigo = "cima"
            end
        end

    else
        print ("inimigo morreu!")

        Runtime:removeEventListener ("enterFrame", movimentarInimigo)
    end
end

Runtime:addEventListener ("enterFrame", movimentarInimigo)

local function onCollision (event)

    if (event.phase == "began" ) then

        local obj1 = event.object1
        local obj2 = event.object2

        if ((obj1.myName == "Stupefy"and obj2.myName == "inimigo") 
        or (obj1.myName == "inimigo" and obj2.myName == "Stupefy") ) 
        then

            if (obj1.myName == "Stupefy") then

                display.remove (obj1)
            else
                display.remove (obj2)
            end
            local audioFeitico = audio.loadSound ("audio/feitico.mp3")
            local parametros = {time=2000, fadein=200}
            audio.play (audioFeitico)
            pontos = pontos + 1
            pontosText.text = "Pontos: " .. pontos

        elseif ((obj1.myName == "AvadaKedavra" and obj2.myName == "player") or (obj1.myName == "player" and obj2.myName == "AvadaKedavra") ) then
            if (obj1.myName == "AvadaKedavra") then
                display.remove (obj1)
            else
                display.remove (obj2)
            end

            vidas = vidas - 1
            vidasText.text = "Vidas: " .. vidas
        end
    end
end

Runtime:addEventListener ("collision", onCollision)