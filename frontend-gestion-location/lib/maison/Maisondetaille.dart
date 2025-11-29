import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Maisondetaille extends StatelessWidget {
  const Maisondetaille({super.key});

  @override
  Widget build(BuildContext context) {
    late PageController p = PageController(keepPage: true);
    late Map<String, dynamic> L = Get.arguments;
    late List image = L['images'];
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Container(
            height: 250,
            child: PageView.builder(
              controller: p,
              itemCount: image.length,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage("${image[index]}"),
                          fit: BoxFit.cover)),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: SmoothPageIndicator(
              controller: p,
              count: image.length,
              effect: ExpandingDotsEffect(activeDotColor: Color(0xff7D4FFE)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "14".tr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          "${L['localisation']}",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        )
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        Map<String, dynamic> lo = {
                          "A": L['altitude'],
                          "L": L['longitude']
                        };
                        Get.toNamed("localisaton", arguments: lo);
                      },
                      icon: Icon(Icons.location_on),
                      iconSize: 35,
                      color: Color(0xff7D4FFE),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${L['prix']} MRU",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "15".tr,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      "${L['description']}",
                      maxLines: 5,
                    )
                  ],
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "16".tr,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      "${L['tel']}",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
