import 'package:flutter/material.dart';

class EsigContainerWidget extends StatelessWidget {
  final void Function()? onTap;

  final Color? corBorda;

  final Color? corFundo;

  final Widget child;

  const EsigContainerWidget(
      {Key? key,
      this.onTap,
      required this.child,
      this.corBorda = const Color(0xFFE4EDF5),
      this.corFundo = Colors.transparent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 9),
        decoration: BoxDecoration(
          color: corFundo,
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
            width: 1,
            color: corBorda!,
          ),
        ),
        child: child,
      ),
    );
  }
}
