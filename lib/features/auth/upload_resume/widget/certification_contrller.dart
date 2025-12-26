import 'package:flutter/material.dart';

import '../model/profile_model.dart';

class CertificationController {
  var titleController = TextEditingController();
  var issuerController = TextEditingController();
  var yearController = TextEditingController();

  CertificationController();

  CertificationController.fromCertification(Certification cert) {
    titleController.text = cert.title ?? '';
    issuerController.text = cert.issuer ?? '';
    yearController.text = cert.year ?? '';
  }

  Certification toCertification() {
    return Certification(
      title: titleController.text,
      issuer: issuerController.text,
      year: yearController.text,
    );
  }
}
