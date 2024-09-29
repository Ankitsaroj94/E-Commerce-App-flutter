import 'dart:async';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  final Function(int) onChange;
  final int currentSlide;

  const ImageSlider({
    super.key,
    required this.currentSlide,
    required this.onChange,
  });

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final List<String> images = [
    "images/slider.jpg",
    "images/image1.png",
    "images/slider3.png",
    "images/slider.jpg",
    "images/image1.png",
  ];

  late PageController _controller;
  int currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: images.length * 100);
    currentIndex = widget.currentSlide;
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (!mounted) return;
      currentIndex++;
      _controller.animateToPage(
        currentIndex % images.length,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      widget.onChange(currentIndex % images.length);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 220,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: PageView.builder(
              controller: _controller,
              itemCount: null,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index % images.length;
                });
                widget.onChange(currentIndex);
              },
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return Image.asset(
                  images[index % images.length],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
        Positioned.fill(
          bottom: 10,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                images.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: currentIndex == index ? 15 : 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentIndex == index
                        ? Colors.black
                        : Colors.transparent,
                    border: Border.all(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
