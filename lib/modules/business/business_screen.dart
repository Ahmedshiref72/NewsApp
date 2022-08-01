import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../layout/news_app/cubit/cubit.dart';
import '../../layout/news_app/cubit/states.dart';
import '../../shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit, newsStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var list = newsCubit.get(context).business;

        return ScreenTypeLayout(
          mobile: Builder(
            builder: (context) {
              newsCubit.get(context).setDesktop(false);
              return articleBuilder(list, context);
            }
          ),
          desktop: Builder(
            builder: (context) {
              newsCubit.get(context).setDesktop(true);
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: articleBuilder(list, context),
                  ),
                  if(list.length >0)
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          '${list[newsCubit.get(context).selectedBusinessItem]['description']}',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                  ),

                ],
              );
            }
          ),
            breakpoints: ScreenBreakpoints(
              desktop:700,tablet:600 ,watch:100 ,
            )
        );
      },
    );
  }
}