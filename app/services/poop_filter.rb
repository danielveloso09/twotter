module PoopFilter
  module_function

  def filter(text)
    url = 'http://poopfilter.herokuapp.com/filter'
    options = { query: { text: text } }

    response = HTTParty.post(url, options)
    parsed_response = response.parsed_response
    parsed_response['output']
  end
end
