import 'package:calorie_app/app/theme/app_color.dart';
import 'package:calorie_app/app/theme/styles.dart';
import 'package:calorie_app/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ValueSelector extends StatelessWidget {
  final Widget child;
  final Function onTap;
  final bool? isEnable;
  final String title;
  final String? selectedValue;
  final List<String> data;
  final String emptyLabel;

  const ValueSelector({
    Key? key,
    required this.child,
    required this.onTap,
    required this.title,
    required this.data,
    this.emptyLabel = "",
    this.selectedValue,
    this.isEnable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    RxList<String> tempList = RxList(data);

    return GestureDetector(
      onTap: () {
        if (isEnable ?? true) {
          AppUtils.getBottomSheet(children: [
            Text(title,
                style: Styles.tsGreyRegular14
                    .copyWith(fontSize: 16.0, color: Colors.black)),
            SizedBox(height: 10.0),
            SizedBox(
              height: 200,
              child: Column(
                children: [
                  Expanded(
                    child: Obx(
                      () => data.isNotEmpty
                          ? ListView(
                              padding: const EdgeInsets.only(),
                              children: [
                                for (String value in tempList)
                                  ListTile(
                                    dense: true,
                                    title: Text(
                                      value.capitalize ?? '',
                                      style: value == selectedValue
                                          ? Styles.tsBlackMedium14.copyWith(
                                              color: AppColors.baseColor)
                                          : Styles.tsBlackMedium14,
                                    ),
                                    onTap: () {
                                      onTap(value);
                                      controller.text = "";
                                      tempList.value = [];
                                      tempList.value = data;
                                      Get.back();
                                    },
                                  )
                              ],
                            )
                          : Center(
                              child: Text(
                              emptyLabel,
                              style: Styles.tsGreyRegular14,
                            )),
                    ),
                  ),
                ],
              ),
            )
          ]);
        }
      },
      child: AbsorbPointer(
        absorbing: true,
        child: child,
      ),
    );
  }
}
