@Records = React.createClass
  getInitialState: ->
    records: @props.data

  getDefaultProps: ->
    records: []

  addRecord: (record) ->
    records = React.addons.update(@state.records, { $push: [record] })
    @setState records: records

  updateRecord: (record, data) ->
    index = @state.records.indexOf record
    records = React.addons.update(@state.records, { $splice: [[index, 1, data]] })
    @replaceState records: records

  deleteRecord: (record) ->
    index = @state.records.indexOf record
    records = React.addons.update(@state.records, { $splice: [[index, 1]] })
    @replaceState records: records

  credits: ->
    credits = @state.records.filter (val) -> val.amount >= 0
    credits.reduce ((prev, curr) ->
      prev + parseFloat(curr.amount)
    ), 0

  debits: ->
    debits = @state.records.filter (val) -> val.amount < 0
    debits.reduce ((prev, curr) ->
      prev + parseFloat(curr.amount)
    ), 0

  balance: ->
    @debits() + @credits()

  render: ->
    React.DOM.div
      className: 'records'
      React.DOM.h2
        className: 'title'
        'Учет'
      React.DOM.div
        className: 'row'
        React.DOM.div
          className: 'col-md-2'
          React.DOM.div
            className: 'row'
            React.createElement AmountBox, type: 'success', amount: @credits(), text: 'Доходы'
          React.DOM.div
            className: 'row'
            React.createElement AmountBox, type: 'danger', amount: @debits(), text: 'Расходы'
          React.DOM.div
            className: 'row'
            React.createElement AmountBox, type: 'info', amount: @balance(), text: 'Баланс'
        React.DOM.div
          className: 'col-md-4 col-md-offset-1'
          React.DOM.div
            className: 'row'
            React.createElement listBox, type: 'primary', amount: @credits(), text: 'Статьи'
            React.DOM.div
              className: 'row'
              React.createElement itemForm
        React.DOM.div
          className: 'col-md-4 col-md-offset-1'
          React.DOM.div
            className: 'row'
            React.createElement listBox, type: 'warning', amount: @credits(), text: 'Пользователи'
            React.DOM.div
              className: 'row'
              React.createElement userForm

      React.DOM.hr null

      React.DOM.div
        className: 'row'
        React.createElement RecordForm, handleNewRecord: @addRecord

      React.DOM.hr null

      React.DOM.div
        className: 'row'
        React.DOM.div
          className: 'col-md-12'
          React.DOM.table
            className: 'table table-bordered'
            React.DOM.thead null,
              React.DOM.tr null,
                React.DOM.th null, 'Дата'
                React.DOM.th null, 'Заголовок'
                React.DOM.th null, 'Сумма'
                React.DOM.th null, 'Действия'
            React.DOM.tbody null,
              for record in @state.records
                React.createElement Record, key: record.id, record: record, handleDeleteRecord: @deleteRecord, handleEditRecord: @updateRecord
