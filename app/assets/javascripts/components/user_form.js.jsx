var userForm = React.createClass({
  getInitialState: function() {
    return {
      name: ''
    }
  },

  valid: function() {
    return this.state.name
  },

  render: function() {
    return (
      <div className='col-md-12'>
        <form className='form-inline'>
          <div className='form-group'>
            <input type='text' className='form-control' placeholder='Имя пользователя' name='name' value={this.state.name}/>
          </div>
          <button type='submit' className='btn btn-primary' disabled={!this.valid()}>Добавить пользователя</button>
        </form>
      </div>
    )
  }
});
