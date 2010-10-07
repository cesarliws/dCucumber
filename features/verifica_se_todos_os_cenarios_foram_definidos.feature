Funcionalidade: Verificar se todos os cen�rios da feature foram definidos
  Como desenvolvedor
  Gostaria que o dCucumber me informasse caso deixe de definir algum cen�rio
  Para que todos os cen�rios sejam cobertos por testes
  
  Cen�rio: Comparando a feature com a classe de teste
    Dado que tenho a feature "cenario_simples.feature"
	E que n�o implementei o cen�rio "primeiros passos"
	Quando eu tentar executar meus testes
	Ent�o devo ver a mensagem de erro "O cen�rio 'primeiros passos' n�o foi definido"