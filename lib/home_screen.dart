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
            icon: SvgPicture.asset('assets/images/home.svg',
                colorFilter: ColorFilter.mode(
                    _selectedIndex == 0
                        ? const Color(0xff5DC482)
                        : Colors.black,
                    BlendMode.srcIn)),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/search.svg',
              colorFilter: ColorFilter.mode(
                  _selectedIndex == 1 ? const Color(0xff5DC482) : Colors.black,
                  BlendMode.srcIn),
            ),
            label: 'Search',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/create.svg',
                colorFilter: ColorFilter.mode(
                    _selectedIndex == 2
                        ? const Color(0xff5DC482)
                        : Colors.black,
                    BlendMode.srcIn)),
            label: 'Create',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/chat.svg',
                colorFilter: ColorFilter.mode(
                    _selectedIndex == 3
                        ? const Color(0xff5DC482)
                        : Colors.black,
                    BlendMode.srcIn)),
            label: 'Chat',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/profile.svg',
                colorFilter: ColorFilter.mode(
                    _selectedIndex == 4
                        ? const Color(0xff5DC482)
                        : Colors.black,
                    BlendMode.srcIn)),
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
