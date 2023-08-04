class Cms::Page < ApplicationRecord
def label_for_step(with_class: true)
    label = title
    label += " [#{self.class}]" if with_class
    label
  end
end
