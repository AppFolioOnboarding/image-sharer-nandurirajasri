import React from 'react';
import { shallow } from 'enzyme/build';
import { expect } from 'chai';
import { describe, it } from 'mocha';
import Footer from '../../components/Footer';

describe('<Footer />', () => {
  const wrapper = shallow(<Footer copyright="Copyright: Appfolio Inc. Onboarding" />);

  it('displays Appfolio Inc footer message', () => {
    expect(wrapper.find('div').text()).to.equal('Copyright: Appfolio Inc. Onboarding');
  });
});
