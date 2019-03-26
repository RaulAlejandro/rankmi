class Request < ApplicationRecord

    has_many :comments, as: :commentable, dependent: :destroy

    validates :uuid, length: { in: 6..120 }
    validates :title, :description, presence: true
    before_validation :load_uuid

    private
    def  load_uuid
       self.uuid = SecureRandom.uuid
    end
end
