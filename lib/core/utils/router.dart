import 'package:chance/features/chat/screen/all_chat_screen.dart';
import 'package:chance/features/chat/screen/chat_screen.dart';
import 'package:chance/features/createPost/screen/create_post.dart';
import 'package:chance/features/profile/screen/profile_screen.dart';
import 'package:chance/home_screen.dart';

import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/create-post',
      builder: (context, state) => const CreatePostScreen(),
    ),
    GoRoute(
      path: '/chat',
      builder: (context, state) => const ChatScreen(),
    ),
    GoRoute(
      path: '/all-chat',
      builder: (context, state) => const AllChatScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
);
