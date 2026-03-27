export interface City {
  id: string
  name: string
  state: string
}

export const CITIES: City[] = [
  // ABC Paulista (Foco Inicial)
  { id: 'santo-andre', name: 'Santo André', state: 'SP' },
  { id: 'sao-bernardo', name: 'São Bernardo do Campo', state: 'SP' },
  { id: 'sao-caetano', name: 'São Caetano do Sul', state: 'SP' },
  { id: 'diadema', name: 'Diadema', state: 'SP' },
  { id: 'maua', name: 'Mauá', state: 'SP' },
  { id: 'ribeirao-pires', name: 'Ribeirão Pires', state: 'SP' },
  { id: 'rio-grande-da-serra', name: 'Rio Grande da Serra', state: 'SP' },

  // Região Metropolitana (Expansão 1)
  { id: 'sao-paulo', name: 'São Paulo', state: 'SP' },
  { id: 'guarulhos', name: 'Guarulhos', state: 'SP' },
  { id: 'osasco', name: 'Osasco', state: 'SP' },
  { id: 'barueri', name: 'Barueri', state: 'SP' },
  { id: 'cotia', name: 'Cotia', state: 'SP' },
  { id: 'taboao-da-serra', name: 'Taboão da Serra', state: 'SP' },
  { id: 'carapicuiba', name: 'Carapicuíba', state: 'SP' },
  { id: 'sao-mateus', name: 'São Mateus', state: 'SP' },
  { id: 'itaquera', name: 'Itaquera', state: 'SP' },

  // Interior de SP (Capitais Regionais)
  { id: 'campinas', name: 'Campinas', state: 'SP' },
  { id: 'sao-jose-dos-campos', name: 'São José dos Campos', state: 'SP' },
  { id: 'ribeirao-preto', name: 'Ribeirão Preto', state: 'SP' },
  { id: 'sorocaba', name: 'Sorocaba', state: 'SP' },
  { id: 'bauru', name: 'Bauru', state: 'SP' },
  { id: 'sao-jose-do-rio-preto', name: 'São José do Rio Preto', state: 'SP' },
  
  // Litoral SP
  { id: 'santos', name: 'Santos', state: 'SP' },
  { id: 'sao-vicente', name: 'São Vicente', state: 'SP' },
  { id: 'guaruja', name: 'Guarujá', state: 'SP' },
  { id: 'praia-grande', name: 'Praia Grande', state: 'SP' },

  // Outras Capitais Brasileiras (Visão Longo Prazo)
  { id: 'rio-de-janeiro', name: 'Rio de Janeiro', state: 'RJ' },
  { id: 'belo-horizonte', name: 'Belo Horizonte', state: 'MG' },
  { id: 'curitiba', name: 'Curitiba', state: 'PR' },
  { id: 'porto-alegre', name: 'Porto Alegre', state: 'RS' },
  { id: 'florianopolis', name: 'Florianópolis', state: 'SC' },
  { id: 'brasilia', name: 'Brasília', state: 'DF' },
  { id: 'goiania', name: 'Goiânia', state: 'GO' },
  { id: 'salvador', name: 'Salvador', state: 'BA' },
  { id: 'recife', name: 'Recife', state: 'PE' },
  { id: 'fortaleza', name: 'Fortaleza', state: 'CE' },
  { id: 'manaus', name: 'Manaus', state: 'AM' },
  { id: 'belem', name: 'Belém', state: 'PA' }
]
