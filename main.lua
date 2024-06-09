function love.load()
    y = 300 - 100/2 -- Player 1
    yy = 300 - 100/2 -- Player 2
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
end

function love.draw()
    love.graphics.rectangle("fill", 10, y, 5, 100) -- Player 1
    love.graphics.rectangle("fill", 790 - 5, yy, 5, 100) -- Player 2
end
