// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gasto_certo/app/common/constants/app_colors.dart';

class Investing extends StatefulWidget {
  const Investing({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InvestingState createState() => _InvestingState();
}

class _InvestingState extends State<Investing> {
  String dropdownValue = 'Item 1';

  List<DropDowGpt> dropList = [
    DropDowGpt(
        title: 'Dicas para iniciar nos investimentos..',
        description:
            'Para economizar dinheiro, evite gastos supérfluos, mantenha um orçamento mensal, busque promoções e crie um fundo de emergência para lidar com imprevistos.'),
    DropDowGpt(
        title:
            'Como começar a investir com pouco dinheiro e ampliar meus investimentos ao longo do tempo?.',
        description:
            'Gasto Certo - Seu app de controle e educação financeira.'),
    DropDowGpt(
        title:
            'Como analisar e interpretar indicadores financeiros e econômicos para tomar decisões informadas sobre investimentos?',
        description: 'Gasto Certo - Seu app de controle e educação financeira'),
    DropDowGpt(
        title:
            'Como acompanhar o desempenho dos meus investimentos e saber se estou no caminho certo para alcançar meus objetivos financeiros?',
        description: 'Gasto Certo - Seu app de controle e educação financeira'),
    DropDowGpt(
        title:
            'O que fazer em caso de perda de dinheiro em um investimento e como evitar erros semelhantes no futuro?',
        description: 'Gasto Certo - Seu app de controle e educação financeira'),
    DropDowGpt(
        title:
            'Quais são os sinais de alerta financeiros que devo observar para evitar problemas futuros?',
        description: 'Gasto Certo - Seu app de controle e educação financeira'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: null, icon: Icon(Icons.person)),
          toolbarHeight: 80,
          backgroundColor: AppColors.darkBlue,
          title: const Text('Investimentos'),
        ),
        body: ListView(
          children: [dropDow()],
        ));
  }

  Widget dropDow() {
    return Column(
      children: dropList.map((e) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: ExpansionTile(
            collapsedTextColor: AppColors.darkBlue,
            textColor: AppColors.darkBlue,
            title: Text(
              e.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  e.description,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class DropDowGpt {
  String title;
  String description;
  DropDowGpt({
    required this.title,
    required this.description,
  });
}
