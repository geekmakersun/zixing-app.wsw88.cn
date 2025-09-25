<?php namespace Phpcmf\Controllers\Admin;

// 审核管理
class Edit_verify extends \Phpcmf\Table
{

    public function __construct()
    {
        parent::__construct();

        $this->my_field = array(
            'uid' => array(
                'ismain' => 1,
                'name' => dr_lang('账号'),
                'fieldname' => 'uid',
                'fieldtype' => 'Uid',
                'setting' => array(
                    'option' => array(
                        'width' => 200,
                    ),
                    'validate' => array(
                        'required' => 1,
                    )
                )
            ),
            'content' => array(
                'ismain' => 1,
                'name' => dr_lang('全局'),
                'fieldname' => 'content',
                'fieldtype' => 'Text',
                'setting' => array(
                    'option' => array(
                        'width' => 200,
                    ),
                    'validate' => array(
                        'required' => 1,
                    )
                )
            ),
        );
        // 表单显示名称
        $this->name = dr_lang('用户资料审核');
        // 初始化数据表
        $list_field = [
            'avatar' => array(
                'use' => '1',
                'name' => '头像',
                'width' => '70',
                'func' => 'dr_member_verify_avatar',
                'center' => '1',
            ),
            'username' => array(
                'use' => '1',
                'name' => '账号',
                'width' => '120',
                'func' => 'author',
                'center' => '0',
            ),
            'status' => array(
                'use' => '1',
                'name' => '状态',
                'width' => '120',
                'func' => 'dr_member_verify_status',
                'center' => '0',
            ),
            'inputtime' => array(
                'use' => '1',
                'name' => '修改时间',
                'width' => '170',
                'func' => 'datetime',
                'center' => '0',
            ),
        ];
        $this->_init([
            'table' => 'member_verify',
            'stable' => 'member',
            'field' => $this->member_cache['field'],
            'join_list' => ['member', 'member.id=member_verify.uid', 'left'],
            'order_by' => 'member_verify.id desc',
            'list_field' => $list_field,
            'where_list' => 'tid=1',
            'select_list' => \Phpcmf\Service::M()->dbprefix('member_verify').'.*,'.\Phpcmf\Service::M()->dbprefix('member').'.username',
        ]);
        \Phpcmf\Service::V()->assign([
            'menu' => \Phpcmf\Service::M('auth')->_admin_menu(
                [
                    '用户资料审核' => ['member/'.\Phpcmf\Service::L('Router')->class.'/index', 'fa fa-edit'],
                ]
            ),
            'field' => $this->my_field,
        ]);
    }

    // 用户管理
    public function index() {

        $this->_List();
        $this->mytable = [
            'foot_tpl' => '',
            'link_tpl' => '',
            'link_var' => 'html = html.replace(/\{id\}/g, row.id);
            html = html.replace(/\{uid\}/g, row.id);',
        ];
        $uriprefix = APP_DIR.'/'.\Phpcmf\Service::L('Router')->class;
        if ($this->_is_admin_auth('del') || $this->_is_admin_auth('edit')) {
            $this->mytable['foot_tpl'].= '<label class="table_select_all"><input onclick="dr_table_select_all(this)" type="checkbox"><span></span></label>';
        }
        if ($this->_is_admin_auth('del')) {
            $this->mytable['foot_tpl'].= '<label><button type="button" onclick="dr_table_option(\''.(IS_ADMIN ? dr_url($uriprefix.'/del') : dr_member_url($uriprefix.'/del')).'\', \''.dr_lang('你确定要删除它们吗？').'\')" class="btn red btn-sm"> <i class="fa fa-trash"></i> '.dr_lang('删除').'</button></label>';
        }

        if ($this->_is_admin_auth('edit')) {
            $this->mytable['link_tpl'].= '<label><a href="'.dr_url($uriprefix.'/edit').'&id={id}" class="btn btn-xs green"> <i class="fa fa-edit"></i> '.dr_lang('审核').'</a></label>';
        }

        \Phpcmf\Service::V()->assign([
            'mytable' => $this->mytable,
        ]);
        \Phpcmf\Service::V()->display('edit_verify_list.html');
    }

