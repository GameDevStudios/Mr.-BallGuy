function savePrefs()
	if not lf.isDirectory("prefs.lua") then 
		lf.mkdir("prefs.lua")
	end

	prefsFile = lf.newFile("prefs/prefs.lua")

	prefsFile:open("w")

	prefsFile:write("prefs.music = " .. tostring(prefs.music) .. "\n")
	prefsFile:write("prefs.sfx = " .. tostring(prefs.sfx) .. "\n")
end

function loadPrefs()
	for lines in love.filesystem.lines("prefs/prefs.lua") do 
		table.insert( prefs, lines )
	end
end