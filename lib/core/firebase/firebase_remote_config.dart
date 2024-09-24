import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

final remoteConfig = FirebaseRemoteConfig.instance;
Future<void> initFirebase() async {
  await Firebase.initializeApp();

  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(minutes: 5),
  ));
  await remoteConfig
      .setDefaults(<String, dynamic>{'is_dark_mode': false, 'isLoaded': true});
  await remoteConfig.fetchAndActivate();

  remoteConfig.onConfigUpdated.listen((event) async {
    await remoteConfig.activate();

    for (var key in event.updatedKeys) {
      if (key == 'is_dark_mode') {
        final isDarkMode = remoteConfig.getBool('is_dark_mode');

        if (isDarkMode) {
          debugPrint('update data $isDarkMode');
        } else {
          debugPrint('update $isDarkMode');
        }
      }
    }
  });
}

Future<String> getWelcomeText() async {
  await remoteConfig.activate();
  final welcomeText = remoteConfig.getString('welcome_text');

  remoteConfig.onConfigUpdated.listen(
    (event) async {
      await remoteConfig.activate();
      for (var key in event.updatedKeys) {
        if (key == 'welcome_text') {
          final data = remoteConfig.getString('welcome_text');
          debugPrint('update data 2 $data');
        }
      }
    },
  );
  return welcomeText;
}
