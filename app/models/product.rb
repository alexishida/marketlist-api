class Product < ApplicationRecord
  after_create :broadcast_create
  after_update :broadcast_update
  after_destroy :broadcast_destroy

  private

  def broadcast_create
    ActionCable.server.broadcast('product', as_json.merge(action: 'CreateProduct'))
  end

  def broadcast_update
    ActionCable.server.broadcast('product', as_json.merge(action: 'UpdateProduct'))
  end

  def broadcast_destroy
    ActionCable.server.broadcast('product', as_json.merge(action: 'DestroyProduct'))
  end

end
