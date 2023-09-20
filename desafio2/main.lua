display.setStatusBar (display.HiddenStatusBar)
local physics = require ("physics")
physics.start ()
physics.setGravity (0, 0)
physics.setDrawMode ("normal")

local grupoBg = display.newGroup()
local grupoMain = display.newGroup()
local grupoUI = display.newGroup()

local pontos = 0
local vidas = 10


local bg = display.newImageRect (grupoBg, "bg.jpeg", 1920/1, 1080/1)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

local player = display.newImageRect (grupoMain, "player.png", 600/3.5, 750/3.5)
player.x = 120
player.y = 700
physics.addBody (player, "kinematic")
player.myName = "player"

local botaoEsquerdo = display.newImageRect ("button.png", 1280/22, 1279/22)
botaoEsquerdo.x = 100
botaoEsquerdo.y = 950
botaoEsquerdo.rotation = 180
local botaoDireito = display.newImageRect ("button.png", 1280/22, 1279/22)
botaoDireito.x = 260
botaoDireito.y = 950
botaoDireito.rotation = 0

local botaoCima = display.newImageRect ("button.png", 1280/22, 1279/22)
botaoCima.x = 180
botaoCima.y = 900
botaoCima.rotation = -90

local botaoBaixo = display.newImageRect ("button.png", 1280/22, 1279/22)
botaoBaixo.x = 180
botaoBaixo.y = 990
botaoBaixo.rotation = 90

local function cima ()
    player.y = player.y - 4
end

local function baixo ()
    player.y = player.y + 4
end

botaoCima:addEventListener ("touch",cima)
botaoBaixo:addEventListener ("touch",baixo)

local function esquerdo ()
    player.x = player.x - 4
end

local function direito ()
    player.x = player.x + 4
end

botaoEsquerdo:addEventListener ("touch",esquerdo)
botaoDireito:addEventListener ("touch",direito)

local pontosText = display.newText (grupoUI, "Pontos: " .. pontos, 200, 50, native.systemFont, 35)
pontosText:setFillColor (0, 255, 1)

local vidasText = display.newText (grupoUI, "vidas: " .. vidas, 500, 50, native.systemFont, 40)

local botaoCirculo = display.newCircle (grupoMain, 390, 980, 30)
botaoCirculo:setFillColor (1, 0, 0)

local function atirar ()
    local poderPlayer = display.newImageRect (grupoMain, "poder.jpg", 290/3.5, 174/3.5)
    poderPlayer.x = player.x 
    poderPlayer.y = player.y
    physics.addBody (poderPlayer, "dynamic", {isSensor=true})
    transition.to (poderPlayer, {x=700, y=700, time=900, onComplete = function () display.remove (poderPlayer)
    end})
poderPlayer.myName = "Laser"
poderPlayer:toBack ()
end

botaoCirculo:addEventListener ("tap", atirar)

local inimigo = display.newImageRect (grupoMain, "inimigo.png", 600/3.5, 750/3.5)
inimigo.x = 640
inimigo.y = 700
inimigo.myName = "inimigo"
physics.addBody (inimigo, "kinematic")
local direcaoInimigo = "esquerda"

local function inimigoAtirar ()
    local poderInimigo = display.newImageRect (grupoMain, "poder.jpg", 290/3.5,174/3.5)
    poderInimigo.x = inimigo.x 
    poderInimigo.y = inimigo.y
    physics.addBody (poderInimigo, "dynamic", {isSensor=true})
    transition.to (poderInimigo, {x=100, time=1000, onComplete = function () display.remove (poderInimigo)
    end})
    poderInimigo.myName = "Chama"
end

inimigo.timer = timer.performWithDelay (math.random (1000, 1500), inimigoAtirar, 0)

local function movimentarInimigo ()

    if not (inimigo.x == nil ) then

        if (direcaoInimigo == "esquerda" ) then 
            inimigo.x = inimigo.x - 2

            if (inimigo.x <= 500 ) then 
                direcaoInimigo = "cima"
            end

        elseif (direcaoInimigo == "cima" ) then
            inimigo.y = inimigo.y - 2

            if (inimigo.y >= 280 ) then
                direcaoInimigo = "esquerda"
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

        if ((obj1.myName == "Laser" and obj2.myName == "inimigo") 
        or (obj1.myName == "inimigo" and obj2.myName == "Laser") ) 
        then

            if (obj1.myName == "Laser") then

                display.remove (obj1)
            else
                display.remove (obj2)
            end

            pontos = pontos + 10
            pontosText.text = "Pontos: " .. pontos

        elseif ((obj1.myName == "Chama" and obj2.myName == "player") or (obj1.myName == "player" and obj2.myName == "Chama") ) then
            if (obj1.myName == "Chama") then
                display.remove (obj1)
            else
                display.remove (obj2)
            end

            vidas = vidas - 1
            vidasText.text = "Vidas: " .. vidas
            if (vidas <= 0) then
                Runtime:removeEventListener ("collision", onCollision)
                Runtime:removeEventListener ("enterframe", movimentarInimigo)
                timer.pause (inimigo.timer)
                botaoBaixo:removeEventListener ("touch", baixo)
                botaoCima:removeEventListener ("touch", cima)
                botaoCirculo:removeEventListener ("tap", atirar)
                local GameOver = display.newText ("GameOver", 500, 350, native.systemFont, 50 )
                GameOver:setFillColor (0, 255, 1)
                GameOver.x = display.contentCenterX
                GameOver.y = display.contentCenterY
            end
        end
    end
end

Runtime:addEventListener ("collision", onCollision)

