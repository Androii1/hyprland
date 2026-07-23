--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

-- ===== REGLAS PARA APPS QUE ABREN DESDE WAYBAR =====

-- Calendario
hl.window_rule({
    match = { class = "brave-calendar.google.com__-Default" },
    float = true,
    size = { 400, 650 },
    center = true,
})

-- Control de volumen (pavucontrol)
hl.window_rule({
    match = { class = "org.pulseaudio.pavucontrol" },
    float = true,
    size = { 700, 500 },
    center = true,
})

-- Bluetui (ventana flotante)
hl.window_rule({
    match = {
        class = "kitty",
        title = "bluetui"
    },
    float = true,
    size = { 700, 500 },
    center = true,
    border_size = 2,
    rounding = 10,
})

-- 2. Gestor de WiFi (nm-connection-editor o nmtui)
hl.window_rule({
    match = { class = "nm-connection-editor" },
    float = true,
    size = { 800, 600 },
    center = true,
    border_size = 2,
    rounding = 10,
})

--CPU
hl.window_rule({
    match = { class = "kitty", title = "btop" },
    float = true,
    size = { 900, 600 },
    center = true,
})

-- 1. amdgpu_top (monitor de GPU AMD)
hl.window_rule({
    match = {
        class = "kitty",
        title = "amdgpu_top"
    },
    float = true,
    size = { 900, 600 },
    center = true,
    border_size = 2,
    rounding = 10,
})

-- waybar
hl.layer_rule({
    match = { namespace = "waybar" },
    blur = true,
    ignore_alpha = 0.5
})

-- salvapantallas º
hl.window_rule({
    match = { class = "Screensaver" },
    float = true,           -- Debe ser flotante
    fullscreen = true,      -- En pantalla completa
    no_focus = false,        -- recibe el foco
    no_anim = true,         -- Sin animaciones
    border_size = 0,        -- Sin bordes
    no_shadow = true,       -- Sin sombra
    rounding = 0,     -- Sin esquinas redondeadas
    decorate = false, -- Sin decoraciones
})
