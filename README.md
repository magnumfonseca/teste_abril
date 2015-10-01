Teste: Gerenciamento de atividades  
  
  Tempo para execução: 4 dias corridos a partir do envio do teste.  
  Forma de entrega: enviar o endereço do Github com o código.  
  Dúvidas: Enviar e-mail para dansantos@abril.com.br e alessilva@abril.com.br  
    
    Contexto:  
    Você é uma pessoa extremamente ocupada e precisa gerenciar todas as suas atividades.  
    Seu dia de trabalho deve começar às 9h com uma parada para o almoço exatamente a 12h, o retorno deve ocorrer às 13h, seu expediente termina às 17h. Levando em consideração os dados acima, você deve criar uma aplicação para gerenciar o seu tempo.  
      
      Nota:   
      Os inputs de dados serão strings, você terá que recuperar dessas strings os minutos digitados, caso os minutos não tenham sido passados na string, alocar a tarefa onde houver uma lacuna de tempo sobrando.  
        
Exemplo de tarefa com declaração de minutos:   
Estudar tecnologias 30 minutos  
  
  Exemplo de tarefa sem declaração de minutos:   
  Pegar trânsito  
    
    Uma parte da aplicação precisa ser um serviço REST, que aceite o input de dados conforme mencionada acima. (API de domínio).  
      
      Para realizar o input você terá que criar uma aplicação web, está terá a responsabilidade de acessar o serviço da API e inputar os dados. (Web Aplication).  
        
Nosso real objetivo é avaliar como você desenvolve software, faça o máximo possível no tempo que lhe foi dado,  
  
  Pré-requisitos:  
  Boas práticas, TDD ou BDD, Ruby, Java, Node.js, C#  
    
    Dados de input:  
    Estudar tecnologias 30 minutos  
    Fazer exercícios 60 minutos  
    Fazer entrevista com Maria 20 minutos  
    Reunião com os funcionários 120 minutos  
    Falar com João 15 minutos  
    Ajudar Pablo 20 minutos  
    Corrigir provas 40 minutos  
    Falar com Sheila 60 minutos  
    Reunião com executivos 180 minutos  
    Pegar trânsito  
    Fazer café 20 minutos  
    Fazer comida 40 minutos  
    Assistir filme 120 minutos  
      
      Dados de retorno:  
      Opção 1  
      09:00 Estudar tecnologias  
      09:30 Fazer exercícios  
      10:30 Fazer entrevista com Maria  
      10:50 Falar com João  
      11:05 Ajudar Pablo  
      11:25 Fazer café  
      11:45 Pegar trânsito  
      13:00 Reunião com os funcionários  
      15:00 Corrigir provas  
      15:40 Falar com Sheila  
      16:40 Comer a comida  
        
	  
