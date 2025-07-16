import 'package:dart_programing/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../modules/home/controllers/home_controller.dart';
import 'blog_card.dart';
import 'package:dart_programing/app/routes/app_pages.dart';
class GlobalBlogCardsSection extends StatelessWidget {
  const GlobalBlogCardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return Obx(() {
      final blogs = controller.blogs.take(6).toList();
      return Container(
        color: C.primary50,
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Latest Blogs',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.2,
              ),
            ),
            const SizedBox(height: 24),
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = 1;
                if (constraints.maxWidth > 900) {
                  crossAxisCount = 3;
                } else if (constraints.maxWidth > 600) {
                  crossAxisCount = 2;
                }
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: blogs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: 2.0, // was 1.3, now 2.0 for smaller cards
                  ),
                  itemBuilder: (context, index) {
                    final blog = blogs[index];
                    return AspectRatio(
                      aspectRatio: 1.3,
                      child: BlogCard(
                        id: blog.id,
                        title: blog.title,
                        subtitle: blog.subtitle,
                        author: blog.author,
                        authorAvatar: blog.authorAvatar,
                        date: blog.date,
                        readTime: blog.readTime,
                        coverImage: blog.coverImage,
                        onTap: () {
                         AppPages.router.go("/blogs/${blog.id}");                          // Navigate to blog details using GoRouter
                        },
                      ),
                    );
                  },
                );
              },
            ),
            // Add Show More link below the GridView
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () {
                  AppPages.router.go('/blogs');
                },
                child: const Text(
                  'Show More',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
} 