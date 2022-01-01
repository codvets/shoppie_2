import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shoppie/models/shoppie_user.dart';
import 'package:path/path.dart';

class Network {
  final firebaseAuth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

  String get currentUserId => firebaseAuth.currentUser!.uid;

  Future<ShoppieUser> checkCurrentUser() async {
    try {
      final currentUser = firebaseAuth.currentUser;

      final doc =
          await firestore.collection("users").doc(currentUser!.uid).get();
      return ShoppieUser.fromJson(doc.data()!);
    } on FirebaseAuthException catch (e, s) {
      throw e;
    }
  }

  Future<ShoppieUser> login(String email, String password) async {
    try {
      final UserCredential userCredentials = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      final document = await firestore
          .collection("users")
          .doc(userCredentials.user!.uid)
          .get();
      final data = document.data()!;

      return ShoppieUser.fromJson(data);
    } on FirebaseAuthException catch (error, stk) {
      log("An error occured while signing in: ${error.message}");
      throw error;
    }
  }

  Future<void> logOut() async {
    await firebaseAuth.signOut();
  }

  Future<ShoppieUser> register(
      {required String email,
      required String name,
      required String password}) async {
    try {
      final UserCredential credential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final user = credential.user;

      await firestore.collection("users").doc(user!.uid).set({
        "name": name,
        "email": email,
        "type": "buyer",
      });
      return ShoppieUser(name: name, email: email, type: UserType.buyer);
    } on FirebaseException catch (error, stk) {
      log("Error occured while signing up: ${error.message}");
      throw error;
    }
  }
  //CRUD

  /*
    1. Create - set()
    2. Read - get()
    3. Update - update()
    4. Delete - delete()
  */

  void updateProfile(String name, File image) async {
    String imageUrl = await uploadImage(image);

    await firestore.collection("users").doc(currentUserId).update({
      "name": name,
      "image": imageUrl,
    });
  }

  Future<String> uploadImage(File image) async {
    final imageName = basename(image.path);
//haroon.png

    final task = await storage.ref("profileImages/$imageName").putFile(image);

    final String url = await task.ref.getDownloadURL();

    return url;
  }
}
