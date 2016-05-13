class Time
  def pretty
    pretty_date + ' at ' + pretty_time
  end
  
  def pretty_date
    strftime '%b %-d, %Y'
  end
  
  def pretty_time
    strftime '%-l:%M %P'
  end
  
  def yesterday?
    self.to_date == Date.yesterday
  end
  
  def round_to_minute
    self.change(:sec => 0)
  end
end


# https://gist.github.com/eric1234/3739149
#
# Mass monkey-patching! Provides integration between Chronic, Ruby and
# Rails. So now these all work:
#
#     Date.parse "next summer"
#     DateTime.parse "in 3 hours"
#     Time.parse "3 months ago saturday at 5:00 pm"
#
# In addition we override String#to_date, String#to_datetime, String#to_time.
# These methods are used by older version of ActiveRecord when parsing time.
# For newer versions of ActiveRecord, Date::_parse is overridden to also
# use Chronic. This means you can assign a simple string to a ActiveRecord
# attribute:
#
#     my_obj.starts_at = "thursday last week"
#
# Also since the String method are redefined you can easily create dates
# from strings. For example if you want tomorrow at 2pm you can just do:
#
#     'tomorrow at 2pm'.to_time
#
# This is more readable than the following IMHO:
#
#     1.day.from_now.change hour: 14
class String
def to_date_with_chronic
    parsed = Chronic.without_recursion {Chronic.parse self}
return parsed.to_date if parsed
    to_date_without_chronic
end
  alias_method_chain :to_date, :chronic
def to_datetime_with_chronic
    parsed = Chronic.without_recursion {Chronic.parse self}
return parsed.to_datetime if parsed
    to_datetime_without_chronic
end
  alias_method_chain :to_datetime, :chronic
def to_time_with_chronic
    parsed = Chronic.without_recursion {Chronic.parse self}
return parsed.to_time if parsed
    to_time_without_chronic
end
  alias_method_chain :to_time, :chronic
end
class DateTime
class << self
def parse_with_chronic(datetime, *args)
      parsed = Chronic.without_recursion {Chronic.parse datetime}
return parsed.to_datetime if parsed
      parse_without_chronic datetime, *args
    end
    alias_method_chain :parse, :chronic
  end

end

class Date

  class << self

    def _parse_with_chronic(date, *args)
      parsed = Chronic.without_recursion {Chronic.parse date}.try :to_datetime
      if parsed
        %i(year mon mday hour min sec sec_fraction offset).inject({}) do |result, fld|
          value = case fld
            when :offset then (parsed.offset * 86400).to_i
            else parsed.public_send fld
          end
          result[fld] = value if value && value != 0
          result
        end
      else
        _parse_without_chronic date, *args
      end
    end
    alias_method_chain :_parse, :chronic

    def parse_with_chronic(date, *args)
      parsed = Chronic.without_recursion {Chronic.parse date}
      return parsed.to_date if parsed
      parse_without_chronic date, *args
    end
    alias_method_chain :parse, :chronic
  end

end

class Time

  class << self
    def parse_with_chronic(time, now=self.now)
      parsed = Chronic.without_recursion {Chronic.parse time, now: now}
      return parsed if parsed
      parse_without_chronic time, now
    end
    alias_method_chain :parse, :chronic
  end

end

Chronic.time_class = Time.zone

# There are cases where Chronic actually uses the Ruby date/time libraries.
# This leads to infinate recursion as our monkey-patch will intercept the
# built-in libraries to hand off to Chronic which in turn hands back to the
# built-in libraries.
#
# To aviod this we have this function which acts as a guard to prevent the
# recursion. If we have already proxied off to Chronic we won't proxy again.
def Chronic.without_recursion &blk
  unless in_recursion
    self.in_recursion = true
    ret = blk.call
    self.in_recursion = false
  end
  ret
end
Chronic.mattr_accessor :in_recursion
