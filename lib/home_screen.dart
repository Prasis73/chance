// ignore_for_file: deprecated_member_use

import 'package:chance/features/chat/screen/all_chat_screen.dart';
import 'package:chance/features/createPost/screen/create_post.dart';
import 'package:chance/features/feed/screen/feed_screen.dart';
import 'package:chance/features/profile/screen/profile_screen.dart';
import 'package:chance/features/search/screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const FeedScreen(),
    const SearchScreen(),
    const CreatePostScreen(),
    const AllChatScreen(),
    const ProfileScreen(),
    // Add other screens here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: FeedScreen(),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/home.svg',
              color:
                  _selectedIndex == 0 ? const Color(0xff5DC482) : Colors.black,
            ),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/search.svg',
                color: _selectedIndex == 1
                    ? const Color(0xff5DC482)
                    : Colors.black),
            label: 'Search',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/create.svg',
                color: _selectedIndex == 2
                    ? const Color(0xff5DC482)
                    : Colors.black),
            label: 'Create',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/chat.svg',
                color: _selectedIndex == 3
                    ? const Color(0xff5DC482)
                    : Colors.black),
            label: 'Chat',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/profile.svg',
                color: _selectedIndex == 4
                    ? const Color(0xff5DC482)
                    : Colors.black),
            label: 'Profile',
            backgroundColor: Colors.white,
          ),
        ],
        selectedItemColor: const Color(0xff5DC482),
        unselectedItemColor: Colors.black,
        selectedFontSize: 12,
        unselectedFontSize: 12,
      ),
    );
  }
}
