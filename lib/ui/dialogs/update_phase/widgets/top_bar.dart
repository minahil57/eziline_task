import 'package:eziline_task/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';

class TopBarUpdatePhaseDialog extends StatelessWidget {
  final Function(DialogResponse) completer;
  const TopBarUpdatePhaseDialog({super.key, required this.completer});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Align(
        alignment: Alignment.topRight,
        child: IconButton(
          onPressed: () => completer(DialogResponse(confirmed: true)),
          icon: const Icon(
            Icons.close,
            color: kcWhiteColor,
          ),
        ),
      ),
      Text(
        'Update Phase',
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    ]);
  }
}