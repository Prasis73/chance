import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AllChatScreen extends StatelessWidget {
  const AllChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Chats"),
        ),
        body: Column(
          children: [
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/pp.png'),
              ),
              title: const Text("Test"),
              subtitle: const Text("Last Message"),
              trailing: const Text("9:15)"),
              onTap: () {
                context.push('/chat');
              },
            )
          ],
        ));
  }
}
