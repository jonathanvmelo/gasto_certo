import 'package:flutter/material.dart';
import 'package:gasto_certo/app/common/constants/app_colors.dart';
import 'package:gasto_certo/app/common/constants/app_text_styles.dart';
import 'package:gasto_certo/app/common/widgets/primary_button.dart';

class SelectProfilePage extends StatelessWidget {
  const SelectProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Escolha seu perfil de investidor',
          style: AppTextStyle.mediumText20.copyWith(color: AppColors.darkBlue),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.darkBlue,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            profile(
              text2: 'Conservador: ',
              text:
                  ' Prioriza a preservação do capital optando por investimentos de baixo risco',
            ),
            profile(
              text2: 'Moderado: ',
              text:
                  ' Prioriza a preservação do capital optando por investimentos de baixo risco',
            ),
            profile(
              text2: 'Agressivo: ',
              text:
                  ' Prioriza a preservação do capital optando por investimentos de baixo risco',
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: PrimaryButton(
                  onTap: () {
                    Navigator.of(context).popAndPushNamed('/linkAccount');
                  },
                  textButton: 'Conservador',
                  color: AppColors.darkBlue),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: PrimaryButton(
                  onTap: () {
                    Navigator.of(context).popAndPushNamed('/linkAccount');
                  },
                  textButton: 'Moderado',
                  color: AppColors.darkBlue),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: PrimaryButton(
                  onTap: () {
                    Navigator.of(context).popAndPushNamed('/linkAccount');
                  },
                  textButton: 'Agressivo',
                  color: AppColors.darkBlue),
            )
          ],
        ),
      ),
    );
  }

  profile({
    String? text2,
    required String text,
  }) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          Wrap(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: text2,
                      style: AppTextStyle.mediumText22,
                    ),
                    TextSpan(
                      text: text,
                      style: AppTextStyle.mediumText18,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          )
        ],
      ),
    );
  }
}
