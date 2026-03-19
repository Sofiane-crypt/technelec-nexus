-- 1. Création du type de Gamme (Enum)
CREATE TYPE "RangeType" AS ENUM ('HST', 'VST', 'VSTL');

-- 2. Création de la table principale des Pièces (Product)
CREATE TABLE "Product" (
    "id" VARCHAR(255) PRIMARY KEY,
    "reference" VARCHAR(255) UNIQUE NOT NULL,
    "designation" TEXT NOT NULL,
    "range" "RangeType" NOT NULL,
    "imageUrl" TEXT,
    "description" TEXT,
    "createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 3. Insertion de vos premières données (issues de vos CSV)
INSERT INTO "Product" ("id", "reference", "designation", "range") VALUES
('piece_vst_1', 'TECH 000', 'Rail vertical aluminium anodisé. Longueur 3m ou 6m', 'VST'),
('piece_vst_2', 'TECH 000/A (Side)', 'Cintrage type A Rail non inclus. Rayon 33cm', 'VST'),
('piece_hst_1', 'TECH 100', 'Rail-T en aluminium anodisé horizontal', 'HST'),
('piece_hst_2', 'TECH 100/A (side)', 'Cintrage type A (suivant plan)', 'HST');