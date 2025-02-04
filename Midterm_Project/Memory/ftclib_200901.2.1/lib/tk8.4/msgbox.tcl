# msgbox.tcl --
#
#	Implements messageboxes for platforms that do not have native
#	messagebox support.
#
# RCS: @(#) $Id: msgbox.tcl,v 1.1.1.1 2004/07/19 05:51:49 anchor Exp $
#
# Copyright (c) 1994-1997 Sun Microsystems, Inc.
#
# See the file "license.terms" for information on usage and redistribution
# of this file, and for a DISCLAIMER OF ALL WARRANTIES.
#

# Ensure existence of ::tk::dialog namespace
#
namespace eval ::tk::dialog {}

image create bitmap ::tk::dialog::b1 -foreground black \
-data "#define b1_width 32\n#define b1_height 32
static unsigned char q1_bits[] = {
   0x00, 0xf8, 0x1f, 0x00, 0x00, 0x07, 0xe0, 0x00, 0xc0, 0x00, 0x00, 0x03,
   0x20, 0x00, 0x00, 0x04, 0x10, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x10,
   0x04, 0x00, 0x00, 0x20, 0x02, 0x00, 0x00, 0x40, 0x02, 0x00, 0x00, 0x40,
   0x01, 0x00, 0x00, 0x80, 0x01, 0x00, 0x00, 0x80, 0x01, 0x00, 0x00, 0x80,
   0x01, 0x00, 0x00, 0x80, 0x01, 0x00, 0x00, 0x80, 0x01, 0x00, 0x00, 0x80,
   0x01, 0x00, 0x00, 0x80, 0x02, 0x00, 0x00, 0x40, 0x02, 0x00, 0x00, 0x40,
   0x04, 0x00, 0x00, 0x20, 0x08, 0x00, 0x00, 0x10, 0x10, 0x00, 0x00, 0x08,
   0x60, 0x00, 0x00, 0x04, 0x80, 0x03, 0x80, 0x03, 0x00, 0x0c, 0x78, 0x00,
   0x00, 0x30, 0x04, 0x00, 0x00, 0x40, 0x04, 0x00, 0x00, 0x40, 0x04, 0x00,
   0x00, 0x80, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x06, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};"
image create bitmap ::tk::dialog::b2 -foreground white \
-data "#define b2_width 32\n#define b2_height 32
static unsigned char b2_bits[] = {
   0x00, 0x00, 0x00, 0x00, 0x00, 0xf8, 0x1f, 0x00, 0x00, 0xff, 0xff, 0x00,
   0xc0, 0xff, 0xff, 0x03, 0xe0, 0xff, 0xff, 0x07, 0xf0, 0xff, 0xff, 0x0f,
   0xf8, 0xff, 0xff, 0x1f, 0xfc, 0xff, 0xff, 0x3f, 0xfc, 0xff, 0xff, 0x3f,
   0xfe, 0xff, 0xff, 0x7f, 0xfe, 0xff, 0xff, 0x7f, 0xfe, 0xff, 0xff, 0x7f,
   0xfe, 0xff, 0xff, 0x7f, 0xfe, 0xff, 0xff, 0x7f, 0xfe, 0xff, 0xff, 0x7f,
   0xfe, 0xff, 0xff, 0x7f, 0xfc, 0xff, 0xff, 0x3f, 0xfc, 0xff, 0xff, 0x3f,
   0xf8, 0xff, 0xff, 0x1f, 0xf0, 0xff, 0xff, 0x0f, 0xe0, 0xff, 0xff, 0x07,
   0x80, 0xff, 0xff, 0x03, 0x00, 0xfc, 0x7f, 0x00, 0x00, 0xf0, 0x07, 0x00,
   0x00, 0xc0, 0x03, 0x00, 0x00, 0x80, 0x03, 0x00, 0x00, 0x80, 0x03, 0x00,
   0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};"
