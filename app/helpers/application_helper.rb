module ApplicationHelper

  def generate_pay2go_params(payment)
    payment[:payment_method] == "Credit" ? credit = 1 : credit = 0
    payment[:payment_method] == "WebATM" ? webatm = 1 : webatm = 0
    payment[:payment_method] == "ATM" ? vacc = 1 : vacc = 0
    pay2go_params = {
        MerchantID: Pay2go.merchant_id,
        RespondType: "JSON",
        TimeStamp: payment.created_at.to_i,
        Version: "1.2",
        LangType: "zn-TW",
        MerchantOrderNo: payment.external_id,
        Amt: payment.amount,
        ItemDesc: payment.name,
        ReturnURL: pay2go_return_url,
        NotifyURL: Pay2go.notify_url,
        Email: payment.email,
        LoginType: 0,
        CREDIT: credit,
        WEBATM: webatm,
        VACC: vacc,
        CVS: 0,
        BARCODE: 0
    }
    pay2go = Pay2go.new(pay2go_params)
    pay2go_params[:CheckValue] = pay2go.make_check_value
    pay2go_params
  end

  def magic(x)
    doc = Nokogiri::HTML(x)
    keys = doc.at('img').keys
    values = doc.at('img').values
    hash_array = {}
    keys.each_with_index do |key, index|
      hash_array[key.to_sym] = values[index]
    end
    image_tag((hash_array.extract!(:src).values[0]),hash_array)

  end
end
