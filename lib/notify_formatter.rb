# frozen_string_literal: true

class NotifyFormatter
  class << self
    def make_notification_message(data, notify_type: nil)
      case notify_type
      when :new_order then new_order(data)
      when :cancel then cancel(data)
      when :order_completed then order_completed(data)
      end
    end

    private

    def new_order(data)
      Bot.send_message(title: 'Новый заказ', message: data)
    end
    
    def cancel(data)
      Bot.send_message(title: 'Отмена заказа',  message: data)
    end
    
    def order_completed(data)
      Bot.send_message(title: 'Выкуп', meassage: data)
    end

    # params[data] - Array[]
    def data_formatter(data)
      unless data&.first
        puts '==========' 
        puts 'No content'
        puts '==========' 
        return 'No content'
      end
  
      text = <<-TEXT
        Дата заказа: #{response['date']}
        Область: #{response['oblast']} 
      TEXT

      text
    end
  end
end