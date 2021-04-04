class Job < ActiveHash::Base
  self.data = [
    {id: 1, name: '--'},
    {id: 2, name: '選ばない'}, {id: 3, name: '薬剤師'}, {id: 4, name: '医療従事者'},
    {id: 5, name: '一般の方'}
  ]

  include ActiveHash::Associations
  has_many :users

end