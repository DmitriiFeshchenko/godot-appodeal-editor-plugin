tool
extends Node
# Appodeal API for developers

enum AdType {
	INTERSTITIAL = 1,
	BANNER = 2,
	REWARDED_VIDEO = 4,
	MREC = 8,
}

enum ShowStyle {
	INTERSTITIAL = 1,
	BANNER_BOTTOM = 2,
	BANNER_TOP = 4,
	BANNER_LEFT = 8,
	BANNER_RIGHT = 16,
	REWARDED_VIDEO = 32,
}

enum GdprConsent {
	PERSONALIZED,
	NON_PERSONALIZED,
	UNKNOWN,
}

enum CcpaConsent {
	OPT_IN,
	OPT_OUT,
	UNKNOWN,
}

enum LogLevel {
	VERBOSE,
	DEBUG,
	NONE,
}

enum PlayStorePurchaseType {
	InApp,
	Subs,
}

enum AppStorePurchaseType {
	Consumable,
	NonConsumable,
	AutoRenewableSubscription,
	NonRenewingSubscription,
}

const _PLUGIN_VERSION: String = "2.0.0"
const _PLUGIN_NAME: String = "Appodeal"

var _instance: Object

func _ready() -> void:
	if Engine.has_singleton(_PLUGIN_NAME):
		_instance = Engine.get_singleton(_PLUGIN_NAME)

# API START

func initialize(app_key:String, ad_types:int) -> void:
	if !_is_valid_env():
		return
	_instance.setFramework(_PLUGIN_VERSION, Engine.get_version_info().string)
	_instance.initialize(app_key, ad_types)

func is_initialized(ad_type:int) -> bool:
	if !_is_valid_env():
		return false
	assert(ad_type in AdType.values(), "the function argument is expected to be an AdType value")
	return _instance.isInitialized(ad_type)

func update_gdpr_user_consent(consent:int) -> void:
	if !_is_valid_env():
		return
	assert(consent in GdprConsent.values(), "the function argument is expected to be a GdprConsent value")
	_instance.updateGDPRUserConsent(consent)

func update_ccpa_user_consent(consent:int) -> void:
	if !_is_valid_env():
		return
	assert(consent in CcpaConsent.values(), "the function argument is expected to be a CcpaConsent value")
	_instance.updateCCPAUserConsent(consent)

func is_auto_cache_enabled(ad_type:int) -> bool:
	if !_is_valid_env():
		return false
	assert(ad_type in AdType.values(), "the function argument is expected to be an AdType value")
	return _instance.isAutoCacheEnabled(ad_type)

func cache(ad_types:int) -> void:
	if !_is_valid_env():
		return
	_instance.cache(ad_types)

func show(show_style:int) -> bool:
	if !_is_valid_env():
		return false
	assert(show_style in ShowStyle.values(), "the function argument is expected to be an ShowStyle value")
	return _instance.show(show_style)

func show_for_placement(show_style:int, placement:String) -> bool:
	if !_is_valid_env():
		return false
	assert(show_style in ShowStyle.values(), "the function argument is expected to be an ShowStyle value")
	return _instance.showForPlacement(show_style, placement)

func show_banner_view(x_axis:int, y_axis:int, placement:String) -> bool:
	if !_is_valid_env():
		return false
	return _instance.showBannerView(x_axis, y_axis, placement)

func show_mrec_view(x_axis:int, y_axis:int, placement:String) -> bool:
	if !_is_valid_env():
		return false
	return _instance.showMrecView(x_axis, y_axis, placement)

func hide_banner() -> void:
	if !_is_valid_env():
		return
	_instance.hideBanner()

func hide_banner_view() -> void:
	if !_is_valid_env():
		return
	_instance.hideBannerView()

func hide_mrec_view() -> void:
	if !_is_valid_env():
		return
	_instance.hideMrecView()

func set_auto_cache(ad_types:int, auto_cache:bool) -> void:
	if !_is_valid_env():
		return
	_instance.setAutoCache(ad_types, auto_cache)

func is_loaded(ad_types:int) -> bool:
	if !_is_valid_env():
		return false
	return _instance.isLoaded(ad_types)

func is_precache(ad_type:int) -> bool:
	if !_is_valid_env():
		return false
	assert(ad_type in AdType.values(), "the function argument is expected to be an AdType value")
	return _instance.isPrecache(ad_type)

func set_smart_banners(enabled:bool) -> void:
	if !_is_valid_env():
		return
	_instance.setSmartBanners(enabled)

func is_smart_banners_enabled() -> bool:
	if !_is_valid_env():
		return false
	return _instance.isSmartBannersEnabled()

func set_728x90_banners(enabled:bool) -> void:
	if !_is_valid_env():
		return
	_instance.set728x90Banners(enabled)

func set_banner_animation(animate:bool) -> void:
	if !_is_valid_env():
		return
	_instance.setBannerAnimation(animate)

func set_banner_roatation(left_bannner_rotation:int, right_banner_rotation:int) -> void:
	if !_is_valid_env():
		return
	_instance.setBannerRotation(left_bannner_rotation, right_banner_rotation)

