import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:my_notes_app/models/note_model.dart';

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

  Future<List<dynamic>> getUserPublicNotes(String username) async {
    try {
      // Fetch public note IDs for the user
      final idsData = await client
          .from('users')
          .select('publicNotes')
          .eq('username', username)
          .single();

      final ids = idsData['publicNotes'].map((id) => id.toString()).toList();

      final x = await client
          .from('notes')
          .select()
          .eq('uid', "f0ba92ea-bfdc-4c01-beef-2a426e231b7c")
          .single();
      print(x);
      return ids;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
