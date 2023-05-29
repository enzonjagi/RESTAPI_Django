import 'package:flutter/material.dart';

import 'api_service.dart';
import 'user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<UserModel>? _userModel = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(
      const Duration(seconds: 1)
    ).then((value) => setState(() {},));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consuming REST API app'),
      ),
      body: _userModel == null || _userModel!.isEmpty
        ? const Center(
          child: CircularProgressIndicator(),
        )
        : ListView.builder(
          itemCount: _userModel!.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_userModel![index].id.toString()),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_userModel![index].username),
                          Text(_userModel![index].email),
                          Text(_userModel![index].website),
                        ],
                      ),
                    )
                  ]
                ),
              ),
            );
          }
        )
    );
  }
}
