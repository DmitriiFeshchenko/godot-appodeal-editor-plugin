tool
extends Node
# Appodeal Signals Custom Type Node

signal initialization_finished(errors)

signal ad_revenue_received(params)

signal inapp_purchase_validation_succeded(json)
signal inapp_purchase_validation_failed(reason)

signal mrec_loaded(is_precache)
signal mrec_failed_to_load()
signal mrec_shown()
signal mrec_show_failed()
signal mrec_clicked()
signal mrec_expired()

signal banner_loaded(height, is_precache)
signal banner_failed_to_load()
signal banner_shown()
signal banner_show_failed()
signal banner_clicked()
signal banner_expired()

signal interstitial_loaded(is_precache)
signal interstitial_failed_to_load()
signal interstitial_shown()
signal interstitial_show_failed()
signal interstitial_clicked()
signal interstitial_closed()
signal interstitial_expired()

signal rewarded_video_loaded(is_precache)
signal rewarded_video_failed_to_load()
signal rewarded_video_shown()
signal rewarded_video_show_failed()
signal rewarded_video_clicked()
signal rewarded_video_finished(amount, name)
signal rewarded_video_closed(finished)
signal rewarded_video_expired()

var _instance: Object

func _ready() -> void:
	if Engine.has_singleton("Appodeal"):
		_instance = Engine.get_singleton("Appodeal")
		_connect_signals()

func _connect_signals():
	if !_instance:
		return
	_instance.connect("on_initialization_finished", self, "_on_initialization_finished")
	_instance.connect("on_ad_revenue_received", self, "_on_ad_revenue_received")
	_instance.connect("on_inapp_purchase_validate_success", self, "_on_inapp_purchase_validate_success")
	_instance.connect("on_inapp_purchase_validate_fail", self, "_on_inapp_purchase_validate_fail")
	_instance.connect("on_mrec_loaded", self, "_on_mrec_loaded")
	_instance.connect("on_mrec_failed_to_load", self, "_on_mrec_failed_to_load")
	_instance.connect("on_mrec_shown", self, "_on_mrec_shown")
	_instance.connect("on_mrec_show_failed", self, "_on_mrec_show_failed")
	_instance.connect("on_mrec_clicked", self, "_on_mrec_clicked")
	_instance.connect("on_mrec_expired", self, "_on_mrec_expired")
	_instance.connect("on_banner_loaded", self, "_on_banner_loaded")
	_instance.connect("on_banner_failed_to_load", self, "_on_banner_failed_to_load")
	_instance.connect("on_banner_shown", self, "_on_banner_shown")
	_instance.connect("on_banner_show_failed", self, "_on_banner_show_failed")
	_instance.connect("on_banner_clicked", self, "_on_banner_clicked")
	_instance.connect("on_banner_expired", self, "_on_banner_expired")
	_instance.connect("on_interstitial_loaded", self, "_on_interstitial_loaded")
	_instance.connect("on_interstitial_failed_to_load", self, "_on_interstitial_failed_to_load")
	_instance.connect("on_interstitial_shown", self, "_on_interstitial_shown")
	_instance.connect("on_interstitial_show_failed", self, "_on_interstitial_show_failed")
	_instance.connect("on_interstitial_clicked", self, "_on_interstitial_clicked")
	_instance.connect("on_interstitial_closed", self, "_on_interstitial_closed")
	_instance.connect("on_interstitial_expired", self, "_on_interstitial_expired")
	_instance.connect("on_rewarded_video_loaded", self, "_on_rewarded_video_loaded")
	_instance.connect("on_rewarded_video_failed_to_load", self, "_on_rewarded_video_failed_to_load")
	_instance.connect("on_rewarded_video_shown", self, "_on_rewarded_video_shown")
	_instance.connect("on_rewarded_video_show_failed", self, "_on_rewarded_video_show_failed")
	_instance.connect("on_rewarded_video_clicked", self, "_on_rewarded_video_clicked")
	_instance.connect("on_rewarded_video_finished", self, "_on_rewarded_video_finished")
	_instance.connect("on_rewarded_video_closed", self, "_on_rewarded_video_closed")
	_instance.connect("on_rewarded_video_expired", self, "_on_rewarded_video_expired")

func _on_initialization_finished(errors:String):
	emit_signal("initialization_finished", errors)

func _on_ad_revenue_received(params:Dictionary):
	emit_signal("ad_revenue_received", params)

func _on_inapp_purchase_validate_success(json:String):
	emit_signal("inapp_purchase_validation_succeded", json)

func _on_inapp_purchase_validate_fail(reason:String):
	emit_signal("inapp_purchase_validation_failed", reason)

func _on_mrec_loaded(is_precache:bool):
	emit_signal("mrec_loaded", is_precache)

func _on_mrec_failed_to_load():
	emit_signal("mrec_failed_to_load")

func _on_mrec_shown():
	emit_signal("mrec_shown")

func _on_mrec_show_failed():
	emit_signal("mrec_show_failed")

func _on_mrec_clicked():
	emit_signal("mrec_clicked")

func _on_mrec_expired():
	emit_signal("mrec_expired")

func _on_banner_loaded(height:int, is_precache:bool):
	emit_signal("banner_loaded", height, is_precache)

func _on_banner_failed_to_load():
	emit_signal("banner_failed_to_load")

func _on_banner_shown():
	emit_signal("banner_shown")

func _on_banner_show_failed():
	emit_signal("banner_show_failed")

func _on_banner_clicked():
	emit_signal("banner_clicked")

func _on_banner_expired():
	emit_signal("banner_expired")

func _on_interstitial_loaded(is_precache:bool):
	emit_signal("interstitial_loaded", is_precache)

func _on_interstitial_failed_to_load():
	emit_signal("interstitial_failed_to_load")

func _on_interstitial_shown():
	emit_signal("interstitial_shown")

func _on_interstitial_show_failed():
	emit_signal("interstitial_show_failed")

func _on_interstitial_clicked():
	emit_signal("interstitial_clicked")

func _on_interstitial_closed():
	emit_signal("interstitial_closed")

func _on_interstitial_expired():
	emit_signal("interstitial_expired")

func _on_rewarded_video_loaded(is_precache:bool):
	emit_signal("rewarded_video_loaded", is_precache)

func _on_rewarded_video_failed_to_load():
	emit_signal("rewarded_video_failed_to_load")

func _on_rewarded_video_shown():
	emit_signal("rewarded_video_shown")

func _on_rewarded_video_show_failed():
	emit_signal("rewarded_video_show_failed")

func _on_rewarded_video_clicked():
	emit_signal("rewarded_video_clicked")

func _on_rewarded_video_finished(amount:String, name:String):
	emit_signal("rewarded_video_finished", float(amount), name)

func _on_rewarded_video_closed(finished:bool):
	emit_signal("rewarded_video_closed", finished)

func _on_rewarded_video_expired():
	emit_signal("rewarded_video_expired")
