# Kic-Checkers

Kic-Checkers is a Checkers game for the web<!-- and Android-->. It is free, open source, has no ads, no in app purchases, no analytics or trackers, and works fully offline.

Based on [Chogan](https://github.com/choganhq/chogan) by [Margani](https://github.com/margani), MIT licence.

## English
### Notice
This forked repo is entirely built with the help of AI currently. The modified code of HTML is from AI. The ideas, style choices, review, writing (writing can be drafted first by AI but will always be looked upon and edited by hand), come from me (HuevosKicker). I lack the skills for coding currently but am learning as things are getting built. If you do not approve of this, I understand. If you are okay with it, please continue below 👇

### The game
Play game on web now! [GAME](https://huevoskicker.github.io/Kic-Checkers/games/checkers/index.html
)

> I recommend playing on [Cromite](https://github.com/uazo/cromite). Bigger board and less lag if you have. Also, very privacy tuned.

Checkers on an 8×8 board with three rule sets:

- **Classic:** compulsory jumps that run to the end, and Kings that can step backwards.
- **Spanish:** flying Kings, and the capture that takes the most pieces.
- **Huevo Style:** optional capture only, a chain that can stop after any landing, Queens and empresses with a 15 turn edge timer, Jesters that bring the force captures to *Huevo*, Scouters who has a liking to hopping even on his allies. Designed by [HuevosKicker](https://github.com/HuevosKicker).

Play against the AI on three levels, or with two players on one device. <!--There is also a daily classic game from a seeded opening against the hard AI.-->

### Playing
Web version, with no build step:

```
python3 -m http.server -d www 8000
```

Then open

`http://localhost:8000`

After the first load the game works offline.
### Shortcuts
Check out [discussions/1](https://github.com/HuevosKicker/Kic-Checkers/discussions/1) for chatting ideas

See [RULES.md](RULES.md) for the full rules, and [the design notes](https://gist.github.com/HuevosKicker/78b176ca6410be831e1e0a91a40750f9) for measurements and history.

See the full commit history: [commits/kic-only](https://github.com/HuevosKicker/Kic-Checkers/commits/kic-only).
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