<div class="hot_cheap" >
      <div class="cheap_title"><a href="#" class="t_a1">热门商品</a><a href="#" class="t_a2">更多</a></div>
      
      <!-- 商品轮播 -->
      <div class="picScroll">
        <div class="bd"> <a href="javascript:void(0)" class="prev"></a> <a href="javascript:void(0)" class="next"></a>
          <div class="scrollWrap">
            <ul class="picList">
            	<#if goodsHot??>
            		<#list goodsHot as goods>
            			<li> <a href="#" ><img src="${goods.coverImageUri}"></a> </li>
            		</#list>
            	</#if>
              <#--li> <a href="#" ><img src="/client/images/cheap.png"></a> </li>
              <li> <a href="#" ><img src="/client/images/cheap.png"></a> </li>
              <li> <a href="#" ><img src="/client/images/cheap.png"></a> </li>
              <li> <a href="#" ><img src="/client/images/cheap.png"></a> </li>
              <li> <a href="#" ><img src="/client/images/bo.png"></a></li-->
            </ul>
          </div>
        </div>
      </div>
      <script type="text/javascript">
	jQuery(".picScroll").slide({ mainCell:".picList", effect:"left",vis:1, pnLoop:false, scroll:1, autoPage:true});
	</script> 
      
      <!-- 商品轮播结束 -->
      <div class="cheap_news">
        <ul>
        	<#if goodsSpecialPrice??>
        		<#list goodsSpecialPrice as goods>
        			 <li class="li_first">
			            <div class="yeleft"><img src="${goods.coverImageUri}" /></div>
			            <div class="yeright">
			              <h1>${goods.name!''}<br />
			                ------${goods.title!''}</h1>
			              <h6><a href="#">评论<span><#if goods.totalComments??>${goods.totlComments?c}<#else>0</#if></span ></a><a href="javascript:click(${goods.id});">赞<span id="c${goods.id}"><#if goods.praise??>${goods.praise?c}<#else>0</#if></span></a></h6>
			            	<script type="text/javascript">
			            		function click(id){
				            		var d = '#c'+id;
				            		$(d).text(12);
				            		
			            			$.ajax({
			            				type:"post",
								    	url:"/person/addPraise",
								    	data:{"id":id},
								    	dataType:"json",
								    	success:function(data){
								    		if(data.status == 0){
								    			$(d).text(data.data);
								    			
								    		}
								    	},
			            			});
			            		}
			            	</script>
			            </div>
			          </li>
        		</#list>
        	</#if>
          
          <#--li>
            <div class="yeleft"><img src="/client/images/cheap2.png" /></div>
            <div class="yeright">
              <h1>漂亮的不像手环<br />
                ------月霜手环评测</h1>
              <h6><a href="#">评论<span>1000</span></a><a href="#">赞<span>1000</span></a></h6>
            </div>
          </li>
          <li>
            <div class="yeleft"><img src="/client/images/cheap2.png" /></div>
            <div class="yeright">
              <h1>漂亮的不像手环<br />
                ------月霜手环评测</h1>
              <h6><a href="#">评论<span>1000</span></a><a href="#">赞<span>1000</span></a></h6>
            </div>
          </li-->
        </ul>
      </div>
    </div>
  </div>
</div>