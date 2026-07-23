-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function () 
--   hl.exec_cmd(terminal)
--   hl.exec_cmd("nm-applet")
    hl.exec_cmd("waybar")
    hl.exec_cmd("playerctld daemon")
    hl.exec_cmd("awww-daemon")
    -- Servicios de Walker
    hl.exec_cmd("elephant &")
    hl.exec_cmd("walker --gapplication-service &")
    -- Salvapantallas
    hl.exec_cmd("hypridle &")
    -- Notificaciones
    hl.exec_cmd("wob &")
end)
