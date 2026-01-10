import React from 'react';
import styled from 'styled-components';

const Input = ({ value, onChange, onKeyDown }) => {
  return (
    <StyledWrapper>
      <div className="coolinput">
        <label htmlFor="input" className="text">Escreve Aqui:</label>
        <input
          type="text"
          placeholder="Exp:Exames "
          name="input"
          className="input"
          value={value}
          onChange={onChange}
          onKeyDown={onKeyDown}
        />
      </div>
    </StyledWrapper>
  );
}

const StyledWrapper = styled.div`
  margin-top: -18px;
  .coolinput {
    display: flex;
    flex-direction: column;
    width: 500%;
    position: static;
    max-width: 800px;
    font-family: 'Inter', 'Segoe UI', 'Roboto', Arial, sans-serif;
  }

  .coolinput label.text {
    font-size: 0.85rem;
    color: royalblue;
    font-weight: 700;
    position: relative;
    top: 0.2rem;
    margin: 0 0 0 6px;
    padding: 0 3px;
    background: #e8e8e8;
    width: fit-content;
    font-family: 'Inter', 'Segoe UI', 'Roboto', Arial, sans-serif;
    letter-spacing: 0.01em;
  }

  .coolinput input[type=text].input {
    padding: 12px 12px;
    font-size: 1.04rem;
    font-family: 'Inter', 'Segoe UI', 'Roboto', Arial, sans-serif;
    font-weight: 500;
    border: 2px royalblue solid;
    border-radius: 5px;
    background: #e8e8e8;
    width: 100%;
    letter-spacing: 0.01em;
  }

  .coolinput input[type=text].input:focus {
    outline: none;
  }
`;
export default Input;
