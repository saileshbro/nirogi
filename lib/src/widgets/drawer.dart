import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 135,
            child: DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/logos/brand-logo.png',
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              buildListTile(context, "Home", "assets/images/icons/home.png"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  height: 10,
                  color: Colors.blueGrey[900].withOpacity(0.3),
                ),
              ),
              buildListTile(
                  context, "Diseasaes", "assets/images/icons/disease.png"),
              buildListTile(
                  context, "Symptoms", "assets/images/icons/symptoms.png"),
              buildListTile(
                  context, "Health News", "assets/images/icons/news.png"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  height: 10,
                  color: Colors.blueGrey[900].withOpacity(0.3),
                ),
              ),
              buildListTile(
                  context, "About Us", "assets/images/icons/about.png"),
              buildListTile(
                  context, "Contact Us", "assets/images/icons/contact.png"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  height: 10,
                  color: Colors.blueGrey[900].withOpacity(0.3),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Light',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Dark',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  ListTile buildListTile(BuildContext context, String name, String imgUrl) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 30),
      leading: Image.asset(
        imgUrl,
        width: 35,
      ),
      title: Text(
        name,
        style: Theme.of(context).textTheme.body1,
      ),
    );
  }
}
