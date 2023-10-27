import 'package:flutter/material.dart';
import 'package:movies/ui/HomeTap/movieWidget.dart';

class homeTap extends StatelessWidget {
  const homeTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Expanded(
          flex: 16,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                            height: 200,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage("assets/Image.png"),
                            ))),
                        const Center(
                          child: AnimatedCrossFade(
                            crossFadeState:CrossFadeState.showFirst,
                            duration: Duration(seconds: 1),
                            firstChild: Icon(
                              Icons.play_circle_outline,
                              size: 50,
                              color: Colors.white,
                            ),
                            secondChild: Icon(
                              Icons.pause_circle_outline,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right:56.0),
                    child: Text(
                      "Dora and the lost city of gold",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right:149.0),
                    child: Text(
                      "2019  PG-13  2h 7m",
                      style: TextStyle(fontSize: 10, color: Color(0xffB5B4B4),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left:12.0,top: 11),
                    child: Image(image: AssetImage("assets/Image1.png"),),
                  ),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark_add_rounded,
                    color: Colors.white,
                  size: 32,))

                ],
              ),


            ],
          ),
        ),
 SingleChildScrollView(
   child: Column(
     children: [],
   ),
 ),

 SizedBox(height: 8,),
        Expanded(
          flex: 9,
          child: Container(
            color: const Color(0xff282A28),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top:2.0,left: 16,bottom: 4),
                    child: Text('New Releases',style: TextStyle(fontSize: 15,color: Colors.white,
                        fontWeight: FontWeight.w400),),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                       return  Padding(
                         padding: EdgeInsets.only(bottom: 4.0,left: 4),
                         child: movieWidget(left: 0.0 , top:0.0 , right:8, bottom: 0,)
                       );
                      },
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                    ),

                  ),

                ],




              )

          ),
        ),
        const SizedBox(height: 12,),
        Expanded(
          flex: 13,
          child: Container(
              color: const Color(0xff282A28),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top:4.0,left: 20),
                    child: Text('Recommended',style: TextStyle(fontSize: 15,color: Colors.white,
                        fontWeight: FontWeight.w400),),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return  Padding(
                          padding: EdgeInsets.only(bottom: 2.0,),
                          child:Card(
                            color: Color(0xff282A28),
                              elevation: 12,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(child: movieWidget(left:0.0 , top:0.0 , right:0, bottom: 0,)),
                              Row(
                                children: [
                                  Icon(Icons.star,color:Theme.of(context).colorScheme.secondary,
                                  size: 16,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:2.0),
                                    child: Text('4.5',style: TextStyle(color: Colors.white),),
                                  )

                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:2.0),
                                child: Text('Deadpool 2',style: TextStyle(color: Colors.white),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:2.0),
                                child: Text('2018  R  1h 59m',style: TextStyle(color: Color(0xffB5B4B4)
                                ,fontWeight: FontWeight.w400,
                                  fontSize: 8,

                                ),),
                              ),
                            ],
                          )),
                        );
                      },
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                    ),

                  ),

                ],




              )

          ),
        ),
        const SizedBox(height: 16,),

      ]),
    );
  }
}
