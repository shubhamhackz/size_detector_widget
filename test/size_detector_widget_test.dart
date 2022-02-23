import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:size_detector_widget/size_detector_widget.dart';

void main() {
  testWidgets('SizeDetectorWidget(), can be constructed', (tester) async {
    await tester.pumpWidget(
      SizeDetectorWidget(
        onSizeDetect: (val) {},
        child: const SizedBox(
          width: 100,
          height: 100,
        ),
      ),
    );
  });
}
