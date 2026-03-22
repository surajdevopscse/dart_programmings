import 'package:dart_programing/app/app_services.dart';
import 'package:dart_programing/app/common_widgets/common_height.dart';
import 'package:dart_programing/app/common_widgets/page_header.dart';
import 'package:dart_programing/app/device_screen_type.dart';
import 'package:dart_programing/app/routes/app_pages.dart';
import 'package:dart_programing/modules/search/models/search_result.dart';
import 'package:dart_programing/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/search_controller.dart';

class SearchPage extends GetView<GlobalSearchController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseWhite,
      body: Column(
        children: [
          if (!AS.deviceScreenType.isMobile)
            SizedBox(
              height: 60,
              child: PageHeader(headerName: 'Search'),
            ),
          Padding(
            padding: ScreenSpecific(
              desktop: EdgeInsets.fromLTRB(54.0.w, 16, 54.0.w, 0),
              fallback: const EdgeInsets.fromLTRB(12, 16, 12, 0),
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search TextField
                  TextField(
                    controller: controller.textController,
                    autofocus: true,
                    onChanged: controller.onQueryChanged,
                    onSubmitted: (v) {
                      if (v.trim().isNotEmpty) controller.addRecentSearch(v.trim());
                    },
                    decoration: InputDecoration(
                      hintText: 'Search Dart, Flutter, Interview, Best Practices...',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: Obx(() => controller.query.value.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                controller.textController.clear();
                                controller.onQueryChanged('');
                              },
                            )
                          : const SizedBox.shrink()),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: AppColors.primary700, width: 2),
                      ),
                      filled: true,
                      fillColor: Colors.grey[50],
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Category filter chips
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Obx(() => Row(
                      children: [
                        _CategoryChip(
                          label: 'All',
                          isSelected: controller.selectedCategory.value == null,
                          onTap: () => controller.setCategory(null),
                          color: Colors.grey[700]!,
                        ),
                        const SizedBox(width: 8),
                        _CategoryChip(
                          label: 'Dart',
                          isSelected: controller.selectedCategory.value == SearchCategory.dart,
                          onTap: () => controller.setCategory(SearchCategory.dart),
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 8),
                        _CategoryChip(
                          label: 'Flutter',
                          isSelected: controller.selectedCategory.value == SearchCategory.flutter,
                          onTap: () => controller.setCategory(SearchCategory.flutter),
                          color: Colors.teal,
                        ),
                        const SizedBox(width: 8),
                        _CategoryChip(
                          label: 'Interview',
                          isSelected: controller.selectedCategory.value == SearchCategory.interview,
                          onTap: () => controller.setCategory(SearchCategory.interview),
                          color: Colors.purple,
                        ),
                        const SizedBox(width: 8),
                        _CategoryChip(
                          label: 'Guide',
                          isSelected: controller.selectedCategory.value == SearchCategory.guide,
                          onTap: () => controller.setCategory(SearchCategory.guide),
                          color: Colors.orange,
                        ),
                      ],
                    )),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              final q = controller.query.value;
              if (q.isEmpty) {
                return _RecentSearches(controller: controller);
              }
              final results = controller.results;
              if (results.isEmpty) {
                return _EmptyState(query: q);
              }
              return ListView.builder(
                padding: ScreenSpecific(
                  desktop: EdgeInsets.fromLTRB(54.0.w, 12, 54.0.w, 24),
                  fallback: const EdgeInsets.fromLTRB(12, 12, 12, 24),
                ),
                itemCount: results.length,
                itemBuilder: (context, index) {
                  final result = results[index];
                  return ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 900),
                    child: _ResultTile(
                      result: result,
                      onTap: () {
                        controller.addRecentSearch(q);
                        AppPages.router.go(result.route);
                      },
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color color;

  const _CategoryChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: isSelected ? color : color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color, width: 1.2),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : color,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}

class _ResultTile extends StatelessWidget {
  final SearchResult result;
  final VoidCallback onTap;

  const _ResultTile({required this.result, required this.onTap});

  Color get _categoryColor {
    switch (result.category) {
      case SearchCategory.dart:
        return Colors.blue;
      case SearchCategory.flutter:
        return Colors.teal;
      case SearchCategory.interview:
        return Colors.purple;
      case SearchCategory.guide:
        return Colors.orange;
    }
  }

  String get _categoryLabel {
    switch (result.category) {
      case SearchCategory.dart:
        return 'Dart';
      case SearchCategory.flutter:
        return 'Flutter';
      case SearchCategory.interview:
        return 'Interview';
      case SearchCategory.guide:
        return 'Guide';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _categoryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  _categoryLabel,
                  style: TextStyle(
                    color: _categoryColor,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      result.title,
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      result.preview,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final String query;

  const _EmptyState({required this.query});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.search_off, size: 64, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text(
            'No results for "$query"',
            style: TextStyle(fontSize: 16, color: Colors.grey[500]),
          ),
          const SizedBox(height: 8),
          Text(
            'Try different keywords or browse the categories.',
            style: TextStyle(fontSize: 13, color: Colors.grey[400]),
          ),
        ],
      ),
    );
  }
}

class _RecentSearches extends StatelessWidget {
  final GlobalSearchController controller;

  const _RecentSearches({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.recentSearches.isEmpty) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.search, size: 64, color: Colors.grey[300]),
              const SizedBox(height: 16),
              Text(
                'Search for anything',
                style: TextStyle(fontSize: 16, color: Colors.grey[500]),
              ),
            ],
          ),
        );
      }
      return Padding(
        padding: ScreenSpecific(
          desktop: EdgeInsets.fromLTRB(54.0.w, 16, 54.0.w, 0),
          fallback: const EdgeInsets.fromLTRB(12, 16, 12, 0),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recent Searches',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  TextButton(
                    onPressed: controller.clearRecentSearches,
                    child: const Text('Clear all'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ...controller.recentSearches.map((term) => ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(Icons.history, color: Colors.grey[400], size: 20),
                title: Text(term, style: const TextStyle(fontSize: 14)),
                trailing: Icon(Icons.north_west, size: 14, color: Colors.grey[400]),
                onTap: () => controller.selectRecent(term),
                dense: true,
              )),
            ],
          ),
        ),
      );
    });
  }
}
