import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/player.dart';
import 'shared_preference.dart';

@LazySingleton(as: SharedPreference)
class SharedPreferenceImpl implements SharedPreference {
  @override
  Future<void> setUser(Player player) async {
    final sharePref = await SharedPreferences.getInstance();
    sharePref.setString('PLAYER_PREF_KEY', json.encode(player.toJson()));
  }

  @override
  Future<Player?> getUser() async {
    final sharePref = await SharedPreferences.getInstance();
    final String? value = sharePref.getString('PLAYER_PREF_KEY');
    if (value != null) {
      final jsonFile = json.decode(value);
      final player = Player.fromJson(jsonFile as Map<String, dynamic>);
      return player;
    }
    return null;
  }
}
