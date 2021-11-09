import 'package:flutter/material.dart';

import 'bottom_tab_option.dart';

class EsigOptionBarWidget extends StatelessWidget {
  final List<EsigTabOptionWidget> options;
  final double? height;
  final Color? backgroundColor;

  const EsigOptionBarWidget({
    Key? key,
    required this.options,
    this.height,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50,
      color: backgroundColor ?? Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: options,
      ),
    );
  }
}
