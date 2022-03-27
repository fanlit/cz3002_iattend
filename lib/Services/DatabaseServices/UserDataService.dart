import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Models/iAttendUser.dart';

class UserDataService
{

  final String uid;
  UserDataService(this.uid);

  //Collection Reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  //Create data upon signup/existing user updates data
  Future createUserData(String email, String firstName, String lastName, List<double> userFaceArray) async
  {
    //Find the document corresponding to the uid in the collection.
    //If no such document exists (first sign up etc), create one.
    //Add this function to auth method
    return await userCollection.doc(uid).set(
        {
          'email': email,
          'firstName': firstName,
          'lastName': lastName,
          'userFaceArray': userFaceArray}
    );
  }

  //User list from snapshot
  List<iAttendUser> _UserListFromSnapshot(QuerySnapshot snapshot)
  {
    return snapshot.docs.map((doc){
      return iAttendUser(
        doc.get('email').toString() ?? '',
        doc.get('firstName').toString() ?? '',
        doc.get('lastName').toString() ?? '',
        doc.get('userFaceArray')
      );
    }).toList();
  }

  //Get Users Stream
  Stream<List<iAttendUser>> get users
  {
    return userCollection.snapshots().map(_UserListFromSnapshot);
  }

}