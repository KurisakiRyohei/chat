import React from 'react';
import styled from 'styled-components';
import Room from './Room';

const Wrapper = styled.div`
  flex: 1;
  background-color: #f2d3d3;
`;

const rooms = [
  {
    id: 1,
    name: "哲学科",
    unreadCount: 1,
  },
  {
    id: 2,
    name: "Circle CI",
    unreadCount: 0,
  },
  {
    id: 3,
    name: "テクニカル",
    unreadCount: 100,
  },
  {
    id: 4,
    name: "とても長いとても長いとても長いとても長いとても長いとても長いとても長い",
    unreadCount: 12,
  },
];

const Rooms: React.FC = () => {
  return (
    <Wrapper>
      {rooms.map(room => (
        <Room
          key={room.id}
          name={room.name}
          unreadCount={room.unreadCount}
        />
      ))}
    </Wrapper>
  );
};

export default Rooms;