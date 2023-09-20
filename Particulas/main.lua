display.setStatusBar (display.HiddenStatusBar)

local physics = require ("physics")
physics.start ()
physics.setDrawMode ("normal")

local chao = display.newRect (display.contentCenterX, 470, 500, 50)
physics.addBody (chao, "static")

local paredeEsq = display.newRect (-50, display.contentCenterY, 50, 500)
physics.addBody (paredeEsq, "static")

local testeParticula = physics.newParticleSystem (
    {
        filename = "liquidParticle.png",
        radius = 2,
        imageRadius = 4
    }
)

local function onTimer (event)
    testeParticula:createParticle (
    {
        x= 0,
        y = 0,
        velocityX=256,
        velocityY= 480,
        color= {1, 0.2, 0.4, 1},
        lifetime= 32.0,
        flags= {"water", "colorMixing"}
    })
end

timer.performWithDelay (20, onTimer, 0)

testeParticula:createGroup (
    {
        x=50,
        y=0,
        color={0, 0.3, 1, 1},
        halfWidth= 64,
        halfHeight = 32,
        flags ={"water", "colorMixing"}
    }
)
testeParticula:applyForce (0, -9.8*testeParticula.particleMass)

local parede2 = display.newRect (320, display.contentCenterX, 50, 600)
physics.addBody (parede2, "static")