-- AlterTable
ALTER TABLE "cars" ADD COLUMN     "clientId" INTEGER;

-- AddForeignKey
ALTER TABLE "cars" ADD CONSTRAINT "cars_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "clients"("id") ON DELETE SET NULL ON UPDATE CASCADE;
