import 'package:flutter/material.dart';
import 'package:gestion_locateur/maison/Maisoncontroller.dart';
import 'package:get/get.dart';

class Maisonview extends StatelessWidget {
  const Maisonview({super.key});

  @override
  Widget build(BuildContext context) {
    final Maisoncontroller controller = Get.put(Maisoncontroller());
    controller.All();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: GetBuilder<Maisoncontroller>(builder: (c) {
          return AppBar(
              backgroundColor: Color(0xFFC49FFF),
              title: Text(
                "4".tr,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: c.selectlocalisation != null
                  ? IconButton(
                      onPressed: () {
                        c.list();
                      },
                      icon: Icon(Icons.arrow_back))
                  : null);
        }),
      ),
      body: GetBuilder<Maisoncontroller>(builder: (c) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              SearchAnchor.bar(
                barHintText: "3".tr,
                barShape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                suggestionsBuilder:
                    (context, SearchController searchcontroller) {
                  final String input = searchcontroller.value.text;
                  return controller.maison
                      .where((p) => p['localisation']
                          .toString()
                          .toLowerCase()
                          .contains(input.toLowerCase()))
                      .map((p) => Card(
                            child: ListTile(
                              title: Text(p['localisation'].toString()),
                              onTap: () {
                                searchcontroller.closeView(p['localisation']);
                                c.filter(p['localisation']);
                              },
                            ),
                          ))
                      .toList();
                },
              ),
              SizedBox(
                height: 10,
              ),
              // Affiche un indicateur de chargement tant que les données n'ont
              // pas été récupérées. Quand `c.t` est true, affiche la grille.
              if (c.t == false)
                Center(child: CircularProgressIndicator())
              else
                GridView.builder(
                  shrinkWrap:
                      true, // Ajouté pour empêcher le conflit avec ListView
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: c.filtermaison.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, i) {
                    final item = c.filtermaison[i];

                    // Sélectionner une image sûre (placeholder si aucune image)
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
                        Get.toNamed("maison/detaille", arguments: item);
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
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
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
            ],
          ),
        );
      }),
    );
  }
}
