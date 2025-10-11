class Offers {
  final String imagePath;
  final String offerText;

  Offers({required this.imagePath, required this.offerText});
  static List<Offers> getOffers() {
    return [
      Offers(
        imagePath: 'assets/images/home_screen_cover.jpg',
        offerText: '20% OFF on your first purchase',
      ),
      Offers(
        imagePath: 'assets/images/home_screen_cover.jpg',
        offerText: '30% OFF on your second purchase',
      ),
      Offers(
        imagePath: 'assets/images/home_screen_cover.jpg',
        offerText: '40% OFF on your third purchase',
      ),
      Offers(
        imagePath: 'assets/images/home_screen_cover.jpg',
        offerText: '70% OFF on your fourth purchase',
      ),
    ];
  }
}
