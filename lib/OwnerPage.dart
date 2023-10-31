import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class OwnerPage extends StatefulWidget  {
  const OwnerPage({Key? key}) : super(key: key);
  @override
  OwnerPageState createState() => OwnerPageState();
}

class OwnerPageState extends State<OwnerPage> {
  XFile? floorImage; //이미지 담을 변수 XFile이
  final ImagePicker picker = ImagePicker(); //이미지피커 초기화

  Future getImage(ImageSource imageSource) async {
    //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        floorImage = XFile(pickedFile.path); //가져온 이미지를 floorImage에 저장 그럼 이걸 파이어베이스에 저장하면되나? 흠
      });
    }
  }
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
                        text: '건물\n',
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
                        text: '안내도.\n',
                        style: TextStyle(
                          fontSize: 30, 
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(204, 33, 33, 33)
                        ),
                      ),
                    ]
                  ),
                ),
              ),
            ),
            buildButton(), //버튼추가
            buildPhotoArea(), //이미지 화면 표시
          ],
        ),
      ),
    );
  }
  Widget buildPhotoArea() {
    return floorImage != null
        ? Container(
            width: 300,
            height: 300,
            child: Image.file(File(floorImage!.path)), //가져온 이미지를 화면에 띄워주는 코드
          )
        : Container(
            width: 300,
            height: 300,
            color: Colors.grey,
          );
  }
  Widget buildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            getImage(ImageSource.gallery); //갤러리에서 사진 가져오기
          },
          style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent), // 배경색을 투명하게 변경
          shadowColor: MaterialStateProperty.all(Colors.transparent) // 버튼의 그림자를 제거
        ),
          child: Icon(Icons.image_search, color: const Color.fromARGB(204, 33, 33, 33), size: 50.0,),
        ),
      ],
    );
  }
}
