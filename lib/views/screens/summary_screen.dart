import 'package:bayi_geliyo/models/payment_link_data.dart';
import 'package:bayi_geliyo/views/screens/link_processing_screen.dart';
import 'package:flutter/material.dart';

class SummaryScreen extends StatelessWidget {
  final PaymentLinkData data;

  const SummaryScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Link Ödeme Özeti',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF00538E),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Lütfen aşağıdaki bilgileri kontrol ederek link ödemeyi onaylayınız.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Alıcı Bilgileri',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildInfoRow('İsim, Soyisim', data.name),
                      _buildInfoRow('E-posta', data.email),
                      _buildInfoRow('GSM', data.phone),
                      const SizedBox(height: 24),
                      const Text(
                        'Link Ayarları',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildInfoRow('Link Türü', data.linkType),
                      _buildInfoRow('Tutar',
                          '${data.amount.toStringAsFixed(2)} ${data.currency}'),
                      _buildInfoRow('Sabit Tutar',
                          '${data.amount.toStringAsFixed(2)} ${data.currency}'),
                      const SizedBox(height: 24),
                      const Text(
                        'Limit Bilgisi',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildInfoRow(
                          'Limit Türü',
                          data.limitAmount != null
                              ? 'Limitli Link'
                              : 'Limitsiz Link'),
                      if (data.limitAmount != null)
                        _buildInfoRow('Limit Tutarı',
                            '${data.limitAmount!.toStringAsFixed(2)} ${data.currency}'),
                      const SizedBox(height: 24),
                      const Text(
                        'Müşteriden Talep Edilenler (Opsiyonel)',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildCheckItem('İletişim ve adres bilgilerini iste',
                          data.contactInfoRequired),
                      _buildCheckItem(
                          'Fatura bilgilerini iste', data.invoiceRequired),
                      _buildCheckItem(
                          'Açıklama iste', data.descriptionRequired),
                      const SizedBox(height: 24),
                      const Text(
                        'Kredi Kartı',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildCheckItem(
                          'Tek Çekim', data.paymentType == 'Tek Çekim'),
                      _buildCheckItem('Taksit', data.paymentType == 'Taksit'),
                      const SizedBox(height: 24),
                      const Text(
                        'Link Detayı',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildInfoRow('Link Türü', data.linkType),
                      if (data.linkExpiryDate != null)
                        _buildInfoRow('Son Kullanma Tarihi',
                            '${data.linkExpiryDate!.day}/${data.linkExpiryDate!.month}/${data.linkExpiryDate!.year}'),
                      const SizedBox(height: 24),
                      const Text(
                        'Kredi Kartı',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildPosItem(data.selectedPos),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const LinkProcessingScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00538E),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Link Gönder',
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
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckItem(String label, bool isChecked) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(
            isChecked ? Icons.check_box : Icons.check_box_outline_blank,
            color: isChecked ? const Color(0xFF00538E) : Colors.grey,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildPosItem(String title) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF00538E), width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey[300]!,
              ),
            ),
            child: Image.asset(
              'assets/images/pos_secim.png',
              height: 20,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
