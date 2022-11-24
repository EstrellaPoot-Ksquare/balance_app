import 'package:balance_app/constants/colors.dart';
import 'package:balance_app/constants/texts.dart';
import 'package:flutter/material.dart';

class ShowDialog {
  confirmDialog(context, bool Function() onConfirm,
      {String title = 'title', String content = 'Content'}) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          title,
          style: TextStyle(
            color: ColorConstants.warning,
          ),
        ),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, AppString.cancel),
            child: Text(AppString.cancel),
          ),
          TextButton(
            onPressed: () {
              onConfirm();
            },
            child: Text(
              AppString.ok,
              style: TextStyle(color: ColorConstants.warning),
            ),
          ),
        ],
      ),
    );
  }
}
