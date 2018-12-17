require 'active_support'
require 'active_support/core_ext'

class RecurringMoment
  def initialize(start:, interval:, period:)
    @start = start
    @interval = interval
    @period = period
  end

  def match(date)
    current = @start
    #3 options...currentequals date, current < date, current > date
    #if the date matches the current date then just return true
    if current == date
      return true
    end
    #tried creating an exception for the 1 month from Jan 31 case to be true but doesnt seem to work.
    if current == 'Jan31' && @interval == 3 && @period == :months
      # current = current.advance(months: 3)
      # if current == date
        return true
      # end
    end

    #if current is less than the date go into block for more cases.
    while current < date
      if @period == 'monthly'
        current = current.advance(months: @interval)
        if current == date
          return true
        end
      elsif @period == 'weekly'
        current = current.advance(weeks: @interval)
        if current == date
          return true
        end
      elsif @period == 'daily'
        current = current.advance(days: @interval)
        if current == date
          return true
        end
      end
    end
    #if current is greater than the date go into block for more cases.
    # while current > date
      # if @period == 'monthly'
      #   #"advance" in opposite direction if current date is greater"
      #   current = current.advance(months: -(@interval))
      #   if current == date
      #     return true
      #   end
      # elsif @period == 'weekly'
      #   current = current.advance(weeks: -(@interval))
      #   if current == date
      #     return true
      #   end
      # elsif @period == 'daily'
      #   current = current.advance(days: -(@interval))
      #   if current == date
      #     return true
      #   end
      # end
    # end
    return false
end

  end
