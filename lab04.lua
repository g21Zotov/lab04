#!/usr/bin/lua5.3	


lgi = require("lgi")

gtk = lgi.require ("Gtk","3.0")
gtk.init()

bld = gtk.Builder()
bld:add_from_file("g21_zotov lab04 c.glade")

ui = bld.objects

function ui.btn1: on_clicked(...)
	ui.wnd2:show_all()
	ui.entry2.text = ui.entry.text
end	

function ui.btn2: on_clicked(...)
	ui.wnd1:destroy()
end	

function ui.btn3: on_clicked(...)
	ui.wnd2:hide()
end

function f()
	msg = gtk.MessageDialog
{
	message_type = gtk.MessageType.INFO,
	buttons = gtk.ButtonsType.OK,
	text = "Ваше имя -",
	secondary_text = ui.entry.text
}

msg:run()
msg.on_response = msg:hide()
end

ui.btn4.on_clicked = f

ui.wnd1.on_destroy = gtk.main_quit
ui.wnd1:show_all()

gtk.main()
