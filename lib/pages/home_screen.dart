// Home Screen
// This screen displays the main content of the app, including categories and featured products.
// It uses a CustomScaffold for consistent layout and styling.
// It includes a search bar, a slideshow of cover images, and sections for categories and featured products.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/models/offers.dart';
import 'package:grocery_app/pages/product_details_screen.dart';
import 'package:short_navigation/short_navigation.dart';
import '../extensions/spaces_x.dart';
import '../../models/categories.dart';
import '../../models/products.dart';
import '../../widgets/cover_widget.dart';
import '../../widgets/category_widget.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/product_widget.dart';
import '../../widgets/session_widget.dart';
part 'home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

