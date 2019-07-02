/* eslint-env mocha */
import React from 'react';
import { shallow } from 'enzyme/build';
import { expect } from 'chai';
import { describe, it } from 'mocha';
import sinon from 'sinon';
import { Provider } from 'mobx-react';
import Form from '../../components/Form';

describe('<Form />', () => {
  let wrapper;
  let setName;
  let setComments;

  const name = 'My Name';
  const comments = 'This is my comment';

  const store = {
    name,
    comments,
    setName: () => {
    },
    setComments: () => {
    }
  };

  const provider = mock => (
    <Provider stores={{
      feedbackStore: mock
    }}
    >
      <Form />
    </Provider>
  );

  const nameTargetValue = { target: { value: name } };
  const commentsTargetValue = { target: { value: comments } };

  afterEach(() => {
    sinon.restore();
  });

  beforeEach(() => {
    wrapper = shallow(provider(store)).dive().dive();
    setName = sinon.stub(store, 'setName');
    setComments = sinon.stub(store, 'setComments');
  });

  describe('Form', () => {
    it('should contain a form', () => {
      expect(wrapper.find('form.bs-component')).to.have.lengthOf(1);
    });
  });

  describe('Name', () => {
    it('should display label and input for Name', () => {
      expect(wrapper.find('label.col-form-label').first().text()).to.equal('Name:');
      expect(wrapper.find('input.form-control')).to.have.lengthOf(1);
    });
    it('displays name stored in Feedbackstore in name input', () => {
      store.name = `name: ${name}`;
      wrapper.setProps(store);
      expect(wrapper.find('input.form-control').props().value).to.equal(store.name);
    });
    it('invokes setComments method in store on change', () => {
      wrapper.find('input.form-control').props().onChange(nameTargetValue);
      sinon.assert.calledWith(setName, name);
    });
  });

  describe('Comments', () => {
    it('should display label and textarea for Comments', () => {
      expect(wrapper.find('label.col-form-label').last().text()).to.equal('Comments:');
      expect(wrapper.find('textarea.form-control')).to.have.lengthOf(1);
    });
    it('invokes setComments method in store on change', () => {
      wrapper.find('textarea.form-control').props().onChange(commentsTargetValue);
      sinon.assert.calledWith(setComments, comments);
    });
    it('displays comments stored in Feedbackstore in comments textarea', () => {
      store.comments = `comments: ${comments}`;
      wrapper.setProps(store);
      expect(wrapper.find('textarea.form-control').props().value).to.equal(store.comments);
    });
  });

  describe('Submit', () => {
    it('should display a button for Submit', () => {
      expect(wrapper.find('button')).to.have.lengthOf(1);
      expect(wrapper.find('button').text()).to.equal(' Submit ');
    });
  });
});
