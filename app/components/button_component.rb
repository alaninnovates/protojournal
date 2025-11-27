# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  COLORS = %i[red green blue yellow brown].freeze
  VARIANTS = %i[default].freeze
  SIZES = %i[sm md lg].freeze

  attr_reader :text, :color, :variant, :size, :href, :type, :method, :html_options

  def initialize(
    text: nil,
    color: :red,
    variant: :default,
    size: :md,
    href: nil,
    type: nil,
    method: nil,
    **html_options
  )
    @text = text
    @color = normalize(:color, color, COLORS)
    @variant = normalize(:variant, variant, VARIANTS)
    @size = normalize(:size, size, SIZES)
    @href = href
    @type = type
    @method = method
    @html_options = html_options
  end

  def button_classes
    classes = []
    classes << "rounded-md flex w-full items-center justify-center"

    color_map = {
      red: "bg-red-500 hover:bg-red-600 text-white focus:ring-red-500",
      green: "bg-green-500 hover:bg-green-600 text-white focus:ring-green-500",
      blue: "bg-blue-500 hover:bg-blue-600 text-white focus:ring-blue-500",
      yellow: "bg-yellow-400 hover:bg-yellow-500 text-black focus:ring-yellow-400",
      brown: "bg-amber-700 hover:bg-amber-800 text-white focus:ring-amber-700"
    }
    classes << color_map[color] if color.present?

    variant_map = {
      default: "",
    }
    classes << variant_map[variant] if variant != :default

    size_map = {
      sm: "px-4 py-3 text-sm",
      md: "px-4 py-3 text-base",
      lg: "px-4 py-3 text-lg"
    }
    classes << size_map[size]

    class_names(classes, html_options[:class])
  end

  def button_attributes
    html_options.except(:class).merge(class: button_classes)
  end

  def display_text
    text || ""
  end

  def is_link?
    href.present?
  end

  private

  def normalize(name, value, allowed)
    symbolized = value.to_sym
    return symbolized if allowed.include?(symbolized)

    raise ArgumentError,
          "#{name} must be one of #{allowed.join(', ')}, got #{value.inspect}"
  end
end