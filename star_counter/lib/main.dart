import 'package:flutter/material.dart';
import 'package:star_counter/star_counter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(StarCounterApp());
}

class StarCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      routes: {
        '/': (_) => HomePage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _repositoryName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'GitHub Star Counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter a GitHub repository',
                      hintText: 'flutter/flutter',
                    ),
                    onSubmitted: (text) {
                      setState(() {
                        _repositoryName = text;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: GitHubStarCounter(
                      repositoryName: _repositoryName,
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.blue),
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () => launch(
                      'privacy_policy.html',
                      enableJavaScript: true,
                      enableDomStorage: true,
                    ),
                    child: Text('Privacy Policy'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
