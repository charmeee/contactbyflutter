import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class  qrcodepage extends StatelessWidget {
  qrcodepage({Key? key,this.Owner}) : super(key: key);
  var Owner;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffB9CEEB),
      body: Center(
        child: SizedBox(
          height: 500,
          width: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("My QRcode",style: TextStyle(fontWeight:FontWeight.w500,fontSize: 20),),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                height: 200,
                width: 200,
                child: Center(child: QrImage(data: Owner.toString(),)),
              ),
              ElevatedButton(
                  onPressed: (){ Navigator.of(context).pop();},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.indigo,
                  ),
                  child: Text("홈으로 가기")
              )
            ],
          ),
        ),
      ),
    );
  }
}