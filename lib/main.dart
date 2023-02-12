import 'package:daily_query/query.dart';
import 'package:daily_query/state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'q_mngr/q_mngrscreen.dart';
import 'q_sess/q_sess_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // TODO: Make this fetch the questions from a db

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuestionListProvider()),
        ChangeNotifierProvider(create: (_) => QueryCompletionProvider()),
      ],
      child: MaterialApp(
        title: 'DailyQuery',
        theme: ThemeData(
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: Color.fromARGB(230, 255, 255, 242),
        ),
        routes: {
          "/questionmanager": (context) => const QueryManagerScreen(),
          "/querysession": (context) => QuerySessionScreen(
                query: Query(
                  questionList:
                      Provider.of<QuestionListProvider>(context).getQuestions(),
                ),
              ),
        },
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(child: MainScreenHeader()),
              Expanded(
                flex: 2,
                child: const SizedBox(),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RawMaterialButton(
                        child: Text(
                          'Take\nQuery',
                          softWrap: true,
                          style: GoogleFonts.rubikIso(
                              fontSize: 80.0,
                              fontWeight: FontWeight.w900,
                              height: 0.85),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, "/querysession");
                        },
                      ),
                      SizedBox(
                        height: 7.0,
                      ),
                      RawMaterialButton(
                        child: Text(
                          'Edit Questions',
                          style: GoogleFonts.rubikIso(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w900,
                              color: const Color.fromARGB(66, 138, 126, 126)),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, "/questionmanager");
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainScreenHeader extends StatelessWidget {
  MainScreenHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Data Collection System[DCS]",
            style: GoogleFonts.spaceGrotesk(
                fontWeight: FontWeight.w700, fontSize: 17.0),
          ),
          Text("v0.0.1", style: TextStyle(fontSize: 17)),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
