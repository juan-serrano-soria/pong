function love.load()
    y = 300 -- Player 1
    yy = 300 -- Player 2
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
end

function love.draw()
    love.graphics.rectangle("fill", 10, y - 100/2, 5, 100) -- Player 1
    love.graphics.rectangle("fill", 790 - 5, yy - 100/2, 5, 100) -- Player 2
end
