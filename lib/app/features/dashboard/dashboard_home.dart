// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:gasto_certo/app/common/constants/app_colors.dart';
import 'package:gasto_certo/app/common/constants/app_text_styles.dart';
import 'package:gasto_certo/app/common/constants/functions.dart';
import 'package:gasto_certo/app/common/extensions/sizes.dart';
import 'package:gasto_certo/app/data/models/expense_model.dart';
import 'package:gasto_certo/app/features/dashboard/dashboard_bloc.dart';
import 'package:gasto_certo/app/features/dashboard/dashboard_event.dart';
import 'package:gasto_certo/app/features/dashboard/dashboard_state.dart';

class DashboardHome extends StatefulWidget {
  DashboardHome({
    Key? key,
  }) : super(key: key);

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  final bloc = DashboardBloc();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  User? userInfo = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    bloc.input.add(GetDashboardTransiction());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(userInfo?.photoURL ?? "");
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.greyDark,
                      AppColors.grey,
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(500, 30),
                    bottomRight: Radius.elliptical(500, 30),
                  )),
              height: 287,
            ),
          ),
          Positioned(
              top: 74,
              left: 24,
              right: 24,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    child: Image.network(
                      userInfo?.photoURL ?? "",
                      height: 35,
                      width: 35,
                    ),
                  ),
                ],
              )),
          Positioned(
            top: 74,
            left: 74,
            right: 24,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bom Dia,',
                      style: AppTextStyle.smallText14
                          .copyWith(color: AppColors.white),
                    ),
                    Text(userInfo?.displayName ?? "",
                        style: AppTextStyle.mediumText18
                            .apply(color: AppColors.white)),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                      color: AppColors.white.withOpacity(0.02)),
                  child: Stack(
                    alignment: const AlignmentDirectional(0.3, -0.25),
                    children: [
                      IconButton.outlined(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_none_sharp,
                          size: 30,
                          color: AppColors.white,
                        ),
                      ),
                      Container(
                        height: 8,
                        width: 8,
                        decoration: const BoxDecoration(
                            color: AppColors.orange,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            top: 195,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.greylight1,
                        AppColors.grey,
                        AppColors.greyDark,
                      ]),
                  //color: AppColors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Saldo atual',
                            style: AppTextStyle.smallText16
                                .apply(color: AppColors.white),
                          ),
                          Text(
                            'R\$ 1.500,00',
                            style: AppTextStyle.mediumText18
                                .apply(color: AppColors.white),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () => PopupMenuButton(
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              child: Text('Item - 1'),
                            ),
                          ],
                        ),
                        icon: const Icon(
                          Icons.more_horiz,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      receitaDespesa(
                          description: 'Receitas',
                          icon: Icons.arrow_upward,
                          value: '3.800,00'),
                      receitaDespesa(
                          description: 'Despesas',
                          icon: Icons.arrow_downward,
                          value: '2.300,00'),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom: 0,
            top: 410,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Historico de transações',
                        style: AppTextStyle.smallText16.apply(
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        'Veja mais',
                        style: AppTextStyle.smallText12
                            .apply(color: AppColors.black.withOpacity(0.5)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: StreamBuilder(
                      stream: bloc.output,
                      builder: (context, state) {
                        if (state is DashboardStateLoading) {
                          return const Center(
                            child: CupertinoActivityIndicator(),
                          );
                        }
                        if (state is DashboardStateError) {
                          return Center(
                            child: Text(state.error.toString()),
                          );
                        }
                        List<ExpenseModel> list =
                            state.data?.transactionList ?? [];

                        return
                            // AnimatedList(
                            //   //key: _listKey,
                            //   initialItemCount: list.length,
                            //   padding: EdgeInsets.zero,
                            //   itemBuilder: (context, index, animation) {
                            //     final color = index % 2 == 0
                            //         ? AppColors.green
                            //         : AppColors.red;
                            //     final value = index % 2 == 0
                            //         ? "+ R\$ 150,00"
                            //         : "- R\$ 100,00";
                            //     return FadeTransition(
                            //       opacity: animation,
                            //       child: Container(
                            //         padding: EdgeInsets.zero,
                            //         height: 50,
                            //         child: ListTile(
                            //           contentPadding: const EdgeInsets.symmetric(
                            //             horizontal: 8,
                            //           ),
                            //           leading:
                            //               const Icon(Icons.access_alarm_rounded),
                            //           title: Text(list[index].description!),
                            //           subtitle: const Text('Hoje'),
                            //           trailing: Text(
                            //             Functions.priceFormatter(
                            //                 list[index].amount!),
                            //             style: TextStyle(color: color),
                            //           ),
                            //         ),
                            //       ),
                            //     );
                            //   },
                            // );

                            Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: ListView.builder(
                            // separatorBuilder: (context, index) => Divider(),
                            padding: EdgeInsets.zero,
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              final item = list[index];
                              final color = item.amount!.isNegative
                                  ? AppColors.red
                                  : AppColors.green;
                              // final value = item. % 2 == 0
                              //     ? "+ R\$ 150,00"
                              //     : "- R\$ 100,00";
                              return Container(
                                padding: EdgeInsets.zero,
                                height: 50,
                                child: ListTile(
                                  contentPadding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  leading:
                                      const Icon(Icons.access_alarm_rounded),
                                  title: Text(list[index].description!),
                                  subtitle: const Text('Hoje'),
                                  trailing: Text(
                                    Functions.priceFormatter(
                                        list[index].amount!),
                                    style: TextStyle(color: color),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  receitaDespesa(
      {required String description,
      required IconData icon,
      required String value}) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.02),
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: Icon(
            icon,
            color: AppColors.white,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              style: AppTextStyle.smallText16.apply(color: AppColors.white),
            ),
            Text(
              'R\$ $value',
              style: AppTextStyle.smallText16.apply(color: AppColors.white),
            ),
          ],
        ),
      ],
    );
  }
}
