import 'package:ecommerce/myTheme.dart';
import 'package:flutter/material.dart';

class DialogueUtils {
  static void showLoading(BuildContext context, String message) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  width: 12,
                ),
                Text(message,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: MyTheme.primaryColor)),
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMsg(BuildContext context, String message,
      {String title = 'Title',
      String? posActionName,
      VoidCallback? posAction,
      String? negActionName,
      VoidCallback? negAction}) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(posActionName,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: MyTheme.primaryColor))));
    }
    if (negActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(negActionName,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: MyTheme.primaryColor))));
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(message,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: MyTheme.primaryColor)),
            title: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: MyTheme.primaryColor),
            ),
            actions: actions,
            titleTextStyle: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: MyTheme.primaryColor),
          );
        });
  }
}
