import 'package:digital_domi_assessment/bloc/get_documents/get_documents_bloc.dart';
import 'package:digital_domi_assessment/injection.dart';
import 'package:digital_domi_assessment/screens/map_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetDocumentsBloc>(
            create: (context) => getIt<GetDocumentsBloc>()
              ..add(const GetDocumentsEvent.getDocuments())),
      ],
      child: MaterialApp(
        title: 'Digital Domi Assessment',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        ),
        home: const HomeMapView(),
      ),
    );
  }
}
