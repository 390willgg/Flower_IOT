import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/mockito.dart';

class MockGoRouter extends Mock implements GoRouter {}

void main() {
  testWidgets(
    'MyWidget has a title and message',
    (WidgetTester tester) async {
      await tester.pumpWidget(MyWidget(title: 'T', message: 'M'));

      final titleFinder = find.text('T');
      final messageFinder = find.text('M');

      expect(titleFinder, findsOneWidget);
      expect(messageFinder, findsOneWidget);
    },
  );

  testWidgets(
    "finds a Text Widget",
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Text('H'),
          ),
        ),
      );

      expect(find.text('H'), findsOneWidget);
    },
  );

  testWidgets('finds a widget using a Key', (tester) async {
    const tesKey = Key('K');

    await tester.pumpWidget(MaterialApp(
      key: tesKey,
      home: Container(),
    ));

    expect(find.byKey(tesKey), findsOneWidget);
  });

  testWidgets('finds a specific instance', (tester) async {
    const childWidgets = Padding(padding: EdgeInsets.zero);

    await tester.pumpWidget(Container(
      child: childWidgets,
    ));

    expect(find.byWidget(childWidgets), findsOneWidget);
  });

  testWidgets("finds a deep item in a long list", (tester) async {
    await tester.pumpWidget(MyApp(
      items: List<String>.generate(10000, (i) => 'Item $i'),
    ));

    final listFinder = find.byType(Scrollable);
    final itemFinder = find.byKey(const ValueKey('item_50_text'));

    await tester.scrollUntilVisible(itemFinder, 500.0, scrollable: listFinder);

    expect(itemFinder, findsOneWidget);
  });

  testWidgets('Add and remove a todo', (tester) async {
    await tester.pumpWidget(const TodoList());

    await tester.enterText(find.byType(TextField), 'hi');

    await tester.tap(find.byType(FloatingActionButton));

    await tester.pump();

    expect(find.text('hi'), findsOneWidget);

    await tester.drag(find.byType(Dismissible), const Offset(500, 0));

    await tester.pumpAndSettle();

    expect(find.text('hi'), findsNothing);
  });
}

class MyWidget extends StatelessWidget {
  final String title;
  final String message;

  const MyWidget({super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(message),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  final List<String> items;

  const MyApp({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    const title = 'Long List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          key: const Key('long_list'),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                items[index],
                key: Key('item_${index}_text'),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _ToolListState();
}

class _ToolListState extends State<TodoList> {
  static const _appTitle = 'Todo List';
  final todos = <String>[];
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_appTitle),
        ),
        body: Column(
          children: [
            TextField(
              controller: controller,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];

                  return Dismissible(
                    key: Key('$todo$index'),
                    onDismissed: (direction) => todos.removeAt(index),
                    background: Container(color: Colors.red),
                    child: ListTile(
                      title: Text(todo),
                    ),
                  );
                },
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              todos.add(controller.text);
              controller.clear();
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
