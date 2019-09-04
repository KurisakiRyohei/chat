import React from 'react';
import styled from 'styled-components';
import { tsPropertySignature } from '@babel/types';

//Roomが必要。
const Wrapper = styled.div`
  background-color: #dddebe;
  flex: 1;
  display: flex;
  justify-content:center;
  align-items:center;
`;
type Props = {
  name: string;
};
const ChatRoomHeader: React.FC<Props> = (props: Props) =>{
  return (
    <Wrapper>
      {props.name}
    </Wrapper>
  )
}

export default ChatRoomHeader;