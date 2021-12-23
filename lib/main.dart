import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itg_demo/home_page.dart';
import 'package:itg_demo/provider/bloc/itg_bloc.dart';
import 'package:itg_demo/provider/repository/itg_repository.dart';
import 'package:itg_demo/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ITG Demo App',
      home: BlocProvider(
          create: (_) =>
              ITGBolc(itgRepository: ITGRepository(baseURL: kBaseURL)),
          child: HomePage()),
    );
  }
}
