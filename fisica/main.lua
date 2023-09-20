-- fisica
-- chamar a biblioteca: atribui biblioteca interna a variavel physics

local physics = require ("physics")
-- iniciar a fisica no projeto:
physics.start ()
--definir a gravidade do projeto:
physics.setGravity (0, 9.8)
-- definir a renderizaçao da visualizacao da fisica (usado somente durante o desenvolvimento para testes)
-- modos: normal: aparece apenas imagens, corpos fisicos invisiveis, hybrid: mostra as imagens e os corpos fisicos, debug: mostra apenas os corpos fisicos.
physics.setDrawMode ("hybrid")

local retangulo = display.newRect (150, display.contentCenterY, 200, 90)
physics.addBody (retangulo, "dynamic")
retangulo:setFillColor (1,0.9,0)

local chao = display.newRect (display.contentCenterX, 400, 450, 20)
physics.addBody (chao, "static")

local circulo = display.newCircle (300,50,30)
physics.addBody (circulo, "kinematic", {radius=30})
circulo:setFillColor (1, 0.2, 0.5)

local quadrado = display.newRect (display.contentCenterX, 0, 50, 50)
physics.addBody (quadrado, "dynamic", {bounce=0.8, friction=2, density=0.5})
quadrado:applyAngularImpulse (80)