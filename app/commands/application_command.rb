class ApplicationCommand
  extend Dry::Initializer

  include Dry::Monads[:result]
  include Dry::Monads[:task]

  def self.inherited(child)
    child.include Dry::Monads::Do::All
  end
end
