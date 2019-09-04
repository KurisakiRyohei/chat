import React from 'react';
import styled from 'styled-components';
import Msg from './Msg';

const Wrapper = styled.div`
  background-color: #4db6ac;
  flex: 10;

  display: flex;
  flex-direction: column;
`;

type Msg = {
  id: number;
  content: string;
  userId: number;
};

type Props = {
  msgs: Array<Msg>;
  currentUserId: number;
}
//メッセージの列が必要。

const ChatRoomMsg: React.FC<Props> = (props:Props) =>{
  const  {msgs, currentUserId} = props;
  return (
    <Wrapper>
      {
        props.msgs.map(msg =>(
          <Msg
            key={msg.id}
            content={msg.content}
            mine={currentUserId === msg.userId}
          />
        ))
      }
    </Wrapper>
  )
}

export default ChatRoomMsg;