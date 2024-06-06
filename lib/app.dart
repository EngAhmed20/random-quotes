import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_clean/config/locale/app_localizations_setup.dart';
import 'package:quotes_clean/config/theme/app_theme.dart';
import 'package:quotes_clean/core/utils/app_route.dart';
import 'package:quotes_clean/core/utils/app_string.dart';
import 'package:quotes_clean/core/utils/service_locator.dart' as di;
import 'package:quotes_clean/features/splash/presentation/controller/cubit/local_cubit.dart';

class QuateApp extends StatelessWidget {
  const QuateApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.getIt<LocalCubit>()..getSavedLang()),
      ],
      child: BlocBuilder<LocalCubit, LocalState>(
        buildWhen: (previosState,CurrentState){
          return previosState!= CurrentState;
        },
        builder: (context, state) {
          return MaterialApp.router(
            title: AppStrings.appName,
            theme: themeData(),
            locale: state.locale,
            debugShowCheckedModeBanner: false,
            routerConfig: AppRoute.router,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
          );
        },
      ),
    );
  }
}
