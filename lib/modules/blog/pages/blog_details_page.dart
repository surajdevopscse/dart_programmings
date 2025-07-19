import 'package:dart_programing/modules/blog/pages/shuffled_blog_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/blog_controller.dart';
import 'package:dart_programing/app/responsive.dart';
import '../controllers/shuffled_blog_controller.dart';
import 'package:dart_programing/app/common_widgets/blog_card.dart';

class BlogDetailsApiPage extends GetView<BlogController> {
  final String blogId;
  const BlogDetailsApiPage({Key? key, required this.blogId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.blogData.value == null && !controller.isLoading.value) {
        controller.fetchBlogById(blogId);
      }
    });
    return Scaffold(
      appBar: AppBar(title: const Text('Blog Details (API)')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ResponsivePages(
              mobile: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (controller.error.value.isNotEmpty) {
                  return Center(
                      child: Text('Error: ${controller.error.value}'));
                }
                final blog = controller.blogData.value;
                if (blog == null) {
                  return const Center(child: Text('No data'));
                }
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (blog.coverImage.isNotEmpty)
                        Container(
                          width: double.infinity,
                          height: 180,
                          margin: const EdgeInsets.only(bottom: 16),
                          color: Colors.grey[300],
                          child:
                              Center(child: Text('Image: ${blog.coverImage}')),
                        ),
                      Text(
                        blog.title,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      if (blog.subtitle.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Text(
                            blog.subtitle,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      Row(
                        children: [
                          if (blog.authorAvatar.isNotEmpty)
                            CircleAvatar(
                              backgroundImage: NetworkImage(blog.authorAvatar),
                            ),
                          if (blog.authorAvatar.isNotEmpty)
                            const SizedBox(width: 8),
                          Text(blog.author,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(width: 16),
                          Text(blog.date.split('T').first),
                          const SizedBox(width: 16),
                          Text('Read: ${blog.readTime} min'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ...blog.itemParagraphList.map<Widget>((item) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (item.imageUrl.isNotEmpty)
                              Container(
                                width: double.infinity,
                                height: 120,
                                margin: const EdgeInsets.only(bottom: 8),
                                color: Colors.grey[200],
                                child: Center(
                                    child: Text('Image: ${item.imageUrl}')),
                              ),
                            if (item.title.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0, bottom: 4.0),
                                child: Text(
                                  item.title,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            if (item.content.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Text(item.content),
                              ),
                            if (item.note.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Text('Note: ${item.note}',
                                    style: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.blueGrey)),
                              ),
                            if (item.codeExample.isNotEmpty)
                              Container(
                                width: double.infinity,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: SelectableText(
                                    item.codeExample,
                                    style: const TextStyle(
                                        fontFamily: 'monospace', fontSize: 14),
                                  ),
                                ),
                              ),
                          ],
                        );
                      }).toList(),
                    ],
                  ),
                );
              }),
              tablet: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 32),
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (controller.error.value.isNotEmpty) {
                    return Center(
                        child: Text('Error: ${controller.error.value}'));
                  }
                  final blog = controller.blogData.value;
                  if (blog == null) {
                    return const Center(child: Text('No data'));
                  }
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (blog.coverImage.isNotEmpty)
                          Container(
                            width: double.infinity,
                            height: 180,
                            margin: const EdgeInsets.only(bottom: 16),
                            color: Colors.grey[300],
                            child: Center(
                                child: Text('Image: ${blog.coverImage}')),
                          ),
                        Text(
                          blog.title,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        if (blog.subtitle.isNotEmpty)
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Text(
                              blog.subtitle,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                        Row(
                          children: [
                            if (blog.authorAvatar.isNotEmpty)
                              CircleAvatar(
                                backgroundImage:
                                    NetworkImage(blog.authorAvatar),
                              ),
                            if (blog.authorAvatar.isNotEmpty)
                              const SizedBox(width: 8),
                            Text(blog.author,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(width: 16),
                            Text(blog.date.split('T').first),
                            const SizedBox(width: 16),
                            Text('Read: ${blog.readTime} min'),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ...blog.itemParagraphList.map<Widget>((item) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (item.imageUrl.isNotEmpty)
                                Container(
                                  width: double.infinity,
                                  height: 120,
                                  margin: const EdgeInsets.only(bottom: 8),
                                  color: Colors.grey[200],
                                  child: Center(
                                      child: Text('Image: ${item.imageUrl}')),
                                ),
                              if (item.title.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12.0, bottom: 4.0),
                                  child: Text(
                                    item.title,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              if (item.content.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: Text(item.content),
                                ),
                              if (item.note.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: Text('Note: ${item.note}',
                                      style: const TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.blueGrey)),
                                ),
                              if (item.codeExample.isNotEmpty)
                                Container(
                                  width: double.infinity,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  padding: const EdgeInsets.all(12.0),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: SelectableText(
                                      item.codeExample,
                                      style: const TextStyle(
                                          fontFamily: 'monospace',
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                            ],
                          );
                        }).toList(),
                      ],
                    ),
                  );
                }),
              ),
              desktop: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 260.h, vertical: 32.h),
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (controller.error.value.isNotEmpty) {
                    return Center(
                        child: Text('Error: ${controller.error.value}'));
                  }
                  final blog = controller.blogData.value;
                  if (blog == null) {
                    return const Center(child: Text('No data'));
                  }
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (blog.coverImage.isNotEmpty)
                          Container(
                            width: double.infinity,
                            height: 180.h,
                            margin: const EdgeInsets.only(bottom: 16),
                            color: Colors.grey[300],
                            child: Center(
                                child: Text('Image: ${blog.coverImage}')),
                          ),
                        Text(
                          blog.title,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        if (blog.subtitle.isNotEmpty)
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Text(
                              blog.subtitle,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                        Row(
                          children: [
                            if (blog.authorAvatar.isNotEmpty)
                              CircleAvatar(
                                backgroundImage:
                                    NetworkImage(blog.authorAvatar),
                              ),
                            if (blog.authorAvatar.isNotEmpty)
                              const SizedBox(width: 8),
                            Text(blog.author,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(width: 16),
                            Text(blog.date.split('T').first),
                            const SizedBox(width: 16),
                            Text('Read: ${blog.readTime} min'),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ...blog.itemParagraphList.map<Widget>((item) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (item.imageUrl.isNotEmpty)
                                Container(
                                  width: double.infinity,
                                  height: 120,
                                  margin: const EdgeInsets.only(bottom: 8),
                                  color: Colors.grey[200],
                                  child: Center(
                                      child: Text('Image: ${item.imageUrl}')),
                                ),
                              if (item.title.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12.0, bottom: 4.0),
                                  child: Text(
                                    item.title,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              if (item.content.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: Text(item.content),
                                ),
                              if (item.note.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: Text('Note: ${item.note}',
                                      style: const TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.blueGrey)),
                                ),
                              if (item.codeExample.isNotEmpty)
                                Container(
                                  width: double.infinity,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  padding: const EdgeInsets.all(12.0),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: SelectableText(
                                      item.codeExample,
                                      style: const TextStyle(
                                          fontFamily: 'monospace',
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                            ],
                          );
                        }).toList(),
                      ],
                    ),
                  );
                }),
              ),
            ),
            // Suggestions section with shuffled blogs
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: const ShuffledBlogListPage(),
            ),
          ],
        ),
      ),
    );
  }
}
