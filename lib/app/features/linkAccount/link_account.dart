import 'package:flutter/material.dart';
import 'package:gasto_certo/app/common/constants/app_colors.dart';
import 'package:gasto_certo/app/common/constants/app_text_styles.dart';
import 'package:gasto_certo/app/common/widgets/primary_button.dart';

class LinkAccount extends StatelessWidget {
  const LinkAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Associe sua conta bancária',
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
      body: Center(
          child: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            profile(
              text:
                  'Associe sua conta bancária para gerenciar suas finanças com mais eficiência. Obtenha insights e acompanhe suas transações. Siga os passos para começar!',
            ),
            Column(
              children: [
                PrimaryButton(
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/homePage');
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => const PluggyPage(),
                      // ));
                    },
                    textButton: 'Associar conta bancária',
                    color: AppColors.darkBlue),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed('/homeBottomBar');
                    },
                    child: const Text('Talvez mais tarde')),
              ],
            )
          ],
        ),
      )),
    );
  }

  profile({required String text}) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            text,
            style: AppTextStyle.mediumText18,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
