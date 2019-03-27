class Request < ApplicationRecord

    has_many :comments, as: :commentable, dependent: :destroy

    validates :uuid, length: { in: 6..120 }
    validates :title, :description, presence: true
    before_validation :load_uuid

    def self.search(search, order_by)
        query = Request.all
        if search.present?
           query = query.where('requests.title LIKE ?', "%#{search}%")
        end
        if order_by.present?
           query = query.order('title ASC')
        end
    end

    private
    def  load_uuid
       self.uuid = SecureRandom.uuid
    end
end
