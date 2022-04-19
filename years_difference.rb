module YearsDifference
  def years_to_today(date)
    today = Time.now
    diff = today.year - date.year
    diff -= 1 if
         date.month > today.month or
         (date.month >= today.month and date.day > today.day)

    diff
  end
end
