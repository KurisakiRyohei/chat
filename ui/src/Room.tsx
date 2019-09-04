import React, {useState} from 'react'; //useStateフック: React の state の機能を関数コンポーネントに追加できる。
import styled from 'styled-components';

// const Wrapper = styled.div`
//   background-color: #f2d3d3;
//   flex: 1;
// `;
//TypeScriptでかく↓

interface WrapperStyle{
  focus: boolean;
};

const Wrapper = styled.div<WrapperStyle>`
  height: 60px;
  display: flex;
  justify-content: space-between;
  align-items:center;
  padding: 0 10px 0 10px;
  background-color: ${props => props.focus ? "red" : ""};
`;

type Props = {
  name: string;
  unreadCount: number;
}
//const MaxNameLength: number = 10;
const Room: React.FC<Props> = (props: Props) =>
  {
    //state変数の宣言。関数コールの間で値を『保持』しておくための方法。
    //クラスにおけるthis.stateと同じ機能。
    // useState() フックの唯一の引数は state の初期値
    // focusというstate変数を宣言。現在のfocusを更新したいときはsetFocusを呼ぶ。
    //この JavaScript の構文は “分割代入 (destructuring)” と呼ばれています。これが意味するところは、 focus と setFocus という名前の 2 つの変数を作って、useState から返される値のうち 1 つ目を focus に、2 つ目を setFoucus に代入する。
    const [focus, setFocus] = useState(false)
    //before
    // const {name} = props;
    // const {unreadCount} = props;
    const { name, unreadCount } = props;
     
    let displayName = name;
    let displayUnreadCount = "";

    if(name.length >= 10){
      displayName = name.substring(0, 10) + "...";
    }

    if (unreadCount > 0){
      displayUnreadCount = unreadCount.toString();
    }

    return (
      <Wrapper
        onMouseOver={() => setFocus(true)}
        onMouseOut={() => setFocus(false) }
        focus={focus}
      >
        <div>
          {displayName}
        </div>
        <div>
          {displayUnreadCount}
        </div>
      </Wrapper>
    );
  };

export default Room;
