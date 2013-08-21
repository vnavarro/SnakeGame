DIRECTION_ENUM = {U: 0,R: 1,D: 2,L: 3}

x,y,speed = 50,50,300
direction = DIRECTION_ENUM.R
hamster = nil

moveBody = (dt) ->
  if direction == DIRECTION_ENUM.R then
    newX = x + (speed * dt)
    --HIT RIGHT WALL!
    if newX + hamster\getWidth! >= love.graphics.getWidth! then
      newX = love.graphics.getWidth! - hamster\getWidth!
    x = newX
  elseif direction == DIRECTION_ENUM.L then
    newX = x - (speed * dt)
    --HIT LEFT WALL!
    if newX <= 0 then
      newX = 0
    x = newX
  if direction == DIRECTION_ENUM.D then
    newY = y + (speed * dt)
    --HIT DOWN WALL!
    if newY + hamster\getHeight! >= love.graphics.getHeight! then
      newY = love.graphics.getHeight! - hamster\getHeight!
    y = newY    
  elseif direction == DIRECTION_ENUM.U then
    newY = y - (speed * dt)
    --HIT UP WALL!
    if newY <= 0 then
      newY = 0
    y = newY    

love.load = ->
  --todo: load game here
  font = love.graphics.newImageFont("resources/imagefont.png"," abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?-+/():;%&`'*#=[]\"")
  love.graphics.setFont(font)
  hamster = love.graphics.newImage "resources/block.png"  

love.update = (dt) ->
  if love.keyboard.isDown "right" then
    direction = DIRECTION_ENUM.R
  elseif love.keyboard.isDown "left" then
    direction = DIRECTION_ENUM.L
  if love.keyboard.isDown "down" then
    direction = DIRECTION_ENUM.D
  elseif love.keyboard.isDown "up" then
    direction = DIRECTION_ENUM.U
  moveBody dt

love.draw = ->  
  love.graphics.printf 'Hello World! \n#9668', 400, 300, 150, "center"
  love.graphics.print y, 100,100
  love.graphics.draw(hamster, x, y)