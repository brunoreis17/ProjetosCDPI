local player = display.newImageRect ("player.png", 532/6, 469/6)
player.x = 120
player.y = 220

transition.to (player, { transition=easing.continuousLoop, time=4000, y=400, iterations=1, rotation=360})

local retangulo = display.newRect (150, 150, 50, 50)
retangulo:setFillColor (0.5,0.2,0)

local cogumelo2 = display.newImageRect ("cogumelo2.jpg", 298/4, 169/4)
cogumelo2.x = 150
cogumelo2.y = 90

transition.to (cogumelo2, {time=9000, y=-10, x=200, transition=easing.inExpo, iterations=1} )
