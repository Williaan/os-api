/*
  Warnings:

  - You are about to drop the column `create_At` on the `clients` table. All the data in the column will be lost.
  - You are about to drop the `services` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `exit_time` to the `cars` table without a default value. This is not possible if the table is not empty.
  - Added the required column `parts` to the `cars` table without a default value. This is not possible if the table is not empty.
  - Added the required column `service` to the `cars` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "services" DROP CONSTRAINT "services_carsId_fkey";

-- DropForeignKey
ALTER TABLE "services" DROP CONSTRAINT "services_clientId_fkey";

-- AlterTable
ALTER TABLE "cars" ADD COLUMN     "exit_time" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "parts" TEXT NOT NULL,
ADD COLUMN     "service" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "clients" DROP COLUMN "create_At";

-- DropTable
DROP TABLE "services";
