# Οδηγίες GitHub — Βήμα-βήμα

## ΒΗΜΑ 1: Δημιουργία δωρεάν GitHub λογαριασμού

1. Πηγαίνετε στο **https://github.com/signup**
2. Βάλτε το email σας (π.χ. tonypanopoulos@gmail.com)
3. Επιλέξτε password
4. Επιβεβαιώστε το email
5. Ολοκλήρωση — δωρεάν, παίρνει 2 λεπτά

---

## ΒΗΜΑ 2: Δημιουργία νέου Repository

1. Στο GitHub, κλικ **"New"** (πράσινο κουμπί πάνω αριστερά)
2. Repository name: **`liastravel-app`**
3. Visibility: **Private** (μόνο εσείς το βλέπετε)
4. Κλικ **"Create repository"**

---

## ΒΗΜΑ 3: Upload των αρχείων

### Επιλογή Α — Μέσω browser (πιο εύκολο):
1. Στο repository, κλικ **"uploading an existing file"**
2. Κάντε drag & drop ΟΛΑ τα αρχεία του φακέλου liastravel-app
3. Κλικ **"Commit changes"**

### Επιλογή Β — Με Git (πιο επαγγελματικό):
```bash
cd liastravel-app
git init
git add .
git commit -m "Initial commit - Lia's Travel app"
git remote add origin https://github.com/YOUR-USERNAME/liastravel-app.git
git push -u origin main
```

---

## ΒΗΜΑ 4: Το build ξεκινά αυτόματα!

Μόλις κάνετε upload τα αρχεία:
1. Πηγαίνετε στο tab **"Actions"** του repository
2. Θα δείτε το workflow να τρέχει (πράσινο spinner)
3. Περιμένετε ~15-20 λεπτά
4. Μόλις τελειώσει → κλικ **"Artifacts"** → κατεβάστε το **APK**!

---

## ΒΗΜΑ 5: Προσθήκη Keystore για Release Build

Για να φτιάξετε release build (για Play Store):

### Δημιουργία Keystore:
```bash
keytool -genkey -v -keystore liastravel.keystore \
  -alias liastravel \
  -keyalg RSA -keysize 2048 \
  -validity 10000
```

### Μετατροπή σε Base64:
```bash
base64 liastravel.keystore
```

### Προσθήκη στο GitHub:
1. Repository → **Settings** → **Secrets and variables** → **Actions**
2. Προσθέστε αυτά τα 4 secrets:
   - `KEYSTORE_FILE` = το output του base64 παραπάνω
   - `KEYSTORE_PASSWORD` = το password που επιλέξατε
   - `KEY_ALIAS` = `liastravel`
   - `KEY_PASSWORD` = το key password

---

## Τι παίρνετε:

| Αρχείο | Χρήση |
|--------|-------|
| `app-debug.apk` | Για δοκιμή σε Android κινητό |
| `app-release.aab` | Για ανέβασμα στο Google Play Store |

---

## Για το Play Store:
1. Κατεβάστε το `app-release.aab` από τα Artifacts
2. Πηγαίνετε στο Google Play Console
3. Δημιουργήστε νέα εφαρμογή
4. Upload το `.aab` αρχείο
5. Συμπληρώστε τα στοιχεία και υποβάλετε για έλεγχο

---

## Για το App Store (iOS):
Χρειάζεται Mac με Xcode. Εναλλακτικά:
- **Codemagic.io** — cloud build service, έχει δωρεάν tier
- Πηγαίνετε στο https://codemagic.io και συνδέστε το GitHub repository σας
