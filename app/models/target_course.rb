class TargetCourse < ActiveRecord::Base
  has_many :subjects
  has_many :concepts
  validates :title, presence: true
end


RailsAdmin.config do |config| 
  config.model 'TargetCourse' do
    edit do
      field :title do
        label "課程對象"
      end
    end

    weight 1 # for nav order 
  end
end