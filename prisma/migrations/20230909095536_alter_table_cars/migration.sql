/*
  Warnings:

  - You are about to drop the column `hour_value` on the `cars` table. All the data in the column will be lost.
  - You are about to drop the column `size` on the `cars` table. All the data in the column will be lost.
  - Added the required column `parts` to the `cars` table without a default value. This is not possible if the table is not empty.
  - Added the required column `service` to the `cars` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "cars" DROP COLUMN "hour_value",
DROP COLUMN "size",
ADD COLUMN     "parts" TEXT NOT NULL,
ADD COLUMN     "service" TEXT NOT NULL;
