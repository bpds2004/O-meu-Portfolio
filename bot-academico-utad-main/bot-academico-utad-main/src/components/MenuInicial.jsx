// src/components/MenuInicial.jsx
import React from "react";
import styled from "styled-components";

const MenuContainer = styled.div`
  margin-bottom: 1.5rem;
  text-align: center;
  background: linear-gradient(90deg, #eef2ff 0%, #e0e7ff 100%);
  border-radius: 16px;
  box-shadow: 0 4px 16px rgba(67, 56, 202, 0.08);
  padding: 1.5rem 1rem 1rem 1rem;
  font-family: 'Inter', 'Segoe UI', 'Roboto', Arial, sans-serif;
`;

const MenuTitle = styled.p`
  font-size: 1.18rem;
  color: #4338ca;
  font-weight: 700;
  margin-bottom: 1rem;
  letter-spacing: 0.01em;
`;

const ButtonGroup = styled.div`
  display: flex;
  flex-wrap: wrap;
  gap: 0.75rem;
  justify-content: center;
`;

const MenuButton = styled.button`
  background: linear-gradient(90deg, #6366f1 0%, #4338ca 100%);
  color: white;
  border: none;
  border-radius: 12px;
  padding: 0.7em 1.3em;
  font-size: 1.04rem;
  font-family: 'Inter', 'Segoe UI', 'Roboto', Arial, sans-serif;
  font-weight: 600;
  letter-spacing: 0.01em;
  box-shadow: 0 2px 8px rgba(67, 56, 202, 0.10);
  cursor: pointer;
  transition: background 0.2s, transform 0.2s;
  outline: none;
  margin-bottom: 0.2em;

  &:hover {
    background: linear-gradient(90deg, #818cf8 0%, #6366f1 100%);
    transform: translateY(-2px) scale(1.05);
  }
`;

const MenuInicial = ({ onPerguntar }) => (
  <MenuContainer id="menu-inicial">
    <MenuTitle>📋 Olá! 👋 Sou o Chatbot Académico da UTAD. Podes perguntar-me sobre faltas, melhorias, exames, inscrições e muito mais!</MenuTitle>
    <ButtonGroup>
      <MenuButton onClick={() => onPerguntar("regime especial")}>Regime Especial</MenuButton>
      <MenuButton onClick={() => onPerguntar("faltas")}>Faltas</MenuButton>
      <MenuButton onClick={() => onPerguntar("cursos oferecidos")}>Cursos Oferecidos</MenuButton>
      <MenuButton onClick={() => onPerguntar("contactos")}>Contactos</MenuButton>
      <MenuButton onClick={() => onPerguntar("exames")}>Exames</MenuButton>
      <MenuButton onClick={() => onPerguntar("bolsas especiais")}>Bolsas Especiais</MenuButton>
    </ButtonGroup>
  </MenuContainer>
);

export default MenuInicial;