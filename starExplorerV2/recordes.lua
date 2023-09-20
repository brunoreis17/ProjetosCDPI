
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
--O código fora das funções de evento de cena abaixo será executado apenas UMA VEZ, a menos que
-- a cena é totalmente removida (não reciclada) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local json = require ("json")
local pontosTable = {}
local filePath = system.pathForFile ("pontos.json", system.DocumentsDirectory)
local fundo
local function carregaPontos ()
    local pasta = io.open (filePath, "r")

    if pasta then
        local contents = pasta:read ("*a")
        io.close (pasta)
        pontosTable = json.decode (contents)
    end
    if (pontosTable == nil or #pontosTable == 0) then
        pontosTable = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
    end
end

local function salvaPontos ()
    for i = #pontosTable, 11, -1 do 
        table.remove (pontosTable, i)
    end

    local pasta = io.open (filePath, "w")

    if pasta then
        pasta:write (json.encode(pontosTable))
        io.close (pasta)
    end
end 

local function gotoMenu ()
    composer.gotoScene ("menu", {time=800, effect= "crossFade"})
end
-- -----------------------------------------------------------------------------------
-- Funções de evento de cena
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
    carregaPontos ()
    table.insert (pontosTable, composer.getVariable("scoreFinal"))

    composer.setVariable ("scoreFinal", 0)

    local function compare (a,b)
        return a > b
    end

    table.sort (pontosTable, compare)

    salvaPontos()

    local bg = display.newImageRect (sceneGroup, "imagens/bg.png", 800, 1400)
    bg.x, bg.y = display.contentCenterX, display.contentCenterY

    local cabecalho = display.newText (sceneGroup, "Recordes", display.contentCenterX, 100, native.systemFont, 80)
    cabecalho:setFillColor (0.75, 0.78, 1)

    for i = 1, 10 do
        if (pontosTable[i]) then
            local yPos = 150 + (i*56)

            local ranking = display.newText (sceneGroup, i .. ")", display.contentCenterX-50, yPos, native.systemFont, 44)
            ranking:setFillColor (0.8)

            ranking.anchorX = 1

            local finalPontos = display.newText (sceneGroup, pontosTable[i], display.contentCenterX-30, yPos, native.systemFont, 44)
            finalPontos.anchorX = 0
            fundo = audio.loadStream ("audio/Midnight-Crawlers_Looping.wav")
        end
    end

    local menu = display.newText (sceneGroup, "Menu", display.contentCenterX, 810, native.systemFont, 50)
    menu:setFillColor (0.75, 0.78, 1)
    menu:addEventListener ("tap", gotoMenu)
end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		--O código aqui é executado quando a cena ainda está fora da tela (mas está prestes a aparecer na tela)


	elseif ( phase == "did" ) then
		-- O código aqui é executado quando a cena está inteiramente na tela
        
        audio.play (fundo, {channel=1, loops=-1})
	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- O código aqui é executado quando a cena está na tela (mas está prestes a sair da tela)

	elseif ( phase == "did" ) then
		-- O código aqui é executado imediatamente após a cena sair totalmente da tela
           composer.removeScene ("recordes")
           audio.stop (1)
	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
-- O código aqui é executado antes da remoção da visualização da cena
    audio.dispose (fundo)
end



-- -----------------------------------------------------------------------------------
-- Ouvintes de função de evento de cena
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
