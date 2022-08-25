import 'package:flutter/material.dart';


class CustomAppBarWidget extends StatelessWidget {
  final String title;
  final Widget modal;

  CustomAppBarWidget({Key? key, required this.title, required this.modal}) : super(key: key);

  void _startAddNewQuitPeriod(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return  modal;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(0, 3), // changes position of shadow
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
// Button color
          InkWell(
            onTap: () => _startAddNewQuitPeriod(context),
            child: Icon(
              Icons.add,
              color: Colors.black.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }
}
