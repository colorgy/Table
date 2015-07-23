module DateService
  class << self
    def current_year
      (Time.now.month > 6) ? Time.now.year : Time.now.year - 1
    end

    def current_term
      (Time.now.month > 6) ? 1 : 2
    end
  end
end
