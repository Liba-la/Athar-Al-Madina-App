import 'dart:convert';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

const Color green = Color(0xFF174D35);
const Color deepGreen = Color(0xFF0D3826);
const Color gold = Color(0xFFC5A45B);
const Color beige = Color(0xFFF5F0E6);
const Color muted = Color(0xFF6C7B70);
const Color line = Color(0xFFE8E1D5);

final ValueNotifier<String> appLanguage = ValueNotifier<String>('ar');

final Map<String, Map<String, String>> translations = {
  'en': {
    'أثر المدينة': 'Athar Al Madina',
    'الرئيسية': 'Home',
    'المعالم': 'Landmarks',
    'رحلتي': 'My Trip',
    'الخريطة': 'Map',
    'حسابي': 'My Account',
    'اللغة': 'Language',
    'دخول': 'Login',
    'اكتشف المدينة المنورة': 'Discover Madinah',
    'تعرّف على معالمها الدينية والتاريخية والثقافية، وخطّط لرحلة تترك أثرًا لا يُنسى.':
    'Explore its religious, historical, and cultural landmarks, and plan an unforgettable trip.',
    'خطّط لرحلتك': 'Plan Your Trip',
    'اكتشف المدينة': 'Explore Madinah',
    'اختر نوع الأماكن التي ترغب بزيارتها': 'Choose the places you want to visit',
    'معالم دينية': 'Religious Landmarks',
    'معالم تاريخية': 'Historical Landmarks',
    'متاحف وثقافة': 'Museums & Culture',
    'أماكن طبيعية': 'Natural Places',
    'المساجد والمواقع المرتبطة بالسيرة النبوية.':
    'Mosques and sites related to the Prophet’s biography.',
    'مواقع وأحداث من تاريخ المدينة.': 'Sites and events from Madinah’s history.',
    'متاحف وتجارب ثقافية وتراثية.': 'Museums and cultural heritage experiences.',
    'جبال وحدائق ومزارع وأماكن مفتوحة.': 'Mountains, gardens, farms, and open spaces.',
    'أماكن لا تفوّت زيارتها': 'Places You Should Not Miss',
    'أبرز المحطات التي يمكنك إضافتها إلى رحلتك':
    'Top destinations you can add to your trip',
    'معلم ديني': 'Religious Landmark',
    'تجربة سياحية': 'Tourist Experience',
    'دليل الزيارة': 'Visitor Guide',
    'أبرز المعالم على الخريطة': 'Top Landmarks on the Map',
    'منظّم الزيارة': 'Trip Organizer',
    'اختر الطريقة المناسبة لترتيب محطات رحلتك':
    'Choose how you want to organize your trip',
    'مسار مقترح': 'Suggested Route',
    'اقتراح ترتيب مبدئي للمعالم': 'A suggested order for visiting landmarks',
    'مسار يدوي': 'Custom Route',
    'اختر الأماكن بنفسك': 'Choose places yourself',
    'مسارات شائعة': 'Popular Routes',
    'أفكار لرحلات مقترحة': 'Suggested trip ideas',
    'مساري السابق': 'Previous Route',
    'عرض آخر مسار حفظته': 'View your last saved route',
    'أثر المدينة — دليل استكشافي للزوار': 'Athar Al-Madinah — Visitor Guide',
    'استكشف': 'Explore',
    'اختر التصنيف لاستكشاف الأماكن': 'Choose a category to explore places',
    'استكشف الأماكن': 'Explore Places',
    'ابحث عن مكان...': 'Search for a place...',
    'ابحثي عن مكان...': 'Search for a place...',
    'لا توجد نتائج.': 'No results found.',
    'اختاري الأماكن التي ترغبين بزيارتها': 'Choose the places you want to visit',
    'جميع التصنيفات': 'All Categories',
    'دينية': 'Religious',
    'تاريخية': 'Historical',
    'ثقافية': 'Cultural',
    'طبيعية': 'Natural',
    'إضافة مكان من اختيارك': 'Add Your Own Place',
    'اسم المكان': 'Place Name',
    'وصف المكان': 'Place Description',
    'إضافة المكان': 'Add Place',
    'مكان أضفته بنفسي': 'A place I added',
    'اختاري مكانًا واحدًا على الأقل.': 'Please choose at least one place.',
    'اكتبي اسم المكان أولًا.': 'Please enter the place name first.',
    'عدد الأماكن المختارة:': 'Selected places:',
    'حفظ مساري': 'Save My Route',
    'تم حفظ مسارك بنجاح.': 'Your route has been saved successfully.',
    'عرض المسار على الخريطة': 'View Route on Map',
    'مساراتي السابقة': 'My Previous Routes',
    'عرض المسارات التي حفظتها': 'View your saved routes',
    'المسار المقترح': 'Suggested Route',
    'يمكنك البدء بزيارة أبرز معالم المدينة المنورة.':
    'You can start by visiting the most famous landmarks in Madinah.',
    'اختيار الأماكن بنفسي': 'Choose Places Myself',
    'المسارات الشائعة': 'Popular Routes',
    'المسار الديني': 'Religious Route',
    'المسار التاريخي': 'Historical Route',
    'المسار الثقافي': 'Cultural Route',
    'اختيار المسار': 'Choose Route',
    'لم تحفظ أي مسارات حتى الآن.': 'You have not saved any routes yet.',
    'عرض المسار': 'View Route',
    'أماكن': 'places',
    'خريطة المدينة المنورة': 'Madinah Map',
    'ابحث عن المكان الذي تريد الوصول إليه': 'Search for a place you want to reach',
    'اكتب اسم المكان': 'Enter a place name',
    'بحث في خرائط Google': 'Search on Google Maps',
    'يمكنك البحث عن أي معلم وفتح موقعه في خرائط Google للحصول على الاتجاهات.':
    'Search for any landmark and open it in Google Maps to get directions.',
    'عرض المسجد النبوي': 'View the Prophet’s Mosque',
    'استكشاف معالم المدينة': 'Explore Madinah Landmarks',
    'مرحبًا بك في أثر المدينة': 'Welcome to Athar Al-Madinah',
    'يمكنك تسجيل الدخول أو إنشاء حساب.': 'You can log in or create an account.',
    'تسجيل الدخول': 'Login',
    'إنشاء حساب': 'Create Account',
    'إنشاء حساب جديد': 'Create a New Account',
    'البريد الإلكتروني': 'Email Address',
    'كلمة المرور': 'Password',
    'نسيت كلمة المرور؟': 'Forgot Password?',
    'ليس لديك حساب؟ إنشاء حساب': 'Don’t have an account? Sign Up',
    'أدخلي البريد الإلكتروني وكلمة المرور.': 'Enter your email and password.',
    'هذه نسخة تجريبية من تسجيل الدخول.': 'This is a demo login.',
    'الاسم': 'Name',
    'رقم الجوال': 'Phone Number',
    'فضلاً أكملي جميع البيانات.': 'Please complete all fields.',
    'تم استلام البيانات في النسخة التجريبية.': 'Your information was received in the demo.',
    'استعادة كلمة المرور': 'Reset Password',
    'أدخلي بريدك الإلكتروني لاستعادة كلمة المرور.':
    'Enter your email address to reset your password.',
    'إرسال': 'Send',
    'أدخلي البريد الإلكتروني أولًا.': 'Please enter your email first.',
    'هذه نسخة تجريبية؛ خدمة إرسال البريد غير مفعّلة.':
    'This is a demo; email delivery is not enabled.',
    'رحلتي في المدينة': 'My Madinah Trip',
    'المسجد النبوي': 'The Prophet’s Mosque',
    'مسجد قباء': 'Quba Mosque',
    'مسجد القبلتين': 'The Two Qiblas Mosque',
    'مسجد الجمعة': 'Al-Jumah Mosque',
    'مسجد الغمامة': 'Al-Ghamamah Mosque',
    'مسجد السبع منارات': 'The Seven Minarets Mosque',
    'مسجد أبي بكر الصديق': 'Abu Bakr Al-Siddiq Mosque',
    'مسجد علي بن أبي طالب': 'Ali ibn Abi Talib Mosque',
    'مسجد عمر بن الخطاب': 'Omar ibn Al-Khattab Mosque',
    'مسجد بلال بن رباح': 'Bilal ibn Rabah Mosque',
    'مسجد الإجابة': 'Al-Ijabah Mosque',
    'مسجد المستراح': 'Al-Mustarah Mosque',
    'مسجد السقيا': 'Al-Suqya Mosque',
    'مسجد الدرع': 'Al-Dirah Mosque',
    'مسجد الراية': 'Al-Rayah Mosque',
    'مسجد الفتح': 'Al-Fath Mosque',
    'مسجد سلمان الفارسي': 'Salman Al-Farsi Mosque',
    'مسجد أبي ذر': 'Abu Dharr Mosque',
    'مسجد السجدة': 'As-Sajdah Mosque',
    'مسجد المنارتين': 'The Two Minarets Mosque',
    'جبل أحد': 'Mount Uhud',
    'مقبرة شهداء أحد': 'Uhud Martyrs Cemetery',
    'موقع الخندق': 'The Trench Site',
    'المساجد السبعة': 'The Seven Mosques',
    'سقيفة بني ساعدة': 'Saqifah Bani Saidah',
    'بئر غرس': 'Gharas Well',
    'بئر عثمان': 'Uthman Well',
    'بئر حاء': 'Haa Well',
    'محطة سكة الحجاز القديمة': 'Old Hejaz Railway Station',
    'قلعة قباء': 'Quba Castle',
    'حي المغيسلة': 'Al-Maghisilah District',
    'حي العيون': 'Al-Oyoun District',
    'حي العنبرية': 'Al-Anbariyah District',
    'ميدان سيد الشهداء': 'Sayyid Al-Shuhada Square',
    'متحف دار المدينة': 'Dar Al-Madinah Museum',
    'متحف سكة الحجاز': 'Hejaz Railway Museum',
    'متحف المدينة المنورة': 'Madinah Museum',
    'متحف القرآن الكريم': 'Holy Quran Museum',
    'متحف وبستان الصافية': 'Al-Safiyah Museum and Garden',
    'معرض أسماء الله الحسنى': 'Names of Allah Exhibition',
    'معرض عمارة المسجد النبوي': 'Prophet’s Mosque Architecture Exhibition',
    'مركز بحوث ودراسات المدينة': 'Madinah Research and Studies Center',
    'سوق التمور المركزي': 'Central Dates Market',
    'سوق قباء': 'Quba Market',
    'سوق المناخة': 'Al-Manakhah Market',
    'مركز المدينة للفنون': 'Madinah Arts Center',
    'جبل الرماة': 'Mount Archers',
    'جبل عير': 'Mount Ayr',
    'جبل سلع': 'Mount Sala',
    'جبل الجماوات': 'Al-Jamawat Mountains',
    'حديقة الملك فهد المركزية': 'King Fahd Central Park',
    'حديقة جبل أحد': 'Mount Uhud Park',
    'حديقة الأمير محمد بن عبدالعزيز': 'Prince Mohammed bin Abdulaziz Park',
    'حديقة النخيل': 'Palm Garden',
    'حديقة قباء': 'Quba Park',
    'حديقة الأراك': 'Al-Arak Park',
    'وادي العقيق': 'Al-Aqiq Valley',
    'وادي بطحان': 'Bathhan Valley',
    'مزارع النخيل': 'Palm Farms',
    'مزارع العيون': 'Al-Oyoun Farms',
    'مزارع قباء': 'Quba Farms',
    'مزارع العاقول': 'Al-Aqoul Farms',
    'منتزه البيضاء البري': 'Al-Bayda Wild Park',
    'منتزهات المدينة البرية': 'Madinah Wilderness Parks',
    'بساتين المدينة': 'Madinah Orchards',
    'أبرز معالم المدينة المنورة': 'Top Landmarks of Madinah',
    'رحلة تترك في القلب أثرًا': 'A journey that leaves a lasting impression',
    'أحد أبرز معالم المدينة المنورة.': 'One of Madinah’s most prominent landmarks.',
    'من أشهر المساجد التاريخية في المدينة.': 'One of Madinah’s well-known historic mosques.',
    'تعرّف على خيارات الجولات السياحية ومواقفها.': 'Explore sightseeing tour options and their stops.',
    'افتح خريطة تفاعلية للمعالم في المدينة.': 'Open a map to explore Madinah’s landmarks.',
    'المسجد النبوي، قباء، القبلتين.': 'The Prophet’s Mosque, Quba, and the Two Qiblas Mosque.',
    'جبل أحد، شهداء أحد، المساجد السبعة.': 'Mount Uhud, Uhud Martyrs, and the Seven Mosques.',
    'متحف دار المدينة، محطة الحجاز، سوق التمور.': 'Dar Al-Madinah Museum, Hejaz Station, and the Dates Market.',
    'مكان مضاف': 'Added place',
    'الدخول حسب المزرعة': 'Access depends on the farm.',
    'الدخول حسب الموقع': 'Access depends on the location.',
    'بئر بئر رومة التاريخي': 'The historic Rumah Well.',
    'بئر تاريخي': 'Historic well.',
    'تجربة تسوق محلية': 'A local shopping experience.',
    'تجربة ثقافية وتراثية': 'A cultural and heritage experience.',
    'تحقق من إمكانية الزيارة': 'Check visitor access before going.',
    'تحقق من الاسم والإتاحة': 'Verify the name and availability.',
    'تحقق من الاسم والموقع': 'Verify the name and location.',
    'تحقق من الاسم والموقع قبل الزيارة': 'Verify the name and location before visiting.',
    'تحقق من الفعاليات الحالية': 'Check current events.',
    'تحقق من المواقع المتاحة': 'Check which locations are available.',
    'تحقق من الموقع': 'Verify the location.',
    'تحقق من الموقع والإتاحة': 'Verify the location and visitor access.',
    'حي من أحياء المدينة القديمة': 'A neighborhood in old Madinah.',
    'سوق شعبي وتجاري': 'A traditional commercial market.',
    'ضمن منطقة المساجد السبعة': 'Located in the Seven Mosques area.',
    'ضمن مواقع الخندق': 'Part of the Trench historical sites.',
    'متحف في محطة الحجاز': 'A museum in the Hejaz Railway Station.',
    'متحف للتاريخ والتراث': 'A museum dedicated to history and heritage.',
    'مجموعة مساجد تاريخية': 'A group of historic mosques.',
    'محطة تاريخية': 'A historic station.',
    'مرتبط بالسيرة النبوية': 'Associated with the Prophet’s biography.',
    'مركز معرفي وتاريخي': 'A research and historical center.',
    'مساحة خضراء للتنزه': 'A green space for leisure.',
    'مسجد تاريخي': 'A historic mosque.',
    'مسجد تاريخي معروف': 'A well-known historic mosque.',
    'مسجد معروف': 'A well-known mosque.',
    'معرض ثقافي': 'A cultural exhibition.',
    'معرض ومحتوى عن القرآن الكريم': 'An exhibition about the Holy Quran.',
    'من أحياء المدينة': 'One of Madinah’s neighborhoods.',
    'من أودية المدينة': 'One of Madinah’s valleys.',
    'من الجبال المعروفة': 'One of the well-known mountains.',
    'من المساجد التاريخية': 'One of the historic mosques.',
    'من المساجد المعروفة': 'One of the well-known mosques.',
    'من المناطق التاريخية': 'One of the historic areas.',
    'من المواقع المرتبطة بغزوة الخندق': 'Associated with the Battle of the Trench.',
    'من جبال المدينة': 'One of Madinah’s mountains.',
    'منطقة تاريخية قرب جبل أحد': 'A historic area near Mount Uhud.',
    'منطقة تجارية تاريخية': 'A historic commercial area.',
    'منطقة جبلية قرب أحد': 'A mountainous area near Uhud.',
    'منطقة طبيعية خارج المدينة': 'A natural area outside the city.',
    'منطقة مفتوحة للتنزه': 'An open recreational area.',
    'موقع تاريخي': 'A historic site.',
    'موقع تاريخي في المدينة': 'A historic site in Madinah.',
    'موقع تاريخي مرتبط بغزوة أحد': 'A historic site associated with the Battle of Uhud.',
    'موقع تاريخي وطبيعي': 'A site of historical and natural significance.',
    'موقع تراثي': 'A heritage site.',
    'موقع ديني': 'A religious site.',
    'موقع غزوة أحد': 'The site of the Battle of Uhud.',
    'موقع مرتبط بالسيرة': 'A site associated with the Prophet’s biography.',
    'وادٍ معروف في المدينة': 'A well-known valley in Madinah.',
    'يعرض تاريخ العمارة والتوسعات': 'Showcases the history of architecture and expansions.',
    'يعرض تاريخ المدينة والسيرة': 'Showcases Madinah’s history and the Prophet’s biography.',
    'إنشاء الحساب': 'Create Account',
    '↺ مساري السابق': 'Previous Route',
    '★ مسارات شائعة': 'Popular Routes',
    '✨ مسار مقترح': 'Suggested Route',
    '＋ مسار يدوي': 'Custom Route',
    'الباص السياحي': 'Tourist Bus',
  },

  'id': {
    'أثر المدينة': 'Athar Al Madinah',
    'الرئيسية': 'Beranda',
    'المعالم': 'Tempat Wisata',
    'رحلتي': 'Perjalanan Saya',
    'الخريطة': 'Peta',
    'حسابي': 'Akun Saya',
    'اللغة': 'Bahasa',
    'دخول': 'Masuk',
    'اكتشف المدينة المنورة': 'Jelajahi Madinah',
    'تعرّف على معالمها الدينية والتاريخية والثقافية، وخطّط لرحلة تترك أثرًا لا يُنسى.':
    'Jelajahi tempat religius, sejarah, dan budaya Madinah, lalu rencanakan perjalanan yang berkesan.',
    'خطّط لرحلتك': 'Rencanakan Perjalanan',
    'اكتشف المدينة': 'Jelajahi Madinah',
    'اختر نوع الأماكن التي ترغب بزيارتها': 'Pilih jenis tempat yang ingin Anda kunjungi',
    'معالم دينية': 'Tempat Religius',
    'معالم تاريخية': 'Tempat Bersejarah',
    'متاحف وثقافة': 'Museum dan Budaya',
    'أماكن طبيعية': 'Tempat Alam',
    'المساجد والمواقع المرتبطة بالسيرة النبوية.':
    'Masjid dan tempat yang berkaitan dengan sejarah Nabi.',
    'مواقع وأحداث من تاريخ المدينة.': 'Tempat dan peristiwa dari sejarah Madinah.',
    'متاحف وتجارب ثقافية وتراثية.': 'Museum dan pengalaman budaya.',
    'جبال وحدائق ومزارع وأماكن مفتوحة.': 'Pegunungan, taman, perkebunan, dan ruang terbuka.',
    'أماكن لا تفوّت زيارتها': 'Tempat yang Wajib Dikunjungi',
    'أبرز المحطات التي يمكنك إضافتها إلى رحلتك':
    'Tempat utama yang dapat ditambahkan ke perjalanan Anda',
    'معلم ديني': 'Tempat Religius',
    'تجربة سياحية': 'Pengalaman Wisata',
    'دليل الزيارة': 'Panduan Wisata',
    'أبرز المعالم على الخريطة': 'Tempat Utama di Peta',
    'منظّم الزيارة': 'Pengatur Perjalanan',
    'اختر الطريقة المناسبة لترتيب محطات رحلتك':
    'Pilih cara untuk mengatur perjalanan Anda',
    'مسار مقترح': 'Rute yang Disarankan',
    'اقتراح ترتيب مبدئي للمعالم': 'Urutan kunjungan yang disarankan',
    'مسار يدوي': 'Rute Manual',
    'اختر الأماكن بنفسك': 'Pilih tempat sendiri',
    'مسارات شائعة': 'Rute Populer',
    'أفكار لرحلات مقترحة': 'Ide perjalanan yang disarankan',
    'مساري السابق': 'Rute Sebelumnya',
    'عرض آخر مسار حفظته': 'Lihat rute terakhir yang disimpan',
    'أثر المدينة — دليل استكشافي للزوار': 'Athar Al-Madinah — Panduan Pengunjung',
    'استكشف': 'Jelajahi',
    'اختر التصنيف لاستكشاف الأماكن': 'Pilih kategori untuk menjelajahi tempat',
    'استكشف الأماكن': 'Jelajahi Tempat',
    'ابحث عن مكان...': 'Cari tempat...',
    'ابحثي عن مكان...': 'Cari tempat...',
    'لا توجد نتائج.': 'Tidak ada hasil.',
    'اختاري الأماكن التي ترغبين بزيارتها': 'Pilih tempat yang ingin Anda kunjungi',
    'جميع التصنيفات': 'Semua Kategori',
    'دينية': 'Religius',
    'تاريخية': 'Bersejarah',
    'ثقافية': 'Budaya',
    'طبيعية': 'Alam',
    'إضافة مكان من اختيارك': 'Tambahkan Tempat Sendiri',
    'اسم المكان': 'Nama Tempat',
    'وصف المكان': 'Deskripsi Tempat',
    'إضافة المكان': 'Tambah Tempat',
    'مكان أضفته بنفسي': 'Tempat yang saya tambahkan',
    'اختاري مكانًا واحدًا على الأقل.': 'Pilih setidaknya satu tempat.',
    'اكتبي اسم المكان أولًا.': 'Masukkan nama tempat terlebih dahulu.',
    'عدد الأماكن المختارة:': 'Jumlah tempat yang dipilih:',
    'حفظ مساري': 'Simpan Rute Saya',
    'تم حفظ مسارك بنجاح.': 'Rute Anda berhasil disimpan.',
    'عرض المسار على الخريطة': 'Lihat Rute di Peta',
    'مساراتي السابقة': 'Rute Sebelumnya',
    'عرض المسارات التي حفظتها': 'Lihat rute yang disimpan',
    'المسار المقترح': 'Rute yang Disarankan',
    'يمكنك البدء بزيارة أبرز معالم المدينة المنورة.':
    'Anda dapat mulai mengunjungi tempat-tempat terkenal di Madinah.',
    'اختيار الأماكن بنفسي': 'Pilih Tempat Sendiri',
    'المسارات الشائعة': 'Rute Populer',
    'المسار الديني': 'Rute Religius',
    'المسار التاريخي': 'Rute Sejarah',
    'المسار الثقافي': 'Rute Budaya',
    'اختيار المسار': 'Pilih Rute',
    'لم تحفظ أي مسارات حتى الآن.': 'Anda belum menyimpan rute apa pun.',
    'عرض المسار': 'Lihat Rute',
    'أماكن': 'tempat',
    'خريطة المدينة المنورة': 'Peta Madinah',
    'ابحث عن المكان الذي تريد الوصول إليه': 'Cari tempat tujuan Anda',
    'اكتب اسم المكان': 'Masukkan nama tempat',
    'بحث في خرائط Google': 'Cari di Google Maps',
    'يمكنك البحث عن أي معلم وفتح موقعه في خرائط Google للحصول على الاتجاهات.':
    'Cari tempat dan buka Google Maps untuk mendapatkan petunjuk arah.',
    'عرض المسجد النبوي': 'Lihat Masjid Nabawi',
    'استكشاف معالم المدينة': 'Jelajahi Tempat Wisata Madinah',
    'مرحبًا بك في أثر المدينة': 'Selamat Datang di Athar Al-Madinah',
    'يمكنك تسجيل الدخول أو إنشاء حساب.': 'Anda dapat masuk atau membuat akun.',
    'تسجيل الدخول': 'Masuk',
    'إنشاء حساب': 'Buat Akun',
    'إنشاء حساب جديد': 'Buat Akun Baru',
    'البريد الإلكتروني': 'Email',
    'كلمة المرور': 'Kata Sandi',
    'نسيت كلمة المرور؟': 'Lupa Kata Sandi?',
    'ليس لديك حساب؟ إنشاء حساب': 'Belum punya akun? Daftar',
    'أدخلي البريد الإلكتروني وكلمة المرور.': 'Masukkan email dan kata sandi.',
    'هذه نسخة تجريبية من تسجيل الدخول.': 'Ini adalah versi demo login.',
    'الاسم': 'Nama',
    'رقم الجوال': 'Nomor Telepon',
    'فضلاً أكملي جميع البيانات.': 'Harap lengkapi semua data.',
    'تم استلام البيانات في النسخة التجريبية.': 'Data diterima dalam versi demo.',
    'استعادة كلمة المرور': 'Atur Ulang Kata Sandi',
    'أدخلي بريدك الإلكتروني لاستعادة كلمة المرور.':
    'Masukkan email untuk mengatur ulang kata sandi.',
    'إرسال': 'Kirim',
    'أدخلي البريد الإلكتروني أولًا.': 'Masukkan email terlebih dahulu.',
    'هذه نسخة تجريبية؛ خدمة إرسال البريد غير مفعّلة.':
    'Ini versi demo; layanan email belum aktif.',
    'رحلتي في المدينة': 'Perjalanan Saya di Madinah',
    'المسجد النبوي': 'Masjid Nabawi',
    'مسجد قباء': 'Masjid Quba',
    'مسجد القبلتين': 'Masjid Qiblatain',
    'مسجد الجمعة': 'Masjid Jumat',
    'مسجد الغمامة': 'Masjid Ghamamah',
    'مسجد السبع منارات': 'Masjid Tujuh Menara',
    'مسجد أبي بكر الصديق': 'Masjid Abu Bakar',
    'مسجد علي بن أبي طالب': 'Masjid Ali bin Abi Talib',
    'مسجد عمر بن الخطاب': 'Masjid Umar bin Khattab',
    'مسجد بلال بن رباح': 'Masjid Bilal bin Rabah',
    'مسجد الإجابة': 'Masjid Ijabah',
    'مسجد المستراح': 'Masjid Mustarah',
    'مسجد السقيا': 'Masjid Suqya',
    'مسجد الدرع': 'Masjid Dirah',
    'مسجد الراية': 'Masjid Rayah',
    'مسجد الفتح': 'Masjid Fath',
    'مسجد سلمان الفارسي': 'Masjid Salman Al-Farisi',
    'مسجد أبي ذر': 'Masjid Abu Dharr',
    'مسجد السجدة': 'Masjid Sajdah',
    'مسجد المنارتين': 'Masjid Dua Menara',
    'جبل أحد': 'Gunung Uhud',
    'مقبرة شهداء أحد': 'Pemakaman Syuhada Uhud',
    'موقع الخندق': 'Lokasi Parit',
    'المساجد السبعة': 'Tujuh Masjid',
    'سقيفة بني ساعدة': 'Saqifah Bani Saidah',
    'بئر غرس': 'Sumur Gharas',
    'بئر عثمان': 'Sumur Utsman',
    'بئر حاء': 'Sumur Haa',
    'محطة سكة الحجاز القديمة': 'Stasiun Kereta Hejaz Lama',
    'قلعة قباء': 'Benteng Quba',
    'حي المغيسلة': 'Kawasan Maghisilah',
    'حي العيون': 'Kawasan Oyoun',
    'حي العنبرية': 'Kawasan Anbariyah',
    'ميدان سيد الشهداء': 'Lapangan Sayyid Al-Shuhada',
    'متحف دار المدينة': 'Museum Dar Al-Madinah',
    'متحف سكة الحجاز': 'Museum Kereta Hejaz',
    'متحف المدينة المنورة': 'Museum Madinah',
    'متحف القرآن الكريم': 'Museum Al-Quran',
    'متحف وبستان الصافية': 'Museum dan Taman Safiyah',
    'معرض أسماء الله الحسنى': 'Pameran Asmaul Husna',
    'معرض عمارة المسجد النبوي': 'Pameran Arsitektur Masjid Nabawi',
    'مركز بحوث ودراسات المدينة': 'Pusat Penelitian Madinah',
    'سوق التمور المركزي': 'Pasar Kurma Sentral',
    'سوق قباء': 'Pasar Quba',
    'سوق المناخة': 'Pasar Manakhah',
    'مركز المدينة للفنون': 'Pusat Seni Madinah',
    'جبل الرماة': 'Gunung Pemanah',
    'جبل عير': 'Gunung Ayr',
    'جبل سلع': 'Gunung Sala',
    'جبل الجماوات': 'Pegunungan Jamawat',
    'حديقة الملك فهد المركزية': 'Taman Pusat Raja Fahd',
    'حديقة جبل أحد': 'Taman Gunung Uhud',
    'حديقة الأمير محمد بن عبدالعزيز': 'Taman Pangeran Mohammed bin Abdulaziz',
    'حديقة النخيل': 'Taman Kurma',
    'حديقة قباء': 'Taman Quba',
    'حديقة الأراك': 'Taman Arak',
    'وادي العقيق': 'Lembah Aqiq',
    'وادي بطحان': 'Lembah Bathhan',
    'مزارع النخيل': 'Perkebunan Kurma',
    'مزارع العيون': 'Perkebunan Oyoun',
    'مزارع قباء': 'Perkebunan Quba',
    'مزارع العاقول': 'Perkebunan Aqoul',
    'منتزه البيضاء البري': 'Taman Alam Al-Bayda',
    'منتزهات المدينة البرية': 'Taman Alam Madinah',
    'بساتين المدينة': 'Kebun Madinah',
    'أبرز معالم المدينة المنورة': 'Tempat Terkenal di Madinah',
    'رحلة تترك في القلب أثرًا': 'Perjalanan yang meninggalkan kesan di hati',
    'أحد أبرز معالم المدينة المنورة.': 'Salah satu landmark paling terkenal di Madinah.',
    'من أشهر المساجد التاريخية في المدينة.': 'Salah satu masjid bersejarah terkenal di Madinah.',
    'تعرّف على خيارات الجولات السياحية ومواقفها.': 'Kenali pilihan tur wisata dan titik pemberhentiannya.',
    'افتح خريطة تفاعلية للمعالم في المدينة.': 'Buka peta untuk menjelajahi landmark Madinah.',
    'المسجد النبوي، قباء، القبلتين.': 'Masjid Nabawi, Quba, dan Qiblatain.',
    'جبل أحد، شهداء أحد، المساجد السبعة.': 'Gunung Uhud, Syuhada Uhud, dan Tujuh Masjid.',
    'متحف دار المدينة، محطة الحجاز، سوق التمور.': 'Museum Dar Al-Madinah, Stasiun Hejaz, dan Pasar Kurma.',
    'مكان مضاف': 'Tempat tambahan',
    'الدخول حسب المزرعة': 'Akses bergantung pada kebun.',
    'الدخول حسب الموقع': 'Akses bergantung pada lokasi.',
    'بئر بئر رومة التاريخي': 'Sumur Rumah yang bersejarah.',
    'بئر تاريخي': 'Sumur bersejarah.',
    'تجربة تسوق محلية': 'Pengalaman berbelanja lokal.',
    'تجربة ثقافية وتراثية': 'Pengalaman budaya dan warisan.',
    'تحقق من إمكانية الزيارة': 'Periksa akses pengunjung sebelum datang.',
    'تحقق من الاسم والإتاحة': 'Pastikan nama dan ketersediaannya.',
    'تحقق من الاسم والموقع': 'Pastikan nama dan lokasinya.',
    'تحقق من الاسم والموقع قبل الزيارة': 'Pastikan nama dan lokasi sebelum berkunjung.',
    'تحقق من الفعاليات الحالية': 'Periksa acara yang sedang berlangsung.',
    'تحقق من المواقع المتاحة': 'Periksa lokasi yang tersedia.',
    'تحقق من الموقع': 'Pastikan lokasinya.',
    'تحقق من الموقع والإتاحة': 'Pastikan lokasi dan akses pengunjung.',
    'حي من أحياء المدينة القديمة': 'Salah satu kawasan di Madinah lama.',
    'سوق شعبي وتجاري': 'Pasar tradisional dan komersial.',
    'ضمن منطقة المساجد السبعة': 'Berada di kawasan Tujuh Masjid.',
    'ضمن مواقع الخندق': 'Termasuk kawasan bersejarah Perang Khandaq.',
    'متحف في محطة الحجاز': 'Museum di Stasiun Kereta Hejaz.',
    'متحف للتاريخ والتراث': 'Museum sejarah dan warisan budaya.',
    'مجموعة مساجد تاريخية': 'Sekumpulan masjid bersejarah.',
    'محطة تاريخية': 'Stasiun bersejarah.',
    'مرتبط بالسيرة النبوية': 'Berkaitan dengan sirah Nabi.',
    'مركز معرفي وتاريخي': 'Pusat penelitian dan sejarah.',
    'مساحة خضراء للتنزه': 'Ruang hijau untuk rekreasi.',
    'مسجد تاريخي': 'Masjid bersejarah.',
    'مسجد تاريخي معروف': 'Masjid bersejarah yang terkenal.',
    'مسجد معروف': 'Masjid yang dikenal.',
    'معرض ثقافي': 'Pameran budaya.',
    'معرض ومحتوى عن القرآن الكريم': 'Pameran dan informasi tentang Al-Qur’an.',
    'من أحياء المدينة': 'Salah satu kawasan Madinah.',
    'من أودية المدينة': 'Salah satu lembah Madinah.',
    'من الجبال المعروفة': 'Salah satu gunung yang dikenal.',
    'من المساجد التاريخية': 'Salah satu masjid bersejarah.',
    'من المساجد المعروفة': 'Salah satu masjid yang dikenal.',
    'من المناطق التاريخية': 'Salah satu kawasan bersejarah.',
    'من المواقع المرتبطة بغزوة الخندق': 'Berkaitan dengan Perang Khandaq.',
    'من جبال المدينة': 'Salah satu gunung di Madinah.',
    'منطقة تاريخية قرب جبل أحد': 'Kawasan bersejarah dekat Gunung Uhud.',
    'منطقة تجارية تاريخية': 'Kawasan perdagangan bersejarah.',
    'منطقة جبلية قرب أحد': 'Kawasan pegunungan dekat Uhud.',
    'منطقة طبيعية خارج المدينة': 'Kawasan alam di luar kota.',
    'منطقة مفتوحة للتنزه': 'Area terbuka untuk rekreasi.',
    'موقع تاريخي': 'Situs bersejarah.',
    'موقع تاريخي في المدينة': 'Situs bersejarah di Madinah.',
    'موقع تاريخي مرتبط بغزوة أحد': 'Situs bersejarah yang berkaitan dengan Perang Uhud.',
    'موقع تاريخي وطبيعي': 'Tempat dengan nilai sejarah dan alam.',
    'موقع تراثي': 'Situs warisan budaya.',
    'موقع ديني': 'Tempat keagamaan.',
    'موقع غزوة أحد': 'Lokasi Perang Uhud.',
    'موقع مرتبط بالسيرة': 'Tempat yang berkaitan dengan sirah Nabi.',
    'وادٍ معروف في المدينة': 'Lembah terkenal di Madinah.',
    'يعرض تاريخ العمارة والتوسعات': 'Menampilkan sejarah arsitektur dan perluasan.',
    'يعرض تاريخ المدينة والسيرة': 'Menampilkan sejarah Madinah dan sirah Nabi.',
    'إنشاء الحساب': 'Buat Akun',
    '↺ مساري السابق': 'Rute Sebelumnya',
    '★ مسارات شائعة': 'Rute Populer',
    '✨ مسار مقترح': 'Rute yang Disarankan',
    '＋ مسار يدوي': 'Rute Manual',
    'الباص السياحي': 'Bus Wisata',
  },

  'ur': {
    'أثر المدينة': 'اثر المدینہ',
    'الرئيسية': 'صفحۂ اول',
    'المعالم': 'مشہور مقامات',
    'رحلتي': 'میرا سفر',
    'الخريطة': 'نقشہ',
    'حسابي': 'میرا اکاؤنٹ',
    'اللغة': 'زبان',
    'دخول': 'لاگ اِن',
    'اكتشف المدينة المنورة': 'مدینہ منورہ دریافت کریں',
    'تعرّف على معالمها الدينية والتاريخية والثقافية، وخطّط لرحلة تترك أثرًا لا يُنسى.':
    'مدینہ کے مذہبی، تاریخی اور ثقافتی مقامات دریافت کریں اور ایک یادگار سفر کی منصوبہ بندی کریں۔',
    'خطّط لرحلتك': 'اپنے سفر کی منصوبہ بندی کریں',
    'اكتشف المدينة': 'مدینہ دریافت کریں',
    'اختر نوع الأماكن التي ترغب بزيارتها': 'اپنی پسند کی جگہوں کی قسم منتخب کریں',
    'معالم دينية': 'مذہبی مقامات',
    'معالم تاريخية': 'تاریخی مقامات',
    'متاحف وثقافة': 'عجائب گھر اور ثقافت',
    'أماكن طبيعية': 'قدرتی مقامات',
    'المساجد والمواقع المرتبطة بالسيرة النبوية.':
    'مساجد اور سیرتِ نبوی سے متعلق مقامات۔',
    'مواقع وأحداث من تاريخ المدينة.': 'مدینہ کی تاریخ کے مقامات اور واقعات۔',
    'متاحف وتجارب ثقافية وتراثية.': 'عجائب گھر اور ثقافتی و تاریخی تجربات۔',
    'جبال وحدائق ومزارع وأماكن مفتوحة.': 'پہاڑ، باغات، کھیت اور کھلی جگہیں۔',
    'أماكن لا تفوّت زيارتها': 'وہ مقامات جہاں جانا ضروری ہے',
    'أبرز المحطات التي يمكنك إضافتها إلى رحلتك':
    'اہم مقامات جنہیں آپ اپنے سفر میں شامل کر سکتے ہیں',
    'معلم ديني': 'مذہبی مقام',
    'تجربة سياحية': 'سیاحتی تجربہ',
    'دليل الزيارة': 'سیاحتی رہنما',
    'أبرز المعالم على الخريطة': 'نقشے پر اہم مقامات',
    'منظّم الزيارة': 'سفر کا منتظم',
    'اختر الطريقة المناسبة لترتيب محطات رحلتك':
    'اپنے سفر کے مقامات ترتیب دینے کا طریقہ منتخب کریں',
    'مسار مقترح': 'تجویز کردہ راستہ',
    'اقتراح ترتيب مبدئي للمعالم': 'مقامات کی ابتدائی ترتیب کی تجویز',
    'مسار يدوي': 'اپنا راستہ بنائیں',
    'اختر الأماكن بنفسك': 'اپنی پسند کے مقامات منتخب کریں',
    'مسارات شائعة': 'مشہور راستے',
    'أفكار لرحلات مقترحة': 'تجویز کردہ سفری منصوبے',
    'مساري السابق': 'میرا پچھلا راستہ',
    'عرض آخر مسار حفظته': 'محفوظ کردہ آخری راستہ دیکھیں',
    'أثر المدينة — دليل استكشافي للزوار': 'اثر المدینہ — زائرین کے لیے رہنما',
    'استكشف': 'دریافت کریں',
    'اختر التصنيف لاستكشاف الأماكن': 'مقامات دیکھنے کے لیے زمرہ منتخب کریں',
    'استكشف الأماكن': 'مقامات دریافت کریں',
    'ابحث عن مكان...': 'جگہ تلاش کریں...',
    'ابحثي عن مكان...': 'جگہ تلاش کریں...',
    'لا توجد نتائج.': 'کوئی نتائج نہیں ملے۔',
    'اختاري الأماكن التي ترغبين بزيارتها': 'اپنی پسند کے مقامات منتخب کریں',
    'جميع التصنيفات': 'تمام زمرے',
    'دينية': 'مذہبی',
    'تاريخية': 'تاریخی',
    'ثقافية': 'ثقافتی',
    'طبيعية': 'قدرتی',
    'إضافة مكان من اختيارك': 'اپنی پسند کی جگہ شامل کریں',
    'اسم المكان': 'جگہ کا نام',
    'وصف المكان': 'جگہ کی تفصیل',
    'إضافة المكان': 'جگہ شامل کریں',
    'مكان أضفته بنفسي': 'میری شامل کردہ جگہ',
    'اختاري مكانًا واحدًا على الأقل.': 'کم از کم ایک جگہ منتخب کریں۔',
    'اكتبي اسم المكان أولًا.': 'پہلے جگہ کا نام لکھیں۔',
    'عدد الأماكن المختارة:': 'منتخب کردہ مقامات کی تعداد:',
    'حفظ مساري': 'اپنا راستہ محفوظ کریں',
    'تم حفظ مسارك بنجاح.': 'آپ کا راستہ کامیابی سے محفوظ ہوگیا۔',
    'عرض المسار على الخريطة': 'نقشے پر راستہ دیکھیں',
    'مساراتي السابقة': 'میرے پچھلے راستے',
    'عرض المسارات التي حفظتها': 'محفوظ کردہ راستے دیکھیں',
    'المسار المقترح': 'تجویز کردہ راستہ',
    'يمكنك البدء بزيارة أبرز معالم المدينة المنورة.':
    'آپ مدینہ منورہ کے مشہور مقامات کی سیر سے آغاز کر سکتے ہیں۔',
    'اختيار الأماكن بنفسي': 'اپنی پسند کے مقامات منتخب کریں',
    'المسارات الشائعة': 'مشہور راستے',
    'المسار الديني': 'مذہبی راستہ',
    'المسار التاريخي': 'تاریخی راستہ',
    'المسار الثقافي': 'ثقافتی راستہ',
    'اختيار المسار': 'راستہ منتخب کریں',
    'لم تحفظ أي مسارات حتى الآن.': 'آپ نے ابھی تک کوئی راستہ محفوظ نہیں کیا۔',
    'عرض المسار': 'راستہ دیکھیں',
    'أماكن': 'مقامات',
    'خريطة المدينة المنورة': 'مدینہ منورہ کا نقشہ',
    'ابحث عن المكان الذي تريد الوصول إليه': 'اپنی منزل تلاش کریں',
    'اكتب اسم المكان': 'جگہ کا نام لکھیں',
    'بحث في خرائط Google': 'گوگل میپس پر تلاش کریں',
    'يمكنك البحث عن أي معلم وفتح موقعه في خرائط Google للحصول على الاتجاهات.':
    'کسی بھی مقام کو تلاش کریں اور راستہ معلوم کرنے کے لیے گوگل میپس کھولیں۔',
    'عرض المسجد النبوي': 'مسجد نبوی دیکھیں',
    'استكشاف معالم المدينة': 'مدینہ کے مقامات دریافت کریں',
    'مرحبًا بك في أثر المدينة': 'اثر المدینہ میں خوش آمدید',
    'يمكنك تسجيل الدخول أو إنشاء حساب.': 'آپ لاگ اِن یا نیا اکاؤنٹ بنا سکتے ہیں۔',
    'تسجيل الدخول': 'لاگ اِن',
    'إنشاء حساب': 'اکاؤنٹ بنائیں',
    'إنشاء حساب جديد': 'نیا اکاؤنٹ بنائیں',
    'البريد الإلكتروني': 'ای میل',
    'كلمة المرور': 'پاس ورڈ',
    'نسيت كلمة المرور؟': 'پاس ورڈ بھول گئے؟',
    'ليس لديك حساب؟ إنشاء حساب': 'اکاؤنٹ نہیں ہے؟ نیا اکاؤنٹ بنائیں',
    'أدخلي البريد الإلكتروني وكلمة المرور.': 'ای میل اور پاس ورڈ درج کریں۔',
    'هذه نسخة تجريبية من تسجيل الدخول.': 'یہ لاگ اِن کا آزمائشی ورژن ہے۔',
    'الاسم': 'نام',
    'رقم الجوال': 'موبائل نمبر',
    'فضلاً أكملي جميع البيانات.': 'براہ کرم تمام معلومات مکمل کریں۔',
    'تم استلام البيانات في النسخة التجريبية.': 'آزمائشی ورژن میں معلومات موصول ہوگئیں۔',
    'استعادة كلمة المرور': 'پاس ورڈ بحال کریں',
    'أدخلي بريدك الإلكتروني لاستعادة كلمة المرور.':
    'پاس ورڈ بحال کرنے کے لیے اپنا ای میل درج کریں۔',
    'إرسال': 'بھیجیں',
    'أدخلي البريد الإلكتروني أولًا.': 'پہلے اپنا ای میل درج کریں۔',
    'هذه نسخة تجريبية؛ خدمة إرسال البريد غير مفعّلة.':
    'یہ آزمائشی ورژن ہے؛ ای میل بھیجنے کی سہولت فعال نہیں ہے۔',
    'رحلتي في المدينة': 'مدینہ میں میرا سفر',
    'المسجد النبوي': 'مسجد نبوی',
    'مسجد قباء': 'مسجد قباء',
    'مسجد القبلتين': 'مسجد قبلتین',
    'مسجد الجمعة': 'مسجد جمعہ',
    'مسجد الغمامة': 'مسجد غمامہ',
    'مسجد السبع منارات': 'سات میناروں والی مسجد',
    'مسجد أبي بكر الصديق': 'مسجد ابوبکر صدیق',
    'مسجد علي بن أبي طالب': 'مسجد علی بن ابی طالب',
    'مسجد عمر بن الخطاب': 'مسجد عمر بن خطاب',
    'مسجد بلال بن رباح': 'مسجد بلال بن رباح',
    'مسجد الإجابة': 'مسجد اجابہ',
    'مسجد المستراح': 'مسجد مستراح',
    'مسجد السقيا': 'مسجد سقیا',
    'مسجد الدرع': 'مسجد درع',
    'مسجد الراية': 'مسجد رایا',
    'مسجد الفتح': 'مسجد فتح',
    'مسجد سلمان الفارسي': 'مسجد سلمان فارسی',
    'مسجد أبي ذر': 'مسجد ابوذر',
    'مسجد السجدة': 'مسجد سجدہ',
    'مسجد المنارتين': 'دو میناروں والی مسجد',
    'جبل أحد': 'جبل احد',
    'مقبرة شهداء أحد': 'شہدائے احد کا قبرستان',
    'موقع الخندق': 'مقام خندق',
    'المساجد السبعة': 'سات مساجد',
    'سقيفة بني ساعدة': 'سقیفہ بنی ساعدہ',
    'بئر غرس': 'بئر غرس',
    'بئر عثمان': 'بئر عثمان',
    'بئر حاء': 'بئر حاء',
    'محطة سكة الحجاز القديمة': 'پرانا حجاز ریلوے اسٹیشن',
    'قلعة قباء': 'قلعہ قباء',
    'حي المغيسلة': 'محلہ مغیسلہ',
    'حي العيون': 'محلہ العیون',
    'حي العنبرية': 'محلہ عنبریہ',
    'ميدان سيد الشهداء': 'میدان سید الشہداء',
    'متحف دار المدينة': 'دار المدینہ میوزیم',
    'متحف سكة الحجاز': 'حجاز ریلوے میوزیم',
    'متحف المدينة المنورة': 'مدینہ منورہ میوزیم',
    'متحف القرآن الكريم': 'قرآن کریم میوزیم',
    'متحف وبستان الصافية': 'میوزیم اور باغ صفیہ',
    'معرض أسماء الله الحسنى': 'اسمائے حسنیٰ نمائش',
    'معرض عمارة المسجد النبوي': 'مسجد نبوی کے فن تعمیر کی نمائش',
    'مركز بحوث ودراسات المدينة': 'مدینہ تحقیق و مطالعات مرکز',
    'سوق التمور المركزي': 'مرکزی کھجور بازار',
    'سوق قباء': 'قباء بازار',
    'سوق المناخة': 'مناخہ بازار',
    'مركز المدينة للفنون': 'مدینہ آرٹس سینٹر',
    'جبل الرماة': 'جبل الرماۃ',
    'جبل عير': 'جبل عیر',
    'جبل سلع': 'جبل سلع',
    'جبل الجماوات': 'جبال جماوات',
    'حديقة الملك فهد المركزية': 'کنگ فہد مرکزی پارک',
    'حديقة جبل أحد': 'جبل احد پارک',
    'حديقة الأمير محمد بن عبدالعزيز': 'شہزادہ محمد بن عبدالعزیز پارک',
    'حديقة النخيل': 'کھجوروں کا باغ',
    'حديقة قباء': 'قباء پارک',
    'حديقة الأراك': 'اراک پارک',
    'وادي العقيق': 'وادی عقیق',
    'وادي بطحان': 'وادی بطحان',
    'مزارع النخيل': 'کھجوروں کے باغات',
    'مزارع العيون': 'العیون کے باغات',
    'مزارع قباء': 'قباء کے باغات',
    'مزارع العاقول': 'عاقول کے باغات',
    'منتزه البيضاء البري': 'البیضاء قدرتی پارک',
    'منتزهات المدينة البرية': 'مدینہ کے قدرتی پارک',
    'بساتين المدينة': 'مدینہ کے باغات',
    'أبرز معالم المدينة المنورة': 'مدینہ کے مشہور مقامات',
    'رحلة تترك في القلب أثرًا': 'ایسا سفر جو دل پر نقش چھوڑ جائے',
    'أحد أبرز معالم المدينة المنورة.': 'مدینہ منورہ کی نمایاں ترین جگہوں میں سے ایک۔',
    'من أشهر المساجد التاريخية في المدينة.': 'مدینہ کی مشہور تاریخی مساجد میں سے ایک۔',
    'تعرّف على خيارات الجولات السياحية ومواقفها.': 'سیاحتی دوروں اور ان کے اسٹاپس کے بارے میں جانیں۔',
    'افتح خريطة تفاعلية للمعالم في المدينة.': 'مدینہ کے مقامات دیکھنے کے لیے نقشہ کھولیں۔',
    'المسجد النبوي، قباء، القبلتين.': 'مسجد نبوی، قباء اور مسجد قبلتین۔',
    'جبل أحد، شهداء أحد، المساجد السبعة.': 'جبل احد، شہدائے احد اور سات مساجد۔',
    'متحف دار المدينة، محطة الحجاز، سوق التمور.': 'دار المدینہ میوزیم، حجاز اسٹیشن اور کھجور بازار۔',
    'مكان مضاف': 'شامل کردہ مقام',
    'الدخول حسب المزرعة': 'داخلے کی اجازت باغ کے مطابق ہے۔',
    'الدخول حسب الموقع': 'داخلے کی اجازت مقام کے مطابق ہے۔',
    'بئر بئر رومة التاريخي': 'تاریخی بئر رومہ۔',
    'بئر تاريخي': 'تاریخی کنواں۔',
    'تجربة تسوق محلية': 'مقامی خریداری کا تجربہ۔',
    'تجربة ثقافية وتراثية': 'ثقافتی اور ورثے کا تجربہ۔',
    'تحقق من إمكانية الزيارة': 'جانے سے پہلے داخلے کی اجازت معلوم کریں۔',
    'تحقق من الاسم والإتاحة': 'نام اور دستیابی کی تصدیق کریں۔',
    'تحقق من الاسم والموقع': 'نام اور مقام کی تصدیق کریں۔',
    'تحقق من الاسم والموقع قبل الزيارة': 'دورے سے پہلے نام اور مقام کی تصدیق کریں۔',
    'تحقق من الفعاليات الحالية': 'موجودہ تقریبات کی معلومات دیکھیں۔',
    'تحقق من المواقع المتاحة': 'دستیاب مقامات کی تصدیق کریں۔',
    'تحقق من الموقع': 'مقام کی تصدیق کریں۔',
    'تحقق من الموقع والإتاحة': 'مقام اور داخلے کی اجازت کی تصدیق کریں۔',
    'حي من أحياء المدينة القديمة': 'مدینہ کے قدیم محلوں میں سے ایک۔',
    'سوق شعبي وتجاري': 'روایتی تجارتی بازار۔',
    'ضمن منطقة المساجد السبعة': 'سات مساجد کے علاقے میں واقع ہے۔',
    'ضمن مواقع الخندق': 'غزوۂ خندق کے تاریخی مقامات میں شامل۔',
    'متحف في محطة الحجاز': 'حجاز ریلوے اسٹیشن میں ایک عجائب گھر۔',
    'متحف للتاريخ والتراث': 'تاریخ اور ورثے کا عجائب گھر۔',
    'مجموعة مساجد تاريخية': 'تاریخی مساجد کا مجموعہ۔',
    'محطة تاريخية': 'تاریخی اسٹیشن۔',
    'مرتبط بالسيرة النبوية': 'سیرتِ نبوی سے متعلق۔',
    'مركز معرفي وتاريخي': 'تحقیق اور تاریخ کا مرکز۔',
    'مساحة خضراء للتنزه': 'سیر و تفریح کے لیے سرسبز جگہ۔',
    'مسجد تاريخي': 'تاریخی مسجد۔',
    'مسجد تاريخي معروف': 'مشہور تاریخی مسجد۔',
    'مسجد معروف': 'معروف مسجد۔',
    'معرض ثقافي': 'ثقافتی نمائش۔',
    'معرض ومحتوى عن القرآن الكريم': 'قرآن کریم کے بارے میں نمائش اور معلومات۔',
    'من أحياء المدينة': 'مدینہ کے محلوں میں سے ایک۔',
    'من أودية المدينة': 'مدینہ کی وادیوں میں سے ایک۔',
    'من الجبال المعروفة': 'معروف پہاڑوں میں سے ایک۔',
    'من المساجد التاريخية': 'تاریخی مساجد میں سے ایک۔',
    'من المساجد المعروفة': 'معروف مساجد میں سے ایک۔',
    'من المناطق التاريخية': 'تاریخی علاقوں میں سے ایک۔',
    'من المواقع المرتبطة بغزوة الخندق': 'غزوۂ خندق سے متعلق مقام۔',
    'من جبال المدينة': 'مدینہ کے پہاڑوں میں سے ایک۔',
    'منطقة تاريخية قرب جبل أحد': 'جبل احد کے قریب تاریخی علاقہ۔',
    'منطقة تجارية تاريخية': 'تاریخی تجارتی علاقہ۔',
    'منطقة جبلية قرب أحد': 'احد کے قریب پہاڑی علاقہ۔',
    'منطقة طبيعية خارج المدينة': 'شہر سے باہر قدرتی علاقہ۔',
    'منطقة مفتوحة للتنزه': 'سیر و تفریح کے لیے کھلی جگہ۔',
    'موقع تاريخي': 'تاریخی مقام۔',
    'موقع تاريخي في المدينة': 'مدینہ میں تاریخی مقام۔',
    'موقع تاريخي مرتبط بغزوة أحد': 'غزوۂ احد سے متعلق تاریخی مقام۔',
    'موقع تاريخي وطبيعي': 'تاریخی اور قدرتی اہمیت کا مقام۔',
    'موقع تراثي': 'ورثے کا مقام۔',
    'موقع ديني': 'مذہبی مقام۔',
    'موقع غزوة أحد': 'غزوۂ احد کا مقام۔',
    'موقع مرتبط بالسيرة': 'سیرتِ نبوی سے متعلق مقام۔',
    'وادٍ معروف في المدينة': 'مدینہ کی معروف وادی۔',
    'يعرض تاريخ العمارة والتوسعات': 'تعمیرات اور توسیع کی تاریخ پیش کرتا ہے۔',
    'يعرض تاريخ المدينة والسيرة': 'مدینہ کی تاریخ اور سیرت پیش کرتا ہے۔',
    'إنشاء الحساب': 'اکاؤنٹ بنائیں',
    '↺ مساري السابق': 'میرا پچھلا راستہ',
    '★ مسارات شائعة': 'مشہور راستے',
    '✨ مسار مقترح': 'تجویز کردہ راستہ',
    '＋ مسار يدوي': 'اپنا راستہ بنائیں',
    'الباص السياحي': 'سیاحتی بس',
  },
};

