-- -- incluindo funçoes
--  -- comando para iniciar a funçao local function nome da funçao seguido de parenteses
-- local function detectarTap (event) -- determina que a funçao é de evento.
-- -- codigo que é executado quando o botao for tocado,
-- -- tostring: pra sequenciar
-- -- event.target: nomear o objeto do evento, ou objeto trocado
--     print ("Objeto tocado: " .. tostring (event.target))

--     return true -- "zera" todos os dados depois da funçao executada.

-- end -- fecha a function

-- local botaoTap = display.newRect (160, 550, 200, 50)
-- botaoTap:addEventListener ("tap", detectarTap) -- 

-- local function tapDuplo (event)
-- -- se (numero de taps do event for igual a 2) entao
--     if (event.numTaps == 2) then
--         print ("Objeto tocado duas vezes: " .. tostring (event.target) )

--     else -- se nao
--         return true
--     end -- fecha o if/else
-- end -- fecha a function

-- local botaoDuplo = display.newRect (100, 300, 200, 50)
-- botaoDuplo:setFillColor (1, 0.3, 0.5)
-- botaoDuplo:addEventListener ("tap", tapDuplo) 

-- -- Evento de toque (touch)
-- -- Fases de toque:
--  -- began = primeira fase de toque, quando o usuario encosta na tela.
--  -- moved = quando o usuario mantem o toque e move pela tela.
--  -- ended = quando o usuario retira o dedo na tela
--  -- cancelled = quando o evento de toque é cancelado no sistema.

-- local function fasesToque (event)
-- -- se a fase de toque for = began entao
--     if (event.phase =="began" ) then
--         print ("Objeto tocado: " .. tostring(event.target) )
-- -- porem se a fase de toque for = moved entao
--     elseif ( event.phase == "moved" ) then
--         print ("Localização de toque nas seguintes coordenadas: x= " .. event.x .. ", y= " .. event.y)
-- -- entretanto se a fase for = a ended ou cancelled entao
--     elseif (event.phase == "ended" or "cancelled" ) then 
--         print ("touch terminado no objeto: " .. tostring(event.target) )
--     end

--     return true
-- end -- fecha a function

-- local botaoTouch = display.newRect ( 200, 400, 200, 50)
-- botaoTouch:setFillColor (201, 198,)
-- botaoTouch:addEventListener ("touch", fasesToque)
-------------------------------------------------------------------------
-- Multitoque:
-- Para ultilizar o multitouch precisamos habilitar (ativar) primeiro.
system.activate ("multitouch")

local retangulo = display.newRect ( display.contentCenterX,display.contentCenterY, 280, 440)
retangulo:setFillColor (1, 0, 0.3)

local function eventoTouch (event)
    print ("Fase de toque: " .. event.phase )
    print ("Localizaoção x: " .. tostring(event.x) ..", localização y: " .. tostring(event.y) )
    print (" ID de toque exclusivo: " .. tostring(event.id) )
    print ("----------")
    return true
end

retangulo:addEventListener ("touch", eventoTouch)