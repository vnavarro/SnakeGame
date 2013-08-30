Level = require "level"
MainMenu = require "startmenu"

GAME_SCREENS = {menu: 0,game: 1,hanking: 2}

-- Game Variables
-- local level
local currentScreenObject
local currentScreen
local bgMusic
local audioOn
export die
export foodPick
export start

isAtMenu = ->
  currentScreen ==  GAME_SCREENS.menu

setAtGame = ->
  currentScreen =  GAME_SCREENS.game

setAtMenu = ->
  currentScreen =  GAME_SCREENS.menu

openMenu = ->
  start\stop!
  start\rewind!        
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
  audioOn = true
  bgMusic = love.audio.newSource("resources/bouncing_baal.mp3")
  bgMusic\setLooping true
  bgMusic\setVolume 0.65

  die = love.audio.newSource("resources/die.wav", "static")

  foodPick = love.audio.newSource("resources/food_pick.wav", "static")

  start = love.audio.newSource("resources/start.wav", "static")

  love.audio.play(bgMusic)  

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
    love.audio.play start
    onEnterPressed!
  if key == "s" then    
    audioOn = not audioOn
    if audioOn then      
      bgMusic\setVolume 0.65
      die\setVolume 1.0
      foodPick\setVolume 1.0
      start\setVolume 1.0
    else
      bgMusic\setVolume 0
      die\setVolume 0
      foodPick\setVolume 0
      start\setVolume 0
    
