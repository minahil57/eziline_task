import 'package:eziline_task/ui/common/app_colors.dart';
import 'package:eziline_task/ui/user_Details.dart';
import 'package:eziline_task/ui/views/home/widgets/calender.dart';
import 'package:eziline_task/ui/views/home/widgets/phase_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'package:eziline_task/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kcBackgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hello, ${userDetails?.name}\nYour Role: ${userDetails?.userRole}',
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                          color: kcWhiteColor
                      ) 
                    ),

                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: viewModel.logout,
                        icon: const Icon(
                          Icons.logout,
                        )
                      )
                    ),
                  ],
                ),
                verticalSpaceMedium,
                Text(
                  'Tasks with Calender',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w900,
                      color: kcWhiteColor),
                ),

                verticalSpaceMedium,
                const Calender(),
                verticalSpaceMedium,
                Text(' Add Phases',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w900,
                        color: kcWhiteColor)),
                verticalSpaceSmall,
                const PhaseList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
