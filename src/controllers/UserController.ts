import { Request, Response } from 'express';
import { prisma } from '../utils/prisma';
import { validateUser } from '../utils/yup';
import { hash } from 'bcryptjs';


export class UserController {
    async createUser(request: Request, response: Response) {
        const { name, email, password } = request.body;

        try {
            await validateUser.validate(request.body);

            const userExist = await prisma.user.findUnique({ where: { email } });

            if (userExist) {
                return response.status(400).json({ mensagem: "Já existe outro usuário utilizando esse e-mail!" })
            }

            const hashPassword = await hash(password, 8);

            const user = await prisma.user.create({
                data: {
                    name,
                    email,
                    password: hashPassword
                }
            });

            return response.status(201).json({ mensagem: "Criado com sucesso!" });

        } catch (error) {
            return response.status(400).json(error);
        }
    }

}
