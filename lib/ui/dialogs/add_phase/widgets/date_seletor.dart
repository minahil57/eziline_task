import 'package:eziline_task/ui/common/app_colors.dart';
import 'package:eziline_task/ui/dialogs/add_phase/add_phase_dialog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class DateSelectorAddPhaseDialog extends ViewModelWidget<AddPhaseDialogModel> {
  final String title;

  const DateSelectorAddPhaseDialog({super.key, required this.title});

  @override
  Widget build(BuildContext context, AddPhaseDialogModel viewModel) {
    String formattedStartDate = DateFormat.yMd().format(viewModel.start);
    String formattedDate = DateFormat.yMd().format(viewModel.end);
    return Padding(
      padding: const EdgeInsets.only(right: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 12.sp,
                color: kcWhiteColor,
                fontWeight: FontWeight.w400),
          ),
          title == 'Start Date'
              ? Text(
                  formattedStartDate,
                  style: TextStyle(
                      color: kcLightGrey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                )
              : Text(
                  formattedDate,
                  style: TextStyle(
                      color: kcLightGrey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ),
          GestureDetector(
            onTap: () => title == 'Start Date'
                ? viewModel.openStartDateCalendar(context)
                : viewModel.openEndDateCalendar(context),
            child: const Icon(
              Icons.calendar_month,
            ),
          )
        ],
      ),
    );
  }
}
