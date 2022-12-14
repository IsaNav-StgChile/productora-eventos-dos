class Band < ApplicationRecord
    has_many :concerts, dependent: :destroy
    has_many :crew, dependent: :destroy

    enum band_type: %i[band girl_band boy_band]

    def all_assistants
        self.concerts.sum(:assistants)
        #self.concerts.map {|concert| concert.assistants } .sum
    end

    def this_month_concerts
        self.concerts.where(date: (Date.today.beginning_of_month)..(Date.today)).size
    end

    def last_concert
        self.concerts.order(:date).last
    end

    def last_concert_date
        self.last_concert.date.strftime("%A %Y-%B-%d")
    end

    def most_popular_concert
        self.concerts.maximum(:assistants)
    end

    def longest_concert
        self.concerts.maximum(:duration)
    end
end
