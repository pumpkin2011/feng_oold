# == Schema Information
#
# Table name: appointments
#
#  id         :integer          not null, primary key
#  job_id     :integer
#  labor_id   :integer
#  zhao_id    :integer
#  song_id    :integer
#  state      :string
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_appointments_on_job_id    (job_id)
#  index_appointments_on_labor_id  (labor_id)
#  index_appointments_on_song_id   (song_id)
#  index_appointments_on_state     (state)
#  index_appointments_on_zhao_id   (zhao_id)
#

require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it { should belong_to(:job) }
  it { should belong_to(:labor) }
  it { should belong_to(:zhao_enterprise).with_foreign_key(:zhao_id) }
  it { should belong_to(:song_enterprise).with_foreign_key(:song_id) }
end
