import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login1 extends StatefulWidget {
  const Login1({Key? key}) : super(key: key);

  @override
  State<Login1> createState() => _Login1State();
}

class _Login1State extends State<Login1> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/login_svg/undraw_login.svg'),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Login Details',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'User name, email & phone number',
                        constraints:
                            BoxConstraints(maxWidth: screenSize.width - 40)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Password',
                        constraints:
                            BoxConstraints(maxWidth: screenSize.width - 40)),
                  ),
                  SizedBox(
                    width: screenSize.width - 40,
                    child: Row(
                      children: [
                        const Spacer(),
                        TextButton(
                            onPressed: () {},
                            child: const Text('Forgot Password?'))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: screenSize.width - 40,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: screenSize.width - 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Or login with',
                            style: TextStyle(
                              fontSize: 12,
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: screenSize.width - 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        logoIcon('assets/logo_icons/google.png'),
                        const SizedBox(
                          width: 5,
                        ),
                        logoIcon('assets/logo_icons/facebook.png'),
                        const SizedBox(
                          width: 5,
                        ),
                        logoIcon('assets/logo_icons/logotipo-da-apple.png'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              child: SvgPicture.asset('assets/login_svg/Vector1.svg'))
        ],
      )),
    );
  }

  Widget logoIcon(String imageUrl) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: Colors.grey.shade300,
      child: IconButton(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          onPressed: () {},
          icon: Image(
            image: AssetImage(imageUrl),
          )),
    );
  }
}
