import 'package:captain_eco/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/light_colors.dart';

Future<void> dialogBuilder({
  required BuildContext context,
  required String? title,
  Color? titleColor,
  Widget? content,
  void Function()? onTapYes,
  void Function()? onTapNo,
  String? yesTitle,
  bool isGreen = true,
  String? noTitle,
  bool canPop = true,
}) async =>
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => PopScope(
        canPop: canPop,
        child: AlertDialog(
          surfaceTintColor: LightColorsManager.white,
          backgroundColor: LightColorsManager.white,
          title: title != null
              ? Align(
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: titleColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              : null,
          contentTextStyle: Theme.of(context).textTheme.titleLarge,
          titleTextStyle: Theme.of(context).textTheme.titleLarge,
          contentPadding: const EdgeInsets.all(15),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              content ?? Container(),
              if (onTapYes != null)
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            customDialogElevatedButton(
                              onPressed: onTapYes,
                              text: yesTitle ?? 'yes'.tr,
                              isGreen: isGreen,
                            ),
                            customDialogElevatedButton(
                              onPressed: onTapNo ?? () => context.pop(),
                              text: noTitle ?? 'back'.tr,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
            ],
          ),
          alignment: Alignment.center,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          actionsAlignment: MainAxisAlignment.center,
        ),
      ),
    );

Widget customDialogElevatedButton({
  required void Function()? onPressed,
  required String text,
  bool? isGreen,
}) =>
    ElevatedButton(
      onPressed: onPressed,
      style: isGreen == null
          ? null
          : ButtonStyle(
              backgroundColor: WidgetStateProperty.all(isGreen
                  ? LightColorsManager.green
                  : LightColorsManager.primary),
              foregroundColor:
                  WidgetStateProperty.all(LightColorsManager.white),
            ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(text),
      ),
    );
