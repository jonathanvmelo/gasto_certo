// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// // ignore: must_be_immutable
// class CadastroCliente extends StatefulWidget {
//   final String cnpjCliente;
//   bool? readOnly = false;
//   CadastroCliente({this.cnpjCliente = '', Key? key, this.readOnly})
//       : super(key: key);

//   @override
//   _CadastroClienteState createState() => _CadastroClienteState(cnpjCliente);
// }

// class _CadastroClienteState extends State<CadastroCliente> {
//   final String _cnpjCliente;

//   _CadastroClienteState(cnpjCliente) : _cnpjCliente = cnpjCliente;

//   final TextEditingController _cnpjController = TextEditingController();
//   final TextEditingController _nomeController = TextEditingController();
//   final TextEditingController _nomeFantasiaController = TextEditingController();
//   final TextEditingController _apelidoController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _emailNfeController = TextEditingController();
//   final TextEditingController _inscricaoController = TextEditingController();
//   final TextEditingController _cepController = TextEditingController();
//   final TextEditingController _cidadeController = TextEditingController();
//   // final TextEditingController _ufController = TextEditingController();
//   final TextEditingController _ruaController = TextEditingController();
//   final TextEditingController _numeroController = TextEditingController();
//   final TextEditingController _bairroController = TextEditingController();
//   final TextEditingController _complementoController = TextEditingController();
//   final TextEditingController _cepCobController = TextEditingController();
//   final TextEditingController _cidadeCobController = TextEditingController();
//   //final TextEditingController _ufCobController = TextEditingController();
//   final TextEditingController _ruaCobController = TextEditingController();
//   final TextEditingController _numeroCobController = TextEditingController();
//   final TextEditingController _bairroCobController = TextEditingController();

//   final TextEditingController _complementoCobController =
//       TextEditingController();
//   final TextEditingController _nomeContatoController = TextEditingController();
//   final TextEditingController _dddContatoController = TextEditingController();
//   final TextEditingController _foneContatoController = TextEditingController();
//   final TextEditingController _nomeContatoComController =
//       TextEditingController();
//   final TextEditingController _dddContatoComController =
//       TextEditingController();
//   final TextEditingController _foneContatoComController =
//       TextEditingController();
//   final TextEditingController _nomeContatoFinController =
//       TextEditingController();
//   final TextEditingController _dddContatoFinController =
//       TextEditingController();
//   final TextEditingController _foneContatoFinController =
//       TextEditingController();

//   final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
//       GlobalKey<RefreshIndicatorState>();
//   final GlobalKey<RefreshIndicatorState> _refreshReferenciaKey =
//       GlobalKey<RefreshIndicatorState>();

//   final _formDadosGeraisKey = GlobalKey<FormState>();
//   final _formEnderecoKey = GlobalKey<FormState>();

//   String? _ufController;
//   String? _ufCobController;

//   // ClienteBloc bloc = ClienteBloc();
//   // MercadologicoBloc blocMercadologico = MercadologicoBloc();

//   // late List<ExpansionPanelModel> paginas;
// //
//   bool isReadOnly = false;

//   final _cnpjFocus = FocusNode();
//   final _inscricaoFocus = FocusNode();
//   final _nomeClienteFocus = FocusNode();
//   final _nomeFanFocus = FocusNode();

//   final _emailFocus = FocusNode();
//   final _emailNfFocus = FocusNode();

//   final _cepFocus = FocusNode();
//   final _ufFocus = FocusNode();
//   final _cidadeFocus = FocusNode();
//   final _bairroFocus = FocusNode();
//   final _ruaFocus = FocusNode();
//   final _numeroFocus = FocusNode();
//   final _complementoFocus = FocusNode();

//   final _cepCobFocus = FocusNode();
//   final _ufCobFocus = FocusNode();
//   final _cidadeCobFocus = FocusNode();
//   final _bairroCobFocus = FocusNode();
//   final _ruaCobFocus = FocusNode();
//   final _numeroCobFocus = FocusNode();
//   final _complementoCobFocus = FocusNode();

//   // ignore: unused_field
//   final _nomeContFocus = FocusNode();
//   final _dddContFocus = FocusNode();
//   final _telContFocus = FocusNode();
//   final _nomeContComFocus = FocusNode();
//   final _dddContComFocus = FocusNode();
//   final _telContComFocus = FocusNode();
//   final _nomeContFinFocus = FocusNode();
//   final _dddContFinFocus = FocusNode();
//   final _telContFinFocus = FocusNode();

//   String? valorDrop;
//   String _estado1 = '';
//   String _estado2 = '';

//   GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     super.initState();
//     // if (_cnpjCliente != "") log("Buscou um CNPJ ${_cnpjCliente}");
//     // bloc.buscarClienteCNPJ(_cnpjCliente).then((value) => _setDados(value));
//     // blocMercadologico.buscarMercadologicoReferenciaPelaFranquia(_cnpjCliente);
//     // if (widget.readOnly != null) {
//     //   isReadOnly = widget.readOnly!;
//     // }
//     _estado1 = listaEstados.first;
//     _estado2 = listaEstados.first;
//   }

