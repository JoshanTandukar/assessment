import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:assessment/global/app_color.dart';

class BeautifiedAppTextField extends StatelessWidget {
  const BeautifiedAppTextField({
    super.key,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.focusNode,
    this.enabled = true,
    this.fillColor = AppColor.white,
    this.borderRadius,
    this.contentPadding,
    this.errorText,
    this.onSubmitted,
    this.textInputAction,
    this.autofocus = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.counterText,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.hintStyle,
    this.labelStyle,
    this.errorStyle,
    this.obscuringCharacter = '•',
    this.showObscureTextToggle = false,
    this.readOnly = false,
    this.onTap,
  });

  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final bool enabled;
  final Color fillColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final String? errorText;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final String? counterText;
  final TextCapitalization textCapitalization;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final String obscuringCharacter;
  final bool showObscureTextToggle;
  final bool readOnly;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffe4e5e7).withOpacity(0.24),
            offset: const Offset(0, 1),
            blurRadius: 2,
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextFormField(
        onTap: onTap,
        readOnly: readOnly,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onChanged: onChanged,
        focusNode: focusNode,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        validator: validator,
        enabled: enabled,
        onFieldSubmitted: onSubmitted,
        textInputAction: textInputAction,
        autofocus: autofocus,
        maxLines: maxLines,
        minLines: minLines,
        maxLength: maxLength,
        textCapitalization: textCapitalization,
        style: style ??
            Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColor.neutral950,
                ),
        obscuringCharacter: obscuringCharacter,
        decoration: InputDecoration(
          filled: true,
          counterText: counterText,
          hintText: hintText,
          labelText: labelText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon ??
              (showObscureTextToggle ? _buildObscureTextToggle() : null),
          fillColor: fillColor,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(
                vertical: 10.w,
                horizontal: 10.w,
              ),
          errorText: errorText,
          errorStyle: errorStyle ??
              Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColor.error400,
                  ),
          hintStyle: hintStyle ??
              Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColor.neutral500,
                  ),
          labelStyle: labelStyle ??
              Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColor.neutral600,
                  ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.primary300.withValues(
                alpha: 0.8,
              ),
              width: 1.r,
            ),
            borderRadius: BorderRadius.circular(
              12.r,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.neutral150.withValues(
                alpha: 0.8,
              ),
              width: 1.r,
            ),
            borderRadius: BorderRadius.circular(
              12.r,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.neutral150.withValues(
                alpha: 0.8,
              ),
              width: 1.r,
            ),
            borderRadius: BorderRadius.circular(
              12.r,
            ),
          ),
        ),
      ),
    );
  }

  Widget? _buildObscureTextToggle() {
    return IconButton(
      icon: Icon(
        obscureText ? Icons.visibility_off : Icons.visibility,
        color: Colors.grey,
      ),
      onPressed: () {
        // Toggle obscureText state (requires a StatefulWidget for this functionality).
      },
    );
  }
}
