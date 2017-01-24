module Druid
  class SectionCollection
    include Enumerable

    def initialize sections
      @sections = sections
    end

    def each &block
      @sections.each &block
    end

    def [] index
      @sections[index]
    end

    def find_by values_hash
      @sections.find { |section|
        values_hash.all? { |key, value| value === section.public_send(key) }
      }
    end

    def select_by values_hash
      SectionCollection.new @sections.select { |section|
        values_hash.all? { |key, value| value === section.public_send(key) }
      }
    end
  end
end
