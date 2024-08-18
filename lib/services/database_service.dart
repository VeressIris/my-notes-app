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

  Future<List<NoteModel>> getUserPublicNotes(String username) async {
    try {
      final data = await client
          .from('users')
          .select('publicNotes')
          .eq('username', username);
      return data.map((item) => NoteModel.fromJson(item)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
