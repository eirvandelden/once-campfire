require "active_support/concern"

module ActiveModel
  module SchematizedJson
    extend ActiveSupport::Concern

    class_methods do
      def has_json(attr, **schema)
        define_method(attr) do
          _write_attribute(attr.to_s, {}) if attribute(attr.to_s).nil?
          ActiveModel::SchematizedJson::DataAccessor.new(schema, data: attribute(attr.to_s))
        end

        define_method("#{attr}=") { |data| public_send(attr).assign_data_with_type_casting(data) }

        before_save -> { public_send(attr) } if respond_to?(:before_save)
      end
    end

    class DataAccessor
      def initialize(schema, data:)
        @schema = schema
        @data = data
        apply_defaults
      end

      def assign_data_with_type_casting(new_data)
        new_data.each { |key, value| public_send("#{key}=", value) }
      end

      private
        attr_reader :schema, :data

        def method_missing(method_name, *args)
          key = method_name.to_s.delete_suffix("?").delete_suffix("=")

          if schema.key?(key.to_sym)
            case method_name.to_s
            when /\?$/
              data[key].present?
            when /=$/
              data[key] = type_for(key).cast(args.first)
            else
              data[key]
            end
          else
            super
          end
        end

        def respond_to_missing?(method_name, include_private = false)
          schema.key?(method_name.to_s.delete_suffix("?").delete_suffix("=").to_sym) || super
        end

        def type_for(key)
          case schema.fetch(key.to_sym)
          when :boolean, TrueClass, FalseClass
            ActiveModel::Type.lookup(:boolean)
          when :integer, Integer
            ActiveModel::Type.lookup(:integer)
          when :string, String
            ActiveModel::Type.lookup(:string)
          else
            raise ArgumentError, "Only boolean, integer, or strings are allowed as JSON schema types"
          end
        end

        def apply_defaults
          schema.each do |key, type_or_default|
            data[key.to_s] = type_or_default unless type_or_default.is_a?(Symbol) || data.key?(key.to_s)
          end
        end
    end
  end
end

ActiveSupport.on_load(:active_record) do
  include ActiveModel::SchematizedJson
end
