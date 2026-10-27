# Kic-Checkers

Kic-Checkers is a Checkers game for the web<!-- and Android-->. It is free, open source, has no ads, no in app purchases, no analytics or trackers, and works fully offline.

Based on [Chogan](https://github.com/choganhq/chogan) by Margani, MIT licence.

## English

### The game

Checkers on an 8×8 board with three rule sets:

- **Classic:** compulsory jumps that run to the end, and kings that can step backwards.
- **Spanish:** flying kings, and the capture that takes the most pieces.
- **Huevo Style:** optional capture only, a chain that can stop after any landing, queens and empresses with a 15-turn edge timer. Designed by [HuevosKicker](https://github.com/HuevosKicker).

Play against the AI on three levels, or with two players on one device. <!--There is also a daily classic game from a seeded opening against the hard AI.-->

### Playing

Web version, with no build step:

```
python3 -m http.server -d www 8000
```

Then open `http://localhost:8000` in your browser. After the first load the game works offline.

<!--Android: the Gradle project is in `android/`.

```
cd android && gradle assembleDebug
```

### Testing

```
node tools/test.js
tools/browser-check.sh
```
-->
### Licence

MIT. See [LICENSE](LICENSE). The original copyright notice from Chogan is kept in that file.
<!--
## فارسی

کیکچکرز یک بازی چکرز روی تخته‌ی ۸×۸ برای وب و اندروید است. رایگان و متن‌باز است، بدون تبلیغ، بدون خرید درون‌برنامه‌ای و بدون ردیاب، و کاملاً آفلاین کار می‌کند.

بر پایه‌ی [چوگان](https://github.com/choganhq/chogan) از Margani، با مجوز MIT.

### بازی

سه قانون: کلاسیک با زدن اجباری و شاه‌هایی که به عقب هم می‌روند؛ اسپانیایی با شاه پرنده؛ و سبک Huevo با زدن اختیاری، زنجیره‌ای که پس از هر فرود می‌تواند بایستد، ملکه و امپراتریس با تایمر لبه‌ی ۱۵ نوبتی، و جستر. طراحی سبک Huevo از HuevosKicker است.

می‌توانی با هوش مصنوعی در سه سطح بازی کنی یا دو نفره روی یک دستگاه. بازی روزانه‌ی کلاسیک هم هست.

### اجرا

```
python3 -m http.server -d www 8000
```

سپس http://localhost:8000 را باز کن. بعد از اولین بارگذاری، بازی بدون اینترنت هم کار می‌کند.

### مجوز

MIT. متن کامل در [LICENSE](LICENSE)، همراه با اعلان کپی‌رایت اصلی از Chogan.
-->