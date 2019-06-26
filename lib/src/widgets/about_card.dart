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
            margin: EdgeInsets.fromLTRB(
                0.05 * width, 0.02 * height, 0.05 * width, 0),
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
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
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
                    "Supervisor",
                    style: Theme.of(context).textTheme.headline.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                  buildChip(
                      context,
                      'https://media.licdn.com/dms/image/C5603AQHDI5qWk6KXOw/profile-displayphoto-shrink_800_800/0?e=1566432000&v=beta&t=Jkcrwl-EgbzJ4YOZgTRYV4w0Q1iycfqV_06kOfia3qM',
                      "https://np.linkedin.com/in/gajendra-sharma-6266b3103",
                      "Dr. Gajendra Sharma",
                      ""),
                  SizedBox(height: 20),
                  Text(
                    "Developers",
                    style: Theme.of(context).textTheme.headline.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                  buildChip(
                      context,
                      "https://avatars2.githubusercontent.com/u/43571990?s=460&v=4",
                      "https://github.com/saileshbro",
                      "Sailesh Dahal",
                      "(10)"),
                  buildChip(
                      context,
                      "https://avatars1.githubusercontent.com/u/38787833?s=460&v=4",
                      "https://github.com/sarayugautam",
                      "Sarayu Gautam",
                      "(14)"),
                  buildChip(
                      context,
                      'https://avatars0.githubusercontent.com/u/39413435?s=460&v=4',
                      "https://github.com/awanshrestha",
                      "Awan Shrestha",
                      "(45)"),
                  buildChip(
                      context,
                      'https://avatars0.githubusercontent.com/u/45491148?s=460&v=4',
                      "https://github.com/sabil62",
                      "Sabil Shrestha",
                      "(51)"),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  GestureDetector buildChip(
      BuildContext context, imageUrl, selectedUrl, devName, rollNo) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return DevInfoPage(
                selectedUrl: selectedUrl,
                devName: devName,
              );
            },
          ),
        );
      },
      child: Chip(
        elevation: 3.0,
        avatar: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        label: Text(
          "$devName $rollNo",
          style: Theme.of(context).textTheme.body2.copyWith(fontSize: 18),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
