# Gcmex


## Installation

  1. Add gcmex to your list of dependencies in `mix.exs`:

        def deps do
          [{:gcmex, "~> 0.0.1"}]
        end

  2. Ensure gcmex is started before your application:

        def application do
          [applications: [:gcmex]]
        end
        
  3. Set your google api key  
    
       config :gcmex, api_key: "xxxtestxxx"

