
public class Template.Indicator: Wingpanel.Indicator {

    private Gtk.Image display_widget;
    private Gtk.Box popover_widget;
    
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
            Gtk.ToggleButton toggle_30_min = new Gtk.ToggleButton();
            toggle_30_min.set_label("For 30 minutes");
            toggle_30_min.margin_start = button_padding;
            toggle_30_min.margin_end = button_padding;
            toggle_30_min.set_can_focus(false);
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
                        
            popover_widget.add(toggle_state_toggle);
            popover_widget.add(bar_separator);
            popover_widget.add(toggle_until_disabled);
            popover_widget.add(toggle_30_min);
            popover_widget.add(toggle_1_hr);
            popover_widget.add(toggle_2_hr);
            popover_widget.add(toggle_6_hr);
            
        }

        return popover_widget;
    }
    
    void toggleState() {
        
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

    var indicator = new Template.Indicator();
    return indicator;
}
