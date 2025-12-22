class Note{
  const Note({required this.title, required this.date, required this.content});

  final String title;
  final String date;
  final String content;

  Map<String,String> toJson(){
    return {
      'title': title,
      'date': date,
      'note': content,
    };
  }
}