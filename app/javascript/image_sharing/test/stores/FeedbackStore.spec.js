import { expect } from 'chai';
import { describe, it } from 'mocha';
import FeedbackStore from '../../stores/FeedbackStore';

describe('FeedbackStore', () => {
  const name = 'my name';
  const comments = 'this is my comment';
  const store = new FeedbackStore();

  it('stores correct name', () => {
    store.setName(name);
    expect(store.name).to.equal(name);
  });

  it('stores correct comments', () => {
    store.setComments(comments);
    expect(store.comments).to.equal(comments);
  });
});
