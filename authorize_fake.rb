class AuthorizeFake
  
  def initialize(autoriza = true)
    @autoriza = autoriza
  end

  def autorizado?
    @autoriza
  end
end