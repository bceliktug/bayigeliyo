import 'package:bayi_geliyo/views/screens/payment_selection_screen.dart';
import 'package:flutter/material.dart';

class LinkProcessingScreen extends StatefulWidget {
  const LinkProcessingScreen({super.key});

  @override
  State<LinkProcessingScreen> createState() => _LinkProcessingScreenState();
}

class _LinkProcessingScreenState extends State<LinkProcessingScreen> {
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    _simulateProcess();
  }

  Future<void> _simulateProcess() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() {
        _isCompleted = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF38A2D5),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: const Text(
                        'Ödeme Özeti',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!_isCompleted) ...[
                      const CircularProgressIndicator(
                        color: Color(0xFF00538E),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Link Gönderme İşleminiz\nGerçekleştiriliyor',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF00538E),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Lütfen Bekleyiniz',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ] else ...[
                      Image.asset(
                        'assets/images/onay.png',
                        height: 40,
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Link Gönderme İşleminiz\nBaşarıyla Gerçekleştirildi',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF00538E),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF38A2D5),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  'Yeni Ödeme Al',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const PaymentSelectionScreen(),
                                    ),
                                    (route) => false,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: const BorderSide(
                                      color: Color(0xFF38A2D5),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  'Ana Sayfaya Dön',
                                  style: TextStyle(
                                    color: Color(0xFF38A2D5),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
