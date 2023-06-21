import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahithyolsav_app/routes/names.dart';
import 'package:sahithyolsav_app/ui/home/index.dart';
import 'package:sahithyolsav_app/ui/login/index.dart';

// enum CircleSide { left, right }

// extension ToPath on CircleSide {
//   Path toPath(Size size) {
//     final path = Path();
//     late Offset offset;
//     late bool clockwise;
//     switch (this) {
//       case CircleSide.left:
//         path.moveTo(size.width, size.height);
//         offset = Offset(size.width, size.height);
//         clockwise = false;
//         break;
//       case CircleSide.right:
//         path.moveTo(size.width, size.height);
//         offset = Offset(size.width, size.height);
//         clockwise = true;
//         break;
//     }
//     path.arcToPoint(
//       offset,
//       radius: Radius.elliptical(size.width / 2, size.height / 2),
//       clockwise: clockwise,
//     );
//     path.close();
//     return path;
//   }
// }

// class HalfCircleClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     // TODO: implement getClip
//     throw UnimplementedError();
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     // TODO: implement shouldReclip
//     throw UnimplementedError();
//   }
// }

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    gotoLogin();
    super.initState();
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Center(
              child: Container(
            height: 300,
            width: 400,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/slsnamelogo.png"))),
          )),
        ),
        Positioned(
            bottom: 10,
            left: 150,
            child: Container(
              height: 60,
              width: 100,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("assets/label.png"))),
            ))
      ],
    );
  }

  Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.to(LoginPage());
  }
}
