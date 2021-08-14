import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void sendDeviceIdWebSocket(String ipAddress, context) {
    var channel = IOWebSocketChannel.connect(Uri.parse("ws://$ipAddress:81"));
    channel.sink.add('vexa4s0k8d');
    channel.stream.listen((message) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text('web'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            sendDeviceIdWebSocket('19.132.168.32', context);
          },
          child: Text('submit'),
        ),
      ),
    );
  }
}
