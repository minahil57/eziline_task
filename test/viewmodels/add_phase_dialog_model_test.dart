import 'package:flutter_test/flutter_test.dart';
import 'package:eziline_task/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('AddPhaseDialogModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
