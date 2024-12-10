import 'package:flutter/material.dart';
import 'package:flutter_region_search_app/data/model/location.dart';
import 'package:flutter_region_search_app/ui/detail/detail_page.dart';
import 'package:flutter_region_search_app/ui/home/search_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final viewModel = ref.read(searchViewModelProvider.notifier);
      final state = ref.watch(searchViewModelProvider);
      return ListView.separated(
        padding: EdgeInsets.all(20),
        itemCount: state.locations.length,
        itemBuilder: (context, index) {
          final location = state.locations[index];
          return region(location);
        },
        separatorBuilder: (context, index) => SizedBox(height: 20),
      );
    });
  }

  Widget region(Location location) {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: () {
          if (location.link.startsWith('https')) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return DetailPage(
                  title: location.title,
                  link: location.link,
                );
              }),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  '잘못된 접근입니다.',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            );
          }
        },
        child: Container(
          height: 110,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey[300]!,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location.title,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  location.category,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                Text(
                  location.roadAddress,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
