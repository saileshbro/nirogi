import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DevInfoPage extends StatefulWidget {
  final String selectedUrl;
  final String devName;

  DevInfoPage({@required this.selectedUrl, this.devName});

  @override
  createState() => _DevInfoPageState(this.selectedUrl, this.devName);
}

class _DevInfoPageState extends State<DevInfoPage> {
  var _selectedUrl;
  var _devName;
  final _key = UniqueKey();

  _DevInfoPageState(this._selectedUrl, this._devName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_devName, style: Theme.of(context).textTheme.headline),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: WebView(
                key: _key,
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: _selectedUrl,
              ),
            )
          ],
        ));
  }
}
