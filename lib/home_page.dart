import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrabble_score_estimator/estimator_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _ScrabbleScoreHomeScreenState createState() =>
      _ScrabbleScoreHomeScreenState();
}

class _ScrabbleScoreHomeScreenState extends State<HomeScreen> {
  final String title = "BYTABO Scrabble";
  var score = 0;
  var shouldShowError = false;

  final textFieldController = TextEditingController();
  final estimatorService = EstimatorService();

  @override
  void initState() {
    super.initState();
    textFieldController.addListener(_changeListener);
  }

  @override
  void dispose() {
    textFieldController.dispose();
    super.dispose();
  }

  _changeListener() {
    var word = textFieldController.text;
    if (word.isNotEmpty) {
      if (estimatorService.isValidInput(word[word.length - 1])) {
        setState(() {
          score = estimatorService.calculateScore(word);
          shouldShowError = false;
        });
      } else {
        // invalid input
        setState(() {
          score = 0;
          shouldShowError = true;
        });
      }
    } else {
      // empty textfield -> reset score
      setState(() {
        score = 0;
        shouldShowError = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Your word score: " + score.toString()),
          SizedBox(height: 20),
          Container(
            padding: new EdgeInsets.only(left: 30, right: 30),
            child: _createTextfield(),
          ),
          SizedBox(height: 20),
          Visibility(
              visible: shouldShowError,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Invalid input.\n The word must contain uppercase letters only!",
                    style: TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ],
              ))
        ],
      ),
    );
  }

  TextField _createTextfield() {
    return TextField(
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.center,
        maxLines: 1,
        cursorColor: Colors.black,
        textCapitalization: TextCapitalization.characters,
        controller: textFieldController,
        style: TextStyle(
          fontSize: 18,
        ),
        decoration: InputDecoration(
          hintText: "Please enter your word here",
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                width: 1,
                color: Colors.purple,
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                width: 1,
                color: Colors.black,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 1, color: Colors.red)),
        ));
  }
}
