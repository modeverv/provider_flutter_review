import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// https://pub.dev/packages/provider/example

/// use provider
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataClass()),
        ChangeNotifierProvider(create: (_) => PataClass()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Text(context.watch<DataClass>().value),
                Text(context.watch<PataClass>().value),
                TextField(
                  onChanged: (value) {
                    context.read<DataClass>().setValue(value);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DataClass with ChangeNotifier {
  String _value = '';
  String get value {
    return _value;
  }

  void setValue(String val) {
    _value = val;
    notifyListeners();
  }
}

class PataClass with ChangeNotifier {
  String _value = 'pataclass';
  String get value {
    return _value;
  }

  void setValue(String val) {
    _value = val;
    notifyListeners();
  }
}
