--[[

Mr. BallGuy - Version 1.1-ALPHA

Created by Eamonn Rea



License can be found in assets/misc/license.txt

]]

lg = love.graphics
lf = love.filesystem
la = love.audio 
lk = love.keyboard

local screenWidth = love.graphics.getWidth()
local screenHeight = love.graphics.getHeight()

local gamestates = {
	startmenu = 1,
	playing = 2,
	gameover = 3,
}

local bgImage = lg.newImage("assets/img/background.png")
local bg = lg.newQuad(0, 0, screenWidth, screenHeight, bgImage:getWidth(), bgImage:getHeight())

bgImage:setWrap('repeat', 'repeat')

function love.load()
	
end

function love.update(dt)
	
end

function love.draw()
	love.graphics.drawq(bgImage, bg, 0, 0)
end

function love.focus(bool)

end

function love.keypressed(key, unicode)

end

function love.keyreleased(key, unicode)

end 

function love.mousepressed(x, y, button)

end

function love.mousereleased(x, y, button)

end 

function love.quit()
	love.event.quit()
end
