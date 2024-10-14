import 'package:api_handle/news_list_screen.dart';
import 'package:api_handle/view_model_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  List<int> number = [1, 2, 3, 4, 5];

  for (int index = 0; index < number.length; index++) {
    print(index);
    print(number);
    int num = number[index];
    print(num);
    print(num * num);
  }
  runApp(
    MultiProvider(
      providers: [
        // ChangeNotifierProvider(
        //   create: (context) => ListMapProvider(),
        // ),
        // ChangeNotifierProvider(
        //   create: (context) => ConterProvider(),
        // ),
        // ChangeNotifierProvider(
        //   create: (context) => ProviderTheme(),
        // ),
        ChangeNotifierProvider(
          create: (context) => NewsViewModelProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
       
           
        darkTheme: ThemeData.dark(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: NewsScreenList());
  }
}
