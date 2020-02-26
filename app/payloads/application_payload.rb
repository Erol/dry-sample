class ApplicationPayload < Dry::Struct
  include ActiveModel::Validations

  class << self
    def attribute(name, klass, options = {})
      type = klass

      { **options, meta: { omittable: true } }.each do |key, value|
        type = type.send(key, value)
      end

      super(name, type)
    end

    def error(key, scope: 'api.errors', **args)
      -> (*_) { message(key, scope: scope, **args) }
    end

    private

    def message(key, scope:, **args)
      [I18n.t(key, pluralize: false, deep_interpolation: true, scope: scope, **args)]
    end
  end
end