//   List<String> listaEstados = ['AC', 'AM', 'AP', "PI"];

//   void copiarDados(String value) {
//     setState(() {
//       _estado2 =
//           _estado1; // atualiza o valor do _estado2 para ser igual ao _estado1
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     this.paginas = [
//       ExpansionPanelModel(
//           radius: 4,
//           title: "Dados Gerais",
//           isExpanded: true,
//           page: _dadosGerais()),
//       ExpansionPanelModel(title: "Endereço", page: _endereco()),
//       ExpansionPanelModel(
//           title: "Contato", isExpanded: false, page: _contato()),
//       ExpansionPanelModel(
//           title: "Referência comercial",
//           isExpanded: false,
//           page: _dadosReferencia()),
//     ];

//     print(this.paginas);

//     _setState() {
//       setState(() {});
//     }

//     return Scaffold(
//       backgroundColor: Settings.grey_04,
//       key: _scaffoldKey,
//       drawer: DrawerMenu(title: ''),
//       appBar: appBarPadrao(
//         context,
//         'Cadastrar Clientes',
//         subTitle: 'Preencha os campos abaixo para cadastrar as informações',
//         isEditar: isReadOnly,
//         onTapa: (value) {
//           log('onTapa');
//           log(isReadOnly.toString());
//           isReadOnly = !isReadOnly;

//           _setState();
//           log(isReadOnly.toString());
//         },
//         leading: IconButton(
//           onPressed: () {
//             _scaffoldKey.currentState!.openDrawer();
//           },
//           icon: Icon(
//             Icons.menu,
//             color: Settings.brandBlue,
//             size: 30,
//           ),
//         ),
//       ),
//       body: GestureDetector(
//           onTap: () {
//             FocusScopeNode currentFocus = FocusScope.of(context);

//             if (!currentFocus.hasPrimaryFocus) {
//               currentFocus.unfocus();
//             }
//           },
//           child: _body(context)),
//       bottomNavigationBar: _bottomNavigation(),
//     );
//   }

//   _body(BuildContext context) {
//     return SingleChildScrollView(
//         child: Container(
//       padding: Functions.paddingPercentual(
//           context: context, topo: 2, direita: 5, esquerda: 5, fundo: 5),
//       decoration: BoxDecoration(
//         //color: Theme.of(context).primaryColor,
//         borderRadius: BorderRadius.all(
//           Radius.circular(20),
//         ),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.max,
//         children: <Widget>[
//           ExpansionPanelDefault(
//             this.paginas,
//           ),
//         ],
//       ),
//     ));
//   }

//   _bottomNavigation() {
//     return Container(
//         padding: EdgeInsets.all(30),
//         height: 100,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: <Widget>[
//             ElevatedButton(
//               child: Text(
//                 "CONCLUIR CADASTRO",
//                 style: TextStyle(color: Settings.white),
//               ),
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: Settings.goldenYellow),
//               onPressed: _concluirCadastro,
//             )
//           ],
//         ));
//   }

//   dropDownUF() {
//     var lista = [];

//     lista = listaEstados
//         .map((String value) => DropdownMenuItem<String>(
//               onTap: () {},
//               child: Text(
//                 value,
//                 style: TextStyle(color: Settings.black_04),
//               ),
//               value: value,
//             ))
//         .toList();
//     // _ufController = _ufController ?? listaEstados.first;
//     // _ufCobController = _ufCobController ?? listaEstados.first;
//     return lista;
//   }

//   _concluirCadastro() async {
//     // if (!_formDadosGeraisKey.currentState!.validate()) {
//     //   log('validator formkey');
//     //   Functions.showAlertError(context, 'Erro', 'Erro teste');
//     //   return;
//     // }
//     // if (!_formEnderecoKey.currentState!.validate()) return;
//     // if (!_formContatoKey.currentState!.validate()) return;

//     // if (!Validator.validaCnpj(_cnpjController.text)) {
//     //   log('concluirCadastro');
//     //   Functions.showAlertError(
//     //       context, "CNPJ inválido", "O cliente precisa ter um CNPJ válido");
//     //   return;
//     // }
//     // if (!Validator.validaInscricao(_inscricaoController.text)) {
//     //   Functions.showAlertError(context, "Inscrição inválida",
//     //       "O cliente precisa ter inscrição válida");
//     //   return;
//     // }
//     // if (!Validator.validaNome(_nomeController.text)) {
//     //   Functions.showAlertError(
//     //       context, "Nome inválido", "O cliente precisa ter nome válido");
//     //   return;
//     // }

//     // if (_nomeFantasiaController.text.trim().isEmpty) {
//     //   _nomeFantasiaController.text = _nomeController.text;
//     //   setState(() {});
//     //   return;
//     // }

