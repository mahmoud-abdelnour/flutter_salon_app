import 'package:certain_salon/common/widgets/custom_spacing.dart';
import 'package:certain_salon/theme/app_theme.dart';
import 'package:certain_salon/util/app_constants.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget? child;
  final BorderRadius? borderRadius;
  final double? borderRadiusAll, paddingAll, marginAll;
  final EdgeInsetsGeometry? padding, margin;
  final Color? color;
  final Color? borderColor;
  final bool bordered;
  final Border? border;
  final double? borderWidth;

  final Clip? clipBehavior;
  final BoxShape shape;
  final double? width, height;
  final AlignmentGeometry? alignment;
  final GestureTapCallback? onTap;
  final Color? splashColor;
  final bool enableBorderRadius;

  const CustomContainer(
      {super.key,
      this.child,
      this.borderRadius,
      this.padding,
      this.borderRadiusAll,
      this.paddingAll,
      this.border,
      this.borderWidth,
      this.bordered = false,
      this.clipBehavior,
      this.color,
      this.shape = BoxShape.rectangle,
      this.width,
      this.height,
      this.alignment,
      this.enableBorderRadius = true,
      this.onTap,
      this.marginAll,
      this.margin,
      this.splashColor,
      this.borderColor});

  const CustomContainer.transparent(
      {super.key,
      this.child,
      this.borderRadius,
      this.padding,
      this.borderRadiusAll,
      this.paddingAll,
      this.border,
      this.borderWidth,
      this.bordered = false,
      this.clipBehavior,
      this.color = Colors.transparent,
      this.shape = BoxShape.rectangle,
      this.width,
      this.height,
      this.alignment,
      this.enableBorderRadius = true,
      this.onTap,
      this.marginAll,
      this.margin,
      this.splashColor,
      this.borderColor});

  const CustomContainer.none(
      {super.key,
      this.child,
      this.borderRadius,
      this.padding,
      this.borderRadiusAll = 0,
      this.paddingAll = 0,
      this.border,
      this.borderWidth,
      this.bordered = false,
      this.clipBehavior,
      this.enableBorderRadius = true,
      this.color,
      this.shape = BoxShape.rectangle,
      this.width,
      this.height,
      this.alignment,
      this.onTap,
      this.marginAll,
      this.margin,
      this.splashColor,
      this.borderColor});

  const CustomContainer.bordered(
      {super.key,
      this.child,
      this.borderRadius,
      this.padding,
      this.borderRadiusAll,
      this.paddingAll,
      this.border,
      this.borderWidth,
      this.bordered = true,
      this.enableBorderRadius = true,
      this.clipBehavior,
      this.color,
      this.shape = BoxShape.rectangle,
      this.width,
      this.height,
      this.alignment,
      this.onTap,
      this.marginAll,
      this.margin,
      this.splashColor,
      this.borderColor});

  const CustomContainer.roundBordered(
      {super.key,
      this.child,
      this.borderRadius,
      this.padding,
      this.borderRadiusAll,
      this.enableBorderRadius = true,
      this.paddingAll,
      this.border,
      this.borderWidth,
      this.bordered = true,
      this.clipBehavior,
      this.color,
      this.shape = BoxShape.circle,
      this.width,
      this.height,
      this.alignment,
      this.onTap,
      this.marginAll,
      this.margin,
      this.splashColor,
      this.borderColor});

  const CustomContainer.rounded(
      {super.key,
      this.child,
      this.borderRadius,
      this.padding,
      this.borderRadiusAll,
      this.enableBorderRadius = true,
      this.paddingAll,
      this.border,
      this.bordered = false,
      this.borderWidth,
      this.clipBehavior = Clip.antiAliasWithSaveLayer,
      this.color,
      this.shape = BoxShape.circle,
      this.width,
      this.height,
      this.alignment,
      this.onTap,
      this.marginAll,
      this.margin,
      this.splashColor,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    Widget base = Container(
      width: width,
      height: height,
      alignment: alignment,
      margin: margin ?? CustomSpacing.all(marginAll ?? 0),
      decoration: BoxDecoration(
          color: color ?? theme.cardTheme.color,
          shape: shape,
          borderRadius: enableBorderRadius
              ? (shape == BoxShape.rectangle
                  ? borderRadius ??
                      BorderRadius.all(Radius.circular(borderRadiusAll ??
                          AppConstants.buttonRadius.xs))
                  : null)
              : null,
          border: bordered
              ? border ??
                  Border.all(color: borderColor ?? theme.dividerColor, width: borderWidth??1)
              : null),
      padding: padding ?? CustomSpacing.all(paddingAll ?? 16),
      clipBehavior: clipBehavior ?? Clip.none,
      child: child,
    );

    if (onTap != null) {
      return InkWell(
        borderRadius: shape != BoxShape.circle
            ? borderRadius ??
                BorderRadius.all(Radius.circular(
                    borderRadiusAll ?? AppConstants.buttonRadius.xs))
            : null,
        onTap: onTap,
        splashColor: splashColor ?? Colors.transparent,
        highlightColor: splashColor ?? Colors.transparent,
        child: base,
      );
    } else {
      return base;
    }
  }
}
