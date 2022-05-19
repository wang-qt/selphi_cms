defmodule SelphiCmsWeb.Live.Tables.PostTable do
  @moduledoc """
  探索一个完整的 table liveview 的设计实现。
  最终 这个liveveiw 会嵌入普通模版使用，并能动态的设置数据源，
  """
  use SelphiCmsWeb, :surface_view


  alias SelphiDaisy.Form.Rating

  alias   SelphiDaisy.Card
  alias   SelphiDaisy.Card.{Body,Figure}
  alias   SelphiDaisy.Card.Body.{Title,Text,Action}

  alias SelphiCms.Posts.Post

  # 配置表格默认属性，每次'刷新'或'重定向'，都会重新恢复这些初始设置。
  # 这些参数保存在 assigns.params 中。
  # 界面上可以动态调整这些参数，eg. 改变分页，改变分页大小，字段显示隐藏，排序，过滤等，都会自动合并到 assigns.params中！
  # 每次参数变化或操作(eg. 删除)，都会触发重新查询数据，数据保存在 assigns.params.list 中，记录总数保存在 assigns.params.total
  # 有些操作，会自动定位到第一个分页，例如: 排序, 过滤。
  use SelphiDynatable,
      repo: SelphiCms.Repo,
        #      query: from(p in Post),
      query: from(p in Post, preload: [:user]),  # Post shcema中首先定义 belongs_to(:user, SelphiCms.Accounts.User)
      belongs_to: :user,                         # Post shcema中首先定义 belongs_to(:user, SelphiCms.Accounts.User)
      routes: Routes,
      path: :post_path,                          # new show edit 跳转基地址
      fields: [                                  # 字段设置，此处只需要配置字段的search和hedden.默认 search: true, hedden: false
        id: [],                                  # order 在 Column上配置
        title: [],
        content: [],
        read_count: [],
        rating: [] ,
        price: [],
        is_lock: [] ,
        is_online: [] ,
        user_id: [search: false, hidden: true] ,
        inserted_at: []
      ],
      batch_actions: [
             # batch_delete  batch_export 默认存在，只需扩展自定义 批处理事件
#            batch_delete:  %{icon: "x", label: "删除选中"},
#            batch_export: %{icon: "cloud-download", label: "导出选中"},
            batch_offline: %{icon: "status-offline", label: "批量下架"},
            batch_lock: %{icon: "lock-closed", label: "批量锁定"}
      ],
      action_buttons: [  # 至少配一项
        # show  edit  delete 默认已实现，只需扩展自定义 "行事件", eg. 参见 lock 和 unlock的处理
        # show edit  delete 虽然已经实现，但是还需要在此配置，不配置，认为是不显示该按钮
#        show: %{icon: "eye", label: "查看"},
        edit: %{icon: "pencil-alt", label: "编辑"},
        delete: %{icon: "trash", label: "删除"},
        lock:  %{icon: "lock-closed", label: "锁定"},
        unlock:  %{icon: "lock-open", label: "解锁"},
      ],
      order: [{:desc, :id}],   #   初始顺序，不设置 按数据库 自动顺序
      per_page: 10           # 分页大小



  def render(assigns) do
    ~F"""
    <div class="min-w-full mx-auto">
    <h1>文章管理</h1>
    <div>

    </div>
    <div >
      <Table id="live-table"  check hover  footer
            items={ post <- assigns.params.list }
            filters={assigns.params.filters || [] }
            per_page={assigns.params.per_page}
            batch_actions={ assigns.params.batch_actions }
            action_buttons={ assigns.params.action_buttons }
            new_url={ build_new_url(assigns)   }
            searchable={ search_enabled?(assigns.params) }
            class="table-compact sm:table-normal"
        >
        <Column title="记录ID" field="id"
                hide={ get_field_hidden(assigns, :id) }
                type="number" sort
                search={ get_field_search(assigns, :id) } >
           {post.id}
        </Column>
        <Column title="标题" field="title"
                hide={ get_field_hidden(assigns, :title) }
                type="text" sort
                search={ get_field_search(assigns, :title) } >
            <div class="flex items-center space-x-3">
               <Avatar size="12" mask="squircle">
                <img src={ post.cover }>
               </Avatar>
               <div>
                  <div class="font-bold">{ post.title }</div>
                  <div class="text-sm opacity-50">(更新于: <strong>{ post.updated_at}</strong>)</div>
               </div>
            </div>
        </Column>

        <Column title="内容" field="content"
                hide={ get_field_hidden(assigns, :content) } type="text"
                search={ get_field_search(assigns, :content) } >
          <a href="#">{ post.content }</a>
        </Column>

        <Column title="阅读数" field="read_count"
                hide={ get_field_hidden(assigns, :read_count) }
                type="number" sort
                search={ get_field_search(assigns, :read_count) }  >
            {post.read_count}
        </Column>

        <Column title="评分" field="rating"
                hide={ get_field_hidden(assigns, :rating) }
                type="number" sort
                search={ get_field_search(assigns, :rating) } >
           <Rating  id={"rating" <> post.id } field={:rating}  mask="mask-heart" bg_color="bg-green-400"
                        half  size="sm"
                     options={[
                       [value: 1],
                       [value: 2,  checked: true],
                       [value: 3],
                       [value: 4 ],
                       [value: 5 ]
                     ]} />
        </Column>

        <Column title="价格" field="price"
               hide={ get_field_hidden(assigns, :price) }
               type="number" sort
               search={ get_field_search(assigns, :price) } >
           { post.price }
        </Column>

        <Column title="锁定?" field="is_lock"
               hide={ get_field_hidden(assigns, :is_lock) }
               type="select" sort
               options={ [{"锁定", "1"},{"正常", "0"}] }
               search={ get_field_search(assigns, :is_lock) } >
           { post.is_lock }
        </Column>
        <Column title="上架?" field="is_online"
               hide={ get_field_hidden(assigns, :is_online) }
               type="select" sort
               options={ [{"上架", "1"},{"下架", "0"}] }
               search={ get_field_search(assigns, :is_online) } >
           { post.is_online }
        </Column>

        <Column title="作者" field="user_id"
                hide={ get_field_hidden(assigns, :user_id) }
                type="number" sort
                search={ get_field_search(assigns, :user_id) }  >
           {!-- { post.user_id }  --}
           {!-- 获取记录对应的父记录，此处是 user，使用 card 显示  --}
           {#if user=parent_for(post, assigns.params) }
             { user.id }
             <Dropdown pop_pos="end" >
               <Label class="btn-circle btn-ghost btn-xs text-info-content">
                 <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="w-4 h-4 stroke-current"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
               </Label>
               {!-- 手动添加 dropdown-content --}
               <Card color="secondary" class="dropdown-content w-80" opts={tabindex: "0"}>
               <Body>
               <Title title={ user.email} />
               <Text>
                注册日期{user.inserted_at}.
               </Text>
               </Body>
               </Card>
             </Dropdown>
           {#else}  {!-- 父记录不存在，可能是数据有误！ --}
              <span> { post.user_id }</span>
           {/if}

        </Column>


        <Column title="发行时间" field="inserted_at"
                hide={ get_field_hidden(assigns, :inserted_at) }

                {!-- type="datetime"  --}
                {!-- type="date"  --}  {!-- 尝试把 datetime 和 date 进行比较 --}
                 type="date-range"
                 {!-- type="datetime-range"  --}
                sort
                search={ get_field_search(assigns, :inserted_at) }
                width="200px"
          >
          {post.inserted_at}
        </Column>

        <Column title="操作" virtual >
           {!--
           <Button class="btn btn-outline btn-primary btn-xs">查看</Button>
           <Button class="btn btn-outline btn-secondary btn-xs">编辑</Button>
           <Button class="btn btn-outline btn-accent btn-xs">删除</Button>
           --}
           <Dropdown pop_pos="left" type="hover" >
                <Label class="btn-primary btn-sm btn-outline">
                    <Heroicons name="dots-horizontal" size="5" />
                </Label>
                <Menu   class="dropdown-content p-0 shadow-xl rounded-box w-56" >
                    {#for { key, row_action } <- assigns.params.action_buttons }
                    <Item hover_bordered >
                       {#case key  }
                        {#match :delete}
                           <a href="#"  phx-click={to_string(key)} phx-value-id={post.id} data-confirm= "Are you delete?" >
                              <Heroicons name={ row_action.icon }   />  {row_action.label }
                           </a>
                        {#match :show}
                          <a href={ build_show_url(assigns , post.id  ) }   >
                            <Heroicons name={ row_action.icon }   />  {row_action.label }
                          </a>
                        {#match :edit}
                          <a href={ build_edit_url(assigns,  post.id ) }   >
                            <Heroicons name={ row_action.icon }   />  {row_action.label }
                          </a>
                        {#match _}
                          <a href="#"  phx-click={to_string(key)} phx-value-id={post.id} >
                            <Heroicons name={ row_action.icon }   />  {row_action.label }
                          </a>
                      {/case}
                      </Item>
                    {/for}
                </Menu>
            </Dropdown>
        </Column>
      </Table>

    </div>
    <div>
      {!-- 分页 --}
      <div class="my-5">
        <Pagination id="pagination" size="sm"
             cur_page={assigns.params.page}
             total={assigns.params.total}
             pg_size={ assigns.params.per_page }   />
      </div>
    </div>
    </div>


    """
  end



  ###########################
  ######## 自定义 批处理事件 bgn ########
  ###########################

 # 首先在 batch_actions 中 定义了 batch_offline 事件
 #      batch_actions: [
  #            batch_offline: %{icon: "status-offline", label: "批量下架"},
  #            batch_lock: %{icon: "lock-closed", label: "批量锁定"}
  #      ],
  #  收到消息格式  message = %{"ids" => "28,27,26,25,24,23,22,21,20,19,"}
  def handle_event("batch_offline", %{"ids" => ids } = message ,
        %{assigns: %{params:  %Params{query: query, repo: repo } = params} } = socket) do
    IO.puts "收到 batch_offline  事件！"
    IO.inspect message

    # 去掉尾部的 "," 号
    ids = String.trim_trailing(ids,",")
    # 转化为 list，eg.["3", "4", "5", "7", "8", "9"]
    id_list = String.split(ids, ",")

    # 更新时，必须去掉 预加载的 关系！！
    {count, _ } =
      from( q in exclude(query, :preload ), where: q.id in ^id_list )
      |> repo.update_all(set: [is_online: 0])


    socket =
      socket
      |> put_flash( :info, "下架#{count}项记录成功!")
      |> assign_params(:total, Database.get_record_count(params) )
      |> assign_params(:list, Database.get_records(params))


    {:noreply, socket }
  end
  # %{"ids" => "28,27,26,25,24,23,22,21,20,19,"}
  def handle_event("batch_lock", %{"ids" => ids } = message ,
        %{assigns: %{params:  %Params{query: query, repo: repo } = params} } = socket) do
    IO.puts "收到 batch_lock  事件！"
    IO.inspect message

    # 去掉尾部的 "," 号
    ids = String.trim_trailing(ids,",")
    # 转化为 list，eg.["3", "4", "5", "7", "8", "9"]
    id_list = String.split(ids, ",")

    # 更新时，必须去掉 预加载的 关系！！
    {count, _ } =
      from( q in exclude(query, :preload ), where: q.id in ^id_list )
      |> repo.update_all(set: [is_lock: 1])

    socket =
      socket
      |> put_flash( :info, "锁定#{count}项记录成功!")
      |> assign_params(:total, Database.get_record_count(params) )
      |> assign_params(:list, Database.get_records(params))

    {:noreply, socket }
  end

  ###########################
  ######## 自定义 批处理事件 end ########
  ###########################

  ###########################
  ######## 自定义行事件 bgn ########
  ###########################

  # 首先在 action_buttons 中定义 lock 事件
  #       action_buttons: [  # 至少配一项
  #        ...
  #        lock:  %{icon: "lock-closed", label: "锁定"},
  #        unlock:  %{icon: "lock-open", label: "解锁"},
  #      ],
  def handle_event("lock", %{"id" => id} =  message ,
        %{assigns: %{params:  %Params{query: query, repo: repo } = params} } =socket ) do
    IO.puts "收到 lock  事件！"
    IO.inspect message

    # 更新时，必须去掉 预加载的 关系！！
    post = repo.get!( exclude(query, :preload ) , String.to_integer(id))

    changeset =
      post
      |> Post.changeset_lock(%{is_lock: 1})

    socket =
      case repo.update(changeset) do
        {:ok, struct}       -> # Updated with success
          socket
          |> put_flash( :info, "锁定记录#{id}成功!")
          |> assign_params(:total, Database.get_record_count(params) )
          |> assign_params(:list, Database.get_records(params))
        {:error, changeset} -> # Something went wrong
          socket
          |> put_flash( :error, "锁定记录#{id}失败!")
      end


    {:noreply, socket }
  end
  def handle_event("unlock", %{"id" => id} = message ,
        %{assigns: %{params:  %Params{query: query, repo: repo } = params} } =socket ) do
    IO.puts "收到 unlock  事件！"
    IO.inspect message

    # 跟新时，必须去掉 预加载的 关系！！
    post = repo.get!( exclude(query, :preload ) , String.to_integer(id))


    changeset =
      post
      |> Post.changeset_lock(%{is_lock: 0})

    socket =
      case repo.update(changeset) do
        {:ok, struct}       -> # Updated with success
          socket
          |> put_flash( :info, "解锁记录#{id}成功!")
          |> assign_params(:total, Database.get_record_count(params) )
          |> assign_params(:list, Database.get_records(params))
        {:error, changeset} -> # Something went wrong
          socket
          |> put_flash( :error, "解锁记录#{id}失败!")
      end

    {:noreply, socket }
  end


  ###########################
  ######## 自定义行事件 bgn ########
  ###########################



end