String tr(String text) {
  if (appLanguage.value == 'ar') return text;
  return translations[appLanguage.value]?[text] ?? text;
}

String get currentLanguage => appLanguage.value;

TextDirection get currentDirection =>
    currentLanguage == 'ar' || currentLanguage == 'ur'
        ? TextDirection.rtl
        : TextDirection.ltr;

Future<void> changeLanguage(String language) async {
  appLanguage.value = language;
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('atharLanguage', language);
}

// يحل مشكلة "No MaterialLocalizations found" للغات العربية والأردو والإندونيسية
class _AnyLocaleMaterialDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  const _AnyLocaleMaterialDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<MaterialLocalizations> load(Locale locale) =>
      SynchronousFuture<MaterialLocalizations>(const DefaultMaterialLocalizations());

  @override
  bool shouldReload(_AnyLocaleMaterialDelegate old) => false;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  appLanguage.value = prefs.getString('atharLanguage') ?? 'ar';
  runApp(const AtharApp());
}

class AtharApp extends StatelessWidget {
  const AtharApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: appLanguage,
      builder: (context, language, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'أثر المدينة',
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: beige,
            fontFamily: 'Arial',
            colorScheme: ColorScheme.fromSeed(seedColor: green),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: green,
              elevation: 0,
              centerTitle: false,
            ),
          ),
          locale: Locale(language),
          localizationsDelegates: const [
            _AnyLocaleMaterialDelegate(),
            DefaultWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ar'),
            Locale('en'),
            Locale('id'),
            Locale('ur'),
          ],
          home: const SplashScreen(),
          builder: (context, child) {
            return Directionality(
              textDirection: currentDirection,
              child: child ?? const SizedBox.shrink(),
            );
          },
        );
      },
    );
  }
}

