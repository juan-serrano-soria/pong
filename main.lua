function love.load()
    y = 300 - 100/2 -- Player 1
    yy = 300 - 100/2 -- Player 2

    ball = {}
    ball.x = 400
    ball.y = 300
    ball.dx = 0 -- Speed in x
    ball.dy = 0 -- Speed in y
    ball.speed = 2 -- Absolute speed
end

function love.update(dt)
    -- Movement of the players
    if love.keyboard.isDown("w") then
        y = y - 5
    elseif love.keyboard.isDown("s") then
        y = y + 5
    end
    if love.keyboard.isDown("up") then
        yy = yy - 5
    elseif love.keyboard.isDown("down") then
        yy = yy + 5
    end

    -- Avoid the players to go out of the screen
    if y < 0 then
        y = 0
    elseif y > 600 - 100 then
        y = 600 - 100
    end
    if yy < 0 then
        yy = 0
    elseif yy > 600 - 100 then
        yy = 600 - 100
    end

    -- Start the game
    if love.keyboard.isDown("return") then
        -- Reset the ball position
        ball.x = 400
        ball.y = 300
        -- Generate a random angle
        local angle = love.math.random() * 2 * math.pi

        -- Calculate dx and dy based on the angle and the speed
        ball.dx = ball.speed * math.cos(angle)
        ball.dy = ball.speed * math.sin(angle)
    end

    -- Ball movement
    ball.x = ball.x + ball.dx
    ball.y = ball.y + ball.dy

    -- Avoid the ball to go out of the screen
    if ball.y < 0 or ball.y > 600 then
        ball.dy = -ball.dy
    end

    -- Collision with the players
    if ball.x < 10 + 5 and ball.y > y and ball.y < y + 100 then
        ball.dx = -ball.dx
    elseif ball.x > 790 - 5 and ball.y > yy and ball.y < yy + 100 then
        ball.dx = -ball.dx
    end

    -- Collision with the walls
    if ball.x < 0 or ball.x > 800 then
        ball.x = 400
        ball.y = 300
        ball.dx = 0
        ball.dy = 0
    end

end

function love.draw()
    love.graphics.rectangle("fill", 10, y, 5, 100) -- Player 1
    love.graphics.rectangle("fill", 790 - 5, yy, 5, 100) -- Player 2
    love.graphics.circle("fill", ball.x, ball.y, 5) -- Ball
end
