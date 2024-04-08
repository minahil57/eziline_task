import 'package:eziline_task/services/instances/firebase_instance.dart';
import 'package:stacked/stacked.dart';
import 'package:eziline_task/app/app.locator.dart';
import 'package:eziline_task/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();


  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));
    firebaseAuth.currentUser != null
        ? _navigationService.replaceWithHomeView()
        : _navigationService.replaceWithLoginView();
  }

 
  
}
