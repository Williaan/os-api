/*
  Warnings:

  - The primary key for the `cars` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- AlterTable
ALTER TABLE "cars" DROP CONSTRAINT "cars_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "cars_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "cars_id_seq";
