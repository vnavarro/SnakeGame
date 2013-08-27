Snake = require "snake"

class Level
  new: =>
    @score = 0
    @snake = Snake self
    @generateFood!

  generateFood: =>
    foodSize = 10
    @food = {
      x: math.floor(math.random()*(love.graphics.getWidth!-foodSize)/foodSize),
      y: math.floor(math.random()*(love.graphics.getHeight!-foodSize)/foodSize),
      size: foodSize,
    }

  update: (dt) =>
    if love.keyboard.isDown "right" then
      @snake.direction = DIRECTION_ENUM.R
    elseif love.keyboard.isDown "left" then
      @snake.direction = DIRECTION_ENUM.L
    elseif love.keyboard.isDown "down" then
      @snake.direction = DIRECTION_ENUM.D
    elseif love.keyboard.isDown "up" then
      @snake.direction = DIRECTION_ENUM.U
    @snake\moveBody dt    

  collidedWithFood: =>
    head = @snake.body[#@snake.body]
    return head.x == @food.x and head.y == @food.y

  draw: =>    
    love.graphics.rectangle("fill", @food.x*@food.size, @food.y*@food.size, @food.size, @food.size )
    @snake\draw!    
    love.graphics.printf "Score: #{@score}", 10, 10, 400, "left"    

  updateScore: (newScore) =>
    @score += newScore

  pickFood: =>
    @generateFood!
    @updateScore 10