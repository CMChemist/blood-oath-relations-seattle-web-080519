class BloodOath 

    attr_accessor :cult_obj, :follower_obj
    attr_reader :initiation_date

    @@all = []

    def initialize (cult_obj, follower_obj)
        @initiation_date = Time.new.strftime("%Y-%m-%d")
        @cult_obj = cult_obj
        @follower_obj = follower_obj
        @@all << self
    end

    def self.all
        @@all
    end

    # def initiation_date
    #     @initiation_date
    # end


end
