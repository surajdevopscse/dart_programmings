class BlogPost {
  final String id;
  final String title;
  final String subtitle;
  final String author;
  final String authorAvatar;
  final String date;
  final String readTime;
  final String? coverImage;
  final List<String> tags;
  final String content;
  final List<Map<String, dynamic>>? itemParagraphList;

  BlogPost({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.authorAvatar,
    required this.date,
    required this.readTime,
    this.coverImage,
    required this.tags,
    required this.content,
    this.itemParagraphList,
  });

  factory BlogPost.fromJson(Map<String, dynamic> json) {
    return BlogPost(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      author: json['author'] ?? '',
      authorAvatar: json['authorAvatar'] ?? '',
      date: json['date'] ?? '',
      readTime: json['readTime']?.toString() ?? '',
      coverImage: json['coverImage'],
      tags: (json['tags'] as List?)?.map((e) => e.toString()).toList() ?? [],
      content: json['content'] ?? '',
      itemParagraphList: (json['itemParagraphList'] as List?)
          ?.map((e) => Map<String, dynamic>.from(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'author': author,
      'authorAvatar': authorAvatar,
      'date': date,
      'readTime': readTime,
      'coverImage': coverImage,
      'tags': tags,
      'content': content,
      'itemParagraphList': itemParagraphList,
    };
  }
}
