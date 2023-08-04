class News::Post < ApplicationRecord
  def label_for_step(with_class: true)
    label = subject
    label += " [#{self.class}]" if with_class
    label
  end
end
