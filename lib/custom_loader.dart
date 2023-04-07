import 'dart:ui';

import 'package:flutter/material.dart';

class CustomLoader extends StatefulWidget {
  const CustomLoader({super.key});

  @override
  State<CustomLoader> createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _radiusAnimation;

  @override
  void initState() {
    super.initState();
    //animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
    // rotation animation
    _rotationAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    // radius animation -> from circle to square
    _radiusAnimation = Tween(begin: 450.0, end: 10.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.addListener(
      () {
        setState(() {});
      },
    );

    //make animation go back and forth
    _controller.addStatusListener((status) {
      if (AnimationStatus.completed == status) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var startValue = 250.0;
    var decrease = 30.0;
    var offset = 7.0;
    return Scaffold(
        backgroundColor: Colors.deepPurple[300],
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // biggest
              Transform.rotate(
                angle: _rotationAnimation.value,
                child: Container(
                  width: startValue,
                  height: startValue,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[700],
                    borderRadius: BorderRadius.circular(_radiusAnimation.value),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple[700]!.withOpacity(0.8),
                        offset: const Offset(-7.0, -7.0),
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(7.0, 7.0),
                      ),
                    ],
                  ),
                ),
              ),
              //second biggest
              Transform.rotate(
                angle: _rotationAnimation.value + 0.2,
                child: Container(
                  width: startValue - (decrease),
                  height: startValue - (decrease),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 181, 64, 213),
                    borderRadius: BorderRadius.circular(_radiusAnimation.value),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 181, 64, 213)
                            .withOpacity(0.8),
                        offset: const Offset(-8.0, -8.0),
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(8.0, 8.0),
                      ),
                    ],
                  ),
                ),
              ),
              // third biggest
              Transform.rotate(
                angle: _rotationAnimation.value + 0.4,
                child: Container(
                  width: startValue - 2 * (decrease),
                  height: startValue - 2 * (decrease),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 197, 65, 151),
                    borderRadius: BorderRadius.circular(_radiusAnimation.value),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 197, 65, 151)
                            .withOpacity(0.8),
                        offset: const Offset(-8.0, -6.0),
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(6.0, 8.0),
                      ),
                    ],
                  ),
                ),
              ),
              //...
              Transform.rotate(
                angle: _rotationAnimation.value + 0.6,
                child: Container(
                  width: startValue - (3 * (decrease)),
                  height: startValue - (3 * (decrease)),
                  decoration: BoxDecoration(
                    color: Colors.red[300],
                    borderRadius: BorderRadius.circular(_radiusAnimation.value),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red[300]!.withOpacity(0.8),
                        offset: const Offset(-6.0, -6.0),
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(6.0, 6.0),
                      ),
                    ],
                  ),
                ),
              ),
              //...
              Transform.rotate(
                angle: _rotationAnimation.value + 0.6,
                child: Container(
                  width: startValue - (4 * (decrease)),
                  height: startValue - (4 * (decrease)),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 215, 117, 194),
                    borderRadius: BorderRadius.circular(_radiusAnimation.value),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 215, 117, 194)
                            .withOpacity(0.8),
                        offset: const Offset(-7.0, -9.0),
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(9.0, 7.0),
                      ),
                    ],
                  ),
                ),
              ),
              //....
              Transform.rotate(
                angle: _rotationAnimation.value + 0.8,
                child: Container(
                  width: startValue - (5 * (decrease)),
                  height: startValue - (5 * (decrease)),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 234, 151, 93),
                    borderRadius: BorderRadius.circular(_radiusAnimation.value),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 234, 151, 93)
                            .withOpacity(0.8),
                        offset: const Offset(-9.0, -7.0),
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(9.0, 6.0),
                      ),
                    ],
                  ),
                ),
              ),
              //...
              Transform.rotate(
                angle: _rotationAnimation.value + 0.8,
                child: Container(
                  width: startValue - (6 * (decrease)),
                  height: startValue - (6 * (decrease)),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 244, 176, 128),
                    borderRadius: BorderRadius.circular(_radiusAnimation.value),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 244, 176, 128)
                            .withOpacity(0.8),
                        offset: const Offset(-9.0, -7.0),
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(9.0, 6.0),
                      ),
                    ],
                  ),
                ),
              ),
              //...
              Transform.rotate(
                angle: _rotationAnimation.value + 0.8,
                child: Container(
                  width: startValue - (7 * (decrease)),
                  height: startValue - (7 * (decrease)),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 245, 201, 170),
                    borderRadius: BorderRadius.circular(_radiusAnimation.value),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 245, 201, 170)
                            .withOpacity(0.8),
                        offset: const Offset(-5.0, -5.0),
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(5.0, 5.0),
                      ),
                    ],
                  ),
                ),
              ),
              //...
              Transform.rotate(
                angle: _rotationAnimation.value + 0.8,
                child: Container(
                  width: startValue - (7.5 * (decrease)),
                  height: startValue - (7.5 * (decrease)),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 244, 219, 201),
                    borderRadius: BorderRadius.circular(_radiusAnimation.value),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 244, 219, 201)
                            .withOpacity(0.8),
                        offset: const Offset(-5.0, -5.0),
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(5.0, 5.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
