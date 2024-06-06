import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quotes_clean/core/utils/app_color.dart';
import 'package:quotes_clean/features/quote/presentaion/controller/cubit/random_quote_cubit.dart';
import 'package:quotes_clean/features/quote/presentaion/widgets/quote_content.dart';

import '../../../../core/utils/Err_Widget.dart';

class BuildBodyContent extends StatefulWidget {
  const BuildBodyContent({Key? key}) : super(key: key);

  @override
  State<BuildBodyContent> createState() => _BuildBodyContentState();
}

class _BuildBodyContentState extends State<BuildBodyContent> {
  _getRandomQuote(){
    BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();
  }
  @override
  void initState() {
    _getRandomQuote();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
        builder: (context, state) {
          if(state is RandomQuoteIsLoading)
            {
              return  Center(
                child: SpinKitFadingCircle(
                  color: AppColors.componentColor,
                ),
              );
            }
          else if(state is RandomQuoteLoaded)
            {
              return Center(
              child: Column(
                children: [
                  QuoteContent(quote: state.quote,),

                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    splashColor: AppColors.componentColor,
                    highlightColor: AppColors.componentColor,
                    onTap: () {
                      _getRandomQuote();
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.componentColor,
                        shape: BoxShape.circle,
                      ),
                      child:Icon(
                        Icons.refresh,
                        color: Colors.white,
                      ),
                    ),
                  ),

                ],
              ),
            );}
          else if(state is RandomQuoteError)
            {
             return ErrWidget(onPress: ()=>_getRandomQuote,);
            }
          else{
            return Center(
              child: SpinKitFadingCircle(
                color: AppColors.componentColor,
              ),
            );
          }

    });
  }
}
