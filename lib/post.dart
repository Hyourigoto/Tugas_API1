import 'package:flutter/material.dart'; 
import 'http_service.dart'; 
import 'post_model.dart'; 

class PostsPage extends StatelessWidget { 
  final HttpService httpService = HttpService(); 

  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title: Text("Posts"), 
      ), 
      body: FutureBuilder( 
        future: httpService.getPosts(), 
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) { 
          if (snapshot.hasData && snapshot.data != null) { 
            List<Post> posts = snapshot.data!; 
            return ListView( 
              children: posts 
                  .map( 
                    (Post post) => Card( 
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8), 
                      elevation: 4, 
                      shape: RoundedRectangleBorder( 
                        borderRadius: BorderRadius.circular(12), 
                      ), 
                      child: ListTile( 
                        title: Text( 
                          post.title, 
                          style: TextStyle( 
                            fontWeight: FontWeight.bold, 
                            fontSize: 16, 
                          ), 
                        ), 
                        subtitle: Text("User ID: ${post.userId}"), 
                        leading: CircleAvatar( 
                          child: Text(post.userId.toString()), 
                          backgroundColor: Colors.blueAccent, 
                          foregroundColor: Colors.white, 
                        ), 
                        trailing: Icon(Icons.arrow_forward_ios, size: 16), 
                        onTap: () { 
                           
                          print("Tapped on ${post.title}"); 
                        }, 
                      ), 
                    ), 
                  ) 
                  .toList(), 
            ); 
          } else { 
            return Center(child: CircularProgressIndicator()); 
          } 
        }, 
      ), 
    ); 
  } 
}
