#!/usr/bin/env vala

public class MyCalc : Gtk.Window {

    public MyCalc () {
        this.destroy.connect (Gtk.main_quit);
        this.title = "Vala Calculator";
        this.border_width = 0;
        this.window_position = Gtk.WindowPosition.CENTER;
        
        var ent0 = new Gtk.Entry ();

        var but0 = new Gtk.Button.with_label ("0");
        var but1 = new Gtk.Button.with_label ("1");
        var but2 = new Gtk.Button.with_label ("2");
        var but3 = new Gtk.Button.with_label ("3");
        var but4 = new Gtk.Button.with_label ("4");
        var but5 = new Gtk.Button.with_label ("5");
        var but6 = new Gtk.Button.with_label ("6");
        var but7 = new Gtk.Button.with_label ("7");
        var but8 = new Gtk.Button.with_label ("8");
        var but9 = new Gtk.Button.with_label ("9");

        var butl = new Gtk.Button.with_label ("C");
        var butc = new Gtk.Button.with_label ("%");
        var buts = new Gtk.Button.with_label ("√");
        var butr = new Gtk.Button.with_label ("÷");
        var butt = new Gtk.Button.with_label ("×");
        var butm = new Gtk.Button.with_label ("-");
        var butp = new Gtk.Button.with_label ("+\n=");
        var butd = new Gtk.Button.with_label (".");
        var butn = new Gtk.Button.with_label ("±");


        var grid = new Gtk.Grid();
        this.add(grid);

        grid.attach(ent0, 0, 0, 4, 1);

        grid.attach(butl, 0, 1, 1, 1);
        grid.attach(butc, 1, 1, 1, 1);
        grid.attach(buts, 2, 1, 1, 1);
        grid.attach(butr, 3, 1, 1, 1);

        grid.attach(but7, 0, 2, 1, 1);
        grid.attach(but8, 1, 2, 1, 1);
        grid.attach(but9, 2, 2, 1, 1);
        grid.attach(butt, 3, 2, 1, 1);

        grid.attach(but4, 0, 3, 1, 1);
        grid.attach(but5, 1, 3, 1, 1);
        grid.attach(but6, 2, 3, 1, 1);
        grid.attach(butm, 3, 3, 1, 1);

        grid.attach(but1, 0, 4, 1, 1);
        grid.attach(but2, 1, 4, 1, 1);
        grid.attach(but3, 2, 4, 1, 1);
        grid.attach(butp, 3, 4, 1, 2);

        grid.attach(but0, 0, 5, 1, 1);
        grid.attach(butd, 1, 5, 1, 1);
        grid.attach(butn, 2, 5, 1, 1);
    }
}

public static int main (string[] args) {
    Gtk.init (ref args);

    MyCalc app = new MyCalc ();
    app.show_all ();
    Gtk.main ();
    return 0;
}


