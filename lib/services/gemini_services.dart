import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class GeminiService {
  static final _apiKey = dotenv.env['GEMINI_API_KEY'];

  // Gunakan model terbaru yang kamu temukan dari response GET /models
  static const String _baseUrl =
      'https://generativelanguage.googleapis.com/v1/models/gemini-2.5-flash:generateContent';

  static Future<String> sendMessage(String message) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl?key=$_apiKey'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'contents': [
            {
              'parts': [
                {
                  'text':
                      'Kamu adalah chatbot ramah untuk edukasi gizi anak. Jawablah dengan **singkat**, maksimal 2 paragraf, dengan bahasa yang ramah anak-anak. Hindari pengguna Pertanyaan: $message',
                },
              ],
            },
          ],
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final text = data['candidates']?[0]?['content']?['parts']?[0]?['text'];
        return text ?? 'Maaf, tidak ada respons dari AI.';
      } else {
        print('(${response.statusCode}): ${response.body}');
        return 'Terjadi kesalahan (${response.statusCode}): ${response.body}';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}
