import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:nugu/qrscanpage.dart';
import 'package:nugu/viewwithdate.dart';
import 'package:nugu/settingpage.dart';
import 'package:nugu/qrcodepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


final firestore = FirebaseFirestore.instance;


class mainpage extends StatefulWidget {//위젯으로 짜집 기 하는형식으로 이루어져있음
  mainpage({Key? key,this.userEmail,this.uid}) : super(key: key);
  var userEmail;
  var uid;
  @override
  State<mainpage> createState() => _mainpage();
}

class _mainpage extends State<mainpage> {
  var friend = [];
  List<int> count = [0,0,0];
  var owner={
    "name":"",
    "phone_num":"",
    "kakaotalk_id":"",
    "email":"",
  };
  getData() async {
    var ownerresult = await firestore.collection(widget.uid.toString()).doc('user').get();
    setState(() {
      owner["name"]=ownerresult["name"];
      owner["phone_num"]=ownerresult["phone_num"];
      owner["kakaotalk_id"]=ownerresult["kakaotalk_id"];
    });
    //실시간반영
    await for (var snapshot in firestore.collection(widget.uid.toString()).doc('friendsdoc').collection('friendscollect').snapshots()) {
      for (var doc in snapshot.docs) {
        setState(() {
          friend.add({"name":doc['name'].toString(),"email":doc['email'],"number":doc['number'].toString()});
        });
      }
    }


  }



  var ownerlist;
  @override
  void initState(){
    super.initState();
    getData();
  }
  Widget build(BuildContext context) {
    setState(() {

      owner["email"]=widget.userEmail;
    });

    setState(() {
      ownerlist=[ owner["phone_num"],owner["kakaotalk_id"],owner["email"]];
    });


    if(owner["email"]!=""){
      return  Scaffold(
        backgroundColor: Color(0xffB9CEEB),
        endDrawer:Drawer(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppbarUI(),
        ),
        body:
        Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Stack(
                      alignment: Alignment.topRight,
                      children:  [
                        Container(
                          padding: EdgeInsets.fromLTRB(50, 20, 50, 10),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('img/basicperson.png'),
                            backgroundColor: Colors.white,
                          ),
                        ),
                        Image.asset('img/logo.png',height: 50,width:50,)
                      ],
                    ),
                  ),
                  Text(owner["name"]!)
                ],

              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                margin: EdgeInsets.fromLTRB(15, 0, 15,10),
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: <Widget>[
                      Container(
                        constraints: BoxConstraints.expand(height: 50),
                        child: TabBar(
                            labelColor:  Color(0xffB9CEEB),
                            unselectedLabelColor: Colors.white,
                            indicator: BoxDecoration(
                              color: Colors.white,
                            ),
                            tabs: const [
                              Tab(text: "Profile",),
                              Tab(text: "Friends"),
                            ]
                        ),
                      ),
                      Expanded(
                        child: TabBarView(children: [
                          Tabcontent(id:0,data:ownerlist),
                          Tabcontent(id:1,data:friend),
                        ]),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Bottom_bar(Owner:owner,uid: widget.uid),
      );
    }
    return Text("로딩중");


  }
}

class AppbarUI extends StatelessWidget {
  const AppbarUI({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>settingpage()));},icon:Icon(Icons.settings)),
      actions: [
        Builder(
            builder: (context) {
              return IconButton(onPressed: () => Scaffold.of(context).openEndDrawer(), icon: Icon(
                  Icons.notifications),);
            }
        )
      ],
      backgroundColor: Color(0xffB9CEEB),
      title: Transform.translate(
        offset: Offset(-16, 0),
        child: TextFormField(
          obscureText: false,
          decoration: InputDecoration(
            hintText: 'Search....',
            // border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
            filled: false,
            prefixIcon: Icon(Icons.search),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color:Color(0xFFFFFEEC)),
            ),
            focusedBorder:  UnderlineInputBorder(
              borderSide: BorderSide(color:Color(0xFFFFFEEC)),
            ),
          ),
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),
        ),
      ),
      centerTitle: false,
    );
  }
}

class Tabcontent extends StatelessWidget {
  Tabcontent({Key? key,this.id,this.data}) : super(key: key);
  var data;
  var id;
  var ownerIcon=[Icon(Icons.phone_android),Icon(Icons.message_rounded),Icon(Icons.email)];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10),top: Radius.zero),
      ),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: ListView.separated(
        itemCount: data.length,
        itemBuilder: (c,i){
          if(id==0){
            return ListTile(
              leading: ownerIcon[i],
              title: Text(data[i]),
            );
          }
          return ListTile(
              leading: Icon(Icons.person),
              title: Text(data[i]['name']),
              trailing: Icon(Icons.call)
          );
        },
        separatorBuilder: ( c,  i) => const Divider(
          color: Color(0xff87A8D0),
          thickness: 1,
        ),
      ),
    );
  }
}



class Bottom_bar extends StatelessWidget {
  Bottom_bar({Key? key,this.Owner,this.uid}) : super(key: key);
  var uid;
  var Owner;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
              children: [
                IconButton(
                    onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>qrcodepage(Owner:Owner)));},
                    icon: Icon(Icons.qr_code)),
                IconButton(
                    onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>qrscanpage(uid:uid)));},
                    icon: Icon(Icons.add)),
                IconButton(
                    onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>viewwithdate()));},
                    icon: Icon(Icons.date_range)),
              ],
            )
        )
    );
  }
}


