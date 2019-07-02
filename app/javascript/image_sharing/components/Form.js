import React, { Component } from 'react';
import { inject, observer } from 'mobx-react';

@inject('stores')
@observer
class Form extends Component {
  render() {
    const feedbackStore = this.props.stores.feedbackStore;
    return (
      <div className="col-lg-4 offset-lg-4">
        <form className='bs-component'>
          <label className='col-form-label' htmlFor='name' >
            Name:
          </label>
          <input
            type="text"
            id="name"
            className='form-control'
            value={feedbackStore.name}
            onChange={(e) => { feedbackStore.setName(e.target.value); }}
          />
          <label className='col-form-label' htmlFor='comments'>
            Comments:
          </label>
          <textarea
            type="text"
            id="comments"
            className='form-control'
            value={feedbackStore.comments}
            onChange={(e) => { feedbackStore.setComments(e.target.value); }}
          />
          <button type="submit" className='btn btn-primary'> Submit </button>
        </form>
      </div>
    );
  }
}

export default Form;
