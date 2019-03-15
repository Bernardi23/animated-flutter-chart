class Destination {
  final String name;
  final String description;
  final String url;
  int temperature;
  double rating;
  bool isSaved;

  Destination({
    this.name,
    this.description,
    this.url,
    this.temperature,
    this.rating,
    this.isSaved = false,
  });
}

class RecommendedData {
  static List<Destination> data = <Destination>[
    Destination(
      name: "Brazil",
      description: "Lorem ipsum.",
      url:
          "https://images.pexels.com/photos/1804177/pexels-photo-1804177.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
      temperature: 34,
      rating: 4.0,
    ),
    Destination(
      name: "Greece",
      description: "Quis autem.",
      url:
          "https://images.pexels.com/photos/1518500/pexels-photo-1518500.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
      temperature: 24,
      rating: 5.0,
    ),
    Destination(
      name: "Paris",
      description: "At vero.",
      url:
          "https://images.pexels.com/photos/1461974/pexels-photo-1461974.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
      temperature: 19,
      rating: 4.1,
    ),
    Destination(
      name: "Hong Kong",
      description: "At vero eos.",
      url:
          "https://images.pexels.com/photos/1738994/pexels-photo-1738994.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
      temperature: 23,
      rating: 4.5,
    ),
  ];
}

class DestinationsData {
  static List<Destination> data = <Destination>[
    Destination(
      name: "Tokyo",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamc.",
      url:
          "https://images.pexels.com/photos/1727627/pexels-photo-1727627.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
      temperature: 24,
      rating: 4.1,
    ),
    Destination(
      name: "Hawai",
      description:
          "Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat.",
      url:
          "https://images.pexels.com/photos/1151831/pexels-photo-1151831.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
      temperature: 26,
      rating: 4.9,
    ),
    Destination(
      name: "Iceland",
      description:
          "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi.",
      url:
          "https://images.pexels.com/photos/1009136/pexels-photo-1009136.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
      temperature: 17,
      rating: 4.7,
    ),
  ];
}
