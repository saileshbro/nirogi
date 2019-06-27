





// This file is to be deleted...... Only hintText needed in search box for footips page







import 'package:flutter/material.dart';

class SearchBoxf extends StatelessWidget {
  const SearchBoxf({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: 20, right: 17, bottom: 20),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        child: TextField(
          
          style: Theme.of(context).textTheme.body1.copyWith(
                fontSize: 20,
              ),
          cursorColor: Colors.red[700],
          decoration: InputDecoration(
              hintText: 'Search for Diseases',
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
              suffixIcon: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      color: Theme.of(context).scaffoldBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).textTheme.body1.color,
                            spreadRadius: 0.03,
                            blurRadius: 2)
                      ]),
                  child: Icon(
                    Icons.search,
                    color: Colors.red[700],
                  ),
                ),
              )),
              
        ),
      ),
    );
  }
}
