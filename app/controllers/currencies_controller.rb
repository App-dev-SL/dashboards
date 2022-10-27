class  CurrenciesController < ApplicationController
  def first_currency
    
    @raw_data= open("https://api.exchangerate.host/symbols").read
    @parsed_data= JSON.parse(@raw_data)
    @symbols_hash=@parsed_data.fetch("symbols")
    @array_of_symbols=@symbols_hash.keys
    render ({:template => "currency_templates/step_one.html.erb"})
  end

    def second_currency
    @raw_data= open("https://api.exchangerate.host/symbols").read
    @parsed_data= JSON.parse(@raw_data)
    @symbols_hash=@parsed_data.fetch("symbols")
    @array_of_symbols=@symbols_hash.keys
    @from_symbol=params.fetch("from_currency")

      render({:template =>"currency_templates/step_two.html.erb"})
  end

  def translation
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")

    @array_of_symbols = @symbols_hash.keys

  

    @from_symbol = params.fetch("from_currency")
    @to_symbol = params.fetch("to_currency")

   
    @raw_convert_data = open("https://api.exchangerate.host/convert?from=" + @from_symbol.to_s + "&to=" + @to_symbol.to_s).read
    @parsed_convert_data = JSON.parse(@raw_convert_data)
    @convert_info = @parsed_convert_data.fetch("info")
    @convert_rate = @convert_info.fetch("rate")


   
    render ({:template =>"currency_templates/step_three.html.erb"})

  end 


end
