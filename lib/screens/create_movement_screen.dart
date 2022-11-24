import 'package:balance_app/commons/validator.dart';
import 'package:balance_app/constants/colors.dart';
import 'package:balance_app/constants/texts.dart';
import 'package:balance_app/providers/movement_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateMovementScreen extends StatelessWidget {
  static const String routeName = '/create-movement';

  CreateMovementScreen({super.key});
  final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController amountCtrl = TextEditingController();
  final TextEditingController descCtrl = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final movementProvider =
        Provider.of<MovementProvider>(context, listen: false);
    return Container(
      color: ColorConstants.mainbg,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Consumer<MovementProvider>(
                        builder: (context, obj, child) {
                          return Row(
                            children: [
                              SizedBox(
                                width: 200,
                                height: 50,
                                child: RadioListTile(
                                  key: const Key('incomeRB'),
                                  title: Text(
                                    AppString.income,
                                    style: TextStyle(
                                      color: ColorConstants.mainbg,
                                      fontSize: 20,
                                    ),
                                  ),
                                  value: obj.movementTypes[0],
                                  groupValue: obj.selectedType,
                                  onChanged: (value) {
                                    obj.setMovementType(
                                      value.toString(),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                child: RadioListTile(
                                  key: const Key('expenseRB'),
                                  title: Text(
                                    AppString.expense,
                                    style: TextStyle(
                                      color: ColorConstants.mainbg,
                                      fontSize: 20,
                                    ),
                                  ),
                                  value: obj.movementTypes[1],
                                  groupValue: obj.selectedType,
                                  onChanged: (value) {
                                    obj.setMovementType(
                                      value.toString(),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        key: const Key('titleTextField'),
                        controller: titleCtrl,
                        validator: (value) =>
                            Validator.validateStringNotEmpty(value),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: AppString.title,
                          labelText: AppString.title,
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        key: const Key('amountTextField'),
                        controller: amountCtrl,
                        validator: (value) =>
                            Validator.validateStringNotEmptyAndNumber(value),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: AppString.amount,
                          labelText: AppString.amount,
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        key: const Key('descTextField'),
                        controller: descCtrl,
                        validator: (value) =>
                            Validator.validateStringNotEmpty(value),
                        keyboardType: TextInputType.multiline,
                        minLines: 3,
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: AppString.description,
                          labelText: AppString.description,
                        ),
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          key: const Key('createMovementEB'),
                          onPressed: () {
                            if (Validator.isValidForm(formKey)) {
                              movementProvider.addMovement(titleCtrl.text,
                                  amountCtrl.text, descCtrl.text);
                              Navigator.pop(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorConstants.mainbg,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                          child: Text(
                            AppString.submit.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
