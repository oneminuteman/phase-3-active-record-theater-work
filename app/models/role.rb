class Role < ApplicationRecord
    has_many :auditions
  
    def actors
      auditions.pluck(:actor)
    end
  
    def locations
      auditions.pluck(:location)
    end
  
    def lead
      hired_audition = auditions.find_by(hired: true)
      hired_audition ? hired_audition : 'no actor has been hired for this role'
    end
  
    def understudy
      hired_auditions = auditions.where(hired: true).limit(2)
      hired_auditions.count >= 2 ? hired_auditions.second : 'no actor has been hired for this role'
    end
  end
  