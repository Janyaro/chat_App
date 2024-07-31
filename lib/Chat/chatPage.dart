import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_chat_app/Chat/disply_message.dart';
import 'package:flutter/material.dart';

class ChatPageScreen extends StatefulWidget {
  ChatPageScreen({
    super.key,
  });

  @override
  State<ChatPageScreen> createState() => _ChatPageScreenState();
}

class _ChatPageScreenState extends State<ChatPageScreen> {
  final messageController = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'User',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          MaterialButton(
            onPressed: () {},
            child: const Text(
              'Sign Out',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .78,
                child: Disply_Message(),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: messageController,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(8),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "what's in your mind",
                          fillColor: Colors.grey.shade400,
                          filled: true),
                      validator: (value) {
                        return null;
                      },
                      onSaved: (value) {
                        messageController.text = value!;
                      },
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        if (messageController.text.isNotEmpty) {
                          String id =
                              DateTime.now().microsecondsSinceEpoch.toString();
                          firestore.collection('Message').doc(id).set({
                            'message': messageController.text.toString(),
                            'time': DateTime.now(),
                            'name': 'mane'
                          });
                          messageController.clear();
                        }
                      },
                      icon: const Icon(
                        Icons.send_sharp,
                        color: Colors.deepPurple,
                        size: 25,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
