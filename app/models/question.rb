class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :votes, as: :voteable
  validates_presence_of :title
  validates_presence_of :content


  def up_votes
    self.votes.where(vote: true).size
  end

  def answer_status
    self.answers.size
  end
end