image create bitmap ::tk::dialog::q -foreground blue \
-data "#define q_width 32\n#define q_height 32
static unsigned char q_bits[] = {
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xe0, 0x07, 0x00,
   0x00, 0x10, 0x0f, 0x00, 0x00, 0x18, 0x1e, 0x00, 0x00, 0x38, 0x1e, 0x00,
   0x00, 0x38, 0x1e, 0x00, 0x00, 0x10, 0x0f, 0x00, 0x00, 0x80, 0x07, 0x00,
   0x00, 0xc0, 0x01, 0x00, 0x00, 0xc0, 0x00, 0x00, 0x00, 0xc0, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0xc0, 0x00, 0x00, 0x00, 0xe0, 0x01, 0x00,
   0x00, 0xe0, 0x01, 0x00, 0x00, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};"
image create bitmap ::tk::dialog::i -foreground blue \
-data "#define i_width 32\n#define i_height 32
static unsigned char i_bits[] = {
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0xe0, 0x01, 0x00, 0x00, 0xf0, 0x03, 0x00, 0x00, 0xf0, 0x03, 0x00,
   0x00, 0xe0, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0xf8, 0x03, 0x00, 0x00, 0xf0, 0x03, 0x00, 0x00, 0xe0, 0x03, 0x00,
   0x00, 0xe0, 0x03, 0x00, 0x00, 0xe0, 0x03, 0x00, 0x00, 0xe0, 0x03, 0x00,
   0x00, 0xe0, 0x03, 0x00, 0x00, 0xe0, 0x03, 0x00, 0x00, 0xf0, 0x07, 0x00,
   0x00, 0xf8, 0x0f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};"
image create bitmap ::tk::dialog::w1 -foreground black \
-data "#define w1_width 32\n#define w1_height 32
static unsigned char w1_bits[] = {
   0x00, 0x80, 0x01, 0x00, 0x00, 0x40, 0x02, 0x00, 0x00, 0x20, 0x04, 0x00,
   0x00, 0x10, 0x04, 0x00, 0x00, 0x10, 0x08, 0x00, 0x00, 0x08, 0x08, 0x00,
   0x00, 0x08, 0x10, 0x00, 0x00, 0x04, 0x10, 0x00, 0x00, 0x04, 0x20, 0x00,
   0x00, 0x02, 0x20, 0x00, 0x00, 0x02, 0x40, 0x00, 0x00, 0x01, 0x40, 0x00,
   0x00, 0x01, 0x80, 0x00, 0x80, 0x00, 0x80, 0x00, 0x80, 0x00, 0x00, 0x01,
   0x40, 0x00, 0x00, 0x01, 0x40, 0x00, 0x00, 0x02, 0x20, 0x00, 0x00, 0x02,
   0x20, 0x00, 0x00, 0x04, 0x10, 0x00, 0x00, 0x04, 0x10, 0x00, 0x00, 0x08,
   0x08, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00, 0x10, 0x04, 0x00, 0x00, 0x10,
   0x04, 0x00, 0x00, 0x20, 0x02, 0x00, 0x00, 0x20, 0x01, 0x00, 0x00, 0x40,
   0x01, 0x00, 0x00, 0x40, 0x01, 0x00, 0x00, 0x40, 0x02, 0x00, 0x00, 0x20,
   0xfc, 0xff, 0xff, 0x1f, 0x00, 0x00, 0x00, 0x00};"
