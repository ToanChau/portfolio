// import 'package:flutter/material.dart';
// import 'package:country_pickers/country.dart';
// import 'package:country_pickers/country_pickers.dart';
// import 'package:country_pickers/countries.dart';
// import 'package:resource/resource.dart';
// import 'package:shared/shared.dart';
//
// class CustomDialCodePicker extends StatefulWidget {
//   final Function(String)? onDialCodeChanged;
//
//   const CustomDialCodePicker({
//     super.key,
//     this.onDialCodeChanged,
//   });
//
//   @override
//   State<CustomDialCodePicker> createState() => _CustomDialCodePickerState();
// }
//
// class _CustomDialCodePickerState extends State<CustomDialCodePicker> {
//   late Country _selectedCountry;
//
//   @override
//   void initState() {
//     super.initState();
//     _selectedCountry = countryList.firstWhere((c) => c.isoCode == 'VN');
//     widget.onDialCodeChanged?.call(_selectedCountry.phoneCode);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: context.padding16_16_12,
//         vertical: context.padding12_12_06,
//       ),
//       decoration: BoxDecoration(
//         border: Border.all(color: context.color.neutral.border.secondary),
//         borderRadius: context.radiusLg,
//       ),
//       child: Container(
//         color: context.color.neutral.surface.page,
//         child: DropdownButtonHideUnderline(
//           child: DropdownButton<Country>(
//             value: _selectedCountry,
//             isDense: true,
//             icon: Assets.svg.icOutlinedDown.svg(
//               width: 16,
//               height: 16,
//               color: context.color.neutral.icon.primary,
//             ),
//             onChanged: (Country? newCountry) {
//               if (newCountry != null) {
//                 setState(() => _selectedCountry = newCountry);
//               }
//               widget.onDialCodeChanged?.call(newCountry?.phoneCode ?? '');
//             },
//             dropdownColor: context.color.neutral.surface.page,
//             items: countryList.map((country) {
//               return DropdownMenuItem<Country>(
//                 value: country,
//                 child: Row(
//                   children: [
//                     Image.asset(
//                       CountryPickerUtils.getFlagImageAssetPath(country.isoCode),
//                       width: 14,
//                       height: 10,
//                       fit: BoxFit.fill,
//                       package: "country_pickers",
//                     ),
//                     const SizedBox(width: 4),
//                     '+${country.phoneCode}'.typo({
//                       context.paragraph2Regular,
//                       Typo.color(context.color.neutral.text.tertiary)
//                     })
//                   ],
//                 ),
//               );
//             }).toList(),
//             selectedItemBuilder: (BuildContext context) {
//               return countryList.map((country) {
//                 return Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Image.asset(
//                       CountryPickerUtils.getFlagImageAssetPath(country.isoCode),
//                       width: 14,
//                       height: 10,
//                       fit: BoxFit.fill,
//                       package: "country_pickers",
//                     ),
//                     const SizedBox(width: 4),
//                     '+${country.phoneCode}'.typo({
//                       context.paragraph2Regular,
//                       Typo.color(context.color.neutral.text.tertiary),
//                     }),
//                   ],
//                 );
//               }).toList();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
