class NoteModel {
  final String uid;
  final String title;
  final Map<String, dynamic> content;
  final String dateCreated;
  final List<String> tags;

  NoteModel({
    required this.uid,
    required this.title,
    required this.content,
    required this.dateCreated,
    required this.tags,
  });

  factory NoteModel.fromJson(Map<String, dynamic> data) {
    return NoteModel(
      uid: data['uid'],
      title: data['title'],
      content: data['content'],
      dateCreated: data['dateCreated'],
      tags: data['tags'],
    );
  }
}
