import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'utils.dart';

const double _testScreenHeight = 64;

const double _testScreenWidth = 357;

void main() {
  TextEditingController _controller = TextEditingController();

  testWidgets('Only Text', (tester) async {
    await pump(
      tester: tester,
      widget: Container(
          height: _testScreenHeight,
          width: _testScreenWidth,
          child: AutoSizeTextField(controller: _controller)),
    );
  });
}
