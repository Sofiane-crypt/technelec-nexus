-- 1. Les Types (Enums)
CREATE TYPE "RangeType" AS ENUM ('HST', 'VST', 'VSTL');
CREATE TYPE "DocType" AS ENUM ('PLAN_FAB', 'PLAN_ECLATE', 'PROCEDURE');

-- 2. Création des Tables
CREATE TABLE "Product" (
    "id" VARCHAR(255) PRIMARY KEY,
    "reference" VARCHAR(255) UNIQUE NOT NULL,
    "designation" TEXT NOT NULL,
    "range" "RangeType" NOT NULL,
    "sellingPrice" DECIMAL(10,2) DEFAULT 0.00,
    "imageUrl" TEXT,
    "description" TEXT,
    "createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "Supplier" (
    "id" VARCHAR(255) PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL,
    "contactEmail" VARCHAR(255)
);

CREATE TABLE "Component" (
    "id" VARCHAR(255) PRIMARY KEY,
    "reference" VARCHAR(255),
    "name" TEXT NOT NULL,
    "unitPrice" DECIMAL(10,2) DEFAULT 0.00,
    "supplierId" VARCHAR(255) REFERENCES "Supplier"("id") ON DELETE SET NULL
);

CREATE TABLE "BOM" (
    "id" VARCHAR(255) PRIMARY KEY,
    "productId" VARCHAR(255) REFERENCES "Product"("id") ON DELETE CASCADE,
    "componentId" VARCHAR(255) REFERENCES "Component"("id") ON DELETE CASCADE,
    "quantity" DECIMAL(10,2) NOT NULL DEFAULT 1.00
);

CREATE TABLE "ManufacturingStep" (
    "id" VARCHAR(255) PRIMARY KEY,
    "productId" VARCHAR(255) REFERENCES "Product"("id") ON DELETE CASCADE,
    "stepOrder" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "instructions" TEXT,
    "photoUrl" TEXT,
    "estimatedTime" DECIMAL(10,2) DEFAULT 0.00,
    "hourlyRate" DECIMAL(10,2) DEFAULT 50.00
);

CREATE TABLE "Document" (
    "id" VARCHAR(255) PRIMARY KEY,
    "productId" VARCHAR(255) REFERENCES "Product"("id") ON DELETE CASCADE,
    "type" "DocType" NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "fileUrl" TEXT NOT NULL,
    "version" VARCHAR(50) DEFAULT '1.0',
    "uploadedAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "Setting" (
    "key" VARCHAR(255) PRIMARY KEY,
    "value" VARCHAR(255) NOT NULL,
    "description" TEXT
);

-- 3. Insertion de données de test (pour pouvoir coder l'interface)
INSERT INTO "Product" ("id", "reference", "designation", "range", "sellingPrice") VALUES
('piece_vst_1', 'TECH 000', 'Rail vertical aluminium anodisé 3m', 'VST', 28.00),
('piece_hst_1', 'TECH 100', 'Rail-T en aluminium anodisé horizontal', 'HST', 28.00);

INSERT INTO "Supplier" ("id", "name") VALUES 
('supp_1', 'Fournisseur Aluminium Dupont');

INSERT INTO "Component" ("id", "reference", "name", "unitPrice", "supplierId") VALUES
('comp_1', 'ALU-BRUT-01', 'Barre Alu Brut 6m', 15.50, 'supp_1');

INSERT INTO "BOM" ("id", "productId", "componentId", "quantity") VALUES
('bom_1', 'piece_vst_1', 'comp_1', 0.5); -- Il faut une demi barre pour faire un rail de 3m

INSERT INTO "ManufacturingStep" ("id", "productId", "stepOrder", "name", "estimatedTime", "hourlyRate") VALUES
('step_1', 'piece_vst_1', 1, 'Usinage (trous intérieurs)', 0.5, 50.00);