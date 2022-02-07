import 'package:flutter/material.dart';
import 'package:flutter_challenges/pages/fashion_app/fashion_home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FashionOnBoardingScreen extends StatefulWidget {
  const FashionOnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<FashionOnBoardingScreen> createState() =>
      _FashionOnBoardingScreenState();
}

class _FashionOnBoardingScreenState extends State<FashionOnBoardingScreen> {
  late PageController _controller;
  final onBoardingItems = [
    OnBoardingCardItem(
        bgColor: Colors.black87,
        mainTitle: 'New Collection',
        subtitle: 'Spring 2021',
        imageAsset: 'assets/fashion_app_assets/img4.png'),
    OnBoardingCardItem(
        bgColor: Colors.blue,
        mainTitle: 'Modern man',
        subtitle: 'Spring 2021',
        imageAsset: 'assets/fashion_app_assets/img1.png'),
    OnBoardingCardItem(
        bgColor: Colors.teal,
        mainTitle: 'Delux collection',
        subtitle: 'Modern after party',
        imageAsset: 'assets/fashion_app_assets/img2.png'),
  ];

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.70,
            child: PageView.builder(
                controller: _controller,
                itemCount: onBoardingItems.length,
                itemBuilder: (context, index) {
                  return OnBoardingCard(item: onBoardingItems[index]);
                }),
          ),
          SizedBox(
              height: size.height * 0.30,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: SmoothPageIndicator(
                        controller: _controller,
                        count: onBoardingItems.length,
                        effect: ExpandingDotsEffect(
                            dotHeight: 8,
                            activeDotColor: onBoardingItems[0].bgColor),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text('Let\'s improve your apprearance!',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 28,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Flexible(
                            child: Text(
                                'Find cool Style to support your daily activities',
                                style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                          ),
                          FloatingActionButton(
                            backgroundColor: Colors.black87,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const FashionHome(),
                                  ));
                            },
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                              color: Colors.white70,
                            ),
                          )
                        ])
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class OnBoardingCard extends StatelessWidget {
  const OnBoardingCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final OnBoardingCardItem item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: item.bgColor,
        ),
        Positioned(
            top: 90,
            left: 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.subtitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.white60, fontSize: 16),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  item.mainTitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.white, fontSize: 35),
                ),
              ],
            )),
        Positioned(
          bottom: -3,
          left: -12,
          child: Image(
            image: AssetImage(item.imageAsset),
            height: 420,
          ),
        )
      ],
    );
  }
}

class OnBoardingCardItem {
  OnBoardingCardItem(
      {required this.imageAsset,
      required this.bgColor,
      required this.mainTitle,
      required this.subtitle});

  final String imageAsset;
  final Color bgColor;
  final String mainTitle;
  final String subtitle;
}
