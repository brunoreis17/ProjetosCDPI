local physics = require ("physics")
physics.start ()
physics.setGravity (0, 9.8)
physics.setDrawMode ("hybrid")

display.setStatusBar (display.HiddenStatusBar)


-- -- local staticBox = display.newRect (0, 0, 60, 60)
-- -- staticBox:setFillColor ( 0, 1, 255)
-- -- physics.addBody (staticBox, "static", {isSensor=true}) staticBox.x, staticBox.y = display.contentCenterX, 80

-- -- local shape = display.newRect (0, 0, 40, 100)
-- -- shape:setFillColor (0, 0, 1)
-- -- physics.addBody (shape, "dynamic") shape.x, shape.y, shape.rotation = 100, staticBox.y -40, 0

-- -- local jointPivot = physics.newJoint ("pivot", staticBox, shape, staticBox.x, staticBox.y)

-- -- jointPivot.isMotorEnabled = true 
-- -- jointPivot.motorSpeed = 40
-- -- jointPivot.maxMotorTorque = 1000

-- --  jointPivot.isLimitEnabled = true -- determina o nurero de rotacao
-- --  jointPivot:setRotationLimits (-60, 125)  

-- local staticBox = display.newRect (0, 0, 60, 60)
-- physics.addBody (staticBox, "static", {isSensor=true}) staticBox.x, staticBox.y = 200, 180

-- local shape = display.newRect (0, 0, 40, 100)
-- shape:setFillColor (1 , 255, 0)
-- physics.addBody (shape, "dynamic", {bounce=0}) shape.x, shape.y = 200, 80

-- local jointDistance = physics.newJoint ("distance", staticBox, shape, staticBox.x, staticBox.y - 20, shape.x, shape.y)
-- jointDistance.frequency = 0.8
-- jointDistance.dampingRatio = 0.8
-- -- jointDistance.leght = staticBox.y - shape.y -- Define a dsitancia entre os pontos de ancoragem

-- shape:applyLinearImpulse (0.3, 0, shape.x, shape.y -5)

-- local staticBox = display.newRect (0, 0, 60, 60)
-- staticBox:setFillColor (1, 0, 1)
-- physics.addBody (staticBox, "static", {isSensor=true}) staticBox.x, staticBox.y = display.contentCenterX, 360

-- local shape = display.newRect (0, 0, 140,30)
-- shape:setFillColor (0, 255, 255)
-- physics.addBody (shape, "dynamic", {bounce=1}) shape.x, shape.y = display.contentCenterX, 310

-- local jointPiston = physics.newJoint ("piston", staticBox, shape, shape.x, shape.y, 0, 1)

-- jointPiston.isMotorEnabled = true
-- jointPiston.motorSpeed = -30
-- jointPiston.maxMotorForce = 1000

-- jointPiston.isLimitEnabled = true

-- jointPiston:setLimits (-140, 0)

local bodies = {}
local bodiesGroup = display.newGroup ()
local joints = {}

-- bodiesGroup.alpha = 0
-- transition.to (bodiesGroup,{time=600, alpha=1, transition=easing.outQuad} )

