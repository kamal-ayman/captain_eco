import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:captain_eco/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../functions/show_toast.dart';
import '../theme/light_colors.dart';
import 'custom_text_form_field.dart';


class CustomText extends StatelessWidget {
  final Widget child;
  final double y;

  const CustomText({super.key, required this.child, this.y = 2.5});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, y),
      child: child,
    );
  }
}


enum FontFamily { tajawal, khebrat }

// Widget customOutlinedButton({
//   double? fontSize,
//   required BuildContext context,
//   required void Function()? onPressed,
//   String? text,
//   Widget? child,
//   double? borderRadius,
//   Color? foregroundColor,
//   Color? sideColor,
//   double? sideWidth,
//   double height = 60,
// }) {
//   return Row(
//     children: [
//       Expanded(
//         child: SizedBox(
//             height: height,
//             child: OutlinedButton(
//               style: ButtonStyle(
//                 padding: const WidgetStatePropertyAll(EdgeInsets.zero),
//                 shape: borderRadius != null
//                     ? WidgetStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(borderRadius)))
//                     : null,
//                 foregroundColor: WidgetStatePropertyAll(
//                     foregroundColor ?? LightColorsManager.primary),
//                 side: WidgetStateProperty.all(BorderSide(
//                     color: sideColor ?? Colors.black, width: sideWidth ?? 1)),
//               ),
//               onPressed: onPressed,
//               child: CustomText(
//                 child: child ??
//                     Text(text!,
//                         style: context.textTheme.titleMedium!
//                             .copyWith(fontSize: fontSize)),
//               ),
//             )),
//       ),
//     ],
//   );
// }





void showScaffoldMessage(BuildContext context, String text, [States state = States.success]) {
  Map<States, Color> selectColor = {
    States.success: LightColorsManager.primary,
    States.warning: Colors.amber.shade900,
    States.error: LightColorsManager.red,
  };

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text, textAlign: TextAlign.center),
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.fixed,
      backgroundColor: selectColor[state],
    ),
  );
}


// Get.snackbar('success'.tr, message, backgroundColor: Colors.green, colorText: Colors.white);

String constructFCMPayload({
  required data,
  required String? topic,
}) {
  return jsonEncode({
    "data": data,
    if (topic != null) "to": "/topics/$topic",
  });
}

Widget customSeparated() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Container(
      height: 1,
      color: Colors.grey[300],
    ),
  );
}

class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final TabBar widget;

  MyHeaderDelegate({required this.widget});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: Colors.white, child: widget);
  }

  @override
  double get maxExtent => widget.preferredSize.height;

  @override
  double get minExtent => widget.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

// Widget defaultSearchFormField(
//      TextEditingController searchController, BuildContext context,
//     {void Function(String)? onChanged,
//     }) =>
//     Padding(
//       padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
//       child: Container(
//         constraints: const BoxConstraints(maxWidth: 400, minWidth: 200),
//         // width: 500,
//         child: CustomTextFormField(
//           onChanged: onChanged,
//           borderRadius: 99,
//           controller: searchController,
//           prefixIcon: Bootstrap.search,
//           hintText: 'بحث',
//         ),
//       ),
//     );



// class AText extends StatelessWidget {
//   final String text;
//   final double bottom;
//   final TextStyle? style;
//
//   const AText(this.text, {super.key, this.style, this.bottom = 3});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: bottom),
//       child: Text(
//         text,
//         style: style ??
//             context.textTheme.titleMedium!.copyWith(color: LightColorsManager.white),
//       ),
//     );
//   }
// }

