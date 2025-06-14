import 'dart:developer';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:panel_apk/src/commons/extension.dart';

countryCodeFormCreate(BuildContext context) {
  return showCountryPicker(
    context: context,
    countryListTheme: CountryListThemeData(
      flagSize: 25,
      searchTextStyle: context.styleText.bodyMedium,
      backgroundColor: Colors.white,
      textStyle: context.styleText.bodyMedium,
      bottomSheetHeight: 500, // Optional. Country list modal height
      //Optional. Sets the border radius for the bottomsheet.
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      //Optional. Styles the search field.
      inputDecoration: InputDecoration(
        hintStyle: context.styleText.bodyMedium!.copyWith(color: context.colorSchema.onSurface.withAlpha(150)),
        labelStyle: context.styleText.bodyMedium,
        labelText: 'Search',
        hintText: 'Start typing to search country code',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: context.colorSchema.onSurface.withAlpha(150)),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    ),
    onSelect: (Country country) {
      log('Select country: ${country.countryCode}');
    },
    useSafeArea: true,
    moveAlongWithKeyboard: true,
    searchAutofocus: true,
  );
}
