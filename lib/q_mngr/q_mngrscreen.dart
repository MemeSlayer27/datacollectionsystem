import 'package:daily_query/q_mngr/dialogs.dart';
import 'package:daily_query/q_mngr/q_list.dart';
import 'package:daily_query/query.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../state.dart';
import 'package:provider/provider.dart';

class QueryManagerScreen extends StatelessWidget {
  const QueryManagerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100.0,
        leading: RawMaterialButton(
          // TODO: Make this prettier
          onPressed: () => Navigator.pop(context),
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            "<-",
            style: GoogleFonts.rubikIso(
                fontWeight: FontWeight.bold,
                fontSize: 35.0,
                color: Colors.black,
                letterSpacing: 0.1),
          ),
        ),
        actions: [
          RawMaterialButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const NewQuestionDialog();
                  });
            },
            child: Text(
              "+",
              style: GoogleFonts.rubikIso(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 4, 4)),
            ),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 10.0,
        title: Text(
          "Q's",
          style: GoogleFonts.rubikIso(
              fontSize: 60.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: const QuestionList(),
    );
  }
}
