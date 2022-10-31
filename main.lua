-- Raquette
raquette = {}
raquette.x = 10
raquette.y = 0
raquette.width = 20
raquette.height = 80
raquette.speed = 1


function love.load()
end

function love.update()
    -- Mouvements raquette
    if love.keyboard.isDown('down') and raquette.y + raquette.height < love.graphics.getHeight() then
        raquette.y = raquette.y + raquette.speed
    elseif love.keyboard.isDown('up') and raquette.y > 0 then
        raquette.y = raquette.y - raquette.speed
    end
end

function love.draw()
    -- Graphics de la raquette
    love.graphics.rectangle("fill", raquette.x, raquette.y, raquette.width, raquette.height)
end