Funcionalidade: Validar uma feature inv�lida
  Como Desenvolvedor
  Gostaria que o dCucumber me avisase onde est�o os erros da minha feature
  Para que eu possa corrigi-los
  
  Cen�rio: Um passo inv�lido abaixo
    Dado que a linha abaixo est� errada
    Essa linha n�o � correta
    Ent�o devo ver a mensagem "A linha 8 come�a com uma palavra chave desconhecida (Essa)."

  Cen�rio: Um passo com apenas uma palavra
    Dado que a linha abaixo cont�m apenas uma palavra
    Quando
    Ent�o devo ver a mensagem "O passo da linha 13 deve conter mais do que apenas uma palavra."