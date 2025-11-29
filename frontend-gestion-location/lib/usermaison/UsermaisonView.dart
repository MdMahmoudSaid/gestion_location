import 'package:flutter/material.dart';
import 'package:gestion_locateur/usermaison/UsermaisonController.dart';
import 'package:get/get.dart';

class Usermaisonview extends StatelessWidget {
  final List list;
  const Usermaisonview({super.key, required this.list});
  @override
  Widget build(BuildContext context) {
    final id = list[0];
    final Usermaisoncontroller controller = Get.put(Usermaisoncontroller());
    controller.get(id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffC49FFF),
        title: Text(
          "4".tr,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: GetBuilder<Usermaisoncontroller>(builder: (c) {
        return Container(
          padding: EdgeInsets.only(top: 10),
          child: c.t == false
              ? Center(child: CircularProgressIndicator())
              : GridView.builder(
                  itemCount: c.maison.length,
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (context, i) {
                    final item = c.maison[i];

                    String imageUrl =
                        'https://via.placeholder.com/400x300?text=No+Image';
                    try {
                      final images = item['images'];
                      if (images != null && images is List && images.isNotEmpty) {
                        imageUrl = images[0].toString();
                      }
                    } catch (_) {}

                    return InkWell(
                      onTap: () {
                        Map<String, dynamic> info = {
                          "user_id": id,
                          "id": item['id']
                        };
                        Get.toNamed("user/maison/detaille", arguments: info);
                      },
                      child: Card(
                        margin: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 120,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10)),
                                image: DecorationImage(
                                  image: NetworkImage(imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${item['localisation']}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.04,
                                  ),
                                ),
                                Text(
                                  "${item["prix"]} MRU",
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
        );
      }),
    );
  }
}
