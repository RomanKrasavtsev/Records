var AmountBox = React.createClass({
  render: function() {
      return (
        <div className = { "panel panel-" + this.props.type }>
          <div className = 'panel-heading'>
            { this.props.text }
          </div>
          <div className = 'panel-body'>
            { amountFormat(this.props.amount) }
          </div>
        </div>
      )
  }
});
