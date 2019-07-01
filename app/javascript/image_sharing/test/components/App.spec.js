import React from 'react';
import { shallow } from 'enzyme/build';
import { expect } from 'chai';
import { describe, it } from 'mocha';
import { Provider } from 'mobx-react';
import App from '../../components/App';
import Header from '../../components/Header';
import Footer from '../../components/Footer';

describe('<App />', () => {
  const wrapper = shallow(<Provider stores={{}}><App /></Provider>).dive().dive();

  it('should have a header', () => {
    expect(wrapper.find(Header)).to.have.lengthOf(1);
  });

  it('should have a footer', () => {
    expect(wrapper.find(Footer)).to.have.lengthOf(1);
  });
});
