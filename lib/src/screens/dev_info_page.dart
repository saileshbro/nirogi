// import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

// class DevInfoPage extends StatefulWidget {
//   final String selectedUrl;
//   final String devName;
//   DevInfoPage({@required this.selectedUrl, this.devName});

//   @override
//   _DevInfoPageState createState() => _DevInfoPageState();
// }

// class _DevInfoPageState extends State<DevInfoPage> {
//   final flutterWebviewPlugin = new FlutterWebviewPlugin();
//   @override
//   void dispose() {
//     super.dispose();
//     flutterWebviewPlugin.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WebviewScaffold(
//       url: widget.selectedUrl,
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(widget.devName, style: Theme.of(context).textTheme.headline),
//             SizedBox(
//               width: 14,
//             ),
//             Image.asset(
//               'assets/images/icons/disease.png',
//               width: 30,
//             ),
//           ],
//         ),
//       ),
//       withZoom: false,
//       withLocalStorage: true,
//       initialChild: Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }
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
