import 'package:json_annotation/json_annotation.dart';

part 'feed_models.g.dart';

@JsonSerializable()
class FeedItem {
  final String username;
  final String time;
  final String topic;
  final String content;
  final String? image;

  FeedItem({
    required this.username,
    required this.time,
    required this.topic,
    required this.content,
    required this.image,
  });

  factory FeedItem.fromJson(Map<String, dynamic> json) =>
      _$FeedItemFromJson(json);
  Map<String, dynamic> toJson() => _$FeedItemToJson(this);
}
