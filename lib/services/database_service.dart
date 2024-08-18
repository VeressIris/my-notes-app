import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseService {
  final SupabaseClient client;
  DatabaseService({required this.client});

  Future<void> addUserToDb(String username, String uid) async {
    try {
      await client.from('users').insert({
        'username': username,
        'uid': uid,
        'publicNotes': [],
        'privateNotes': []
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
