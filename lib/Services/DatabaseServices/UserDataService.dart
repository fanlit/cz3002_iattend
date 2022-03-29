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
  await userCollection.add(
        {
          'uid': uid,
          'email': email,
          'name': name,
          'userFaceArray': userFaceArray}
    );
  }

  Future<String> getUserName(String uid) async {
    QuerySnapshot querySnapshot = await userCollection
        .where('uid', isEqualTo: uid)
        .get();
    return querySnapshot.docs[0]['name'];
  }

  Future<String> getUserEmail(String uid) async {
    QuerySnapshot querySnapshot = await userCollection
        .where('uid', isEqualTo: uid)
        .get();
    return querySnapshot.docs[0]['email'];
  }

  Future<List<double>> getUserFaceArray(String uid) async {
    QuerySnapshot querySnapshot = await userCollection
        .where('uid', isEqualTo: uid)
        .get();
    return querySnapshot.docs[0]['userFaceArray'];
  }

  // //User list from snapshot
  // List<iAttendUser> _UserListFromSnapshot(QuerySnapshot snapshot)
  // {
  //   return snapshot.docs.map((doc){
  //     return iAttendUser(
  //       doc.get('email').toString(),
  //       doc.get('name').toString(),
  //       doc.get('userFaceArray')
  //     );
  //   }).toList();
  // }
  //
  // //Get Users Stream
  // Stream<List<iAttendUser>> get users
  // {
  //   return userCollection.snapshots().map(_UserListFromSnapshot);
  // }

}