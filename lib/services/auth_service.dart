import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  // auth instance
  final SupabaseClient client;
  AuthService({required this.client});

  // register
  Future<String> registerWithEmail(
      String username, String email, String password) async {
    try {
      final response = await client.auth
          .signUp(email: email, password: password, data: {username: username});

      if (response.user == null) {
        throw Exception('User is null');
      }

      return response.user!.id;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // login
  Future<String> loginWithEmail(String email, String password) async {
    try {
      final response = await client.auth
          .signInWithPassword(email: email, password: password);

      if (response.user == null) {
        throw Exception('User is null');
      }

      return response.user!.id;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // logout
  void logout() async {
    try {
      await client.auth.signOut();
      print("Logged out");
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
