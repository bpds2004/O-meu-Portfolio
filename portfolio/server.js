const express = require("express");
const nodemailer = require("nodemailer");
const cors = require("cors");

const app = express();
app.use(express.json());
app.use(cors()); 


const transporter = nodemailer.createTransport({
    service: "gmail",
    auth: {
        user: "bpds200404@gmail.com", 
        pass: "bibi1112" 
    }
});

// Rota para enviar o e-mail
app.post("/send-email", (req, res) => {
    const { compras } = req.body;

    const mailOptions = {
        from: "bpds200404@gmail.com",
        to: "licor.donagraca@gmail.com", 
        subject: "Confirmação de Compra - Licor Dª Graça",
        text: `Obrigado pela sua compra!\n\nDetalhes do pedido:\n${compras}`
    };

    transporter.sendMail(mailOptions, (error, info) => {
        if (error) {
            console.error(error);
            res.status(500).send("Erro ao enviar o e-mail.");
        } else {
            console.log("E-mail enviado: " + info.response);
            res.status(200).send("E-mail enviado com sucesso!");
        }
    });
});

// Inicia o servidor na porta 3000
app.listen(3000, () => {
    console.log("Servidor rodando na porta 3000");
});
