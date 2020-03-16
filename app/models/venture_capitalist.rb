class VentureCapitalist
    attr_reader :name, :total_worth
    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth

        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    # given a startup object, type of investment, and the amount invested (as a float),
    # create a new funding round and associate it with the startup and venture capitalist
    def offer_contract(startup, investment_type, investment_amount)
        FundingRound.new(startup, self, investment_type, investment_amount)
    end

    # funding rounds
    # returns an array of all funding rounds for that venture capitalist
    def funding_rounds
        FundingRound.all.select { |round| round.venture_capitalist === self }
    end

    # portfolio
    # returns a unique list of all startups that venture capitalist has invested in
    def portfolio
        funding_rounds.map {|round| round.startup }.uniq
    end

    # biggest investment
    # returns the largest funding round given by this venture capitalist
    def biggest_investment
        funding_rounds.sort { |round| round.investment }.last
    end
    # invested
    # given a domain string, returns the total amount invested in that domain
    def invested(domain)
        funding_rounds.select {|round| round.startup.domain === domain}
    end
end