// بيانات الأماكن
class Place {
  final String name;
  final String category;
  final String description;
  final String searchQuery;

  const Place({
    required this.name,
    required this.category,
    required this.description,
    required this.searchQuery,
  });
}

const List<Place> allPlaces = [
  Place(name: 'المسجد النبوي', category: 'religious', description: 'أبرز معالم المدينة المنورة', searchQuery: 'المسجد النبوي المدينة المنورة'),
  Place(name: 'مسجد قباء', category: 'religious', description: 'مسجد تاريخي معروف', searchQuery: 'مسجد قباء المدينة المنورة'),
  Place(name: 'مسجد القبلتين', category: 'religious', description: 'من المساجد التاريخية', searchQuery: 'مسجد القبلتين المدينة المنورة'),
  Place(name: 'مسجد الجمعة', category: 'religious', description: 'مرتبط بالسيرة النبوية', searchQuery: 'مسجد الجمعة المدينة المنورة'),
  Place(name: 'مسجد الغمامة', category: 'religious', description: 'مسجد تاريخي', searchQuery: 'مسجد الغمامة المدينة المنورة'),
  Place(name: 'مسجد السبع منارات', category: 'religious', description: 'تحقق من الاسم والموقع قبل الزيارة', searchQuery: 'مسجد السبع منارات المدينة المنورة'),
  Place(name: 'مسجد أبي بكر الصديق', category: 'religious', description: 'مسجد تاريخي', searchQuery: 'مسجد أبي بكر الصديق المدينة المنورة'),
  Place(name: 'مسجد علي بن أبي طالب', category: 'religious', description: 'مسجد تاريخي', searchQuery: 'مسجد علي بن أبي طالب المدينة المنورة'),
  Place(name: 'مسجد عمر بن الخطاب', category: 'religious', description: 'مسجد تاريخي', searchQuery: 'مسجد عمر بن الخطاب المدينة المنورة'),
  Place(name: 'مسجد بلال بن رباح', category: 'religious', description: 'مسجد تاريخي', searchQuery: 'مسجد بلال بن رباح المدينة المنورة'),
  Place(name: 'مسجد الإجابة', category: 'religious', description: 'من المساجد المعروفة', searchQuery: 'مسجد الإجابة المدينة المنورة'),
  Place(name: 'مسجد المستراح', category: 'religious', description: 'موقع مرتبط بالسيرة', searchQuery: 'مسجد المستراح المدينة المنورة'),
  Place(name: 'مسجد السقيا', category: 'religious', description: 'مسجد تاريخي', searchQuery: 'مسجد السقيا المدينة المنورة'),
  Place(name: 'مسجد الدرع', category: 'religious', description: 'موقع تاريخي', searchQuery: 'مسجد الدرع المدينة المنورة'),
  Place(name: 'مسجد الراية', category: 'religious', description: 'موقع تاريخي', searchQuery: 'مسجد الراية المدينة المنورة'),
  Place(name: 'مسجد الفتح', category: 'religious', description: 'ضمن مواقع الخندق', searchQuery: 'مسجد الفتح المدينة المنورة'),
  Place(name: 'مسجد سلمان الفارسي', category: 'religious', description: 'ضمن منطقة المساجد السبعة', searchQuery: 'مسجد سلمان الفارسي المدينة المنورة'),
  Place(name: 'مسجد أبي ذر', category: 'religious', description: 'مسجد معروف', searchQuery: 'مسجد أبي ذر المدينة المنورة'),
  Place(name: 'مسجد السجدة', category: 'religious', description: 'موقع ديني', searchQuery: 'مسجد السجدة المدينة المنورة'),
  Place(name: 'مسجد المنارتين', category: 'religious', description: 'تحقق من الاسم والموقع', searchQuery: 'مسجد المنارتين المدينة المنورة'),

  Place(name: 'جبل أحد', category: 'historic', description: 'موقع غزوة أحد', searchQuery: 'جبل أحد المدينة المنورة'),
  Place(name: 'مقبرة شهداء أحد', category: 'historic', description: 'موقع تاريخي مرتبط بغزوة أحد', searchQuery: 'مقبرة شهداء أحد المدينة المنورة'),
  Place(name: 'موقع الخندق', category: 'historic', description: 'من المواقع المرتبطة بغزوة الخندق', searchQuery: 'موقع غزوة الخندق المدينة المنورة'),
  Place(name: 'المساجد السبعة', category: 'historic', description: 'مجموعة مساجد تاريخية', searchQuery: 'المساجد السبعة المدينة المنورة'),
  Place(name: 'سقيفة بني ساعدة', category: 'historic', description: 'موقع تاريخي في المدينة', searchQuery: 'سقيفة بني ساعدة المدينة المنورة'),
  Place(name: 'بئر غرس', category: 'historic', description: 'بئر تاريخي', searchQuery: 'بئر غرس المدينة المنورة'),
  Place(name: 'بئر عثمان', category: 'historic', description: 'بئر بئر رومة التاريخي', searchQuery: 'بئر عثمان بئر رومة المدينة المنورة'),
  Place(name: 'بئر حاء', category: 'historic', description: 'موقع تاريخي', searchQuery: 'بئر حاء المدينة المنورة'),
  Place(name: 'محطة سكة الحجاز القديمة', category: 'historic', description: 'محطة تاريخية', searchQuery: 'محطة سكة الحجاز المدينة المنورة'),
  Place(name: 'قلعة قباء', category: 'historic', description: 'موقع تراثي', searchQuery: 'قلعة قباء المدينة المنورة'),
  Place(name: 'حي المغيسلة', category: 'historic', description: 'حي من أحياء المدينة القديمة', searchQuery: 'حي المغيسلة المدينة المنورة'),
  Place(name: 'حي العيون', category: 'historic', description: 'من أحياء المدينة', searchQuery: 'حي العيون المدينة المنورة'),
  Place(name: 'حي العنبرية', category: 'historic', description: 'من المناطق التاريخية', searchQuery: 'حي العنبرية المدينة المنورة'),
  Place(name: 'ميدان سيد الشهداء', category: 'historic', description: 'منطقة تاريخية قرب جبل أحد', searchQuery: 'ميدان سيد الشهداء المدينة المنورة'),

  Place(name: 'متحف دار المدينة', category: 'culture', description: 'يعرض تاريخ المدينة والسيرة', searchQuery: 'متحف دار المدينة'),
  Place(name: 'متحف سكة الحجاز', category: 'culture', description: 'متحف في محطة الحجاز', searchQuery: 'متحف سكة الحجاز المدينة المنورة'),
  Place(name: 'متحف المدينة المنورة', category: 'culture', description: 'متحف للتاريخ والتراث', searchQuery: 'متحف المدينة المنورة'),
  Place(name: 'متحف القرآن الكريم', category: 'culture', description: 'معرض ومحتوى عن القرآن الكريم', searchQuery: 'معرض القرآن الكريم المدينة المنورة'),
  Place(name: 'متحف وبستان الصافية', category: 'culture', description: 'تجربة ثقافية وتراثية', searchQuery: 'متحف وبستان الصافية المدينة المنورة'),
  Place(name: 'معرض أسماء الله الحسنى', category: 'culture', description: 'معرض ثقافي', searchQuery: 'معرض أسماء الله الحسنى المدينة المنورة'),
  Place(name: 'معرض عمارة المسجد النبوي', category: 'culture', description: 'يعرض تاريخ العمارة والتوسعات', searchQuery: 'معرض عمارة المسجد النبوي'),
  Place(name: 'مركز بحوث ودراسات المدينة', category: 'culture', description: 'مركز معرفي وتاريخي', searchQuery: 'مركز بحوث ودراسات المدينة المنورة'),
  Place(name: 'سوق التمور المركزي', category: 'culture', description: 'تجربة تسوق محلية', searchQuery: 'سوق التمور المدينة المنورة'),
  Place(name: 'سوق قباء', category: 'culture', description: 'سوق شعبي وتجاري', searchQuery: 'سوق قباء المدينة المنورة'),
  Place(name: 'سوق المناخة', category: 'culture', description: 'منطقة تجارية تاريخية', searchQuery: 'سوق المناخة المدينة المنورة'),
  Place(name: 'مركز المدينة للفنون', category: 'culture', description: 'تحقق من الفعاليات الحالية', searchQuery: 'مركز المدينة للفنون'),

  Place(name: 'جبل الرماة', category: 'nature', description: 'منطقة جبلية قرب أحد', searchQuery: 'جبل الرماة المدينة المنورة'),
  Place(name: 'جبل عير', category: 'nature', description: 'من جبال المدينة', searchQuery: 'جبل عير المدينة المنورة'),
  Place(name: 'جبل سلع', category: 'nature', description: 'موقع تاريخي وطبيعي', searchQuery: 'جبل سلع المدينة المنورة'),
  Place(name: 'جبل الجماوات', category: 'nature', description: 'من الجبال المعروفة', searchQuery: 'جبال الجماوات المدينة المنورة'),
  Place(name: 'حديقة الملك فهد المركزية', category: 'nature', description: 'مساحة خضراء للتنزه', searchQuery: 'حديقة الملك فهد المركزية المدينة المنورة'),
  Place(name: 'حديقة جبل أحد', category: 'nature', description: 'تحقق من الموقع والإتاحة', searchQuery: 'حديقة جبل أحد المدينة المنورة'),
  Place(name: 'حديقة الأمير محمد بن عبدالعزيز', category: 'nature', description: 'تحقق من الاسم والإتاحة', searchQuery: 'حديقة الأمير محمد بن عبدالعزيز المدينة المنورة'),
  Place(name: 'حديقة النخيل', category: 'nature', description: 'تحقق من الموقع', searchQuery: 'حديقة النخيل المدينة المنورة'),
  Place(name: 'حديقة قباء', category: 'nature', description: 'منطقة مفتوحة للتنزه', searchQuery: 'حديقة قباء المدينة المنورة'),
  Place(name: 'حديقة الأراك', category: 'nature', description: 'تحقق من الموقع', searchQuery: 'حديقة الأراك المدينة المنورة'),
  Place(name: 'وادي العقيق', category: 'nature', description: 'وادٍ معروف في المدينة', searchQuery: 'وادي العقيق المدينة المنورة'),
  Place(name: 'وادي بطحان', category: 'nature', description: 'من أودية المدينة', searchQuery: 'وادي بطحان المدينة المنورة'),
  Place(name: 'مزارع النخيل', category: 'nature', description: 'الدخول حسب المزرعة', searchQuery: 'مزارع النخيل المدينة المنورة'),
  Place(name: 'مزارع العيون', category: 'nature', description: 'تحقق من إمكانية الزيارة', searchQuery: 'مزارع العيون المدينة المنورة'),
  Place(name: 'مزارع قباء', category: 'nature', description: 'الدخول حسب المزرعة', searchQuery: 'مزارع قباء المدينة المنورة'),
  Place(name: 'مزارع العاقول', category: 'nature', description: 'تحقق من إمكانية الزيارة', searchQuery: 'مزارع العاقول المدينة المنورة'),
  Place(name: 'منتزه البيضاء البري', category: 'nature', description: 'منطقة طبيعية خارج المدينة', searchQuery: 'منتزه البيضاء المدينة المنورة'),
  Place(name: 'منتزهات المدينة البرية', category: 'nature', description: 'تحقق من المواقع المتاحة', searchQuery: 'منتزهات برية المدينة المنورة'),
  Place(name: 'بساتين المدينة', category: 'nature', description: 'الدخول حسب الموقع', searchQuery: 'بساتين المدينة المنورة'),
];

