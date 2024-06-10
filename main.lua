function love.load()
    y = 300 - 100/2 -- Player 1
    yy = 300 - 100/2 -- Player 2

    ball = {}
    ball.x = 400
    ball.y = 300
    ball.dx = 0 -- Speed in x
    ball.dy = 0 -- Speed in y
    ball.speed = 2 -- Absolute speed

    -- Set the font and the text
    font = love.graphics.newFont(24)
    text = love.graphics.newText(font, "Press Enter to start the game")

    -- Set the scores
    score1 = 0
    score2 = 0

    -- Set the font and the text for the score
    scoreFont = love.graphics.newFont(48)
    scoreText1 = love.graphics.newText(scoreFont, score1)
    scoreText2 = love.graphics.newText(scoreFont, score2)
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
        -- Change the text
        text:set("")
        -- Reset the ball position
        ball.x = 400
        ball.y = 300
        -- Generate a random angle
        local angle = love.math.random() * 2 * math.pi

        -- Calculate dx and dy based on the angle and the speed
        ball.dx = math.cos(angle)
        ball.dy = math.sin(angle)
    end

    -- Ball movement
    ball.x = ball.x + ball.dx * ball.speed
    ball.y = ball.y + ball.dy * ball.speed

    -- Avoid the ball to go out of the screen
    if ball.y < 0 or ball.y > 600 then
        ball.dy = -ball.dy
    end

    -- Collision with the players
    if ball.x < 10 + 5 and ball.y > y and ball.y < y + 100 then
        ball.dx = -ball.dx
        ball.speed = ball.speed + 0.5
    elseif ball.x > 790 - 5 and ball.y > yy and ball.y < yy + 100 then
        ball.dx = -ball.dx
        ball.speed = ball.speed + 0.5
    end

    -- Collision with the walls
    if ball.x < 0 or ball.x > 800 then
        if ball.x < 0 then
            score2 = score2 + 1
            scoreText2:set(score2)
        else
            score1 = score1 + 1
            scoreText1:set(score1)
        end
        ball.x = 400
        ball.y = 300
        ball.dx = 0
        ball.dy = 0
        ball.speed = 2
        text:set("Press Enter to continue")
    end
end

function love.draw()
    love.graphics.rectangle("fill", 10, y, 5, 100) -- Player 1
    love.graphics.rectangle("fill", 790 - 5, yy, 5, 100) -- Player 2
    love.graphics.circle("fill", ball.x, ball.y, 5) -- Ball
    -- Text rendering
    love.graphics.setFont(font)
    love.graphics.draw(text, 400 - text:getWidth() / 2, 100 - text:getHeight() / 2)
    -- Score rendering
    love.graphics.setFont(scoreFont)
    love.graphics.draw(scoreText1, 300 - scoreText1:getWidth() / 2, 50 - scoreText1:getHeight() / 2)
    love.graphics.draw(scoreText2, 500 - scoreText2:getWidth() / 2, 50 - scoreText2:getHeight() / 2)
end
