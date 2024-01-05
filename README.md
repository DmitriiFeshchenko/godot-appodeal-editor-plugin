# Appodeal Plugin for Godot GameEngine

Stable version of Godot Appodeal Plugin is 2.0.0.

*Note, it is not an official Appodeal plugin. There is no one at the moment :)*

# Installation Instructions

Follow these steps to import and set up Appodeal Plugin to your Godot project:

1. Download and unzip the archive of a desired version from
[Releases](https://github.com/DmitriiFeshchenko/godot-appodeal-editor-plugin/releases) page.
2. Copy the contents of `/addons` directory to the corresponding folder in your project. (If you don't have one,
create it manually in the root of your project)
3. On the top menu bar navigate to `Project -> Project Settings`, switch to the `Plugins` tab and
enable `Appodeal` plugin there.

## Platform-specific steps

If you do not plan to build your app for one of the platforms below, you can skip the setup for that platform.

### Android

1. On the top menu bar navigate to `Project -> Install Android Build Template...`
(Skip this step if you have already done this)
2. Copy the contents of `/android` directory from the downloaded archive to
the `/android/plugins/` directory of your project.
3. On the top menu bar navigate to `Project -> Export`, select `Android` platform,
tick `Use Custom Build` checkbox, and set `Min SDK` to at least 21.
4. Activate `Appodeal` under `Plugins` category at `Options` tab.
5. Open the `/android/build/AndroidManifest.xml` file in a text editor and add
the `GAD App Id` as per [instruction](https://docs.appodeal.com/android/get-started#configure-admob-meta-data).

### iOS

1. Copy the contents of `/ios` directory from downloaded archive to the `/ios/plugins/` directory of your project.
2. On the top menu bar navigate to `Project -> Export`, select `iOS` platform and
activate `Appodeal` under `Plugins` category at `Options` tab.
3. Under `Plugins Plist` category replace the `GADApplicationIdentifier` with actual id for your project.

# Building Instructions:

## Android

1. No additional steps are required for the Android platform.

## iOS

1. After exporting the Xcode project, open it up and add an empty Dummy.swift file.
2. Open `General` tab for the target and set `minimum deployments ios` version to at least `12.0`.
3. Make sure the project is correctly signed in on `Signing & Capabilities` tab.

# API

## Methods

```gdscript
Appodeal.initialize(app_key:String, ad_types:int)
Appodeal.is_initialized(ad_type:int)
Appodeal.update_gdpr_user_consent(consent:int)
Appodeal.update_ccpa_user_consent(consent:int)
Appodeal.is_auto_cache_enabled(ad_type:int)
Appodeal.cache(ad_types:int)
Appodeal.show(show_style:int)
Appodeal.show_for_placement(show_style:int, placement:String)
Appodeal.show_banner_view(x_axis:int, y_axis:int, placement:String)
Appodeal.show_mrec_view(x_axis:int, y_axis:int, placement:String)
Appodeal.hide_banner()
Appodeal.hide_banner_view()
Appodeal.hide_mrec_view()
Appodeal.set_auto_cache(ad_types:int, auto_cache:bool)
Appodeal.is_loaded(ad_types:int)
Appodeal.is_precache(ad_type:int)
Appodeal.set_smart_banners(enabled:bool)
Appodeal.is_smart_banners_enabled()
Appodeal.set_728x90_banners(enabled:bool)
Appodeal.set_banner_animation(animate:bool)
Appodeal.set_banner_roatation(left_bannner_rotation:int, right_banner_rotation:int)
Appodeal.set_use_safe_area(use_safe_area:bool)
Appodeal.track_inapp_purchase(amount:float, currency:String)
Appodeal.get_networks(ad_type:int)
Appodeal.disable_network(network:String)
Appodeal.disable_network_for_ad_types(network:String, ad_types:int)
Appodeal.set_user_id(user_id:String)
Appodeal.get_user_id()
Appodeal.get_version()
Appodeal.get_plugin_version()
Appodeal.get_segment_id()
Appodeal.set_testing(test_mode:bool)
Appodeal.set_log_level(log_level:int)
Appodeal.set_custom_filter_bool(name:String, value:bool)
Appodeal.set_custom_filter_int(name:String, value:int)
Appodeal.set_custom_filter_float(name:String, value:float)
Appodeal.set_custom_filter_string(name:String, value:String)
Appodeal.reset_custom_filter(name:String)
Appodeal.can_show_for_default_placement(ad_type:int)
Appodeal.can_show_for_placement(ad_type:int, placement_name:String)
Appodeal.get_reward_amount(placement_name:String)
Appodeal.get_reward_currency(placement_name:String)
Appodeal.mute_videos_if_calls_muted(is_muted:bool)
Appodeal.start_test_activity()
Appodeal.set_child_directed_treatment(value:bool)
Appodeal.destroy(ad_types:int)
Appodeal.set_extra_data_bool(key:String, value:bool)
Appodeal.set_extra_data_int(key:String, value:int)
Appodeal.set_extra_data_float(key:String, value:float)
Appodeal.set_extra_data_string(key:String, value:String)
Appodeal.reset_extra_data(key:String)
Appodeal.get_predicted_ecpm(ad_type:int)
Appodeal.log_event(event_name:String, params:Dictionary)
Appodeal.validate_play_store_inapp_purchase(payload:Dictionary)
Appodeal.validate_app_store_inapp_purchase(payload:Dictionary)
```

Events Validation Example

```gdscript
if (OS.get_name() == "Android"):
    var additionalParams = {
        "user_id":"007",
        "sessions_count":"1"
    }
    var payload = {
        "purchase_type":Appodeal.PlayStorePurchaseType.InApp,
        "public_key":"111",
        "signature":"222",
        "purchase_data":"333",
        "purchase_token":"666",
        "purchase_timestamp":0,
        "developer_payload":"777",
        "order_id":"555",
        "sku":"444",
        "price":"1.99",
        "currency":"USD",
        "additional_parameters":additionalParams
    }
    Appodeal.validate_play_store_inapp_purchase(payload)
if (OS.get_name() == "iOS"):
    var additionalParams = {
        "user_id":"007",
        "sessions_count":1
    }
    var payload = {
        "purchase_type":Appodeal.AppStorePurchaseType.Consumable,
        "product_id":"500_gold_coins",
        "transaction_id":"42",
        "price":"2",
        "currency":"USD",
        "additional_parameters":additionalParams
    }
    Appodeal.validate_app_store_inapp_purchase(payload)
```

## Signals

```gdscript
initialization_finished(errors)

ad_revenue_received(params)

inapp_purchase_validation_succeded(json)
inapp_purchase_validation_failed(reason)

mrec_loaded(is_precache)
mrec_failed_to_load()
mrec_shown()
mrec_show_failed()
mrec_clicked()
mrec_expired()

banner_loaded(height, is_precache)
banner_failed_to_load()
banner_shown()
banner_show_failed()
banner_clicked()
banner_expired()

interstitial_loaded(is_precache)
interstitial_failed_to_load()
interstitial_shown()
interstitial_show_failed()
interstitial_clicked()
interstitial_closed()
interstitial_expired()

rewarded_video_loaded(is_precache)
rewarded_video_failed_to_load()
rewarded_video_shown()
rewarded_video_show_failed()
rewarded_video_clicked()
rewarded_video_finished(amount, name)
rewarded_video_closed(finished)
rewarded_video_expired()
```

Check out the demo project (link below) to get familiar with correct usage of Appodeal SDK API.

# Links:

### [Demo Project](https://github.com/DmitriiFeshchenko/godot-appodeal-demo-project)

### [Changelog](CHANGELOG.md)

### [iOS Plugin](https://github.com/DmitriiFeshchenko/godot-appodeal-ios-plugin)

### [Android Plugin](https://github.com/DmitriiFeshchenko/godot-appodeal-android-plugin)
