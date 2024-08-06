import 'package:flutter/material.dart';
import 'package:iti_final_project/view/global/colors.dart';

class SmoothPageIndicator extends StatefulWidget {
  final List<Widget> images;

  SmoothPageIndicator({required this.images});

  @override
  _SmoothPageIndicatorState createState() => _SmoothPageIndicatorState();
}

class _SmoothPageIndicatorState extends State<SmoothPageIndicator> {
  PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _pageController,
            children: widget.images,
          ),
        ),
        _buildIndicator(),
      ],
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.images.length,
            (index) => _buildDot(index),
      ),
    );
  }

  Widget _buildDot(int index) {
    double dotSize = 8.0;
    double lineHeight = 5.0;
    double spacing = 8.0;
    Color color =
    (index == _currentPage) ? ColorResources.PrimaryColorGold : ColorResources.grey;

    if (index == _currentPage) {
      return Container(
        width: dotSize * 3,
        height: lineHeight,
        margin: EdgeInsets.all(spacing),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(lineHeight / 2),
          color: color,
        ),
      );
    } else {
      return Container(
        width: dotSize,
        height: dotSize,
        margin: EdgeInsets.all(spacing),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      );
    }
  }
}