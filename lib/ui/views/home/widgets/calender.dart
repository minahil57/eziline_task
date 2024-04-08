import 'package:eziline_task/ui/common/app_colors.dart';
import 'package:eziline_task/ui/views/home/home_viewmodel.dart';
import 'package:eziline_task/ui/views/home/meeting_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calender extends ViewModelWidget<HomeViewModel> {
  const Calender({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return SizedBox(
      height: 400.h,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0.r),
        child: SfCalendar(
          headerHeight: 80,
          selectionDecoration: const BoxDecoration(
              color: Colors.transparent,
              border: Border(
                  bottom: BorderSide(
                color: kcWhiteColor,
              ))),
          cellBorderColor: Colors.transparent,
          dataSource: MeetingDataSource(viewModel.getMonthlySource()),
          view: CalendarView.month,
          todayHighlightColor: kcWhiteColor,
          backgroundColor: kcPrimaryColor.withOpacity(0.2),
          todayTextStyle: TextStyle(fontSize: 12.sp, color: kcWhiteColor),
          appointmentTextStyle: TextStyle(fontSize: 12.sp, color: kcWhiteColor),
          headerStyle: CalendarHeaderStyle(
            textAlign: TextAlign.start,
            textStyle: TextStyle(fontSize: 20.sp, color: kcBackgroundColor),
          ),
          headerDateFormat: 'MMMM yyyy',
          viewHeaderStyle: ViewHeaderStyle(
            // Change date text color to white
            dayTextStyle: TextStyle(
                fontSize: 12.sp,
                color: kcWhiteColor), // Change day text color to white
          ),
          monthViewSettings: MonthViewSettings(
            showTrailingAndLeadingDates: false,
            appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
            showAgenda: true,
            agendaStyle: AgendaStyle(
              backgroundColor: kcPrimaryColor.withOpacity(0.1),
              appointmentTextStyle: TextStyle(
                fontSize: 12.sp,
                color: kcWhiteColor,
              ),
              
            ),
            monthCellStyle: MonthCellStyle(
              textStyle: TextStyle(
                fontSize: 12.sp,
                color: kcWhiteColor,
              ),
            ),
          ),
          monthCellBuilder: (
            BuildContext context,
            MonthCellDetails details,
          ) {
            // List<Meeting> meetings = details.appointments

            //  Check if the date has a meeting scheduled
            if (details.appointments.isNotEmpty) {
              // Customize date color based on the meeting schedule

              return Container(
                alignment: Alignment.center,
                child: Text(
                  details.date.day.toString(),
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: details.appointments.first.background ==
                            const Color(0x00000000)
                        ? kcWhiteColor.withOpacity(0.5)
                        : details.appointments.first
                            .background, // Use color from data source for scheduled meeting
                  ),
                ),
              );
            }
            // Default style for dates without scheduled meetings
            return Container(
              alignment: Alignment.center,
              child: Text(
                details.date.day.toString(),
                style: TextStyle(
                  fontSize: 12.sp,
                  color: kcWhiteColor
                      .withOpacity(0.5), // Change date text color to white
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
