# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  year       :integer          not null
#  band_id    :bigint           not null
#  studio     :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Album < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: :band_id }
  validates :year, presence: true 
  validates :band_id, presence: true 
  validates :studio, presence: true 

  belongs_to :band,
    primary_key: :id,
    foreign_key: :band_id,
    class_name: :Band
end
