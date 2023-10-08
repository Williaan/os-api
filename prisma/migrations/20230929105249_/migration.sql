/*
  Warnings:

  - You are about to drop the `cars` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[plate]` on the table `clients` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `model` to the `clients` table without a default value. This is not possible if the table is not empty.
  - Added the required column `parts` to the `clients` table without a default value. This is not possible if the table is not empty.
  - Added the required column `plate` to the `clients` table without a default value. This is not possible if the table is not empty.
  - Added the required column `service` to the `clients` table without a default value. This is not possible if the table is not empty.
  - Added the required column `update_At` to the `clients` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "cars" DROP CONSTRAINT "cars_clientId_fkey";

-- AlterTable
ALTER TABLE "clients" ADD COLUMN     "create_At" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "model" TEXT NOT NULL,
ADD COLUMN     "parts" TEXT NOT NULL,
ADD COLUMN     "plate" TEXT NOT NULL,
ADD COLUMN     "service" TEXT NOT NULL,
ADD COLUMN     "update_At" TIMESTAMP(3) NOT NULL;

-- DropTable
DROP TABLE "cars";

-- CreateIndex
CREATE UNIQUE INDEX "clients_plate_key" ON "clients"("plate");
