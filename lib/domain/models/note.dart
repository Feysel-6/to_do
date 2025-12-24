class Note{
  const Note({required this.title, required this.date, required this.content, this.category});

  final String title;
  final String date;
  final String content;
  final String? category;

  Map<String,String> toJson(){
    return {
      'title': title,
      'date': date,
      'note': content,
      'category': category ?? 'none'
    };
  }
}