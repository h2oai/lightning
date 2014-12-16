

read = (type, url, go) ->
  $.ajax
    dataType: type
    url: url
    success: (data, status, xhr) -> go null, data
    error: (xhr, status, error) -> go error

asReal = (datum) ->
  value = parseFloat datum
  if isNaN value then undefined else value

asInt = (datum) ->
  value = parseInt datum, 10
  if isNaN value then undefined else value

asString = (datum) ->
  if datum? then datum else undefined

identifyColumns = (schema) ->
  for label, obj of schema
    if _.isString obj
      switch obj
        when 'string'
          label: label
          type: 'String'
          domain: []
          parse: asString

        when 'int'
          label: label
          type: 'Number'
          parse: asInt

        when 'real'
          label: label
          type: 'Number'
          parse: asReal

        #
        #TODO dates
        #
        else
          throw new Error "Invalid type #{obj} for schema field #{label}"

    else if _.isArray obj
      label: label
      type: 'String'
      domain: obj
      parse: asString

    else
      throw new Error "Invalid type #{obj} for schema field #{label}"

createFrame = (label, schema, data) ->
  columns = identifyColumns schema
  rows = CSV.parse data,
    header: no
    cast: no

  vectors = for column, offset in columns
    data = new Array rows.length
    for row, index in rows
      if undefined isnt value = column.parse row[offset]
        data[index] = value

    switch column.type
      when 'String'
        plot.createFactor(
          column.label   
          column.type
          data
          column.domain
        )
      when 'Number'
        plot.createVector(
          column.label
          column.type
          data
          _.identity #TODO
        )
      #TODO Date

  plot.createFrame label, vectors, _.range rows.length

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
              go null, createFrame label, schema, data
            catch error
              go error

