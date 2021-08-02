/**
 * TODO
 * Código transferido de EsigUtils:
 * 
 * 
 * // Mostrar Snackbar personalizada
  static void showSnackBar(String mensagem, Color bgColor, BuildContext context,
      {Duration? duration, IconData? icon, double? bottomPadding}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding:
            EdgeInsets.only(bottom: bottomPadding ?? 10, left: 20, right: 20),
        content: Row(
          children: [
            Icon(icon ?? Icons.info, color: Colors.white),
            SizedBox(width: 5),
            Flexible(
                child: Text(
              mensagem,
              overflow: TextOverflow.visible,
              style: TextStyle(color: Colors.white),
            )),
          ],
        ),
        backgroundColor: bgColor,
        duration: duration ?? Duration(seconds: 4),
      ),
    );
  }
 */