import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

String randomString() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

final wsUrl = Uri.parse('ws://10.65.56.8:8080');

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with AutomaticKeepAliveClientMixin {
  final channel = WebSocketChannel.connect(wsUrl);

  @override
  void initState() {
    channel.stream.listen((message) {
      final resMessage = types.TextMessage(
        author: chatbot,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: randomString(),
        text: message,
      );
      setState(() {
        waiting = false;
      });
      _addMessage(resMessage);
    });
    super.initState();
  }

  final List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');
  final chatbot = const types.User(id: 'ChatBot', firstName: "ChatBot");
  bool waiting = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Chat(
        theme: DefaultChatTheme(
          backgroundColor: Color.lerp(
                Theme.of(context).colorScheme.background,
                Theme.of(context).colorScheme.surface,
                0.2,
              ) ??
              Colors.black,
          primaryColor: Theme.of(context).colorScheme.secondary,
          sentMessageBodyTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.background,
          ),
          inputBackgroundColor: Theme.of(context).colorScheme.background,
        ),
        messages: _messages,
        onSendPressed: _handleSendPressed,
        user: _user,
        typingIndicatorOptions:
            TypingIndicatorOptions(typingUsers: waiting ? [chatbot] : []),
      ),
    );
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) async {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );

    _addMessage(textMessage);
    setState(() {
      waiting = true;
    });
    channel.sink.add(message.text);
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