String categoryName(String category) {
  switch (category) {
    case 'religious':
      return tr('معالم دينية');
    case 'historic':
      return tr('معالم تاريخية');
    case 'culture':
      return tr('متاحف وثقافة');
    case 'nature':
      return tr('أماكن طبيعية');
    default:
      return tr('مكان مضاف');
  }
}

Future<void> openMap(String query) async {
  final Uri uri = Uri.parse(
    'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(query)}',
  );
  final opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
  if (!opened) {
    await launchUrl(uri, mode: LaunchMode.platformDefault);
  }
}

Future<void> openDirections(List<String> places) async {
  if (places.isEmpty) return;
  final String destination = places.map(Uri.encodeComponent).join('/');
  final Uri uri = Uri.parse(
    'https://www.google.com/maps/dir/$destination/${Uri.encodeComponent('المدينة المنورة')}',
  );
  final opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
  if (!opened) {
    await launchUrl(uri, mode: LaunchMode.platformDefault);
  }
}

// شاشة البداية
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: deepGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                'assets/images/logo.jpeg',
                width: 115,
                height: 115,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const CircleAvatar(
                  radius: 58,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.mosque, size: 60, color: green),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              tr('أثر المدينة'),
              style: const TextStyle(
                color: Color(0xFFF1D99D),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              tr('رحلة تترك في القلب أثرًا'),
              style: const TextStyle(color: Colors.white70, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}

// الهيكل الرئيسي والتنقل
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  void goTo(int index) {
    setState(() => currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: appLanguage,
      builder: (context, language, child) {
        final pages = [
          HomePage(onNavigate: goTo),
          const CategoriesPage(),
          const PlannerPage(),
          const MapPage(),
          const ProfilePage(),
        ];

        return Directionality(
          textDirection: currentDirection,
          child: Scaffold(
            body: SafeArea(
              child: KeyedSubtree(
                key: ValueKey(language),
                child: pages[currentIndex],
              ),
            ),
            bottomNavigationBar: NavigationBar(
              backgroundColor: const Color(0xFFFFFDF9),
              indicatorColor: gold.withOpacity(0.22),
              selectedIndex: currentIndex,
              onDestinationSelected: goTo,
              destinations: [
                NavigationDestination(icon: const Icon(Icons.home_outlined), selectedIcon: const Icon(Icons.home), label: tr('الرئيسية')),
                NavigationDestination(icon: const Icon(Icons.mosque_outlined), selectedIcon: const Icon(Icons.mosque), label: tr('المعالم')),
                NavigationDestination(icon: const Icon(Icons.route_outlined), selectedIcon: const Icon(Icons.route), label: tr('رحلتي')),
                NavigationDestination(icon: const Icon(Icons.map_outlined), selectedIcon: const Icon(Icons.map), label: tr('الخريطة')),
                NavigationDestination(icon: const Icon(Icons.person_outline), selectedIcon: const Icon(Icons.person), label: tr('حسابي')),
              ],
            ),
          ),
        );
      },
    );
  }
}

