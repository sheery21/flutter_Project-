import 'package:flutter/material.dart';
import 'package:flutter_11_start/widgets/uihelper.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();
  final arrContent = [
    {
      "img":
          "https://images.unsplash.com/photo-1486365227551-f3f90034a57c?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YW5pbWFsfGVufDB8fDB8fHww",
    },
    {
      "img":
          'https://images.pexels.com/photos/326055/pexels-photo-326055.jpeg?cs=srgb&dl=pexels-pixabay-326055.jpg&fm=jpg',
    },
    {
      "img":
          'https://static.vecteezy.com/vite/assets/photo-masthead-375-BoK_p8LG.webp',
    },
    {
      "img":
          'https://i.pinimg.com/736x/2d/95/e5/2d95e5886fc4c65a6778b5fee94a7d59.jpg',
    },
    {
      "img":
          'https://images.pexels.com/photos/1054655/pexels-photo-1054655.jpeg?cs=srgb&dl=pexels-hsapir-1054655.jpg&fm=jpg',
    },
    {
      "img":
          "https://images.pexels.com/photos/3094799/pexels-photo-3094799.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    },
    {
      "img":
          'https://burst.shopifycdn.com/photos/person-stands-on-rocks-poking-out-of-the-ocean-shoreline.jpg?width=1000&format=pjpg&exif=0&iptc=0',
    },
    {
      "img":
          'https://t4.ftcdn.net/jpg/02/56/10/07/360_F_256100731_qNLp6MQ3FjYtA3Freu9epjhsAj2cwU9c.jpg',
    },
    {
      "img":
          'https://preview.redd.it/some-of-my-favourite-bird-images-from-the-last-12-months-v0-jkyypk1t5zre1.jpg?width=640&crop=smart&auto=webp&s=f558d943843a77e0338f198b3171e0c47e5ebe7d',
    },
    {
      "img":
          'https://plus.unsplash.com/premium_photo-1683910767532-3a25b821f7ae?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZnJlZSUyMGltYWdlc3xlbnwwfHwwfHx8MA%3D%3D',
    },
    {
      "img":
          "https://burst.shopifycdn.com/photos/cave-of-wonder-and-lights.jpg?width=1000&format=pjpg&exif=0&iptc=0",
    },
    {
      "img":
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0TTbUfyAAANbPkNeRdfx7c_iMXWhFPhw5Rg&s',
    },
    {
      "img":
          'https://i.pinimg.com/236x/9f/8a/04/9f8a04de9dc05da8123f530d29818472.jpg',
    },
    {
      "img":
          'https://static.vecteezy.com/system/resources/thumbnails/042/730/459/small/lion-danger-animal-wildlife-nature-forest-photo.jpg',
    },
    {
      "img":
          'https://cdn.imago-images.com/Images/header/hello-we-are-imago_03-2023.jpg',
    },
    {
      "img":
          'https://cdn.pixabay.com/photo/2018/08/04/11/30/draw-3583548_1280.png',
    },
    {
      "img":
          "https://media.istockphoto.com/id/1458215547/photo/brown-bear.jpg?s=612x612&w=0&k=20&c=MRQhtNC_-P0llLRwwA3wmbQL6iroSjUla1PmvvEWCZU=",
    },
    {
      "img":
          'https://images.unsplash.com/photo-1626808642875-0aa545482dfb?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZnJlZSUyMGltYWdlc3xlbnwwfHwwfHx8MA%3D%3D',
    },
    {
      "img":
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCf6lkVPXx_i5XxO0TX7SmXQXoeKottPpK8Q&s',
    },
    {
      "img":
          'https://cdn.pixabay.com/photo/2016/04/05/11/04/india-1309206_1280.jpg',
    },
    {
      "img":
          'https://static.vecteezy.com/system/resources/thumbnails/057/068/323/small/single-fresh-red-strawberry-on-table-green-background-food-fruit-sweet-macro-juicy-plant-image-photo.jpg',
    },
    {
      "img":
          "https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg?cs=srgb&dl=pexels-chevanon-1108099.jpg&fm=jpg",
    },
    {
      "img":
          'https://cdn.pixabay.com/photo/2023/09/21/14/17/italy-8266783_1280.jpg',
    },
    {
      "img":
          'https://images.ctfassets.net/hrltx12pl8hq/4f6DfV5DbqaQUSw0uo0mWi/6fbcf889bdef65c5b92ffee86b13fc44/shutterstock_376532611.jpg?fit=fill&w=600&h=400',
    },
    {
      "img":
          'https://img.freepik.com/free-photo/wet-sphere-reflective-water-abstract-beauty-generated-by-ai_188544-19616.jpg?semt=ais_hybrid&w=740&q=80',
    },
    {
      "img":
          'https://imageio.forbes.com/specials-images/imageserve/5faad4255239c9448d6c7bcd/Best-Animal-Photos-Contest--Close-Up-Of-baby-monkey/960x0.jpg?format=jpg&width=960',
    },
    {
      "img":
          "https://plus.unsplash.com/premium_photo-1724654643848-ab19f6ec1c79?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZG9scGhpbnxlbnwwfHwwfHx8MA%3D%3D",
    },{
      "img":
          'https://www.nasa.gov/wp-content/uploads/2023/06/jwst-flickr-52259221868-30e1c78f0c-4k.jpg?w=2048',
    },
    {
      "img":
          "https://cdn.pixabay.com/photo/2022/04/15/07/58/sunset-7133867_640.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 327,
                      decoration: BoxDecoration(
                        color: Color(0xFF262626),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 10,
                            ),
                            child: Icon(
                              Icons.search,
                              color: Color(0XFF8E8E93),
                              size: 16,
                            ),
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    UiHelper.CustomImage(imgUrl: 'Shape4.png'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width ,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 75,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.grey.shade700),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            UiHelper.CustomImage(imgUrl: 'Shape6.png'),
                            SizedBox(width: 10.0),
                            Text(
                              'IGTV',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 77,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.grey.shade700),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_bag,
                              color: Colors.white,
                              size: 16,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              'Shop',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 65,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.grey.shade700),
                        ),
                        child: Center(
                          child: Text(
                            'Style',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 75,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.grey.shade700),
                        ),
                        child: Center(
                          child: Text(
                            'Sports',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 58,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.grey.shade700),
                        ),
                        child: Center(
                          child: Text(
                            'Auto',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: MasonryGridView.count(
                padding: EdgeInsets.zero,
                crossAxisCount: 3,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                itemCount: arrContent.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: Image.network(
                      arrContent[index]['img'].toString(),
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
