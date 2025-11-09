// import 'package:flutter/material.dart';
import '../core/packages_manager/ui_imports.dart' show Color, Colors;

class Product {
  final int id;
  String name;
  String imagePath;
  double price;
  String? note;
  String? description;
  bool? isFavorite;
  Color? circleColor;
  double? rating;
  int categoryID;
  String? currency;
  int? quantity;

  Product({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.price,
    this.note,
    this.description,
    this.isFavorite = false,
    this.circleColor,
    this.rating,
    required this.categoryID,
    this.currency = "USA",
    this.quantity = 0,
  });

  ///Mapping to all products data model
  Map<String, dynamic> get toMap => {
    'id': id,
    'name': name,
    'imagePath': imagePath,
    'price': price,
    'currency': currency,
    'description': description,
    'isFavorite': isFavorite,
    'circleColor': circleColor ?? Colors.white,
  };
}

class Products {
  static List<Product> getProducts() {
    return [
      Product(
        id: 1,
        name: 'Fresh Peach',
        imagePath: 'assets/images/peach.png',
        price: 8.00,
        categoryID: 2,
        note: 'dozen',
        description:
            'A fresh peach is a juicy, fragrant fruit known for its soft, velvety skin and sweet, slightly tangy flavor. Its outer color ranges from golden yellow to warm orange with a blush of red, while the inside reveals a tender, golden flesh that drips with nectar when perfectly ripe. The taste is a delightful balance of honey-like sweetness and gentle acidity, offering a refreshing burst of summer in every bite. Its aroma is floral and inviting, often reminiscent of sunshine and orchards. Whether eaten on its own, sliced into a salad, or baked into a dessert, a fresh peach captures the essence of natural sweetness and freshness.',
        circleColor: const Color(0xffFFF0E5),
        isFavorite: true,
        rating: 5.0,
      ),
      Product(
        id: 2,
        name: 'Avocado',
        imagePath: 'assets/images/avocado.png',
        price: 7.00,
        categoryID: 1,
        note: '2.0 lbs',
        description:
            'An avocado is a creamy, rich fruit prized for its smooth texture and subtle, nutty flavor. Its outer skin is usually dark green or almost black, with a slightly bumpy or leathery surface that protects the soft, buttery flesh inside. When perfectly ripe, the flesh is pale green near the skin, fading to a soft yellow near the large, round pit at its center. The taste is mild and earthy, with a luxurious mouthfeel that makes it a favorite for both sweet and savory dishes. Whether spread on toast, blended into guacamole, or added to salads and smoothies, an avocado brings a sense of wholesome freshness and natural indulgence.',
        circleColor: const Color(0xffE6F2EA),
        isFavorite: false,
        rating: 4.5,
      ),
      Product(
        id: 3,
        name: 'Pineapple',
        imagePath: 'assets/images/pineapple.png',
        price: 3.99,
        categoryID: 2,
        note: '1.50 lbs',
        description:
            'A pineapple is a tropical fruit bursting with vibrant flavor and sunny sweetness. Its rough, spiky exterior hides a golden-yellow flesh that’s juicy, aromatic, and refreshingly tangy. The taste combines bright notes of sweetness and acidity, offering a lively, tropical zing that instantly awakens the senses. Its scent is sweet and floral, evoking warm beaches and island breezes. Each bite is both crisp and succulent, leaving a pleasant, lingering sweetness. Whether enjoyed fresh, blended into juice, or used in desserts and savory dishes, a pineapple embodies the essence of tropical freshness and joy.',
        circleColor: const Color(0xffFFF6E3),
        isFavorite: false,
        rating: 5.0,
      ),
      Product(
        id: 4,
        name: 'Broccoli',
        imagePath: 'assets/images/broccoli.png',
        price: 3.00,
        categoryID: 1,
        note: '1.0 kg',
        description:
            'Broccoli is a vibrant green vegetable known for its tree-like shape and crisp, earthy flavor. Its tightly packed florets sit atop firm stalks, both of which are edible and full of nutrients. When fresh, broccoli has a bright green color and a mild, slightly bitter taste that becomes sweeter and more tender when cooked. Its texture can range from crunchy when raw to soft and velvety when steamed or roasted. With a fresh, grassy aroma and a satisfying bite, broccoli adds both flavor and nutrition to any meal — whether tossed into salads, stir-fried, or served as a wholesome side dish.',
        circleColor: const Color(0xffE6F2EA),
        isFavorite: true,
        rating: 4.0,
      ),
      Product(
        id: 5,
        name: 'Black Grapes',
        imagePath: 'assets/images/black_grapes.png',
        price: 7.05,
        categoryID: 2,
        note: '5.0 lbs',
        description:
            'A black grape is a small, smooth, and glossy fruit with deep purple to nearly black skin that glistens in the light. Inside, its flesh is juicy, tender, and bursting with a rich, sweet flavor accented by subtle hints of tartness. The taste is often more intense and robust than that of green or red grapes, offering a satisfying balance of sweetness and depth. Each bite releases a refreshing burst of juice with a pleasant aroma that’s both fruity and floral. Whether eaten fresh, chilled, or turned into juice, jam, or wine, black grapes are a delicious symbol of natural sweetness and elegance.',
        circleColor: const Color(0xFFE2F5AD),
        isFavorite: false,
        rating: 4.0,
      ),
      Product(
        id: 6,
        name: 'Pomegranate',
        imagePath: 'assets/images/pomegranate.png',
        price: 2.05,
        categoryID: 2,
        note: '1.5 lbs',
        description:
            'A pomegranate is a striking fruit celebrated for its jewel-like seeds and refreshing, tangy-sweet flavor. Encased in a tough, leathery skin that ranges from deep red to golden pink, it opens to reveal clusters of glistening ruby-red arils — each one a tiny burst of juicy, tart sweetness. The taste is both bold and refreshing, blending notes of sweetness with a gentle acidity that awakens the palate. Its aroma is subtly floral and fruity, hinting at the richness within. Symbolizing vitality and abundance, the pomegranate is as beautiful as it is flavorful — perfect for eating fresh, sprinkling over salads, or pressing into vibrant, antioxidant-rich juice.',
        circleColor: const Color(0xffFFF0E5),
        isFavorite: false,
        rating: 3.5,
      ),
      Product(
        id: 7,
        name: 'Banana',
        imagePath: 'assets/images/banana.png',
        price: 2.05,
        categoryID: 2,
        note: '1.5 lbs',
        description:
            'A banana is a soft, elongated fruit loved for its creamy texture and naturally sweet flavor. Its smooth yellow peel protects the tender, pale flesh inside, which is rich, mildly fragrant, and pleasantly satisfying. The taste is sweet with gentle hints of honey and vanilla, becoming more intense as the fruit ripens. Its texture is smooth and slightly firm when fresh, turning softer and more luscious over time. Bananas are refreshing on their own, yet versatile enough to blend into smoothies, bake into desserts, or top breakfast dishes. With their cheerful color and comforting flavor, bananas are a timeless symbol of simple, natural goodness.',
        circleColor: const Color(0xFFFAEBAA),
        isFavorite: false,
        rating: 3.5,
      ),
      Product(
        id: 8,
        name: 'Watermelon',
        imagePath: 'assets/images/watermelon.png',
        price: 1.25,
        categoryID: 2,
        note: '1 kg',
        description:
            'A watermelon is a large, refreshing fruit known for its vibrant colors and juicy sweetness. Its thick green rind, often striped with lighter shades, encases a bright red or pink flesh dotted with glossy black seeds. Every bite bursts with crisp, watery sweetness that instantly cools and hydrates, making it the perfect treat for hot days. The texture is light and crunchy, with a clean, refreshing flavor that’s both sweet and subtly floral. Its aroma is delicate and summery, evoking a sense of freshness and joy. Whether sliced, cubed, or blended into juice, a watermelon captures the essence of pure, juicy refreshment.',
        circleColor: const Color.fromARGB(255, 173, 233, 161),
        isFavorite: false,
        rating: 4.7,
      ),
      Product(
        id: 9,
        name: 'Almarai Orange Juice',
        imagePath: 'assets/images/AlmaraiOrangeJuice.png',
        price: 2.13,
        categoryID: 3,
        note: '1.4 L',
        description:
            ' for any occasion. Made from the finest and juiciest sun-ripened oranges, it delivers a delightful balance of sweet and tangy flavors. The juice is a great source of Vitamin C and antioxidants, making it a healthy and energizing addition to your diet.'
            'y features include:'
            '100% natural options: Certain varieties, such as the 100% Juice line, are cold-pressed and contain no added sugars or artificial additives.'
            'A variety of products: Almarai offers different types of orange juice, including premium, fresh, and mixed fruit options, with some available with pulp for added texture.'
            'Perfectly packaged: Available in a range of convenient sizes, from small bottles for on-the-go to large cartons for the whole family.'
            'Refreshing and invigorating: Whether you enjoy it with breakfast or as a quick pick-me-up, its zesty and satisfying taste will invigorate your senses.'
            'This high-quality juice is known for its pure and fresh taste, making it a popular choice for both children and adults.',
        circleColor: const Color.fromARGB(255, 255, 233, 184),
        isFavorite: false,
        rating: 5.0,
      ),

      Product(
        id: 10,
        name: 'Eggs',
        imagePath: 'assets/images/eggs.png',
        price: 3.15,
        categoryID: 4,
        note: '30 eggs',
        description:
            ' countless ways. Whether fried, scrambled, or poached, they offer'
            'a rich, creamy texture and a satisfying flavor. Often seasoned si'
            'mply with salt and pepper, they can also be enhanced with herbs, '
            'cheese, and vegetables for a more complex and savory experience.',
        circleColor: const Color.fromARGB(255, 171, 221, 255),
        isFavorite: false,
        rating: 3.5,
      ),

      Product(
        id: 11,
        name: 'Olives Oil',
        imagePath: 'assets/images/olives_oil.png',
        price: 22.0,
        categoryID: 5,
        note: '500 ML',
        description:
            '100% single sourced estate-owned EVOO made with pressed Koroneiki'
            ' olives.\n Picked the old-fashioned way from the island of Crete,'
            ' cold pressed, and hand bottled.\nDeliciously full-bodied taste'
            ' has distinctive flavor with no bitterness or bad aftertaste\n'
            'High smoke point makes our product perfect for all types of'
            ' cooking with old world Greek flavor\n'
            'Certified extra-virgin by chemical analysis showing an acidity'
            ' between .2 and .4 %.',
        circleColor: const Color(0xFFE2EEC1),
        isFavorite: false,
        rating: 3.5,
      ),
    ];
  }
}
