import 'package:flutter/material.dart';
import 'package:meternity_hub/screens/chatscreens/consultation.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back action
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DoctorConsultationScreen()));
          },
        ),
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('images/doc.png'),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Doctor",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                Text(
                  "Active now",
                  style: TextStyle(color: Colors.green, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.call, color: Colors.black),
            onPressed: () {
              // Handle call action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: const [
                MessageBubble(
                  message: "Hello! How can I assist you today?",
                  isUser: false,
                ),
                MessageBubble(
                  message: "I have some questions about my pregnancy.",
                  isUser: true,
                ),
                MessageBubble(
                  message: "Of course! Please tell me what's on your mind.",
                  isUser: false,
                ),
                MessageBubble(
                  message:
                      "Is it normal to feel tired all the time during pregnancy?",
                  isUser: true,
                ),
                MessageBubble(
                  message:
                      "Yes, fatigue is common, especially in the first and third trimesters. Are you getting enough rest?",
                  isUser: false,
                ),
                MessageBubble(
                  message: "I try to rest, but I still feel exhausted.",
                  isUser: true,
                ),
                MessageBubble(
                  message:
                      "Are you staying hydrated and eating a balanced diet? These can help with energy levels.",
                  isUser: false,
                ),
                MessageBubble(
                  message:
                      "I think I could improve my diet. Any specific recommendations?",
                  isUser: true,
                ),
                MessageBubble(
                  message:
                      "Including iron-rich foods like spinach, beans, and lean meats can help. Would you like a sample meal plan?",
                  isUser: false,
                ),
                MessageBubble(
                  message: "That would be really helpful. Thank you!",
                  isUser: true,
                ),
                MessageBubble(
                  message:
                      "You're welcome! I'll share a simple guide to a pregnancy-friendly diet.",
                  isUser: false,
                ),
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Row(
        children: [
          const Icon(Icons.add, color: Colors.grey),
          const SizedBox(width: 16),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Type something...",
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Color(0xFF907AD6)),
            onPressed: () {
              // No action needed for static screen
            },
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isUser;

  const MessageBubble({super.key, required this.message, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: isUser ? const Color(0xFF907AD6) : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
