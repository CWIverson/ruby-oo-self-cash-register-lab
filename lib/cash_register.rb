require "pry"
class CashRegister
    def initialize(discount=0)
        @total=0
        @discount=discount
        @items= []
        @price_log=[]
    end
    def discount
        @discount
    end
    attr_accessor :total
    def add_item(title, price, quantity=0)
      i=0
        if quantity<1
        @total += price
        @items<<title
        @price_log<<price
        puts "#{title} = #{price}"
       else
        @total += price*quantity
        while i<quantity
            @items<<title
            i+=1
        end
        @price_log<<(price*quantity)
        puts "#{title} = #{price} * #{quantity}"
       end
    end
    def apply_discount
        if @discount>0
        discount= 100-@discount
        @total= (@total/100)*discount
        "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end
    def items
        @items
    end
    def void_last_transaction
        void=@price_log.pop
       
        @total=(@total-void)
    end
end
