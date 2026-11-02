<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>أثر المدينة</title>

<style>
:root {
  --green:#174d35;
  --deep:#0d3826;
  --gold:#c5a45b;
  --beige:#f5f0e6;
  --muted:#6c7b70;
  --line:#e8e1d5;
}
*{box-sizing:border-box}
body{margin:0;background:var(--beige);color:#23382d;font-family:Tahoma,Arial,sans-serif}
button,input,select{font:inherit}
button{cursor:pointer;border:0}
.hidden{display:none!important}

header{position:sticky;top:0;z-index:20;background:#fffdf9ee;border-bottom:1px solid var(--line)}
.header-inner{max-width:1100px;margin:auto;padding:12px 18px;display:flex;align-items:center;justify-content:space-between;gap:12px}
.brand{display:flex;align-items:center;gap:10px;color:var(--green);font-weight:800;font-size:20px}
.brand-logo{width:46px;height:46px;object-fit:contain;border-radius:50%;background:white;border:1px solid var(--line);padding:3px}
.header-actions{display:flex;gap:8px;align-items:center}
.pill{border:1px solid var(--line);background:white;color:var(--green);padding:9px 12px;border-radius:22px}

main{max-width:1100px;margin:auto;padding:22px 18px 100px}
.hero{background:linear-gradient(110deg,#0d3826ef,#174d35d9),url('images/مسجد 2.jpeg') center/cover;min-height:250px;border-radius:24px;color:white;padding:30px;display:flex;flex-direction:column;justify-content:center}
.hero h1{font-size:clamp(27px,5vw,42px);margin:0 0 10px}
.hero p{max-width:570px;line-height:1.9;margin:0 0 18px;color:#f4eee1}
.primary{background:var(--gold);color:#182d21;padding:12px 18px;border-radius:12px;font-weight:bold}
.secondary{background:#fff;color:var(--green);border:1px solid var(--line);padding:11px 15px;border-radius:12px;font-weight:bold}

section{margin-top:30px}
.section-head{display:flex;justify-content:space-between;align-items:center;gap:12px;margin-bottom:14px}
.section-head h2{font-size:22px;margin:0;color:var(--green)}
.section-head p{color:var(--muted);margin:5px 0 0;font-size:13px}
.grid{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:14px}
.card{background:white;border:1px solid var(--line);border-radius:18px;overflow:hidden;box-shadow:0 8px 24px #173d2b12}
.card img{width:100%;height:145px;object-fit:cover;background:#e9e2d5;display:block}
.card-body{padding:13px}
.card h3{margin:0 0 7px;color:var(--green);font-size:16px}
.card p{margin:0;color:var(--muted);font-size:13px;line-height:1.7}
.card button{margin-top:12px;width:100%}
.featured .card img{height:155px}
.feature-tag{display:inline-block;color:#80652e;background:#f7f0df;border-radius:20px;padding:5px 9px;font-size:11px;margin-bottom:8px}

.organizer{display:grid;grid-template-columns:repeat(4,1fr);gap:12px}
.action-card{background:white;border:1px solid var(--line);padding:17px;border-radius:16px;text-align:right;color:var(--green);min-height:100px}
.action-card strong{display:block;margin-bottom:7px}
.action-card span{font-size:12px;color:var(--muted)}
.panel{background:white;border:1px solid var(--line);padding:18px;border-radius:18px}
.toolbar{display:flex;gap:9px;flex-wrap:wrap;margin:14px 0}
.toolbar input,.toolbar select{padding:11px 12px;border:1px solid var(--line);border-radius:10px;background:white;min-width:150px}
.place-list{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:12px}
.place{border:1px solid var(--line);border-radius:13px;padding:13px;display:flex;gap:10px;align-items:flex-start}
.place input{margin-top:5px;accent-color:var(--green)}
.place small{display:block;color:var(--muted);margin-top:5px;line-height:1.6}
.map-box{width:100%;height:360px;border:0;border-radius:16px;background:#eee}
.notice{font-size:13px;color:var(--muted);line-height:1.8}
.page-title{color:var(--green);margin:5px 0 15px}
.form{max-width:460px;margin:auto}
.form label{display:block;margin:12px 0 6px;color:var(--green)}
.form input{width:100%;padding:12px;border:1px solid var(--line);border-radius:10px}

.bottom-nav{position:fixed;bottom:0;left:0;right:0;background:#fffdf9;border-top:1px solid var(--line);display:flex;justify-content:center;gap:8px;padding:9px;z-index:30}
.bottom-nav button{background:transparent;color:var(--green);padding:8px 12px;border-radius:10px;font-size:12px}
.splash{position:fixed;inset:0;background:var(--deep);z-index:100;display:flex;align-items:center;justify-content:center;text-align:center;color:white}
.splash img{width:115px;height:115px;object-fit:contain;background:white;border-radius:50%;padding:8px}
.splash h1{color:#f1d99d}
footer{text-align:center;color:var(--muted);font-size:12px;margin:30px 0 10px}

@media(max-width:760px){
  .grid{grid-template-columns:repeat(2,minmax(0,1fr))}
  .organizer{grid-template-columns:repeat(2,1fr)}
  .place-list{grid-template-columns:1fr}
  .hero{min-height:230px;padding:22px}
  .card img{height:125px}
  .header-inner{padding:10px 12px}
  .brand{font-size:17px}
}
@media(max-width:390px){
  .grid{gap:9px}
  .card-body{padding:10px}
  .card h3{font-size:14px}
}
</style>
</head>

<body>

<div class="splash" id="splash">
  <div>
    <img src="images/اللوقو.jpeg" alt="شعار أثر المدينة">
    <h1>أثر المدينة</h1>
    <p>رحلة تترك في القلب أثرًا</p>
  </div>
</div>

<header>
  <div class="header-inner">
    <div class="brand">
      <img class="brand-logo" src="images/اللوقو.jpeg" alt="شعار أثر المدينة">
      <span>أثر المدينة</span>
    </div>
    <div class="header-actions">
      <select class="pill" id="language" onchange="changeLanguage(this.value)">
        <option value="ar">العربية</option>
        <option value="en">English</option>
        <option value="id">Indonesia</option>
        <option value="ur">اردو</option>
      </select>
      <button class="pill" onclick="showPage('login')">دخول</button>
    </div>
  </div>
</header>

<main>
<div id="homePage">

  <div class="hero">
    <h1>اكتشف المدينة المنورة</h1>
    <p>تعرّف على معالمها الدينية والتاريخية والثقافية، وخطّط لرحلة تترك أثرًا لا يُنسى.</p>
    <div>
      <button class="primary" onclick="showPage('planner')">خطّط لرحلتك</button>
    </div>
  </div>

  <section>
    <div class="section-head">
      <div>
        <h2>اكتشف المدينة</h2>
        <p>اختر نوع الأماكن التي ترغب بزيارتها</p>
      </div>
    </div>

    <div class="grid">
      <article class="card">
        <img src="images/masaj id.jpeg" alt="المعالم الدينية">
        <div class="card-body">
          <h3>معالم دينية</h3>
          <p>المساجد والمواقع المرتبطة بالسيرة النبوية.</p>
          <button class="secondary" onclick="showCategory('religious')">استكشف</button>
        </div>
      </article>

      <article class="card">
        <img src="images/journey.jpeg" alt="المعالم التاريخية">
        <div class="card-body">
          <h3>معالم تاريخية</h3>
          <p>مواقع وأحداث من تاريخ المدينة.</p>
          <button class="secondary" onclick="showCategory('historic')">استكشف</button>
        </div>
      </article>

      <article class="card">
        <img src="images/seerah.jpeg" alt="المتاحف والثقافة">
        <div class="card-body">
          <h3>متاحف وثقافة</h3>
          <p>متاحف وتجارب ثقافية وتراثية.</p>
          <button class="secondary" onclick="showCategory('culture')">استكشف</button>
        </div>
      </article>

      <article class="card">
        <img src="images/الفعاليات.jpeg" alt="الأماكن الطبيعية">
        <div class="card-body">
          <h3>أماكن طبيعية</h3>
          <p>جبال وحدائق ومزارع وأماكن مفتوحة.</p>
          <button class="secondary" onclick="showCategory('nature')">استكشف</button>
        </div>
      </article>
    </div>
  </section>

  <section class="featured">
    <div class="section-head">
      <div>
        <h2>أماكن لا تفوّت زيارتها</h2>
        <p>أبرز المحطات التي يمكنك إضافتها إلى رحلتك</p>
      </div>
    </div>

    <div class="grid">
      <article class="card">
        <img src="images/masajid2.jpeg" alt="المسجد النبوي">
        <div class="card-body">
          <span class="feature-tag">معلم ديني</span>
          <h3>المسجد النبوي</h3>
          <p>أحد أبرز معالم المدينة المنورة.</p>
          <button class="secondary" onclick="openMap('المسجد النبوي، المدينة المنورة')">عرض على الخريطة</button>
        </div>
      </article>

      <article class="card">
        <img src="images/مسجد قباء.jpeg" alt="مسجد قباء">
        <div class="card-body">
          <span class="feature-tag">معلم ديني</span>
          <h3>مسجد قباء</h3>
          <p>من أشهر المساجد التاريخية في المدينة.</p>
          <button class="secondary" onclick="openMap('مسجد قباء، المدينة المنورة')">عرض على الخريطة</button>
        </div>
      </article>

      <article class="card">
        <img src="images/باص سياحي.jpeg" alt="الباص السياحي">
        <div class="card-body">
          <span class="feature-tag">تجربة سياحية</span>
          <h3>الباص السياحي</h3>
          <p>تعرّف على خيارات الجولات السياحية ومواقفها.</p>
          <button class="secondary" onclick="openMap('الباص السياحي، المدينة المنورة')">الموقع على الخريطة</button>
        </div>
      </article>

      <article class="card">
        <img src="images/الخريطة.jpeg" alt="خريطة المدينة">
        <div class="card-body">
          <span class="feature-tag">دليل الزيارة</span>
          <h3>أبرز المعالم على الخريطة</h3>
          <p>افتح خريطة تفاعلية للمعالم في المدينة.</p>
          <button class="secondary" onclick="showPage('map')">افتح الخريطة</button>
        </div>
      </article>
    </div>
  </section>

  <section>
    <div class="section-head">
      <div>
        <h2>منظّم الزيارة</h2>
        <p>اختر الطريقة المناسبة لترتيب محطات رحلتك</p>
      </div>
    </div>

    <div class="organizer">
      <button class="action-card" onclick="showPage('smart')">
        <strong>✨ مسار مقترح</strong>
        <span>اقتراح ترتيب مبدئي للمعالم</span>
      </button>
      <button class="action-card" onclick="showPage('manual')">
        <strong>＋ مسار يدوي</strong>
        <span>اختر الأماكن بنفسك</span>
      </button>
      <button class="action-card" onclick="showPage('popular')">
        <strong>★ مسارات شائعة</strong>
        <span>أفكار لرحلات مقترحة</span>
      </button>
      <button class="action-card" onclick="showPage('previous')">
        <strong>↺ مساري السابق</strong>
        <span>عرض آخر مسار حفظته</span>
      </button>
    </div>
  </section>
</div>

<div id="contentPage" class="hidden"></div>
<footer>أثر المدينة — دليل استكشافي للزوار</footer>
</main>

<nav class="bottom-nav">
  <button onclick="showPage('home')">⌂ الرئيسية</button>
  <button onclick="showPage('categories')">المعالم</button>
  <button onclick="showPage('planner')">رحلتي</button>
  <button onclick="showPage('map')">الخريطة</button>
  <button onclick="showPage('profile')">حسابي</button>
</nav>

<script>
const places = [
{n:'المسجد النبوي',c:'religious',d:'أبرز معالم المدينة المنورة',q:'المسجد النبوي المدينة المنورة'},
{n:'مسجد قباء',c:'religious',d:'مسجد تاريخي معروف',q:'مسجد قباء المدينة المنورة'},
{n:'مسجد القبلتين',c:'religious',d:'من المساجد التاريخية',q:'مسجد القبلتين المدينة المنورة'},
{n:'مسجد الجمعة',c:'religious',d:'مرتبط بالسيرة النبوية',q:'مسجد الجمعة المدينة المنورة'},
{n:'مسجد الغمامة',c:'religious',d:'مسجد تاريخي',q:'مسجد الغمامة المدينة المنورة'},
{n:'مسجد السبع منارات',c:'religious',d:'تحقق من الاسم والموقع قبل الزيارة',q:'مسجد السبع منارات المدينة المنورة'},
{n:'مسجد أبي بكر الصديق',c:'religious',d:'مسجد تاريخي',q:'مسجد أبي بكر الصديق المدينة المنورة'},
{n:'مسجد علي بن أبي طالب',c:'religious',d:'مسجد تاريخي',q:'مسجد علي بن أبي طالب المدينة المنورة'},
{n:'مسجد عمر بن الخطاب',c:'religious',d:'مسجد تاريخي',q:'مسجد عمر بن الخطاب المدينة المنورة'},
{n:'مسجد بلال بن رباح',c:'religious',d:'مسجد تاريخي',q:'مسجد بلال بن رباح المدينة المنورة'},
{n:'مسجد الإجابة',c:'religious',d:'من المساجد المعروفة',q:'مسجد الإجابة المدينة المنورة'},
{n:'مسجد المستراح',c:'religious',d:'موقع مرتبط بالسيرة',q:'مسجد المستراح المدينة المنورة'},
{n:'مسجد السقيا',c:'religious',d:'مسجد تاريخي',q:'مسجد السقيا المدينة المنورة'},
{n:'مسجد الدرع',c:'religious',d:'موقع تاريخي',q:'مسجد الدرع المدينة المنورة'},
{n:'مسجد الراية',c:'religious',d:'موقع تاريخي',q:'مسجد الراية المدينة المنورة'},
{n:'مسجد الفتح',c:'religious',d:'ضمن مواقع الخندق',q:'مسجد الفتح المدينة المنورة'},
{n:'مسجد سلمان الفارسي',c:'religious',d:'ضمن منطقة المساجد السبعة',q:'مسجد سلمان الفارسي المدينة المنورة'},
{n:'مسجد أبي ذر',c:'religious',d:'مسجد معروف',q:'مسجد أبي ذر المدينة المنورة'},
{n:'مسجد السجدة',c:'religious',d:'موقع ديني',q:'مسجد السجدة المدينة المنورة'},
{n:'مسجد المنارتين',c:'religious',d:'تحقق من الاسم والموقع',q:'مسجد المنارتين المدينة المنورة'},

{n:'جبل أحد',c:'historic',d:'موقع غزوة أحد',q:'جبل أحد المدينة المنورة'},
{n:'مقبرة شهداء أحد',c:'historic',d:'موقع تاريخي مرتبط بغزوة أحد',q:'مقبرة شهداء أحد المدينة المنورة'},
{n:'موقع الخندق',c:'historic',d:'من المواقع المرتبطة بغزوة الخندق',q:'موقع غزوة الخندق المدينة المنورة'},
{n:'المساجد السبعة',c:'historic',d:'مجموعة مساجد تاريخية',q:'المساجد السبعة المدينة المنورة'},
{n:'سقيفة بني ساعدة',c:'historic',d:'موقع تاريخي في المدينة',q:'سقيفة بني ساعدة المدينة المنورة'},
{n:'بئر غرس',c:'historic',d:'بئر تاريخي',q:'بئر غرس المدينة المنورة'},
{n:'بئر عثمان',c:'historic',d:'بئر رومة التاريخي',q:'بئر عثمان بئر رومة المدينة المنورة'},
{n:'بئر حاء',c:'historic',d:'موقع تاريخي',q:'بئر حاء المدينة المنورة'},
{n:'محطة سكة الحجاز القديمة',c:'historic',d:'محطة تاريخية',q:'محطة سكة الحجاز المدينة المنورة'},
{n:'قلعة قباء',c:'historic',d:'موقع تراثي',q:'قلعة قباء المدينة المنورة'},
{n:'حي المغيسلة',c:'historic',d:'حي من أحياء المدينة القديمة',q:'حي المغيسلة المدينة المنورة'},
{n:'حي العيون',c:'historic',d:'من أحياء المدينة',q:'حي العيون المدينة المنورة'},
{n:'حي العنبرية',c:'historic',d:'من المناطق التاريخية',q:'حي العنبرية المدينة المنورة'},
{n:'ميدان سيد الشهداء',c:'historic',d:'منطقة تاريخية قرب جبل أحد',q:'ميدان سيد الشهداء المدينة المنورة'},

{n:'متحف دار المدينة',c:'culture',d:'يعرض تاريخ المدينة والسيرة',q:'متحف دار المدينة'},
{n:'متحف سكة الحجاز',c:'culture',d:'متحف في محطة الحجاز',q:'متحف سكة الحجاز المدينة المنورة'},
{n:'متحف المدينة المنورة',c:'culture',d:'متحف للتاريخ والتراث',q:'متحف المدينة المنورة'},
{n:'متحف القرآن الكريم',c:'culture',d:'معرض ومحتوى عن القرآن الكريم',q:'معرض القرآن الكريم المدينة المنورة'},
{n:'متحف وبستان الصافية',c:'culture',d:'تجربة ثقافية وتراثية',q:'متحف وبستان الصافية المدينة المنورة'},
{n:'معرض أسماء الله الحسنى',c:'culture',d:'معرض ثقافي',q:'معرض أسماء الله الحسنى المدينة المنورة'},
{n:'معرض عمارة المسجد النبوي',c:'culture',d:'يعرض تاريخ العمارة والتوسعات',q:'معرض عمارة المسجد النبوي'},
{n:'مركز بحوث ودراسات المدينة',c:'culture',d:'مركز معرفي وتاريخي',q:'مركز بحوث ودراسات المدينة المنورة'},
{n:'سوق التمور المركزي',c:'culture',d:'تجربة تسوق محلية',q:'سوق التمور المدينة المنورة'},
{n:'سوق قباء',c:'culture',d:'سوق شعبي وتجاري',q:'سوق قباء المدينة المنورة'},
{n:'سوق المناخة',c:'culture',d:'منطقة تجارية تاريخية',q:'سوق المناخة المدينة المنورة'},
{n:'مركز المدينة للفنون',c:'culture',d:'تحقق من الفعاليات الحالية',q:'مركز المدينة للفنون'},

{n:'جبل الرماة',c:'nature',d:'منطقة جبلية قرب أحد',q:'جبل الرماة المدينة المنورة'},
{n:'جبل عير',c:'nature',d:'من جبال المدينة',q:'جبل عير المدينة المنورة'},
{n:'جبل سلع',c:'nature',d:'موقع تاريخي وطبيعي',q:'جبل سلع المدينة المنورة'},
{n:'جبل الجماوات',c:'nature',d:'من الجبال المعروفة',q:'جبال الجماوات المدينة المنورة'},
{n:'حديقة الملك فهد المركزية',c:'nature',d:'مساحة خضراء للتنزه',q:'حديقة الملك فهد المركزية المدينة المنورة'},
{n:'حديقة جبل أحد',c:'nature',d:'تحقق من الموقع والإتاحة',q:'حديقة جبل أحد المدينة المنورة'},
{n:'حديقة الأمير محمد بن عبدالعزيز',c:'nature',d:'تحقق من الاسم والإتاحة',q:'حديقة الأمير محمد بن عبدالعزيز المدينة المنورة'},
{n:'حديقة النخيل',c:'nature',d:'تحقق من الموقع',q:'حديقة النخيل المدينة المنورة'},
{n:'حديقة قباء',c:'nature',d:'منطقة مفتوحة للتنزه',q:'حديقة قباء المدينة المنورة'},
{n:'حديقة الأراك',c:'nature',d:'تحقق من الموقع',q:'حديقة الأراك المدينة المنورة'},
{n:'وادي العقيق',c:'nature',d:'وادٍ معروف في المدينة',q:'وادي العقيق المدينة المنورة'},
{n:'وادي بطحان',c:'nature',d:'من أودية المدينة',q:'وادي بطحان المدينة المنورة'},
{n:'مزارع النخيل',c:'nature',d:'الدخول حسب المزرعة',q:'مزارع النخيل المدينة المنورة'},
{n:'مزارع العيون',c:'nature',d:'تحقق من إمكانية الزيارة',q:'مزارع العيون المدينة المنورة'},
{n:'مزارع قباء',c:'nature',d:'الدخول حسب المزرعة',q:'مزارع قباء المدينة المنورة'},
{n:'مزارع العاقول',c:'nature',d:'تحقق من إمكانية الزيارة',q:'مزارع العاقول المدينة المنورة'},
{n:'منتزه البيضاء البري',c:'nature',d:'منطقة طبيعية خارج المدينة',q:'منتزه البيضاء المدينة المنورة'},
{n:'منتزهات المدينة البرية',c:'nature',d:'تحقق من المواقع المتاحة',q:'منتزهات برية المدينة المنورة'},
{n:'بساتين المدينة',c:'nature',d:'الدخول حسب الموقع',q:'بساتين المدينة المنورة'}
];

const names = {
  religious:"المعالم الدينية",
  historic:"المعالم التاريخية",
  culture:"المتاحف والثقافة",
  nature:"الأماكن الطبيعية"
};

let customPlaces = [];
let selectedCategory = "all";

function showPage(page) {
  const home = document.getElementById("homePage");
  const content = document.getElementById("contentPage");

  home.classList.add("hidden");
  content.classList.remove("hidden");

  if(page === "home") {
    home.classList.remove("hidden");
    content.classList.add("hidden");
    return;
  }

  if(page === "categories") {
    content.innerHTML = `
      <h2 class="page-title">المعالم</h2>
      <div class="grid">
        ${Object.keys(names).map(c => `
          <button class="action-card" onclick="showCategory('${c}')">
            <strong>${names[c]}</strong>
            <span>استكشف الأماكن</span>
          </button>
        `).join("")}
      </div>`;
  }

  else if(page === "planner" || page === "manual") {
    showPlanner();
  }

  else if(page === "smart") {
    content.innerHTML = `
      <h2 class="page-title">المسار المقترح</h2>
      <div class="panel">
        <p>يمكنك البدء بزيارة أبرز معالم المدينة المنورة.</p>
        <div class="place-list">
          ${["المسجد النبوي","مسجد قباء","مسجد القبلتين","جبل أحد","متحف دار المدينة"].map(p => `
            <div class="place"><span>📍</span><div><strong>${p}</strong></div></div>
          `).join("")}
        </div>
        <button class="primary" onclick="usePopular(['المسجد النبوي','مسجد قباء','مسجد القبلتين','جبل أحد','متحف دار المدينة'])">استخدم هذا المسار</button>
      </div>`;
  }

  else if(page === "popular") {
    content.innerHTML = `
      <h2 class="page-title">المسارات الشائعة</h2>
      <div class="grid">
        <div class="card"><div class="card-body">
          <h3>المسار الديني</h3>
          <p>المسجد النبوي، قباء، القبلتين.</p>
          <button class="secondary" onclick="usePopular(['المسجد النبوي','مسجد قباء','مسجد القبلتين'])">اختيار المسار</button>
        </div></div>
        <div class="card"><div class="card-body">
          <h3>المسار التاريخي</h3>
          <p>جبل أحد، شهداء أحد، المساجد السبعة.</p>
          <button class="secondary" onclick="usePopular(['جبل أحد','مقبرة شهداء أحد','المساجد السبعة'])">اختيار المسار</button>
        </div></div>
        <div class="card"><div class="card-body">
          <h3>المسار الثقافي</h3>
          <p>متحف دار المدينة، محطة الحجاز، سوق التمور.</p>
          <button class="secondary" onclick="usePopular(['متحف دار المدينة','محطة سكة الحجاز القديمة','سوق التمور المركزي'])">اختيار المسار</button>
        </div></div>
      </div>`;
  }

  else if(page === "previous") {
    renderPreviousRoutes();
  }

  else if(page === "map") {
    content.innerHTML = `
      <h2 class="page-title">خريطة المدينة المنورة</h2>
      <div class="panel">
        <p>ابحث عن المكان الذي تريد الوصول إليه.</p>
        <div class="toolbar">
          <input id="mapSearch" placeholder="اكتب اسم المكان">
          <button class="primary" onclick="searchMap()">بحث</button>
        </div>
        <iframe class="map-box" id="mapFrame"
          src="https://maps.google.com/maps?q=المسجد%20النبوي%20المدينة%20المنورة&output=embed">
        </iframe>
      </div>`;
  }

  else if(page === "profile") {
    content.innerHTML = `
      <h2 class="page-title">حسابي</h2>
      <div class="panel">
        <h3>مرحبًا بك في أثر المدينة</h3>
        <p>يمكنك تسجيل الدخول أو إنشاء حساب.</p>
        <button class="primary" onclick="showPage('login')">تسجيل الدخول</button>
        <button class="secondary" onclick="showPage('register')">إنشاء حساب</button>
      </div>`;
  }

  else if(page === "login") {
    content.innerHTML = `
      <div class="panel form">
        <h2 class="page-title">تسجيل الدخول</h2>
        <label>البريد الإلكتروني</label>
        <input id="loginEmail" type="email" placeholder="البريد الإلكتروني">
        <label>كلمة المرور</label>
        <input id="loginPassword" type="password" placeholder="كلمة المرور">
        <button class="primary" style="margin-top:15px;width:100%" onclick="login()">دخول</button>
        <p><button class="secondary" onclick="showPage('forgot')">نسيت كلمة المرور؟</button></p>
        <p>ليس لديك حساب؟ <button class="secondary" onclick="showPage('register')">إنشاء حساب</button></p>
      </div>`;
  }

  else if(page === "register") {
    content.innerHTML = `
      <div class="panel form">
        <h2 class="page-title">إنشاء حساب</h2>
        <label>الاسم</label>
        <input id="regName" placeholder="الاسم الكامل">
        <label>البريد الإلكتروني</label>
        <input id="regEmail" type="email" placeholder="البريد الإلكتروني">
        <label>رقم الجوال</label>
        <input id="regPhone" type="tel" placeholder="رقم الجوال">
        <label>كلمة المرور</label>
        <input id="regPassword" type="password" placeholder="كلمة المرور">
        <button class="primary" style="margin-top:15px;width:100%" onclick="register()">إنشاء الحساب</button>
      </div>`;
  }

  else if(page === "forgot") {
    content.innerHTML = `
      <div class="panel form">
        <h2 class="page-title">استعادة كلمة المرور</h2>
        <p>أدخل بريدك الإلكتروني لاستعادة كلمة المرور.</p>
        <label>البريد الإلكتروني</label>
        <input id="forgotEmail" type="email" placeholder="البريد الإلكتروني">
        <button class="primary" style="margin-top:15px;width:100%" onclick="alert('هذه نسخة تجريبية؛ لا توجد خدمة إرسال بريد مفعّلة.')">إرسال</button>
      </div>`;
  }
}

function showCategory(category) {
  selectedCategory = category;
  const content = document.getElementById("contentPage");
  document.getElementById("homePage").classList.add("hidden");
  content.classList.remove("hidden");

  const filtered = places.filter(p => p.c === category);

  content.innerHTML = `
    <h2 class="page-title">${names[category]}</h2>
    <div class="panel">
      <div class="toolbar">
        <input id="placeSearch" placeholder="ابحث عن مكان..." oninput="filterPlaces()">
        <button class="secondary" onclick="showPage('home')">الرئيسية</button>
      </div>
      <div id="categoryPlaces" class="grid">
        ${filtered.map(placeCard).join("")}
      </div>
    </div>`;
}

function placeCard(place) {
  return `
    <div class="card">
      <div class="card-body">
        <span class="feature-tag">${names[place.c] || "مكان مضاف"}</span>
        <h3>${escapeHTML(place.n)}</h3>
        <p>${escapeHTML(place.d || "")}</p>
        <button class="secondary" onclick="openMap('${escapeJS(place.q || place.n)}')">عرض على الخريطة</button>
      </div>
    </div>`;
}

function filterPlaces() {
  const search = document.getElementById("placeSearch").value.trim();
  const filtered = places.filter(p => p.c === selectedCategory && p.n.includes(search));
  document.getElementById("categoryPlaces").innerHTML =
    filtered.map(placeCard).join("") || "<p>لا توجد نتائج.</p>";
}

function showPlanner() {
  const content = document.getElementById("contentPage");
  content.innerHTML = `
    <h2 class="page-title">خطّط لرحلتك</h2>
    <div class="panel">
      <p>اختاري الأماكن التي ترغبين بزيارتها:</p>
      <div class="toolbar">
        <input id="plannerSearch" placeholder="ابحثي عن مكان..." oninput="filterPlanner()">
        <select id="plannerCategory" onchange="filterPlanner()">
          <option value="all">جميع التصنيفات</option>
          <option value="religious">دينية</option>
          <option value="historic">تاريخية</option>
          <option value="culture">ثقافية</option>
          <option value="nature">طبيعية</option>
        </select>
      </div>
      <div id="plannerPlaces" class="place-list">
        ${places.map(plannerPlace).join("")}
      </div>
      <hr>
      <h3>إضافة مكان من اختيارك</h3>
      <div class="toolbar">
        <input id="customPlaceName" placeholder="اسم المكان">
        <input id="customPlaceDescription" placeholder="وصف المكان">
        <button class="primary" onclick="addCustomPlace()">إضافة</button>
      </div>
      <div id="customPlacesList"></div>
      <button class="primary" style="margin-top:18px" onclick="saveRoute()">حفظ مساري</button>
      <button class="secondary" onclick="openSelectedRoute()">عرض المسار على الخريطة</button>
    </div>`;
  renderCustomPlaces();
}

function plannerPlace(place) {
  return `
    <label class="place">
      <input type="checkbox" class="routeChoice" value="${escapeHTML(place.n)}">
      <span><strong>${escapeHTML(place.n)}</strong><small>${escapeHTML(place.d)}</small></span>
    </label>`;
}

function filterPlanner() {
  const search = document.getElementById("plannerSearch").value.trim();
  const category = document.getElementById("plannerCategory").value;
  const filtered = places.filter(p => p.n.includes(search) && (category === "all" || p.c === category));
  document.getElementById("plannerPlaces").innerHTML =
    filtered.map(plannerPlace).join("") || "<p>لا توجد نتائج.</p>";
}

function addCustomPlace() {
  const name = document.getElementById("customPlaceName").value.trim();
  const description = document.getElementById("customPlaceDescription").value.trim();

  if(!name) {
    alert("اكتبي اسم المكان أولًا.");
    return;
  }

  customPlaces.push({n:name,d:description || "مكان أضفته بنفسي"});
  document.getElementById("customPlaceName").value = "";
  document.getElementById("customPlaceDescription").value = "";
  renderCustomPlaces();
}

function renderCustomPlaces() {
  const box = document.getElementById("customPlacesList");
  if(!box) return;

  box.innerHTML = customPlaces.map((p,i) => `
    <div class="place">
      <span>📍</span>
      <span><strong>${escapeHTML(p.n)}</strong><small>${escapeHTML(p.d)}</small></span>
      <button class="secondary" onclick="removeCustomPlace(${i})">حذف</button>
    </div>`).join("");
}

function removeCustomPlace(index) {
  customPlaces.splice(index,1);
  renderCustomPlaces();
}

function getSelectedPlaces() {
  const selected = [...document.querySelectorAll(".routeChoice:checked")].map(x => x.value);
  return [...selected,...customPlaces.map(p => p.n)];
}

function saveRoute() {
  const selected = getSelectedPlaces();

  if(!selected.length) {
    alert("اختاري مكانًا واحدًا على الأقل.");
    return;
  }

  let routes = JSON.parse(localStorage.getItem("atharRoutes") || "[]");

  const route = {
    id:Date.now(),
    name:"رحلتي في المدينة",
    places:selected,
    date:new Date().toLocaleDateString("ar-SA")
  };

  routes.push(route);
  localStorage.setItem("atharRoutes",JSON.stringify(routes));
  localStorage.setItem("atharRoute",JSON.stringify(route));

  alert("تم حفظ مسارك بنجاح.");
}

function renderPreviousRoutes() {
  const content = document.getElementById("contentPage");
  const routes = JSON.parse(localStorage.getItem("atharRoutes") || "[]");

  content.innerHTML = `
    <h2 class="page-title">مساراتي السابقة</h2>
    <div class="panel">
      ${routes.length ? routes.map(route => `
        <div class="place">
          <div style="flex:1">
            <strong>${escapeHTML(route.name)}</strong>
            <small>${route.date} — ${route.places.length} أماكن</small>
            <small>${route.places.map(escapeHTML).join("، ")}</small>
          </div>
          <button class="secondary" onclick="openSavedRoute(${route.id})">عرض</button>
          <button class="secondary" onclick="deleteRoute(${route.id})">حذف</button>
        </div>`).join("") : "<p>لم تحفظ أي مسارات حتى الآن.</p>"}
    </div>`;
}

function openSavedRoute(id) {
  const routes = JSON.parse(localStorage.getItem("atharRoutes") || "[]");
  const route = routes.find(r => r.id === id);
  if(route) openSelectedPlaces(route.places);
}

function deleteRoute(id) {
  let routes = JSON.parse(localStorage.getItem("atharRoutes") || "[]");
  routes = routes.filter(r => r.id !== id);
  localStorage.setItem("atharRoutes",JSON.stringify(routes));
  renderPreviousRoutes();
}

function openSelectedRoute() {
  openSelectedPlaces(getSelectedPlaces());
}

function openSelectedPlaces(selected) {
  if(!selected.length) {
    alert("لا توجد أماكن محددة.");
    return;
  }

  const destination = selected.map(encodeURIComponent).join("/");
  window.open(
    "https://www.google.com/maps/dir/" + destination + "/المدينة المنورة",
    "_blank"
  );
}

function usePopular(items) {
  showPlanner();
  setTimeout(() => {
    document.querySelectorAll(".routeChoice").forEach(box => {
      box.checked = items.includes(box.value);
    });
  },100);
}

function openMap(query) {
  window.open(
    "https://www.google.com/maps/search/?api=1&query=" + encodeURIComponent(query),
    "_blank"
  );
}

function searchMap() {
  const query = document.getElementById("mapSearch").value.trim();

  if(query) {
    document.getElementById("mapFrame").src =
      "https://maps.google.com/maps?q=" + encodeURIComponent(query + " المدينة المنورة") + "&output=embed";
  }
}

function login() {
  const email = document.getElementById("loginEmail").value.trim();
  const password = document.getElementById("loginPassword").value;

  if(!email || !password) {
    alert("أدخلي البريد الإلكتروني وكلمة المرور.");
    return;
  }

  alert("هذه نسخة تجريبية من تسجيل الدخول.");
}

function register() {
  const name = document.getElementById("regName").value.trim();
  const email = document.getElementById("regEmail").value.trim();
  const phone = document.getElementById("regPhone").value.trim();
  const password = document.getElementById("regPassword").value;

  if(!name || !email || !phone || !password) {
    alert("فضلاً أكملي جميع البيانات.");
    return;
  }

  alert("تم استلام البيانات في النسخة التجريبية.");
}

function changeLanguage(lang) {
  const messages = {
    ar:"تم اختيار اللغة العربية",
    en:"English selected",
    id:"Bahasa Indonesia dipilih",
    ur:"اردو منتخب کی گئی"
  };

  alert(messages[lang] || messages.ar);
}

function escapeHTML(value) {
  return String(value).replace(/[&<>"']/g, ch => ({
    "&":"&amp;",
    "<":"&lt;",
    ">":"&gt;",
    '"':"&quot;",
    "'":"&#39;"
  }[ch]));
}

function escapeJS(value) {
  return String(value)
    .replace(/\\/g,"\\\\")
    .replace(/'/g,"\\'")
    .replace(/\n/g," ");
}

setTimeout(() => {
  const splash = document.getElementById("splash");
  if(splash) splash.style.display = "none";
},5000);

showPage("home");
</script>

</body>
</html>
