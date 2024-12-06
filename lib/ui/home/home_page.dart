import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  // 검색 함수(엔터시 바로 검색)
  void onSearch(String text){
    print('onSearch 호출됨');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            maxLines: 1,
            onSubmitted: onSearch,
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: '장소, 주소 검색',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              border: MaterialStateOutlineInputBorder.resolveWith(
                (states) {
                  if (states.contains(WidgetState.focused)) {
                    return OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black),
                    );
                  }
                  return OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  );
                },
              ),
            ),
          ),
        ),
        body: Text('HomePage'),
      ),
    );
  }
}
