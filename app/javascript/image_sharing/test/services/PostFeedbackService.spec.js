import { expect } from 'chai';
import { describe, it } from 'mocha';
import nock from 'nock';
import FeedbackService from '../../services/PostFeedbackService';

describe('FeedbackService', () => {
  it('should make a post request to the correct url', () => {
    const origin = 'http://localhost:3000';
    const feedbackService = new FeedbackService();
    const wnd = {
      location: {
        origin
      }
    };
    const postBody = {
      name: 'my name',
      comments: 'my comments'
    };
    nock(origin)
      .post('/api/feedbacks', postBody)
      .reply(200, { received: true });
    return feedbackService
      .submitFeedback(postBody, wnd)
      .then((res) => {
        expect(res.received).to.equal(true);
      });
  });
});
