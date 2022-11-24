import 'package:balance_app/constants/colors.dart';
import 'package:balance_app/models/movement.dart';
import 'package:balance_app/providers/movement_provider.dart';
import 'package:balance_app/styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovementDetailScreen extends StatefulWidget {
  static const String routeName = '/movement-detail';
  final Movement movement;
  const MovementDetailScreen({super.key, required this.movement});

  @override
  State<MovementDetailScreen> createState() => _MovementDetailScreenState();
}

class _MovementDetailScreenState extends State<MovementDetailScreen> {
  bool onDelete() {
    final provider = Provider.of<MovementProvider>(context, listen: false);
    // final int index = provider.movements
    //     .indexWhere((element) => element.title == widget.movement.title);
    provider.removeMovement(widget.movement.id);
    provider.getBalance();
    Navigator.pop(context);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      color: AppTheme.mainColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorConstants.scaffoldbg,
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: width,
              height: height * 0.3,
              padding: const EdgeInsets.only(
                bottom: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 2,
                  color: const Color.fromARGB(255, 204, 204, 204),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: widget.movement.type == 'income'
                          ? ColorConstants.mainbg
                          : ColorConstants.expenseText,
                    ),
                    child: Text(
                      widget.movement.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Amount: ${widget.movement.amount}',
                    style: textSTyle(),
                  ),
                  Text(
                    'Description: ${widget.movement.description}',
                    style: textSTyle(),
                  ),
                  Text(
                    'Type: ${widget.movement.type}',
                    style: textSTyle(),
                  ),
                  Text(
                    widget.movement.createdAt,
                    style: textSTyle(),
                  ),
                  ElevatedButton(
                    key: const Key('deleteEB'),
                    onPressed: () {
                      onDelete();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: widget.movement.type == 'income'
                          ? ColorConstants.mainbg
                          : ColorConstants.expenseText,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 40,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Delete',
                      style: textSTyle(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle textSTyle() {
    return const TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
    );
  }
}
