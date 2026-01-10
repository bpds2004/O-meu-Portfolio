import { useState } from "react";
import { fuse } from "../data/fuse";
import { useRef } from "react";

import styled from "styled-components";
import { useEffect } from "react"; 
import Loader from "./Loader.jsx";
import BotaoEnviar from "./BotaoEnviar";
import CaixaTexto from "./CaixaTexto";
import ReactMarkdown from 'react-markdown';
import MenuInicial from "./MenuInicial";



const Container = styled.div`
  min-height: 100vh;
background: linear-gradient(to right top, #c7d2fe, #fef9ff);
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 1rem;
`;

const ChatBox = styled.div`
  background: rgba(255, 255, 255, 0.2);
  border-radius: 16px;
  padding: 24px;
  width: 100%;
  max-width: 1000px;
  min-height: 90vh; 
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.2);
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px);
  border: 1px solid rgba(255, 255, 255, 0.3);
  color: #111;
  font-family: 'Inter', sans-serif;
`;



const Title = styled.h2`
  text-align: center;
  font-size: 2rem;
  font-weight: 800;
  margin-bottom: 1rem;
  font-family: 'Inter', 'Segoe UI', sans-serif;
  /* Continuous vertical floating animation */
  animation: floatTitle 2.5s ease-in-out infinite;
  .gradient-title {
    background: linear-gradient(270deg, #6366f1, #4f46e5, #6366f1);
    background-size: 200% 200%;
    background-clip: text;
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    text-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
    display: inline;
    animation: gradientMove 3s ease-in-out infinite;
  }
  @keyframes gradientMove {
    0% {
      background-position: 0% 50%;
    }
    50% {
      background-position: 100% 50%;
    }
    100% {
      background-position: 0% 50%;
    }
  }
  @keyframes floatTitle {
    0% {
      transform: translateY(0px);
    }
    50% {
      transform: translateY(-16px);
    }
    100% {
      transform: translateY(0px);
    }
  }
`;


const Mensagens = styled.div`
  flex-grow: 1; /* cresce para ocupar o espaço entre o título e o input */
  background: rgba(255, 255, 255, 0.25);
  padding: 1rem;
  border: 2px solid rgba(255, 255, 255, 0.3);
  overflow-y: auto;
  border-radius: 12px;
  backdrop-filter: blur(10px);
  margin-bottom: 12px;
`;


const Linha = styled.div`
  margin-bottom: 12px;
  display: flex;
  justify-content: ${(props) => (props.de === "tu" ? "flex-end" : "flex-start")};
`;


const Bolha = styled.span`
  max-width: 80%;
  padding: 12px 16px;
  border-radius: ${(props) =>
    props.de === "tu" ? "16px 16px 0 16px" : "16px 16px 16px 0"};
  background: ${(props) =>
    props.de === "tu" ? "rgba(91, 126, 255, 0.2)" : "rgba(255, 255, 255, 0.3)"};
  backdrop-filter: blur(8px);
  -webkit-backdrop-filter: blur(8px);
  border: 1px solid rgba(255, 255, 255, 0.2);
  color: #111;
  white-space: pre-wrap;
  word-wrap: break-word;
  font-size: 1.05rem;
  line-height: 1.6;
  letter-spacing: 0.01em;
  animation: aparecer 0.3s ease;
  font-family: 'Inter', 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif;
  font-weight: 500;
  text-rendering: optimizeLegibility;
  -webkit-font-smoothing: antialiased;
`;

const AparecerKeyframes = styled.div`
  @keyframes aparecer {
    from {
      opacity: 0;
      transform: translateY(10px);
    }
    to {
      opacity: 1;
      transform: translateY(0);
    }
  }
`;



const InputArea = styled.div`
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
  align-items: center;
  background: rgba(255, 255, 255, 0.3);
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px);
  border-radius: 12px;
  padding: 12px;
  border: 2 solid rgba(255, 255, 255, 0.2);
`;


const Input = styled.input`
  flex: 1;
  padding: 10px;
  border-radius: 8px;
  border: 1px solid #ccc;
`;

const Botao = styled.button`
  background: #4f46e5;
  color: white;
  padding: 10px 16px;
  border: none;
  border-radius: 8px;
  cursor: pointer;

  &:hover {
    background: #4338ca;
  }
`;



