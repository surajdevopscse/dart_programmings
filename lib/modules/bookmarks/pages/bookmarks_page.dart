import 'package:dart_programing/app/app_services.dart';
import 'package:dart_programing/app/common_widgets/big_text.dart';
import 'package:dart_programing/app/common_widgets/common_height.dart';
import 'package:dart_programing/app/common_widgets/page_header.dart';
import 'package:dart_programing/app/common_widgets/small_text.dart';
import 'package:dart_programing/app/device_screen_type.dart';
import 'package:dart_programing/app/routes/app_pages.dart';
import 'package:dart_programing/utils/constants/colors.dart';
import 'package:dart_programing/utils/constants/common_text_style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/bookmarks_controller.dart';

class BookmarksPage extends GetView<BookmarksController> {
  const BookmarksPage({super.key});

  Color _categoryColor(String category) {
    switch (category) {
      case 'Flutter':
        return Colors.teal;
      case 'Interview':
        return Colors.purple;
      case 'Best Guide':
        return Colors.orange;
      default:
        return Colors.blue;
    }
  }

  IconData _categoryIcon(String category) {
    switch (category) {
      case 'Flutter':
        return Icons.flutter_dash;
      case 'Interview':
        return Icons.record_voice_over;
      case 'Best Guide':
        return Icons.star;
      default:
        return Icons.code;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseWhite,
      body: Stack(
        children: [
          CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              if (!AS.deviceScreenType.isMobile)
                SliverAppBar(
                  toolbarHeight: 60,
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  expandedHeight: 60,
                  floating: false,
                  pinned: true,
                  flexibleSpace: PageHeader(headerName: 'Bookmarks'),
                  backgroundColor: C.primary50,
                ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: ScreenSpecific(
                    desktop: EdgeInsets.only(left: 54.0.w, right: 54.0.w),
                    fallback: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 900),
                    child: Obx(() {
                      final grouped = controller.groupedBookmarks;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CommonHeight(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: BigText(
                                  text: 'Bookmarks',
                                  style: AppStyle.globalBigTextStyle.copyWith(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              if (controller.bookmarks.isNotEmpty)
                                Text(
                                  '${controller.bookmarks.length} saved',
                                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                                ),
                            ],
                          ),
                          const CommonHeight(height: 8),
                          SmallText(
                            text: 'Your saved topics for quick access.',
                          ),
                          const CommonHeight(height: 20),
                          if (controller.bookmarks.isEmpty)
                            _EmptyBookmarks()
                          else
                            ...grouped.entries.map((entry) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      _categoryIcon(entry.key),
                                      size: 18,
                                      color: _categoryColor(entry.key),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      entry.key,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: _categoryColor(entry.key),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                ...entry.value.map((bm) => Dismissible(
                                  key: Key(bm.route),
                                  direction: DismissDirection.endToStart,
                                  background: Container(
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.only(right: 20),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(Icons.delete, color: Colors.white),
                                  ),
                                  onDismissed: (_) => controller.removeBookmark(bm.route),
                                  child: Card(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    elevation: 1,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                        color: _categoryColor(entry.key).withOpacity(0.2),
                                      ),
                                    ),
                                    child: ListTile(
                                      contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 4,
                                      ),
                                      leading: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: _categoryColor(entry.key).withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Icon(
                                          _categoryIcon(entry.key),
                                          color: _categoryColor(entry.key),
                                          size: 20,
                                        ),
                                      ),
                                      title: Text(
                                        bm.title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: const Icon(Icons.delete_outline, size: 18),
                                            color: Colors.grey[400],
                                            onPressed: () => controller.removeBookmark(bm.route),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 14,
                                            color: Colors.grey[400],
                                          ),
                                        ],
                                      ),
                                      onTap: () => AppPages.router.go(bm.route),
                                    ),
                                  ),
                                )),
                                const CommonHeight(height: 16),
                              ],
                            )),
                          const CommonHeight(height: 40),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
          GetBuilder<BookmarksController>(
            builder: (_) => controller.showBackToTopButton
                ? Positioned(
                    bottom: 20,
                    right: 20,
                    child: FloatingActionButton(
                      backgroundColor: AppColors.primary700,
                      onPressed: controller.scrollToTop,
                      child: const Icon(Icons.arrow_upward, color: Colors.white),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class _EmptyBookmarks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.bookmark_border, size: 72, color: Colors.grey[300]),
            const SizedBox(height: 16),
            Text(
              'No bookmarks yet',
              style: TextStyle(fontSize: 18, color: Colors.grey[500]),
            ),
            const SizedBox(height: 8),
            Text(
              'Tap the bookmark icon on any page to save it here.',
              style: TextStyle(fontSize: 13, color: Colors.grey[400]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
