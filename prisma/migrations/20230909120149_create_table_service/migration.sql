/*
  Warnings:

  - You are about to drop the column `entry_time` on the `cars` table. All the data in the column will be lost.
  - You are about to drop the column `exit_time` on the `cars` table. All the data in the column will be lost.
  - You are about to drop the column `parts` on the `cars` table. All the data in the column will be lost.
  - You are about to drop the column `service` on the `cars` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "cars" DROP COLUMN "entry_time",
DROP COLUMN "exit_time",
DROP COLUMN "parts",
DROP COLUMN "service";

-- CreateTable
CREATE TABLE "services" (
    "id" SERIAL NOT NULL,
    "parts" TEXT NOT NULL,
    "service" TEXT NOT NULL,
    "entry_time" TEXT NOT NULL,
    "exit_time" TEXT NOT NULL,
    "carsId" INTEGER,
    "clientId" INTEGER,

    CONSTRAINT "services_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "services" ADD CONSTRAINT "services_carsId_fkey" FOREIGN KEY ("carsId") REFERENCES "cars"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "services" ADD CONSTRAINT "services_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "clients"("id") ON DELETE SET NULL ON UPDATE CASCADE;
