-- Raquette
raquette = {}
raquette.x = 10
raquette.y = 0
raquette.width = 20
raquette.height = 80
raquette.speed = 1
raquette.score = 0

-- Balle
balle = {}
balle.x = 0
balle.y = 0
balle.width = 10
balle.height = 10
balle.speedX = 3
balle.speedY = 3


imageIcon = love.image.newImageData("icon.png")

function love.load()
    -- Centrage de la balle au début de la partie
    centrageBalle(balle)
    love.window.setTitle("PONG")
    love.window.setIcon(imageIcon)
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

    -- Effet de rebond sur les murs
    -- Pour la ligne X
    if balle.x + balle.width >= love.graphics.getWidth()then
        balle.speedX = -balle.speedX
    end
    -- Pour la ligne Y
    if balle.y + balle.height >= love.graphics.getHeight() or balle.y <= 0 then
        balle.speedY = -balle.speedY
    end

    -- Effet de rebond sur la raquette
    if balle.x <= raquette.x + raquette.width and balle.x >= raquette.x and balle.y <= raquette.y + raquette.height and balle.y >= raquette.y then
        balle.speedX = -balle.speedX
        --Bonne pratique = replacer la balle
        balle.x = raquette.x + raquette.width
        -- AJout du score
        raquette.score = raquette.score + 1
    end

    -- Cas de GameOver
    if balle.x < 0 then
        gameOver()
    end
end

function love.draw()
    -- Graphics de la raquette
    love.graphics.rectangle("fill", raquette.x, raquette.y, raquette.width, raquette.height)

    --Graphics de la balle
    love.graphics.rectangle("fill", balle.x, balle.y, balle.width, balle.height)

    -- Graphics du score
    love.graphics.print(raquette.score, love.graphics.getWidth()/2, 10)
end

function centrageBalle(balle)
    balle.x = love.graphics.getWidth()/2 + balle.width/2
    balle.y = love.graphics.getHeight()/2 + balle.height/2
end

function gameOver()
    raquette.score = 0
    raquette.y = 0
    balle.speedX = 3
    balle.speedY = 3
    love.load()
end