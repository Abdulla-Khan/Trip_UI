class Trip {
  final image;
  final title;
  final description;
  final number;

  Trip(this.image, this.title, this.description, this.number);
  static List<Trip> list = [
    Trip(
        'assets/images/one.jpg',
        'Yosemite National Park',
        "Yosemite National Park is in California’s Sierra Nevada mountains. It’s famed for its giant, ancient sequoia trees, and for Tunnel View, the iconic vista of towering Bridalveil Fall and the granite cliffs of El Capitan and Half Dome.",
        '1'),
    Trip(
        'assets/images/two.jpg',
        "Golden Gate Bridge",
        "The golden bridge is suspension bridge spaning the golden gate, the one-mile-wide strait connecting San Francisco Bay and Pacific Ocean",
        '2'),
    Trip(
        'assets/images/three.jpg',
        "Sedona",
        "Sedona is describes as America's one the most beutiful places. Nowhere else you'll find a landscape as dramatically colorful",
        '3'),
    Trip(
        'assets/images/four.jpg',
        "Savannah",
        'Savannah, with its Spanish moss, Southern accents and creepy graveyards, is a lot like Charleston, South Carolina. But this city about 100 miles to the south has an eccentric streak.',
        '4'),
  ];
}
