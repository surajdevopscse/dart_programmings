import 'package:dart_programing/utils/extention.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class BlogCard extends StatefulWidget {
  final String id;
  final String title;
  final String subtitle;
  final String author;
  final String date;
  final String readTime;
  final String? coverImage;
  final String? authorAvatar;
  final VoidCallback onTap;

  const BlogCard({
    super.key,
    required this.id,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.date,
    required this.readTime,
    this.coverImage,
    this.authorAvatar,
    required this.onTap,
  });

  @override
  State<BlogCard> createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard>
    with SingleTickerProviderStateMixin {
  bool _hovering = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller.drive(CurveTween(curve: Curves.easeIn)),
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovering = true),
        onExit: (_) => setState(() => _hovering = false),
        child: AnimatedScale(
          scale: _hovering ? 1.03 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: widget.onTap,
              child: Row(
                children: [
                  // Left: Image or SVG (50%)
                  Expanded(
                    flex: 1,
                    child: (widget.coverImage != null &&
                            widget.coverImage!.isNotEmpty)
                        ? Hero(
                            tag: 'cover-${widget.id}',
                            child: ClipRRect(
                              borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(8),
                              ),
                              child: Image.network(
                                widget.coverImage!,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                                loadingBuilder: (context, child, progress) {
                                  if (progress == null) return child;
                                  return Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    color: Colors.grey[200],
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        : ClipRRect(
                            borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(8)),
                            child: SvgPicture.asset(
                              'assets/images/home.svg',
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  // Right: Details (50%)
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              height: 1.2,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            widget.subtitle,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                              height: 1.2,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              if (widget.authorAvatar != null)
                                CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(widget.authorAvatar!),
                                  radius: 12,
                                )
                              else
                                CircleAvatar(
                                  radius: 12,
                                  child: Text(widget.author.isNotEmpty
                                      ? widget.author[0]
                                      : '?'),
                                ),
                              const SizedBox(width: 8),
                              Text(
                                widget.author,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 12),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Icon(Icons.star,
                                  size: 12, color: Colors.amber[700]),
                              const SizedBox(width: 2),
                              Text(widget.date.toFormattedDate(),
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.grey)),
                              const SizedBox(width: 8),
                              Icon(Icons.remove_red_eye,
                                  size: 12, color: Colors.grey[600]),
                              const SizedBox(width: 2),
                              Text('833',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.grey[600])),
                              const SizedBox(width: 8),
                              Icon(Icons.comment_outlined,
                                  size: 12, color: Colors.grey[600]),
                              const SizedBox(width: 2),
                              Text('12',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.grey[600])),
                              const Spacer(),
                              Icon(Icons.bookmark_border,
                                  size: 14, color: Colors.grey[600]),
                              const SizedBox(width: 4),
                              Icon(Icons.more_horiz,
                                  size: 14, color: Colors.grey[600]),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
