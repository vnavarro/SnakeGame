Snake = require "snake"

snake = nil

love.load = ->
  --todo: load game here
  font = love.graphics.newImageFont("resources/imagefont.png"," abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?-+/():;%&`'*#=[]\"")
  love.graphics.setFont(font)
  snake = Snake!

love.update = (dt) ->
  if love.keyboard.isDown "right" then
    snake.direction = DIRECTION_ENUM.R
  elseif love.keyboard.isDown "left" then
    snake.direction = DIRECTION_ENUM.L
  if love.keyboard.isDown "down" then
    snake.direction = DIRECTION_ENUM.D
  elseif love.keyboard.isDown "up" then
    snake.direction = DIRECTION_ENUM.U
  snake\moveBody dt

love.draw = ->  
  love.graphics.printf 'Hello World! \n#9668', 400, 300, 150, "center"
  -- love.graphics.print y, 100,100
  snake\draw!

love.keypressed = (key,u) ->
   --Debug
   if key == "lctrl" then --set to whatever key you want to use
      debug.debug()