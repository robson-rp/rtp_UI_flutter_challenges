import 'package:flutter/material.dart';
import 'package:flutter_challenges/pages/fashion_app/fashion_details_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// ignore: constant_identifier_names
enum GSize { S, M, L, XL }

enum GarmetType { coat, jacket, hat, dress }

final types = <GarmetType, String>{
  GarmetType.coat: 'Coat',
  GarmetType.jacket: 'Jacket',
  GarmetType.hat: 'hat',
  GarmetType.dress: 'Coat',
};

class GarmentModel {
  final String name;
  final GarmetType type;
  final double realPrice;
  final int rebate;
  final List<GSize> sizes;
  final List<Color> colors;
  final String imageAsset;
  final double curentPrice;
  GarmentModel({
    required this.realPrice,
    required this.imageAsset,
    this.rebate = 0,
    required this.sizes,
    required this.colors,
    required this.name,
    required this.type,
  }) : curentPrice = realPrice - (rebate * realPrice) / 100;
}

class FashionHome extends StatefulWidget {
  const FashionHome({Key? key}) : super(key: key);

  @override
  State<FashionHome> createState() => _FashionHomeState();
}

class _FashionHomeState extends State<FashionHome> {
  final _categories = [
    'Tudo',
    'Vestidos',
    'Calcas',
    'T-shirts',
    'Casacos',
    'Chapeus'
  ];

  int _selectedCategorie = 0;

  @override
  Widget build(BuildContext context) {
    final bottomNavBar = BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black87,
        showSelectedLabels: false,
        unselectedItemColor: Colors.black12,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined), label: 'Profile'),
        ]);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.black87,
                      // backgroundImage:
                      //     AssetImage('assets/fashion_app_assets/img11.png'),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello,',
                          style: GoogleFonts.lato(
                              color: Colors.grey.shade700, fontSize: 14),
                        ),
                        Text('Robson Rtp',
                            style: GoogleFonts.lato(
                              color: Colors.black87,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            )),
                      ],
                    ),
                    const Spacer(),
                    Stack(
                      children: [
                        Material(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.grey[200],
                          child: const SizedBox(
                            width: 40,
                            height: 40,
                            child: Icon(Icons.notifications_outlined,
                                color: Colors.black87),
                          ),
                        ),
                        Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 20,
                              width: 20,
                              child: Center(
                                child: Text(
                                  '4',
                                  style: GoogleFonts.lato(
                                      fontSize: 12, color: Colors.white),
                                ),
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Text('Let\'s find your outfit!',
                        style: GoogleFonts.playfairDisplay(
                            fontSize: 35, fontWeight: FontWeight.w700)),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 35,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: _categories.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedCategorie = index;
                                });
                              },
                              child: Chip(
                                backgroundColor: _selectedCategorie == index
                                    ? Colors.black87
                                    : Colors.transparent,
                                autofocus: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                                label: Text(
                                  _categories[index],
                                  style: TextStyle(
                                      color: _selectedCategorie == index
                                          ? Colors.white
                                          : Colors.grey.shade400),
                                ),
                              ));
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 5,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GridView.custom(
                      scrollDirection: Axis.vertical,
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverWovenGridDelegate.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        pattern: [
                          const WovenGridTile(3.5 / 6, crossAxisRatio: 1),
                          const WovenGridTile(
                            3.2 / 6,
                            crossAxisRatio: 1,
                            alignment: AlignmentDirectional.centerEnd,
                          ),
                        ],
                      ),
                      childrenDelegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return GarmentThumbnail(garmentList[index], () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return FashionDetailsPage(
                                  garment: garmentList[index]);
                            }));
                          });
                        },
                        childCount: garmentList.length,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavBar,
    );
  }
}

// ignore: must_be_immutable
class GarmentThumbnail extends StatelessWidget {
  GarmentThumbnail(this.item, this.onClick, {Key? key}) : super(key: key);
  void Function() onClick;
  final GarmentModel item;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Stack(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image(
                      image: AssetImage(item.imageAsset),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  if (item.rebate != 0)
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        width: 40,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text('-${item.rebate}%',
                              style: const TextStyle(color: Colors.white)),
                        ),
                      ),
                    )
                ],
              )),
              Text(item.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 16)),
              const SizedBox(
                height: 2,
              ),
              Text(types[item.type]!,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 14)),
              const SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Text('\$${item.curentPrice.ceil()}',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 16, color: Colors.brown)),
                  const SizedBox(
                    width: 4,
                  ),
                  if (item.rebate != 0)
                    Text('\$${item.realPrice.ceil()}',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 10, color: Colors.grey.shade500)),
                ],
              )
            ],
          )),
    );
  }
}

