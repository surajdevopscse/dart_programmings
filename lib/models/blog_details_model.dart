import 'dart:convert';

class BlogDetailsModel {
  String? id;
  String? title;
  String? subtitle;
  String? coverImage;
  String? image;
  bool? isApproved;
  String? author;
  String? authorAvatar;
  DateTime? date;
  int? readTime;
  List<Paragraph>? paragraphs;

  BlogDetailsModel({
    this.id,
    this.title,
    this.subtitle,
    this.coverImage,
    this.image,
    this.isApproved,
    this.author,
    this.authorAvatar,
    this.date,
    this.readTime,
    this.paragraphs,
  });

  factory BlogDetailsModel.fromRawJson(String str) =>
      BlogDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BlogDetailsModel.fromJson(Map<String, dynamic> json) =>
      BlogDetailsModel(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        coverImage: json["coverImage"],
        image: json["image"],
        isApproved: json["isApproved"],
        author: json["author"],
        authorAvatar: json["authorAvatar"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        readTime: json["readTime"],
        paragraphs: json["paragraphs"] == null
            ? []
            : List<Paragraph>.from(
                json["paragraphs"]!.map((x) => Paragraph.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "coverImage": coverImage,
        "image": image,
        "isApproved": isApproved,
        "author": author,
        "authorAvatar": authorAvatar,
        "date": date?.toIso8601String(),
        "readTime": readTime,
        "paragraphs": paragraphs == null
            ? []
            : List<dynamic>.from(paragraphs!.map((x) => x.toJson())),
      };
}

class Paragraph {
  String? id;
  String? title;
  String? content;
  String? note;
  String? image;
  String? codeExample;
  String? link;

  Paragraph({
    this.id,
    this.title,
    this.content,
    this.note,
    this.image,
    this.codeExample,
    this.link,
  });

  factory Paragraph.fromRawJson(String str) =>
      Paragraph.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Paragraph.fromJson(Map<String, dynamic> json) => Paragraph(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        note: json["note"],
        image: json["image"],
        codeExample: json["codeExample"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "note": note,
        "image": image,
        "codeExample": codeExample,
        "link": link,
      };
}
