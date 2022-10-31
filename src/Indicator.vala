
public class Caffeine.Indicator: Wingpanel.Indicator {

    private Gtk.Image display_widget;
    private Gtk.Box popover_widget;
    
    Timeout timeout = Timeout.NEVER;
    
    enum Timeout {
        MIN30,
        MIN60,
        MIN120,
        MIN360,
        NEVER
    }
    
    bool is_active = false;

    public Indicator () {
        Object (
            code_name: "wingpanel-indicator-caffeine"
        );

        visible = true;
    }

    public override Gtk.Widget get_display_widget() {
        if (display_widget == null) {
            display_widget = new Gtk.Image.from_icon_name("preferences-system-power-symbolic", Gtk.IconSize.MENU);
        }

        return display_widget;
    }

    public override Gtk.Widget? get_widget() {
        if (popover_widget == null) {
            popover_widget = new Gtk.Box(Gtk.Orientation.VERTICAL, 5);
            
            Granite.SwitchModelButton toggle_state_toggle = new Granite.SwitchModelButton("Prevent sleep");
            toggle_state_toggle.get_style_context().add_class(Granite.STYLE_CLASS_H4_LABEL);
            
            Gtk.Separator bar_separator = new Gtk.Separator(Gtk.Orientation.HORIZONTAL);
            bar_separator.margin_bottom = 3;
            
            int button_padding = 6;
            
            Gtk.ToggleButton toggle_until_disabled = new Gtk.ToggleButton();
            toggle_until_disabled.set_label("Until turned off");
            toggle_until_disabled.margin_start = button_padding;
            toggle_until_disabled.margin_end = button_padding;
            toggle_until_disabled.set_can_focus(false);
            
            Gtk.ToggleButton toggle_half_hr = new Gtk.ToggleButton();
            toggle_half_hr.set_label("For 30 minutes");
            toggle_half_hr.margin_start = button_padding;
            toggle_half_hr.margin_end = button_padding;
            toggle_half_hr.set_can_focus(false);
            
            Gtk.ToggleButton toggle_1_hr = new Gtk.ToggleButton();
            toggle_1_hr.set_label("For 1 hour");
            toggle_1_hr.margin_start = button_padding;
            toggle_1_hr.margin_end = button_padding;
            toggle_1_hr.set_can_focus(false);
            
            Gtk.ToggleButton toggle_2_hr = new Gtk.ToggleButton();
            toggle_2_hr.set_label("For 2 hours");
            toggle_2_hr.margin_start = button_padding;
            toggle_2_hr.margin_end = button_padding;
            toggle_2_hr.set_can_focus(false);
            
            Gtk.ToggleButton toggle_6_hr = new Gtk.ToggleButton();
            toggle_6_hr.set_label("For 6 hours");
            toggle_6_hr.margin_start = button_padding;
            toggle_6_hr.margin_end = button_padding;
            toggle_6_hr.margin_bottom = 3;
            toggle_6_hr.set_can_focus(false);
            
            // Connect the toggle
            toggle_state_toggle.button_press_event.connect( ()=> {
                // TODO: Handle timeout here
                
                if (is_active == false) {
                    is_active = true;
                } else if (is_active == true) {
                    is_active = false;
                }
                return true;
            });
            
            // Connect the buttons
            toggle_until_disabled.button_press_event.connect( ()=> {
                timeout = Timeout.NEVER;
                
                toggle_half_hr.set_active(false);
                toggle_1_hr.set_active(false);
                toggle_2_hr.set_active(false);
                toggle_6_hr.set_active(false);
                
                return true;
            });
            toggle_until_disabled.button_release_event.connect( ()=> {
                toggle_until_disabled.set_active(true);
                return true;
            });
            
            toggle_half_hr.button_press_event.connect( ()=> {
                timeout = Timeout.MIN30;
                
                toggle_until_disabled.set_active(false);
                toggle_1_hr.set_active(false);
                toggle_2_hr.set_active(false);
                toggle_6_hr.set_active(false);
                
                return true;
            });
            toggle_half_hr.button_release_event.connect( ()=> {
                toggle_half_hr.set_active(true);
                return true;
            });
            
            toggle_1_hr.button_press_event.connect( ()=> {
                timeout = Timeout.MIN60;
                
                toggle_until_disabled.set_active(false);
                toggle_half_hr.set_active(false);
                toggle_2_hr.set_active(false);
                toggle_6_hr.set_active(false);
                
                return true;
            });
            toggle_1_hr.button_release_event.connect( ()=> {
                toggle_1_hr.set_active(true);
                return true;
            });
            
            toggle_2_hr.button_press_event.connect( ()=> {
                timeout = Timeout.MIN120;
                
                toggle_until_disabled.set_active(false);
                toggle_half_hr.set_active(false);
                toggle_1_hr.set_active(false);
                toggle_6_hr.set_active(false);
                
                return true;
            });
            toggle_2_hr.button_release_event.connect( ()=> {
                toggle_2_hr.set_active(true);
                return true;
            });
            
            toggle_6_hr.button_press_event.connect( ()=> {
                timeout = Timeout.MIN360;
                
                toggle_until_disabled.set_active(false);
                toggle_half_hr.set_active(false);
                toggle_1_hr.set_active(false);
                toggle_2_hr.set_active(false);
                
                return true;
            });
            toggle_6_hr.button_release_event.connect( ()=> {
                toggle_6_hr.set_active(true);
                return true;
            });
                        
            // Assemble the popover
            popover_widget.add(toggle_state_toggle);
            popover_widget.add(bar_separator);
            popover_widget.add(toggle_until_disabled);
            popover_widget.add(toggle_half_hr);
            popover_widget.add(toggle_1_hr);
            popover_widget.add(toggle_2_hr);
            popover_widget.add(toggle_6_hr);
            
        }

        return popover_widget;
    }
    
    void handle_forever() {
        
    }
    
    void handle_30_min() {
        
    }
    
    void handle_1_hr() {
        
    }
    
    void handle_2_hr() {
        
    }
    
    void handle_6_hr() {
        
    }
    
    void toggle_active() {
        
    }

    public override void opened() {
    }

    public override void closed() {
    }

}

public Wingpanel.Indicator? get_indicator(Module module, Wingpanel.IndicatorManager.ServerType server_type) {
    debug("Activating Template Indicator");

    if (server_type != Wingpanel.IndicatorManager.ServerType.SESSION) {
        return null;
    }

    var indicator = new Caffeine.Indicator();
    return indicator;
}
