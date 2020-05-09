import 'package:flutter/material.dart';

class MyCounter extends StatefulWidget {
  const MyCounter({
    Key key,
  }) : super(key: key);

  @override
  _MyCounterState createState() => _MyCounterState();
}

class _MyCounterState extends State {
  int _currentAmount = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
            onTap: () {
              setState(() {
                if (_currentAmount == 0) {
                  _currentAmount -= 0;
                } else {
                  _currentAmount -= 1;
                }
              });
            },
          ),
          SizedBox(width: 15),
          Text(
            "$_currentAmount",
            style: Theme.of(context).textTheme.title,
          ),
          SizedBox(width: 15),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            onTap: () {
              setState(() {
                _currentAmount += 1;
              });
            },
          ),
        ],
      ),
    );
  }
}