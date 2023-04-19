import 'package:netflix_clone/api/auth_client.dart';
import 'package:netflix_clone/services/user_data_service.dart';

class AuthService {
  final _authClient = AuthClient();
  final _userDataService = UserDataService();

  Future<bool> isAuthenticated() async {
    final sessionId = await _userDataService.getSessionId();
    final isAuth = sessionId != null;
    return isAuth;
  }

  Future<void> login(String username, String password) async {
    final sessionId = await _authClient.signIn(
      username: username,
      password: password,
    );

    await _userDataService.setSessionId(sessionId);
  }
}
