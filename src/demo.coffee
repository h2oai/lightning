

read = (type, url, go) ->
  $.ajax
    dataType: type
    url: url
    success: (data, status, xhr) -> go null, data
    error: (xhr, status, error) -> go error



#
# Streaming parsers
#
NumberParser = (domain=[Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY]) ->
  self = (datum) ->
    domain[0] = datum if datum < domain[0]
    domain[1] = datum if datum > domain[1]
    datum
  self.domain = domain
  self

StringToIntParser = (domain) ->
  parse = NumberParser domain
  self = (datum) -> 
    value = parseInt datum, 10
    if isNaN value then null else parse value
  self.domain = parse.domain
  self

StringToRealParser = (domain) ->
  parse = NumberParser domain
  self = (datum) -> 
    value = parseFloat datum
    if isNaN value then null else parse value
  self.domain = parse.domain
  self

StringParser = (domain=[]) ->
  _id = 0
  _levels = {}

  if domain.length
    for level in domain
      _levels[level] = _id++

  self = (datum) ->
    level = if datum is undefined or datum is null then 'null' else datum
    unless undefined isnt id = _levels[level]
      _levels[level] = id = _id++
      self.domain.push level
    id

  self.domain = domain
  self

createVariables = (schema) ->
  for label, obj of schema
    if _.isString obj
      switch obj
        when 'string'
          parser = StringParser()
          new plot.Variable label, label, 'String', parser.domain, _.identity, parser

        when 'int'
          parser = StringToIntParser()
          new plot.Variable label, label, 'Number', parser.domain, _.identity, parser #TODO format
        when 'real'
          parser = StringToRealParser() 
          new plot.Variable label, label, 'Number', parser.domain, _.identity, parser #TODO format #TODO format

        #
        #TODO dates
        #
        else
          throw new Error "Invalid type #{obj} for schema field #{label}"

    else if _.isArray obj
      parser = StringParser()
      new plot.Variable label, label, 'String', parser.domain, _.identity, parser

    else
      throw new Error "Invalid type #{obj} for schema field #{label}"

createTable = (label, schema, data) ->
  variables = createVariables schema

  Record = plot.compile variables

  rows = CSV.parse data,
    header: no
    cast: no

  records = for row in rows
    record = new Record()
    for variable, i in variables
      record[variable.label] = variable.read row[i]
    record

  plot.table label, variables, records

window.csv = (label) ->
  (go) ->
    read 'json', "data/#{label}.json", (error, schema) ->
      if error
        go error
      else
        read 'text', "data/#{label}.csv", (error, data) ->
          if error
            go error
          else
            try
              go null, createTable label, schema, data
            catch error
              go error

