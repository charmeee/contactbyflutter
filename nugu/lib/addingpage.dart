import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class addingpage extends StatefulWidget {
  addingpage({Key? key}) : super(key: key);

  @override
  State<addingpage> createState() => _addingpageState();
}

class _addingpageState extends State<addingpage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _phonenumController = new TextEditingController();
  TextEditingController _kakaotalkidController = new TextEditingController();


  @override void dispose() {
    _emailController.dispose();
    _phonenumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffB9CEEB),
        body:
        Column(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 100,
              width: 200,
              child:Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.white,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(30),

                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.blueGrey,
                    size: 50,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(

                      controller: _emailController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return '이름을 입력하세요.';
                        }
                        return null;
                        },
                      decoration:
                      InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xff87A8D0), width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: 'ex) 이름을 입력',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox( height: 16.0, ),
                    TextFormField(
                      controller: _phonenumController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return '전화번호를 입력하세요.';
                        } return null;},
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xff87A8D0), width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: 'ex) 전화번호를 입력',
                      ),
                      keyboardType: TextInputType.text, ),
                    SizedBox( height: 16.0, ),
                    TextFormField(
                      controller: _kakaotalkidController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return '카카오톡 id를 입력하세요.';
                        } return null;},
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xff87A8D0), width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: 'ex) 카카오톡 id를 입력',
                      ),
                      keyboardType: TextInputType.text, ),

                    Container(
                      margin: const EdgeInsets.only(top: 16.0),
                      alignment: Alignment.centerRight,
                      child: ElevatedButton( onPressed: () {if (_formKey.currentState!.validate()) {
                        Navigator.pop(context); } }, child: Text('로그인'), ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
    );

  }
}