//     // if (!Validator.validaCEP(_cepController.text)) {
//     //   Functions.showAlertError(
//     //       context, "CEP inválido", "O cliente precisa ter um CEP válido");
//     //   return;
//     // }
//     // if (!Validator.validaCidade(_cidadeController.text)) {
//     //   Functions.showAlertError(
//     //       context, "Cidade inválida", "O cliente precisa ter um Cidade válido");
//     //   return;
//     // }
//     // if (!bloc.validaBairro(_bairroController.text)) {
//     //   Functions.showAlertError(
//     //       context, "Bairro inválido", "O cliente precisa ter um Bairro válido");
//     //   return;
//     // }
//     // if (!bloc.validaRua(_ruaController.text)) {
//     //   Functions.showAlertError(
//     //       context, "Rua inválida", "O cliente precisa ter uma Rua válida");
//     //   return;
//     // }
//     // if (!bloc.validaNumero(_ruaController.text)) {
//     //   Functions.showAlertError(
//     //       context, "Número inválido", "O cliente precisa ter um Número válido");
//     //   return;
//     // }

//     if (_cepCobController.text.isEmpty &&
//         _cidadeCobController.text.isEmpty &&
//         _bairroCobController.text.isEmpty &&
//         _ruaCobController.text.isEmpty &&
//         _numeroCobController.text.isEmpty) {
//       _copiarDados();
//     }

//     var alteracao = (_cnpjCliente != "" && _cnpjCliente != "");
//     if (alteracao) {
//       await bloc.atualizarCliente(
//           _aplicaAlteracoes(await bloc.buscarClienteCNPJ(_cnpjCliente)));
//     } else {
//       await bloc.adicionarCliente(_aplicaAlteracoes(Cliente()));
//     }

//     var operacao = alteracao ? "alterado" : "cadastrado";
//     Functions.showAlertSuccess(
//         context, "Sucesso", "Cliente $operacao com sucesso");
//   }

//   _setDados(Cliente cliente) async {
//     if (cliente != "")
//       setState(() {
//         //_cnpjController.text = UtilBrasilFields.obterCnpj(cliente.cnpj);
//         _cnpjController.text = cliente.cnpj;
//         _inscricaoController.text = cliente.inscricao;
//         _nomeController.text = cliente.nome;
//         _nomeFantasiaController.text = cliente.nomeFantasia;
//         _apelidoController.text = cliente.apelido;
//         _emailController.text = cliente.email;
//         _emailNfeController.text = cliente.emailNfe;
//         // _cepController.text = UtilBrasilFields.obterCep(cliente.cep);
//         _cepController.text = cliente.cep;
//         _cidadeController.text = cliente.cidade;
//         _ufController = cliente.uf;
//         _ruaController.text = cliente.rua;
//         _numeroController.text = cliente.numero;
//         _complementoController.text = cliente.complemento;
//         _bairroController.text = cliente.bairro;
//         // _cepController.text = UtilBrasilFields.obterCep(cliente.cep);
//         _cepCobController.text = cliente.cepCobranca;
//         _cidadeCobController.text = cliente.cidadeCobranca;
//         _ufCobController = cliente.ufCobranca;
//         _ruaCobController.text = cliente.ruaCobranca;
//         _numeroCobController.text = cliente.numeroCobranca;
//         _complementoCobController.text = cliente.complementoCobranca;
//         _bairroCobController.text = cliente.bairroCobranca;
//         _nomeContatoController.text = cliente.nomeContato;
//         _dddContatoController.text = cliente.dddContato;
//         _foneContatoController.text = cliente.foneContato;
//         _nomeContatoComController.text = cliente.nomeContatoComercial;
//         _dddContatoComController.text = cliente.dddContatoComercial;
//         _foneContatoComController.text = cliente.foneContatoComercial;
//         _nomeContatoFinController.text = cliente.nomeContatoFinanceiro;
//         _dddContatoFinController.text = cliente.dddContatoFinanceiro;
//         _foneContatoFinController.text = cliente.foneContatoFinanceiro;
//       });
//   }

