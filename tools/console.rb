require_relative "../config/environment.rb"

def reload
    load "config/environment.rb"
end

#
# do some stuff
#
google = Startup.new("Google", "Larry Page", "Search Engine")
amazon = Startup.new("Amazon", "Jeff Bezos", "Online Book Store")
paypal = Startup.new("Paypal", "Elon Musk", "Online Payment Merchant")
tesla = Startup.new("Tesla", "Elon Musk", "Electric Vehicles")

john_doerr = VentureCapitalist.new("John Doerr", 100000)
mark_suster = VentureCapitalist.new("Mark Suster", 589850)
brad_feld = VentureCapitalist.new("Brad Feld", 80000)


angel_round = FundingRound.new(google, john_doerr, 'angel', 50000)
series_a = FundingRound.new(amazon, mark_suster, 'Series A', 190000)
series_b = FundingRound.new(paypal, brad_feld, 'Series B', 1200000)
series_c = FundingRound.new(tesla, brad_feld, 'Series C', 2500000)



#
# stop doing stuff
#
binding.pry
0 # leave this here to ensure `binding.pry` isn't the last line