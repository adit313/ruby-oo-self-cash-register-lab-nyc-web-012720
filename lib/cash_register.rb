class CashRegister
attr_accessor :total, :discount

def initialize(discount = 0)
	@total = 0
	@discount = discount
	@items = []
end

def add_item(title, price, quantity = 1)
	item_hash= {title: title, price: price, quantity: quantity}
	@items << item_hash
	@total += (price * quantity)
end

def apply_discount
	@total *= (1 - (@discount/100.00))
	return "There is no discount to apply." if @discount == 0
	return "After the discount, the total comes to $#{@total.to_i}."
end

def items
	result = []
	@items.each { |e| 
		e[:quantity].times {
		result << e[:title]
		}
	}
	return result
end

def void_last_transaction
	temp = @items.pop
	@total -= (temp[:price] * temp[:quantity])
end


end


