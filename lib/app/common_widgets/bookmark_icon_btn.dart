import 'package:dart_programing/services/bookmarks/bookmark_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookmarkIconBtn extends StatelessWidget {
  final String routePath;
  final String pageTitle;
  const BookmarkIconBtn({super.key, required this.routePath, required this.pageTitle});

  @override
  Widget build(BuildContext context) {
    final bookmarkService = Get.find<BookmarkService>();
    return GetBuilder<BookmarkService>(builder: (_) {
      final saved = bookmarkService.isBookmarked(routePath);
      return IconButton(
        icon: Icon(saved ? Icons.bookmark : Icons.bookmark_border),
        color: saved ? Colors.amber : null,
        tooltip: saved ? 'Remove Bookmark' : 'Bookmark',
        onPressed: () => bookmarkService.toggleBookmark(routePath, pageTitle),
      );
    });
  }
}
