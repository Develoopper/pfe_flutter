import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
      child: TextField(
        style:TextStyle(color: Colors.black, fontSize: 16.0),
        cursorColor: Theme.of(context).primaryColor,
        decoration:InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 13.0),
          suffixIcon: Icon(
                Icons.search
          ),
          border:InputBorder.none,
          hintText: "Search"
        )
      ),
    );
      
    
  }
}