class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :voteable
  validates_presence_of :content

  def up_votes
    self.votes.where(vote: true).size
  end
  

end
