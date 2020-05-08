function love.load()
   love.window.setMode(1024, 768, {resizable=true, vsync=true, minwidth=1024, minheight=768})
   love.window.setTitle( "Castle Blast" )
   ball = love.graphics.newImage("ball.png")
   cannon = love.graphics.newImage("cannon.png")
   grass = love.graphics.newImage("grass.png")
   sky = love.graphics.newImage("sky.png")
   smoke = love.graphics.newImage("smoke.png")
   
   beat = love.audio.newSource("beat.mp3", "static")
   beat:setLooping(true)
   beat:setVolume(0.2)
   cannon_sound = love.audio.newSource("cannon.mp3", "static")
   bounce_sound = love.audio.newSource("bounce.mp3", "static")
   beatplayed = 0
   
   ballx = 358
   bally = 437
   time = 0
   vecx = 2
   vecy = -2
   rotation = 0
   timer = 0
   
   initSmoke()
end

function initSmoke() 
   smokeTimer = 0;
   smokeAlpha = 0.7;
   smokeRotation = 0;
   
   smoke1delay = love.math.random() * 0.5
   smoke1xoff = love.math.random() * 50 - 25
   smoke1yoff = love.math.random() * 50 - 25
   smoke1duration = love.math.random() * 2 + 1
   smoke1zoom = love.math.random() * 1 + 0.5
   
   smoke2delay = love.math.random() * 0.5
   smoke2xoff = love.math.random() * 50 - 25
   smoke2yoff = love.math.random() * 50 - 25
   smoke2duration = love.math.random() * 2 + 1
   smoke2zoom = love.math.random() * 1 + 0.5
   
   smoke3delay = love.math.random() * 0.5
   smoke3xoff = love.math.random() * 50 - 25
   smoke3yoff = love.math.random() * 50 - 25
   smoke3duration = love.math.random() * 2 + 1
   smoke3zoom = love.math.random() * 1 + 0.5
   
   smoke4delay = love.math.random() * 0.5
   smoke4xoff = love.math.random() * 50 - 25
   smoke4yoff = love.math.random() * 50 - 25
   smoke4duration = love.math.random() * 2 + 1
   smoke4zoom = love.math.random() * 1 + 0.5
   
   smoke5delay = love.math.random() * 0.5
   smoke5xoff = love.math.random() * 50 - 25
   smoke5yoff = love.math.random() * 50 - 25
   smoke5duration = love.math.random() * 2 + 1
   smoke5zoom = love.math.random() * 1 + 0.5
end


function love.draw()
   if beatplayed == 0 then
      beatplayed = 1
      beat:play()
      cannon_sound:play()
   end
  
   love.graphics.setColor(1, 1, 1, 1)   
   love.graphics.draw(sky, 0, 0, 0, love.graphics.getWidth()/1024)
   love.graphics.draw(grass, 0, 300, 0, love.graphics.getWidth()/1024)
    
   love.graphics.setColor(1, 1, 1, 1)
   love.graphics.draw(cannon, 100, 450)
   
   love.graphics.setColor(1, 1, 1, 1)   
   love.graphics.draw(ball, ballx, bally, rotation)
   
   if smokeTimer < 1 then
      love.graphics.setColor(1, 1, 1, smokeAlpha)  
      love.graphics.draw(smoke, 370+smoke1xoff, 400+smoke1yoff, 0, smoke1zoom)
      love.graphics.draw(smoke, 370+smoke2xoff, 400+smoke2yoff, 0, smoke2zoom)
      love.graphics.draw(smoke, 370+smoke3xoff, 400+smoke3yoff, 0, smoke3zoom)
      love.graphics.draw(smoke, 370+smoke4xoff, 400+smoke4yoff, 0, smoke4zoom)
      love.graphics.draw(smoke, 370+smoke5xoff, 400+smoke5yoff, 0, smoke5zoom)
   end
end


function love.update(dt)
--    inc_val = 1;
--     rotation = rotation + math.pi/100;

      timer = timer + dt
      smokeTimer = smokeTimer + dt
      
      if smokeTimer < 1 then
        smoke1zoom = smoke1zoom + 0.03
        smoke2zoom = smoke2zoom + 0.03
        smoke3zoom = smoke3zoom + 0.03
        smoke4zoom = smoke4zoom + 0.03
        smoke5zoom = smoke5zoom + 0.03
        
        smoke1yoff = smoke1yoff - 2
        smoke2yoff = smoke2yoff - 2
        smoke3yoff = smoke3yoff - 2
        smoke4yoff = smoke4yoff - 2
        smoke5yoff = smoke5yoff - 2
        
        if smokeAlpha > 0 then
          smokeAlpha = smokeAlpha - 0.01
        else
          smokeAlpha = 0;
        end
      end

      if timer > 3 then
         ballx = 358
         bally = 437
         time = 0
         vecx = 2
         vecy = -2
         timer = 0
         cannon_sound:stop()
         cannon_sound:play()
         initSmoke()
      end
      
      if bally > 580 then
        vecy = vecy * -0.6
        vecx = vecx * 0.7
        bally = 579
        bounce_sound:stop()
        bounce_sound:play()
      else 
        for i = 1, 5 do
          ballx = ballx + vecx
          bally = bally + vecy
          vecy = vecy + 0.02        
        end
      end
end