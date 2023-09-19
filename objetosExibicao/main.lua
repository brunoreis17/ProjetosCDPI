-- Adicionar uma nova imagem na tela
-- Comandos: display.newImageRect ("Pasta/arquivo.formato", largura, altura)
local bg = display.newImageRect ("imagens/bg.jpg",1280*1.25, 720*1.25)

bg.x = display.contentCenterX 
bg.y = display.contentCenterY

local pikachu = display.newImageRect ("imagens/pikachu.png",1191/5, 1254/5)
local charmander = display.newImageRect ("imagens/charmander.png",507/2, 492/2)

pikachu.x = display.contentCenterX
pikachu.y = display.contentCenterY

charmander.x = 270
charmander.y = 240

local retangulo = display.newRect (750, 380, 100 , 70)

local circulo = display.newCircle (150, 80, 50)

local mystery = display.newImageRect ("imagens/mystery.png",493/2, 506/2)

mystery.x = 720
mystery.y = 380
