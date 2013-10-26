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
• profileSelect
• createProfile
• langs

]]


require("assets/libs/loveframes")

require("guis")
require("savePreferences")

lg = love.graphics
lf = love.filesystem
la = love.audio 
lk = love.keyboard
lm = love.mouse

prefs = {
	music = true,
	sfx = true,
}

local screenWidth = love.graphics.getWidth()
local screenHeight = love.graphics.getHeight()

gamestate = "startmenu"
loveframes.SetState("startmenu") 

local bgImage = lg.newImage("assets/img/background.png")
local bg = lg.newQuad(0, 0, lg.getWidth(), lg.getHeight(), bgImage:getWidth(), bgImage:getHeight())

local bgm = la.newSource("assets/sfx/01 A Night Of Dizzy Spells.mp3")

buttonClick = la.newSource("assets/sfx/menu rollover.mp3")

local logo = lg.newImage("assets/img/logo.png")

local mouseX, mouseY

local mouseImage = lg.newImage("assets/img/mouse.png")

local version = "1.1 ALPHA"

bgImage:setWrap('repeat', 'repeat')

font20 = lg.newFont("assets/fonts/font.ttf", 20)
font70 = lg.newFont("assets/fonts/font.ttf", 70)
font40 = lg.newFont("assets/fonts/font.ttf", 40)

function love.load()
	savePrefs()
	loadPrefs()

	lm.setVisible(false)

	mainmenu() -- Calls the mainmenu() function from guis.lua, which generates all the GUI elemets in the mainmenu state
	credits() -- Calls the credits() function from guis.lua, which generates all the GUI elements in the credits state
	help() -- Calls the help() function from guis.lua, which generates all of the GUI elements in the help state
	options(bgm, { buttonClick }) -- Calls the options() function from guis.lua, which generates all of the GUI elements in the options state
	languages() -- Calls the languages() function from guis.lua, which generates all of the GUI elements in the langs state

	profileSelect() -- Calls the profileSelect() function from guis.lua, which generates all GUI elements in the profileSelect state
	createProfile() -- Calls the createProfile() function from guis.lua, which generates all GUI elements in the createProfile state

	bgm:setLooping(true)

	bgm:setVolume(.3)

	if prefs.music then
		--bgm:play() -- I usually disable this, because I like to listen to music whist programming. If this is ever disabled, just edit this line :-)
	end

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

		lg.setFont(font20)

		lg.print("V" .. version, 5, screenHeight - 20)
	elseif gamestate == "profileSelect" then
		lg.drawq(bgImage, bg, 0, 0)
	elseif gamestate == "createProfile" then
		lg.drawq(bgImage, bg, 0, 0)
	elseif gamestate == "help" then
		lg.drawq(bgImage, bg, 0, 0)

		lg.setFont(font70)

		lg.print("HELP", screenWidth/2-font70:getWidth("HELP")/2, screenHeight/2-font70:getHeight("HELP")/2-250)

		lg.setFont(font40)

		lg.print("HOW TO PLAY", 50, screenHeight/2-font70:getHeight("HOW TO PLAY")/2-130)

		lg.setFont(font20)

		lg.print("Move Left: A", 50, screenHeight/2-font70:getHeight("Move Left: A")/2-80) -- Edit later for custom controls
		lg.print("Move Right: D", 50, screenHeight/2-font70:getHeight("Move Right: D")/2-60) -- Edit later for custom controls
		lg.print("Jump: SPACE", 50, screenHeight/2-font70:getHeight("Jump: SPACE")/2-40) -- Edit later for custom controls
	elseif gamestate == "options" then
		lg.drawq(bgImage, bg, 0, 0)

		lg.setFont(font70)
	elseif gamestate == "langs" then 
		lg.drawq(bgImage, bg, 0, 0)

		lg.setFont(font70)

		lg.print("LANGUAGES", screenWidth/2-font70:getWidth("LANGUAGES")/2, screenHeight/2-font70:getHeight("LANGUAGES")/2-250)

		lg.setFont(font20)

		lg.print("Work-in-Progress. Wont be added for a while... sorry! :(", screenWidth/2-font20:getWidth("Work-in-Progress. Wont be added for a while... sorry! :(")/2, screenHeight/2-font20:getHeight("Work-in-Progress. Wont be added for a while... sorry! :(")/2)
	elseif gamestate == "credits" then 
		lg.drawq(bgImage, bg, 0, 0)

		lg.setFont(font70)
		
		lg.print("CREDITS", screenWidth/2-font70:getWidth("CREDITS")/2, screenHeight/2-font70:getHeight("CREDITS")/2-250)

		lg.setFont(font20)
		
		lg.print("Programming - Eamonn Rea", screenWidth/2-font20:getWidth("Programming - Eamonn Rea")/2, screenHeight/2-font20:getHeight("Programming - Eamonn Rea")/2-170)
		lg.print("Music - OpenGameArt, Eric Skiff", screenWidth/2-font20:getWidth("Music - OpenGameArt, Eric Skiff")/2, screenHeight/2-font20:getHeight("Music - OpenGameArt, Eric Skiff")/2-150)
		lg.print("Images - Famitsu, Ryan Griffin, Eamonn Rea, OpenGameArt", screenWidth/2-font20:getWidth("Images - Famitsu, Ryan Griffin, Eamonn Rea, OpenGameArt")/2, screenHeight/2-font20:getHeight("Images - Famitsu, Ryan Griffin, Eamonn Rea, OpenGameArt")/2-130)
		lg.print("MiddleClass (Class System) - Kikito", screenWidth/2-font20:getWidth("MiddleClass (Class System) - Kikito")/2, screenHeight/2-font20:getHeight("MiddleClass (Class System) - Kikito")/2-110)
		lg.print("LoveFrames (GUI System) - Kenny Shields/Nikolai Resokav", screenWidth/2-font20:getWidth("LöveFrames (GUI System) - Kenny Shields/Nikolai Resokav")/2, screenHeight/2-font20:getHeight("LöveFrames (GUI System) - Kenny Shields/Nikolai Resokav")/2-90)
		lg.print("LoveAchievements (Achievements System) - LiquidHelium", screenWidth/2-font20:getWidth("LoveAchievements (Achievements System) - LiquidHelium")/2, screenHeight/2-font20:getHeight("LoveAchievements (Achievements System) - LiquidHelium")/2-70)
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
