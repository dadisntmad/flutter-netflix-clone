import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class _Keys {
  static const sessionId = 'session_id';
  static const accountId = 'account_id';
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

  Future<int?> getAccountId() async {
    final id = await _storage.read(key: _Keys.accountId);

    return id != null ? int.tryParse(id) : null;
  }

  Future<void> setAccountId(int value) {
    return _storage.write(key: _Keys.accountId, value: value.toString());
  }

  Future<void> deleteAccountId() {
    return _storage.delete(key: _Keys.accountId);
  }
}
