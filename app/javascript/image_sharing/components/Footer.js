import React, { Component } from 'react';
import PropTypes from 'prop-types';

class Footer extends Component {
  static propTypes = {
    copyright: PropTypes.string.isRequired
  };

  render() {
    const copyright = this.props.copyright;
    return (<div className='text-center' style={{ 'font-size': '10px' }}>{copyright}</div>);
  }
}

export default Footer;
