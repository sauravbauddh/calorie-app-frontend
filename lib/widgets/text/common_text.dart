import 'package:flutter/material.dart';

Widget heading(
    {required String text, Color? textColor, TextStyle? style, int? maxLine}) {
  return Text(
    maxLines: maxLine,
    overflow: TextOverflow.ellipsis,
    text,
    style: style ??
        TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: textColor,
        ),
  );
}

Widget subHeading(
    {required String text, Color? textColor, TextStyle? style, int? maxLine}) {
  return Text(
    text,
    maxLines: maxLine,
    overflow: TextOverflow.ellipsis,
    style: style ??
        TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: textColor,
        ),
  );
}

Widget title(
    {required String text, Color? textColor, TextStyle? style, int? maxLine}) {
  return Text(
    maxLines: maxLine,
    overflow: TextOverflow.ellipsis,
    text,
    style: style ??
        TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: textColor,
        ),
  );
}

Widget subTitle(
    {required String text, Color? textColor, TextStyle? style, int? maxLine}) {
  return Text(
    text,
    maxLines: maxLine,
    overflow: TextOverflow.ellipsis,
    style: style ??
        TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: textColor,
        ),
  );
}

Widget label(
    {required String text,
    Color? textColor,
    TextStyle? style,
    int? maxLine,
    TextAlign? textAlign}) {
  return Text(
    text,
    maxLines: maxLine,
    overflow: TextOverflow.ellipsis,
    style: style ??
        TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: textColor,
        ),
    textAlign: textAlign,
  );
}

Widget body(
    {required String text, Color? textColor, TextStyle? style, int? maxLine}) {
  return Text(
    text,
    maxLines: maxLine,
    overflow: TextOverflow.ellipsis,
    style: style ??
        TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: textColor),
  );
}

Widget caption(
    {required String text, Color? textColor, TextStyle? style, int? maxLine}) {
  return Text(
    text,
    maxLines: maxLine,
    overflow: TextOverflow.ellipsis,
    style: style ??
        TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 12,
          color: textColor,
        ),
  );
}
