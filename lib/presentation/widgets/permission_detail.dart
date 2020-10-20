import 'package:flutter/material.dart';

class PermissionDetail extends StatelessWidget {
  final String title;
  final String body;

  const PermissionDetail({Key key, this.title, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 10),
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              body,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
