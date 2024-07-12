import 'package:flutter/material.dart';

class Iconemap extends StatefulWidget {
  const Iconemap({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IconemapState createState() => _IconemapState();
}

class _IconemapState extends State<Iconemap> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<Offset>(
      begin: const Offset(0, -0.5),
      end: const Offset(0, 0.5),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SlideTransition(
          position: _animation,
          child: const Icon(Icons.location_pin, size: 140, color: Color.fromARGB(255, 228, 11, 11)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 55),
          child: Container(
            width: 150,
            height: 12,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 11, 39, 27),
              borderRadius: BorderRadius.all(Radius.elliptical(150, 15)),
            ),
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}
