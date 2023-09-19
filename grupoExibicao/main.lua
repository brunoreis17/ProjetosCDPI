local backGroup = display.newGroup ()

local mainGroup = display.newGroup ()

local uiGroup = display.newGroup ()

local bg = display.newImageRect (backGroup, "imagens/bg.jpg", 509*2, 339*2)

bg.x = display.contentCenterX
bg.y = display.contentCenterY

local chao = display.newImageRect ("imagens/chao.png",4503/5, 613/5)

chao.x = display.contentCenterX
chao.y = 430

mainGroup:insert (chao)

local sun = display.newImageRect (backGroup, "imagens/sun.png", 256/2, 256/2)

sun.x = 280
sun.y = 70

local cloud = display.newImageRect ("imagens/cloud.png", 2360/10, 984/10)
cloud.x = 100
cloud.y = 50
backGroup:insert (cloud)


local tree = display.newImageRect (mainGroup, "imagens/tree.png", 1024/6, 1024/6)

tree.x = 50
tree.y = 330


local tree2 = display.newImageRect (mainGroup, "imagens/tree.png", 1024/6, 1024/6)

tree2.x = 250
tree2.y = 330
mainGroup:insert (tree2)

chao:toFront (tree)