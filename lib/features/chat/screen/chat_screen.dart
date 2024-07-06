import 'package:chance/core/const/app_text_styles.dart';
import 'package:chance/features/chat/screen/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        centerTitle: true,
        title: Text(
          'Bruno Pham',
          style: AppTextStyles.bold700Style16,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: const [
                ChatBubble(
                  text:
                      'Lorem ipsum dolor sit amet consectetur. Nisl id mattis hac quisque sed. Nec massa dui malesuada et urna. Vel ultricies ipsum nec nibh quam habitant eget massa dui. In eu ac curabitur mattis. Neque diam.',
                  time: '16.04',
                  isCurrentUser: false,
                  userImageUrl: 'assets/images/pp.png',
                ),
                ChatBubble(
                  imageUrl: 'assets/images/pimage.png',
                  time: '16.04',
                  isCurrentUser: false,
                  userImageUrl: 'assets/images/pp.png',
                ),
                ChatBubble(
                  text:
                      'Lorem ipsum dolor sit amet consectetur. Sed cursus nec lectus aliquam ut diam aenean.',
                  time: '16.04',
                  isCurrentUser: true,
                  userImageUrl: 'assets/images/pp.png',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/images/image.svg',
                  ),
                  onPressed: () {},
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type something',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: Color(0xff5DC482),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Hire me to send message")));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
