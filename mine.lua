local dist = 10


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
    while turtle.detect()
    do
        turtle.dig()
    end
    turtle.attack()
    turtle.forward()
end

function goUp()
    while turtle.detectUp()
    do
        turtle.digUp()
    end
    turtle.attackUp()
    turtle.up()
end

function goDown()
    while turtle.detectDown()
    do
        turtle.digDown()
    end
    turtle.attackDown()
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
        if turtle.getItemSpace(i) == 64
        then
            return true
        end
    end
    return false
end

function unload() 
    for i = 16,1,-1 do
        turtle.select(i)
        turtle.dropDown()
    end
end

local offset = 0

function unloadToChest()
    turtle.turnLeft()
    mineN(offset)
    unload()
end

function returnToStrip()
    turnAround()
    offset = offset + 2
    mineN(offset)
    turtle.turnLeft()
end

function refuel()
    turtle.select(1)
    turtle.suck()
    turtle.refuel()
    print(turtle.getFuelLevel())
end

while(hasBagSpace())
do 
    mineStrip()
    unloadToChest()
    refuel()
    returnToStrip()
end