//   Cliente _aplicaAlteracoes(Cliente cliente) {
//     cliente.cnpj = replaceAcentuacao(value: _cnpjController.text);
//     cliente.inscricao = replaceAcentuacao(value: _inscricaoController.text);
//     cliente.nome = replaceAcentuacao(value: _nomeController.text);
//     cliente.nomeFantasia =
//         replaceAcentuacao(value: _nomeFantasiaController.text);
//     cliente.apelido = replaceAcentuacao(value: _apelidoController.text);
//     cliente.email = replaceAcentuacao(value: _emailController.text);
//     cliente.emailNfe = replaceAcentuacao(value: _emailNfeController.text);
//     cliente.cep = replaceAcentuacao(value: _cepController.text);
//     cliente.cidade = replaceAcentuacao(value: _cidadeController.text);
//     cliente.uf = replaceAcentuacao(value: _ufController);
//     cliente.rua = replaceAcentuacao(value: _ruaController.text);
//     cliente.numero = replaceAcentuacao(value: _numeroController.text);
//     cliente.complemento = replaceAcentuacao(value: _complementoController.text);
//     cliente.bairro = replaceAcentuacao(value: _bairroController.text);
//     cliente.cepCobranca = replaceAcentuacao(value: _cepCobController.text);
//     cliente.cidadeCobranca =
//         replaceAcentuacao(value: _cidadeCobController.text);
//     cliente.ufCobranca = replaceAcentuacao(value: _ufCobController);
//     cliente.ruaCobranca = replaceAcentuacao(value: _ruaCobController.text);
//     cliente.numeroCobranca =
//         replaceAcentuacao(value: _numeroCobController.text);
//     cliente.complementoCobranca =
//         replaceAcentuacao(value: _complementoCobController.text);
//     cliente.bairroCobranca =
//         replaceAcentuacao(value: _bairroCobController.text);
//     cliente.nomeContato = replaceAcentuacao(value: _nomeContatoController.text);
//     cliente.dddContato = replaceAcentuacao(value: _dddContatoController.text);
//     cliente.foneContato = replaceAcentuacao(value: _foneContatoController.text);
//     cliente.nomeContatoComercial =
//         replaceAcentuacao(value: _nomeContatoComController.text);
//     cliente.dddContatoComercial =
//         replaceAcentuacao(value: _dddContatoComController.text);
//     cliente.foneContatoComercial =
//         replaceAcentuacao(value: _foneContatoComController.text);
//     cliente.nomeContatoFinanceiro =
//         replaceAcentuacao(value: _nomeContatoFinController.text);
//     cliente.dddContatoFinanceiro =
//         replaceAcentuacao(value: _dddContatoFinController.text);
//     cliente.foneContatoFinanceiro =
//         replaceAcentuacao(value: _foneContatoFinController.text);
//     cliente.dataEnvio = 0;

//     return cliente;
//   }

//   _dadosGerais() {
//     var cnpjMask = MaskTextInputFormatter(
//       mask: '##.###.###/####-##',
//       filter: {'#': RegExp(r'[0-9]')},
//     );
//     // var inscricaoMask = MaskTextInputFormatter(
//     //   mask: '###.###.###.###',
//     //   filter: {'#': RegExp(r'[0-9]')},
//     // );
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 10),
//       decoration: BoxDecoration(),
//       child: Form(
//         key: _formDadosGeraisKey,
//         autovalidateMode: AutovalidateMode.disabled,
//         child: Column(
//           children: <Widget>[
//             LinhaTabletColunaMobile(
//               item1: TextBoxSalesForce(
//                 focusNode: _cnpjFocus,
//                 inputFormatters: [
//                   FilteringTextInputFormatter.digitsOnly,
//                   cnpjMask
//                 ],
//                 labelText: "CNPJ Cliente",
//                 validator: (value) => Validator.validaCnpj(value),
//                 textInputType: TextInputType.number,
//                 numberOnly: true,
//                 readOnly: isReadOnly,
//                 controller: _cnpjController,
//                 textInputAction: TextInputAction.next,
//                 onFieldSubmitted: (value) {
//                   FocusScope.of(context).requestFocus(_inscricaoFocus);
//                 },
//               ),
//               item2: TextBoxSalesForce(
//                 focusNode: _inscricaoFocus,
//                 onFieldSubmitted: (value) {
//                   FocusScope.of(context).requestFocus(_nomeClienteFocus);
//                 },
//                 inputFormatters: [
//                   FilteringTextInputFormatter.digitsOnly,
//                   //inscricaoMask
//                 ],
//                 labelText: "Inscrição",
//                 readOnly: isReadOnly == false ? false : true,
//                 textInputType: TextInputType.number,
//                 controller: _inscricaoController,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextBoxSalesForce(
//                 focusNode: _nomeClienteFocus,
//                 onFieldSubmitted: (value) {
//                   FocusScope.of(context).requestFocus(_nomeFanFocus);
//                 },
//                 labelText: "Nome Cliente",
//                 readOnly: isReadOnly,
//                 textInputType: TextInputType.text,
//                 textCapitalization: TextCapitalization.words,
//                 controller: _nomeController,
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.all(8),
//               child: TextBoxSalesForce(
//                 focusNode: _nomeFanFocus,
//                 onFieldSubmitted: (value) {
//                   _emailFocus.requestFocus();
//                 },
//                 labelText: "Nome Fantasia",
//                 readOnly: isReadOnly,
//                 textCapitalization: TextCapitalization.words,
//                 textInputType: TextInputType.emailAddress,
//                 controller: _nomeFantasiaController,
//               ),
//             ),
//             LinhaTabletColunaMobile(
//               item1: TextBoxSalesForce(
//                 focusNode: _emailFocus,
//                 onFieldSubmitted: (value) {
//                   FocusScope.of(context).requestFocus(_emailNfFocus);
//                 },
//                 labelText: "E-mail",
//                 readOnly: isReadOnly,
//                 textInputType: TextInputType.emailAddress,
//                 controller: _emailController,
//                 textCapitalization: TextCapitalization.none,
//               ),
//               item2: TextBoxSalesForce(
//                 focusNode: _emailNfFocus,
//                 onFieldSubmitted: (value) {
//                   FocusScope.of(context).unfocus();
//                 },
//                 textInputAction: TextInputAction.done,
//                 textCapitalization: TextCapitalization.none,
//                 labelText: "E-mail Nfe",
//                 readOnly: isReadOnly,
//                 textInputType: TextInputType.emailAddress,
//                 controller: _emailNfeController,
//               ),
//             ),
//             cadastrarMercadologico()
//           ],
//         ),
//       ),
//     );
//   }

