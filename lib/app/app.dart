import 'package:eziline_task/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:eziline_task/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:eziline_task/ui/views/home/home_view.dart';
import 'package:eziline_task/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:eziline_task/ui/views/signup/signup_view.dart';
import 'package:eziline_task/ui/views/login/login_view.dart';
import 'package:eziline_task/ui/dialogs/add_phase/add_phase_dialog.dart';
import 'package:eziline_task/ui/dialogs/update_phase/update_phase_dialog.dart';
import 'package:eziline_task/services/phase_service.dart';
import 'package:eziline_task/services/user_service.dart';
import 'package:eziline_task/services/auth_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: LoginView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: PhaseService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: AuthService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: AddPhaseDialog),
    StackedDialog(classType: UpdatePhaseDialog),
// @stacked-dialog
  ],
)
class App {}
