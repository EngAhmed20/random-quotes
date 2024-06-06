import 'package:flutter/material.dart';
import 'package:quotes_clean/core/utils/app_color.dart';
import 'package:quotes_clean/features/quote/domain/entities/quote.dart';

class QuoteContent extends StatelessWidget {
  const QuoteContent({Key? key, required this.quote}) : super(key: key);
  final Quote quote;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.componentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            quote.content,
            style:Theme.of(context).textTheme.bodyLarge,textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Text(quote.author,style:  Theme.of(context).textTheme.bodyLarge,),
          ),
        ],
      ),
    );
  }
}
