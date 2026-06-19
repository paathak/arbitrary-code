local keyboard = libs.keyboard;
local win      = libs.win;
local utf8     = libs.utf8;
local mouse    = libs.mouse;

-- ==========================================
-- SYSTEM & POWER CONTROLS
-- ==========================================
--@help Put system in sleep state
actions.sleep = function ()
    os.execute("systemctl suspend")
end

--@help System shutdown
actions.shutdown = function ()
    os.execute("systemctl poweroff")
end

--@help Close current app
actions.close_app = function()
    keyboard.stroke("alt", "f4")
end

-- ==========================================
-- BROWSER & NAVIGATION CONTROLS
-- ==========================================
--@help Open new tab
actions.new_tab = function()
    keyboard.stroke("control", "T")
end

--@help Type address
actions.address = function()
    keyboard.stroke("control", "L")
    device.keyboard()
end

--@help Close current tab
actions.close_tab = function()
    keyboard.stroke("control", "W")
end

--@help Launch Home site
actions.launch_home = function ()
    keyboard.stroke("alt", "Home")
end

--@help Scroll page up
actions.scroll_up = function()
    keyboard.stroke("up")
end

--@help Scroll page down
actions.scroll_down = function()
    keyboard.stroke("down")
end

--@help Go back
actions.back = function()
    keyboard.stroke("alt","left")
end

--@help Go forward
actions.forward = function()
    keyboard.stroke("alt","right")
end

--@help Scroll page up (PgUp)
actions.pg_up = function()
    keyboard.stroke("shift","space")
end

--@help Scroll page down (PgDn)
actions.pg_down = function()
    keyboard.stroke("space")
end

--@help Fullscreen view
actions.fullscreen = function()
    keyboard.stroke("F")
end

--@help Windowed view
actions.window = function()
    keyboard.stroke("escape")
end

-- ==========================================
-- MEDIA CONTROLS
-- ==========================================
--@help Seek forward
actions.forward = function()
    keyboard.stroke("right")
end

--@help Seek backward
actions.rewind = function()
    keyboard.stroke("left")
end

--@help Toggle playback state
actions.play_pause = function()
    keyboard.stroke("space")
end

--@help Volume up
actions.volume_up = function()
    keyboard.stroke("volumeup")
end

--@help Volume down
actions.volume_down = function()
    keyboard.stroke("volumedown")
end

--@help Mute volume
actions.volume_mute = function()
    keyboard.stroke("volumemute")
end

-- ==========================================
-- MOUSE & TOUCHPAD LOGIC
-- ==========================================
dragging = false
local SPEED = 2

actions.tap = function ()
    if dragging then
        mouse.dragend()
        mouse.up()
        dragging = false
    else
        mouse.click("left")
    end
end

actions.hold = function ()
    mouse.dragbegin()
    mouse.down()
    dragging = true
end

actions.up = function ()
    if dragging then
        mouse.dragend()
        mouse.up()
        dragging = false
    end
end

actions.delta = function (id, x, y)
    mouse.moveraw(x * SPEED, y * SPEED)
end

actions.double = function ()
    mouse.double("left")
end

actions.left = function ()
    mouse.click("left")
end

actions.right = function ()
    mouse.click("right")
end
