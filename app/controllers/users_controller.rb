class User < ApplicationRecord
  def suspend
    update(suspended: true)
  end

  def reactivate
    update(suspended: false)
  end
end
