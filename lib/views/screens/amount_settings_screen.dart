import 'package:bayi_geliyo/models/payment_link_data.dart';
import 'package:flutter/material.dart';
import 'limit_settings_screen.dart';

class AmountSettingsScreen extends StatefulWidget {
  final PaymentLinkData paymentLinkData;

  const AmountSettingsScreen({
    super.key,
    required this.paymentLinkData,
  });

  @override
  State<AmountSettingsScreen> createState() => _AmountSettingsScreenState();
}

class _AmountSettingsScreenState extends State<AmountSettingsScreen> {
  final _formKey = GlobalKey<FormState>();
  String _selectedCurrency = 'TL';
  String _selectedAmount = 'Sabit Tutar';
  final _amountController = TextEditingController();

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
                        'Tutar Ayarları',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Link tutar ayarlarını ve para birimini\nbelirleyin.',
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
                            'Tutar',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                DropdownButtonFormField<String>(
                                  value: _selectedCurrency,
                                  decoration: InputDecoration(
                                    labelText: 'Kur',
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
                                      value: 'TL',
                                      child: Text('TL'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'USD',
                                      child: Text('Dolar'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'EUR',
                                      child: Text('Euro'),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedCurrency = value!;
                                    });
                                  },
                                ),
                                const SizedBox(height: 16),
                                DropdownButtonFormField<String>(
                                  value: _selectedAmount,
                                  decoration: InputDecoration(
                                    labelText: 'Tutar',
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
                                      value: 'Sabit Tutar',
                                      child: Text('Sabit Tutar'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Değişken Tutar',
                                      child: Text('Değişken Tutar'),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedAmount = value!;
                                    });
                                  },
                                ),
                                const SizedBox(height: 16),
                                TextFormField(
                                  controller: _amountController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Tutar Girin',
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
                                    if (value == null || value.isEmpty) {
                                      return 'Lütfen tutar giriniz';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 120),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  final updatedData = PaymentLinkData(
                                    name: widget.paymentLinkData.name,
                                    email: widget.paymentLinkData.email,
                                    phone: widget.paymentLinkData.phone,
                                    amount:
                                        double.parse(_amountController.text),
                                    currency: _selectedCurrency,
                                    amountType: _selectedAmount,
                                    linkType: widget.paymentLinkData.linkType,
                                    contactInfoRequired: widget
                                        .paymentLinkData.contactInfoRequired,
                                    invoiceRequired:
                                        widget.paymentLinkData.invoiceRequired,
                                    descriptionRequired: widget
                                        .paymentLinkData.descriptionRequired,
                                    paymentType:
                                        widget.paymentLinkData.paymentType,
                                    selectedPos:
                                        widget.paymentLinkData.selectedPos,
                                  );

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LimitSettingsScreen(
                                        paymentLinkData: updatedData,
                                      ),
                                    ),
                                  );
                                }
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
    _amountController.dispose();
    super.dispose();
  }
}
