import 'package:flutter/material.dart';
import 'dart:async';

class QuestionDetailPage extends StatefulWidget {
  final String question;
  final List<String> pages;

  const QuestionDetailPage({
    super.key,
    required this.question,
    required this.pages,
  });

  @override
  State<QuestionDetailPage> createState() => _QuestionDetailPageState();
}

class _QuestionDetailPageState extends State<QuestionDetailPage> {
  final List<String> _displayedMessages = [];
  int _nextMessageIndex = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Start the conversation with the first message.
    if (widget.pages.isNotEmpty) {
      _displayedMessages.add(widget.pages[0]);
      _nextMessageIndex = 1;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _addNewMessage() {
    if (_nextMessageIndex < widget.pages.length) {
      setState(() {
        _displayedMessages.add(widget.pages[_nextMessageIndex]);
        _nextMessageIndex++;
      });

      // Auto-scroll to the bottom to show the new message.
      Timer(const Duration(milliseconds: 100), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool hasMoreMessages = _nextMessageIndex < widget.pages.length;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.question, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        backgroundColor: const Color(0xFFD5CCFF), // Matching app theme
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16.0),
              itemCount: _displayedMessages.length,
              itemBuilder: (context, index) {
                return _BotMessageBubble(text: _displayedMessages[index]);
              },
            ),
          ),
          // The action button at the bottom.
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (hasMoreMessages) {
                    _addNewMessage();
                  } else {
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7263BB),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(
                  hasMoreMessages ? 'Saiba mais' : 'Finalizar',
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Inter'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// A chat bubble widget for the bot's messages.
class _BotMessageBubble extends StatelessWidget {
  final String text;

  const _BotMessageBubble({required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: const Color(0xFFEAE6FF), // Light purple for bot message
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(4),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 16,
            height: 1.5,
            fontFamily: 'Inter',
          ),
        ),
      ),
    );
  }
}
