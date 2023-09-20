local physics = require ("physics")
physics.start ()
physics.setGravity (1, 5)
physics.setDrawMode ("normal")

display.setStatusBar (display.HiddenStatusBar)

local cima = display.newRect (display.contentCenterX, 0, 500, 50)
physics.addBody (cima, "static")
cima.myName = "Teto"
cima:setFillColor (1, 0, 0.9)

local baixo = display.newRect (display.contentCenterX, 480, 500, 50)
physics.addBody (baixo, "static")
baixo.myName = "Chao"
baixo:setFillColor (1, 0, 0.9)
local esquerda = display.newRect (-15, display.contentCenterY, 50, 500)
physics.addBody (esquerda, "static")
esquerda.myName = "Parede esquerda"
esquerda:setFillColor (1, 0, 0.9)
local direita = display.newRect (330, display.contentCenterY, 50,500)
physics.addBody (direita, "static")
direita.myName = "Parede direita"
direita:setFillColor (1, 0, 0.9)

local bolso = display.newImageRect ("bolso.jpeg", 1536/10, 864/10)
bolso.x = 100
bolso.y = 50
physics.addBody (bolso, {bounce=0.8})
bolso.myName = "bolso"

local localizacaoX = 200
local localizacaoY = 350

local vertices = {0, -100, 27, -35, 105, -35, 43, 16, 65, 90, 0, 45, -65, 90, -43, 15, -105, -35, -27, -35}
local estrela = display.newPolygon (localizacaoX, localizacaoY, vertices)

physics.addBody (estrela)
estrela.myName = "estrela"


local function colisaoLocal (event)
    if (event.phase == "began") then

        print ("Algo colidiu!")

    else

        print ("Fim da colisão")

    end
end

estrela:addEventListener ("collision", colisaoLocal)

--colisao global
local function mudarcordaestrela (event)
    if (event.phase == "began") then
        estrela:setFillColor (255, 255, 255)
    elseif (event.phase == "ended") then
        estrela:setFillColor (255, 0, 0)
    end
end
estrela:addEventListener ("collision", (mudarcordaestrela), colisaoGlobal)