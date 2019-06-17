import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nirogi/src/screens/dev_info_page.dart';

class AboutPageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
            padding: EdgeInsets.fromLTRB(
                .02 * width, .01 * height, .02 * width, .01 * height),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(1),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    spreadRadius: .03,
                    color: Colors.black.withOpacity(.3),
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Hami Nirogi",
                          style: Theme.of(context).textTheme.body1.copyWith(
                              fontSize: 16,
                              color: Theme.of(context).textTheme.body1.color,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              " is an android application that provides information about different types of diseases, symptoms and other health related issues.",
                          style: Theme.of(context)
                              .textTheme
                              .body1
                              .copyWith(fontSize: 16, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      text:
                          'Information about diet and appropriate health practices is also provided.',
                      style: Theme.of(context)
                          .textTheme
                          .body1
                          .copyWith(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      text:
                          'It also consists of a platform (health forum) where users can ask health related question and get relevant answers.',
                      style: Theme.of(context)
                          .textTheme
                          .body1
                          .copyWith(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Developers",
                    style: Theme.of(context).textTheme.headline.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return DevInfoPage(
                              selectedUrl: "https://github.com/saileshbro",
                              devName: "Sailesh Dahal",
                            );
                          },
                        ),
                      );
                    },
                    child: Chip(
                      avatar: Image.network(
                          "https://avatars2.githubusercontent.com/u/43571990?s=460&v=4"),
                      label: Text(
                        'Sailesh Dahal (10)',
                        style: Theme.of(context)
                            .textTheme
                            .body2
                            .copyWith(fontSize: 18, color: Colors.black),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return DevInfoPage(
                              selectedUrl: "https://github.com/sarayugautam",
                              devName: "Sarayu Gautam",
                            );
                          },
                        ),
                      );
                    },
                    child: Chip(
                      avatar: Image.network(
                          'https://avatars1.githubusercontent.com/u/38787833?s=460&v=4'),
                      label: Text(
                        'Sarayu Gautam (14)',
                        style: Theme.of(context)
                            .textTheme
                            .body2
                            .copyWith(fontSize: 18, color: Colors.black),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return DevInfoPage(
                              selectedUrl: "https://github.com/saileshbro",
                              devName: "Awan Shrestha",
                            );
                          },
                        ),
                      );
                    },
                    child: Chip(
                      avatar: Image.network(
                          'https://avatars0.githubusercontent.com/u/39413435?s=460&v=4'),
                      label: Text(
                        'Awan Shrestha (45)',
                        style: Theme.of(context)
                            .textTheme
                            .body2
                            .copyWith(fontSize: 18, color: Colors.black),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return DevInfoPage(
                              selectedUrl: "https://github.com/saileshbro",
                              devName: "Sabil Shrestha",
                            );
                          },
                        ),
                      );
                    },
                    child: Chip(
                      avatar: Image.network(
                          'https://avatars0.githubusercontent.com/u/45491148?s=460&v=4'),
                      label: Text(
                        'Sabil Shrestha (51)',
                        style: Theme.of(context)
                            .textTheme
                            .body2
                            .copyWith(fontSize: 18, color: Colors.black),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Supervisor",
                    style: Theme.of(context).textTheme.headline.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return DevInfoPage(
                              selectedUrl: "https://github.com/saileshbro",
                              devName: "Dr. Gajendra Sharma",
                            );
                          },
                        ),
                      );
                    },
                    child: Chip(
                      avatar: Image.network(
                          'https://media.licdn.com/dms/image/C5603AQHDI5qWk6KXOw/profile-displayphoto-shrink_800_800/0?e=1566432000&v=beta&t=Jkcrwl-EgbzJ4YOZgTRYV4w0Q1iycfqV_06kOfia3qM'),
                      label: Text(
                        'Dr. Gajendra Sharma',
                        style: Theme.of(context)
                            .textTheme
                            .body2
                            .copyWith(fontSize: 18, color: Colors.black),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
