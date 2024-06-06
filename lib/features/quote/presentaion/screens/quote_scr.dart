import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_clean/config/locale/app_localizations.dart';
import 'package:quotes_clean/core/utils/app_string.dart';
import 'package:quotes_clean/core/utils/service_locator.dart'as di;
import 'package:quotes_clean/features/quote/presentaion/controller/cubit/random_quote_cubit.dart';
import 'package:quotes_clean/features/splash/presentation/controller/cubit/local_cubit.dart';
import '../widgets/build_body_content.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context)=>di.getIt<RandomQuoteCubit>(),
    child: Scaffold(
        appBar: AppBar(
          leading:  IconButton(onPressed: () {
            if(AppLocalizations.of(context)!.isEnLocale)
              {
                BlocProvider.of<LocalCubit>(context).toArabic();
              }else{
              BlocProvider.of<LocalCubit>(context).toEng();
            }
          }, icon: Icon(Icons.translate),),
          title: Text(AppLocalizations.of(context)!.translate('app_name')!),

        ),
        body:BuildBodyContent()
    ),
    );
  }
}
