import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gestion_locateur/usermaison/UsermaisonController.dart';
import 'package:gestion_locateur/usermaison/Usermaisondetaille/Maisondetaillecontroller.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Usermaisondetaille extends StatelessWidget {
  const Usermaisondetaille({super.key});

  @override
  Widget build(BuildContext context) {
    late PageController p = PageController(keepPage: true);
    late Map<String, dynamic> L = Get.arguments;
    late int id = L['id'];
    final Maisondetaillecontroller controller =
        Get.put(Maisondetaillecontroller());
    controller.getbyid(id);

    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            GetBuilder<Maisondetaillecontroller>(builder: (c) {
              return Column(children: [
                Container(
                  height: 250,
                  child: PageView.builder(
                    controller: p,
                    itemCount: c.image.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("${c.image[index]}"),
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
                    count: c.image.length,
                    effect:
                        ExpandingDotsEffect(activeDotColor: Color(0xff7D4FFE)),
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
                                "${c.m['localisation']}",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              )
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              Map<String, dynamic> lo = {
                                "A": c.m['altitude'],
                                "L": c.m['longitude']
                              };
                              Get.toNamed("localisaton", arguments: lo);
                            },
                            icon: Icon(Icons.location_on),
                            iconSize: 35,
                            color: Color(0xff7D4FFE),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${c.m['prix']} MRU",
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${c.m['description']}",
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${c.m['tel']}",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ]);
            }),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.question,
                          animType: AnimType.rightSlide,
                          title: 'tu est sur',
                          desc: 'Tu veut supprimer cette maison',
                          btnCancelOnPress: () {},
                          btnOkOnPress: () async {
                            Usermaisoncontroller controller = Get.find();
                            await controller.delete(id);
                            Get.back();
                            controller.get(L['user_id']);
                          },
                        ).show();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text("18".tr)),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed("maison/update", arguments: controller.m);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffC49FFF),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text("17".tr)),
                ],
              ),
            )
          ],
        ));
  }
}