    // 修改内容
    public function edit() {
        list($tpl) = $this->_Post(intval(\Phpcmf\Service::L('input')->get('id')));
        $verify_msg = [];
        if ($this->member_cache['config']['verify_msg']) {
            $msg = @explode(PHP_EOL, $this->member_cache['config']['verify_msg']);
            $msg && $verify_msg = $msg;
        }
        \Phpcmf\Service::V()->assign([
            'verify_msg' => $verify_msg,
        ]);
        \Phpcmf\Service::V()->display($tpl);
    }

    // 删除内容
    public function del() {
        $this->_Del(
            \Phpcmf\Service::L('Input')->get_post_ids(),
            function($rows) {
                // 删除前的验证
                return dr_return_data(1, 'ok', $rows);
            },
            function($rows) {
                // 删除后的处理
                return dr_return_data(1, 'ok');
            },
            \Phpcmf\Service::M()->dbprefix($this->init['table'])
        );
    }

    /**
     * 获取内容
     * $id      内容id,新增为0
     * */
    protected function _Data($id = 0) {
        $row = parent::_Data($id);
        // 这里可以对内容进行格式化显示操处理
        $data = \Phpcmf\Service::M()->table('member')->get($row['uid']);
        $row['username'] = $data['username'];
        $data = dr_string2array($row['content']);
        $row['name'] = $data['name'];
        if ($data['info']) {
            foreach ($data['info'] as $i => $t) {
                $row[$i] = $t;
            }
        }
        $data = \Phpcmf\Service::M()->table('member_data')->get($row['uid']);
        if ($data) {
            foreach ($data as $i => $t) {
                if (!isset($row[$i])) {
                    $row[$i] = $t;
                }
            }
        }
        return $row;
    }

    // 格式化保存数据
    protected function _Format_Data($id, $data, $old) {

        if ($old['status'] == 2) {
            $this->_json(0, '已通过内容无法编辑');
        }

        $post = \Phpcmf\Service::L('input')->post('data');
        $save = [
            'status' => $post['status'] ? 2 : 0,
            'updatetime' => SYS_TIME,
            'result' => $post['result'],
            'content' => dr_array2string([
                'name' => $post['name'] ? $post['name'] : '',
                'info' => $data[1],
            ]),
        ];


        // 后台提醒
        \Phpcmf\Service::M('member')->todo_admin_notice('member/edit_verify/edit:id/'.$id, 0);

        // 通知
        $call = $save;
        $call['uid'] = $old['uid'];
        $call['content'] = dr_string2array($call['content']);
        $call['inputtime'] = $old['inputtime'];
        if ($post['status']) {
            if ($post['name']) {
                if ($this->member_cache['config']['unique_name']
                    && \Phpcmf\Service::M()->db->table('member')->where('id<>'. $old['uid'])->where('name', $post['name'])->countAllResults()) {
                    $this->_json(0, dr_lang('%s已经存在', MEMBER_CNAME), ['field' => 'name']);
                }
                \Phpcmf\Service::M()->table('member')->update($old['uid'], [
                    'name' => dr_strcut(dr_safe_replace($post['name']), 20, ''),
                ]);
            }
            $data[1]['is_complete'] = 1;
            \Phpcmf\Service::M()->table('member_data')->update($old['uid'], $data[1]);
            \Phpcmf\Service::L('Notice')->send_notice('member_edit_verify_1', $call);
        } else {
            \Phpcmf\Service::M()->db->table('member_data')->where('id', $call['uid'])->update(['is_complete' => 0]);
            \Phpcmf\Service::L('Notice')->send_notice('member_edit_verify_0', $call);
        }

        return $save;
    }


    // 保存内容
    protected function _Save($id = 0, $data = [], $old = [], $func = null, $func2 = null) {
        return parent::_Save($id, $data, $old, function($id, $data, $old){
            // 验证数据
            /*
            if (!$data[1]['title']) {
                return dr_return_data(0, '标题不能为空！', ['field' => 'title']);
            }*/
            // 保存之前执行的函数，并返回新的数据
            if (!$id) {
                // 当提交新数据时，把当前时间插入进去
                //$data[1]['inputtime'] = SYS_TIME;
            }

            return dr_return_data(1, null, $data);
        }, function ($id, $data, $old) {
            // 保存之后执行的动作

            $post = \Phpcmf\Service::L('input')->post('data');
            if ($post['status']) {
                \Phpcmf\Service::M()->table('member_verify')->delete($id);
            }

            \Phpcmf\Hooks::trigger('member_verify_after', $data, $old);
        });
    }

}
