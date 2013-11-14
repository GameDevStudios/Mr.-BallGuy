function savePrefs(sfxList)
	if not lf.isDirectory("prefs") then 
		lf.mkdir("prefs")
	end

	local prefsFile = lf.newFile("prefs/prefs.lua")

	prefsFile:open("w")

	prefsFile:write("prefs.music = " .. tostring(prefs.music) .. "\n")
	prefsFile:write("prefs.sfx = " .. tostring(prefs.sfx) .. "\n")
	prefsFile:write("bgm:setVolume(" .. tostring(bgm:getVolume()) .. ")\n")
	prefsFile:write("buttonClick:setVolume(" .. tostring(buttonClick:getVolume()) .. ")\n")
end