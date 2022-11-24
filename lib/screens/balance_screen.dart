import 'package:balance_app/constants/constants.dart';
import 'package:balance_app/custom_widgets/card_movement.dart';
import 'package:balance_app/providers/movement_provider.dart';
import 'package:balance_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Consumer<MovementProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Container(
                color: ColorConstants.mainbg,
                width: double.infinity,
                height: height * 0.45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      AppString.appName.toUpperCase(),
                      style: TextStyle(
                        color: ColorConstants.mainText,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      '${AppString.unitSymbol} ${provider.balance} ${AppString.units}',
                      style: TextStyle(
                        color: ColorConstants.mainText,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.08,
                    ),
                    ElevatedButton(
                      key: const Key('goCreateMoveEB'),
                      onPressed: () {
                        Navigator.pushNamed(
                            context, CreateMovementScreen.routeName);
                      },
                      style: styleButton(),
                      child: Text(
                        AppString.create,
                        style: TextStyle(
                            color: ColorConstants.mainbg,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    color: ColorConstants.contentbg,
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: provider.movements.isEmpty
                        ? Center(
                            child: Text(
                              AppString.noDataFound,
                              style: const TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: provider.movements.length,
                            itemBuilder: (context, index) {
                              final movement = provider.movements[index];
                              return InkWell(
                                  key: Key('goDetailMoveInk_$index'),
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, MovementDetailScreen.routeName,
                                        arguments: movement);
                                  },
                                  child: CardMovement(data: movement));
                            },
                          )),
              ),
            ],
          );
        },
      ),
    );
  }

  ButtonStyle styleButton() {
    return ElevatedButton.styleFrom(
      backgroundColor: ColorConstants.mainText,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
