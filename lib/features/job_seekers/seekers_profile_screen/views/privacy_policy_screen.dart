import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/leading_button_app_bar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(child: LeadingButtonAppbar(text: "Privacy Policy")),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Odio eu feugiat pretium nibh ipsum consequat nis[. Tempus quam pellentesque nec nam aliquam sem et tortor consequat. Elit eget gravida cum sociis natoque penatibus. Sed elementum tempus egestas sed sed risus, ld interdum velit laoreet id donec ultrices- Fermentum leo vet Otti porta non pulvinar neque laoteet. In mollis nunc sed id semper risus in hendrerit gravida. Venenatis lectus magna fringilla urna porttitor rhoncus dolor purus. Erat nam at lectus urna duis convallis convallis. Interdum velit laoreet id donec uttrices tincidunt arcu, Sit amet venenatis urna cursus eget nunc scelerisque viverra Purus in massa tempor nec feugiat. Hendrerit gravida rutrum quisque non tellus orci ac auctor augue. Aenean vel elit scelerisque mauris pellentesque.",
              style: GoogleFonts.inter(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFF4B5563),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
