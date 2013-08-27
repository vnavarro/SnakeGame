class BodyPart
  new: (startX,startY) =>
    @x = startX
    @y = startY
    @name = "#{@x},#{@y}"
    @image = love.graphics.newImage "resources/block.png"
    @width = @image\getWidth!
    @height = @image\getHeight!

  draw: =>
    love.graphics.draw(@image,@x*@width,@y*@height)