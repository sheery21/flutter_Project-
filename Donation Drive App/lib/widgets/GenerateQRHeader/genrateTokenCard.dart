import 'package:donation_drive/widgets/ButtonsField/buttonField.dart';
import 'package:donation_drive/widgets/TextStyleField/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GenerateTokenCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const GenerateTokenCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          /// Top Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Icon Box
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF2B7FFF).withOpacity(0.08),
                      blurRadius: 6,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: SvgPicture.asset("assets/Icons/QR_Icon.svg"),
              ),
              const SizedBox(width: 12),

              /// Texts
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "DMSans",
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(subtitle, style: ShortTextField.mainShortText_2()),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// Button
          //   onTap: onTap,
          //         "Generate Tokens",
          Buttonfield.Mainbuttonfield(
            text: "Generate Tokens",
            onPressed: onTap,
          ),
        ],
      ),
    );
  }
}
