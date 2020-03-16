class Startup
    attr_accessor :name
    attr_reader :founder, :domain
    @@all = []
    
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain

        save # save the instance
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    # change name and domain
    def pivot(domain, name)
        @name = name
        @domain = domain
    end

    # list all startups created by a founder
    def self.find_by_founder(founder)
        self.all.select { |startup|  startup.founder === founder }
    end

    # list of unique domains
    def self.domains
        self.all.map { |startup| startup.domain }.uniq
    end

    def funding_rounds
        FundingRound.all.select { |round| round.startup === self }
    end

    # given a venture capitalist object, type of investment, and 
    # the amount invested (as a float), create a new funding round
    # and associate it with that startup and venture capitalist
    def sign_startup(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    # returns the total number of funding rounds that the startup has gotten
    def num_funding_rounds
        funding_rounds.count
    end

    # total number of funds a startup has received
    def total_funds
        funding_rounds.reduce(0) {|sum, round| sum += round.investment }
    end

    # returns a unique array of all the venture capitalists that have invested
    # in this startup
    def investors
        funding_rounds.map { |round| round.venture_capitalist }
    end

    # return a unique array of all the venture capitalists that have invested in this company
    # AND ARE IN THE TRES COMMAS CLUB (worth over a billion)
    def big_investors
        investors.select { |investor| investor.total_worth >= 1000000 }
    end
end