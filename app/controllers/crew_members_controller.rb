class CrewMembersController < ApplicationController
    def index
        render json: CrewMember.all
    end
end
