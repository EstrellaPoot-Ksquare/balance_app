import 'package:balance_app/constants/colors.dart';
import 'package:flutter/material.dart';

class CardMovement extends StatelessWidget {
  final dynamic data;
  const CardMovement({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 20,
        top: 20,
      ),
      margin: const EdgeInsets.only(bottom: 20),
      height: height * 0.1,
      color: ColorConstants.mainText,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${data.title}',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${data.createdAt}',
                style: TextStyle(
                  fontSize: 20,
                  color: ColorConstants.cardMoveDate,
                ),
              ),
            ],
          ),
          Text(
            data.type == "income" ? '+ ${data.amount}' : '- ${data.amount}',
            style: TextStyle(
              fontSize: 25,
              color: data.type == 'income'
                  ? ColorConstants.incomeText
                  : ColorConstants.expenseText,
            ),
          ),
        ],
      ),
    );
  }
}
