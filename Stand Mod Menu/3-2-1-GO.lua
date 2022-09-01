--[[
	Script by -TOXIC-#1835
	Its a simple script you can use by races or other to count :D
]]
local menu_root = menu.my_root()
local customTimer = menu.list(menu_root, 'Custom Countdown (Chat)', {""})
local presetTimer = menu.list(menu_root, 'Preset Counters (Chat)', {""})
local chatspammer = menu.list(menu_root, 'Chat Spammer', {""})
local autoCommend = menu.list(menu_root, 'Auto Commend', {""})
local countdownDuration = 3
local texttospam = "3-2-1-GO by -TOXIC-#1835\ndiscord.gg/QeRaF3Jg3j"
local acPlayer = "None"
local chatspamdelay = 100
local acDelay = 100
local scriptRunning = true
local function countDown(seconds, teamChat)
	while seconds > 0 do
		chat.send_message(
			seconds.."...",
			teamChat,
			true,
			true
		)
		seconds = seconds - 1
		-- AUDIO.PLAY_SOUND_FROM_ENTITY(-1, 'Explosion_01', PLAYER.PLAYER_PED_ID(), 'FBI_HEIST_ELEVATOR_SHAFT_DEBRIS_SOUNDS', false, 20) ### Won't play the Sound
		util.yield(1000)
	end
	chat.send_message(
		"GOOO",
		teamChat,
		true,
		true
	)
end
if scriptRunning == true then
	util.toast("[3-2-1-GO]\n\nScript by -TOXIC-#1835 | Version: 1.6.0")
