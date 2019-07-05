import { post } from '../utils/helper';

export default class PostFeedbackService {
  submitFeedback(form, win = window) {
    const pathToSubmit = `${win.location.origin}/api/feedbacks`;
    return post(pathToSubmit, form);
  }
}
