class User < ApplicationRecord

  def self.unique_random(all_ids)

    offset = rand(User.count)
    u = User.offset(offset).first


    unless all_ids.size >= User.count
      while all_ids.include?(u.id)
        offset = rand(User.count)
        u = User.offset(offset).first
      end
    end

    return u
  end

end
