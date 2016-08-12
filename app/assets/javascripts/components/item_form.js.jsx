var itemForm = React.createClass({
  getInitialState: function() {
    return {
      title: ''
    }
  },

  valid: function() {
    return this.state.title
  },

  render: function() {
    return (
      <div className='col-md-12'>
        <form className='form-inline'>
          <div className='form-group'>
            <input type='text' className='form-control' placeholder='Наименование статьи' name='title' value={this.state.title}/>
          </div>
          <button type='submit' className='btn btn-primary' disabled={!this.valid()}>Добавить статью</button>
        </form>
      </div>
    )
  }
});