image create bitmap ::tk::dialog::w2 -foreground yellow \
-data "#define w2_width 32\n#define w2_height 32
static unsigned char w2_bits[] = {
   0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x01, 0x00, 0x00, 0xc0, 0x03, 0x00,
   0x00, 0xe0, 0x03, 0x00, 0x00, 0xe0, 0x07, 0x00, 0x00, 0xf0, 0x07, 0x00,
   0x00, 0xf0, 0x0f, 0x00, 0x00, 0xf8, 0x0f, 0x00, 0x00, 0xf8, 0x1f, 0x00,
   0x00, 0xfc, 0x1f, 0x00, 0x00, 0xfc, 0x3f, 0x00, 0x00, 0xfe, 0x3f, 0x00,
   0x00, 0xfe, 0x7f, 0x00, 0x00, 0xff, 0x7f, 0x00, 0x00, 0xff, 0xff, 0x00,
   0x80, 0xff, 0xff, 0x00, 0x80, 0xff, 0xff, 0x01, 0xc0, 0xff, 0xff, 0x01,
   0xc0, 0xff, 0xff, 0x03, 0xe0, 0xff, 0xff, 0x03, 0xe0, 0xff, 0xff, 0x07,
   0xf0, 0xff, 0xff, 0x07, 0xf0, 0xff, 0xff, 0x0f, 0xf8, 0xff, 0xff, 0x0f,
   0xf8, 0xff, 0xff, 0x1f, 0xfc, 0xff, 0xff, 0x1f, 0xfe, 0xff, 0xff, 0x3f,
   0xfe, 0xff, 0xff, 0x3f, 0xfe, 0xff, 0xff, 0x3f, 0xfc, 0xff, 0xff, 0x1f,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};"
image create bitmap ::tk::dialog::w3 -foreground black \
-data "#define w3_width 32\n#define w3_height 32
static unsigned char w3_bits[] = {
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0xc0, 0x03, 0x00, 0x00, 0xe0, 0x07, 0x00, 0x00, 0xe0, 0x07, 0x00,
   0x00, 0xe0, 0x07, 0x00, 0x00, 0xe0, 0x07, 0x00, 0x00, 0xe0, 0x07, 0x00,
   0x00, 0xc0, 0x03, 0x00, 0x00, 0xc0, 0x03, 0x00, 0x00, 0xc0, 0x03, 0x00,
   0x00, 0x80, 0x01, 0x00, 0x00, 0x80, 0x01, 0x00, 0x00, 0x80, 0x01, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x01, 0x00, 0x00, 0xc0, 0x03, 0x00,
   0x00, 0xc0, 0x03, 0x00, 0x00, 0x80, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};"

