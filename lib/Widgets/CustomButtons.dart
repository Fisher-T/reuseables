import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBackNavigatorButton extends StatefulWidget {
  final PageController? pageController;

  const CustomBackNavigatorButton({
    this.pageController,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomBackNavigatorButton> createState() =>
      _CustomBackNavigatorButtonState();
}

class _CustomBackNavigatorButtonState extends State<CustomBackNavigatorButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: TextButton.icon(
          onPressed: () => widget.pageController == null
              ? Navigator.of(context).pop()
              : widget.pageController?.previousPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut),
          icon: Platform.isAndroid
              ? Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).colorScheme.onSecondary,
                )
              : Icon(
                  CupertinoIcons.back,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
          label: Text(
            'Back',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ),
    );
  }
}
