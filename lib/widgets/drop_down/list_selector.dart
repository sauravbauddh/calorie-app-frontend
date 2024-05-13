import 'package:calorie_app/app/data/value/dimens.dart';
import 'package:calorie_app/app/data/value/strings.dart';
import 'package:calorie_app/app/theme/app_color.dart';
import 'package:calorie_app/app/theme/styles.dart';
import 'package:calorie_app/utils/app_utils.dart';
import 'package:calorie_app/widgets/common_field_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListSelector extends StatelessWidget {
  final Widget child;
  final Function onSelectOption;
  final Function onConfirm;
  final String title;
  final bool? isEnabled;
  final List<String>? data;
  final List<String>? selectedData;
  final String emptyLabel;

  const ListSelector({
    Key? key,
    required this.child,
    required this.onSelectOption,
    required this.onConfirm,
    required this.title,
    required this.data,
    this.emptyLabel = "",
    required this.selectedData,
    this.isEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    RxList<String> tempList = RxList();
    tempList.assignAll(data!);

    return GestureDetector(
      onTap: () {
        if (isEnabled ?? true) {
          AppUtils.getBottomSheet(children: [
            Text(title,
                style: Styles.tsBlackRegular14.copyWith(fontSize: 16.0)),
            SizedBox(height: 10.0),
            SizedBox(
              height: Dimens.screenHeight / 2,
              child: Column(
                children: [
                  Expanded(
                    child: Obx(
                      () => tempList.isNotEmpty
                          ? ListView(
                              padding: const EdgeInsets.only(),
                              children: [
                                for (String value in tempList)
                                  ListTile(
                                    dense: true,
                                    leading: Icon(
                                      selectedData!.contains(value)
                                          ? Icons.check_box
                                          : Icons.check_box_outline_blank,
                                      color: AppColors.baseColor,
                                    ),
                                    title: Text(value),
                                    onTap: () {
                                      onSelectOption(value);
                                    },
                                  ),
                              ],
                            )
                          : Center(
                              child: Text(
                                emptyLabel,
                                style: Styles.tsGreyRegular14,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
            CommonFiledButton(
              onTap: () {
                onConfirm(selectedData!.join(','));
                controller.text = "";
                tempList.clear();
                tempList.assignAll(data!);
                Get.back();
              },
              buttonName: AppStrings.confirm,
            ),
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