// أدوات التصميم
Widget sectionTitle(String title, String subtitle) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 14),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tr(title), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: green)),
        const SizedBox(height: 5),
        Text(tr(subtitle), style: const TextStyle(fontSize: 13, color: muted)),
      ],
    ),
  );
}

Widget appImage(String path, {double height = 145}) {
  return Image.asset(
    path,
    height: height,
    width: double.infinity,
    fit: BoxFit.cover,
    errorBuilder: (_, __, ___) => Container(
      height: height,
      color: const Color(0xFFE9E2D5),
      child: const Center(
        child: Icon(Icons.image_outlined, color: muted, size: 42),
      ),
    ),
  );
}

Widget pageCard({
  required String title,
  required String description,
  required VoidCallback onTap,
  String? image,
  String? tag,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: line),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.04),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    clipBehavior: Clip.antiAlias,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (image != null) appImage(image),
        Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (tag != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F0DF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(tr(tag), style: const TextStyle(fontSize: 11, color: Color(0xFF80652E))),
                ),
              if (tag != null) const SizedBox(height: 8),
              Text(tr(title), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: green)),
              const SizedBox(height: 6),
              Text(tr(description), style: const TextStyle(fontSize: 13, color: muted, height: 1.6)),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: onTap,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: green,
                    side: const BorderSide(color: line),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
                  ),
                  child: Text(tr('استكشف')),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget primaryButton(String text, VoidCallback onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: gold,
      foregroundColor: const Color(0xFF182D21),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    child: Text(tr(text), style: const TextStyle(fontWeight: FontWeight.bold)),
  );
}

