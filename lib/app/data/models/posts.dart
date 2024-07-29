import 'post.dart';

class Posts {
  final String name;
  final List<Post> _posts = [];

  Posts(this.name);

  void addPost(Post p) {
    _posts.add(p);
  }

  List<Post> getPostList() {
    return _posts;
  }
}
