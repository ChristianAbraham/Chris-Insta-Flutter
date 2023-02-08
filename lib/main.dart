import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Color> myColor = [Colors.grey, Colors.blue, Colors.yellow, Colors.green, Colors.amberAccent, Colors.blueAccent];

  @override
  Widget build(BuildContext context) {
    var faker = Faker();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Image.asset(
                 'images/icon.png',
                  fit: BoxFit.contain,
                  height: 26,
              ),
              Container(
                  padding: const EdgeInsets.all(8.0), child: Text('Christian Instagram', style: TextStyle(fontFamily: 'Pacifico', color: Colors.black),))
            ],
          ),
        ),
        body: ListView(
          children: [
            ImageHeader(
              profileURL: "https://picsum.photos/id/99/200",
              name: faker.person.name(),
              city: faker.address.city(),
            ),
            ImgContainer(imageURL: "https://picsum.photos/id/26/400/300"),
            PostButton(),
            Divider(color: Colors.grey,),
            ImageHeader(
              profileURL: "https://picsum.photos/id/77/200",
              name: faker.person.name(),
              city: faker.address.city(),
            ),
            ImgContainer(imageURL: "https://picsum.photos/id/22/400/300",),
            PostButton(),
            Divider(color: Colors.grey,),
            ImageHeader(
              profileURL: "https://picsum.photos/id/33/200",
              name: faker.person.name(),
              city: faker.address.city(),
            ),
            ImgContainer(imageURL: "https://picsum.photos/id/200/400/300",),
            PostButton(),
            Divider(color: Colors.grey,),
          ],
        ),
      ),
    );
  }
}

class PostButton extends StatelessWidget {
  const PostButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        OutlinedButton(onPressed: () {}, child: Icon(Icons.favorite_border_outlined, color: Colors.pink, size: 35,), style: OutlinedButton.styleFrom(backgroundColor: Colors.white, elevation: 0, ),),
        OutlinedButton(onPressed: () {}, child: Icon(Icons.chat_bubble_outline_outlined, color: Colors.blue, size: 30),style: OutlinedButton.styleFrom(backgroundColor: Colors.white, elevation: 0, ),),
        OutlinedButton(onPressed: () {}, child: Icon(Icons.bookmark_outline, color: Colors.green, size: 35),style: OutlinedButton.styleFrom(backgroundColor: Colors.white, elevation: 0, ),),
      ],
    );
  }
}

class ImgContainer extends StatelessWidget {
  final String imageURL;

  ImgContainer({
    required this.imageURL
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 300,
      child: Image(
        image: NetworkImage(imageURL), fit: BoxFit.cover,
      ),
    );
  }
}

class ImageHeader extends StatelessWidget {
  final String profileURL;
  final String name;
  final String city;

  ImageHeader({
    required this.profileURL, required this.name, required this.city
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name, style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w800),),
      subtitle: Text(city),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(profileURL),
      ),
    );
  }
}
