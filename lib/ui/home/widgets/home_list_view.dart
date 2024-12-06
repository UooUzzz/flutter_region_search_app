import 'package:flutter/material.dart';
import 'package:flutter_region_search_app/ui/detail/detail_page.dart';

class HomeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 100),
      child: Expanded(
        child: ListView.separated(
          itemCount: 5,
          itemBuilder: (context, index) {
            return location();
          },
          separatorBuilder: (context, index) => SizedBox(height: 20),
        ),
      ),
    );
  }

  Widget location() {
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
          child: Column(
            children: [
              Text('title'),
              Text('category'),
              Text('roadAddress'),
            ],
          ),
        ),
      );
    });
  }
}
