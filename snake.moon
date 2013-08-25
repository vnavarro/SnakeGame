BodyPart = require "bodypart"

export DIRECTION_ENUM = {U: 0,R: 1,D: 2,L: 3}

class Snake
  new: =>
    @x = 10
    @y = 0
    @speed = 10
    @step = 0
    @direction = DIRECTION_ENUM.R
    @image = love.graphics.newImage "resources/block.png"  
    @size = 10
    @alive = true
    @createBody!    

  createBody: =>
    @body = {}
    for i = 1, @size
      -- bodypart = BodyPart(10 * (i - 1),0)    
      bodypart = BodyPart((i - 1),0)    
      @body[#@body+1] = bodypart          

  moveBody: (dt) =>
    headX,headY = @body[#@body].x,@body[#@body].y
    currentSpeed = @speed * dt

    print "Current Step #{@step} e dt #{dt}"
    if math.floor(@step + currentSpeed) > @step then
      currentSpeed = math.floor(currentSpeed+@step)
      @step = 0
      print "Inside Current Step #{currentSpeed}"
    else
      @step += currentSpeed
      return

    if @direction == DIRECTION_ENUM.R then      
      headX += currentSpeed
    elseif @direction == DIRECTION_ENUM.L then
      headX -= currentSpeed
    elseif @direction == DIRECTION_ENUM.D then
      headY += currentSpeed
    elseif @direction == DIRECTION_ENUM.U then
      headY -= currentSpeed


    tail = @body[1]    
    table.remove(@body,1)
    tail.x,tail.y = headX,headY
    table.insert(@body,tail)



    -- return if @alive == false
    -- currentSpeed = @speed * dt
    -- oldDirection = @direction
    -- for key,part in pairs @body
    --   moving,oldDirection = part\move(currentSpeed)
      -- @alive and= moving

  draw: =>
    [part\draw! for i, part in ipairs @body]
    -- partOne = @body[1]
    -- love.graphics.draw(partOne.image, partOne.x, partOne.y)
    -- partOne = @body[2]
    -- love.graphics.draw(partOne.image, partOne.x, partOne.y)
    -- partOne = @body[3]
    -- love.graphics.draw(partOne.image, partOne.x, partOne.y)