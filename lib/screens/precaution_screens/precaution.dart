import 'package:flutter/material.dart';
import 'package:meternity_hub/screens/precaution_screens/options.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Emergency Guidelines',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.w500,
              fontSize: 26,
            ),
          ),
        ),
        backgroundColor: const Color(0xFF5C4BB0),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HealthcareHome()));
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          buildEmergencyItem(
            '1. Miscarriage',
            'Symptoms: Vaginal bleeding, abdominal cramps or pain, tissue passing from the vagina.',
            'Action: Contact your healthcare provider immediately. Rest, avoid heavy lifting, and follow medical advice.',
          ),
          buildEmergencyItem(
            '2. Ectopic Pregnancy',
            'Symptoms: Abdominal or pelvic pain, vaginal bleeding, shoulder pain.',
            'Action: Seek immediate medical help. Surgery or medication may be required to address the ectopic pregnancy.',
          ),
          buildEmergencyItem(
            '3. Placental Abruption',
            'Symptoms: Vaginal bleeding, abdominal or back pain, uterine tenderness.',
            'Action: Call emergency services. Immediate medical attention is crucial for the safety of both the mother and the baby.',
          ),
          buildEmergencyItem(
            '4. Placenta Previa',
            'Symptoms: Painless vaginal bleeding in the third trimester.',
            'Action: Contact your healthcare provider promptly. Bed rest and monitoring may be necessary.',
          ),
          buildEmergencyItem(
            '5. Preeclampsia and Eclampsia',
            'Symptoms: High blood pressure, swelling, headaches, vision changes, seizures.',
            'Action: Urgently contact your healthcare provider. Monitoring, medication, and possible early delivery may be required.',
          ),
          buildEmergencyItem(
            '6. Premature Rupture of Membranes (PROM)',
            'Symptoms: Gush or trickle of fluid from the vagina.',
            'Action: Contact your healthcare provider. Monitoring for infection and potential labor induction may be necessary.',
          ),
          buildEmergencyItem(
            '7. Placenta Accreta',
            'Symptoms: Heavy bleeding during or after delivery.',
            'Action: Immediate medical attention is essential. Surgery may be required to manage the condition.',
          ),
          buildEmergencyItem(
            '8. Early Contractions in the Third Trimester',
            'Symptoms: Regular, frequent contractions before the due date.',
            'Action: Contact your healthcare provider. Monitoring and interventions to prevent premature birth may be recommended.',
          ),
          buildEmergencyItem(
            '9. Flu-like Symptoms',
            'Symptoms: Fever, body aches, cough, sore throat.',
            'Action: Contact your healthcare provider. Rest, hydration, and possible antiviral medication may be prescribed.',
          ),
          buildEmergencyItem(
            '10. Severe Nausea or Vomiting',
            'Symptoms: Persistent vomiting, dehydration, weight loss.',
            'Action: Seek medical attention. Hydration, antiemetic medication, and nutritional support may be needed.',
          ),
          buildEmergencyItem(
            '11. Seizures',
            'Symptoms: Convulsions, loss of consciousness, muscle rigidity, foaming at the mouth.',
            'Action: Call emergency services immediately. Ensure a safe environment, place the mother on her side, and do not put anything in her mouth.',
          ),
          buildEmergencyItem(
            '12. Heavy Bleeding',
            'Symptoms: Profuse vaginal bleeding, passing of large clots, dizziness, weakness.',
            'Action: Seek emergency medical care. Lie down with legs elevated, apply a cold compress to the abdomen, and do not insert anything into the vagina.',
          ),
          buildEmergencyItem(
            '13. Contractions Early in the 3rd Trimester',
            'Symptoms: Regular, painful contractions before the due date, backache, pelvic pressure.',
            'Action: Contact your healthcare provider immediately. Rest, hydrate, and follow medical guidance.',
          ),
          buildEmergencyItem(
            '14. Urinary Tract Infections',
            'Symptoms: Painful urination, frequent urge to urinate, cloudy or bloody urine, pelvic pain.',
            'Action: Consult your healthcare provider for a urine test and appropriate antibiotics if needed. Stay hydrated and empty the bladder frequently.',
          ),
          buildEmergencyItem(
            '15. Lower Respiratory Tract Infections',
            'Symptoms: Cough, shortness of breath, chest pain, fever.',
            'Action: Contact your healthcare provider for evaluation. Rest, hydration, and prescribed medications may be necessary.',
          ),
          buildEmergencyItem(
            '16. Deep Vein Thrombosis',
            'Symptoms: Swelling, pain, warmth, or redness in the leg, shortness of breath, chest pain.',
            'Action: Seek immediate medical attention. Avoid sitting for long periods, elevate the leg, and follow treatment recommendations.',
          ),
          buildEmergencyItem(
            '17. Acute Undifferentiated Febrile Illnesses',
            'Symptoms: Fever, chills, body aches, fatigue.',
            'Action: Contact your healthcare provider for evaluation. Rest, hydration, and antipyretic medications may be recommended.',
          ),
          buildEmergencyItem(
            '18. Deep Venous Thrombosis',
            'Symptoms: Swelling, warmth, redness, or pain in the affected leg, shortness of breath.',
            'Action: Seek prompt medical attention. Avoid prolonged immobility, elevate the leg, and follow treatment recommendations.',
          ),
          buildEmergencyItem(
            '19. Infections',
            'Symptoms: Varies based on the type of infection (e.g., fever, pain, discharge).',
            'Action: Contact your healthcare provider for diagnosis and treatment. Follow prescribed medications and self-care measures.',
          ),
          buildEmergencyItem(
            '20. Retained Placenta',
            'Symptoms: Difficulty expelling the placenta after delivery, continued bleeding, abdominal pain.',
            'Action: Notify healthcare providers immediately. Medical intervention, such as manual removal of the placenta or a surgical procedure, may be necessary.',
          ),
        ],
      ),
    ));
  }

  Widget buildEmergencyItem(String title, String symptoms, String action) {
    return Card(
      margin:
          const EdgeInsets.only(bottom: 16.0, top: 16.0), // Adding top spacing
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Centering the heading
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5C4BB0), // Using the provided color scheme
              ),
            ),
            const SizedBox(height: 8.0),
            RichText(
              text: TextSpan(
                text: 'Symptoms: ',
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: symptoms.replaceFirst('Symptoms: ', ''),
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            RichText(
              text: TextSpan(
                text: 'Action: ',
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: action.replaceFirst('Action: ', ''),
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
