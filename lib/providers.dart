import 'package:cloud_tasks_for_flutter/service/firestore.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final firestoreProvider = Provider<FirestoreService>(
  (ref) {
    return FirestoreService();
  },
);
