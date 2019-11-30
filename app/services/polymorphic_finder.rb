class PolymorphicFinder
  def initialize(finder)
    @finder = finder
  end

  def self.finding(*args)
    new(NullFinder.new).finding(*args)
  end

  def finding(relation, attribute, params_names)
    # it creates Finder with @fallback and changes fallback = to new finder
    # then creates new finder with that fallback
    new_finder = params_names.inject(@finder) do |fallback, param_name|
      Finder.new(relation, attribute, param_name, fallback)
    end

    self.class.new(new_finder)
  end

  def find(params)
    @finder.find(params)
  end

  class Finder
    def initialize(relation, attribute, params_name, fallback)
      @relation = relation
      @attribute = attribute
      @params_name = params_name
      @fallback = fallback
    end

    def find(params)
      if params[@params_name]
        @relation.where(@attribute => params[@params_name]).first!
      else
        @fallback.find(params)
      end
    end
  end

  class NullFinder
    def find
      raise ActiveRecord::RecordNotFound
    end
  end

  private_constant :Finder, :NullFinder
end
