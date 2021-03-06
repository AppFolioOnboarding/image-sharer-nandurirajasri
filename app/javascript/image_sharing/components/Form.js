import React, { Component } from 'react';
import { inject, observer } from 'mobx-react';
import FeedbackService from '../services/PostFeedbackService';

@inject('stores')
@observer
class Form extends Component {
  state = {
    responseMessage: ''
  };

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
          <button
            type="button"
            className='btn btn-primary'
            onClick={() => {
              const feedbackService = new FeedbackService();
              return feedbackService.submitFeedback(feedbackStore)
                .then((res) => {
                  this.setState({ responseMessage: 'Successfully submitted the feedback!' });
                  return res;
                })
                .catch(() => {
                  this.setState({ responseMessage: 'Error while submitting the feedback!' });
                });
            }}
          >Submit
          </button>
          <p id="submitResponse" className='text-info'>{this.state.responseMessage}</p>
        </form>
      </div>
    );
  }
}

export default Form;
