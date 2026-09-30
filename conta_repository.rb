require_relative 'conta'

class ContaRepository
  

  def initialize
    @contas = []
  end

  def exists?(conta)
   @contas.any? { |c| c.cpf == conta.cpf || c.email == conta.email}
  end
  

  

   def add(conta)
    @contas << conta
   end

end