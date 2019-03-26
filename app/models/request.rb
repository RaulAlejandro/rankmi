class Request < ApplicationRecord

    has_many :comments, as: :commentable, dependent: :destroy

    validates :uuid, length: { in: 6..120 }
    validates :title, :description, presence: true
    before_validation :load_uuid

    def self.search(search)
        if search
          where('requests.title LIKE ?', "%#{search}%").order('id DESC')
        else
          Request.all
        end
    end

    private
    def  load_uuid
       self.uuid = SecureRandom.uuid
    end
end
