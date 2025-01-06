import 'package:flutter/material.dart';

import '../../domain/entity/user.dart';

class UserCard extends StatelessWidget {
  final UserEntity user;
  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.grey.withValues(alpha: 0.3),
      ),
      child: ListTile(
        title: Text(user.name),
        subtitle: Text(user.email),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }
}
