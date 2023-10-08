-- CreateTable
CREATE TABLE "clients" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "cep" TEXT NOT NULL,
    "street" TEXT NOT NULL,
    "district" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "create_At" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "clients_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cars" (
    "id" SERIAL NOT NULL,
    "model" TEXT NOT NULL,
    "plate" TEXT NOT NULL,
    "size" TEXT NOT NULL,
    "hour_value" TEXT NOT NULL,
    "entry_time" TEXT NOT NULL,
    "exit_time" TEXT NOT NULL,
    "create_At" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "cars_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "clients_cpf_key" ON "clients"("cpf");

-- CreateIndex
CREATE UNIQUE INDEX "clients_email_key" ON "clients"("email");

-- CreateIndex
CREATE UNIQUE INDEX "cars_plate_key" ON "cars"("plate");
