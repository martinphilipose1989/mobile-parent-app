import 'dart:async';
import 'package:app/themes_setup.dart';
import 'package:app/utils/common_widgets/common_sizedbox.dart';
import 'package:flutter/material.dart';

class CommonPageView extends StatefulWidget {
  final List<String> images;

  const CommonPageView({super.key, required this.images});

  @override
  CommonPageViewState createState() => CommonPageViewState();
}

class CommonPageViewState extends State<CommonPageView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_currentPage < widget.images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0; // Loop back to the first image
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            onPageChanged: (int index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  widget.images[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        CommonSizedBox.sizedBox(height: 10, width: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.images.length,
            (index) => AnimatedContainer(
              duration: const Duration(seconds: 1),
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              height: 8.0,
              width: _currentPage == index ? 20.0 : 12.0,
              decoration: BoxDecoration(
                color: _currentPage == index
                    ? Theme.of(context).primaryColor
                    : AppColors.dividerColor,
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
