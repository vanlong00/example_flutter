import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../models/more_app/more_app.dart';

const _kMoreAppKey = 'more_apps';

@lazySingleton
class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> init() async {
    try {
      final remoteConfigSettings = RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 3),
        minimumFetchInterval: kDebugMode ? Duration.zero : const Duration(hours: 1),
      );
      await _remoteConfig.setConfigSettings(remoteConfigSettings);
      await _remoteConfig.setDefaults({
        _kMoreAppKey: """[{
"icon": "https://play-lh.googleusercontent.com/UI_SQ0Kuc2K3KcHNAZwg1YsPJbIv8dYi8FFyGgrvUmgpryK88Wu448rfZGzdMKx8r3k",
"name": "Roblox Skins & Clothes",
"packageName": "vn.pamg.roblox.skinmaker",
"banner": "https://play-lh.googleusercontent.com/SvjyqqHqqWUFFF4RCCcRD1IeKhYuFUyZF2f0mbK5wvOTBpfkjK06fjkbWnj15V-I",
"description": "Create fashionable clothing for Roblox skins and design vibrant avatars!"
}]""",
      }); // Default to empty list if key is missing
      await _remoteConfig.fetchAndActivate();
    } catch (e) {
      debugPrint('[RemoteConfigService] init error: $e');
    }
  }

  List<MoreApp> getMoreApps() {
    try {
      final jsonString = _remoteConfig.getString(_kMoreAppKey);
      if (jsonString.isEmpty) return [];

      final list = jsonDecode(jsonString) as List<dynamic>;
      return list.map((e) => MoreApp.fromJson(e as Map<String, dynamic>)).toList();
    } catch (e) {
      debugPrint('[RemoteConfigService] getMoreApps error: $e');
      return [];
    }
  }
}
