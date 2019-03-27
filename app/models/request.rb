class Request < ApplicationRecord
    acts_as_votable
    
    has_many :comments, as: :commentable, dependent: :destroy
    has_many :votes, dependent: :destroy


    validates :uuid, length: { in: 6..120 }
    validates :title, :description, presence: true
    before_validation :load_uuid

    def self.search(search, order_by)
        query = Request.all
        if search.present?
           query = query.where('requests.title LIKE ?', "%#{search}%")
        end
        if order_by.present?
            unless order_by == '0'
                query = query.order('title ASC')
            else
                query = query.joins('left join votes on votes.votable_id = requests.id').
                              select('requests.*, count(votes.id) as votes_count').
                              group('requests.id').
                              order('votes_count DESC')
            end
        end
    end

    private
    def  load_uuid
       self.uuid = SecureRandom.uuid
    end
end