// الرئيسية
class HomePage extends StatelessWidget {
  final ValueChanged<int> onNavigate;
  const HomePage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            color: const Color(0xFFFFFDF9),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/images/logo.jpeg',
                    width: 44,
                    height: 44,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => const CircleAvatar(
                      backgroundColor: beige,
                      child: Icon(Icons.mosque, color: green),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(tr('أثر المدينة'), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19, color: green)),
                const Spacer(),
                PopupMenuButton<String>(
                  tooltip: tr('اللغة'),
                  onSelected: (value) async {
                    await changeLanguage(value);
                  },
                  itemBuilder: (_) => const [
                    PopupMenuItem(value: 'ar', child: Text('العربية')),
                    PopupMenuItem(value: 'en', child: Text('English')),
                    PopupMenuItem(value: 'id', child: Text('Indonesia')),
                    PopupMenuItem(value: 'ur', child: Text('اردو')),
                  ],
                  child: const Icon(Icons.language, color: green),
                ),
                TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage())),
                  child: Text(tr('دخول'), style: const TextStyle(color: green)),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 100),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              Container(
                constraints: const BoxConstraints(minHeight: 250),
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: const LinearGradient(
                    colors: [deepGreen, green],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(tr('اكتشف المدينة المنورة'), style: const TextStyle(color: Colors.white, fontSize: 29, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Text(
                      tr('تعرّف على معالمها الدينية والتاريخية والثقافية، وخطّط لرحلة تترك أثرًا لا يُنسى.'),
                      style: const TextStyle(color: Color(0xFFF4EEE1), height: 1.9, fontSize: 14),
                    ),
                    const SizedBox(height: 18),
                    primaryButton('خطّط لرحلتك', () => onNavigate(2)),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              sectionTitle('اكتشف المدينة', 'اختر نوع الأماكن التي ترغب بزيارتها'),
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  mainAxisExtent: 320,
                ),
                children: [
                  pageCard(title: 'معالم دينية', description: 'المساجد والمواقع المرتبطة بالسيرة النبوية.', image: 'assets/images/masajid.jpeg', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CategoryPage(category: 'religious')))),
                  pageCard(title: 'معالم تاريخية', description: 'مواقع وأحداث من تاريخ المدينة.', image: 'assets/images/journey.jpeg', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CategoryPage(category: 'historic')))),
                  pageCard(title: 'متاحف وثقافة', description: 'متاحف وتجارب ثقافية وتراثية.', image: 'assets/images/activities.jpeg', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CategoryPage(category: 'culture')))),
                  pageCard(title: 'أماكن طبيعية', description: 'جبال وحدائق ومزارع وأماكن مفتوحة.', image: 'assets/images/nature.jpeg', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CategoryPage(category: 'nature')))),
                ],
              ),
              const SizedBox(height: 28),
              sectionTitle('أماكن لا تفوّت زيارتها', 'أبرز المحطات التي يمكنك إضافتها إلى رحلتك'),
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  mainAxisExtent: 350,
                ),
                children: [
                  pageCard(title: 'المسجد النبوي', description: 'أحد أبرز معالم المدينة المنورة.', image: 'assets/images/masajid2.jpeg', tag: 'معلم ديني', onTap: () => openMap('المسجد النبوي المدينة المنورة')),
                  pageCard(title: 'مسجد قباء', description: 'من أشهر المساجد التاريخية في المدينة.', image: 'assets/images/masajid.jpeg', tag: 'معلم ديني', onTap: () => openMap('مسجد قباء المدينة المنورة')),
                  pageCard(title: 'الباص السياحي', description: 'تعرّف على خيارات الجولات السياحية ومواقفها.', tag: 'تجربة سياحية', onTap: () => openMap('الباص السياحي المدينة المنورة')),
                  pageCard(title: 'أبرز المعالم على الخريطة', description: 'افتح خريطة تفاعلية للمعالم في المدينة.', tag: 'دليل الزيارة', onTap: () => onNavigate(3)),
                ],
              ),
              const SizedBox(height: 28),
              sectionTitle('منظّم الزيارة', 'اختر الطريقة المناسبة لترتيب محطات رحلتك'),
              OrganizerButton(title: '✨ مسار مقترح', subtitle: 'اقتراح ترتيب مبدئي للمعالم', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SmartRoutePage()))),
              OrganizerButton(title: '＋ مسار يدوي', subtitle: 'اختر الأماكن بنفسك', onTap: () => onNavigate(2)),
              OrganizerButton(title: '★ مسارات شائعة', subtitle: 'أفكار لرحلات مقترحة', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PopularRoutesPage()))),
              OrganizerButton(title: '↺ مساري السابق', subtitle: 'عرض آخر مسار حفظته', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PreviousRoutesPage()))),
              const SizedBox(height: 20),
              Center(child: Text(tr('أثر المدينة — دليل استكشافي للزوار'), style: const TextStyle(color: muted, fontSize: 12))),
            ]),
          ),
        ),
      ],
    );
  }
}

class OrganizerButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const OrganizerButton({super.key, required this.title, required this.subtitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15), side: const BorderSide(color: line)),
      child: ListTile(
        onTap: onTap,
        title: Text(tr(title), style: const TextStyle(color: green, fontWeight: FontWeight.bold)),
        subtitle: Text(tr(subtitle), style: const TextStyle(color: muted, fontSize: 12)),
        trailing: const Icon(Icons.arrow_back_ios, color: gold, size: 17),
      ),
    );
  }
}
// صفحة التصنيفات
class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['religious', 'historic', 'culture', 'nature'];
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        sectionTitle('المعالم', 'اختر التصنيف لاستكشاف الأماكن'),
        ...categories.map((category) => OrganizerButton(
          title: categoryName(category),
          subtitle: 'استكشف الأماكن',
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CategoryPage(category: category),
            ),
          ),
        )),
      ],
    );
  }
}

// صفحة الأماكن داخل كل تصنيف
class CategoryPage extends StatefulWidget {
  final String category;
  const CategoryPage({super.key, required this.category});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String search = '';

  @override
  Widget build(BuildContext context) {
    final filtered = allPlaces.where((place) {
      return place.category == widget.category &&
          (place.name.contains(search) ||
              tr(place.name).toLowerCase().contains(search.toLowerCase()));
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(categoryName(widget.category))),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            onChanged: (value) => setState(() => search = value.trim()),
            decoration: InputDecoration(
              hintText: tr('ابحث عن مكان...'),
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: line),
              ),
            ),
          ),
          const SizedBox(height: 15),
          if (filtered.isEmpty)
            Center(child: Text(tr('لا توجد نتائج.')))
          else
            ...filtered.map((place) => PlaceTile(place: place)),
        ],
      ),
    );
  }
}

class PlaceTile extends StatelessWidget {
  final Place place;
  const PlaceTile({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: line),
      ),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: beige,
          child: Icon(Icons.location_on_outlined, color: green),
        ),
        title: Text(
          tr(place.name),
          style: const TextStyle(color: green, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          tr(place.description),
          style: const TextStyle(color: muted),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.map_outlined, color: gold),
          onPressed: () => openMap(place.searchQuery),
        ),
      ),
    );
  }
}

// التخطيط وحفظ الرحلات
class PlannerPage extends StatefulWidget {
  const PlannerPage({super.key});

  @override
  State<PlannerPage> createState() => _PlannerPageState();
}

class _PlannerPageState extends State<PlannerPage> {
  final Set<String> selected = {};
  final List<Place> customPlaces = [];
  String search = '';
  String category = 'all';

  final TextEditingController customName = TextEditingController();
  final TextEditingController customDescription = TextEditingController();

  @override
  void dispose() {
    customName.dispose();
    customDescription.dispose();
    super.dispose();
  }

  List<Place> get filteredPlaces {
    return allPlaces.where((place) {
      final matchesSearch =
          place.name.contains(search) ||
              tr(place.name).toLowerCase().contains(search.toLowerCase());

      final matchesCategory =
          category == 'all' || place.category == category;

      return matchesSearch && matchesCategory;
    }).toList();
  }

  Future<void> saveRoute() async {
    final chosen = [
      ...selected,
      ...customPlaces.map((p) => p.name),
    ];

    if (chosen.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(tr('اختاري مكانًا واحدًا على الأقل.'))),
      );
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    final routes = prefs.getStringList('atharRoutes') ?? [];

    final route = {
      'id': DateTime.now().millisecondsSinceEpoch,
      'name': 'رحلتي في المدينة',
      'places': chosen,
      'date': DateTime.now().toString().substring(0, 10),
    };

