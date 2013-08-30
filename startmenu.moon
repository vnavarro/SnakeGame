class MainMenu
  new: =>
    love.graphics.setBackgroundColor( 255, 255, 255 )
    @titleFont = love.graphics.newFont("resources/Boxy-Bold.ttf",100)
    @creditsFont = love.graphics.newFont("resources/Boxy-Bold.ttf",25)
    @menuFont = love.graphics.newFont("resources/Boxy-Bold.ttf",50)    

  drawTitle: =>    
    love.graphics.setFont(@titleFont)
    love.graphics.setColor 0,0,0
    love.graphics.printf "We love Snake!", 0, love.graphics.getHeight!/2 - 100, 800, "center"

  drawStart: =>    
    love.graphics.setFont(@menuFont)
    love.graphics.setColor 0,0,0
    love.graphics.printf "Press enter to begin", 0, love.graphics.getHeight!/2 + 50, 800, "center"        

  drawCredits: =>    
    love.graphics.setFont @creditsFont
    love.graphics.setColor 255,135,131
    love.graphics.printf "Created by Vitor Navarro www.vnavarro.com.br for OGAM August 2013", 0, love.graphics.getHeight! - 70, 800, "center"    
    love.graphics.printf "Bouncing Baal music by FoxSynergy", 0, love.graphics.getHeight! - 45, 800, "center"    
    love.graphics.printf "Created with Love2D www.love2d.org", 0, love.graphics.getHeight! - 25, 800, "center" 

  drawSoundControl: =>
    love.graphics.setFont @creditsFont
    love.graphics.setColor 255,135,131
    love.graphics.printf "press S to turn sound on/off", 0, 5, 800, "center"       

  draw: =>    
    @drawTitle!
    @drawStart!
    @drawCredits!
    @drawSoundControl!
    
  update: (dt) =>