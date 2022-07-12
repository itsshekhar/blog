class BlogDb < ApplicationRecord
    has_many :comments,dependent: :destroy
    validates :name, presence:true
    validates :article,presence:true ,length:{minimum:10}
end
