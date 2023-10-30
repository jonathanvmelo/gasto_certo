import 'package:flutter/material.dart';
import 'package:gasto_certo/app/common/constants/app_colors.dart';

class CustomAlertDialog extends StatelessWidget {
  final String message;
  final VoidCallback onOkay;

  const CustomAlertDialog(
      {super.key, required this.message, required this.onOkay});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            "E-mail Enviado!",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 15),
          Text(
            message,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 22),
          ElevatedButton(
            onPressed: onOkay,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.darkBlue,
              padding: const EdgeInsets.symmetric(horizontal: 50),
            ),
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

// Para usar o widget CustomAlertDialog, você pode adicionar o seguinte código em algum lugar do seu código:

// Exemplo de uso do CustomAlertDialog:
// void exibirAlerta(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return CustomAlertDialog(
//         message: 'Por favor, verifique sua caixa de e-mail.',
//         onOkay: () {
//           Navigator.of(context).pop(); // Fecha o AlertDialog
//         },
//       );
//     },
//   );
// }
