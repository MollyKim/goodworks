import 'package:flutter/material.dart';
import 'package:practice/layouts/default_layout.dart';
import 'package:animate_do/animate_do.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{
  late AnimationController _controller ;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration:const Duration(seconds: 2),
    );
    _animation =CurvedAnimation( parent: _controller, curve: Curves.easeIn, );
    _animation.addListener(() {setState(() {});});
  }


  @override
  Widget build(BuildContext context) {

    ScrollController scrollController = ScrollController();

    return DefaultLayout(
      body: Column(
        children: [
          Container(),
          // renderHeader(scrollController),
          // renderTap(),
          // renderBody(_animation),
        ],
      ),
    );
  }

  renderHeader(ScrollController scrollController){

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [

      ],
    );
  }

  renderTap(){
    return Container(
      height: 50,
      color: Colors.purple,
    );
  }

  renderBody( Animation<double> _animation ){
    ScrollController scrollController = ScrollController();

    return NotificationListener(
      onNotification: (notification){
        if (notification is ScrollStartNotification) {print(scrollController.position.pixels);
          // if(notification.dragDetails!.localPosition.dy <scrollController.position.pixels.)
          // _controller.forward();
          //
          // _controller.reverse();

        }else if(notification is ScrollUpdateNotification){

        }
        else if(notification is ScrollEndNotification){
          _controller.stop();
        }
        return true;
        },
      child: Expanded(
        child: ListView.builder(
          controller: scrollController,
          itemCount: 100,
          itemBuilder: (context, index) {
            return Text('df');
        }),
      ),
    );
      // return Expanded(
      //   child: SingleChildScrollView(
      //     controller: scrollController,
      //     child: Container(
      //       height: 1000,
      //     ),
      //   ),
      // );
  }
}
