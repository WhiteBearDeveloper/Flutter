class Screen {
  final String title;
  final String description;
  final String link;

  Screen({this.title, this.description, this.link});

  factory Screen.fromJson(Map<String, dynamic> json) {
    return new Screen(
      title: json['title'] as String,
      description: json['description'] as String,
      link: json['link'] as String,
    );
  }
}

// List<Map<String, String>> screenList = [
//   {
//     'title': 'Login',
//     'description': 'Screen with login form',
//     'link': '/login-screen'
//   }
// ];