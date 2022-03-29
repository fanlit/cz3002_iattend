import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Models/iAttendUser.dart';

class UserDataService
{
  //Collection Reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  //Create data upon signup/existing user updates data
  Future<void> createUserData(String uid, String email, String name, List userFaceArray) async
  {
    //Find the document corresponding to the uid in the collection.
    //If no such document exists (first sign up etc), create one.
    //Add this function to auth method
    await userCollection.doc(uid).set({
        'uid': uid,
        'email': email,
        'name': name,
        'userFaceArray': userFaceArray
    });
  }

  Future<iAttendUser> getUser(String uid) async {
    var userSnapShot = await userCollection.doc(uid).get();
    return iAttendUser(
        uid,
        userSnapShot.get("email"),
        userSnapShot.get("name"),
        userSnapShot.get("userFaceArray"),
    );
  }
}