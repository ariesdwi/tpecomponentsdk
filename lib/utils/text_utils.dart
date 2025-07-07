import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget textDefault(text,
    {size, color, weight, overflow, maxlines, textAlign, softwrap}) {
  return Text(
    text.toString(),
    overflow: overflow,
    textAlign: textAlign,
    maxLines: maxlines,
    style: TextStyle(
      color: color,
      fontWeight: weight,
      fontSize: size,
    ),
    softWrap: softwrap,
  );
}

textBody14Bold(text, {color, weight, textAlign}) {
  return textDefault(
    text,
    size: 14.spMin,
    color: color,
    weight: FontWeight.w700,
    textAlign: textAlign,
  );
}

textBody14SemiBold(text, {color, weight, textAlign}) {
  return textDefault(
    text,
    size: 14.spMin,
    color: color,
    weight: FontWeight.w600,
    textAlign: textAlign,
  );
}

textBody12Bold(text, {color, weight, textAlign}) {
  return textDefault(
    text,
    size: 12.spMin,
    color: color,
    weight: FontWeight.w700,
    textAlign: textAlign,
  );
}

textHeader20Bold(text, {color, weight, textAlign}) {
  return textDefault(
    text,
    size: 20.spMin,
    color: color,
    weight: FontWeight.w700,
    textAlign: textAlign,
  );
}

Widget textDefaultWithIcon(text, icon,
    {size,
    color,
    weight,
    overflow,
    align,
    maxlines,
    softwrap,
    sizeIcon,
    colorIcon}) {
  return Row(
    children: [
      Text(
        text.toString(),
        overflow: overflow,
        textAlign: align,
        maxLines: maxlines,
        style: TextStyle(
          color: color,
          fontWeight: weight,
          fontSize: size,
        ),
        softWrap: softwrap,
      ),
      Icon(
        icon,
        size: sizeIcon,
        color: colorIcon,
      )
    ],
  );
}