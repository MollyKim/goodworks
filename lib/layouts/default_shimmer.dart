import 'package:flutter/material.dart';

class DefaultShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0,left: 15,right: 15),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff2d9067),
                    border: Border.all(
                        color: Colors.transparent,
                        width: 3.0),
                    borderRadius: BorderRadius.all(
                        Radius.circular(5.0)),
                  ),
                  height: 30,
                  width: 77,
                ),
                Container(
                  width: 100,height: 25,
                  decoration: BoxDecoration(
                    color: Color(0xff2d9067),
                    border: Border.all(
                        color: Colors.transparent,
                        width: 3.0),
                    borderRadius: BorderRadius.all(
                        Radius.circular(5.0)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Container(
              width: 100,height: 25,
              decoration: BoxDecoration(
                color: Color(0xff2d9067),
                border: Border.all(
                    color: Colors.transparent,
                    width: 3.0),
                borderRadius: BorderRadius.all(
                    Radius.circular(5.0)),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 25,
              decoration: BoxDecoration(
                color: Color(0xff2d9067),
                border: Border.all(
                    color: Colors.transparent,
                    width: 3.0),
                borderRadius: BorderRadius.all(
                    Radius.circular(5.0)),
              ),
            ),

            SizedBox(height: 10,),
            GridView.builder(
                primary: false,
                itemCount: 3,
                padding: EdgeInsets.all(0),
                semanticChildCount: 1,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 150,
                    crossAxisCount: listOfUrls.length > 3 ? 3 : listOfUrls.length,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 5),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(height: 100.0,
                    decoration: BoxDecoration(
                      color: Color(0xff2d9067),
                      border: Border.all(
                          color: Colors.transparent,
                          width: 3.0),
                      borderRadius: BorderRadius.all(
                          Radius.circular(5.0)),
                    ),
                  );
                }),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
List<String> listOfUrls= [
  "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
  "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",
  "https://isha.sadhguru.org/blog/wp-content/uploads/2016/05/natures-temples.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/7/77/Big_Nature_%28155420955%29.jpeg",
  "https://s23574.pcdn.co/wp-content/uploads/Singular-1140x703.jpg",
];