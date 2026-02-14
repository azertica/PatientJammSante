import 'package:flutter/material.dart';
import 'package:patient_jamm_sante/Core/Theme.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _navItemAnimated(icon: Icons.grid_view, label: "Home", index: 0),
            _navItemAnimated(icon: Icons.medical_services, label: "Médecins", index: 1),
            _navItemAnimated(icon: Icons.calendar_today, label: "Agenda", index: 2),
            _navItemAnimated(icon: Icons.settings, label: "Settings", index: 3),
          ],
        ),
      ),
    );
  }

  Widget _navItemAnimated({required IconData icon, required String label, required int index}) {
    final bool isActive = currentIndex == index;

    return GestureDetector(
      onTap: (){
        onTap(index);
        if(index == 0){
          Sentry.addBreadcrumb(
            Breadcrumb(
              message: "Navigated to HomeScreen",
              level: SentryLevel.info,
              category: 'navigation',
              timestamp: DateTime.now()
            )
          );
        } else if(index == 1){
          Sentry.addBreadcrumb(
            Breadcrumb(
              message: "Navigated to DoctorScreen",
              level: SentryLevel.info,
              category: 'navigation',
              timestamp: DateTime.now()
            )
          );
        } else if(index == 2) {
          Sentry.addBreadcrumb(
            Breadcrumb(
              message: "Navigated to AgendaScreen",
              level: SentryLevel.info,
              category: 'navigation',
              timestamp: DateTime.now()
            )
          );
        } else if(index == 3){
          Sentry.addBreadcrumb(
            Breadcrumb(
              message: "Navigated to MessageScreen",
              level: SentryLevel.info,
              category: 'navigation',
              timestamp: DateTime.now()
            )
          );
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(
          horizontal: isActive ? 16 : 0,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: isActive ? ThemeColor().secondaryBgColor : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.2, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
          child: isActive
              ? Row(
                  key: const ValueKey("active"),
                  children: [
                    Icon(icon, color: Colors.white),
                    const SizedBox(width: 6),
                    Text(
                      label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
              : Icon(
                  icon,
                  key: const ValueKey("inactive"),
                  color: Colors.white54,
                  size: 24,
                ),
        ),
      ),
    );
  }
}
