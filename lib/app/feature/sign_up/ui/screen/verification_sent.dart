import 'package:contacts_app_isidore/core/extensions/sized_context.dart';
import 'package:contacts_app_isidore/core/router/navigation_service.dart';
import 'package:contacts_app_isidore/core/router/route_names.dart';
import 'package:contacts_app_isidore/core/service_locator.dart';
import 'package:contacts_app_isidore/core/ui/ui.dart';
import 'package:contacts_app_isidore/core/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class VerificationSentScreen extends StatelessWidget {
  const VerificationSentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: AppColors.fadedGreen,
                borderRadius: BorderRadius.circular(60),
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 45,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'Verification email sent!',
              style: AppTextStyles.extraLargeTextPrimary,
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: context.width * 0.7,
              child: Text(
                'Please check your email to verify your mycontactapp account',
                style: AppTextStyles.largeTextGrey,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            AppButton(
              height: 50,
              width: context.width * 0.45,
              onPressed: () => sl<NavigationService>().navigateTo(
                RouteNames.home,
              ),
              child: Text(
                'Done',
                style: AppTextStyles.normalTextWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