-- local shape1 = display.newRect (bodiesGroup, 0, 0, 40, 40)
-- shape1:setFillColor (1, 2, 0)
-- physics.addBody (shape1, "dynamic") shape1.x, shape1.y, shape1.rotation = display.contentCenterX-60, 170, 0
-- shape1.angularVelocity = 200
-- bodies [#bodies+1] = shape1

-- local shape2 = display.newRect (bodiesGroup, 0, 0, 40, 40)
-- shape2:setFillColor ( 1, 0, 0)
-- physics.addBody (shape2, "dynamic")
-- shape2.x, shape2.y, shape2.rotation = display.contentCenterX+60, 170, 0
-- shape2.angularVelocity = 200
-- bodies [#bodies+1] = shape2

-- local dirtField = display.newRect (bodiesGroup, 0, 0, 120, 190)
-- dirtField.type = "dirt"
-- dirtField:setFillColor (0.8, 0.6, 255)
-- physics.addBody (dirtField, "static", {isSensor= true}) dirtField.x, dirtField.y = display.contentCenterX-60, 335 
-- bodies [#bodies+1] = dirtField

-- local grassField= display.newRect (bodiesGroup, 0, 0, 120, 190)
-- grassField.type = "grass"
-- grassField:setFillColor (2, 0.9, 255)
-- physics.addBody (grassField, "static", {isSensor= true}) grassField.x, grassField.y = display.contentCenterX+60, 335
-- bodies [#bodies+1] = grassField

-- local function handleCollision (self, event)
--     if (event.phase == "began") then
-- -- cria duas variaveis para armazenar limite de força e torque
--         local forceLimit = 0
--         local torqueLimit = 0
-- -- se o tipo do outro objeto for
--         if (event.other.type == "dirt") then

--         forceLimit = 0.22
--         torqueLimit = 0.022
--        -- se nao 
--     else
--         -- altera para os outros valores.
--         forceLimit = 0.28
--         torqueLimit = 0.028
--     end
--     -- cria um timer com funçao temporaria para criaçao das juntas 10 milisegundos apos colisao

--     timer.performWithDelay (10, 
--     function ()
--         -- cria se a junta ja dentro da string joints, onde o objA é o colidido e o B é o ouvinte da funçao, e as ancorassao criadas de acordos com a localizaçao do objB
--     joints [#joints+1]= physics.newJoint ("friction", event.other, self, self.x, self.y)
--     -- aletra os valores maximos de força e torque de acordo com o obtidono if acima
--     joints [#joints].maxForce = forceLimit
--     joints [#joints].maxToque = torqueLimit
--     end -- fecha a funçao timer.
--     ) -- fecha o timer
--   end -- fecha o if began
-- end -- fecha a function

-- shape1.collision = handleCollision
-- shape1:addEventListener ("collision", shape1)

-- shape2.collision = handleCollision
-- shape2:addEventListener ("collision", shape2)

-- local shape = display.newRect (0, 0, 60, 60)
-- shape:setFillColor (1, 1 , 1)
-- physics.addBody (shape, "dynamic", {bounce=1}) shape.x, shape.y = display.contentCenterX - 10, 230

-- local welded = display.newRect (0, 0, 60, 60)
-- welded:setFillColor (0, 0.9, 255)
-- physics.addBody (welded, "dynamic", {bounce=1}) welded.x, welded.y = display.contentCenterX +40, 180
-- welded.rotation = -25

-- local staticBox = display.newRect (0, 0, display.contentWidth -40, 50)
-- staticBox:setFillColor (1, 0, 0)
-- physics.addBody (staticBox, "static") staticBox.x, staticBox.y = display.contentCenterX, 420

-- local jointWeld = physics.newJoint ("weld", welded, shape, shape.x, shape.y)

-- jointWeld.dampingRatio = 0.1
-- jointWeld.frequency = 0.1

-- local vehicleBody = display.newRect (bodiesGroup, 0, 0, 110,20)
-- vehicleBody:setFillColor (0, 1, 0.8)
-- physics.addBody (vehicleBody, "dynamic") vehicleBody.x, vehicleBody.y = display.contentCenterX -50, 330
-- vehicleBody.isFixedRotation = true
-- bodies [#bodies+1] = vehicleBody

-- local wheelA = display.newCircle (bodiesGroup, 0, 0, 15)
-- wheelA:setFillColor ( 0.9, 0.5, 1)
-- physics.addBody (wheelA, "dynamic", {bounce= 0.5, friction= 0.8, radius= 15}) wheelA.x, wheelA.y = vehicleBody.x - 35, vehicleBody.y +30
-- bodies [#bodies+1] = wheelA

-- local wheelB = display.newCircle (bodiesGroup, 0, 0, 15)
-- wheelB:setFillColor (1, 0.5, 0.9)
-- physics.addBody (wheelB, "dynamic", {bounce= 0.5, friction= 0.8, radius= 15}) wheelB.x, wheelB.y = vehicleBody.x, vehicleBody.y + 30
-- bodies [#bodies+1] = wheelB

-- local wheelC = display.newCircle (bodiesGroup, 0, 0, 15)
-- wheelC:setFillColor ( 1, 0.3, 0.9)
-- physics.addBody (wheelC,"dynamic", {bounce=0.5, friction= 0.8, radius= 15}) wheelC.x, wheelC.y = vehicleBody.x +35, vehicleBody.y +30
-- bodies [#bodies+1] = wheelC

-- local staticBox = display .newRect (bodiesGroup, 0, 0, display.contentWidth-40, 50)
-- staticBox:setFillColor (1, 255, 0.7)
-- physics.addBody (staticBox, "static", {bounce=0, friction=1}) staticBox.x, staticBox.y = display.contentCenterX, 420
-- bodies [#bodies+1] = staticBox

-- local bumperA = display.newRect (bodiesGroup, 0, 0, 30, 20)
-- bumperA:setFillColor (0.2, 0.2, 1)
-- physics.addBody (bumperA, "static", {bounce=1, friction=0}) bumperA.x, bumperA.y = staticBox.x-staticBox.width/2+15, 385
-- bodies[#bodies+1] = bumperA

-- local bumperB = display.newRect (bodiesGroup, 0, 0, 30, 20)
-- bumperB:setFillColor (1, 0.9, 0.3)
-- physics.addBody (bumperB, "static", {bounce=1, friction=0}) bumperB.x, bumperB.y = staticBox.x+staticBox.width/2-15,385
-- bodies [#bodies+1] = bumperB

-- local springFrequency = 30
-- local springDampingRatio = 1.0

-- joints [#joints+1] = physics.newJoint ("wheel", vehicleBody, wheelA, wheelA.x, wheelA.y, 1, 1)
-- joints [#joints]. springFrequency = springFrequency
-- joints [#joints]. springDampingRatio = springDampingRatio

-- joints [#joints+1] = physics.newJoint ("wheel", vehicleBody, wheelB, wheelB.x, wheelB.y, 1, 1)
-- joints [#joints]. springFrequency = springFrequency
-- joints [#joints]. springDampingRatio = springDampingRatio

-- joints [#joints+1] = physics.newJoint ("wheel", vehicleBody, wheelC, wheelC.x, wheelC.y, 1, 1)
-- joints [#joints]. springFrequency = springFrequency
-- joints [#joints]. springDampingRatio = springDampingRatio

-- wheelA:applyTorque (2)
-- wheelB:applyTorque (2)
-- wheelC:applyTorque (2)

local bodyA = display.newCircle (bodiesGroup, 0, 0, 40)
bodyA:setFillColor (0.9, 0.4, 1)
physics.addBody (bodyA, "dynamic", {bounce=0.8, radius=40}) bodyA.x, bodyA.y = display.contentCenterX-50, 260
bodies [#bodies+1] = bodyA

local bodyB = display.newCircle (bodiesGroup, 0, 0, 26)
bodyB:setFillColor (0.9, 0.4, 1)
physics.addBody (bodyB, "dynamic", {bounce=0.8, radius= 26}) bodyB.x, bodyB.y = display.contentCenterX+50, 300

local staticBox = display.newRect (bodiesGroup, 0, 0, display.contentWidth-40, 50) 
staticBox:setFillColor (1, 255, 0.4)
physics.addBody (staticBox, "static", {bounce=0.8}) staticBox.x, staticBox.y = display.contentCenterX, 420
bodies [#bodies+1] = staticBox

local joint = physics.newJoint ("pulley", bodyA, bodyB, bodyA.x, bodyA.y-100, bodyB.x, bodyB.y-140,bodyA.x, bodyA.y, bodyB.x, bodyB.y, 0.5)
