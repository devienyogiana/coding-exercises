require 'yaml'
class HotelParser
  # Implement a method to parse the contents of a YAML file and return
  # an object whose values are accessible using the [] operator or method calls
  #
  # Note: Use of the YAML library is fine (encouraged, even) but please don't
  #       use any third-party gems that enable the required functionality.
  class HotelRoom
    @@hotelRoomTable
    def initialize(table)
      @@hotelRoomTable = table
    end

    def amenities
      return @@hotelRoomTable['amenities']
    end

    def [](name)
      return @@hotelRoomTable[name]
    end
  end

  class HotelRoomArr
    @@hotelRoomArrTable
    def initialize(table)
      @@hotelRoomArrTable = table
    end

    def first
      hrntable = HotelRoom.new(@@hotelRoomArrTable.first)
      return hrntable
    end

    def last
      hrntable = HotelRoom.new(@@hotelRoomArrTable.last)
      return hrntable
    end
  end

  class HotelRoomName
    @@hotelRoomNameTable
    def initialize(table)
      @@hotelRoomNameTable = table
    end

    def rooms
      hroom = HotelRoomArr.new(@@hotelRoomNameTable['rooms'])
      return hroom
    end

    def name
      return @@hotelRoomNameTable['name']
    end

    def [](name)
      if name == 'name'
        return @@hotelRoomNameTable[name]
      else
        hroom = HotelRoomArr.new(@@hotelRoomNameTable['rooms'])
        return hroom
      end
    end
  end

  class HotelArr
    @@hotelArrTable
    def initialize(table)
      @@hotelArrTable = table
    end

    def first
      hrntable = HotelRoomName.new(@@hotelArrTable.first)
      return hrntable
    end

    def last
      hrntable = HotelRoomName.new(@@hotelArrTable.last)
      return hrntable
    end
  end

  class Hotel
    @@hotelTable

    def initialize(table)
      @@hotelTable = table
    end

    # @@hotelTable['hotels'] returns an array
    def hotels
      tb = HotelArr.new(@@hotelTable['hotels'])
      return tb
    end

    def [](name)
      tb = HotelArr.new(@@hotelTable['hotels'])
      return tb
    end
  end

  def self.parse(filename)
    table = YAML.load_file(filename)
    h = Hotel.new(table)
    return h
  end
end
