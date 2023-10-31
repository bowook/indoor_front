import 'package:flutter/material.dart';
import 'package:inroadview_01/OwnerPage.dart';
import 'package:inroadview_01/VisitorPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0), 
              child: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '실내\n',
                        style: TextStyle(
                          fontSize: 30, 
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(204, 33, 33, 33)
                        ),
                      ),
                      TextSpan(
                        text: '\n', 
                      ),
                      TextSpan(
                        text: '길찾기.\n',
                        style: TextStyle(
                          fontSize: 30, 
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(204, 33, 33, 33)
                        ),
                      ),
                      TextSpan(
                        text: '\n\n\n',
                      ),
                      TextSpan(
                        text: '당신의 목적은 ?',
                        style: TextStyle(
                          fontSize: 30, 
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(204, 33, 33, 33)
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Builder(
                  builder: (BuildContext context) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => VisitorPage()),
                            );
                          },
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 150,
                                height: 150,
                                child: Icon(Icons.people, color: Colors.black, size: 150),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(204, 230, 230, 230),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              Text('방문객',
                              style: TextStyle(fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(204, 33, 33, 33)),), // 텍스트 추가
                            ]
                          ),
                        ),
                        SizedBox(height: 5),
                        Divider(color: Color.fromARGB(204, 230, 230, 230)),
                        SizedBox(height: 5),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => OwnerPage()),
                            );
                          },
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 150,
                                height: 150,
                                child: Icon(Icons.home_work, color: Colors.black, size: 150),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(204, 230, 230, 230),
                                  // border: Border.all(color: Color.fromARGB(204, 33, 33, 33)),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              Text('건물주',
                              style: TextStyle(fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(204, 33, 33, 33))), // 텍스트 추가
                            ]
                          ),
                        ),
                      ],
                    );
                  }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
