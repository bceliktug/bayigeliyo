import 'package:bayi_geliyo/models/payment_link_data.dart';
import 'package:flutter/material.dart';
import 'payment_settings_screen.dart';

class LimitSettingsScreen extends StatefulWidget {
  final PaymentLinkData paymentLinkData;

  const LimitSettingsScreen({
    super.key,
    required this.paymentLinkData,
  });

  @override
  State<LimitSettingsScreen> createState() => _LimitSettingsScreenState();
}

class _LimitSettingsScreenState extends State<LimitSettingsScreen> {
  String _selectedLimit = 'Limitsiz Link';
  final _limitAmountController = TextEditingController();
  bool _contactInfo = true;
  bool _invoiceInfo = false;
  bool _description = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_mavi.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Center(
                        child: const Text(
                          'Link Ödeme',
                          style: TextStyle(
                            color: Colors.white,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Limit Yapılandırma',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Hangi tutarda ve adette ödeme\ngeleceğini planlayın.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(
                        color: Color(0xFFF88100),
                        width: 3,
                      ),
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Limit Belirle',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 24),
                          DropdownButtonFormField<String>(
                            value: _selectedLimit,
                            decoration: InputDecoration(
                              labelText: 'Limit Belirle',
                              labelStyle: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Colors.grey[400]!,
                                ),
                              ),
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: 'Limitsiz Link',
                                child: Text('Limitsiz Link'),
                              ),
                              DropdownMenuItem(
                                value: 'Limitli Link',
                                child: Text('Limitli Link'),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _selectedLimit = value!;
                              });
                            },
                          ),
                          if (_selectedLimit == 'Limitli Link') ...[
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _limitAmountController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Limit Tutarı Girin',
                                labelStyle: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Colors.grey[300]!,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Colors.grey[400]!,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (_selectedLimit == 'Limitli Link' &&
                                    (value == null || value.isEmpty)) {
                                  return 'Lütfen limit tutarı giriniz';
                                }
                                return null;
                              },
                            ),
                          ],
                          const SizedBox(height: 24),
                          const Text(
                            'Müşteriden Talepler (Opsiyonel)',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 16),
                          CheckboxListTile(
                            value: _contactInfo,
                            onChanged: (value) {
                              setState(() {
                                _contactInfo = value!;
                              });
                            },
                            title: const Text(
                              'İletişim ve adres bilgilerini iste',
                              style: TextStyle(fontSize: 14),
                            ),
                            contentPadding: EdgeInsets.zero,
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                          CheckboxListTile(
                            value: _invoiceInfo,
                            onChanged: (value) {
                              setState(() {
                                _invoiceInfo = value!;
                              });
                            },
                            title: const Text(
                              'Fatura bilgilerini iste',
                              style: TextStyle(fontSize: 14),
                            ),
                            contentPadding: EdgeInsets.zero,
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                          CheckboxListTile(
                            value: _description,
                            onChanged: (value) {
                              setState(() {
                                _description = value!;
                              });
                            },
                            title: const Text(
                              'Açıklama iste',
                              style: TextStyle(fontSize: 14),
                            ),
                            contentPadding: EdgeInsets.zero,
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_selectedLimit == 'Limitli Link' &&
                                      _limitAmountController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Lütfen limit tutarı giriniz'),
                                      ),
                                    );
                                    return;
                                  }
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PaymentSettingsScreen(
                                        paymentLinkData:
                                            widget.paymentLinkData.copyWith(
                                          contactInfoRequired: _contactInfo,
                                          invoiceRequired: _invoiceInfo,
                                          descriptionRequired: _description,
                                          limitAmount: _selectedLimit ==
                                                  'Limitli Link'
                                              ? double.parse(
                                                  _limitAmountController.text)
                                              : null,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF00538E),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  'Devam Et',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _limitAmountController.dispose();
    super.dispose();
  }
}
