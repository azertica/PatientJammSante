import 'package:flutter/material.dart';
import 'package:patient_jamm_sante/Core/Theme.dart';
import 'package:patient_jamm_sante/Core/dimension.dart';
import 'package:patient_jamm_sante/l10n/app_localizations.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.all(Dimension().paddingM),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Dimension().paddingSM),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(Dimension().raduisML),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _navItemAnimated(icon: Icons.grid_view, label: l10n.homePage, index: 0),
            _navItemAnimated(icon: Icons.medical_services, label: l10n.doctors, index: 1),
            _navItemAnimated(icon: Icons.calendar_today, label: l10n.agenda, index: 2),
            _navItemAnimated(icon: Icons.settings, label: l10n.settings, index: 3),
          ],
        ),
      ),
    );
  }

  Widget _navItemAnimated({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final bool isActive = currentIndex == index;

    return GestureDetector(
      onTap: () {
        onTap(index);
        if (index == 0) {
          _navigateHomeScreenLog();
        } else if (index == 1) {
          _navigateDoctorScreenLog();
        } else if (index == 2) {
          _navigateAgendaScreenLog();
        } else if (index == 3) {
          _navigateSettingScreenLog();
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(
          horizontal: isActive ? Dimension().paddingM : 0,
          vertical: Dimension().paddingSSM,
        ),
        decoration: BoxDecoration(
          color: isActive ? ThemeColor().secondaryBgColor : Colors.transparent,
          borderRadius: BorderRadius.circular(Dimension().raduisMML),
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
                    Icon(icon, color: ThemeColor().primaryColor),
                    SizedBox(width: Dimension().sizedBoxS),
                    Text(
                      label,
                      style: TextStyle(
                        color: ThemeColor().primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
              : Icon(
                  icon,
                  key: const ValueKey("inactive"),
                  color: ThemeColor().secondaryColor,
                  size: Dimension().iconM,
                ),
        ),
      ),
    );
  }
}

void _navigateHomeScreenLog() {
  Sentry.addBreadcrumb(Breadcrumb(
    message: "Navigated to HomeScreen",
    level: SentryLevel.info,
    category: 'navigation',
    timestamp: DateTime.now(),
  ));
}

void _navigateDoctorScreenLog() {
  Sentry.addBreadcrumb(Breadcrumb(
    message: "Navigated to DoctorScreen",
    level: SentryLevel.info,
    category: 'navigation',
    timestamp: DateTime.now(),
  ));
}

void _navigateAgendaScreenLog() {
  Sentry.addBreadcrumb(Breadcrumb(
    message: "Navigated to AgendaScreen",
    level: SentryLevel.info,
    category: 'navigation',
    timestamp: DateTime.now(),
  ));
}

void _navigateSettingScreenLog() {
  Sentry.addBreadcrumb(Breadcrumb(
    message: "Navigated to SettingScreen",
    level: SentryLevel.info,
    category: 'navigation',
    timestamp: DateTime.now(),
  ));
}