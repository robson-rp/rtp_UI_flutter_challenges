import 'package:flutter/material.dart';
import 'package:flutter_challenges/pages/fashion_app/fashion_home.dart';
import 'package:google_fonts/google_fonts.dart';

class FashionDetailsPage extends StatefulWidget {
  const FashionDetailsPage({Key? key, required this.garment}) : super(key: key);
  final GarmentModel garment;

  @override
  State<FashionDetailsPage> createState() => _FashionDetailsPageState();
}

class _FashionDetailsPageState extends State<FashionDetailsPage> {
  int _selectedSize = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height * .65,
          color: Colors.grey.shade400,
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Image(
              image: AssetImage(widget.garment.imageAsset),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned(
            top: 60,
            left: 16,
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Colors.white,
              child: IconButton(
                iconSize: 16,
                onPressed: () => Navigator.pop(context),
                icon: const Center(child: Icon(Icons.arrow_back_ios)),
              ),
            )),
        Positioned(
          bottom: 0,
          child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // if (garment.rebate != 0)
                    Container(
                      width: 50,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text('-${widget.garment.rebate}%',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                decoration: TextDecoration.none)),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    Text(widget.garment.name,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontSize: 25)),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text('\$${widget.garment.curentPrice.ceil()}',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontSize: 18, color: Colors.brown)),
                        const SizedBox(
                          width: 6,
                        ),
                        if (widget.garment.rebate != 0)
                          Text('\$${widget.garment.realPrice.ceil()}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      fontSize: 12,
                                      color: Colors.grey.shade500)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 30,
                      width: size.width,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.garment.colors.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(
                              right: 15,
                            ),
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: widget.garment.colors[index]),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Text('Size',
                            style: TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.none,
                                fontSize: 18)),
                        SizedBox(
                          //width: size.width,
                          height: 35,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedSize = index;
                                    });
                                  },
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Chip(
                                      backgroundColor: _selectedSize == index
                                          ? Colors.black87
                                          : Colors.transparent,
                                      autofocus: true,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      label: Text(
                                        getSize(index),
                                        style: TextStyle(
                                            color: _selectedSize == index
                                                ? Colors.white
                                                : Colors.grey.shade400),
                                      ),
                                    ),
                                  ));
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    MaterialButton(
                      minWidth: size.width - 20,
                      onPressed: () {},
                      color: Colors.black87,
                      child: Text('Order now',
                          style: GoogleFonts.lato(color: Colors.white)),
                    )
                  ],
                ),
              )),
          width: size.width,
          height: size.height * .40,
        )
      ],
    );
  }

  String getSize(int index) {
    switch (index) {
      case 0:
        return 'S';
      case 1:
        return 'M';
      case 2:
        return 'L';
      case 3:
        return 'XL';
      default:
        throw Exception('Invalid Size');
    }
  }
}
