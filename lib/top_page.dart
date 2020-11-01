import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_tasks_for_flutter/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final firestoreService = watch(firestoreProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cloud Tasks for Flutter'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          firestoreService.createPost();
        },
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.timelineStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          int itemCount = snapshot.data.docs.length;
          return ListView.builder(
            itemCount: itemCount,
            itemBuilder: (BuildContext context, int index) {
              var data = snapshot.data.docs[index].data();
              return buildCard(
                title: data['title'],
                subtitle: data['subtitle'],
              );
            },
          );
        },
      ),
    );
  }

  Card buildCard({@required String title, @required String subtitle}) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(),
            title: Text(title),
            subtitle: Text(subtitle),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
