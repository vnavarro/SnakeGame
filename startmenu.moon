class MainMenu
  new: =>
    love.graphics.setBackgroundColor( 255, 255, 255 )
    @titleFont = love.graphics.newFont("resources/Boxy-Bold.ttf",100)
    @menuFont = love.graphics.newFont("resources/Boxy-Bold.ttf",50)    

  drawTitle: =>    
    love.graphics.setFont(@titleFont)
    love.graphics.setColor 0,0,0
    love.graphics.printf "We love Snake!", 0, love.graphics.getHeight!/2 - 100, 800, "center"

  drawStart: =>    
    love.graphics.setFont(@menuFont)
    love.graphics.setColor 0,0,0
    love.graphics.printf "Press enter to begin", 0, love.graphics.getHeight!/2 + 50, 800, "center"    

  draw: =>    
    @drawTitle!
    @drawStart!
    
  update: (dt) =>