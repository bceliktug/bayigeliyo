import 'package:flutter/material.dart';
import 'pos_selection_screen.dart';
import 'package:bayi_geliyo/models/payment_link_data.dart';

class PaymentSettingsScreen extends StatefulWidget {
  final PaymentLinkData paymentLinkData;

  const PaymentSettingsScreen({
    super.key,
    required this.paymentLinkData,
  });

  @override
  State<PaymentSettingsScreen> createState() => _PaymentSettingsScreenState();
}

class _PaymentSettingsScreenState extends State<PaymentSettingsScreen> {
  String _selectedLink = 'Süresiz Link';
  String _selectedPaymentType = 'Tek Çekim';
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now().add(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF00538E),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

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
                        'Ödeme Ayarları',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'En az bir ödeme yöntemi seçin\nlütfen.',
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
                            'Kredi Kartı',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: CheckboxListTile(
                                  value: _selectedPaymentType == 'Tek Çekim',
                                  onChanged: (value) {
                                    if (value!) {
                                      setState(() {
                                        _selectedPaymentType = 'Tek Çekim';
                                      });
                                    }
                                  },
                                  title: const Text(
                                    'Tek Çekim',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                ),
                              ),
                              Expanded(
                                child: CheckboxListTile(
                                  value: _selectedPaymentType == 'Taksit',
                                  onChanged: (value) {
                                    if (value!) {
                                      setState(() {
                                        _selectedPaymentType = 'Taksit';
                                      });
                                    }
                                  },
                                  title: const Text(
                                    'Taksit',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'Link Belirle',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 16),
                          DropdownButtonFormField<String>(
                            value: _selectedLink,
                            decoration: InputDecoration(
                              labelText: 'Link Belirle',
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
                                value: 'Süresiz Link',
                                child: Text('Süresiz Link'),
                              ),
                              DropdownMenuItem(
                                value: 'Süreli Link',
                                child: Text('Süreli Link'),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _selectedLink = value!;
                                if (value == 'Süresiz Link') {
                                  _selectedDate = null;
                                }
                              });
                            },
                          ),
                          if (_selectedLink == 'Süreli Link') ...[
                            const SizedBox(height: 16),
                            InkWell(
                              onTap: () => _selectDate(context),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 16,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey[300]!,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _selectedDate == null
                                          ? 'Tarih Seçin'
                                          : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                                      style: TextStyle(
                                        color: _selectedDate == null
                                            ? Colors.grey[600]
                                            : Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Icon(
                                      Icons.calendar_today,
                                      color: Colors.grey[600],
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                          const SizedBox(height: 90),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_selectedPaymentType.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Lütfen bir ödeme yöntemi seçin'),
                                    ),
                                  );
                                  return;
                                }
                                if (_selectedLink == 'Süreli Link' &&
                                    _selectedDate == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Lütfen tarih seçin'),
                                    ),
                                  );
                                  return;
                                }
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PosSelectionScreen(
                                      paymentLinkData:
                                          widget.paymentLinkData.copyWith(
                                        linkType: _selectedLink,
                                        linkExpiryDate: _selectedDate,
                                        paymentType: _selectedPaymentType,
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
}
