local keyboard = libs.keyboard;
local win = libs.win;
local utf8 = libs.utf8;





--@help Put system in sleep state
actions.sleep = function ()
	os.execute("systemctl suspend")
end

--@help Close current tab
actions.close_app = function()
	--actions.switch();
	keyboard.stroke("alt", "f4");
end

--@help System shutdown
actions.shutdown = function ()
    os.execute("systemctl poweroff");
end

--@help Open new tab
actions.new_tab = function()
	--actions.switch();
	keyboard.stroke("control", "T");
end

--@help Type address
actions.address = function()
	--actions.switch();
	keyboard.stroke("control", "L");
	device.keyboard();
end

--@help Close current tab
actions.close_tab = function()
	--actions.switch();
	keyboard.stroke("control", "W");
end

--@help Seek forward
actions.forward = function()
	-- actions.switch();
	keyboard.stroke("right");  
end

--@help Toggle playback state
actions.play_pause = function()
	-- actions.switch();
	keyboard.stroke("space");
end

--@help Seek backward
actions.rewind = function()
	-- actions.switch();
	keyboard.stroke("left");
end



dragging = false;

local mouse = libs.mouse;

function update (r)
	--server.update({id = "touch", text = r });
end

actions.down = function ()
	update("down");
end

actions.up = function ()
	update("up");
end

actions.tap = function ()
	update("tap");
	if (dragging) then
		dragging = false;
		mouse.dragend();
		mouse.up();
	else
		mouse.click("left");
	end
end

actions.double = function ()
	update("double");
	mouse.double("left");
end

actions.hold = function ()
	update("hold");
	mouse.down();
	mouse.dragbegin();
	dragging = true;
end

actions.delta = function  (id, x, y)
	update("delta: " .. x .. " " .. y);
	mouse.moveraw(x, y);
end

actions.left = function ()
	mouse.click("left");
end

actions.right = function ()
	mouse.click("right");
end

--@help Launch Home site
actions.launch_home = function ()
   keyboard.stroke("alt", "Home");
end


--@help Raise volume
actions.volume_up = function()
	keyboard.stroke("volumeup");
end

--@help Lower volume
actions.volume_down = function()
	keyboard.stroke("volumedown");
end

--@help Mute volume
actions.volume_mute = function()
	keyboard.stroke("volumemute");
end

--@help Scroll page up
actions.scroll_up = function()
	-- actions.switch();
	keyboard.stroke("up");
end

--@help Scroll page down
actions.scroll_down = function()
	-- actions.switch();
	keyboard.stroke("down");
end

--@help Fullscreen view
actions.fullscreen = function()
	-- actions.switch();
	keyboard.stroke("F");
end

--@help Windowed view
actions.window = function()
	-- actions.switch();
	keyboard.stroke("escape");
end

--@help Scroll page up
actions.pg_up = function()
	-- actions.switch();
	keyboard.stroke("pgup");
end

--@help Scroll page down
actions.pg_down = function()
	-- actions.switch();
	keyboard.stroke("pgdown");
end










