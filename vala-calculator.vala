#!/usr/bin/env vala

public class MyCalc : Gtk.Window {

    // global varioables
    Gtk.Entry entDisp = new Gtk.Entry ();

    bool flag_dot = false;
    bool flag_entrystarted = false;

    string entry = "";
    string result = "";
    string operation = "";

    // ------------------------------------------------------------------------
    //  CONSTRUCTOR
    // ------------------------------------------------------------------------
    public MyCalc () {
        this.destroy.connect (Gtk.main_quit);
        this.title = "Calculator";
        this.resizable = false;
        this.border_width = 0;
        this.window_position = Gtk.WindowPosition.CENTER;

        // for display
        entDisp.can_focus = false;
        entDisp.editable = false;
        entDisp.set_alignment (1.0f);
        this.doClear();

        // number buttons
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

        // operation buttons
        var butDiv = new Gtk.Button.with_label ("÷");
        var butMul = new Gtk.Button.with_label ("×");
        var butMinus = new Gtk.Button.with_label ("-");
        var butPlus = new Gtk.Button.with_label ("+");
        var butEqual = new Gtk.Button.with_label ("=");

        // function buttons
        var butPercent = new Gtk.Button.with_label ("%");
        var butSqrt = new Gtk.Button.with_label ("√");
        var butSign = new Gtk.Button.with_label ("±");

        // other buttons
        var butCls = new Gtk.Button.with_label ("C");
        var butDot = new Gtk.Button.with_label (".");

        // connect function for button clicking
        Gtk.Button [] list_button = {
            but_0, but_1, but_2, but_3, but_4, but_5, but_6, but_7, but_8, but_9,
            butCls, butPercent, butSqrt, butDiv, butMul, butMinus, butPlus, butEqual, butDot, butSign
        };
        foreach (Gtk.Button button in list_button) {
            button.clicked.connect (this.on_clicked);
        } 

        // layout
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

    // ------------------------------------------------------------------------
    //  void on_clicked - button click event
    // 
    //  argument
    //    Gtk.Button button : button object clicked
    // ------------------------------------------------------------------------
    void on_clicked (Gtk.Button button) {
        //print (button.get_label() + " button is clicked.\n");
        switch (button.get_label()) {
            case "0":
            case "1":
            case "2":
            case "3":
            case "4":
            case "5":
            case "6":
            case "7":
            case "8":
            case "9":
                this.doApp(button.get_label());
                break;
            case "+":
            case "-":
            case "×":
            case "÷":
                this.doOpe(button.get_label());
                break;
            case ".":
                this.doDot();
                break;
            case "±":
                this.doSign();
                break;
            case "√":
                this.doSqrt();
                break;
            case "=":
                this.doEqual();
                break;
            case "C":
                this.doClear();
                break;
        }
    }

    // ------------------------------------------------------------------------
    //  void disp - display result on the calculator
    //
    //  argument
    //    string what : number in string format to be displayed
    // ------------------------------------------------------------------------
    void disp (string what) {
        // check if what includes "." or not.
        string dispStr;
        if (!what.contains(".")) {
            dispStr = what + ".";
        } else {
            dispStr = what;
        }
        // update display
        entDisp.set_text(dispStr);
        entDisp.set_position(dispStr.length);
    }

    // ------------------------------------------------------------------------
    //  void doApp -  called when number key is clicked
    //
    //  argument
    //    string what : single number either in 0 - 9.
    // ------------------------------------------------------------------------
    void doApp (string what) {
        if (!flag_entrystarted) {
            entry = "0.";
            this.disp(entry);
        }
        if (operation == null) {
            result = "0.";
        }
        if (!(what == "0" && entry == "0.")) {
            flag_entrystarted = true;
            if (flag_dot == true) {
                entry = entry + what;
                this.disp(entry);
            } else {
                if (entry == "0.") {
                    entry = what + ".";
                    this.disp(entry);
                } else {
                    int n = entry.length;
                    if (entry.get_char(n - 1) == '.') {
                        entry = entry.substring(0, n - 1);
                    }
                    entry = entry + what + ".";
                    this.disp(entry);
                }
            }
        }
    }

    // ------------------------------------------------------------------------
    //  void doClear - called when clear button is clicked
    // ------------------------------------------------------------------------
    void doClear () {
        if (!flag_entrystarted) {
            result = "0.";
            operation = null;
        } else {
            flag_entrystarted = false;
        }

        flag_dot = false;

        entry = "0.";
        this.disp(entry);
    }

    // ------------------------------------------------------------------------
    //  void doDot - called when dot button is clicked
    // ------------------------------------------------------------------------
    void doDot () {
        flag_dot = true;
    }

    // ------------------------------------------------------------------------
    //  void doEqual - called when equal button is clicked
    // ------------------------------------------------------------------------
    void doEqual () {
        if (operation != null) {
            switch (operation) {
                case "+":
                    result = @"$(float.parse(result) + float.parse(entry))";
                    break;
                case "-":
                    result = @"$(float.parse(result) - float.parse(entry))";
                    break;
                case "×":
                    result = @"$(float.parse(result) * float.parse(entry))";
                    break;
                case "÷":
                    result = @"$(float.parse(result) / float.parse(entry))";
                    break;
            }
        } else {
            result = entry;
        }
        flag_entrystarted = false;
        operation = null;
        flag_dot = false;

        entry = result;
        this.disp(entry);
    }

    // ------------------------------------------------------------------------
    //  void doOpe - called when operation button is clicked
    //
    //  argument
    //    string what : operation ether in +, -, ×, ÷
    // ------------------------------------------------------------------------
    void doOpe (string what) {
        if (operation != null) this.doEqual ();
        operation = what;
        flag_entrystarted = false;
        flag_dot = false;

        result = entry;
    }

    // ------------------------------------------------------------------------
    //  void doSign - called when ± button is clicked for changing sign 
    // ------------------------------------------------------------------------
    void doSign () {
        flag_entrystarted = false;
        entry = @"$(-1 * float.parse(entry))";
        this.disp(entry);
    }

    // ------------------------------------------------------------------------
    //  void doSqrt - called when √ button is clicked for calculating square root 
    // ------------------------------------------------------------------------
    void doSqrt () {
        flag_entrystarted = false;
        entry = @"$(Math.sqrt(float.parse(entry)))";
        this.disp(entry);
    }
}

    // ------------------------------------------------------------------------
    //  MAIN
    // ------------------------------------------------------------------------
    public static int main (string[] args) {
    Gtk.init (ref args);

    MyCalc app = new MyCalc ();
    app.show_all ();
    Gtk.main ();
    return 0;
}

// ---
//  END PROGRAM