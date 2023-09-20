local circulo = display.newCircle ( 100, 50, 30)
-- transiçoes:
-- comandos: transition.to (variavel, {parametros})
transition.to (circulo, {time=5000, y= 400})
circulo:setFillColor (28, 0, 64)
local circulo1 = display.newCircle (170, 50, 30)
transition.to (circulo1, {time=5000, y=400, delta=true})
circulo1:setFillColor (0, 1, 0.3)

local circulo2 = display.newCircle ( 240, 50, 30)
transition.to (circulo2, {time=5000, y=400, iterations=3, transition=easing.outElastic} )
circulo2:setFillColor (1, 0.4, 0.2)

local retangulo = display.newRect (200, 250, 50, 90)
transition.to (retangulo, {time=5000, rotation=90, yScale=2,alpha=0.5, iterations=-1})
retangulo:setFillColor (1, 0.9, 7)