# ::tk::MessageBox --
#
#	Pops up a messagebox with an application-supplied message with
#	an icon and a list of buttons. This procedure will be called
#	by tk_messageBox if the platform does not have native
#	messagebox support, or if the particular type of messagebox is
#	not supported natively.
#
#	Color icons are used on Unix displays that have a color
#	depth of 4 or more and $tk_strictMotif is not on.
#
#	This procedure is a private procedure shouldn't be called
#	directly. Call tk_messageBox instead.
#
#	See the user documentation for details on what tk_messageBox does.
#
proc ::tk::MessageBox {args} {
    global tcl_platform tk_strictMotif
    variable ::tk::Priv

    set w ::tk::PrivMsgBox
    upvar $w data

    #
    # The default value of the title is space (" ") not the empty string
    # because for some window managers, a 
    #		wm title .foo ""
    # causes the window title to be "foo" instead of the empty string.
    #
    set specs {
	{-default "" "" ""}
        {-icon "" "" "info"}
        {-message "" "" ""}
        {-parent "" "" .}
        {-title "" "" " "}
        {-type "" "" "ok"}
    }

    tclParseConfigSpec $w $specs "" $args

    if {[lsearch -exact {info warning error question} $data(-icon)] == -1} {
	error "bad -icon value \"$data(-icon)\": must be error, info, question, or warning"
    }
    if {[string equal [tk windowingsystem] "classic"]
	    || [string equal [tk windowingsystem] "aqua"]} {
	switch -- $data(-icon) {
	    "error"     {set data(-icon) "stop"}
	    "warning"   {set data(-icon) "caution"}
	    "info"      {set data(-icon) "note"}
	}
    }

    if {![winfo exists $data(-parent)]} {
	error "bad window path name \"$data(-parent)\""
    }

    switch -- $data(-type) {
	abortretryignore { 
	    set names [list abort retry ignore]
	    set labels [list &Abort &Retry &Ignore]
	}
	ok {
	    set names [list ok]
	    set labels {&OK}
	}
	okcancel {
	    set names [list ok cancel]
	    set labels [list &OK &Cancel]
	}
	retrycancel {
	    set names [list retry cancel]
	    set labels [list &Retry &Cancel]
	}
	yesno {
	    set names [list yes no]
	    set labels [list &Yes &No]
	}
	yesnocancel {
	    set names [list yes no cancel]
	    set labels [list &Yes &No &Cancel]
	}
	default {
	    error "bad -type value \"$data(-type)\": must be\
		    abortretryignore, ok, okcancel, retrycancel,\
		    yesno, or yesnocancel"
	}
    }

    set buttons {}
    foreach name $names lab $labels {
	lappend buttons [list $name -text [mc $lab]]
    }

    # If no default button was specified, the default default is the 
    # first button (Bug: 2218).

    if {$data(-default) == ""} {
	set data(-default) [lindex [lindex $buttons 0] 0]
    }

    set valid 0
    foreach btn $buttons {
	if {[string equal [lindex $btn 0] $data(-default)]} {
	    set valid 1
	    break
	}
    }
    if {!$valid} {
	error "invalid default button \"$data(-default)\""
    }

    # 2. Set the dialog to be a child window of $parent
    #
    #
    if {[string compare $data(-parent) .]} {
	set w $data(-parent).__tk__messagebox
    } else {
	set w .__tk__messagebox
    }

    # 3. Create the top-level window and divide it into top
    # and bottom parts.

    catch {destroy $w}
    toplevel $w -class Dialog
    wm title $w $data(-title)
    wm iconname $w Dialog
    wm protocol $w WM_DELETE_WINDOW { }
    # There is only one background colour for the whole dialog
    set bg [$w cget -background]

    # Message boxes should be transient with respect to their parent so that
    # they always stay on top of the parent window.  But some window managers
    # will simply create the child window as withdrawn if the parent is not
    # viewable (because it is withdrawn or iconified).  This is not good for
    # "grab"bed windows.  So only make the message box transient if the parent
    # is viewable.
    #
    if {[winfo viewable [winfo toplevel $data(-parent)]] } {
	wm transient $w $data(-parent)
    }    

    if {[string equal [tk windowingsystem] "classic"]
	    || [string equal [tk windowingsystem] "aqua"]} {
	unsupported::MacWindowStyle style $w dBoxProc
    }

    frame $w.bot -background $bg
    pack $w.bot -side bottom -fill both
    frame $w.top -background $bg
    pack $w.top -side top -fill both -expand 1
    if {![string equal [tk windowingsystem] "classic"]
	    && ![string equal [tk windowingsystem] "aqua"]} {
	$w.bot configure -relief raised -bd 1
	$w.top configure -relief raised -bd 1
    }

    # 4. Fill the top part with bitmap and message (use the option
    # database for -wraplength and -font so that they can be
    # overridden by the caller).

    option add *Dialog.msg.wrapLength 3i widgetDefault
    if {[string equal [tk windowingsystem] "classic"]
	    || [string equal [tk windowingsystem] "aqua"]} {
	option add *Dialog.msg.font system widgetDefault
    } else {
	option add *Dialog.msg.font {Times 18} widgetDefault
    }

    label $w.msg -anchor nw -justify left -text $data(-message) \
	    -background $bg
    if {[string compare $data(-icon) ""]} {
	if {([string equal [tk windowingsystem] "classic"]
		|| [string equal [tk windowingsystem] "aqua"])
		|| ([winfo depth $w] < 4) || $tk_strictMotif} {
	    label $w.bitmap -bitmap $data(-icon) -background $bg
	} else {
	    canvas $w.bitmap -width 32 -height 32 -highlightthickness 0 \
		    -background $bg
	    switch $data(-icon) {
		error {
		    $w.bitmap create oval 0 0 31 31 -fill red -outline black
		    $w.bitmap create line 9 9 23 23 -fill white -width 4
		    $w.bitmap create line 9 23 23 9 -fill white -width 4
		}
		info {
		    $w.bitmap create image 0 0 -anchor nw \
			    -image ::tk::dialog::b1
		    $w.bitmap create image 0 0 -anchor nw \
			    -image ::tk::dialog::b2
		    $w.bitmap create image 0 0 -anchor nw \
			    -image ::tk::dialog::i
		}
		question {
		    $w.bitmap create image 0 0 -anchor nw \
			    -image ::tk::dialog::b1
		    $w.bitmap create image 0 0 -anchor nw \
			    -image ::tk::dialog::b2
		    $w.bitmap create image 0 0 -anchor nw \
			    -image ::tk::dialog::q
		}
		default {
		    $w.bitmap create image 0 0 -anchor nw \
			    -image ::tk::dialog::w1
		    $w.bitmap create image 0 0 -anchor nw \
			    -image ::tk::dialog::w2
		    $w.bitmap create image 0 0 -anchor nw \
			    -image ::tk::dialog::w3
		}
	    }
	}
    }
    grid $w.bitmap $w.msg -in $w.top -sticky news -padx 2m -pady 2m
    grid columnconfigure $w.top 1 -weight 1
    grid rowconfigure $w.top 0 -weight 1

    # 5. Create a row of buttons at the bottom of the dialog.

    set i 0
    foreach but $buttons {
	set name [lindex $but 0]
	set opts [lrange $but 1 end]
	if {![llength $opts]} {
	    # Capitalize the first letter of $name
	    set capName [string toupper $name 0]
	    set opts [list -text $capName]
	}

	eval [list tk::AmpWidget button $w.$name -padx 3m] $opts \
		[list -command [list set tk::Priv(button) $name]]

	if {[string equal $name $data(-default)]} {
	    $w.$name configure -default active
	} else {
	    $w.$name configure -default normal
	}
	grid $w.$name -in $w.bot -row 0 -column $i -padx 3m -pady 2m -sticky ew
	grid columnconfigure $w.bot $i -uniform buttons
        incr i

	# create the binding for the key accelerator, based on the underline
	#
        # set underIdx [$w.$name cget -under]
        # if {$underIdx >= 0} {
        #     set key [string index [$w.$name cget -text] $underIdx]
        #     bind $w <Alt-[string tolower $key]>  [list $w.$name invoke]
        #     bind $w <Alt-[string toupper $key]>  [list $w.$name invoke]
        # }
    }
    bind $w <Alt-Key> [list ::tk::AltKeyInDialog $w %A]

    if {[string compare {} $data(-default)]} {
	bind $w <FocusIn> {
	    if {[string equal Button [winfo class %W]]} {
		%W configure -default active
	    }
	}
	bind $w <FocusOut> {
	    if {[string equal Button [winfo class %W]]} {
		%W configure -default normal
	    }
	}
    }

    # 6. Create a binding for <Return> on the dialog

    bind $w <Return> {
	if {[string equal Button [winfo class %W]]} {
	    tk::ButtonInvoke %W
	}
    }

    # 7. Withdraw the window, then update all the geometry information
    # so we know how big it wants to be, then center the window in the
    # display and de-iconify it.

    ::tk::PlaceWindow $w widget $data(-parent)

    # 8. Set a grab and claim the focus too.

    if {[string compare $data(-default) ""]} {
	set focus $w.$data(-default)
    } else {
	set focus $w
    }
    ::tk::SetFocusGrab $w $focus

    # 9. Wait for the user to respond, then restore the focus and
    # return the index of the selected button.  Restore the focus
    # before deleting the window, since otherwise the window manager
    # may take the focus away so we can't redirect it.  Finally,
    # restore any grab that was in effect.

    vwait ::tk::Priv(button)

    ::tk::RestoreFocusGrab $w $focus

    return $Priv(button)
}
