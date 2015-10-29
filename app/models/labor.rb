# == Schema Information
#
# Table name: labors
#
#  id           :integer          not null, primary key
#  user_song_id :integer
#  name         :string           not null
#  mobile       :string           not null
#  idcard       :string           not null
#  gender       :string           not null
#  birthday     :date             not null
#  channel      :string           not null
#  province     :string           not null
#  city         :string           not null
#  district     :string           not null
#  state        :string           not null
#  deleted_at   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_labors_on_birthday      (birthday)
#  index_labors_on_channel       (channel)
#  index_labors_on_city          (city)
#  index_labors_on_deleted_at    (deleted_at)
#  index_labors_on_district      (district)
#  index_labors_on_gender        (gender)
#  index_labors_on_idcard        (idcard)
#  index_labors_on_mobile        (mobile)
#  index_labors_on_name          (name)
#  index_labors_on_province      (province)
#  index_labors_on_state         (state)
#  index_labors_on_user_song_id  (user_song_id)
#

class Labor < ActiveRecord::Base
end
