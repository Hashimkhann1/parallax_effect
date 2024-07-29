import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:parallax_scroll/utils/widgets/my_text.dart';

class SlidingCardView extends StatefulWidget {
  const SlidingCardView({super.key});

  @override
  State<SlidingCardView> createState() => _SlidingCardViewState();
}

class _SlidingCardViewState extends State<SlidingCardView> {

  late PageController pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.61,
      child: PageView.builder(
        clipBehavior: Clip.none,
        controller: pageController,
        itemCount: 4,
        itemBuilder: (context , index) {
          return AnimatedBuilder(animation: pageController, builder: (context , child) {
            double pageOffset = 0;
            if(pageController.position.haveDimensions){
              pageOffset = pageController.page! - index;
            }
            double guess = math.exp(-(math.pow((pageOffset.abs() - 0.5), 2) / 0.08));
            return Transform.translate(
                offset: Offset(-32 *guess * pageOffset.sign, 0),
              child: Container(
                clipBehavior: Clip.none,
                margin: EdgeInsets.only(left: 8 , right: 8 , bottom: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(8 , 20),
                      blurRadius: 24
                    )
                  ]
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                      child: Image.asset('images/image${index}.png',height: MediaQuery.of(context).size.height * 0.4,alignment: Alignment(-pageOffset.abs() , 0),fit: BoxFit.none,),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(title: "Card Title",fontSize: 20,),
                              Icon(CupertinoIcons.heart,color: Colors.redAccent,)
                            ],
                          ),
                          SizedBox(height: 8,),
                          MyText(title: "12K",color: Colors.grey,),
                          SizedBox(height: 8,),
                          // Spacer(),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: (){},
                                child: MyText(title: "Details",color: Colors.white,fontWeight: FontWeight.w600,),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepPurple,
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32)
                                    )
                                ),
                              ),
                              SizedBox(width: 8,),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          );
        },
      ),
    );
  }
}
