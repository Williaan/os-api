import { Request, Response } from 'express';
import { prisma } from '../utils/prisma';
import { validateClient } from '../utils/yup';


export class ClientsController {
    async createClient(request: Request, response: Response) {
        const { name, cpf, email, phone, cep, street, district, city,
            model, plate, parts, service } = request.body;

        try {
            await validateClient.validate(request.body);

            const cpfExist = await prisma.client.findUnique({ where: { cpf } });

            if (cpfExist) {
                return response.status(400).json({ mensagem: 'Já existe um CPF cadastrado!!' })
            }


            const client = await prisma.client.create({
                data: {
                    name,
                    cpf,
                    email,
                    phone,
                    cep,
                    street,
                    district,
                    city,
                    model,
                    plate: plate.toUpperCase(),
                    parts,
                    service,
                }
            })

            return response.status(201).json({ mensagem: 'Cadastrado com sucesso!' });

        } catch (error) {
            return response.status(400).json(error);
        }
    }


    async readAll(request: Request, response: Response) {
        try {
            const readClients = await prisma.client.findMany();

            return response.status(200).json(readClients);

        } catch (error) {
            return response.status(400).json(error);
        }
    }


    async readClient(request: Request, response: Response) {
        const { id } = request.params;

        try {
            const clientExist = await prisma.client.findUnique({ where: { id: Number(id) } });

            if (!clientExist) {
                return response.status(400).json("Esse cliente não foi encontrado!");
            }


            const client = await prisma.client.findUnique({ where: { id: Number(id) } });

            return response.status(200).json(client)

        } catch (error) {
            return response.status(400).json(error);
        }
    }


    async deleteClient(request: Request, response: Response) {
        const { id } = request.params;

        try {
            const clientExist = await prisma.client.findUnique({ where: { id: Number(id) } });

            if (!clientExist) {
                return response.status(400).json("Esse cliente não foi encontrado!")
            }

            const deleteClient = await prisma.client.delete({ where: { id: Number(id) } });

            return response.status(200).json({ mensagem: 'Deletado com sucesso!' });


        } catch (error) {
            return response.status(400).json(error);
        }
    }


    async updateClient(request: Request, response: Response) {
        const { id } = request.params;
        const { name, cpf, email, phone, cep, street, district, city,
            model, plate, parts, service, } = request.body;

        try {
            await validateClient.validate(request.body);

            const clientExist = await prisma.client.findUnique({ where: { id: Number(id) } });

            if (!clientExist) {
                return response.status(400).json("Esse cliente não foi encontrado!")
            }

            const updateClient = await prisma.client.update({
                where: { id: Number(id) },
                data: {
                    name,
                    cpf,
                    email,
                    phone,
                    cep,
                    street,
                    district,
                    city,
                    model,
                    plate,
                    parts,
                    service,
                }
            });

            return response.status(200).json("Atualizado com sucesso!");

        } catch (error) {
            return response.status(400).json(error);
        }
    }
}
