-- !! IMPORTANT !! YOU NEED THE MusinessBanager!
-- Script by -TOXIC-#1835
-- i created this for money, 
-- its really shitty to click every fucking time on the sell button,
-- so i made this | Have fun :D

local menu_root = menu.my_root()
local seconds = 5

menu.divider(menu_root, "Cargo Auto Sell")
menu.slider(menu_root, 'ASC Seconds', {"ascseconds"}, "Sets the seconds to wait before selling a new crate", 5, 60, 5, 1, function(value)
    seconds = value
end)
menu.toggle_loop(menu_root, 'Auto Sell Crate', {"loopsellacrate"}, 'Auto sell a crate all x seconds', function()
    menu.trigger_commands("sellacrate")
    util.yield(seconds * 1000)
end)
menu.divider(menu_root, "Others")
menu.action(menu_root, 'Special Cargo all toggles', {"mbcargotoggles"}, "Toggles Monitor, MSP, BBMC, MSMC, ABM & ASM to true", function()
    menu.trigger_commands("monitorcargo on")
    menu.trigger_commands("maxsellcargo on")
    menu.trigger_commands("nobuycdcargo on")
    menu.trigger_commands("nosellcdcargo on")
    menu.trigger_commands("autocompletespecialbuy on")
    menu.trigger_commands("autocompletespecialsell on")
    util.toast("All toggles are activated :D")
end)
util.keep_running()
    
