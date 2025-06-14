import 'package:flutter/material.dart';
import 'package:panel_apk/src/commons/extension.dart';

import '../../config/size_config.dart';

class AppTextForm extends StatelessWidget {
  final Widget? preffixIcon;
  final Widget? suffixIcon;
  final String? label;
  final String? staticLabel;
  final bool obscureText;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final double pddingHorizontal;
  final double paddingVertical;
  final String? hintText;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool isError;
  final String? errorMessage;
  final FormFieldValidator? validator;
  final int? minlines;
  final int? maxLines;
  final bool? disable;
  const AppTextForm({
    super.key,
    this.preffixIcon,
    this.label,
    this.onChanged,
    required this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.pddingHorizontal = 20,
    this.paddingVertical = 10,
    this.hintText,
    this.floatingLabelBehavior,
    this.validator,
    this.isError = false,
    this.errorMessage = "Data Tidak Boleh Kosong",
    this.minlines,
    this.maxLines,
    this.disable,
    this.staticLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Appsize.symetric(horizontal: pddingHorizontal, vertical: paddingVertical),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            staticLabel ?? '',
            style: context.styleText.titleLarge,
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            style: context.styleText.bodyMedium,
            obscureText: obscureText,
            validator: validator,
            minLines: minlines ?? 1,
            maxLines: maxLines ?? 1,
            enabled: disable == null ? true : !disable!,
            decoration: InputDecoration(
              alignLabelWithHint: true,
              errorText: isError ? errorMessage : null,
              errorStyle: context.styleText.labelSmall!.copyWith(color: context.colorSchema.error),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: context.colorSchema.onSurface),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: context.colorSchema.error),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              errorBorder: isError
                  ? OutlineInputBorder(
                      borderSide: BorderSide(color: context.colorSchema.error),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                    )
                  : null,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: context.colorSchema.onSurface),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: context.colorSchema.onSurface.withAlpha(150)),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              labelText: label,
              floatingLabelBehavior: floatingLabelBehavior,
              hintText: hintText,
              hintStyle: context.styleText.bodyMedium!.copyWith(color: context.colorSchema.onSurface.withAlpha(150)),
              labelStyle: context.styleText.bodyMedium,
              prefixIcon: preffixIcon,
              suffixIcon: suffixIcon,
              suffixIconColor: context.colorSchema.onSurface,
              prefixIconColor: context.colorSchema.onSurface,
            ),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
