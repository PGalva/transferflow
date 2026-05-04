# Desafio Backend: Sistema de Transferências (Ruby Puro) 💎

Este projeto foi desenvolvido como um estudo prático de **Lógica de Programação** e **Orientação a Objetos** utilizando Ruby. O objetivo principal foi implementar um sistema de transações financeiras (estilo fintech) sem o uso de frameworks (como Ruby on Rails), focando em entender como as coisas funcionam "por baixo do sistema".

## 🚀 O Desafio
O sistema simula uma plataforma de pagamentos onde existem dois tipos de usuários: **Usuários Comuns** e **Lojistas**. 

### Regras de Negócio Implementadas:
- [x] **Cadastro Único:** O sistema impede o cadastro de e-mails ou CPFs/CNPJs duplicados utilizando variáveis de classe (`@@`) para simular persistência em memória.
- [x] **Tipos de Conta:** 
  - **Usuários:** Podem enviar e receber dinheiro.
  - **Lojistas:** Atuam apenas como recebedores, não podem realizar transferências.
- [x] **Validação de Saldo:** Antes de qualquer transação, o sistema valida se o remetente possui saldo suficiente.
- [x] **Autorização Externa:** O sistema consulta um serviço de autorização mockado via HTTP antes de finalizar a transferência.
- [x] **Notificações:** Após o recebimento, o sistema simula o envio de uma notificação para o destinatário via POST.

## 🏗️ Arquitetura e Decisões Técnicas

Para este projeto, optei por uma abordagem que prioriza a **manutenibilidade** e o **desacoplamento**:

1. **Herança e Polimorfismo:** Utilizei uma classe base `Conta` para atributos comuns, enquanto `Usuario` e `Lojista` herdam comportamentos específicos, evitando repetição de código (DRY).
2. **Encapsulamento:** Uso de métodos `private` para garantir que a lógica interna (como validação de formato) não seja acessada indevidamente de fora da classe.
3. **Service Objects (Estudo):** Separação da lógica de comunicação com APIs externas (`Net::HTTP`) em métodos especializados, preparando o código para uma futura refatoração em classes de serviço.



## 🛠️ Tecnologias Utilizadas
- **Ruby** (Versão 3.x recomendada)
- **Net::HTTP** (Biblioteca padrão para requisições)
- **JSON** (Para parsear respostas de APIs)
