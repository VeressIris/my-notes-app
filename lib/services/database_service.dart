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

  Future<List<Map>> getUserPublicNotes(String username) async {
    try {
      final data = await client
          .from('users')
          .select('publicNotes')
          .eq('username', username);
      return data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
