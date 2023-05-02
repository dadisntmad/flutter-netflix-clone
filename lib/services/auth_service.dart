import 'package:netflix_clone/api/auth_client.dart';
import 'package:netflix_clone/api/user_client.dart';
import 'package:netflix_clone/services/user_data_service.dart';

class AuthService {
  final _authClient = AuthClient();
  final _userClient = UserClient();
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

    final user = await _userClient.fetchAccountDetails(sessionId);

    await _userDataService.setSessionId(sessionId);
    await _userDataService.setAccountId(user.id);
  }

  Future<void> logout() async {
    final sessionId = await _userDataService.getSessionId();

    await _authClient.signOut(sessionId!);
    await _userDataService.deleteSessionId();
    await _userDataService.deleteAccountId();
  }
}
