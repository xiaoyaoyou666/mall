<style>
            <ul>
                {x2;tree:$msgList['data'],vv,cid}
                    <li>
                        {x2;if:v:vv['msg_url'] != ''}
                        <a target="_blank" href="{x2;v:vv['msg_url']}&msg_id={x2;v:vv['msg_id']}"><img src="app/core/styles/img/green-laba.png" style="margin-right:10px;width:16px;"/>{x2;v:vv['msg_title']}</a>
                        {x2;else}
                        <a target="_blank" href="index.php?user-company-message-messageinfo&msg_id={x2;v:vv['msg_id']}"><img src="app/core/styles/img/green-laba.png"/ style="width:16px;">{x2;v:vv['msg_title']}</a>
                        {x2;endif}
                    </li>
                {x2;endtree}
            </ul>
        </div>-->