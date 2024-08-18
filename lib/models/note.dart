class Note {
  final String uid;
  final String title;
  final Map<String, dynamic> content;
  final String dateCreated;
  final String tags;

  Note({
    required this.uid,
    required this.title,
    required this.content,
    required this.dateCreated,
    required this.tags,
  });
}
