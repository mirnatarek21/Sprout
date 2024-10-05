import 'package:flutter/material.dart';

import 'Add_Photo.dart';
import 'Create_Post.dart';

class CommunityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1/ Row: Header with name and two buttons
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sprout',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.notifications, color: Colors.teal),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.message, color: Colors.teal),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // 2/ Row: Stories (similar to Instagram)
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _buildStoryAvatar(
                        context,
                        'assets/images/download.png',
                        isOwnStory: true,
                        hasStory: true,
                      ),
                      _buildStoryAvatar(
                        context,
                        'assets/images/download.png',
                        name: 'Paul',
                        hasStory: true,
                      ),
                      _buildStoryAvatar(
                        context,
                        'assets/images/download.png',
                        name: 'Mina',
                        hasStory: true,
                      ),
                      _buildStoryAvatar(
                        context,
                        'assets/images/download.png',
                        name: 'Sara',
                        hasStory: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // 3/ Container with TextField and buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/download.png'),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _showCreatePostBottomSheet(context);
                            },
                            child: TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                hintText: "What's on your mind?",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildActionButton(
                          context,
                          icon: Icons.photo,
                          label: 'Upload Photo',
                          onPressed: () {
                            _showAddPhotoBottomSheet(context);
                          },
                        ),
                        _buildActionButton(
                          context,
                          icon: Icons.emoji_emotions,
                          label: 'Activity/Feeling',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // 4/ Container with text and button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('People you might know'),
                    TextButton(
                      onPressed: () {},
                      child: Text('See All'),
                    ),
                  ],
                ),
              ),
            ),

            // 5/ Post with image and actions
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildPost(
                context,
                'assets/images/download.png',
                userName: 'Sara Diaz',
                userImage: 'assets/images/download.png',
                postTime: '8 hrs ago',
                postText: "Day two of facing facts with no luck #facing_facts",
                postImage: 'assets/images/download.png',
                onPressedComment: () {},
                onPressedShare: () {},
              ),
            ),

            // 6/ Another Post with similar structure
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildPost(
                context,
                'assets/images/download.png',
                userName: 'Fady Adeeb',
                userImage: 'assets/images/download.png',
                postTime: '12 hrs ago',
                postText:
                    "Today I went jogging in the morning for half an hour.",
                postImage: 'assets/images/download.png',
                onPressedComment: () {},
                onPressedShare: () {},
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildStoryAvatar(BuildContext context, String imagePath,
      {String? name, bool isOwnStory = false, bool hasStory = false}) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 30,
            ),
            if (isOwnStory)
              Positioned(
                bottom: 0,
                right: 0,
                child: Icon(
                  Icons.add_circle,
                  color: Colors.green,
                  size: 20,
                ),
              ),
            if (hasStory)
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.green,
                ),
              ),
          ],
        ),
        SizedBox(height: 4),
        if (name != null) Text(name),
      ],
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return TextButton.icon(
      icon: Icon(icon, color: Colors.teal),
      label: Text(label, style: TextStyle(color: Colors.teal)),
      onPressed: onPressed,
    );
  }

  Widget _buildPost(
    BuildContext context,
    String imagePath, {
    required String userName,
    required String userImage,
    required String postTime,
    required String postText,
    String? postImage,
    required VoidCallback onPressedComment,
    required VoidCallback onPressedShare,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(backgroundImage: AssetImage(userImage)),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userName, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(postTime),
                ],
              ),
              Spacer(),
              Icon(Icons.more_vert),
            ],
          ),
          SizedBox(height: 8),
          Text(postText),
          if (postImage != null) SizedBox(height: 8),
          if (postImage != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(postImage),
            ),
          Row(
            children: [
              Row(
                children: [
                  Icon(Icons.thumb_up_alt_outlined, color: Colors.teal),
                  SizedBox(width: 4),
                  Text('Like'),
                ],
              ),
              SizedBox(width: 16),
              GestureDetector(
                onTap: onPressedComment,
                child: Row(
                  children: [
                    Icon(Icons.comment, color: Colors.teal),
                    SizedBox(width: 4),
                    Text('Comment'),
                  ],
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: onPressedShare,
                child: Row(
                  children: [
                    Icon(Icons.share, color: Colors.teal),
                    SizedBox(width: 4),
                    Text('Share'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Community'),
        BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
      ],
    );
  }

  void _showCreatePostBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return CreatePostScreen(); // Ensure this class is defined
      },
    );
  }

  void _showAddPhotoBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return AddPhotoScreen(); // Ensure this class is defined
      },
    );
  }
}

// // Define dummy screens to avoid errors
// class CreatePostScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("Create Post"),
//     );
//   }
// }
//
// class AddPhotoScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("Add Photo"),
//     );
//   }
// }
