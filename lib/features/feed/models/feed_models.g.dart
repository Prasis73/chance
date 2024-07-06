// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedItem _$FeedItemFromJson(Map<String, dynamic> json) => FeedItem(
      username: json['username'] as String,
      time: json['time'] as String,
      topic: json['topic'] as String,
      content: json['content'] as String,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$FeedItemToJson(FeedItem instance) => <String, dynamic>{
      'username': instance.username,
      'time': instance.time,
      'topic': instance.topic,
      'content': instance.content,
      'image': instance.image,
    };
