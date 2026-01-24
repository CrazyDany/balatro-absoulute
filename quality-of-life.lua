setting_tabRef = G.UIDEF.settings_tab
function G.UIDEF.settings_tab(tab)
    local setting_tab = setting_tabRef(tab)
    if tab == 'Game' then
        local speed_options = {}
        local options_step = 0.5
        local options_max_speed = 16
        local num_options = options_max_speed / options_step

        for i = 1, num_options do
            speed_options[i] = i * options_step
        end

        local current_index = math.floor(G.SETTINGS.GAMESPEED / options_step + 0.5)
        current_index = math.max(1, math.min(num_options, current_index))

        local speeds = create_option_cycle({
            label = localize('b_set_gamespeed'),
            scale = 0.8,
            options = speed_options,
            opt_callback = 'change_gamespeed',
            current_option = current_index
        })
        setting_tab.nodes[1] = speeds
    end
    return setting_tab
end
