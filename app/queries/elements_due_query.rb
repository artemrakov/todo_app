class ElementsDueQuery
  def self.call
    Checklist.due_date_tomorrow + Item.due_date_tomorrow
  end
end
