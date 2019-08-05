def consolidate_cart(cart)
  hash_cart = {}

  cart.each do |item|
    item.each_pair do |key, value|
      if hash_cart.include? key
        hash_cart[key][:count] +=1
      else
        hash_cart[key] = value
        hash_cart[key][:count] = 1
      end
    end
  end
  hash_cart
end

def apply_coupons(cart, coupons)
  coupons.each do |item_coupon|

    item_coupon.each_pair do |key, value|

			if cart.include? value

        if cart[value][:count] % item_coupon[:num] != 0
          cart["#{value} W/COUPON"] = {:price => (item_coupon[:cost] / item_coupon[:num]), :clearance => true, :count => item_coupon[:num]}

          cart[value][:count] = (cart[value][:count] - item_coupon[:num])
        else
          array_of_number_of_times_to_run_coupon = cart[value][:count].divmod(item_coupon[:num])

          cart["#{value} W/COUPON"] = {:price => (item_coupon[:cost] / item_coupon[:num]), :clearance => true, :count => array_of_number_of_times_to_run_coupon[0] * item_coupon[:num]}

          cart[value][:count] = array_of_number_of_times_to_run_coupon[1]

        end

			end
		end
	end
  cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
