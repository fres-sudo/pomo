import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(onTap: () => context.router.pop(), child: Icon(Icons.chevron_left_rounded)),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    children: [
                      Text("Privacy Policy", style: Theme
                          .of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 20, fontWeight: FontWeight.w800),),
                      Text("Last updated April 09, 2024", style: Theme
                          .of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontSize: 14),),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "This privacy notice for Pomo ('we', 'us', or 'our'), describes how and why we might collect, store, use, and/or share ('process') your information when you use our services ('Services'), such as when you:",
                style: Theme
                    .of(context)
                    .textTheme
                    .bodySmall,
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                child: Column(
                  children: [
                    Text(
                      "• Download and use our mobile application (Pomo), or any other application of ours that links to this privacy notice",
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodySmall,),
                    Text(
                      "• Engage with us in other related ways, including any sales, marketing, or events",
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodySmall,),
                  ],
                ),
              ),
              Text("Questions or concerns? Reading this privacy notice will help you understand your privacy rights and choices. If you do not agree with our policies and practices, please do not use our Services. If you still have any questions or concerns, please contact us at info.pomoapp@gmail.com.",
              style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(
                height: 20,
              ),
              Text("SUMMARY OF KEY POINTS", style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 14),),
              const SizedBox(
                height: 5,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "• What personal information do we process? When you visit, use, or navigate our Services, we may process personal information depending on how you interact with us and the Services, the choices you make, and the products and features you use. Learn more about personal information you disclose to us.\n",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "• Do we process any sensitive personal information? \n",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: "We do not process sensitive personal information.\n",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)

                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "• Do we receive any information from third parties?\n",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: "We do not receive any information from third parties.\n",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)

                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "• How do we process your information? We process your information to provide, improve, and administer our Services, communicate with you, for security and fraud prevention, and to comply with law. We may also process your information for other purposes with your consent. We process your information only when we have a valid legal reason to do so. Learn more about how we process your information.\n",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "• In what situations and with which parties do we share personal information? We may share information in specific situations and with specific third parties. Learn more about when and with whom we share your personal information.\n",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "• How do we keep your information safe? We have organisational and technical processes and procedures in place to protect your personal information. However, no electronic transmission over the internet or information storage technology can be guaranteed to be 100% secure, so we cannot promise or guarantee that hackers, cybercriminals, or other unauthorised third parties will not be able to defeat our security and improperly collect, access, steal, or modify your information. Learn more about how we keep your information safe.\n",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "• What are your rights? Depending on where you are located geographically, the applicable privacy law may mean you have certain rights regarding your personal information. Learn more about your privacy rights.\n",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "• How do you exercise your rights? The easiest way to exercise your rights is by submitting a data subject access request, or by contacting us. We will consider and act upon any request in accordance with applicable data protection laws.\n",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Text("TABLE OF CONTENTS", style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 14),),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("1. WHAT INFORMATION DO WE COLLECT?", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("Personal information you disclose to us", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 5),
                  Text("In Short: We collect personal information that you provide to us.", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 5),
                  Text("We collect personal information that you voluntarily provide to us when you register on the Services, express an interest in obtaining information about us or our products and Services, when you participate in activities on the Services, or otherwise when you contact us.", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 5),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Personal Information Provided by You. ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: "The personal information that we collect depends on the context of your interactions with us and the Services, the choices you make, and the products and features you use. The personal information we collect may include the following:",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "• names\n",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: "• email addresses\n",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: "• lisernames.",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Sensitive Information. ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: "We do not process sensitive information.",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("2. HOW DO WE PROCESS YOUR INFORMATION?", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("In Short: We process your information to provide, improve, and administer our Services, communicate with you, for security and fraud prevention, and to comply with law. We may also process your information for other purposes with your consent.", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 5),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "We process your personal information for a variety of reasons, depending on how you interact with our Services, including:\n",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: "• To facilitate account creation and authentication and otherwise manage user accounts. We may process your information so you can create and log in to your account, as well as keep your account in working order.\n",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: "• To save or protect an individual's vital interest. We may process your information when necessary to save or protect an individual's vital interest, such as to prevent harm.",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("3. WHAT LEGAL BASES DO WE RELY ON TO PROCESS YOUR PERSONAL INFORMATION?", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("In Short: We only process your personal information when we believe it is necessary and we have a valid legal reason (i.e. legal basis) to do so under applicable law, like with your consent, to comply with laws, to provide you with services to enter into or fulfil our contractual obligations, to protect your rights, or to fulfil our legitimate business interests.", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 5),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "The General Data Protection Regulation (GDPR) and UK GDPR require us to explain the valid legal bases we rely on in order to process your personal information.\n\n",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: "As such, we may rely on the following legal bases to process your personal information:\n",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: "- Consent. ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: "We may process your information if you have given us permission (i.e. consent) to use your personal information for a specific purpose. You can withdraw your consent at any time. Learn more about withdrawing your consent.\n",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: "- Legal Obligations. ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: "We may process your information where we believe it is necessary for compliance with our legal obligations, such as to cooperate with a law enforcement body or regulatory agency, exercise or defend our legal rights, or disclose your information as evidence in litigation in which we are involved.\n",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: "- Vital Interests. ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: "We may process your information where we believe it is necessary to protect your vital interests or the vital interests of a third party, such as situations involving potential threats to the safety of any person.",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("4. WHEN AND WITH WHOM DO WE SHARE YOUR PERSONAL INFORMATION?", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("In Short: We may share information in specific situations described in this section and/or with the following third parties.", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 5),
                  Text("We may need to share your personal information in the following situations:", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 5),
                  Text("• Business Transfers. We may share or transfer your information in connection with, or during negotiations of, any merger, sale of company assets, financing, or acquisition of all or a portion of our business to another company.", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 10),
                  Text("5. HOW LONG DO WE KEEP YOUR INFORMATION?", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("In Short: We keep your information for as long as necessary to fulfil the purposes outlined in this privacy notice unless otherwise required by law.", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 5),
                  Text("We will only keep your personal information for as long as it is necessary for the purposes set out in this privacy notice, unless a longer retention period is required or permitted by law (such as tax, accounting, or other legal requirements). No purpose in this notice will require us keeping your personal information for longer than the period of time in which users have an account with us.", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 5),
                  Text("When we have no ongoing legitimate business need to process your personal information, we will either delete or anonymise such information, or, if this is not possible (for example, because your personal information has been stored in backup archives), then we will securely store your personal information and isolate it from any further processing until deletion is possible.", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 10),
                  Text("6. HOW DO WE KEEP YOUR INFORMATION SAFE?", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("In Short: We aim to protect your personal information through a system of organisational and technical security measures.", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 5),
                  Text("We have implemented appropriate and reasonable technical and organisational security measures designed to protect the security of any personal information we process. However, despite our safeguards and efforts to secure your information, no electronic transmission over the Internet or information storage technology can be guaranteed to be 100% secure, so we cannot promise or guarantee that hackers, cybercriminals, or other unauthorised third parties will not be able to defeat our security and improperly collect, access, steal, or modify your information. Although we will do our best to protect your personal information, transmission of personal information to and from our Services is at your own risk. You should only access the Services within a secure environment.", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 10),
                  Text("7. DO WE COLLECT INFORMATION FROM MINORS?", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("In Short: We do not knowingly collect data from or market to children under 18 years of age.", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 5),
                  Text("We do not knowingly solicit data from or market to children under 18 years of age. By using the Services, you represent that you are at least 18 or that you are the parent or guardian of such a minor and consent to such minor dependent's use of the Services. If we learn that personal information from users less than 18 years of age has been collected, we will deactivate the account and take reasonable measures to promptly delete such data from our records. If you become aware of any data we may have collected from children under age 18, please contact us at info.pomoapp@gmail.com.", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 10),
                  Text("8. WHAT ARE YOUR PRIVACY RIGHTS?", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("In Short: In some regions, such as the European Economic Area (EEA), United Kingdom (UK), and Switzerland, you have rights that allow you greater access to and control over your personal information. You may review, change, or terminate your account at any time.", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 5),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "In some regions (like the EEA, UK, and Switzerland), you have certain rights under applicable data protection laws. These may include the right (i) to request access and obtain a copy of your personal information, (ii) to request rectification or erasure; (iii) to restrict the processing of your personal information; (iv) if applicable, to data portability; and (v) not to be subject to automated decision-making. In certain circumstances, you may also have the right to object to the processing of your personal information. You can make such a request by contacting us by using the contact details provided in the section 'HOW CAN YOU CONTACT US ABOUT THIS NOTICE?' below.",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: "We will consider and act upon any request in accordance with applicable data protection laws.",
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "In some regions (like the EEA, UK, and Switzerland), you have certain rights under applicable data protection laws. These may include the right (i) to request access and obtain a copy of your personal information, (ii) to request rectification or erasure; (iii) to restrict the processing of your personal information; (iv) if applicable, to data portability; and (v) not to be subject to automated decision-making. In certain circumstances, you may also have the right to object to the processing of your personal information. You can make such a request by contacting us by using the contact details provided in the section 'HOW CAN YOU CONTACT US ABOUT THIS NOTICE?' below.",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: "We will consider and act upon any request in accordance with applicable data protection laws.",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Withdrawing your consent", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("If we are relying on your consent to process your personal information, you have the right to withdraw your consent at any time. You can withdraw your consent at any time by contacting us by using the contact details provided in the section 'HOW CAN YOU CONTACT US ABOUT THIS NOTICE?' below.", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 5),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "However, please note that this will not affect the lawfulness of the processing before its withdrawal nor, will it affect the processing of your personal information conducted in reliance on lawful processing grounds other than consent.",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Account information", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "If you would at any time like to review or change the information in your account or terminate your account, you can:\n",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: "- Contact us using the contact information provided.",
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:5),
                  Text("Upon your request to terminate your account, we will deactivate or delete your account and information from our active databases. However, we may retain some information in our files to prevent fraud, troubleshoot problems, assist with any investigations, enforce our legal terms and/or comply with applicable legal requirements.", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 5),
                  Text("If you have questions or comments about your privacy rights, you may email us at info.pomoapp@gmail.com.", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 15),
                  Text("9. CONTROLS FOR DO-NOT-TRACK FEATURES", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("Most web browsers and some mobile operating systems and mobile applications include a Do-Not-Track ('DNT) feature or setting you can activate to signal your privacy preference not to have data about your online browsing activities monitored and collected. At this stage no uniform technology standard for recognising and implementing DNT signals has been finalised. As such, we do not currently respond to DNT browser signals or any other mechanism that automatically communicates your choice not to be tracked online. If a standard for online tracking is adopted that we must follow in the future, we will inform you about that practice in a revised version of this privacy notice.", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 15),
                  Text("10. DO OTHER REGIONS HAVE SPECIFIC PRIVACY RIGHTS?", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("In Short: You may have additional rights based on the country you reside in.", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 5),
                  Text("Australia and New Zealand", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("We collect and process your personal information under the obligations and conditions set by Australia's Privacy Act 1988 and New Zealand's Privacy Act 2020 (Privacy Act).", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 5),
                  Text("This privacy notice satisfies the notice requirements defined in both Privacy Acts, in particular: what personal information we collect from you, from which sources, for which purposes, and other recipients of your personal information.", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 5),
                  Text("If you do not wish to provide the personal information necessary to fulfill their applicable purpose, it may affect our ability to provide our services, in particular:", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 5),
                  Text("• offer you the products or services that you want\n• respond to or help with your requests\n• manage your account with us\n• confirm your identity and protect your account", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 5),
                  Text("At any time, you have the right to request access to or correction of your personal information. You can make such a request by contacting us by using the contact details provided in the section 'HOW CAN YOU REVIEW, UPDATE, OR DELETE THE DATA WE COLLECT FROM YOU?'", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 5),
                  Text("If you believe we are unlawfully processing your personal information, you have the right to submit a complaint about a breach of the Australian Privacy Principles to the Office of the Australian Information Commissioner and a breach of New Zealand's Privacy Principles to the Office of New Zealand Privacy Commissioner.", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 5),
                  Text("Republic of South Africa", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("At any time, you have the right to request access to or correction of your personal information. You can make such a request by contacting us by using the contact details provided in the section 'HOW CAN YOU REVIEW, UPDATE, OR DELETE THE DATA WE COLLECT FROM YOU?'", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 5),
                  Text("If you are unsatisfied with the manner in which we address any complaint with regard to our processing of personal information, you can contact the office of the regulator, the details of which are:", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 5),
                  Text("The Information Regulator (South Africa)", style: Theme.of(context).textTheme.bodySmall),
                  Text("11. DO WE MAKE UPDATES TO THIS NOTICE?", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("In Short: Yes, we will update this notice as necessary to stay compliant with relevant laws.", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 5),
                  Text("We may update this privacy notice from time to time. The updated version will be indicated by an updated 'Revised' date and the updated version will be effective as soon as it is accessible. If we make material changes to this privacy notice, we may notify you either by prominently posting a notice of such changes or by directly sending you a notification. We encourage you to review this privacy notice frequently to be informed of how we are protecting your information.", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 15),
                  Text("12. HOW CAN YOU CONTACT US ABOUT THIS NOTICE?", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("If you have questions or comments about this notice, you may email us at info.pomoapp@gmail.com or contact us by post at:", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 5),
                  Text("Pomo\nVia degli Orti 9\nSant'Angelo a Cupolo, Benevento 82010\nItaly", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 15),
                  Text("13. HOW CAN YOU REVIEW, UPDATE, OR DELETE THE DATA WE COLLECT FROM YOU?", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("Based on the applicable laws of your country, you may have the right to request access to the personal information we collect from you, change that information, or delete it. To request to review, update, or delete your personal information, please fill out and submit a data subject access request.", style: Theme.of(context).textTheme.bodySmall),


                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
