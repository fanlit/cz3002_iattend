import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Models/user.dart';

class UserDataService
{

  final String uid;
  UserDataService(this.uid);

  //Collection Reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  //Create data upon signup/existing user updates data
  Future updateUserData(String email, String firstName, String lastName) async
  {
    //Find the document corresponding to the uid in the collection.
    //If no such document exists (first sign up etc), create one.
    //Add this function to auth method
    return await userCollection.doc(uid).set(
        {'email': email,
          'firstName': firstName,
          'lastName': lastName,}
    );
  }

  //User list from snapshot
  List<User> _UserListFromSnapshot(QuerySnapshot snapshot)
  {
    return snapshot.docs.map((doc){
      return User(
        doc.get('email').toString() ?? '',
        doc.get('firstName').toString() ?? '',
        doc.get('lastName').toString() ?? '',
      );
    }).toList();
  }

  //Get Users Stream
  Stream<List<User>> get users
  {
    return userCollection.snapshots().map(_UserListFromSnapshot);
  }

}