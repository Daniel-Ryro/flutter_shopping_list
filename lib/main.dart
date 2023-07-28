import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/apptheme.dart';
import 'package:flutter_shopping_list/route_generator.dart';
import 'package:flutter_shopping_list/routes_constants.dart';
import 'package:reactive_forms/reactive_forms.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
        validationMessages: {
          ValidationMessage.required: (error) => 'Field must not be empty',
        },
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          initialRoute: HOME,
          onGenerateRoute: Routegenerator.generateRoute,
        ));
  }
}
