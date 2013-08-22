export DIRECTION_ENUM = {U: 0,R: 1,D: 2,L: 3}

class Snake
  new: =>
    @x = 50
    @y = 50
    @speed = 300
    @direction = DIRECTION_ENUM.R
    @image = love.graphics.newImage "resources/block.png"  

  moveBody: (dt) =>
    if @direction == DIRECTION_ENUM.R then
      newX = @x + (@speed * dt)
      --HIT RIGHT WALL!
      if newX + @image\getWidth! >= love.graphics.getWidth! then
        newX = love.graphics.getWidth! - @image\getWidth!
      @x = newX
    elseif @direction == DIRECTION_ENUM.L then
      newX = @x - (@speed * dt)
      --HIT LEFT WALL!
      if newX <= 0 then
        newX = 0
      @x = newX
    if @direction == DIRECTION_ENUM.D then
      newY = @y + (@speed * dt)
      --HIT DOWN WALL!
      if newY + @image\getHeight! >= love.graphics.getHeight! then
        newY = love.graphics.getHeight! - @image\getHeight!
      @y = newY    
    elseif @direction == DIRECTION_ENUM.U then
      newY = @y - (@speed * dt)
      --HIT UP WALL!
      if newY <= 0 then
        newY = 0
      @y = newY    
  draw: =>
    love.graphics.draw(@image, @x, @y)