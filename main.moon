Level = require "level"
MainMenu = require "startmenu"

GAME_SCREENS = {menu: 0,game: 1,hanking: 2}

-- Game Variables
-- local level
local currentScreenObject
local currentScreen

isAtMenu = ->
  currentScreen ==  GAME_SCREENS.menu

setAtGame = ->
  currentScreen =  GAME_SCREENS.game

setAtMenu = ->
  currentScreen =  GAME_SCREENS.menu

openMenu = ->
  setAtMenu!
  currentScreenObject = MainMenu!

onEndGame = ->
  openMenu! 

onEnterPressed = ->
  setAtGame!
  currentScreenObject = Level onEndGame

love.load = ->  
  -- font = love.graphics.newImageFont("resources/imagefont.png"," abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?-+/():;%&`'*#=[]\"")
  -- font = love.graphics.newFont("resources/Boxy-Bold.ttf",20)  
  -- love.graphics.setFont(font)
  openMenu!  

love.update = (dt) ->
  currentScreenObject\update(dt)

love.draw = ->  
  currentScreenObject\draw!

love.keypressed = (key,u) ->
   --Debug
  if key == "lctrl" then --set to whatever key you want to use
    debug.debug()
  if key == "return" and isAtMenu! then
    onEnterPressed!
    
