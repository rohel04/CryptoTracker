import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  DetailCard({
    Key? key,
    required this.context,this.title,this.detail
  }) : super(key: key);

  final BuildContext context;
  String? title;
  dynamic detail;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
        child: Column(
          children: [
            Text('$title',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            SizedBox(height: 10),
            Text('$detail')
          ],
        ),
      ),
    );
  }
}