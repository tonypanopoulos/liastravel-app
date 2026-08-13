#!/bin/bash
# Αυτόματο setup script για Lia's Travel app
# Τρέξτε: bash setup.sh

set -e

echo "🚀 Lia's Travel App Setup"
echo "=========================="

# Έλεγχος Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Δεν βρέθηκε Node.js. Κατεβάστε από https://nodejs.org"
    exit 1
fi
echo "✅ Node.js: $(node --version)"

# Εγκατάσταση dependencies
echo ""
echo "📦 Εγκατάσταση dependencies..."
npm install

# Δημιουργία Android platform
echo ""
echo "🤖 Προσθήκη Android platform..."
npx cap add android || echo "Android ήδη υπάρχει, παρακάμπτω..."

# Sync
echo ""
echo "🔄 Sync αρχείων..."
npx cap sync android

# Έλεγχος για Mac (iOS)
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo ""
    echo "🍎 Προσθήκη iOS platform..."
    npx cap add ios || echo "iOS ήδη υπάρχει, παρακάμπτω..."
    npx cap sync ios
    echo "✅ iOS platform έτοιμο"
else
    echo ""
    echo "ℹ️  iOS δημιουργία διαθέσιμη μόνο σε Mac"
fi

echo ""
echo "🎉 Setup ολοκληρώθηκε!"
echo ""
echo "Επόμενα βήματα:"
echo "  Android: npx cap open android"
if [[ "$OSTYPE" == "darwin"* ]]; then
echo "  iOS:     npx cap open ios"
fi
echo ""
echo "📖 Διαβάστε τις πλερεις οδηγίες: ΟΔΗΓΙΕΣ-ΕΓΚΑΤΑΣΤΑΣΗΣ.md"
