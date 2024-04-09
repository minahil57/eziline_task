import 'package:eziline_task/models/phase_model.dart';
import 'package:eziline_task/ui/common/app_colors.dart';
import 'package:eziline_task/ui/user_Details.dart';
import 'package:eziline_task/ui/views/home/home_viewmodel.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';

class PhaseList extends ViewModelWidget<HomeViewModel> {
  const PhaseList({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(8.0.dg),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kcPrimaryColor.withOpacity(0.1), // Set transparent color
        ),
        child: viewModel.fetchPhases.isEmpty
            ? userDetails?.userRole == 'admin' ?
            Center(
                child: IconButton(
                  onPressed: viewModel.showAddPhaseDialog,
                  icon: const Icon(
                    Icons.add_circle_outline_outlined,
                    color: kcLightGrey,
                  ),
                ),
              )
              :Padding(
                padding:  EdgeInsets.fromLTRB(60.dg, 20.dg, 60.dg, 20.dg),
                child: Text('No phases found', style: TextStyle(fontSize: 18.sp, color: kcLightGrey),),
              )
            : ListView.builder(
                itemCount:
                    viewModel.fetchPhases.length + 1, // Add 1 for the add button
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  List<PhaseModel> phases = viewModel.fetchPhases;
                  if (index == phases.length) {
                    // Render the add button
                return  userDetails?.userRole == 'admin' ?   IconButton(
                      onPressed: viewModel.showAddPhaseDialog,
                      icon: const Icon(
                        Icons.add_circle_outline_outlined,
                        color: kcLightGrey,
                      ),
                    ): const SizedBox();
                  } else {
                    final phase = phases[index];
                    final formatStartDate =
                        DateFormat('MMM d').format(phase.startDate);
                    final formatEndDate =
                        DateFormat('MMM d').format(phase.endDate);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              phase.phaseName,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color:
                                    Color(int.parse('0xFF${phase.phaseColor}')),
                              ),
                            ),
                            Text('$formatStartDate - $formatEndDate',
                                style: TextStyle(
                                    fontSize: 12.sp, color: kcWhiteColor)),
                          userDetails?.userRole == 'admin' || userDetails?.userRole == 'manager' ?  IconButton(
                                onPressed: () => viewModel.showUpdatePhaseDialog(
                                    phases[index], index),
                                icon: Icon(Icons.edit_outlined,
                                    color: kcLightGrey, size: 20.sp)): const SizedBox()
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                          color: kcWhiteColor,
                        ),
                      ],
                    );
                  }
                },
              ),
      ),
    );
  }
}
