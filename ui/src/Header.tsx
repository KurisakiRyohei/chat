import React from 'react';
import styled from 'styled-components';

const Wrapper = styled.div`
  background-color:  #ecf7c1;
  height: 50px;
  flex: 3;
`;
const Header: React.FC = () => {
  return (
    <Wrapper>
      <div>Header</div>
    </Wrapper>
  );
};

export default Header;
