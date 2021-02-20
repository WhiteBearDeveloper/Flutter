import 'dart:convert';

class ScreenItem {
  final String title;
  final String description;
  final String link;

  ScreenItem({this.title, this.description, this.link});

  factory ScreenItem.fromJson(Map<String, dynamic> json) {
    return new ScreenItem(
      title: json['title'] as String,
      description: json['description'] as String,
      link: json['link'] as String,
    );
  }
}

List<ScreenItem> parseScreenItemJson(String response) {
  if(response==null){
    return [];
  }
  final parsed = json.decode(response.toString()).cast<Map<String, dynamic>>();
  return parsed.map<ScreenItem>((json) => new ScreenItem.fromJson(json)).toList();
}