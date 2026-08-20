import 'package:flutter/material.dart';

// --- Data Model for an Instagram Post ---
class PostItem {
  final String username;
  final String userAvatar;
  final String location;
  final String imagePath;
  final String caption;
  final String timeAgo;
  int likes;
  bool isLiked;

  PostItem({
    required this.username,
    required this.userAvatar,
    required this.location,
    required this.imagePath,
    required this.caption,
    required this.timeAgo,
    this.likes = 0,
    this.isLiked = false,
  });
}

// --- Home Page (Instagram Feed) ---
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Sample posts data
  final List<PostItem> posts = [
    PostItem(
      username: 'ashutosh_rai',
      userAvatar: 'assets/images/aws_event.jpg',
      location: 'AWS Community Event • Tech Summit',
      imagePath: 'assets/images/aws_event.jpg',
      caption: 'Had an incredible time attending the AWS event! Explored cloud architectures and AI tools. ☁️🚀',
      timeAgo: '2 HOURS AGO',
      likes: 128,
    ),
    PostItem(
      username: 'ashutosh_rai',
      userAvatar: 'assets/images/bba_teaching.jpg',
      location: 'Classroom • Tech Education',
      imagePath: 'assets/images/bba_teaching.jpg',
      caption: 'Mentoring BBA students today! Introducing digital tools and computational thinking. 📚✨',
      timeAgo: '5 HOURS AGO',
      likes: 95,
    ),
    PostItem(
      username: 'ashutosh_rai',
      userAvatar: 'assets/images/diwali_event.jpg',
      location: 'Campus Celebration • Festive Moments',
      imagePath: 'assets/images/diwali_event.jpg',
      caption: 'Celebrating Diwali with amazing people! Wishing everyone happiness and prosperity! 🪔✨',
      timeAgo: '3 DAYS AGO',
      likes: 450,
    ),
  ];

  // Function to toggle Like on a post
  void _likePost(int index) {
    setState(() {
      if (posts[index].isLiked) {
        posts[index].likes--;
        posts[index].isLiked = false;
      } else {
        posts[index].likes++;
        posts[index].isLiked = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // 1. Top App Bar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          'Instagram',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.send_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),

      // 2. Scrollable Posts Feed
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Post Header: Profile Pic + Username + Location
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage(post.userAvatar),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.username,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          Text(
                            post.location,
                            style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_vert, size: 20),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              // Post Main Image
              Image.asset(
                post.imagePath,
                width: double.infinity,
                height: 350,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 350,
                    color: Colors.grey[200],
                    child: const Center(
                      child: Icon(Icons.image, size: 50, color: Colors.grey),
                    ),
                  );
                },
              ),

              // Action Buttons Row: Like, Comment, Share, Bookmark
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      post.isLiked ? Icons.favorite : Icons.favorite_border,
                      color: post.isLiked ? Colors.red : Colors.black,
                    ),
                    onPressed: () => _likePost(index),
                  ),
                  IconButton(
                    icon: const Icon(Icons.chat_bubble_outline),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.send_outlined),
                    onPressed: () {},
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.bookmark_border),
                    onPressed: () {},
                  ),
                ],
              ),

              // Likes Count
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  '${post.likes} likes',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              const SizedBox(height: 4),

              // Caption
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black87, fontSize: 13),
                    children: [
                      TextSpan(
                        text: '${post.username} ',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: post.caption),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 4),

              // Time Ago
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  post.timeAgo,
                  style: TextStyle(fontSize: 11, color: Colors.grey[500]),
                ),
              ),
              const SizedBox(height: 12),

              // Divider between posts
              const Divider(height: 1, thickness: 6, color: Color(0xFFF0F0F0)),
            ],
          );
        },
      ),
    );
  }
}