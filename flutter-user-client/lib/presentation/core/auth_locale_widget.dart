import 'package:efpl/application/util/util_bloc.dart';
import 'package:efpl/injectable.dart';
import 'package:efpl/presentation/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthLocaleWidget extends StatelessWidget {
  const AuthLocaleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UtilBloc, UtilState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            String currentLocale = getIt<UtilBloc>().state.locale.toString();
            getIt<UtilBloc>().add(
              UtilEvent.setLocale(
                newLocale: currentLocale == "en"
                    ? const Locale("am")
                    : const Locale("en"),
              ),
            );
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: ConstantColors.primary_900,
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              boxShadow: [
                BoxShadow(
                  color: ConstantColors.primary_900,
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(
                    0,
                    3,
                  ), // changes position of shadow
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: 
                getIt<UtilBloc>().state.locale.toString() == "en" ||
                        getIt<UtilBloc>().state.locale.toString() == ""
                    ? Center(child: Text("EN",style: Theme.of(context).textTheme.bodyText1!.copyWith(color: ConstantColors.neutral_200,),),)
                    :Center(child: Text("AM",style: Theme.of(context).textTheme.bodyText1!.copyWith(color: ConstantColors.neutral_200,),),),
              
            ),
            // child: Text(
            //   state.locale.toString(),
            // ),
          ),
        );
      },
    );
  }
}
