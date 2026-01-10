import Fuse from "fuse.js";
import { respostas } from "./respostas";

// Fuse busca por palavras soltas no array `palavras` de cada resposta
export const fuse = new Fuse(respostas, {
  keys: ["palavras"],
  threshold: 0.3
});
