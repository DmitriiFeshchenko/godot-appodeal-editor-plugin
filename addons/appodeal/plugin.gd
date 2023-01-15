tool
extends EditorPlugin

func _enter_tree() -> void:
	add_autoload_singleton("Appodeal", "res://addons/appodeal/appodeal.gd")
	add_autoload_singleton("AppodealNetwork", "res://addons/appodeal/appodeal_network.gd")
	add_autoload_singleton("AppodealViewPosition", "res://addons/appodeal/appodeal_view_position.gd")
	add_custom_type("AppodealSignals", "Node", preload("res://addons/appodeal/appodeal_signals.gd"), preload("res://addons/appodeal/icon.png"))

func _exit_tree() -> void:
	remove_custom_type("AppodealSignals")
	remove_autoload_singleton("Appodeal")
	remove_autoload_singleton("AppodealNetwork")
	remove_autoload_singleton("AppodealViewPosition")
