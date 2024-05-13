import 'package:calorie_app/app/theme/app_color.dart';
import 'package:calorie_app/app/theme/styles.dart';
import 'package:calorie_app/utils/helper/text_field_wrapper.dart';
import 'package:calorie_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CommonTextField extends StatelessWidget {
  final String hintText;
  final String? title;
  final double? height;
  final int? maxLength;
  final int? maxLine;
  final TextInputType inputType;
  final TextFieldWrapper wrapper;
  final bool isEnabled;
  final Color? fieldColor;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixWidget;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final validator;
  final Color? borderColor;
  final double? borderRadius;

  const CommonTextField({
    Key? key,
    required this.wrapper,
    this.hintText = '',
    this.title,
    this.maxLength,
    this.fieldColor,
    this.maxLine = 1,
    this.height,
    this.inputType = TextInputType.text,
    this.isEnabled = true,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixWidget,
    this.contentPadding,
    this.textInputAction,
    this.validator,
    this.inputFormatters,
    this.focusNode,
    this.onChanged,
    this.prefixIcon,
    this.borderColor,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null && title!.isNotEmpty) label(text: title!),
          SizedBox(
            height: height,
            child: TextFormField(
              maxLines: maxLine,
              controller: wrapper.controller,
              maxLength: maxLength,
              keyboardType: inputType,
              enabled: isEnabled,
              obscureText: obscureText,
              textInputAction: textInputAction,
              validator: validator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              inputFormatters: inputFormatters ?? [],
              focusNode: focusNode,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                errorStyle: const TextStyle(color: AppColors.secondaryColor),
                hintStyle: Styles.tsGreyMedium16,
                hintMaxLines: maxLine,
                errorMaxLines: null,
                isDense: true,
                errorText: wrapper.errorText.isEmpty ? null : wrapper.errorText,
                counterText: '',
                fillColor: fieldColor ?? AppColors.white,
                filled: true,
                hintText: hintText,
                floatingLabelStyle: Styles.tsBlackRegular16
                    .copyWith(color: AppColors.baseColor),
                enabled: isEnabled,
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
                prefix: prefixWidget,
                contentPadding: contentPadding,
                focusedErrorBorder: customInputBorder(),
                errorBorder: customInputBorder(),
                border: customInputBorder(),
                enabledBorder: customInputBorder(),
                disabledBorder: customInputBorder(),
                focusedBorder: customInputBorder(),
              ),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder customInputBorder() {
    if (borderRadius != null || borderColor != null) {
      return OutlineInputBorder(
        borderSide:
            BorderSide(color: borderColor ?? AppColors.inputFieldBorderColor),
        borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
      );
    } else {
      return OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.inputFieldBorderColor),
        borderRadius: BorderRadius.circular(8.0),
      );
    }
  }
}
