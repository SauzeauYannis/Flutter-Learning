import 'package:flutter/material.dart';
import 'package:github_graphql_client/github_oauth_credentials.dart';
import 'package:github_graphql_client/src/github_login.dart';
import 'package:github_graphql_client/src/github_summary.dart';
import 'package:window_to_front/window_to_front.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub GraphQL API Client',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'GitHub GraphQL API Client'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return GithubLoginWidget(
      builder: (_, httpClient) {
        WindowToFront.activate();
        return Scaffold(
          appBar: AppBar(title: Text(title)),
          body: GitHubSummary(client: httpClient),
        );
      },
      githubClientId: githubClientId,
      githubClientSecret: githubClientSecret,
      githubScopes: githubScopes,
    );
  }
}
