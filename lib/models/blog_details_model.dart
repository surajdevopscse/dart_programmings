class BlogDetailsModel {
  final String id;
  final String title;
  final String subtitle;
  final String author;
  final String authorAvatar;
  final String date;
  final int readTime;
  final String coverImage;
  final List<BlogDetailsParagraph> itemParagraphList;

  BlogDetailsModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.authorAvatar,
    required this.date,
    required this.readTime,
    required this.coverImage,
    required this.itemParagraphList,
  });

  factory BlogDetailsModel.fromJson(Map<String, dynamic> json) {
    return BlogDetailsModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      author: json['author'] ?? '',
      authorAvatar: json['authorAvatar'] ?? '',
      date: json['date'] ?? '',
      readTime: json['readTime'] ?? 0,
      coverImage: json['coverImage'] ?? '',
      itemParagraphList: (json['itemParagraphList'] as List<dynamic>? ?? [])
          .map((e) => BlogDetailsParagraph.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class BlogDetailsParagraph {
  final String title;
  final String content;
  final String note;
  final String imageUrl;
  final String codeExample;
  final String link;

  BlogDetailsParagraph({
    required this.title,
    required this.content,
    required this.note,
    required this.imageUrl,
    required this.codeExample,
    required this.link,
  });

  factory BlogDetailsParagraph.fromJson(Map<String, dynamic> json) {
    return BlogDetailsParagraph(
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      note: json['note'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      codeExample: json['codeExample'] ?? '',
      link: json['link'] ?? '',
    );
  }
} 