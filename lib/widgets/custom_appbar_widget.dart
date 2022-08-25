import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget {
  final String title;
  const CustomAppBarWidget({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 10,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 20,
                color: Colors.black.withOpacity(0.4),
                fontWeight: FontWeight.w700),
          ),
          Icon(
            Icons.add,
            color: Colors.black.withOpacity(0.4),
          ),
        ],
      ),
    );
  }
}
