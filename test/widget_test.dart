// test/widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_2/main.dart';  // Đường dẫn đúng

void main() {
  testWidgets('Ứng dụng chạy được', (WidgetTester tester) async {
    // Build app
    await tester.pumpWidget(const MyApp() as Widget);

    // Kiểm tra tiêu đề
    expect(find.text('Thế Giới Thể Thao'), findsOneWidget);
  });
}

class MyApp {
  const MyApp();
}