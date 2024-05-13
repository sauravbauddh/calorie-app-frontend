import 'package:calorie_app/app/data/value/dimens.dart';
import 'package:calorie_app/app/routes/app_routes.dart';
import 'package:calorie_app/app/theme/app_color.dart';
import 'package:calorie_app/widgets/common_field_button.dart';
import 'package:calorie_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class PledgeScreen extends StatelessWidget {
  const PledgeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              heading(
                textColor: AppColors.orangeButtonColor,
                text: 'Congratulations!',
              ),
              Dimens.heightGap20,
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  shape: BoxShape.rectangle,
                  color: AppColors.blueBoxColor,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Let\'s take a self-pledge to avoid accidents',
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Dimens.heightGap40,
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Self Pledge",
                  style: TextStyle(
                      color: AppColors.blueBoxColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Dimens.heightGap10,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildPledgeCard(
                    'I promise myself to be safe for self and family',
                    Icons.family_restroom,
                  ),
                  Dimens.heightGap20,
                  _buildPledgeCard(
                    'I promise myself to wear Seat belt / Helmet\nwhile driving a Four/Two-Wheeler',
                    Icons.motorcycle,
                  ),
                  Dimens.heightGap20,
                  _buildPledgeCard(
                    'I promise myself to Not Drink and Drive',
                    Icons.wine_bar,
                  ),
                  Dimens.heightGap20,
                  _buildPledgeCard(
                    'I promise myself to Not use Mobile while driving',
                    Icons.phone,
                  ),
                  Dimens.heightGap20,
                  _buildPledgeCard(
                    'I promise myself to No Over speed driving',
                    Icons.car_crash,
                  ),
                  Dimens.heightGap20,
                ],
              ),
              CommonFiledButton(
                onTap: () {
                  Get.toNamed(Routes.NEED_HELP);
                },
                buttonColor: AppColors.orangeButtonColor,
                buttonName: "Submit",
              ),
              Dimens.heightGap10,
              GestureDetector(
                onTap: (){},
                child: Container(
                  height: Dimens.scaleX6,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.orangeButtonColor
                    ),
                    borderRadius: BorderRadius.circular(Dimens.radiusX32),
                  ),
                  child: const Center(
                    child: Text(
                      "Complete Your Profile",
                      style: TextStyle(color: AppColors.orangeButtonColor), // Set text color to orange
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPledgeCard(String text, IconData icon) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, size: 30.0),
            const SizedBox(width: 10.0),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 14.0),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
