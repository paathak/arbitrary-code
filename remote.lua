-- ==========================================
-- DEPENDENCIES & CORE INITIALIZATION
-- ==========================================
local keyboard = libs.keyboard;
local win      = libs.win;
local utf8     = libs.utf8;
local mouse    = libs.mouse;
local timer    = libs.timer;

-- Hold/Tap tracking state
local hold_timer = nil
local was_held   = false

-- Touchpad speed modifier
local SPEED = 1.5
local dragging = false

-- ==========================================
-- SPECIALIZED GESTURE MECHANICALS
-- ==========================================

--@help Handle short-tap vs long-press timeout initialization
actions.hold_start_fullscreen = function()
    was_held = false
    -- Schedule the heavy action F11 after 800 milliseconds
    hold_timer = timer.timeout(function()
        keyboard.stroke("f11") -- Long press action: F11
        was_held = true
    end, 800)
end

--@help Resolve state execution when finger lifts from button
actions.hold_stop_fullscreen = function()
    -- Stop the timer loop safely so it doesn't fire late
    if hold_timer then
        timer.cancel(hold_timer)
        hold_timer = nil
    end
    
    -- If the timer never expired, run standard short tap assignment
    if not was_held then
        keyboard.stroke("F") -- Short press action: Fullscreen
    end
end

--@help Handle short-tap vs long-press timeout initialization
actions.hold_start_left_click_ref = function()
    was_held = false
    -- Schedule the heavy action (Window/Esc) after 800 milliseconds
    hold_timer = timer.timeout(function()
        keyboard.stroke("control","r") -- Long press action: refresh
        was_held = true
    end, 800)
end

--@help Resolve state execution when finger lifts from button
actions.hold_stop_left_click_ref = function()
    -- Stop the timer loop safely so it doesn't fire late
    if hold_timer then
        timer.cancel(hold_timer)
        hold_timer = nil
    end
    
    -- If the timer never expired, run standard short tap assignment
    if not was_held then
        mouse.click("left") -- Short press action: Fullscreen
    end
end

--@help Handle short-tap vs long-press timeout initialization
actions.hold_start_back_esc = function()
    was_held = false
    -- Schedule the heavy action (Window/Esc) after 800 milliseconds
    hold_timer = timer.timeout(function()
        keyboard.stroke("escape") -- Long press action: esc
        was_held = true
    end, 800)
end

--@help Resolve state execution when finger lifts from button
actions.hold_stop_back_esc = function()
    -- Stop the timer loop safely so it doesn't fire late
    if hold_timer then
        timer.cancel(hold_timer)
        hold_timer = nil
    end
    
    -- If the timer never expired, run standard short tap assignment
    if not was_held then
        keyboard.stroke("alt","left") -- Short press action: browser back
    end
end

-- ==========================================
-- SYSTEM & POWER CONTROLS
-- ==========================================

--@help Put system in sleep state
actions.sleep = function()
    os.execute("systemctl suspend")
end

--@help System shutdown
actions.shutdown = function()
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
actions.launch_home = function()
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

--@help Scroll page up (PgUp)
actions.pg_up = function()
    keyboard.stroke("shift", "space")
end

--@help Scroll page down (PgDn)
actions.pg_down = function()
    keyboard.stroke("space")
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

actions.tap = function()
    if dragging then
        mouse.dragend()
        mouse.up()
        dragging = false
    else
        mouse.click("left")
    end
end

actions.hold = function()
    mouse.dragbegin()
    mouse.down()
    dragging = true
end

actions.up = function()
    if dragging then
        mouse.dragend()
        mouse.up()
        dragging = false
    end
end

actions.delta = function(id, x, y)
    mouse.moveraw(x * SPEED, y * SPEED)
end

actions.double = function()
    mouse.double("left")
end

actions.left = function()
    mouse.click("left")
end

actions.right = function()
    mouse.click("right")
end
