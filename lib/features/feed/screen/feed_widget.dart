import 'package:chance/core/const/app_text_styles.dart';
import 'package:chance/features/feed/models/feed_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeedItemWidget extends StatelessWidget {
  final FeedItem feedItem;

  const FeedItemWidget({super.key, required this.feedItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffECF3F6),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage('assets/images/pp.png'),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(feedItem.username,
                                        style: AppTextStyles.bold600Style13),
                                    const SizedBox(width: 4),
                                    const Icon(
                                      Icons.verified,
                                      color: Color(0xff5DC482),
                                      size: 16,
                                    ),
                                    const SizedBox(width: 4),
                                    const Text(
                                      '.',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(feedItem.time,
                                        style: AppTextStyles.regular500Style10),
                                  ],
                                ),
                                Text(feedItem.topic,
                                    style: AppTextStyles.regular500Style10),
                              ],
                            ),
                          ),
                          const Icon(Icons.more_horiz),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(feedItem.content,
                          style: AppTextStyles.regular500Style10
                              .copyWith(color: const Color(0xff364960))),
                      const SizedBox(height: 18),
                    ],
                  ),
                ),
                if (feedItem.image != null)
                  Column(
                    children: [
                      Image.asset(
                        feedItem.image!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      const SizedBox(
                        height: 16.0,
                      )
                    ],
                  ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    bottom: 16.0,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/heart.svg',
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      SvgPicture.asset(
                        'assets/images/message.svg',
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      SvgPicture.asset(
                        'assets/images/send.svg',
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
