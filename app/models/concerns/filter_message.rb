concern :FilterMessage do
  included do
    before_save do
      self.message = PoopFilter.filter(self.message)
    end
  end
end
