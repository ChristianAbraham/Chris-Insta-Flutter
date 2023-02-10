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
              name: faker.person.firstName(),
              city: faker.address.city(),
            ),
            ImgContainer(imageURL: "https://picsum.photos/id/26/1200/900"),
            PostButton(),
            LikedBy(faker: faker),
            //Caption container
            CaptionContainer(),
            Divider(color: Colors.grey,),
            ImageHeader(
              profileURL: "https://picsum.photos/id/77/200",
              name: faker.person.firstName(),
              city: faker.address.city(),
            ),
            ImgContainer(imageURL: "https://picsum.photos/id/22/1200/900",),
            PostButton(),
            LikedBy(faker: faker),
            //Caption container
            CaptionContainer(),
            Divider(color: Colors.grey,),
            ImageHeader(
              profileURL: "https://picsum.photos/id/33/200",
              name: faker.person.firstName(),
              city: faker.address.city(),
            ),
            ImgContainer(imageURL: "https://picsum.photos/id/200/1200/900",),
            PostButton(),
            LikedBy(faker: faker),
            //Caption container
            CaptionContainer(),
            Divider(color: Colors.grey,),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined),
              label: 'Likes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

class CaptionContainer extends StatelessWidget {
  const CaptionContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 0, 5),
      child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
      ,style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w700, ),overflow: TextOverflow.ellipsis, maxLines: 3,  ),
    );
  }
}

class LikedBy extends StatelessWidget {
  const LikedBy({
    super.key,
    required this.faker,
  });

  final Faker faker;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Text('Liked by ${faker.person.firstName()} and ${faker.person.firstName()} others', style: TextStyle( fontFamily: 'Montserrat', fontWeight: FontWeight.w800),),
    );
  }
}

class PostButton extends StatefulWidget {
  const PostButton({
    super.key,
  });

  @override
  State<PostButton> createState() => _PostButtonState();
}

class _PostButtonState extends State<PostButton> {
  bool LikePressed = false;
  bool SavePressed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(onPressed: () {
            setState(() {
              LikePressed = !LikePressed;
            });
          }, icon: Icon(LikePressed ? Icons.favorite : Icons.favorite_border_outlined, color: LikePressed ? Colors.red : Colors.grey, size: 28,),padding: EdgeInsets.all(10.0),),
    
          IconButton(onPressed: () {}, icon: Icon(Icons.chat_bubble_outline, color: Colors.grey, size: 25,),padding: EdgeInsets.all(10.0)),
    
          IconButton(onPressed: () {
            setState(() {
              SavePressed = !SavePressed;
            });
          }, icon: Icon(SavePressed ? Icons.bookmark : Icons.bookmark_outline, color: SavePressed ? Colors.green : Colors.grey, size: 28,),padding: EdgeInsets.all(10.0),)
        ],
      ),
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
      trailing: OutlinedButton(
        onPressed: () {
        },
        child: Text('Follow', style: TextStyle(color: Colors.black, fontFamily: 'Montserrat', fontWeight: FontWeight.w800),),
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          side: BorderSide(color: Colors.grey, width: 1.5)
        ),
      )
    );
  }
}
