// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gasto_certo/app/common/constants/app_colors.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EducationPageState createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  String dropdownValue = 'Item 1';

  List<DropDowGpt> dropList = [
    DropDowGpt(
        title: 'Dicas para economizar dinheiro.',
        description:
            'Para economizar dinheiro, evite gastos supérfluos, mantenha um orçamento mensal, busque promoções e crie um fundo de emergência para lidar com imprevistos.'),
    DropDowGpt(
        title: 'Dicas para iniciar nos investimentos.',
        description:
            'Para investimentos de curto prazo e baixo risco, considere opções como Certificados de Depósito (CDs), Fundos do Mercado Monetário, Títulos do Tesouro Direto de curto prazo, Fundos de renda fixa de curto prazo e Contas de poupança de alta rentabilidade. Certifique-se de escolher uma opção que se alinhe com seus objetivos financeiros e sua disposição para correr riscos.'),
    DropDowGpt(
        title:
            'Quais são as tendências nos meus padrões de gastos ao longo do tempo?',
        description: 'Gasto Certo - Seu app de controle e educação financeira'),
    DropDowGpt(
        title:
            'Como posso planejar financeiramente para grandes gastos futuros como uma casa nova ou um carro?',
        description: 'Gasto Certo - Seu app de controle e educação financeira'),
    DropDowGpt(
        title:
            'Quais são os principais itens que estão afetando negativamente meu orçamento?',
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
          title: const Text('Educação Financeira'),
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
