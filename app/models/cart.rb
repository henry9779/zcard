class Cart
 
  def initialize(items = []) # 讓from_hash傳進來接，如果沒東西給空陣列
    @items = items # 接引數
    # 一開始就給他空的購物車，這樣不會每次新增被清空
  end
  
  def self.from_hash(hash)
    if hash && hash["items"] #如果傳進來有值並有items的key
      items = []
      hash["items"].each do |item|
        items << CartItem.new(item["item_id"], item["quantity"])
        # better
        # items = hash["items"].map { |item| CartItem.new(item)
      end
      Cart.new(items)
      # 給新的車還原
    else
      Cart.new
      # 新的車
    end
  end

  def add_item(item_id, quantity = 1)
    # 給預設值
    found_item = @items.find { |item| item.item_id == item_id }
    # 判斷
    if found_item
      # 如果找到
      found_item.increament(quantity)
      # 增加數量
    else
      # 找不到給新的
      @items << CartItem.new(item_id, quantity)
    end
  end

  def items
    @items # 回傳
  end

  def empty? # 對到rspec的empty
    @items.empty?
    # 判斷購物車是空的？
  end

  def total_price
    total = @items.sum { |item| item.total_price }

    if Date.today.month == 12 &&  Date.today.day == 25
      total = total *0.9
    end
    total
  end

  def serialize
      # items = []

      items = @items.map { |item| {
        "item_id" => item.item_id,
        "quantity" => item.quantity }}

      # [
      #   { "item_id" => 1, "quantity" => 3 },
      #   { "item_id" => 2, "quantity" => 2 }
      # ]
    { "items" => items }
  end


end