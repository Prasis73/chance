import 'package:chance/core/const/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String? text;
  final String? imageUrl;
  final String time;
  final bool isCurrentUser;
  final String userImageUrl;

  const ChatBubble({
    super.key,
    this.text,
    this.imageUrl,
    required this.time,
    required this.isCurrentUser,
    required this.userImageUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment:
          isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isCurrentUser)
          CircleAvatar(
            backgroundImage: AssetImage(userImageUrl),
          ),
        const SizedBox(width: 8.0),
        Flexible(
          child: Container(
            margin: EdgeInsets.symmetric(
                vertical: 8.0, horizontal: isCurrentUser ? 20 : 0),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: const Color(0xffECF3F6),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (text != null)
                  Text(
                    text!,
                    style: AppTextStyles.bold400Style16,
                  ),
                if (imageUrl != null)
                  Image.asset(
                    imageUrl!,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                const SizedBox(height: 4.0),
                Text(
                  time,
                  style: const TextStyle(color: Colors.grey, fontSize: 12.0),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        if (isCurrentUser)
          CircleAvatar(
            backgroundImage: AssetImage(userImageUrl),
          ),
      ],
    );
  }
}
