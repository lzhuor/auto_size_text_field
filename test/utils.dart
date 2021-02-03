import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future pump({
  required WidgetTester tester,
  required Widget widget,
}) async {
  await tester.pumpWidget(
    MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: Material(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Center(
              child: widget,
            ),
          ),
        ),
      ),
    ),
  );
}
