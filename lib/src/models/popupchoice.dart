class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final String icon;
}

const List<Choice> choice = const <Choice>[
  const Choice(
    title: 'Change password',
    icon: 'assets/images/icons/password.png',
  ),
];
