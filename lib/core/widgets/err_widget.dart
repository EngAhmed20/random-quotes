import 'package:flutter/material.dart';
import 'package:quotes_clean/core/utils/app_color.dart';

import '../../config/locale/app_localizations.dart';

class ErrWidget extends StatelessWidget {
  const ErrWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.error_outline,
          size: 100,
          color: AppColors.componentColor,
        ),
        SizedBox(height: 20),
        Text(
          AppLocalizations.of(context)!.translate('something_went_wrong')!,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
