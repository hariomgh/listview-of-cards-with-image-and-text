import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp()); // Wrap your app with MaterialApp
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListCardsScreen(),
    );
  }
}

class ListCardsScreen extends StatefulWidget {
  const ListCardsScreen({Key? key}) : super(key: key);

  @override
  _ListCardsScreenState createState() => _ListCardsScreenState();
}

class _ListCardsScreenState extends State<ListCardsScreen> {
  List<String> image = [
    'https://www.joonsquare.com/usermanage/image/business/axis-colleges-kanpur-nagar-13340/axis-colleges-kanpur-nagar-axis-colleges-004.jpg',
    'https://staticimg.amarujala.com/assets/images/2018/11/29/750x506/hbtu_1543491736.jpeg',
    'https://images.hindustantimes.com/img/2021/10/16/550x309/9d7d46f4-2aaa-11ec-a2ce-f0c64477ba97_1633967765802_1634357041739.jpg',
    'https://eng.ruralvoice.in/uploads/images/2021/10/image_750x_61796739ca660.jpg',
  ];
  List<String> title = [
    'AITM Kanpur - Axis Institute of Technology',
    'HBTU Kanpur - Harcourt Butler Technical',
    'IIT Kanpur - Indian Institute of Technology',
    'NSI Kanpur - National Sugar Institute',
  ];

  List<String> filteredImage = [];
  List<String> filteredTitle = [];

  @override
  void initState() {
    super.initState();
    // Initialize filteredImage and filteredTitle with the original data
    filteredImage = List.from(image);
    filteredTitle = List.from(title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFAB23D),
      ),
      body: Column(
        children: [

          Container(
            height: 50,
            child: Center(
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xffFAB23D)),
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 50,
                shadowColor: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    onChanged: (query) {
                      // Call a function to filter the list based on the query
                      filterList(query);
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      label: Center(
                        child: Text('Search Your Institute...'),
                      ),
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: SizedBox(
                    // width: 367,
                    child: Column(
                      children: [
                        Text(
                          ' 🎓 Welcome to the “Name”',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),

                        ),
                        SizedBox(height: 20,),
                        Text(
                          'Find the perfect college or school to shape your future. Happy exploring!',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Divider(
              color: Color(0xffFAB23D),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredImage.length,
              itemBuilder: (BuildContext context, int index) {
                return card(filteredImage[index], filteredTitle[index], context);
              },
            ),
          ),
        ],
      ),
    );
  }

  void filterList(String query) {
    setState(() {
      filteredImage = image
          .where((img) => img.toLowerCase().contains(query.toLowerCase()))
          .toList();
      filteredTitle = title
          .where((t) => t.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Widget card(String image, String title, BuildContext context) {
    return Card(
      color: Colors.yellow[50],
      elevation: 8.0,
      margin: EdgeInsets.all(4.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

      child: Container(
        width: 376,
        height: 186,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: const Color(0xFFF3F3F3),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 0.50,
            color: Colors.black.withOpacity(0.1),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              left: 245,
              top: 0,
              child: Image.network(
                image,
                height: MediaQuery.of(context).size.width * (3 / 4),
                // width: MediaQuery.of(context).size.width,
              ),
            ),
            Positioned(
              left: 8,
              top: 20,
              child: Container(
                width: 246,
                height: 70,
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 217,
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Inria Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 18,
              top: 88,
              child: Icon(Icons.location_on),
            ),
            Positioned(
              left: 41,
              top: 90,
              child: SizedBox(
                width: 166,
                height: 21,
                child: Text(
                  'Kanpur, Uttar Pradesh',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 191,
              top: 129,
              child: Container(
                width: 44,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFB9),
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 0.50,
                    color: Colors.black.withOpacity(0.1),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '♡',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 18,
              top: 136,
              child: Container(
                width: 141,
                height: 35,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFDBDBDB),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    width: 0.50,
                    color: Colors.black.withOpacity(0.1),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'View More',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 18,
              top: 100,
              child: SizedBox(
                // width: 66,
                // height: 19,
                child: Row(
                  children: [
                    Text(
                      'Ratings:',
                      style: TextStyle(
                        color: const Color(0xFF7C7C7C),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),


                    Transform.scale(
                      scale: 0.4,
                      child: RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        // itemPadding: EdgeInsets.symmetric(hori),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
