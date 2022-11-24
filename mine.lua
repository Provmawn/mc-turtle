local dist = 50


function mineStrip()
    mineN(dist)
    goRight()
    goRight()
    mineN(dist)
    goRight()
    goRight()
    goUp()

    mineN(dist)
    goRight()
    goRight()
    mineN(dist)
    goRight()
    goRight()
    goUp()

    mineN(dist)
    goRight()
    goRight()
    mineN(dist)
    goRight()
    goRight()
    goDown()
    goDown()
end

function turnAround()
    turtle.turnRight()
    turtle.turnRight()
end

function goForward()
    if turtle.detect()
    then
        turtle.dig()
    end
        turtle.forward()
end

function goUp()
    if turtle.detectUp()
    then
        turtle.digUp()
    end
    turtle.up()
end

function goDown()
    if turtle.detectDown()
    then
        turtle.digDown()
    end
    turtle.down()
end

function goLeft()
    turtle.turnLeft()
    goForward()
end

function goRight()
    turtle.turnRight()
    goForward()
end

function mineN(n)
    while(n > 0)
    do
        goForward()
        n = n - 1
    end
end

function hasBagSpace()
    for i=1,16 do
        if turtle.getItemSpace(i) == 0
        then
            return true
        end
    end
    return false
end

function unload() 

end

local offset = 0

while(hasBagSpace())
do 
    mineStrip() 

    unload()

    goRight()
    goForward()
    offset = offset + 2
    turtle.turnLeft()

    mineStrip() 

    turtle.turnLeft()

    mineN(offset)

    unload()

    turnAround()

    offset = offset + 2

    mineN(offset)

    turtle.turnLeft()

    mineStrip()

    turtle.turnLeft()

    mineN(offset)

    unload()

    turnAround()

    offset = offset + 2

    mineN(offset)

    turtle.turnLeft()
end
