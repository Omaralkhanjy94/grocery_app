import '../../core/packages_manager/ui_imports.dart';
import '../../core/packages_manager/network_imports.dart';

class SessionWidget extends StatelessWidget {
  final String title;
  final VoidCallback onViewAllPressed;

  const SessionWidget({
    super.key,
    required this.title,
    required this.onViewAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          IconButton(
            onPressed: onViewAllPressed,
            icon: const Icon(Icons.keyboard_arrow_right),
          ),
        ],
      ),
    );
  }
}
