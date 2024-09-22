import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back)),
          backgroundColor: Colors.teal[100],
          title: Text(
            'About',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Made by M.L',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                width: 300,
                child: Text(
                  'Thank you for using our app! ',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  //width: 300,
                  child: Text(
                    'Join our community on Telegram to stay updated, share your feedback, and connect with other',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.telegram,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('https://t.me/MesaysAppVault')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
