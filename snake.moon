BodyPart = require "bodypart"

export DIRECTION_ENUM = {U: 0,R: 1,D: 2,L: 3}

class Snake
  new: (level) =>
    @x = 10
    @y = 0
    @speed = 10
    @step = 0
    @direction = DIRECTION_ENUM.R
    @image = love.graphics.newImage "resources/block.png"  
    @size = 15
    @alive = true
    @createBody!    
    @level = level    

  createBody: =>
    @body = {}
    for i = 1, @size
      bodypart = BodyPart((i - 1),0)    
      @body[#@body+1] = bodypart     

  addBodyPart: (x,y) =>
    bodypart = BodyPart(x,y)
    table.insert(@body,bodypart)

  moveBody: (dt) =>
    headX,headY = @body[#@body].x,@body[#@body].y
    currentSpeed = @speed * dt

    if math.floor(@step + currentSpeed) > @step then
      currentSpeed = math.floor(currentSpeed+@step)
      @step = 0
    else
      @step += currentSpeed
      return

    if @isGoingRight! then      
      headX += currentSpeed
    elseif @isGoingLeft! then
      headX -= currentSpeed
    elseif @isGoingDown! then
      headY += currentSpeed
    elseif @isGoingUp! then
      headY -= currentSpeed

    if @collidedWithWall! then
      @alive = false
      return
    if @collidedWithSelf headX,headY then
      @alive = false
      return

    if @level\collidedWithFood! then
      @level\pickFood!
      @addBodyPart headX,headY            
    else
      tail = @body[1]    
      table.remove(@body,1)
      tail.x,tail.y = headX,headY
      table.insert(@body,tail)

  collidedWithWall: =>
    head = @body[#@body]
    headX,headY = head.x*10,head.y*10
    if @isGoingRight! then
      return headX > love.graphics.getWidth!
    elseif @isGoingLeft! then
      return headX <= 0
    else if @isGoingDown! then
      return headY > love.graphics.getHeight!
    elseif @isGoingUp! then
      return headY <= 0
    return false

  collidedWithSelf: (newX,newY) =>
    for i = 1, #@body
      bodypart = @body[i]
      -- print "NewPoint:#{newX},#{newY} | BodyPoint:#{bodypart.x},#{bodypart.y}"
      if bodypart.x == newX and bodypart.y == newY then
        return true
    return false      

  draw: =>
    love.graphics.setColor 255,255,255
    [part\draw! for i, part in ipairs @body]

  isGoingRight: =>
    @direction == DIRECTION_ENUM.R
  isGoingLeft: =>
    @direction == DIRECTION_ENUM.L
  isGoingDown: =>
    @direction == DIRECTION_ENUM.D
  isGoingUp: =>
    @direction == DIRECTION_ENUM.U