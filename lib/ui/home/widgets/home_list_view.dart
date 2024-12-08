import 'package:flutter/material.dart';
import 'package:flutter_region_search_app/ui/detail/detail_page.dart';
import 'package:flutter_region_search_app/ui/home/search_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 80),
      child: Consumer(
        builder: (context, ref, child) {
          final locations = ref.watch(searchViewModel);
          return Expanded(
            child: ListView.separated(
              itemCount: locations.length,
              itemBuilder: (context, index) {
                final item = locations[index];
                return region();
              },
              separatorBuilder: (context, index) => SizedBox(height: 20),
            ),
          );
        },
      ),
    );
  }

  Widget region() {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return DetailPage();
            }),
          );
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
                  'title',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'category',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'roadAddress',
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
