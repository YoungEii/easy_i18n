import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'localization/i18n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFirstLocale = true;

  void onPressed() {
    isFirstLocale = !isFirstLocale;
    context.setLocale(isFirstLocale ? EasyLocalization.of(context)!.supportedLocales[0] : EasyLocalization.of(context)!.supportedLocales[1]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy Localization'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(flex: 1),
            Text(
              I18n.supportedLanguage.tr(args: [I18n.supportedLocales.length.toString()]),
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(flex: 1),
            Text(
              I18n.title,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(I18n.clicked).plural(10),
            const Spacer(flex: 1),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => onPressed(),
        child: const Icon(
          Icons.refresh,
        ),
      ),
    );
  }
}