final garmentList = [
  GarmentModel(
    realPrice: 400,
    sizes: [GSize.L, GSize.M],
    colors: [Colors.black, Colors.orange, Colors.pink],
    name: 'Winter coat',
    type: GarmetType.coat,
    imageAsset: 'assets/fashion_app_assets/img3.png',
  ),
  GarmentModel(
      realPrice: 900,
      sizes: [GSize.L, GSize.M, GSize.S],
      colors: [Colors.black, Colors.amber, Colors.pink],
      name: 'Winter coat black popular',
      type: GarmetType.jacket,
      imageAsset: 'assets/fashion_app_assets/img1.png',
      rebate: 30),
  GarmentModel(
      realPrice: 800,
      sizes: [GSize.L, GSize.S],
      colors: [Colors.black, Colors.amber, Colors.pink],
      name: 'Blue print',
      type: GarmetType.jacket,
      imageAsset: 'assets/fashion_app_assets/img3.png',
      rebate: 10),
  GarmentModel(
    realPrice: 400,
    sizes: [GSize.L, GSize.M, GSize.S],
    colors: [Colors.black, Colors.amber, Colors.pink],
    name: 'Blue print',
    type: GarmetType.jacket,
    imageAsset: 'assets/fashion_app_assets/img2.png',
  ),
  GarmentModel(
      realPrice: 400,
      sizes: [GSize.L, GSize.M, GSize.S],
      colors: [Colors.black, Colors.amber, Colors.pink],
      name: 'Blue print',
      type: GarmetType.jacket,
      imageAsset: 'assets/fashion_app_assets/img3.png',
      rebate: 30),
  GarmentModel(
      realPrice: 400,
      sizes: [GSize.L, GSize.M, GSize.S],
      colors: [Colors.black, Colors.amber, Colors.pink],
      name: 'Blue print',
      type: GarmetType.jacket,
      imageAsset: 'assets/fashion_app_assets/img9.png',
      rebate: 30),
  GarmentModel(
      realPrice: 400,
      sizes: [GSize.L, GSize.M, GSize.S],
      colors: [Colors.black, Colors.amber, Colors.pink],
      name: 'Blue print',
      type: GarmetType.jacket,
      imageAsset: 'assets/fashion_app_assets/img8.png',
      rebate: 30),
  GarmentModel(
      realPrice: 400,
      sizes: [GSize.L, GSize.M, GSize.S],
      colors: [Colors.black, Colors.amber, Colors.pink],
      name: 'Blue print',
      type: GarmetType.jacket,
      imageAsset: 'assets/fashion_app_assets/img2.png',
      rebate: 30),
  GarmentModel(
      realPrice: 400,
      sizes: [GSize.L, GSize.M, GSize.S],
      colors: [Colors.black, Colors.amber, Colors.pink],
      name: 'Blue print',
      type: GarmetType.jacket,
      imageAsset: 'assets/fashion_app_assets/img1.png',
      rebate: 30),
  GarmentModel(
      realPrice: 400,
      sizes: [GSize.L, GSize.M, GSize.S],
      colors: [Colors.black, Colors.amber, Colors.pink],
      name: 'Blue print',
      type: GarmetType.jacket,
      imageAsset: 'assets/fashion_app_assets/img4.png',
      rebate: 30),
  GarmentModel(
      realPrice: 400,
      sizes: [GSize.L, GSize.M, GSize.S],
      colors: [Colors.black, Colors.amber, Colors.pink],
      name: 'Blue print',
      type: GarmetType.jacket,
      imageAsset: 'assets/fashion_app_assets/img6.png',
      rebate: 30),
  GarmentModel(
      realPrice: 400,
      sizes: [GSize.L, GSize.M, GSize.S],
      colors: [Colors.black, Colors.amber, Colors.pink],
      name: 'Blue print',
      type: GarmetType.jacket,
      imageAsset: 'assets/fashion_app_assets/img5.png',
      rebate: 30),
  GarmentModel(
      realPrice: 400,
      sizes: [GSize.L, GSize.M, GSize.S],
      colors: [Colors.black, Colors.amber, Colors.pink],
      name: 'Blue print',
      type: GarmetType.jacket,
      imageAsset: 'assets/fashion_app_assets/img10.png',
      rebate: 30),
];
