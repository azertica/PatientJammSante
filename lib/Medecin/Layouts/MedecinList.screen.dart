import 'package:flutter/material.dart';
import 'package:patient_jamm_sante/Core/Theme.dart';
import 'package:patient_jamm_sante/Medecin/Models/doctor.model.dart';
import 'package:patient_jamm_sante/Medecin/Providers/medecin.service.dart';
import 'package:patient_jamm_sante/Medecin/Widgets/IconBagde.widget.dart';
import 'package:patient_jamm_sante/Medecin/Widgets/SearchBar.widget.dart';
import 'package:patient_jamm_sante/Medecin/Widgets/Speciality.widget.dart';
import 'package:patient_jamm_sante/Medecin/Widgets/medecinCard.widget.dart';
import 'package:patient_jamm_sante/Medecin/Providers/Speciality.provider.dart';
import 'package:patient_jamm_sante/Medecin/Models/Speciality.model.dart';
import 'package:patient_jamm_sante/l10n/app_localizations.dart';

class Medecinlistscreen extends StatefulWidget {
  const Medecinlistscreen({super.key});

  @override
  State<Medecinlistscreen> createState() => _MedecinlistscreenState();
}

class _MedecinlistscreenState extends State<Medecinlistscreen> {
  final DoctorService _service = DoctorService();
  late Future<List<Doctor>> _futureDoctors;
  final List<Speciality> specialities = SpecialityProvider().specialities;

  @override
  void initState() {
    super.initState();
    _futureDoctors = _service.loadDoctors();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final widthScreen = MediaQuery.of(context).size.width;

    return SafeArea(
      child: FutureBuilder<List<Doctor>>(
        future: _futureDoctors,
        builder: (context, snapshot) {
          // Doctors data
          final isLoading = snapshot.connectionState == ConnectionState.waiting;
          final hasError = snapshot.hasError;
          final doctors = snapshot.data ?? [];

          return CustomScrollView(
            slivers: [

              // ── Header ──────────────────────────────────────────
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: widthScreen / 1.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconBadgeWidget(
                              icon: Icons.medical_services,
                              bgColor: ThemeColor().secondaryBgColor,
                            ),
                            Text(
                              l10n.findDoctor,
                              style: TextStyle(
                                color: ThemeColor().primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.notifications, color: ThemeColor().secondaryColor),
                    ],
                  ),
                ),
              ),

              // ── SearchBar ────────────────────────────────────────
              SliverToBoxAdapter(
                child: Center(
                  child: SizedBox(
                    width: widthScreen * 0.9,
                    child: const SearchBarWidget(),
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 16)),

              // ── Spécialités header ───────────────────────────────
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: widthScreen * 0.075),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.specialities,
                        style: TextStyle(
                          color: ThemeColor().primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        l10n.seeAll,
                        style: TextStyle(
                          color: ThemeColor().thirdColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 12)),

              // ── Spécialités liste horizontale ────────────────────
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 110,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: widthScreen * 0.08),
                    scrollDirection: Axis.horizontal,
                    itemCount: specialities.length,
                    itemBuilder: (context, index) {
                      return SpecialityWidget(speciality: specialities[index]);
                    },
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 16)),

              // ── Médecins recommandés header ──────────────────────
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: widthScreen * 0.08),
                  child: Text(
                    l10n.recommendedDoctors,
                    style: TextStyle(
                      color: ThemeColor().primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 12)),

              // ── États : loading / error / liste ─────────────────
              if (isLoading)
                const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                )
              else if (hasError)
                SliverFillRemaining(
                  child: Center(
                    child: Text(
                      l10n.doctorLoadingError,
                      style: TextStyle(color: ThemeColor().primaryColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              else
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final doctor = doctors[index];
                      return MedecinCardWidget(
                        color: ThemeColor().thirdBgColor,
                        fullname: doctor.fullName ?? l10n.noFullName,
                        specialty: doctor.specialty ?? l10n.noSpeciality,
                        distance: doctor.distance ?? '0',
                        photoUrl: doctor.photoUrl ?? '',
                        fullAddress: doctor.fullAddress ?? l10n.noAddress,
                      );
                    },
                    childCount: doctors.length,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}