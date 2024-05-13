import 'package:calorie_app/app/theme/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'text/common_text.dart';

class EmptyWidget extends StatelessWidget {
  final double? height;
  final String heading;
  final String? msg;
  const EmptyWidget({super.key, this.height, required this.heading, this.msg});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/not_found.jpg',
            height: height ?? 150,
            fit: BoxFit.fitHeight,
          ),
          label(text: heading, textColor: AppColors.greyTextColor),
          msg?.isNotEmpty ?? false
              ? caption(text: msg!)
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
