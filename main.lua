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
lm = love.mouse

local screenWidth = love.graphics.getWidth()
local screenHeight = love.graphics.getHeight()

gamestate = "startmenu"
loveframes.SetState("startmenu") 

local bgImage = lg.newImage("assets/img/background.png")
local bg = lg.newQuad(0, 0, lg.getWidth(), lg.getHeight(), bgImage:getWidth(), bgImage:getHeight())

local bgm = la.newSource("assets/sfx/01 A Night Of Dizzy Spells.mp3")

local logo = lg.newImage("assets/img/logo.png")

local mouseX, mouseY

local mouseImage = lg.newImage("assets/img/mouse.png")

local version = "0.1 ALPHA"

bgImage:setWrap('repeat', 'repeat')

font20 = lg.newFont("assets/fonts/font.ttf", 20)

function love.load()
	lm.setVisible(false)

	mainmenu() -- Calls the mainmenu() function from guis.lua, which generates all the GUI elemets in the mainmenu state
	profileSelect() -- Calls the profileSelect() function from guis.lua, which generates all GUI elements in the profileSelect state
	createProfile() -- Calls the createProfile() function from guis.lua, which generates all GUI elements in the createProfile state

	bgm:setLooping(true)

	--bgm:play()

	lg.setFont(font20)
end

function love.update(dt)
	mouseX, mouseY = lm.getPosition()

	loveframes.update(dt)
end

function love.draw()
	if gamestate == "startmenu" then
		lg.drawq(bgImage, bg, 0, 0)

		lg.draw(logo, lg.getWidth()/2-logo:getWidth()/2, lg.getHeight()/2-logo:getHeight()/2-200)

		lg.print("V" .. version, 5, screenHeight - 20)
	elseif gamestate == "profileSelect" then
		lg.drawq(bgImage, bg, 0, 0)
	elseif gamestate == "createProfile" then
		lg.drawq(bgImage, bg, 0, 0)
	end

	loveframes.draw()

	lg.draw(mouseImage, mouseX, mouseY)
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
