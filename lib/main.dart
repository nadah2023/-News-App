
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_6/controller/Cubit.dart';
import 'package:task_6/veiw/HomeScreen.dart';

void main() {
  // runApp(BlocProvider(
  //   create: (context)=>HomeCubit(),
  //   child:const MyApp(),
  // ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
 Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getnews(),
      child : const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      
      home:HomeScreen(),
      
      ),

    );
  }
}



  