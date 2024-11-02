
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pine/utils/mapper.dart';

import '../../models/user/user.dart';

class StorageService {

  StorageService({
    required this.userStringMapper,
    required this.secureStorage,
  });

  static const String userDataKey = "user_data";
  static const String refreshTokenKey = "refresh_token";
  static const String accessTokenKey = "access_token";
  static const String isFirstAccessKey = "first_access";

  final Mapper<User, String> userStringMapper;
  final FlutterSecureStorage secureStorage;

  Future<User?> get userData async {
    final value = await secureStorage.read(key: userDataKey);
    if(value != null){
      return userStringMapper.to(value);
    }
    return null;
  }

  Future<String?> get refreshToken async => await secureStorage.read(key: refreshTokenKey);

  Future<String?> get accessToken async => await secureStorage.read(key: accessTokenKey);

  Future<bool> get isFirstAccess async => !(await secureStorage.containsKey(key: isFirstAccessKey));

  Future<void> storeUserData({required User user}) async {
    await secureStorage.write(
      key: userDataKey,
      value: userStringMapper.from(user),
    );
  }

  Future<void> updateUserSecureStorage({String? username, String? photo}) async {
    final String? userDataString = await secureStorage.read(key: userDataKey);

    if (userDataString != null) {
      Map<String, dynamic> userData = json.decode(userDataString);

      if (username != null) {
        userData['username'] = username;
      }
      if (photo != null && photo.isNotEmpty) {
        userData['avatar'] = photo;
      }

      await secureStorage.write(key: userDataKey, value: json.encode(userData));
    }
  }

  Future<void> storeAccessToken(String accessToken) async => await secureStorage.write(key: accessTokenKey, value: accessToken);

  Future<void> storeRefreshToken(String refreshToken) async => await secureStorage.write(key: refreshTokenKey, value: refreshToken);

  Future<void> setFirstAccess() async => await secureStorage.write(key: isFirstAccessKey, value: "false");

  Future<void> clearStorage() async => await secureStorage.deleteAll();

  Future<void> clearStorageWithoutFirstSeen() async {
    final keys = await secureStorage.readAll();
    for(final key in keys.keys){
      if(key != isFirstAccessKey){
        await secureStorage.delete(key: key);
      }
    }
  }

  Future<void> clearValue(String key) async => await secureStorage.delete(key: key);


}