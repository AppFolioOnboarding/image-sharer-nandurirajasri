import React from 'react';
import { shallow } from 'enzyme/build';
import { expect } from 'chai';
import { describe, it } from 'mocha';
import Header from '../../components/Header';

describe('<Header />', () => {
  const wrapper = shallow(<Header title="Tell us what you think" />);

  it('displays Feedback Page title', () => {
    expect(wrapper.find('h3').text()).to.equal('Tell us what you think');
  });
});
