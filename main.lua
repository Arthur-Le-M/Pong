-- Raquette
raquette = {}
raquette.x = 10
raquette.y = 0
raquette.width = 20
raquette.height = 80
raquette.speed = 1

-- Balle
balle = {}
balle.x = 0
balle.y = 0
balle.width = 10
balle.height = 10
balle.speedX = 1
balle.speedY = 1

function love.load()
    -- Centrage de la balle au début de la partie
    balle.x = love.graphics.getWidth()/2 + balle.width/2
    balle.y = love.graphics.getHeight()/2 + balle.height/2
end

function love.update()
    -- Mouvements raquette
    if love.keyboard.isDown('down') and raquette.y + raquette.height < love.graphics.getHeight() then
        raquette.y = raquette.y + raquette.speed
    elseif love.keyboard.isDown('up') and raquette.y > 0 then
        raquette.y = raquette.y - raquette.speed
    end

    --Mouvements de la balle
    balle.x = balle.x + balle.speedX
    balle.y = balle.y + balle.speedY

    -- Effet de rebond sur les murs pour la balle
    -- Pour la ligne X
    if balle.x + balle.width >= love.graphics.getWidth() or balle.x <= raquette.x + raquette.width then
        balle.speedX = -balle.speedX
    end
    -- Pour la ligne Y
    if balle.y + balle.height >= love.graphics.getHeight() or balle.y <= 0 then
        balle.speedY = -balle.speedY
    end
end

function love.draw()
    -- Graphics de la raquette
    love.graphics.rectangle("fill", raquette.x, raquette.y, raquette.width, raquette.height)

    --Graphics de la balle
    love.graphics.rectangle("fill", balle.x, balle.y, balle.width, balle.height)
end