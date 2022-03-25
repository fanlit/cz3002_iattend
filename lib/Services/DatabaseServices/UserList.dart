import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../../Models/iAttendUser.dart';
/*
class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}


class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<User>>(context);
    users.forEach((user) { print(user.email) ;print(user.firstName); print(user.lastName); });
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index)
        {
        }
    );
  }

}
*/