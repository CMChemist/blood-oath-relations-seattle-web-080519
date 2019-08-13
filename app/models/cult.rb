class Cult

    attr_accessor :location, :slogan
    attr_reader :founding_year, :name

    @@all =[]

    def initialize (name, founding_year, location, slogan)
        @name = name
        @founding_year = founding_year
        @location = location
        @slogan = slogan
        @@all << self
    end

    def self.all
        @@all
    end

    def recruit_follower(follower)
        BloodOath.new(self, follower)
    end

    def cult_population 
        BloodOath.all.select {|bloodOath_obj| bloodOath_obj.cult_obj == self}.length
    end

    def self.find_by_name(name)
        @@all.select {|cult_obj| cult_obj.name == name}.first
    end

    def self.find_by_location(location)
        @@all.select {|cult_obj| cult_obj.location == location}
    end

    def self.find_by_founding_year(year)
        @@all.select {|cult_obj| cult_obj.founding_year == year}
    end


    def cult_followers
        membership = BloodOath.all.select {|bloodOath_obj| bloodOath_obj.cult_obj == self}
        membership.map {|bloodOath_obj| bloodOath_obj.follower_obj}
    end

    def average_age()
        sum = cult_followers.age.sum
        sum/(self.cult_population.to_f)
    end

    def my_followers_motto
        cult_followers.each do |follower_obj|
            puts follower_obj.life_motto
        end
    end

    def self.least_popular
        temp_smallest = @@all[0]
         @@all.each do |cult_obj| 
            if cult_obj.cult_population < temp_smallest.cult_population
                temp_smallest = cult_obj
            end
        end
        return temp_smallest
    end

    def self.most_common_location
        hash = {}
        @@all.each do |cult_obj|
            if hash.has_key? (cult_obj.location)
                hash[cult_obj.location] += 1
            else 
                hash[cult_obj.location] = 1
            end
        end
        hash.key(hash.values.max)
    end

end



