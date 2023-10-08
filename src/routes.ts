import { Router } from "express";
import { UserController } from "./controllers/UserController";
import { LoginController } from "./controllers/LoginController";
import { ClientsController } from "./controllers/ClientsController";



export const router = Router();

const userController = new UserController();
const loginController = new LoginController();
const clientsController = new ClientsController();


router.post('/register', userController.createUser);
router.post('/login', loginController.login);


router.post('/client', clientsController.createClient);
router.get('/clients', clientsController.readAll);
router.get('/client/:id', clientsController.readClient);
router.delete('/client/:id', clientsController.deleteClient);
router.put('/client/:id', clientsController.updateClient);