    routes.add(jsonEncode(route));
    await prefs.setStringList('atharRoutes', routes);
    await prefs.setString('atharRoute', jsonEncode(route));

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(tr('تم حفظ مسارك بنجاح.'))),
    );
  }

  void addCustomPlace() {
    final name = customName.text.trim();

    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(tr('اكتبي اسم المكان أولًا.'))),
      );
      return;
    }

    setState(() {
      customPlaces.add(
        Place(
          name: name,
          category: 'custom',
          description: customDescription.text.trim().isEmpty
              ? 'مكان أضفته بنفسي'
              : customDescription.text.trim(),
          searchQuery: '$name المدينة المنورة',
        ),
      );

      customName.clear();
      customDescription.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        sectionTitle(
          'خطّط لرحلتك',
          'اختاري الأماكن التي ترغبين بزيارتها',
        ),
        TextField(
          onChanged: (value) => setState(() => search = value.trim()),
          decoration: InputDecoration(
            hintText: tr('ابحثي عن مكان...'),
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: line),
            ),
          ),
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          value: category,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: line),
            ),
          ),
          items: [
            DropdownMenuItem(
              value: 'all',
              child: Text(tr('جميع التصنيفات')),
            ),
            DropdownMenuItem(
              value: 'religious',
              child: Text(tr('دينية')),
            ),
            DropdownMenuItem(
              value: 'historic',
              child: Text(tr('تاريخية')),
            ),
            DropdownMenuItem(
              value: 'culture',
              child: Text(tr('ثقافية')),
            ),
            DropdownMenuItem(
              value: 'nature',
              child: Text(tr('طبيعية')),
            ),
          ],
          onChanged: (value) {
            setState(() => category = value ?? 'all');
          },
        ),
        const SizedBox(height: 14),
        ...filteredPlaces.map(
              (place) => CheckboxListTile(
            value: selected.contains(place.name),
            activeColor: green,
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            title: Text(
              tr(place.name),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: green,
              ),
            ),
            subtitle: Text(
              tr(place.description),
              style: const TextStyle(color: muted, fontSize: 12),
            ),
            onChanged: (checked) {
              setState(() {
                if (checked == true) {
                  selected.add(place.name);
                } else {
                  selected.remove(place.name);
                }
              });
            },
          ),
        ),
        const Divider(height: 30),
        Text(
          tr('إضافة مكان من اختيارك'),
          style: const TextStyle(
            color: green,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: customName,
          decoration: InputDecoration(
            labelText: tr('اسم المكان'),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: customDescription,
          decoration: InputDecoration(
            labelText: tr('وصف المكان'),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        primaryButton('إضافة المكان', addCustomPlace),
        ...customPlaces.asMap().entries.map(
              (entry) => ListTile(
            title: Text(entry.value.name),
            subtitle: Text(entry.value.description),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () {
                setState(() => customPlaces.removeAt(entry.key));
              },
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          '${tr('عدد الأماكن المختارة:')} ${selected.length + customPlaces.length}',
          style: const TextStyle(
            color: green,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        primaryButton('حفظ مساري', saveRoute),
        OutlinedButton(
          onPressed: () {
            openDirections([
              ...selected,
              ...customPlaces.map((p) => p.searchQuery),
            ]);
          },
          child: Text(tr('عرض المسار على الخريطة')),
        ),
        const SizedBox(height: 20),
        OrganizerButton(
          title: 'مساراتي السابقة',
          subtitle: 'عرض المسارات التي حفظتها',
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const PreviousRoutesPage(),
            ),
          ),
        ),
      ],
    );
  }
}

// المسار المقترح
class SmartRoutePage extends StatelessWidget {
  const SmartRoutePage({super.key});

  static const suggested = [
    'المسجد النبوي',
    'مسجد قباء',
    'مسجد القبلتين',
    'جبل أحد',
    'متحف دار المدينة',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tr('المسار المقترح'))),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            tr('يمكنك البدء بزيارة أبرز معالم المدينة المنورة.'),
            style: const TextStyle(color: muted),
          ),
          const SizedBox(height: 15),
          ...suggested.map(
                (place) => Card(
              color: Colors.white,
              child: ListTile(
                leading: const Icon(Icons.location_on, color: gold),
                title: Text(
                  tr(place),
                  style: const TextStyle(color: green),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          primaryButton(
            'عرض المسار على الخريطة',
                () => openDirections(suggested),
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const PlannerPage(),
              ),
            ),
            child: Text(tr('اختيار الأماكن بنفسي')),
          ),
        ],
      ),
    );
  }
}

// المسارات الشائعة
class PopularRoutesPage extends StatelessWidget {
  const PopularRoutesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final routes = [
      {
        'name': 'المسار الديني',
        'description': 'المسجد النبوي، قباء، القبلتين.',
        'places': ['المسجد النبوي', 'مسجد قباء', 'مسجد القبلتين'],
      },
      {
        'name': 'المسار التاريخي',
        'description': 'جبل أحد، شهداء أحد، المساجد السبعة.',
        'places': ['جبل أحد', 'مقبرة شهداء أحد', 'المساجد السبعة'],
      },
      {
        'name': 'المسار الثقافي',
        'description': 'متحف دار المدينة، محطة الحجاز، سوق التمور.',
        'places': [
          'متحف دار المدينة',
          'محطة سكة الحجاز القديمة',
          'سوق التمور المركزي',
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(title: Text(tr('المسارات الشائعة'))),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: routes.map((route) {
          return Card(
            color: Colors.white,
            margin: const EdgeInsets.only(bottom: 14),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tr(route['name'] as String),
                    style: const TextStyle(
                      color: green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    tr(route['description'] as String),
                    style: const TextStyle(color: muted),
                  ),
                  const SizedBox(height: 12),
                  primaryButton(
                    'اختيار المسار',
                        () => openDirections(
                      List<String>.from(route['places'] as List),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// المسارات السابقة
class PreviousRoutesPage extends StatefulWidget {
  const PreviousRoutesPage({super.key});

  @override
  State<PreviousRoutesPage> createState() => _PreviousRoutesPageState();
}

class _PreviousRoutesPageState extends State<PreviousRoutesPage> {
  List<Map<String, dynamic>> routes = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadRoutes();
  }

  Future<void> loadRoutes() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList('atharRoutes') ?? [];

    if (!mounted) return;

    setState(() {
      routes = saved
          .map((item) => Map<String, dynamic>.from(jsonDecode(item)))
          .toList();
      loading = false;
    });
  }

  Future<void> deleteRoute(int index) async {
    final prefs = await SharedPreferences.getInstance();

    routes.removeAt(index);

    await prefs.setStringList(
      'atharRoutes',
      routes.map(jsonEncode).toList(),
    );

    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tr('مساراتي السابقة'))),
      body: loading
          ? const Center(
        child: CircularProgressIndicator(color: green),
      )
          : routes.isEmpty
          ? Center(
        child: Text(tr('لم تحفظ أي مسارات حتى الآن.')),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: routes.length,
        itemBuilder: (context, index) {
          final route = routes[index];
          final routePlaces =
          List<String>.from(route['places'] ?? []);

          return Card(
            color: Colors.white,
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tr(route['name'] ?? 'رحلتي في المدينة'),
                    style: const TextStyle(
                      color: green,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${route['date'] ?? ''} — ${routePlaces.length} ${tr('أماكن')}',
                    style: const TextStyle(
                      color: muted,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    routePlaces.map(tr).join('، '),
                    style: const TextStyle(color: muted),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: primaryButton(
                          'عرض المسار',
                              () => openDirections(routePlaces),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: () => deleteRoute(index),
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// الخريطة
class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        sectionTitle(
          'خريطة المدينة المنورة',
          'ابحث عن المكان الذي تريد الوصول إليه',
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: tr('اكتب اسم المكان'),
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: line),
            ),
          ),
          onSubmitted: (value) {
            if (value.trim().isNotEmpty) {
              openMap('${value.trim()} المدينة المنورة');
            }
          },
        ),
        const SizedBox(height: 12),
        primaryButton('بحث في خرائط Google', () {
          if (controller.text.trim().isEmpty) {
            openMap('معالم المدينة المنورة');
          } else {
            openMap('${controller.text.trim()} المدينة المنورة');
          }
        }),
        const SizedBox(height: 18),
        Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFE9E2D5),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(
            child: Icon(
              Icons.map_outlined,
              size: 70,
              color: green,
            ),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          tr('يمكنك البحث عن أي معلم وفتح موقعه في خرائط Google للحصول على الاتجاهات.'),
          style: const TextStyle(color: muted, height: 1.8),
        ),
        const SizedBox(height: 10),
        primaryButton(
          'عرض المسجد النبوي',
              () => openMap('المسجد النبوي المدينة المنورة'),
        ),
        OutlinedButton(
          onPressed: () => openMap('معالم المدينة المنورة'),
          child: Text(tr('استكشاف معالم المدينة')),
        ),
      ],
    );
  }
}

// الحساب
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        sectionTitle(
          'حسابي',
          'مرحبًا بك في أثر المدينة',
        ),
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: line),
          ),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 38,
                backgroundColor: beige,
                child: Icon(
                  Icons.person_outline,
                  color: green,
                  size: 45,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                tr('مرحبًا بك في أثر المدينة'),
                style: const TextStyle(
                  color: green,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                tr('يمكنك تسجيل الدخول أو إنشاء حساب.'),
                style: const TextStyle(color: muted),
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                child: primaryButton(
                  'تسجيل الدخول',
                      () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LoginPage(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RegisterPage(),
                    ),
                  ),
                  child: Text(tr('إنشاء حساب')),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        OrganizerButton(
          title: 'مساراتي السابقة',
          subtitle: 'عرض المسارات التي حفظتها',
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const PreviousRoutesPage(),
            ),
          ),
        ),
      ],
    );
  }
}

// تسجيل الدخول
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tr('تسجيل الدخول'))),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: line),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  tr('تسجيل الدخول'),
                  style: const TextStyle(
                    color: green,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 18),
                TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: tr('البريد الإلكتروني'),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: tr('كلمة المرور'),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                primaryButton('دخول', () {
                  if (email.text.trim().isEmpty ||
                      password.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          tr('أدخلي البريد الإلكتروني وكلمة المرور.'),
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          tr('هذه نسخة تجريبية من تسجيل الدخول.'),
                        ),
                      ),
                    );
                  }
                }),
                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ForgotPasswordPage(),
                    ),
                  ),
                  child: Text(
                    tr('نسيت كلمة المرور؟'),
                    style: const TextStyle(color: green),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RegisterPage(),
                    ),
                  ),
                  child: Text(
                    tr('ليس لديك حساب؟ إنشاء حساب'),
                    style: const TextStyle(color: green),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// إنشاء حساب
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tr('إنشاء حساب'))),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            tr('إنشاء حساب جديد'),
            style: const TextStyle(
              color: green,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 18),
          TextField(
            controller: name,
            decoration: InputDecoration(
              labelText: tr('الاسم'),
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: email,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: tr('البريد الإلكتروني'),
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: phone,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: tr('رقم الجوال'),
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: password,
            obscureText: true,
            decoration: InputDecoration(
              labelText: tr('كلمة المرور'),
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 18),
          primaryButton('إنشاء الحساب', () {
            if (name.text.trim().isEmpty ||
                email.text.trim().isEmpty ||
                phone.text.trim().isEmpty ||
                password.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(tr('فضلاً أكملي جميع البيانات.')),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    tr('تم استلام البيانات في النسخة التجريبية.'),
                  ),
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}

// استعادة كلمة المرور
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final email = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tr('استعادة كلمة المرور'))),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              tr('استعادة كلمة المرور'),
              style: const TextStyle(
                color: green,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              tr('أدخلي بريدك الإلكتروني لاستعادة كلمة المرور.'),
              style: const TextStyle(color: muted),
            ),
            const SizedBox(height: 18),
            TextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: tr('البريد الإلكتروني'),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            primaryButton('إرسال', () {
              if (email.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(tr('أدخلي البريد الإلكتروني أولًا.')),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      tr('هذه نسخة تجريبية؛ خدمة إرسال البريد غير مفعّلة.'),
                    ),
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}