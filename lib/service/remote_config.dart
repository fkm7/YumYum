import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseRemoteConfigService {
  FirebaseRemoteConfigService._() {
    _initialize();
  }

  static final _instance = FirebaseRemoteConfigService._();
  static FirebaseRemoteConfigService getInstance() => _instance;

  final _remoteConfig = FirebaseRemoteConfig.instance;

  final defaults = <String, dynamic>{
    FirebaseRemoteConfigKeys.showOffers: false,
    FirebaseRemoteConfigKeys.showPromocode: true,
  };

  void _initialize() async {
    await _remoteConfig.setDefaults(defaults);
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 5),
    ),);
    await _remoteConfig.fetchAndActivate();
    await _remoteConfig.ensureInitialized();
  }

  bool get showOffers =>
      _remoteConfig.getBool(FirebaseRemoteConfigKeys.showOffers);
  bool get showPromocodes =>
      _remoteConfig.getBool(FirebaseRemoteConfigKeys.showPromocode);
}

class FirebaseRemoteConfigKeys {
  static const showOffers = 'showOffers';
  static const showPromocode = 'showPromocodes';
}
