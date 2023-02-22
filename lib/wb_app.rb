# TODO:
# 1) новый заказ
# 2) отмена
# 3) выкуп
# 4) возврат (после выкупа)

class WbApp
  def start
    Bot.greeting
    if Bot.set_wb_api_key
      poling_orders
    end
  end

  def update_orders
    until new_order
      poling_orders
    end
  end
  
  def poling_orders
    params = params(dateFrom: Time.now.strftime('%Y-%m-%dT%TZ'))        
    WbApiService.orders(params)
  end

  private

  def params(params = {})
    BASE_PARAMS.merge(params)
  end
end
