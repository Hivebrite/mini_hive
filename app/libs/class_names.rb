class ClassNames

  def self.call(*args)
    args
      .flatten
      .map { |value| handle_hashes(value) }
      .flatten
      .select(&:present?)
      .map { |value| value.to_s.strip }
      .join(" ")
  end

  def self.handle_hashes(value)
    return value unless value.is_a?(Hash)

    value.select { |_css_klass, predicate| predicate.present? }.keys
  end

end
