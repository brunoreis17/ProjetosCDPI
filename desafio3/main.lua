display.setStatusBar (display.HiddenStatusBar)

local physics = require ("physics")
physics.start ()
physics.setGravity (0, 8)
physics.setDrawMode ("hybrid")

local bg = display.newImageRect ("bg.jpg", 300*3, 168*3)
bg.x = display.contentCenterX
bg.y = display.contentCenterY

local staticBox = display.newCircle (0, 0, 20, 100, 30)
physics.addBody (staticBox, "static", {isSensor=true}) staticBox.x, staticBox.y = 200, 180
staticBox.x = 100
staticBox.y = 100

local shape = display.newCircle (0, 0, 20, 100, 30)
shape:setFillColor (1 , 255, 0)
physics.addBody (shape, "static", {bounce=0}) shape.x, shape.y = 200, 80
shape.x = 250
shape.y = 100

local guinazu = display.newImageRect ("guinazu.jpg", 296/3, 170/3)
guinazu.x = 80
guinazu.y = 400
physics.addBody (guinazu, "dynamic")

local suarez = display.newImageRect ("suarez.jpg", 300/3, 168/3)
suarez.x = 270
suarez.y = 400
physics.addBody (suarez, "dynamic")

local jointPiston = physics.newJoint ("piston", staticBox, guinazu, guinazu.x, guinazu.y)

jointPiston.isMotorEnabled = true
jointPiston.motorSpeed = 80
jointPiston.maxMotorTorque = 1000

 jointPiston.isLimitEnabled = true 
 jointPiston:setLimits (-60,100)  

 local jointPivot = physics.newJoint ("pivot", shape, suarez, suarez.x, shape.y)

 jointPivot.isMotorEnabled = true
 jointPivot.motorSpeed = 50
 jointPivot.maxMotorTorque = 1000
 
  jointPivot.isLimitEnabled = true 
  jointPivot:setRotationLimits (-20,100)  
 
  suarez:applyLinearImpulse (0.3, 0,staticBox.x, staticBox.y + 10)

  local function handleCollision (self, event)
    if (event.phase == "began") then
        local forceLimit = 0 
        local torqueLimit = 0
        
                if (event.other.type == "guinazu") then
        
                forceLimit = 0.22
                torqueLimit = 0.02
               -- se nao 
            else
                -- altera para os outros valores.
                forceLimit = 0.28
                torqueLimit = 0.028
            end
        end
    end

guinazu.collision = handleCollision
guinazu:addEventListener ("collision", guinazu)