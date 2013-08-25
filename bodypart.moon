class BodyPart
  new: (startX,startY) =>
    @x = startX
    @y = startY
    @name = "#{@x},#{@y}"
    @direction = DIRECTION_ENUM.R
    @image = love.graphics.newImage "resources/block.png"
    @width = @image\getWidth!
    @height = @image\getHeight!

  move: (@speed,direction) =>    
    oldDirection = @direction
    if @direction == DIRECTION_ENUM.R then      
      newX = @x + @speed
      if newX + @image\getWidth! >= love.graphics.getWidth! then
        return false      
      @x = newX
    elseif @direction == DIRECTION_ENUM.L then
      newX = @x - @speed
      if newX <= 0 then
        return false
      @x = newX
    if @direction == DIRECTION_ENUM.D then
      newY = @y + @speed
      if newY + @image\getHeight! >= love.graphics.getHeight! then
        return false
      @y = newY    
    elseif @direction == DIRECTION_ENUM.U then
      newY = @y - @speed
      if newY <= 0 then
        return false
      @y = newY      
    @direction = direction  
    return true,oldDirection

  draw: =>
    love.graphics.draw(@image,math.floor(@x*@image\getWidth!),math.floor(@y*@image\getHeight!))