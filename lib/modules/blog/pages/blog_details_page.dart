import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/blog_controller.dart';

class BlogDetailsPage extends StatelessWidget {
  const BlogDetailsPage({Key? key}) : super(key: key);

  Widget _sectionTitle(String title) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      );

  Widget _sectionSubtitle(String subtitle) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          subtitle,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      );

  Widget _sectionBody(String body) => Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Text(
          body,
          style: const TextStyle(fontSize: 15),
        ),
      );

  Widget _codeBlock(String code) => Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SelectableText(
            code,
            style: const TextStyle(
              fontFamily: 'monospace',
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('5 Essential Flutter & Dart Techniques'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionTitle('5 Essential Flutter and Dart Techniques for Building High-Performance Apps'),
              _sectionBody('Flutter and Dart have transformed cross-platform app development, offering speed, flexibility, and a rich ecosystem. However, building high-performance apps requires mastering key optimization techniques. In this post, we explore five critical Flutter and Dart topics—app size reduction, state management, animations, null safety, and widget optimization—to help you create fast, efficient, and user-friendly apps without sacrificing functionality.'),
              // 1. Reducing App Size
              _sectionTitle('1. Reducing App Size with Smart Configurations'),
              _sectionSubtitle('The Challenge: Bloated App Bundles'),
              _sectionBody('Flutter apps can grow large due to unused assets, universal APKs, or unoptimized dependencies, impacting download rates and user experience.'),
              _sectionSubtitle('Solution'),
              _sectionBody('By enabling ABI splitting, cleaning assets, and using ProGuard, you can significantly reduce app size. For example, splitting APKs per architecture can cut sizes dramatically without affecting features.'),
              _sectionSubtitle('Note'),
              _sectionBody('Smaller apps improve user retention, especially on low-storage devices.'),
              _sectionSubtitle('Code Example'),
              _codeBlock('flutter build apk --split-per-abi'),
              // 2. State Management
              _sectionTitle('2. Mastering State Management with Provider'),
              _sectionSubtitle('The Challenge: Managing App State Efficiently'),
              _sectionBody('Complex apps require robust state management to handle UI updates and data flow without performance bottlenecks.'),
              _sectionSubtitle('Solution'),
              _sectionBody('The Provider package simplifies state management by offering a lightweight, scalable solution. Use ChangeNotifierProvider to manage state and notify widgets of changes efficiently.'),
              _sectionSubtitle('Note'),
              _sectionBody('Provider is ideal for most apps due to its simplicity and performance.'),
              _sectionSubtitle('Code Example'),
              _codeBlock("""import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int _count = 0;
  int get count => _count;
  void increment() {
    _count++;
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Counter(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Consumer<Counter>(
            builder: (context, counter, child) => Text('Count: \$counter.count'),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.read<Counter>().increment(),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
"""),
              // 3. Animations
              _sectionTitle('3. Creating Smooth Animations with Flutter'),
              _sectionSubtitle('The Challenge: Engaging Users with Fluid Animations'),
              _sectionBody('Animations enhance UX but can be tricky to implement without causing jank or performance issues.'),
              _sectionSubtitle('Solution'),
              _sectionBody('Use Flutter’s AnimationController and Tween for smooth, custom animations. Leverage implicit animations like AnimatedContainer for simpler transitions.'),
              _sectionSubtitle('Note'),
              _sectionBody('Always dispose of AnimationController to prevent memory leaks.'),
              _sectionSubtitle('Code Example'),
              _codeBlock("""import 'package:flutter/material.dart';

class AnimatedBox extends StatefulWidget {
  @override
  _AnimatedBoxState createState() => _AnimatedBoxState();
}

class _AnimatedBoxState extends State<AnimatedBox> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 100).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: _animation.value,
          height: _animation.value,
          color: Colors.blue,
        );
      },
    );
  }
}
"""),
              // 4. Null Safety
              _sectionTitle('4. Leveraging Dart’s Null Safety for Robust Code'),
              _sectionSubtitle('The Challenge: Avoiding Null Reference Errors'),
              _sectionBody('Null reference bugs can crash apps and frustrate users, especially in large codebases.'),
              _sectionSubtitle('Solution'),
              _sectionBody('Dart’s sound null safety ensures variables are non-nullable by default, reducing runtime errors. Use ?, !, or late initialization wisely to handle nullable types.'),
              _sectionSubtitle('Note'),
              _sectionBody('Migrate to null safety for better reliability and maintainability.'),
              _sectionSubtitle('Code Example'),
              _codeBlock("""class User {
  String name;
  int? age; // Nullable type

  User(this.name, {this.age});

  String getDescription() {
    return 'Name: \$name, Age: \$age ?? 'Unknown'';
  }
}

void main() {
  final user = User('Alice', age: null);
  print(user.getDescription()); // Name: Alice, Age: Unknown
}
"""),
              // 5. Widget Optimization
              _sectionTitle('5. Optimizing Widget Trees for Performance'),
              _sectionSubtitle('The Challenge: Avoiding Widget Rebuild Overload'),
              _sectionBody('Unoptimized widget trees can lead to excessive rebuilds, slowing down your app and impacting UX.'),
              _sectionSubtitle('Solution'),
              _sectionBody('Use const constructors, StatelessWidget where possible, and ValueKey to prevent unnecessary rebuilds. Split complex widgets into smaller, reusable ones.'),
              _sectionSubtitle('Note'),
              _sectionBody('Profile your app with Flutter DevTools to identify rebuild bottlenecks.'),
              _sectionSubtitle('Code Example'),
              _codeBlock("""import 'package:flutter/material.dart';

class OptimizedWidget extends StatelessWidget {
  final String title;

  const OptimizedWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: ListTile(
        title: Text('Static Content'),
        subtitle: Text('This won’t rebuild unnecessarily'),
      ),
    );
  }
}
"""),
              // Conclusion
              _sectionTitle('Conclusion: Building Better Flutter Apps'),
              _sectionBody('By focusing on app size, state management, animations, null safety, and widget optimization, you can create Flutter apps that are fast, reliable, and delightful to use. Start implementing these techniques today to elevate your app’s performance without compromising on features.'),
              _sectionSubtitle('Note'),
              _sectionBody('Small tweaks in configuration and coding practices can yield big performance gains.'),
            ],
          ),
        ),
      ),
    );
  }
}

class BlogDetailsApiPage extends StatelessWidget {
  final String blogId;
  const BlogDetailsApiPage({Key? key, required this.blogId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BlogController controller = Get.put(BlogController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.blogData.value == null && !controller.isLoading.value) {
        controller.fetchBlogById(blogId);
      }
    });
    return Scaffold(
      appBar: AppBar(title: const Text('Blog Details (API)')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.error.value.isNotEmpty) {
          return Center(child: Text('Error: ${controller.error.value}'));
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
                  child: Center(child: Text('Image: ${blog.coverImage}')),
                ),
              Text(
                blog.title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              if (blog.subtitle.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(
                    blog.subtitle,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                  Text(blog.author, style: const TextStyle(fontWeight: FontWeight.bold)),
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
                        child: Center(child: Text('Image: ${item.imageUrl}')),
                      ),
                    if (item.title.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, bottom: 4.0),
                        child: Text(
                          item.title,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                        child: Text('Note: ${item.note}', style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.blueGrey)),
                      ),
                    if (item.codeExample.isNotEmpty)
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SelectableText(
                            item.codeExample,
                            style: const TextStyle(fontFamily: 'monospace', fontSize: 14),
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
    );
  }
}
