import 'package:flutter/material.dart';
import 'package:introiu/pages/home_page.dart';
import 'package:introiu/utils/string.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);
  static final String id = 'intro_page';

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController _pageController = new PageController();
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(
      initialPage: 0
    );
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page){
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              makePage(
                image: Strings.stepOneImage,
                title: Strings.stepOneTitle,
                content: Strings.stepOneContent
              ),
              makePage(
                  image: Strings.stepTwoImage,
                  title: Strings.stepTwoTitle,
                  content: Strings.stepTwoContent
              ),
              makePage(
                  image: Strings.stepThreeImage,
                  title: Strings.stepThreeTitle,
                  content: Strings.stepThreeContent
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: _buildIndicator(),
            ),
          ),
          _showSkip(),
        ],
      ),
    );
  }
  Widget makePage({image, title, content}){
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(color: Colors.deepOrange, fontSize: 38, fontWeight: FontWeight.bold),),
          SizedBox(height: 30,),
          Container(
            // padding: EdgeInsets.only(right: 50, left: 50),
            child: Text(content, style: TextStyle(color: Colors.grey, fontSize: 25,),textAlign: TextAlign.center,),
          ),
          Container(
            padding: EdgeInsets.all(40),
            child: Image.asset(image),
          )
        ],
      ),
    );
  }

  Widget _indicator(bool isActive){
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30:6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.circular(5)
      ),
    );
  }

  List<Widget> _buildIndicator(){
    List<Widget> indicator = [];
    for(int i=0; i<3; i++){
      if(currentIndex==i){
        indicator.add(_indicator(true));
      }else{
        indicator.add(_indicator(false));
      }
    }
    return indicator;
  }

  Widget _showSkip(){
    if(currentIndex==2){
      return Container(
        margin: EdgeInsets.only(bottom: 100),
        child: GestureDetector(
          onTap: (){
            Navigator.pushReplacementNamed(context, HomePage.id);
          },
          child: Text('Skip', style: TextStyle(color: Colors.deepOrange, fontSize: 18),),
        ),
      );
    }else{
      return Container(

      );
    }
  }
}
