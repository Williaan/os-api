import * as yup from 'yup';
import { setLocale } from 'yup';
import { pt } from 'yup-locales';

setLocale(pt);

const validateUser = yup.object().shape({
    name: yup.string().required('O campo nome é obrigatorio!'),
    email: yup.string().email('E-mail inválido!').required('O campo e-mail é obrigatorio!'),
    password: yup.string().required('O campo senha é obrigatorio!').min(6)
});

const acessLogin = yup.object().shape({
    email: yup.string().email('E-mail inválido!').required('O campo e-mail é obrigatorio!'),
    password: yup.string().required('O campo senha é obrigatorio!').min(6)
});

const validateClient = yup.object().shape({
    name: yup.string().required('O campo nome é obrigatorio!'),
    cpf: yup.string().required('O campo cpf é obrigatorio!').max(14),
    email: yup.string().email('E-mail inválido!').required('O campo e-mail é obrigatorio!'),
    phone: yup.string().required('O campo telefone é obrigatorio!').max(15),
    street: yup.string().required('O campo rua é obrigatorio!'),
    district: yup.string().required('O campo bairro é obrigatorio!'),
    city: yup.string().required('O campo cidade é obrigatorio!'),
    model: yup.string().required('O campo modelo é obrigatorio!').max(25),
    plate: yup.string().required('O campo placa é obrigatorio!').max(8),
    parts: yup.string().required('O campo peças é obrigatorio!'),
    service: yup.string().required('O campo serviço é obrigatorio!'),
});


export {
    validateUser,
    acessLogin,
    validateClient,
};
