import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:torch_light/torch_light.dart';
void main() {
  runApp(const FlashLight());
}

class FlashLight extends StatefulWidget {
  const FlashLight({Key? key}) : super(key: key);

  @override
  State<FlashLight> createState() => _FlashLightState();
}

class _FlashLightState extends State<FlashLight> {

  var IsActice= false;

  Future<void> torchlighton () async {
    try {
      await TorchLight.enableTorch();
    } on EnableTorchExistentUserException catch(e)
    {
      print("Camera in use");
    }
    on EnableTorchNotAvailableException catch(e)
    {
      print("Torch light Not Available");
    }
    on EnableTorchException catch(e)
    {
      print("something went wrong");
    }
  }
  Future<void> torchlightof () async {
    try {
      await TorchLight.disableTorch();
    }
    catch(e)
    {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flashlight',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff262a32),
        appBar: AppBar(
          title: Text('Flashlight Codsoft'),
           centerTitle: true,
           backgroundColor: Color(0xff171a1e),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Row(children: [
              SizedBox(
                width: 129,
              ),
              Container(
                height: 30,
                width: 100,
                color: Colors.black,
              ),

              Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(0xff262a32),
                    //borderRadius: BorderRadius.only(topRight: Radius.circular(22.0)),
                    border: Border(
                      top: BorderSide(width: 9.0, color: Colors.black),
                      right: BorderSide(width: 9.0, color: Colors.black),
                    ),
                  )),
              ]),

            Row(

              children :[

                SizedBox(
                  width: 135,

                ),
                Container(
                  width: 88,
                  height: 400,
                  color: IsActice ? Color(0xffffffbf) : Color(0xff262a32),
                  padding: EdgeInsets.only(

                    right: 20.0,
                    bottom: 30.0,
                    left: 40.0,
                  ),

                ),
                SizedBox(
                  width: 77,

                ),
              Container(
                color: Colors.black,
                width: 9,
                height: 400,
              ),
              ]
            ),
            Row(
              children: [
                SizedBox(
                  width: 252,
                ),
              Container(

                width: 100,
                height: 10,

    decoration: BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.horizontal(
    left: Radius.circular(70.0),
    right: Radius.circular(100.0),
              )
    ),
    ),
           ]
            ),

            SizedBox(
              height:75
            ),

            Row(
              children:[
                SizedBox(
                  width: 130,
                ),
                LiteRollingSwitch(
                colorOff: Colors.red,
                colorOn: Colors.greenAccent,
                iconOn: Icons.flash_on,
                iconOff: Icons.flash_off,
                textOff: "Torch off",
                textOn:  "Torch on",
                onChanged: (val){
                  print(val);
                  if (val){
                    IsActice = true;
                    torchlighton();
                  }
                  else{
                    IsActice =false;
                    torchlightof();
                  }
                  setState(() {

                  });
                },
                onDoubleTap:() {},
                onSwipe: (){},
                onTap: (){},
              ),
            ]),

          ],
        ),
      ),
    );
  }
}


