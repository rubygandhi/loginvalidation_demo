
import 'package:flutter/material.dart';
import  'package:form_field_validator/form_field_validator.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState>FormKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Login Form"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: FormKey,
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                  width: 80,
                  child: Image.asset("assets/images/FlutterIcon.png")),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  validator: MultiValidator([
                    RequiredValidator(errorText: "valid email required"),
                    EmailValidator(errorText: "valid email id required"),
               ])
              /*(value){
                    if(value.isEmpty){
                      return "Enter valid Email Id";
                } else {
                      return null;
                }*/

    ,

                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email",
                      hintText: "eg.abc@gmail.com"),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(

                  validator: MultiValidator([
                    RequiredValidator(errorText: "**Input required"),
                    MinLengthValidator(6, errorText: "minimum 6 character long"),
                    MaxLengthValidator(15, errorText: "not more than 15 character long")
                  ])
                  /* (value){
                    if (value.isEmpty){
                      return "minimum 8 character required";
                    } else if(value .length< 6){
                      return "Password minimum 6 character long";
                    } else if(value.length>15){
                      return "Password should be less than 15 character";
                    }else
                      return null;
                  },*/

                  ,obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password",
                      hintText: "min 6 character long"),


                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 50,
                width: 150,
                color: Colors.blue,
                child: FlatButton(
                  onPressed: () {
                    if (FormKey.currentState.validate()){
                      print("valid Input");
                    }else {
                      print("invalid inputs");
                    }

                  },
                  child: Text("Login",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                  ),),


                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