end
chat.on_message(function(packet_sender, message_sender, text, team_chat)
	if team_chat == true then
		if text == "5s" then
			menu.trigger_commands("startcounter5steam")
		elseif text == "3s" then
			menu.trigger_commands("startcounter3steam")
		elseif text == "10s" then
			menu.trigger_commands("startcounter10steam")
		end
	else
    	if text == "5s" then
			menu.trigger_commands("startcounter5s")
		elseif text == "3s" then
			menu.trigger_commands("startcounter3s")
		elseif text == "10s" then
			menu.trigger_commands("startcounter10s")
		end
	end
end)
menu.divider(autoCommend, "!NOT TESTED USE AT YOUR OWN RISK!")
menu.divider(autoCommend, "- Config -")
menu.divider(chatspammer, "Chat Spammer")
menu.divider(presetTimer, "Preset Counters (Chat)")
menu.divider(customTimer, "Custom Countdown (Chat) | Murten#1154")
menu.slider(customTimer, "Countdown duration", {"countdownduration"}, "sets the duration of the countdown :D", 0, 60, 3, 1, function (value)
	countdownDuration = value
end)
local isTimerRunning = false
menu.text_input(autoCommend, 'Player Name', {'acpname'}, 'Sets the name of the player to commend', function(acpn)
	acPlayer = acpn
end)
menu.slider(autoCommend, "Waiting Time", {"acwt"}, "sets the time to wait before commend again", 100, 10000, 100, 100, function (value)
	acDelay = value
end)
menu.divider(autoCommend, "- Action -")
menu.toggle_loop(autoCommend, 'Commend (friendly)', {'acscf'}, 'Starts/Stop commending', function()
	if acPlayer == "None" then
		util.toast("[3-2-1-GO]\n\nPlayer name not set!")
		util.yield(1500)
	else
		menu.trigger_commands("commendfriendly "..acPlayer)
		util.yield(acDelay)
	end
end)
menu.toggle_loop(autoCommend, 'Commend (helpful)', {'acsch'}, 'Starts/Stop commending', function()
	if acPlayer == "None" then
		util.toast("[3-2-1-GO]\n\nPlayer name not set!")
		util.yield(1500)
	else
		menu.trigger_commands("commendhelpful "..acPlayer)
		util.yield(acDelay)
	end
end)
menu.divider(autoCommend, "!NOT TESTED USE AT YOUR OWN RISK!")
menu.action(customTimer, 'Start countdown (All)', {'startcountdown'}, 'Starts the countdown :D', function() --Button

	if isTimerRunning then
		return
	end
	isTimerRunning = true

	local currentCountDownDur = countdownDuration
	while currentCountDownDur > 0 do
		chat.send_message(
			currentCountDownDur.."...",
			false, -- in team chat
			true, -- add to local history
			true  -- networked
		)
		currentCountDownDur = currentCountDownDur - 1
		util.yield(1000)
	end
	chat.send_message(
		"GOOOO",
		false, -- in team chat
		true, -- add to local history
		true  -- networked
	)
	isTimerRunning = false
end)
menu.action(customTimer, 'Start countdown (Team)', {'startcountdownteam'}, 'Starts the countdown :D', function() --Button

	if isTimerRunning then
		return
	end
	isTimerRunning = true

	local currentCountDownDur = countdownDuration
	while currentCountDownDur > 0 do
		chat.send_message(
			currentCountDownDur.."...",
			true, -- in team chat
			true, -- add to local history
			true  -- networked
		)
		currentCountDownDur = currentCountDownDur - 1
		util.yield(1000)
	end
	chat.send_message(
		"GOOOO",
		true, -- in team chat
		true, -- add to local history
		true  -- networked
	)
	isTimerRunning = false
end)
menu.action(presetTimer, 'Start 3s (All)', {'startcounter3s'}, 'Starts the 3 seconds Counter :D', function() --Button
	countDown(3, false)
end)
menu.action(presetTimer, 'Start 5s (All)', {'startcounter5s'}, 'Starts the 5 seconds Counter :D', function() --Button
	countDown(5, false)
end)
menu.action(presetTimer, 'Start 10s (All)', {'startcounter10s'}, 'Starts the 10 seconds Counter :D', function() --Button
	countDown(10, false)
end)
menu.action(presetTimer, 'Start 3s (Team)', {'startcounter3steam'}, 'Starts the 3 seconds Counter :D', function() --Button
	countDown(3, true)
end)
menu.action(presetTimer, 'Start 5s (Team)', {'startcounter5steam'}, 'Starts the 5 seconds Counter :D', function() --Button
	countDown(5, true)
end)
menu.action(presetTimer, 'Start 10s (Team)', {'startcounter10steam'}, 'Starts the 10 seconds Counter :D', function() --Button
	countDown(10, true)
end)
menu.text_input(chatspammer, 'Text to Spam', {'tts'}, 'Sets the text to spam :)', function(tts) 
	texttospam = tts
end, texttospam)
menu.slider(chatspammer, "Spam Delay", {"spamdelay"}, "sets the delay of the spam :)", 10, 60000, 100, 1, function (value)
	chatspamdelay = value
end)
menu.toggle_loop(chatspammer, "Spam (All)", {"spamall"}, "Spams in the all chat", function()
		chat.send_message(
			texttospam,
			false,
			true,
			true
		)
		util.yield(chatspamdelay)
end)
menu.toggle_loop(chatspammer, "Spam (Team)", {"spamteam"}, "Spams in the team chat", function()
	chat.send_message(
		texttospam,
		true,
		true,
		true
	)
	util.yield(chatspamdelay)
end)
menu.action(menu_root, "How many cats do I have?", {''}, "Look how many cats you have", function()
	local cats = math.random(0, 100)
	util.yield(989)
	util.toast('You have '..cats..' Cats')
	chat.send_message(
		"EVERYONE! I have "..cats.." Cats :D",
		false, --in Team Chat
		true, -- in Local History (will show the message in your chat)
		true -- Networked (will show the message by other players in the chat)
	)
end)
menu.action(menu_root, 'Send "Chat Commands" to Chat (All)', {""}, "Sends the Chat Command (for this script) in the Chat (All) everyone can use this", function()
	chat.send_message(
		"3s - Starts the 3 seconds countdown\n5s - Starts the 5 seconds countdown\n10s - Starts the 10 seconds countdown",
		false,
		true,
		true
	)
end)
menu.action(menu_root, 'Send "Chat Commands" to Chat (Team)', {""}, "Sends the Chat Command (for this script) in the Chat (Team) everyone can use this", function()
	chat.send_message(
		"3s - Starts the 3 seconds countdown\n5s - Starts the 5 seconds countdown\n10s - Starts the 10 seconds countdown",
		true,
		true,
		true
	)
end)
menu.hyperlink(menu_root, "Join Discord", "https://discord.gg/QeRaF3Jg3j", 'write "$321go" in any chat you want')
if scriptRunning == true then
	util.on_stop(function()
		util.toast("[3-2-1-GO]\n\nBye! Thanks for using :D <3")
	end)
end
util.keep_running()
