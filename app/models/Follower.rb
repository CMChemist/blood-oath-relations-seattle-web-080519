class Follower

    attr_reader :name
    attr_accessor :age, :life_motto

    @@all = []

    def initialize (name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def self.all
        @@all
    end

    def join_cult(cult_obj)
        # binding.pry
        BloodOath.new(cult_obj, self)
        # BloodOath.all.select {|bloodOath_obj| bloodOath_obj.cult_obj == cult_obj && bloodOath_obj.follower_obj == self}? p "Blood Oath already made with this cult." : 
    end

    def cults
        bloodOaths = BloodOath.all.select {|bloodOath_obj| bloodOath_obj.follower_obj == self}
        bloodOaths.map {|bloodOath| bloodOath.cult_obj}
    end

    def self.of_a_certain_age(age)
        @@all.select { |follower_obj| age <= follower_obj.age}
    end
end
