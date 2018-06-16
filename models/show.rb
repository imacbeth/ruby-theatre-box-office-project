require_relative('../db/sql_runner.rb')

class Show

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @name = options['name']
    @type = options['type']
  end



end
