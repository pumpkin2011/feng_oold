# == Schema Information
#
# Table name: nodes
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  icon         :string           not null
#  uri          :string           not null
#  domain       :string           not null
#  published_at :datetime
#  deleted_at   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Node < ActiveRecord::Base
  extend Enumerize

  scope :published, -> { where.not(published_at: nil) }
  validates_presence_of :name, :icon, :uri, :domain
  validates :name, length: { maximum: 10 }, allow_blank: true
  validates :uri, :icon, length: { maximum: 20 }, allow_blank: true

  enumerize :domain, in: [:zhao, :song, :admin], scope: true

  def published?
    published_at.present?
  end

  def mark_as_published!
    update_column :published_at, Time.zone.now
  end

  def mark_as_draft!
    update_column :published_at, nil
  end
end
