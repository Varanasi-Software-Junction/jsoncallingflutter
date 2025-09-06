import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as https;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Calling',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url1 = "sundarampal.github.io",
      url2 = "/myjsonfiles/pagepractice.json",
      fullurl = "https://sundarampal.github.io/myjsonfiles/pagepractice.json";
  String data = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API"), centerTitle: true),
      body: Column(
        children: [
          Text(data),
          Center(
            child: ElevatedButton(
              child: Text("Button"),
              onPressed: () async {
                print("Button was clicked");
                //                 print(fullurl);
                //                 print(url1);
                //                 print(url2);

                final url = Uri.https(url1, url2, {});
                //                 print(url);
                final response = await https.get(url);
                //                 print(response);
                data = response.body;
                //                 print(data);
                final dataresponse = convert.jsonDecode(data);
                print(dataresponse);
                int n = dataresponse.length;
                print(n);
                for (int i = 0; i <= n - 1; i++) {
                  var rowdata = dataresponse[i];
                  print(rowdata);
                }
                //                 setState(() {});

                //***************************
              },
            ),
          ),
        ],
      ),
    );
  }
}


class DataManager
{
  
}
