class Production < ApplicationRecord
    has_many :crew_members


    validates :title, presence: true

    def my_crew
        self.crew_members.map{|crew| {name:crew.name,job_title:crew.job_title}}
    end
end
