import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'dart:convert';
import 'package:front_end_cop_mate/elements/heading.dart';
import 'package:front_end_cop_mate/elements/ReusableCard.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:front_end_cop_mate/bottomnavgationbar.dart';

class diabetes extends StatefulWidget {
  const diabetes({super.key});
  static const String id = 'diabetes';

  @override
  State<diabetes> createState() => _diabetesState();
}

class _diabetesState extends State<diabetes> {
  @override
  double age = 0;
  double pregnancies = 0;
  double glucose = 0;
  double BloodPressure = 0;
  double SkinThickness = 0;
  double Insulin = 0;
  double BMI = 0;
  double DiabetesPedigreeFunction = 0;
  bool showSpinner = false;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _buildage() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter age';
        }

        return null;
      },
      onSaved: (value) {
        if (value != null && value.isNotEmpty) {
          age = double.parse(value);
        }
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: "Age",
        icon: Icon(
          FontAwesomeIcons.child,
          color: Colors.black,
        ),
        hintText: "Age",
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }

  Widget _buildpregnancies() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter pregnancies';
        }

        return null;
      },
      onSaved: (value) {
        if (value != null && value.isNotEmpty) {
          pregnancies = double.parse(value);
        }
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: "pregnancies",
        icon: Icon(
          FontAwesomeIcons.baby,
          color: Colors.black,
        ),
        hintText: "pregnancies",
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }

  Widget _buildglucose() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter glucose';
        }

        return null;
      },
      onSaved: (value) {
        if (value != null && value.isNotEmpty) {
          glucose = double.parse(value);
        }
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: "glucose",
        icon: Icon(
          FontAwesomeIcons.candyCane,
          color: Colors.black,
        ),
        hintText: "glucose",
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }

  Widget _buildBloodPressure() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter Blood Pressure';
        }
        return null;
      },
      onSaved: (value) {
        if (value != null && value.isNotEmpty) {
          BloodPressure = double.parse(value);
        }
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: "Blood Pressure",
        icon: Icon(
          FontAwesomeIcons.ruler,
          color: Colors.black,
        ),
        hintText: "Blood Pressure",
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }

  Widget _buildSkinThickness() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter SkinThickness';
        }
        return null;
      },
      onSaved: (value) {
        if (value != null && value.isNotEmpty) {
          SkinThickness = double.parse(value);
        }
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: "SkinThickness",
        icon: Icon(
          FontAwesomeIcons.ruler,
          color: Colors.black,
        ),
        hintText: "SkinThickness",
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }

  Widget _buildInsulin() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter Insulin';
        }
        return null;
      },
      onSaved: (value) {
        if (value != null && value.isNotEmpty) {
          Insulin = double.parse(value);
        }
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: "Insulin",
        icon: Icon(
          FontAwesomeIcons.ruler,
          color: Colors.black,
        ),
        hintText: "Insulin",
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }

  Widget _buildBMI() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter BMI';
        }
        return null;
      },
      onSaved: (value) {
        if (value != null && value.isNotEmpty) {
          BMI = double.parse(value);
        }
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: "BMI",
        icon: Icon(
          FontAwesomeIcons.ruler,
          color: Colors.black,
        ),
        hintText: "BMI",
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }

  Widget _buildDiabetesPedigreeFunction() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter DiabetesPedigreeFunction';
        }
        return null;
      },
      onSaved: (value) {
        if (value != null && value.isNotEmpty) {
          DiabetesPedigreeFunction = double.parse(value);
        }
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: "DiabetesPedigreeFunction",
        icon: Icon(
          FontAwesomeIcons.ruler,
          color: Colors.black,
        ),
        hintText: "DiabetesPedigreeFunction",
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Diabetes Prediction'),
        backgroundColor: Color(0xFFAC6EBB),
      ),
      body: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFF8008CA),
                      Colors.white,
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    heading(
                        string: "Enter Parameters",
                        icon: FontAwesomeIcons.ruler,
                        space: 40),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(30),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: <Widget>[
                            _buildage(),
                            SizedBox(height: 20),
                            _buildpregnancies(),
                            SizedBox(height: 20),
                            _buildglucose(),
                            SizedBox(height: 20),
                            _buildBloodPressure(),
                            SizedBox(height: 20),
                            _buildSkinThickness(),
                            SizedBox(height: 20),
                            _buildInsulin(),
                            SizedBox(height: 20),
                            _buildBMI(),
                            SizedBox(height: 20),
                            _buildDiabetesPedigreeFunction(),
                            ElevatedButton(
                              onPressed: () async {
                                if (!_formkey.currentState!.validate()) {
                                  return;
                                }
                                _formkey.currentState!.save();

                                final response = await http.post(
                                  Uri.parse(
                                      'https://thamish-ml-based-patient-care.onrender.com/diabetes'),
                                  headers: <String, String>{
                                    'Content-Type':
                                        'application/json; charset=UTF-8',
                                  },
                                  body: jsonEncode(<String, double>{
                                    "Pregnancies": pregnancies,
                                    "Glucose": glucose,
                                    "BloodPressure": BloodPressure,
                                    "SkinThickness": SkinThickness,
                                    "Insulin": Insulin,
                                    "BMI": BMI,
                                    "DiabetesPedigreeFunction":
                                        DiabetesPedigreeFunction,
                                    "Age": age
                                  }),
                                );
                                print(response.statusCode);
                                if (response.statusCode == 200) {
                                  var prediction = jsonDecode(response.body);
                                  int predict =
                                      int.parse(prediction["prediction"]);
                                  var msg = "";
                                  if (predict == 1) {
                                    msg =
                                        "You have a high chance of having Diabetes";
                                  } else {
                                    msg =
                                        "You have a high chance of having Diabetes";
                                  }

                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible:
                                        false, // user must tap button!
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Diagnosis'),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: <Widget>[
                                              Text(msg),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('Okay'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible:
                                        false, // user must tap button!
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Unsuccessful'),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: const <Widget>[
                                              Text('Please try again!'),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('Okay'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                              child: Text("Predict",
                                  style: TextStyle(color: Colors.white)),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll<Color>(
                                          Color(0xFFAC6EBB)),
                                  minimumSize: MaterialStatePropertyAll<Size>(
                                      Size(100, 40))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
