# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  COLORS = %i[red green blue yellow brown].freeze
  VARIANTS = %i[default borderless].freeze
  SIZES = %i[sm md lg].freeze

  attr_reader :text, :color, :variant, :size, :href, :method, :html_options

  def initialize(
    text: nil,
    color: :red,
    variant: :default,
    size: :md,
    href: nil,
    method: nil,
    **html_options
  )
    @text = text
    @color = normalize(:color, color, COLORS)
    @variant = normalize(:variant, variant, VARIANTS)
    @size = normalize(:size, size, SIZES)
    @href = href
    @method = method
    @html_options = html_options
  end

  def button_classes
    classes = {
      "btn" => true,
      "btn--#{color}" => color.present?,
      "btn--#{variant}" => variant != :default,
      "btn--#{size}" => size != :md
    }
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