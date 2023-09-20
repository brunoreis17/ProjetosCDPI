local bg = display.newImageRect ("imagens/sky.png", 960*3, 240*3)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

local chao = display.newImageRect ("imagens/ground.png", 1028,256)
chao.x = display.contentCenterX
chao.y = 500

local player = display.newImageRect ("imagens/player.png", 532/4, 469/4)
player.x = 50
player.y = 320

-- andar para direita

local function direita ()
    player.x = player.x + 3
end

local botaoDireita = display.newImageRect ("imagens/button.png", 1280/40, 1279/40)
botaoDireita.x = 300
botaoDireita.y = 430
botaoDireita:addEventListener ("tap", direita)
local function esquerda ()
    player.x = player.x - 2
end

local botaoEsquerda = display.newImageRect ("imagens/button.png", 1280/40, 1279/40)
botaoEsquerda.x = 250
botaoEsquerda.y = 432
botaoEsquerda.rotation = 180
botaoEsquerda:addEventListener ("tap", esquerda)

local function cima ()
    player.y = player.y - 10
    print (player.y)
end

local botaoCima = display.newImageRect ("imagens/button.png", 1280/40, 1279/40)
botaoCima.x = 275
botaoCima.y = 400
botaoCima.rotation = -90
botaoCima:addEventListener ("tap", cima)

local function baixo ()
    player.y = player.y + 4
    print (player.y)
end

local botaoBaixo = display.newImageRect ("imagens/button.png", 1280/40, 1279/40)
botaoBaixo.x = 275
botaoBaixo.y = 460
botaoBaixo.rotation = 90
botaoBaixo:addEventListener ("tap", baixo)

local function diagonaldireitab ()
    player.y = player.y + 8
    player.x = player.x + 8
end

local botaoDiagonaldireitab = display.newImageRect ("imagens/button.png", 1280/40, 1279/40)
botaoDiagonaldireitab.x = 310
botaoDiagonaldireitab.y = 465
botaoDiagonaldireitab.rotation = 50
botaoDiagonaldireitab:addEventListener ("tap", diagonaldireitab)

local function diagonaldireitac ()
    player.y = player.y - 2
    player.x = player.x + 2
end

local botaoDiagonaldireitac = display.newImageRect ("imagens/button.png", 1280/40, 1279/40)
botaoDiagonaldireitac.x = 305
botaoDiagonaldireitac.y = 400
botaoDiagonaldireitac.rotation = 310
botaoDiagonaldireitac:addEventListener ("tap", diagonaldireitac)

local function diagonalesquerdab ()
    player.y = player.y + 30
    player.x = player.x - 30
end
local botaoDiagonalesquerdab = display.newImageRect ("imagens/button.png", 1280/40, 1279/40)
botaoDiagonalesquerdab.x = 240
botaoDiagonalesquerdab.y = 465
botaoDiagonalesquerdab.rotation = 120
botaoDiagonalesquerdab:addEventListener ("tap", diagonalesquerdab)

local function diagonalesquerdac ()
    player.x = player.x - 30
    player.y = player.y - 30
end

local botaoDiagonalesquerdac = display.newImageRect ("imagens/button.png", 1280/40, 1279/40)
botaoDiagonalesquerdac.x = 240
botaoDiagonalesquerdac.y = 400
botaoDiagonalesquerdac.rotation = 210
botaoDiagonalesquerdac:addEventListener ("tap", diagonalesquerdac)


