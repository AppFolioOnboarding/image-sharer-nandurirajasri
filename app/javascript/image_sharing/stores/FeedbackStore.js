import { action, observable } from 'mobx';

export default class FeedbackStore {
  @observable name;
  @observable comments;

  constructor(options = {}) {
    this.name = options.name || '';
    this.comments = options.comments || '';
  }

  @action
  setName(name) {
    this.name = name;
  }

  @action
  setComments(comments) {
    this.comments = comments;
  }
}
