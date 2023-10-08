/*
  Warnings:

  - The primary key for the `clients` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE "cars" DROP CONSTRAINT "cars_clientId_fkey";

-- AlterTable
ALTER TABLE "cars" ALTER COLUMN "clientId" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "clients" DROP CONSTRAINT "clients_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "clients_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "clients_id_seq";

-- AddForeignKey
ALTER TABLE "cars" ADD CONSTRAINT "cars_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "clients"("id") ON DELETE SET NULL ON UPDATE CASCADE;
