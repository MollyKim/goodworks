import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed("/home_post_detail");
      },
      child: Padding(
        padding: const EdgeInsets.only(top:8.0,left: 15,right: 15),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text("교회 소식",style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  Text("2 시간 전")
                ],
              ),
              SizedBox(height: 10,),
              Text("10.03 주보 제목",
                style: TextStyle(
                    fontFamily: "AppleSDGothicNeo",
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10,),
              Text("게시글 본문 표시되는 곳 \n최대 다섯줄 까지 적용",
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "AppleSDGothicNeo",
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 10,),
              GridView.builder(
                  primary: false,
                  itemCount: listOfUrls.length > 3 ? 3 : listOfUrls.length,
                  padding: EdgeInsets.all(0),
                  semanticChildCount: 1,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 150,
                      crossAxisCount: listOfUrls.length > 3 ? 3 : listOfUrls.length,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 5),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: listOfUrls.length> 3 && index == 2
                          ? Stack(
                          alignment: AlignmentDirectional.center,
                          fit: StackFit.expand,
                          children: <Widget>[
                            CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: listOfUrls[index],
                              height: 100.0,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                            Container(
                              color: Colors.black.withOpacity(.7),
                              child: Center(
                                child: Text(
                                  "+${listOfUrls.length - index}",
                                  style: TextStyle(color: Colors.white, fontSize: 40),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: listOfUrls[index],
                            height: 100.0,
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                        ),
                    );
                  }),
            ],
          ),
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