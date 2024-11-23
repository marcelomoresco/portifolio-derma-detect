const multer = require("multer");
const path = require("path");

// Configurar armazenamento com multer
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, path.join(__dirname, "../uploads/")); // Diretório para salvar os arquivos
  },
  filename: (req, file, cb) => {
    cb(null, `${Date.now()}-${file.originalname}`);
  },
});

const fileFilter = (req, file, cb) => {
  console.log(file.mimetype);
  const allowedTypes = /jpeg|jpg|png|gif/; // Tipos permitidos
  const extname = allowedTypes.test(
    path.extname(file.originalname).toLowerCase()
  );
  const mimetype = allowedTypes.test(file.mimetype);

  if (extname && mimetype) {
    cb(null, true); // Arquivo permitido
  } else {
    cb(new Error("Tipo de arquivo não suportado")); // Rejeita o arquivo
  }
};

const upload = multer({ storage, fileFilter });

module.exports = { upload };
