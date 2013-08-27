Level = require "level"

-- Game Variables
local level

love.load = ->
  --todo: load game here
  font = love.graphics.newImageFont("resources/imagefont.png"," abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?-+/():;%&`'*#=[]\"")
  love.graphics.setFont(font)
  level = Level!

love.update = (dt) ->
  level\update dt

love.draw = ->  
  level\draw!

love.keypressed = (key,u) ->
   --Debug
  if key == "lctrl" then --set to whatever key you want to use
    debug.debug()
