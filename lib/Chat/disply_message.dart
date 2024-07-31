import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Disply_Message extends StatefulWidget {
  const Disply_Message({super.key});

  @override
  State<Disply_Message> createState() => _Disply_MessageState();
}

class _Disply_MessageState extends State<Disply_Message> {
  final firestore =
      FirebaseFirestore.instance.collection('Message').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: firestore,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Error has been Occur');
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    QueryDocumentSnapshot qds = snapshot.data!.docs[index];
                    Timestamp time = qds['time'];
                    DateTime dateTime = time.toDate();
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 250,
                            child: ListTile(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20)),
                                  side: BorderSide(
                                    color: Colors.purple,
                                  )),
                              title: Text(qds['name'].toString()),
                              subtitle: Row(
                                children: [
                                  Text(qds['message']),
                                  Text('${dateTime.hour} : ${dateTime.minute}')
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  });
            }
          }),
    );
  }
}
