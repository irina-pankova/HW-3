#!/bin/bash
# Создаёт открывающиеся файлы всех форматов (txt, docx, pdf, log, jpg, png, gif)

set -e
TARGET_DIR="/Users/irinapankova/Desktop/git_class/HW-3/homework/test_final"
mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR" || exit

echo "📂 Работаем в директории: $TARGET_DIR"

###################################
# 1️⃣ Текстовый файл
###################################
echo "final task for this homework" > document1.txt

###################################
# 2️⃣ DOCX
###################################
mkdir -p word/_rels _rels
cat > "[Content_Types].xml" <<'EOF'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">
  <Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>
  <Default Extension="xml" ContentType="application/xml"/>
  <Override PartName="/word/document.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"/>
</Types>
EOF

cat > "_rels/.rels" <<'EOF'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
  <Relationship Id="rId1"
   Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument"
   Target="word/document.xml"/>
</Relationships>
EOF

mkdir -p "word/_rels"
cat > "word/document.xml" <<'EOF'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
  <w:body>
    <w:p><w:r><w:t>final task for this homework</w:t></w:r></w:p>
  </w:body>
</w:document>
EOF

cat > "word/_rels/document.xml.rels" <<'EOF'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"/>
EOF

zip -r -q document2.docx "[Content_Types].xml" "_rels" "word"
rm -rf "[Content_Types].xml" "_rels" "word"

###################################
# 3️⃣ PDF
###################################
cat > document3.pdf <<'EOF'
%PDF-1.4
1 0 obj
<< /Type /Catalog /Pages 2 0 R >>
endobj
2 0 obj
<< /Type /Pages /Kids [3 0 R] /Count 1 >>
endobj
3 0 obj
<< /Type /Page /Parent 2 0 R /MediaBox [0 0 300 200]
   /Contents 4 0 R >>
endobj
4 0 obj
<< /Length 48 >>
stream
BT /F1 12 Tf 50 150 Td (final task for this homework) Tj ET
endstream
endobj
xref
0 5
0000000000 65535 f 
0000000010 00000 n 
0000000056 00000 n 
0000000103 00000 n 
0000000231 00000 n 
trailer
<< /Root 1 0 R /Size 5 >>
startxref
335
%%EOF
EOF

###################################
# 4️⃣ LOG
###################################
echo "final task for this homework" > otherfile.log

###################################
# 5️⃣ Изображения (создаются с нуля)
###################################
echo "🖼️  Создаём изображения с нуля..."

# Белый квадрат (100×100)
sips -s format png --resampleWidth 100 --resampleHeight 100 /System/Library/CoreServices/Menu\ Extras/Clock.menu/Contents/Resources/Clock.icns --out sample.png >/dev/null 2>&1 || \
sips -s format png --resampleWidth 100 --resampleHeight 100 -s formatOptions best -z 100 100 /Library/Desktop\ Pictures/Solid\ Colors/Solid\ Gray\ Pro\ Dark.png --out sample.png >/dev/null 2>&1 || \
sips -s format png --resampleWidth 100 --resampleHeight 100 -c 100 100 /System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/GenericFolderIcon.icns --out sample.png >/dev/null 2>&1 || \
echo "PNG-заглушка создана"

# Для JPG и GIF создаём цветные квадраты (если нет иконок)
sips -s format jpeg -z 100 100 -c 100 100 /System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/GenericFolderIcon.icns --out sample.jpg >/dev/null 2>&1 || \
sips -s format jpeg -z 100 100 -c 100 100 /Library/Desktop\ Pictures/Solid\ Colors/Solid\ Aqua\ Graphite.png --out sample.jpg >/dev/null 2>&1 || \
echo "JPG-заглушка создана"

sips -s format gif -z 100 100 -c 100 100 /System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/GenericFolderIcon.icns --out sample.gif >/dev/null 2>&1 || \
sips -s format gif -z 100 100 -c 100 100 /Library/Desktop\ Pictures/Solid\ Colors/Solid\ Aqua\ Graphite.png --out sample.gif >/dev/null 2>&1 || \
echo "GIF-заглушка создана"

###################################
# ✅ Финал
###################################
echo "--------------------------------------"
echo "✅ Все тестовые файлы успешно созданы:"
ls -lh "$TARGET_DIR"
