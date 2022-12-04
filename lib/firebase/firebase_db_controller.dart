import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pillendar_app/firebase/index.dart';
import 'package:pillendar_app/models/reminder.dart';
import 'package:provider/provider.dart';

class FirebaseDBController extends ChangeNotifier {
  // Singleton
  static FirebaseDBController? firebaseDBController;

  static FirebaseDBController getInstance() {
    if (firebaseDBController == null) {
      FirebaseDBController.firebaseDBController = FirebaseDBController();
    }
    return FirebaseDBController.firebaseDBController!;
  }

  // Instance
  late FirebaseFirestore firebaseDBInstance;

  FirebaseDBController() {
    if (firebaseDBController != null) {
      throw Exception(
          "Para acceder a FirebaseAuthController usa el método estático \"getInstance\"");
    }
    firebaseDBInstance = FirebaseFirestore.instance;
  }

  Future createData(Reminder reminder, BuildContext context) {
    String uid = Provider.of<FirebaseAuthController>(context, listen: false)
        .firebaseAuthInstance
        .currentUser!
        .uid;
    return firebaseDBInstance
        .collection(uid)
        .doc(reminder.id)
        .set(reminder.toMap());
  }

  Stream<QuerySnapshot> readData(BuildContext context) {
    String uid = Provider.of<FirebaseAuthController>(context, listen: false)
        .firebaseAuthInstance
        .currentUser!
        .uid;
    Stream<QuerySnapshot> snapshots =
        firebaseDBInstance.collection(uid).snapshots();
    return snapshots;
  }

  Future deleteData(Reminder reminder, BuildContext context) async {
    String uid = Provider.of<FirebaseAuthController>(context, listen: false)
        .firebaseAuthInstance
        .currentUser!
        .uid;

    return firebaseDBInstance.collection(uid).doc(reminder.id).delete();
  }
}