func set_use_safe_area(use_safe_area:bool) -> void:
	if !_is_valid_env():
		return
	_instance.setUseSafeArea(use_safe_area)

func track_inapp_purchase(amount:float, currency:String) -> void:
	if !_is_valid_env():
		return
	_instance.trackInAppPurchase(amount, currency)

func get_networks(ad_type:int) -> Array:
	if !_is_valid_env():
		return []
	return _instance.getNetworks(ad_type)

func disable_network(network:String) -> void:
	if !_is_valid_env():
		return
	_instance.disableNetwork(network)

func disable_network_for_ad_types(network:String, ad_types:int) -> void:
	if !_is_valid_env():
		return
	_instance.disableNetworkForAdTypes(network, ad_types)

func set_user_id(user_id:String) -> void:
	if !_is_valid_env():
		return
	_instance.setUserId(user_id)

func get_user_id() -> String:
	if !_is_valid_env():
		return ""
	return _instance.getUserId()

func get_version() -> String:
	if !_is_valid_env():
		return ""
	return _instance.getVersion()

func get_plugin_version() -> String:
	if !_is_valid_env():
		return ""
	return _instance.getPluginVersion()

func get_segment_id() -> int:
	if !_is_valid_env():
		return -1
	return _instance.getSegmentId()

func set_testing(test_mode:bool) -> void:
	if !_is_valid_env():
		return
	_instance.setTesting(test_mode)

func set_log_level(log_level:int) -> void:
	if !_is_valid_env():
		return
	assert(log_level in LogLevel.values(), "the function argument is expected to be an LogLevel value")
	_instance.setLogLevel(log_level)

func set_custom_filter_bool(name:String, value:bool) -> void:
	if !_is_valid_env():
		return
	_instance.setCustomFilterBool(name, value)

func set_custom_filter_int(name:String, value:int) -> void:
	if !_is_valid_env():
		return
	_instance.setCustomFilterInt(name, value)

func set_custom_filter_float(name:String, value:float) -> void:
	if !_is_valid_env():
		return
	_instance.setCustomFilterFloat(name, value)

func set_custom_filter_string(name:String, value:String) -> void:
	if !_is_valid_env():
		return
	_instance.setCustomFilterString(name, value)

func reset_custom_filter(name:String) -> void:
	if !_is_valid_env():
		return
	_instance.resetCustomFilter(name)

func can_show_for_default_placement(ad_type:int) -> bool:
	if !_is_valid_env():
		return false
	return _instance.canShow(ad_type)

func can_show_for_placement(ad_type:int, placement_name:String) -> bool:
	if !_is_valid_env():
		return false
	return _instance.canShowForPlacement(ad_type, placement_name)

func get_reward_amount(placement_name:String) -> float:
	if !_is_valid_env():
		return 0.0
	return _instance.getRewardAmount(placement_name)

func get_reward_currency(placement_name:String) -> String:
	if !_is_valid_env():
		return ""
	return _instance.getRewardCurrency(placement_name)

func mute_videos_if_calls_muted(is_muted:bool) -> void:
	if !_is_valid_env():
		return
	_instance.muteVideosIfCallsMuted(is_muted)

func start_test_activity() -> void:
	if !_is_valid_env():
		return
	_instance.startTestActivity()

func set_child_directed_treatment(value:bool) -> void:
	if !_is_valid_env():
		return
	_instance.setChildDirectedTreatment(value)

func destroy(ad_types:int) -> void:
	if !_is_valid_env():
		return
	_instance.destroy(ad_types)

func set_extra_data_bool(key:String, value:bool) -> void:
	if !_is_valid_env():
		return
	_instance.setExtraDataBool(key, value)

func set_extra_data_int(key:String, value:int) -> void:
	if !_is_valid_env():
		return
	_instance.setExtraDataInt(key, value)

func set_extra_data_float(key:String, value:float) -> void:
	if !_is_valid_env():
		return
	_instance.setExtraDataFloat(key, value)

func set_extra_data_string(key:String, value:String) -> void:
	if !_is_valid_env():
		return
	_instance.setExtraDataString(key, value)

func reset_extra_data(key:String) -> void:
	if !_is_valid_env():
		return
	_instance.resetExtraData(key)

func get_predicted_ecpm(ad_type:int) -> float:
	if !_is_valid_env():
		return 0.0
	assert(ad_type in AdType.values(), "the function argument is expected to be an AdType value")
	return _instance.getPredictedEcpm(ad_type)

func log_event(event_name:String, params:Dictionary) -> void:
	if !_is_valid_env():
		return
	_instance.logEvent(event_name, params)

func validate_play_store_inapp_purchase(payload:Dictionary) -> void:
	if !_is_valid_env():
		return
	_instance.validatePlayStoreInAppPurchase(payload)

func validate_app_store_inapp_purchase(payload:Dictionary) -> void:
	if !_is_valid_env():
		return
	_instance.validateAppStoreInAppPurchase(payload)

# API END

func _is_valid_env() -> bool:
	if !(OS.get_name() == "Android" or "iOS"):
		push_warning("[APD-GD] Run your app on either Android or iOS device to test Appodeal ads.")
	if !_instance:
		return false
	else:
		return true
