#!/usr/bin/env vala

public class MyCalc : Gtk.Window {

    Gtk.Entry entDisp = new Gtk.Entry ();

    public MyCalc () {
        this.destroy.connect (Gtk.main_quit);
        this.title = "Calculator";
        this.resizable = false;
        this.border_width = 0;
        this.window_position = Gtk.WindowPosition.CENTER;
        
        entDisp = new Gtk.Entry ();
        entDisp.editable = false;
        entDisp.set_alignment (1.0f);
        entDisp.set_text("0.");
        entDisp.set_position(2);

        var but_0 = new Gtk.Button.with_label ("0");
        var but_1 = new Gtk.Button.with_label ("1");
        var but_2 = new Gtk.Button.with_label ("2");
        var but_3 = new Gtk.Button.with_label ("3");
        var but_4 = new Gtk.Button.with_label ("4");
        var but_5 = new Gtk.Button.with_label ("5");
        var but_6 = new Gtk.Button.with_label ("6");
        var but_7 = new Gtk.Button.with_label ("7");
        var but_8 = new Gtk.Button.with_label ("8");
        var but_9 = new Gtk.Button.with_label ("9");

        var butCls = new Gtk.Button.with_label ("C");
        var butPercent = new Gtk.Button.with_label ("%");
        var butSqrt = new Gtk.Button.with_label ("√");
        var butDiv = new Gtk.Button.with_label ("÷");
        var butMul = new Gtk.Button.with_label ("×");
        var butMinus = new Gtk.Button.with_label ("-");
        var butPlus = new Gtk.Button.with_label ("+");
        var butEqual = new Gtk.Button.with_label ("=");
        var butDot = new Gtk.Button.with_label (".");
        var butSign = new Gtk.Button.with_label ("±");

        Gtk.Button [] list_button = {
            but_0, but_1, but_2, but_3, but_4, but_5, but_6, but_7, but_8, but_9,
            butCls, butPercent, butSqrt, butDiv, butMul, butMinus, butPlus, butEqual, butDot, butSign};
        foreach (Gtk.Button button in list_button) {
            button.clicked.connect (this.on_clicked);
        } 

        var grid = new Gtk.Grid();
        this.add(grid);

        grid.attach(entDisp,    0, 0, 4, 1);

        grid.attach(butCls,     0, 1, 1, 1);
        grid.attach(butPercent, 1, 1, 1, 1);
        grid.attach(butSqrt,    2, 1, 1, 1);
        grid.attach(butDiv,     3, 1, 1, 1);

        grid.attach(but_7,      0, 2, 1, 1);
        grid.attach(but_8,      1, 2, 1, 1);
        grid.attach(but_9,      2, 2, 1, 1);
        grid.attach(butMul,     3, 2, 1, 1);

        grid.attach(but_4,      0, 3, 1, 1);
        grid.attach(but_5,      1, 3, 1, 1);
        grid.attach(but_6,      2, 3, 1, 1);
        grid.attach(butMinus,   3, 3, 1, 1);

        grid.attach(but_1,      0, 4, 1, 1);
        grid.attach(but_2,      1, 4, 1, 1);
        grid.attach(but_3,      2, 4, 1, 1);
        grid.attach(butPlus,    3, 4, 1, 1);

        grid.attach(but_0,      0, 5, 1, 1);
        grid.attach(butDot,     1, 5, 1, 1);
        grid.attach(butSign,    2, 5, 1, 1);
        grid.attach(butEqual,   3, 5, 1, 1);
    }

    void on_clicked (Gtk.Button button) {
        print (button.get_label() + " button is clicked.\n");
    }
}

public static int main (string[] args) {
    Gtk.init (ref args);

    MyCalc app = new MyCalc ();
    app.show_all ();
    Gtk.main ();
    return 0;
}


