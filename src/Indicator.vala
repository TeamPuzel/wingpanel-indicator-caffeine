
public class Template.Indicator : Wingpanel.Indicator {

    private Gtk.Image display_widget;
    private Gtk.Grid popover_widget;

    public Indicator () {
        Object (
            code_name: "wingpanel-indicator-caffeine"
        );

        visible = true;
    }

    public override Gtk.Widget get_display_widget() {
        if (display_widget == null) {
            display_widget = new Gtk.Image.from_icon_name("preferences-system-power", Gtk.IconSize.MENU);
        }

        return display_widget;
    }

    public override Gtk.Widget? get_widget() {
        if (popover_widget == null) {
            popover_widget = new Gtk.Grid();
        }

        return popover_widget;
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
