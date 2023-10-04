import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/data/bloc/auth/auth_event.dart';
import 'package:shoppingapp/data/bloc/auth/auth_state.dart';

import '../data/bloc/auth/auth_bloc.dart';
class LoginPage extends StatefulWidget {
  final VoidCallback show;
  const LoginPage({super.key,required  this.show});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  final email = TextEditingController();
  final pass = TextEditingController();
  bool visible = true;
  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    pass.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: BlocBuilder<AuthBloc, Authsate>(builder: (context,state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                logo(),
                SizedBox(height:34),
                textfild(),
                SizedBox(height: 15),
                textfild2(),
                SizedBox(height: 8),
                have(),
                SizedBox(height: 20),
                signIN(),
                if(state is AuthStateLoading) ...{
                  CircularProgressIndicator()
                }
                else if (state is  LoginResponseState)...[
                  state.login.fold((left){
                    SchedulerBinding.instance.addPersistentFrameCallback((_) {
                      _dialogBuilder(context,left);
                    });
                    return Text('d');
                  },(right){
                    return Text(right);
                  }
                  )
                ],
                SizedBox(height:15),
                or(),
                SizedBox(height: 15),
                WithGoogle(),
                SizedBox(height:15),
                WithApple(),
              ],
            )
          );
        })
      )
    );
  }
  Padding WithGoogle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Image.asset(
              'assets/google.png',
              height: 30,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              'Continue with Google',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Icon(
              Icons.arrow_right,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Padding WithApple() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Icon(
                Icons.apple,
                color: Colors.black,
              )),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              'Continue with Apple',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Icon(
              Icons.arrow_right,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Padding logo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Image.asset('assets/nikee.png'),
    );
  }

  textfild() {
    return Padding(
      padding :const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          style: TextStyle(fontSize: 18, color : Colors.black),
          controller: email,
          focusNode: _focusNode1,
          decoration: InputDecoration(
            hintText: 'Email',
            prefixIcon: Icon(
              Icons.email,
              color: _focusNode1.hasFocus ? Colors.black : Colors.grey[600],
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color(0xffc5c5c5),
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 2,
                color: Colors.black,
              )
            )
        ),
        ),
      ),
    );
  }
  Padding textfild2(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          style: TextStyle(fontSize: 18 , color : Colors.black),
          controller: pass,
          focusNode: _focusNode2,
          obscureText: visible,
          obscuringCharacter: '*' ,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: (){
                setState(() {
                  visible = !visible;
                });
              },
              child: Icon(
                visible ? Icons.visibility_off :Icons.visibility,
                color: _focusNode2.hasFocus ? Colors.black : Colors.grey[300],
              )
            ),
            hintText: 'Password',
            prefixIcon: Icon(
              Icons.key,
              color: _focusNode2.hasFocus ? Colors.black : Colors.grey[600],

            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color(0xffc5c5c5),
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 2,
                color:Colors.black,
              )
            )
          ),
        )
      )
    );

  }

  Padding signIN() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: (){
          BlocProvider.of<AuthBloc>(context)
              .add(AuthRequest(pass.text,true,email.text,pass.text));
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color:Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            'Sign In',
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      )
    );
  }

   Row or() {
    return Row(
      children: [
        Expanded(
            child: Divider(
              thickness: 1.5,
              endIndent: 4,
              indent: 20,
            )),
        Text(
          "OR",
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        Expanded(
            child: Divider(
              thickness: 1.5,
              endIndent: 20,
              indent: 4,
            ))
      ],
    );
   }

  Padding have() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Don't have account?",
            style: TextStyle(color :Colors.grey[700], fontSize: 14),
          ),
          GestureDetector(
            onTap: widget.show,
            child: Text(
              "Sign Up",
              style: TextStyle(color:Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            )
          )
        ],
      ),
    );
  }
}

Future<void> _dialogBuilder(BuildContext context,String message) {
  return showDialog<void>(
      context: context,
      builder: (BuildContext conext){
        return AlertDialog(
          title: const Text(
            'Erro',
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),
          ),
          content: Text(message,style: TextStyle(fontSize: 17)),
          actions: <Widget>[
            TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Ok'),

                onPressed: () {
                  Navigator.of(context).pop();
                },
            ),
          ],
        );
      }
  );
}
