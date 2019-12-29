class PolymorphicFinder
  def initialize
    @finders = []
  end

  def self.finding(*args)
    new.finding(*args)
  end

  def finding(relation, attribute, params_names)
    params_names.each do |param_name|
      @finders << Finder.new(relation, attribute, param_name)
    end

    self
  end

  def find(params)
    finder = @finders.find { |f| f.exist?(params) }
    element = finder.find(params)

    raise ActiveRecord::RecordNotFound unless element
    element
  end

  class Finder
    def initialize(relation, attribute, params_name)
      @relation = relation
      @attribute = attribute
      @params_name = params_name
    end

    def find(params)
      return nil unless params[@params_name]

      @relation.where(@attribute => params[@params_name]).first!
    end

    def exist?(params)
      params.key?(@params_name)
    end
  end

  private_constant :Finder
end
