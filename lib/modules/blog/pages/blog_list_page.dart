import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dart_programing/app/common_widgets/blog_card.dart';
import 'package:dart_programing/modules/home/controllers/home_controller.dart';

class BlogListPage extends StatefulWidget {
  const BlogListPage({Key? key}) : super(key: key);

  @override
  State<BlogListPage> createState() => _BlogListPageState();
}

class _BlogListPageState extends State<BlogListPage> {
  final HomeController controller = Get.find<HomeController>();
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  final int _perPage = 15;
  List blogsToShow = [];

  @override
  void initState() {
    super.initState();
    _loadMore();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      _loadMore();
    }
  }

  void _loadMore() {
    final allBlogs = controller.blogs;
    final nextPageBlogs = allBlogs.skip(blogsToShow.length).take(_perPage).toList();
    if (nextPageBlogs.isNotEmpty) {
      setState(() {
        blogsToShow.addAll(nextPageBlogs);
        _currentPage++;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = 1;
    final width = MediaQuery.of(context).size.width;
    if (width > 900) {
      crossAxisCount = 3;
    } else if (width > 600) {
      crossAxisCount = 2;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Blogs'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: GridView.builder(
          controller: _scrollController,
          itemCount: blogsToShow.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: 2.0,
          ),
          itemBuilder: (context, index) {
            final blog = blogsToShow[index];
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
                  // Navigate to blog details
                  // You may want to use AppPages.router.go('/blog/ {blog.id}');
                },
              ),
            );
          },
        ),
      ),
    );
  }
} 