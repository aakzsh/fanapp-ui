import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      title: "FanApp",
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final List<String> items = [
  //   'Item1',
  //   'Item2',
  //   'Item3',
  //   'Item4',
  // ];
  // String? selectedValue;

  String? gen, state, dist, city, edu, working, tim;
  final List<String> genItems = ["Male", "Female", "Others"];
  final List<String> stateItems = ["Maharashtra", "Uttar Pradesh", "Delhi"];
  final List<String> distItems = [
    "Mumbai",
    "Thane",
    "New Delhi",
    "Gautam Buddha Nagar",
    "Ghaziabad"
  ];
  final List<String> cityItems = ["Dwarka", "Kalyan", "Noida"];
  final List<String> eduItems = ["Graduate", "Postgraduate"];
  final List<String> workingItems = ["Yes", "No"];
  final List<String> timeItems = [
    "Just a fan - One hour a weak",
    "Hardcore - Anytime Anything"
  ];

  TextEditingController name = TextEditingController();
  TextEditingController pin = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController job = TextEditingController();
  TextEditingController time = TextEditingController();
  String selectedDate = "DD/MM/YY";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Profile"),
          automaticallyImplyLeading: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white60,
            ),
          ),
          backgroundColor: AppColors().accentclr,
        ),
        body: Container(
            width: double.infinity,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Subtitle(text: "Profile Details"),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                      child: Container(
                    height: 100,
                    width: 100,
                    // color: Colors.pink,
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://media.discordapp.net/attachments/873911460055642152/996374325869432874/Ellipse_6.png"),
                            radius: 50,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.all(5),
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.green,
                                )))
                      ],
                    ),
                  )),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Subtitle(text: "Sneha Sharma"),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FieldText(
                    text: "Name",
                  ),
                  CustomTextField(
                    control: name,
                    hint: "Enter Your Name Here",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FieldText(
                    text: "Gender",
                  ),
                  DropdownButton2(
                    underline: Divider(
                      color: Colors.black,
                      height: 2,
                    ),
                    hint: Text(
                      'Select Gender',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: genItems
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ))
                        .toList(),
                    value: gen,
                    onChanged: (value) {
                      setState(() {
                        gen = value as String;
                      });
                    },
                    buttonHeight: 40,
                    buttonWidth: double.maxFinite,
                    itemHeight: 40,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FieldText(
                    text: "DOB",
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    child: Opacity(
                        opacity: 0.7,
                        child: Text(
                          selectedDate,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime(2000),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2021),
                      ).then((value) => {
                            setState(() {
                              selectedDate = DateFormat('dd/MM/yyyy')
                                  .format(value!)
                                  .toString();
                            })
                          });
                    },
                  ),
                  Divider(
                    color: Colors.black,
                    height: 2,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FieldText(
                    text: "State",
                  ),
                  DropdownButton2(
                    underline: Divider(
                      color: Colors.black,
                      height: 2,
                    ),
                    hint: Text(
                      'Select State',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: stateItems
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ))
                        .toList(),
                    value: state,
                    onChanged: (value) {
                      setState(() {
                        state = value as String;
                      });
                    },
                    buttonHeight: 40,
                    buttonWidth: double.maxFinite,
                    itemHeight: 40,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FieldText(
                    text: "District",
                  ),
                  DropdownButton2(
                    underline: Divider(
                      color: Colors.black,
                      height: 2,
                    ),
                    hint: Text(
                      'Select District',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: distItems
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ))
                        .toList(),
                    value: dist,
                    onChanged: (value) {
                      setState(() {
                        dist = value as String;
                      });
                    },
                    buttonHeight: 40,
                    buttonWidth: double.maxFinite,
                    itemHeight: 40,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FieldText(
                    text: "City",
                  ),
                  DropdownButton2(
                    underline: Divider(
                      color: Colors.black,
                      height: 2,
                    ),
                    hint: Text(
                      'Select City',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: cityItems
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ))
                        .toList(),
                    value: city,
                    onChanged: (value) {
                      setState(() {
                        city = value as String;
                      });
                    },
                    buttonHeight: 40,
                    buttonWidth: double.maxFinite,
                    itemHeight: 40,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FieldText(
                    text: "Pincode",
                  ),
                  CustomTextField(
                    control: pin,
                    hint: "Enter Pincode Here",
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Subtitle(text: "Private Details"),
                  SizedBox(
                    height: 20,
                  ),
                  FieldText(
                    text: "Address",
                  ),
                  CustomTextField(
                    control: address,
                    hint: "Enter Address Here",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FieldText(
                    text: "Education",
                  ),
                  DropdownButton2(
                    underline: Divider(
                      color: Colors.black,
                      height: 2,
                    ),
                    hint: Text(
                      'Select Education',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: eduItems
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ))
                        .toList(),
                    value: edu,
                    onChanged: (value) {
                      setState(() {
                        edu = value as String;
                      });
                    },
                    buttonHeight: 40,
                    buttonWidth: double.maxFinite,
                    itemHeight: 40,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FieldText(
                    text: "Working",
                  ),
                  DropdownButton2(
                    underline: Divider(
                      color: Colors.black,
                      height: 2,
                    ),
                    hint: Text(
                      'Select Here',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: workingItems
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ))
                        .toList(),
                    value: working,
                    onChanged: (value) {
                      setState(() {
                        working = value as String;
                      });
                    },
                    buttonHeight: 40,
                    buttonWidth: double.maxFinite,
                    itemHeight: 40,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FieldText(
                    text: "Your Job",
                  ),
                  CustomTextField(
                    control: job,
                    hint: "Enter Here",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FieldText(
                    text:
                        "How much time would you like to spend for fan activities",
                  ),
                  DropdownButton2(
                    underline: Divider(
                      color: Colors.black,
                      height: 2,
                    ),
                    hint: Text(
                      'Select Here',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: timeItems
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ))
                        .toList(),
                    value: tim,
                    onChanged: (value) {
                      setState(() {
                        tim = value as String;
                      });
                    },
                    buttonHeight: 40,
                    buttonWidth: double.maxFinite,
                    itemHeight: 40,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  MaterialButton(
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                content: Container(
                                    height: 250,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 40),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.check,
                                            size: 100,
                                            color: AppColors().accentclr,
                                          ),
                                          Text(
                                            "Profile Updated Successfully",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors().accentclr),
                                          )
                                        ],
                                      ),
                                    )),
                              ));
                    },
                    height: 50,
                    minWidth: double.maxFinite,
                    color: AppColors().accentclr,
                  )
                ],
              ),
            )));
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController control;
  final String hint;
  const CustomTextField({
    Key? key,
    required this.control,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      // color
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusColor: Colors.black,
        hintStyle: TextStyle(fontWeight: FontWeight.bold),
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        hintText: hint,
      ),
    );
  }
}

class AppColors {
  final accentclr = Color.fromRGBO(191, 33, 50, 1);
}

class Subtitle extends StatelessWidget {
  final String text;
  const Subtitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: AppColors().accentclr),
    );
  }
}

class FieldText extends StatelessWidget {
  final String text;
  const FieldText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
    );
  }
}
