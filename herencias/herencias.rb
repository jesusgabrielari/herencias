
class Appointment
    attr_accessor :location, :purpose, :hour, :min 
    def initialize(location, purpose, hour, min)
        get_location_purpose(location, purpose)
        get_hour_min(hour,min)
        @hour = hour
        @min = min
    end

    def get_location_purpose(location, purpose)
        if location.class == String && purpose.class == String
            @location = location
            @purpose = purpose
        else
            raise "Pasate un string"
        end
    end

    def get_hour_min(hour, min)
        if hour.class == Integer && min.class == Integer
            @hour = hour
            @min = min
        else
            raise "Pasate un numero"
        end
    end

end

class MonthlyAppointment < Appointment
    attr_accessor :day
    def initialize(location, purpose, hour, min, day)
        super(location, purpose, hour, min)
        @day = day
    end

    def occurs_on?(day)
        self.day == day
    end

    def to_s
        "Reunion mensual en #{self.location} sobre #{self.purpose} el día #{day} a la(s) #{self.hour}:#{self.min}" 
    end
end

class DailyAppointment < Appointment
    
    def occurs_on?(hour, min)
        self.hour == hour && self.min == min
    end

    def to_s
        "Reunion diaria en #{self.location} sobre #{self.purpose} a la(s) #{self.hour}:#{self.min}" 
    end
end

class OneTimeAppointment < Appointment
    attr_reader :day, :month, :year
    def initialize(location, purpose, hour, min, day, month, year)
        super(location, purpose, hour, min)
        @year = year
        @month = month
        @day = day
    end

    def occurs_on?(day, month, year)
        self.day == day && self.month == month && self.year == year
    end

    def to_s
        "Reunion única en #{self.location} sobre #{self.purpose} el #{day}/#{month}/#{year} a la(s) #{self.hour}:#{self.min}" 
    end
end

puts OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019)
puts DailyAppointment.new('Desafío Latam', 'Educación', 8, 15)
puts MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23)



# pp pri.occurs_on?(23)