//   cadastrarMercadologico() {
//     return GestureDetector(
//       onTap: () async {
//         if (_cnpjController.text.length < 13) {
//           _concluirCadastro();
//           ShowAlert.showAlert(context,
//               "Para cadasrtar dados mercadológicos, preencha os dados gerais",
//               title: "Mensagem", tipo: AlertType.warning);
//         } else {
//           var cliente = await bloc.buscarClienteCNPJ(_cnpjCliente);
//           push(context, CadastroMercadologico(franquia: cliente.cnpj));
//         }
//       },
//       child: Container(
//         padding: const EdgeInsets.all(18.0),
//         alignment: Alignment.centerLeft,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Icon(
//               Icons.bar_chart,
//               color: Settings.goldenYellow,
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             Padding(
//               padding: Functions.isRetrato()
//                   ? const EdgeInsets.only(top: 4)
//                   : const EdgeInsets.only(top: 6),
//               child: Text(
//                 "Cadastrar informações mercadológicas",
//                 style: TextStyle(
//                   fontSize: _cadastrarMercadologicoFontSize(),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   _cadastrarMercadologicoFontSize() {
//     double fontSize = 0;
//     bool isTablet = Functions.isTablet();
//     if (isTablet) {
//       if (Functions.isRetrato()) {
//         fontSize = 26;
//       } else {
//         fontSize = 22;
//       }
//     } else {
//       if (Functions.isRetrato()) {
//         fontSize = 16;
//       } else {
//         fontSize = 11;
//       }
//     }
//     return fontSize;
//   }

//   _endereco() {
//     var cepMask = MaskTextInputFormatter(
//       mask: '#####-###',
//       filter: {'#': RegExp(r'[0-9]')},
//     );

//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 10),
//       child: Form(
//         key: _formEnderecoKey,
//         autovalidateMode: AutovalidateMode.disabled,
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           children: <Widget>[
//             LinhaTabletColunaMobile(
//               flex1: 2,
//               item1: TextBoxSalesForce(
//                 textInputAction: TextInputAction.done,
//                 focusNode: _cepFocus,
//                 onFieldSubmitted: (value) {
//                   FocusScope.of(context).unfocus();
//                 },
//                 inputFormatters: [
//                   FilteringTextInputFormatter.digitsOnly,
//                   cepMask
//                 ],
//                 labelText: "CEP",
//                 readOnly: isReadOnly,
//                 textInputType: TextInputType.number,
//                 numberOnly: true,
//                 //validator: validaCEP,
//                 controller: _cepController,
//               ),
//               item2: Container(
//                   height: 60,
//                   decoration: BoxDecoration(
//                     boxShadow: [
//                       new BoxShadow(
//                         color: Colors.black12,
//                         offset: new Offset(2, 2),
//                         blurRadius: 6,
//                         spreadRadius: 2,
//                       ),
//                     ],
//                     borderRadius: BorderRadius.circular(8),
//                     color: Settings.white,
//                   ),
//                   child: DropdownButtonFormField(
//                     value: _estado1,
//                     focusNode: _ufFocus,
//                     hint: Text('UF'),
//                     decoration: InputDecoration(border: InputBorder.none),
//                     padding: EdgeInsets.only(left: 45, top: 10, right: 45),
//                     items: dropDownUF(),
//                     onChanged: (value) {
//                       setState(() {
//                         _estado1 = value.toString();
//                         copiarDados(value.toString());
//                         log(_estado1);
//                       });
//                       log('Estado 2$_estado2');

//                       FocusScope.of(context).unfocus();
//                       // requestFocus(_cidadeFocus);
//                     },
//                     isExpanded: true,
//                   )),
//             ),
//             LinhaTabletColunaMobile(
//               item1: TextBoxSalesForce(
//                 focusNode: _cidadeFocus,
//                 onFieldSubmitted: (value) {
//                   _bairroFocus.requestFocus();
//                 },
//                 labelText: "Cidade",
//                 readOnly: isReadOnly,
//                 textInputType: TextInputType.text,
//                 controller: _cidadeController,
//               ),
//               item2: TextBoxSalesForce(
//                 focusNode: _bairroFocus,
//                 onFieldSubmitted: (value) {
//                   _ruaFocus.requestFocus();
//                 },
//                 labelText: "Bairro",
//                 readOnly: isReadOnly,
//                 textInputType: TextInputType.text,
//                 controller: _bairroController,
//               ),
//             ),
//             LinhaTabletColunaMobile(
//               flex1: 2,
//               item1: TextBoxSalesForce(
//                 focusNode: _ruaFocus,
//                 onFieldSubmitted: (value) {
//                   _numeroFocus.requestFocus();
//                 },
//                 labelText: "Rua",
//                 readOnly: isReadOnly,
//                 textInputType: TextInputType.text,
//                 controller: _ruaController,
//                 textInputAction: TextInputAction.next,
//               ),
//               item2: TextBoxSalesForce(
//                 focusNode: _numeroFocus,
//                 onFieldSubmitted: (value) {
//                   _complementoFocus.requestFocus();
//                 },
//                 labelText: "Número",
//                 readOnly: isReadOnly,
//                 textInputType: TextInputType.number,
//                 numberOnly: true,
//                 controller: _numeroController,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextBoxSalesForce(
//                 focusNode: _complementoFocus,
//                 onFieldSubmitted: (value) {
//                   FocusScope.of(context).unfocus();
//                 },
//                 labelText: "Complemento",
//                 readOnly: isReadOnly,
//                 textInputType: TextInputType.text,
//                 controller: _complementoController,
//               ),
//             ),
//             Container(
//               alignment: Alignment.centerLeft,
//               padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
//               child: ElevatedButton(
//                 child: Text(
//                   "COPIAR DADOS DE ENDEREÇO",
//                   style: TextStyle(color: Settings.white),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: Settings.goldenYellow),
//                 onPressed: _copiarDados,
//               ),
//             ),
//             LinhaTabletColunaMobile(
//               flex1: 2,
//               item1: TextBoxSalesForce(
//                 focusNode: _cepCobFocus,
//                 onFieldSubmitted: (value) {
//                   FocusScope.of(context).unfocus();
//                   // _ufCobFocus.requestFocus();
//                 },
//                 inputFormatters: [
//                   FilteringTextInputFormatter.digitsOnly,
//                   cepMask
//                 ],
//                 labelText: "CEP Cobrança",
//                 readOnly: isReadOnly,
//                 textInputType: TextInputType.number,
//                 numberOnly: true,
//                 //validator: validaCEP,
//                 controller: _cepCobController,
//               ),
//               item2: Container(
//                 height: 60,
//                 decoration: BoxDecoration(
//                   boxShadow: [
//                     new BoxShadow(
//                       color: Colors.black12,
//                       offset: new Offset(2, 2),
//                       blurRadius: 6,
//                       spreadRadius: 2,
//                     ),
//                   ],
//                   borderRadius: BorderRadius.circular(8),
//                   color: Settings.white,
//                 ),
//                 child: DropdownButtonFormField(
//                   value: _estado2,
//                   focusNode: _ufCobFocus,
//                   hint: Text('UF'),
//                   decoration: InputDecoration(border: InputBorder.none),
//                   padding: EdgeInsets.only(left: 45, top: 10, right: 45),
//                   items: dropDownUF(),
//                   onChanged: (value) {},
//                   // onChanged: (value) {
//                   //   setState(() {
//                   //     _estado2 =  value.toString();
//                   //   });
//                   //   log('estado 1 - ${_estado1}');
//                   //  log('estado 2 - ${_estado2}');

//                   //   // setState(() {
//                   //   //   _estado2 = value!.toString();
//                   //   // });

//                   //   FocusScope.of(context).requestFocus(_cidadeCobFocus);
//                   // },
//                   isExpanded: true,
//                 ),
//               ),
//             ),
//             LinhaTabletColunaMobile(
//               item1: TextBoxSalesForce(
//                 focusNode: _cidadeCobFocus,
//                 onFieldSubmitted: (value) {
//                   _bairroCobFocus.requestFocus();
//                 },
//                 labelText: "Cidade Cobrança",
//                 readOnly: isReadOnly,
//                 textInputType: TextInputType.text,
//                 controller: _cidadeCobController,
//               ),
//               item2: TextBoxSalesForce(
//                 focusNode: _bairroCobFocus,
//                 onFieldSubmitted: (value) {
//                   _ruaCobFocus.requestFocus();
//                 },
//                 labelText: "Bairro Cobrança",
//                 readOnly: isReadOnly,
//                 textInputType: TextInputType.text,
//                 controller: _bairroCobController,
//               ),
//             ),
//             LinhaTabletColunaMobile(
//               flex1: 2,
//               item1: TextBoxSalesForce(
//                 focusNode: _ruaCobFocus,
//                 onFieldSubmitted: (value) {
//                   _numeroCobFocus.requestFocus();
//                 },
//                 labelText: "Rua Cobrança",
//                 readOnly: isReadOnly,
//                 textInputType: TextInputType.text,
//                 controller: _ruaCobController,
//               ),
//               item2: TextBoxSalesForce(
//                 focusNode: _numeroCobFocus,
//                 onFieldSubmitted: (value) {
//                   _complementoCobFocus.requestFocus();
//                 },
//                 labelText: "Nº Cobrança",
//                 readOnly: isReadOnly,
//                 textInputType: TextInputType.number,
//                 numberOnly: true,
//                 controller: _numeroCobController,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextBoxSalesForce(
//                 focusNode: _complementoCobFocus,
//                 onFieldSubmitted: (value) {
//                   FocusScope.of(context).unfocus();
//                 },
//                 labelText: "Complemento Cobrança",
//                 readOnly: isReadOnly,
//                 textInputType: TextInputType.text,
//                 textInputAction: TextInputAction.done,
//                 controller: _complementoCobController,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   _contato() {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 10),
//       child: Form(
//         // key: _formContatoKey,
//         autovalidateMode: AutovalidateMode.disabled,
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextBoxSalesForce(
//                 onFieldSubmitted: (value) {
//                   _dddContFocus.requestFocus();
//                 },
//                 labelText: "Nome Contato",
//                 readOnly: isReadOnly,
//                 textInputType: TextInputType.text,
//                 textCapitalization: TextCapitalization.words,
//                 controller: _nomeContatoController,
//               ),
//             ),
//             LinhaTabletColunaMobile(
//               flex2: 3,
//               item1: TextBoxSalesForce(
//                 maxLength: 2,
//                 focusNode: _dddContFocus,
//                 onFieldSubmitted: (value) {
//                   _telContFocus.requestFocus();
//                 },
//                 labelText: "DDD ",
//                 readOnly: isReadOnly,
//                 textInputType: TextInputType.number,
//                 numberOnly: true,
//                 //validator: validaDDD,
//                 controller: _dddContatoController,
//               ),
//               item2: TextBoxSalesForce(
//                 focusNode: _telContFocus,
//                 onFieldSubmitted: (value) {
//                   _nomeContComFocus.requestFocus();
//                 },
//                 maxLength: 10,
//                 inputFormatters: [
//                   FoneTextInputFormatter(),
//                 ],
//                 labelText: "Telefone",
//                 readOnly: isReadOnly,
//                 textInputType: TextInputType.number,
//                 numberOnly: true,
//                 // validator: validaTelefone,
//                 controller: _foneContatoController,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextBoxSalesForce(
//                 focusNode: _nomeContComFocus,
//                 onFieldSubmitted: (value) {
//                   _dddContComFocus.requestFocus();
//                 },
//                 labelText: "Nome Contato Comercial",
//                 readOnly: isReadOnly,
//                 textInputType: TextInputType.text,
//                 controller: _nomeContatoComController,
//               ),
//             ),
//             LinhaTabletColunaMobile(
//               flex2: 3,
//               item1: TextBoxSalesForce(
//                 maxLength: 2,
//                 focusNode: _dddContComFocus,
//                 onFieldSubmitted: (value) {
//                   _telContComFocus.requestFocus();
//                 },
//                 labelText: "DDD ",
//                 readOnly: isReadOnly,
//                 textInputType: TextInputType.number,
//                 numberOnly: true,
//                 // validator: validaDDD,
//                 controller: _dddContatoComController,
//               ),
//               item2: TextBoxSalesForce(
//                 focusNode: _telContComFocus,
//                 onFieldSubmitted: (value) {
//                   _nomeContFinFocus.requestFocus();
//                 },
//                 inputFormatters: [
//                   FilteringTextInputFormatter.digitsOnly,
//                   FoneTextInputFormatter()
//                 ],
//                 maxLength: 10,
//                 labelText: "Telefone Comercial",
//                 readOnly: isReadOnly,
//                 textInputType: TextInputType.number,
//                 numberOnly: true,
//                 // validator: validaTelefone,
//                 controller: _foneContatoComController,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextBoxSalesForce(
//                 focusNode: _nomeContFinFocus,
//                 onFieldSubmitted: (value) {
//                   _dddContFinFocus.requestFocus();
//                 },
//                 labelText: "Nome Contato Financeiro",
//                 readOnly: isReadOnly,
//                 textInputType: TextInputType.text,
//                 controller: _nomeContatoFinController,
//               ),
//             ),
//             LinhaTabletColunaMobile(
//               flex2: 3,
//               item1: TextBoxSalesForce(
//                 maxLength: 2,
//                 focusNode: _dddContFinFocus,
//                 onFieldSubmitted: (value) {
//                   _telContFinFocus.requestFocus();
//                 },
//                 labelText: "DDD ",
//                 readOnly: isReadOnly,
//                 textInputType: TextInputType.number,
//                 numberOnly: true,
//                 // validator: validaDDD,
//                 controller: _dddContatoFinController,
//               ),
//               item2: TextBoxSalesForce(
//                 focusNode: _telContFinFocus,
//                 labelText: "Telefone Financeiro",
//                 textInputAction: TextInputAction.done,
//                 maxLength: 10,
//                 inputFormatters: [
//                   FilteringTextInputFormatter.digitsOnly,
//                   FoneTextInputFormatter()
//                 ],
//                 onFieldSubmitted: (value) {
//                   FocusScope.of(context).unfocus();
//                 },
//                 readOnly: isReadOnly,
//                 textInputType: TextInputType.number,
//                 numberOnly: true,
//                 // validator: validaTelefone,
//                 controller: _foneContatoFinController,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   _copiarDados() {
//     log(' uf ${_estado1}');
//     log(' uf cobrança ${_estado2}');
//     setState(() {
//       _estado2 = _estado1;
//     });
//     log('depois uf ${_estado1}');
//     log('depois uf cobrança ${_estado2}');

//     _cepCobController.text = _cepController.text;
//     _ruaCobController.text = _ruaController.text;
//     _bairroCobController.text = _bairroController.text;
//     _cidadeCobController.text = _cidadeController.text;
//     _numeroCobController.text = _numeroController.text;
//     _complementoCobController.text = _complementoController.text;
//     setState(() {});
//   }

//   String replaceAcentuacao({required value}) {
//     var comAcento =
//         'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
//     var semAcento =
//         'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

//     for (int i = 0; i < comAcento.length; i++) {
//       value = value.replaceAll(comAcento[i], semAcento[i]);
//     }
//     return value;
//   }

//   _dadosReferencia() {
//     return Container(
//       padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
//       child: Form(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             _carregaDadosReferencia(),
//             Row(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 Icon(
//                   Icons.add_box_outlined,
//                   color: Settings.goldenYellow,
//                 ),
//                 SizedBox(
//                   width: 5,
//                 ),
//                 TextButton(
//                   onPressed: () async {
//                     var uuidReferencia = await Functions.uuidGenerate();
//                     await push(
//                         context,
//                         CadastroReferenciaComercial(
//                           franquia: _cnpjCliente,
//                           uuidReferencia: uuidReferencia,
//                         ));
//                     _refreshReferencia();
//                   },
//                   child: StreamBuilder(
//                     stream: blocMercadologico.streamReferencia,
//                     builder: (context, snapshot) {
//                       if (snapshot.hasData) {
//                         return Text("Adicionar mais referências",
//                             style: TextStyle(color: Settings.brandBlue));
//                       } else {
//                         return Text("Adicionar referência",
//                             style: TextStyle(color: Settings.brandBlue));
//                       }
//                     },
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   _carregaDadosReferencia() {
//     if (_cnpjCliente.isNotEmpty) {
//       return CarregamentoListaComponentes(
//         list: _listaReferencias,
//         mensagem: "-",
//         refresh: _refreshReferencia,
//         refreshIndicatorKey: _refreshReferenciaKey,
//         stream: blocMercadologico.streamReferencia,
//       );
//     } else {
//       return Container();
//     }
//   }

//   Future<void> _refreshReferencia() {
//     FocusScope.of(context).unfocus();
//     _refreshIndicatorKey.currentState?.show();

//     return blocMercadologico
//         .buscarMercadologicoReferenciaPelaFranquia(_cnpjCliente);
//   }

//   Column _listaReferencias(List<MercadologicoReferecia> referencia) {
//     List<Widget> mercadologicoReferenciaCadastrados = referencia.map((e) {
//       return Padding(
//         padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
//         child: Container(
//             height: 40,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               color: Colors.grey[200],
//             ),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Expanded(
//                     child: Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
//                   child: Text(e.empresa,
//                       style: TextStyle(
//                         fontWeight: FontWeight.w400,
//                         fontFamily:
//                             Theme.of(context).textTheme.titleSmall!.fontFamily,
//                         fontSize: 20,
//                       )),
//                 )),
//                 _buttonItem(e.uuidReferencia)
//               ],
//             )),
//       );
//     }).toList();

//     return Column(children: mercadologicoReferenciaCadastrados);
//   }

//   _buttonItem(String uuidReferencia) {
//     return PopupMenuButton(
//       onSelected: (String value) async {
//         if (value == "E") {
//           await push(
//               context,
//               CadastroReferenciaComercial(
//                 franquia: _cnpjCliente,
//                 uuidReferencia: uuidReferencia,
//               ));
//         }
//         _refreshReferencia();
//       },
//       icon: Icon(Icons.more_vert),
//       itemBuilder: (context) {
//         return [
//           PopupMenuItem<String>(
//             value: 'E',
//             child: Row(
//               children: [
//                 Icon(Icons.edit_document, color: Settings.brandBlue),
//                 SizedBox(
//                   width: 8,
//                 ),
//                 Text('Editar'),
//               ],
//             ),
//           ),
//           PopupMenuItem<String>(
//             value: 'D',
//             child: Row(
//               children: [
//                 Icon(Icons.delete_outline, color: Settings.red),
//                 SizedBox(
//                   width: 8,
//                 ),
//                 Text(
//                   'Excluir',
//                   style: TextStyle(color: Settings.red),
//                 ),
//               ],
//             ),
//           ),
//         ];
//       },
//     );
//   }
// }
