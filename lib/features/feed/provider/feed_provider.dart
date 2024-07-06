import 'package:chance/features/feed/models/feed_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

final feedProvider = FutureProvider<List<FeedItem>>((ref) async {
  final String response = await rootBundle.loadString('assets/data/data.json');
  final List<dynamic> data = json.decode(response);
  return data.map((item) => FeedItem.fromJson(item)).toList();
});
