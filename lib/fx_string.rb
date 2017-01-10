class String
  def searchable
    self.downcase.gsub(/[^a-z0-9]/, '')
  end
end