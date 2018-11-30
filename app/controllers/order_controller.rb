class OrderController < ApplicationController
    before_action :require_login
    
    def create_order
        if current_user.orders == nil
            o = Order.new
            o.save
            current_user.orders << o
        end
        new_order = Order.new
        current_user.cart.items.each do | item |
            new_order.items << item
            new_order.save
        end
        current_user.orders << new_order
        current_user.save
        UserMailer.order_confirmation(current_user).deliver_now!
        redirect_to '/profil', notice: "Wow such donations kthxbye <3"
        current_user.cart.items.delete_all
    end

    def profil
        redirect_to '/profil', alert: "Please register to show profil !" if current_user == nil
    end

    def new
        redirect_to '/profil'
	end

    def create
        @amount = params[:amount]
        
        @amount = @amount.gsub('$', '').gsub(',', '')
        
        begin
            @amount = Float(@amount).round(2)
        rescue
            flash[:error] = 'Charge not completed. Please enter a valid amount in USD ($).'
            redirect_to new_charge_path
            return
        end
        
        @amount = (@amount * 100).to_i # Must be an integer!
        
        if @amount < 100
            flash[:error] = 'Charge not completed. Donation amount must be at least $5.'
            redirect_to new_charge_path
            return
        end
        
        Stripe::Charge.create(
            :amount => @amount,
            :currency => 'eur',
            :source => params[:stripeToken],
            :description => 'Custom donation'
            )
            
        redirect_to '/profil'
        rescue Stripe::CardError => e
            flash[:error] = e.message
            redirect_to new_charge_path
    end
        
    private
        
    def require_login
        unless current_user
            redirect_to new_user_session_path
        end
    end
end
    