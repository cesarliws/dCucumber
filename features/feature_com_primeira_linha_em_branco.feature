
Funcionalidade: Validar uma feature que n�o come�a com a palavra funcionalidade ou linha em branco
  Como Desenvolvedor
  Gostaria que o dCucumber me avisase onde est�o os erros da minha feature
  Para que eu possa corrigi-los
  
  Cen�rio: Uma feature sem funcionalidade
    Dado que feature "feture_sem_funcionalidade.feature" n�o cont�m uma funcionalidade
    Ent�o devo ver a mensagem "A feature 'feture_com_primeira_linha_em_branco.feature' n�o come�a com a palavra Funcionalidade: seguida de seu t�tulo na primeira linha."