function Chat() {
  const [mensagens, setMensagens] = useState([]);
const mensagensEndRef = useRef(null);

useEffect(() => {
  mensagensEndRef.current?.scrollIntoView({ behavior: "smooth" });
}, [mensagens]);

  useEffect(() => {
    setMensagens([{ de: "bot", texto: "__LOADING__" }]);

    const timer = setTimeout(() => {
      setMensagens([
        {
          de: "bot",
          texto:
            "Olá! 👋 Sou o Chatbot Académico da UTAD. Podes perguntar-me sobre faltas, melhorias, exames, inscrições e muito mais!",
        },
      ]);
    }, 1000);

    return () => clearTimeout(timer);
  }, []);




  const [input, setInput] = useState("");


  const handleSend = () => {
    if (!input.trim()) return;
    
    const userMsg = { de: "tu", texto: input };
    setMensagens((prev) => [...prev, userMsg, { de: "bot", texto: "__LOADING__" }]);
    setInput("");

    setTimeout(() => {
      const resultado = fuse.search(input);
      const resposta = resultado.length > 0
        ? resultado[0].item.texto
        : "❓ Desculpa, não encontrei uma resposta para isso. Tenta reformular a pergunta.";
      setMensagens((prev) => {
        const novas = [...prev];
        novas[novas.length - 1] = { de: "bot", texto: resposta };
        return novas;
      });
    }, 1000);
  };



  return (
    
    <Container>
      <ChatBox>
        <Title>
          <img src="/img.png" alt="chapéu" style={{
            width: "32px",
            height: "32px",
            verticalAlign: "middle",
            marginRight: "10px",
            animation: "float 2.5s ease-in-out infinite"
          }} />
          <span className="gradient-title">Chatbot Académico UTAD</span>
        </Title>

        <Mensagens style={{ fontFamily: "'Inter', 'Segoe UI', 'Roboto', Arial, sans-serif" }}>
          {mensagens.map((msg, i) => (
            <Linha key={i} de={msg.de}>
              {msg.texto === "__LOADING__" ? (
                <Loader />
              ) : (
                <Bolha de={msg.de}>
                  {i === 0 && msg.de === "bot" ? (
                    <MenuInicial onPerguntar={(texto) => {
                      setInput(texto);
                      handleSend();
                    }} />
                  ) : (
                    <ReactMarkdown
                      components={{
                        p: ({ ...props }) => (
                          <span style={{ fontFamily: "'Inter', 'Segoe UI', 'Roboto', Arial, sans-serif" }} {...props} />
                        ),
                        strong: ({ ...props }) => (
                          <strong style={{ fontWeight: 700 }} {...props} />
                        ),
                      }}
                    >
                      {msg.texto}
                    </ReactMarkdown>
                  )}
                </Bolha>
              )}
            </Linha>
          ))}
          <div ref={mensagensEndRef} />
        </Mensagens>
        <InputArea>
          <CaixaTexto
            value={input}
            onChange={(e) => setInput(e.target.value)}
            onKeyDown={(e) => e.key === "Enter" && handleSend()}
            style={{ fontFamily: "'Inter', 'Segoe UI', 'Roboto', Arial, sans-serif" }}
          />
          <BotaoEnviar onClick={handleSend} />
        </InputArea>
      </ChatBox>
    </Container>
  );
}
import { createGlobalStyle } from "styled-components";

const GlobalStyle = createGlobalStyle`
  @keyframes wiggle {
    0%, 100% { transform: rotate(0deg); }
    25% { transform: rotate(-5deg); }
    75% { transform: rotate(5deg); }
  }

  .wiggle-icon {
    display: inline-block;
    animation: wiggle 2.5s infinite;
    transform-origin: bottom center;
  }

  @keyframes glow {
    0%, 100% {
      text-shadow: 0 0 5px #a5b4fc, 0 0 10px #818cf8;
    }
    50% {
      text-shadow: 0 0 15px #6366f1, 0 0 25px #4f46e5;
    }
  }

  .glow {
    animation: glow 2.5s ease-in-out infinite;
  }

  @keyframes pulse {
    0%, 100% { transform: scale(1); }
    50% { transform: scale(1.05); }
  }

  .pulse {
    animation: pulse 2.5s ease-in-out infinite;
  }

  @keyframes fadeSlideIn {
    from {
      opacity: 0;
      transform: translateY(-20px);
    }
    to {
      opacity: 1;
      transform: translateY(0);
    }
  }

  .fade-slide {
    animation: fadeSlideIn 1.2s ease-out both;
  }
`;


export default Chat;
