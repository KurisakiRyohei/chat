import React from 'react';
import styled from 'styled-components';
import Header from './Header';
import Rooms from './Rooms';
import ChatRoom from './ChatRoom';
const Main = styled.div`
  height: calc(100vh - 50px);
  display: flex;
`;
const App: React.FC = () => {
  return (
    <div>
      <Header />
      <Main>
        <Rooms />
        <ChatRoom />
      </Main>
      {/* <RootWraper>
        <Rooms />
        <ChatRoom />
      </RootWraper> */}
    </div>
  );
};

export default App;
