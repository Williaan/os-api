/*
  Warnings:

  - The primary key for the `cars` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `cars` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `clientId` column on the `cars` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `clients` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `clients` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- DropForeignKey
ALTER TABLE "cars" DROP CONSTRAINT "cars_clientId_fkey";

-- AlterTable
ALTER TABLE "cars" DROP CONSTRAINT "cars_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "clientId",
ADD COLUMN     "clientId" INTEGER,
ADD CONSTRAINT "cars_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "clients" DROP CONSTRAINT "clients_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "clients_pkey" PRIMARY KEY ("id");

-- AddForeignKey
ALTER TABLE "cars" ADD CONSTRAINT "cars_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "clients"("id") ON DELETE SET NULL ON UPDATE CASCADE;
