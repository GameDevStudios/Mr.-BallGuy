--[[

Mr. BallGuy - Version 1.1-A0.1

Created by Eamonn Rea



License can be found in assets/misc/license.txt

Gamestate list:

• startmenu
• playing
• credits
• options
• help
• paused

]]


require("assets/libs/loveframes")

require("guis")

lg = love.graphics
lf = love.filesystem
la = love.audio 
lk = love.keyboard

local screenWidth = love.graphics.getWidth()
local screenHeight = love.graphics.getHeight()

gamestate = "startmenu"
loveframes.SetState("startmenu") 

local bgImage = lg.newImage("assets/img/background.png")
local bg = lg.newQuad(0, 0, lg.getWidth(), lg.getHeight(), bgImage:getWidth(), bgImage:getHeight())

local bgm = la.newSource("assets/sfx/01 A Night Of Dizzy Spells.mp3")

local logo = lg.newImage("assets/img/logo.png")

bgImage:setWrap('repeat', 'repeat')

function love.load()
	if love._version == "0.9.0" then
		love.window.setMode(800, 600, { resizable=false })
		love.window.setTitle("Mr. BallGuy")
	end

	mainmenu() -- Calls the mainmenu() function from guis.lua

	bgm:setLooping(true)

	bgm:play()
end

function love.update(dt)
	loveframes.update(dt)
end

function love.draw()
	if gamestate == "startmenu" then
		if love._version == "0.9.0" then
			love.graphics.draw(bgImage, bg, 0, 0)
		else
			love.graphics.drawq(bgImage, bg, 0, 0)
		end

		love.graphics.draw(logo, lg.getWidth()/2-logo:getWidth()/2, lg.getHeight()/2-logo:getHeight()/2-200)
	end

	loveframes.draw()
end

function love.focus(bool)
	if gamestate == "playing" and bool then 
		gamestate = "paused"
	end
end

function love.keypressed(key, unicode)
	if key == 'q' or key == 'escape' then 
		love.quit()
	end

	loveframes.keypressed(key, unicode)
end

function love.keyreleased(key, unicode)
	loveframes.keyreleased(key, unicode)
end 

function love.mousepressed(x, y, button)
	loveframes.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
	loveframes.mousereleased(x, y, button)
end 

function love.quit()
	love.event.quit()
end
