import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class _Keys {
  static const sessionId = 'session_id';
}

class UserDataService {
  static const _storage = FlutterSecureStorage();

  Future<String?> getSessionId() => _storage.read(key: _Keys.sessionId);

  Future<void> setSessionId(String value) {
    return _storage.write(key: _Keys.sessionId, value: value);
  }

  Future<void> deleteSessionId() {
    return _storage.delete(key: _Keys.sessionId);
  }
}
