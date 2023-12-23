// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gasto_certo/app/common/constants/routes.dart';
import 'package:gasto_certo/app/common/utils/functions.dart';
import 'package:gasto_certo/app/services/google_auth_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:gasto_certo/app/bloc/bloc-expenses/bloc_transaction_firebase.dart';
import 'package:gasto_certo/app/common/constants/app_colors.dart';
import 'package:gasto_certo/app/common/constants/app_text_styles.dart';
import 'package:gasto_certo/app/features/dashboard/add_transaction_page.dart';

// ignore: must_be_immutable
class DashboardHome extends StatelessWidget {
  PageController? controller;
  DashboardHome({
    Key? key,
    this.controller,
  }) : super(key: key);

  // final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  User? userInfo = FirebaseAuth.instance.currentUser;

  GoogleSignInAccount? user;
  String invited = 'Convidado';

  // @override
  @override
  Widget build(BuildContext context) {
    //log(userInfo?.photoURL ?? "");

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
              top: 78,
              left: 24,
              right: 24,
              child: Row(
                children: [
                  userInfo?.photoURL != null
                      ? ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                          child: Image.network(
                            userInfo?.photoURL ?? "",
                            height: 40,
                            width: 40,
                          ),
                        )
                      : CircleAvatar(
                          child: Text(invited[0]),
                        )
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
                      Functions.timeMessage(DateTime.now()),
                      style: AppTextStyle.smallText14
                          .copyWith(color: AppColors.white),
                    ),
                    Text(userInfo?.displayName ?? invited,
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
                        onPressed: () async {
                          await GoogleAuthService.signOut(context: context);
                          log(userInfo!.displayName!);
                          Navigator.of(context).pushNamed(NamedRoute.signIn);
                        },
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
            top: 165,
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
                            Functions.priceFormatter(
                                Provider.of<BlocTransactionFirebase>(context,
                                        listen: false)
                                    .getBalance()),
                            style: AppTextStyle.mediumText22
                                .apply(color: AppColors.white),
                          ),
                        ],
                      ),
                      MonthWidget(),
                      // IconButton(
                      //   onPressed: () => PopupMenuButton(
                      //     itemBuilder: (context) => [
                      //       const PopupMenuItem(
                      //         child: Text('Item - 1'),
                      //       ),
                      //     ],
                      //   ),
                      //   icon: const Icon(
                      //     Icons.more_horiz,
                      //     color: AppColors.white,
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_circle_up_outlined,
                            size: 40,
                            color: AppColors.white.withOpacity(0.5),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Receitas',
                                style: AppTextStyle.smallText12.apply(
                                    color: AppColors.white.withOpacity(0.7)),
                              ),
                              Text(
                                Functions.priceFormatter(
                                    Provider.of<BlocTransactionFirebase>(
                                            context,
                                            listen: false)
                                        .getTotalIcomes()),
                                style: AppTextStyle.smallText14
                                    .apply(color: AppColors.white),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_circle_down,
                            size: 40,
                            color: AppColors.white.withOpacity(0.5),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Despesas',
                                style: AppTextStyle.smallText12.apply(
                                    color: AppColors.white.withOpacity(0.7)),
                              ),
                              Text(
                                  Functions.priceFormatter(
                                      Provider.of<BlocTransactionFirebase>(
                                              context,
                                              listen: false)
                                          .getTotalExpenses()),
                                  style: AppTextStyle.smallText14.apply(
                                    color: AppColors.white,
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom: 0,
            top: 390,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Últimas de transações',
                        style: AppTextStyle.smallText16.apply(
                          color: AppColors.black,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // controller!.jumpToPage(2);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const AddTransactionPage()));
                        },
                        child: Text(
                          'Veja mais',
                          style: AppTextStyle.smallText12
                              .apply(color: AppColors.black.withOpacity(0.5)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      child: StreamBuilder(
                    initialData: Provider.of<BlocTransactionFirebase>(context)
                        .expenseList,
                    stream:
                        Provider.of<BlocTransactionFirebase>(context).output,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          final item = snapshot.data?[index];
                          final color = item!.amount!.isNegative
                              ? AppColors.red
                              : AppColors.green;

                          return Container(
                            padding: EdgeInsets.zero,
                            height: 50,
                            child: Slidable(
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    flex: 2,
                                    onPressed: (context) {
                                      Provider.of<BlocTransactionFirebase>(
                                              context,
                                              listen: false)
                                          .deleteExpense(transaction: item);
                                    },
                                    backgroundColor: AppColors.red,
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                  ),
                                  SlidableAction(
                                    flex: 2,
                                    onPressed: doNothing,
                                    backgroundColor: AppColors.greylight,
                                    foregroundColor: Colors.white,
                                    icon: Icons.cancel,
                                  ),
                                ],
                              ),
                              child: ListTile(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                leading: const Icon(Icons.access_alarm_rounded),
                                title: Text(item.description ?? ""),
                                subtitle: Text(item.date ?? ""),
                                trailing: Text(
                                  Functions.priceFormatter(item.amount ?? 0),
                                  style: TextStyle(color: color),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  doNothing(BuildContext context) {}

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

class MonthWidget extends StatelessWidget {
  const MonthWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_left_outlined),
          onPressed: () {},
        ),
        Text(
          Functions.currentMonth(),
          style: AppTextStyle.smallText16.copyWith(color: AppColors.white),
        ),
        IconButton(
          icon: Icon(Icons.arrow_right_outlined),
          onPressed: () {},
        ),
      ],
    );
  }
}
