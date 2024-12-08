import 'package:flutter/material.dart';
import 'package:flutter_region_search_app/ui/home/search_view_model.dart';
import 'package:flutter_region_search_app/ui/home/widgets/home_list_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  TextEditingController textEditingController = TextEditingController();
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  // 검색 함수(엔터시 바로 검색)
  void onSearch(String text) {
    ref.read(searchViewModelProvider.notifier).searchByName(text);
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
        body: HomeListView(),
      ),
    );
  }
}
