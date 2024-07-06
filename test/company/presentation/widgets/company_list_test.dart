import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:tractian_challenge_one/company/domain/entities/company.dart';
import 'package:tractian_challenge_one/company/presentation/widgets/company_list.dart';

import '../../stubs.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await loadAppFonts();
  });

  Future<void> build(WidgetTester tester, List<Company> companies) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(useMaterial3: false),
        home: Scaffold(
          body: CompanyList(companies: companies),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('CompanyList displays a list of companies',
      (WidgetTester tester) async {
    // Act
    await build(tester, companyMock);

    // Assert
    expect(find.byType(CompanyList), findsOneWidget);
    expect(find.text('Jaguar'), findsOneWidget);
    expect(find.text('Tobias'), findsOneWidget);
    expect(find.text('Apex'), findsOneWidget);

    expect(find.byIcon(Icons.business), findsNWidgets(3));
  });

  testWidgets('CompanyList displays a list of companies with correct styles',
      (WidgetTester tester) async {
    // Act
    await build(tester, companyMock);

    final cardFinder = find.byType(Card);
    expect(cardFinder, findsWidgets);
    final card = tester.widget<Card>(cardFinder.first);
    expect(card.color, equals(Colors.blue));

    // Assert
    final titleFinder = find.descendant(
      of: cardFinder.first,
      matching: find.byType(Text),
    );
    expect(titleFinder, findsOneWidget);
    final titleWidget = tester.widget<Text>(titleFinder.first);
    expect(titleWidget.style!.color, equals(Colors.white));

    expect(find.byIcon(Icons.business), findsNWidgets(companyMock.length));
  });

  testGoldens('CompanyList widget golden test', (WidgetTester tester) async {
    // Act
    await build(tester, companyMock);

    // Assert
    await expectLater(
      find.byType(CompanyList),
      matchesGoldenFile('golden_image/company_list.png'),
    );
  });
}
