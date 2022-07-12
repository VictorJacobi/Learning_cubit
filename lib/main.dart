import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class CubitLearn extends Cubit<String?> {
  CubitLearn() : super(null);
  void pickRandomName() {
    math.Random myRandom = math.Random();
    emit(names[myRandom.nextInt(names.length)]);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const CubitTest(),
    );
  }
}

const List<String> names = [
  'John',
  'Israel',
  'Jacobi',
  'God hand',
  'Emmanuel',
  'Perfection',
  'Grace',
  'Julius',
  'Victor',
];

class CubitTest extends StatefulWidget {
  const CubitTest({Key? key}) : super(key: key);

  @override
  State<CubitTest> createState() => _CubitTestState();
}

class _CubitTestState extends State<CubitTest> {
  late final CubitLearn myCubit;
  @override
  void initState() {
    // TODO: implement initState
    myCubit = CubitLearn();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    myCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder<String?>(
          stream: myCubit.stream,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.waiting:
                // TODO: Handle this case.
                return Center(child: CircularProgressIndicator(

                ));
              case ConnectionState.active:
                // TODO: Handle this case.
                break;
              case ConnectionState.done:
                // TODO: Handle this case.
              return SizedBox.shrink();
              default:
                return TextButton(onPressed: () {}, child: Text('Show text'));
            }
            return Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text('${snapshot.data}')),
                  TextButton(
                      onPressed: () {
                        myCubit.pickRandomName();
                      },
                      child: Text('Show text')),
                ],
              ),
            );
          }),
    );
  }
}
