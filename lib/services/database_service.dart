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
      final idsData = await client
          .from('users')
          .select('publicNotes')
          .eq('username', username)
          .single();

      final ids = idsData['publicNotes'].map((id) => id.toString()).toList();

      final List<NoteModel> notes = [];
      ids.forEach((id) async {
        final noteData =
            await client.from('notes').select().eq('uid', id).single();
        notes.add(NoteModel.fromJson(noteData));
      });
      return notes;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
