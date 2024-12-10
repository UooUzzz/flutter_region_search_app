import 'package:flutter/material.dart';
import 'package:flutter_region_search_app/core/geolocator_helper.dart';
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

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final viewModel = ref.read(searchViewModelProvider.notifier);
      final state = ref.watch(searchViewModelProvider);
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title: TextField(
              maxLines: 1,
              onSubmitted: (value) {
                viewModel.searchByName(value);
              },
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
            actions: [
              GestureDetector(
                onTap: () async {
                  final position = await GeolocatorHelper.getPosition();
                  if (position != null) {
                    viewModel.searchByCurrent(
                        position.latitude, position.longitude);
                  }
                },
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.transparent,
                  child: Icon(Icons.gps_fixed),
                ),
              ),
            ],
          ),
          body: HomeListView(),
        ),
      );
    });
  }
}
