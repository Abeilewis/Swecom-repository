import 'package:flutter/material.dart';
import 'package:flutter_tawkto/flutter_tawk.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Tawk(
          directChatLink: 'https://tawk.to/chat/65ef3ee28d261e1b5f6bd96d/1i0jrsi98',
          visitor: TawkVisitor(
            name: 'Ayoub AMINE',
            email: 'ayoubamine2a@gmail.com',
          ),
          onLoad: () {
            print('Hello Tawk!');
          },
          onLinkTap: (String url) {
            print(url);
          },
          placeholder: const Center(
            child: Text('Loading...'),
          ),
        ),
      ),
    );
  }
}
