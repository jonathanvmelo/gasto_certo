import 'package:flutter/material.dart';
import 'package:gasto_certo/app/common/constants/app_colors.dart';

class CustomBottomAppBar extends StatefulWidget {
  final PageController controller;
  final Color? selectedItemColor;
  final List<CustomBottomAppBarItem> children;
  const CustomBottomAppBar({
    Key? key,
    this.selectedItemColor,
    required this.children,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int selectedItemIndex = 0;
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(_handlePageChange);
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  void _handlePageChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 70,
      color: AppColors.white,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.children.map((item) {
          bool currentIndex;

          currentIndex = widget.children.indexOf(item) == selectedItemIndex;
          return Expanded(
              child: InkWell(
            onTap: item.onPressed,
            onTapUp: (_) => setState(() {
              selectedItemIndex = widget.children.indexOf(item);
            }),
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Icon(
                  currentIndex ? item.primaryIcon : item.secondaryIcon,
                  color: currentIndex
                      ? widget.selectedItemColor
                      : AppColors.greylight,
                )),
          ));
        }).toList(),
      ),
    );
  }
}

class CustomBottomAppBarItem {
  final Key? key;
  final String? label;
  final IconData? primaryIcon;
  final IconData? secondaryIcon;
  final VoidCallback? onPressed;

  CustomBottomAppBarItem({
    this.key,
    this.label,
    this.primaryIcon,
    this.secondaryIcon,
    this.onPressed,
  });

  CustomBottomAppBarItem.empty({
    this.key,
    this.label,
    this.primaryIcon,
    this.secondaryIcon,
    this.onPressed,
  });
}
