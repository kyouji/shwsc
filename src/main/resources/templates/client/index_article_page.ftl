<div class="goods">
  <ul>
    <#if index_recommend_article_page??>
        <#list index_recommend_article_page.content as item>
            <li>
              <div class="li_left">
                <a href="/item/${item.id?c}"><img src="${item.imgUrl!''}" /></a></div>
              <div class="li_right">
                <h1><a href="/item/${item.id?c}">${item.title!''}</a></h1>
                <div class="writer">
                  <label class="label1">作者：<span>${item.source!''}</span> </label>
                  <label class="label2">标签：<span>${item.tagList!''}</span></label>
                  <label class="label3"><#if item.createTime??>${item.createTime?string("yyyy-MM-dd")}</#if></label>
                </div>
                <div class="words">
                  <p><a href="/item/${item.id?c}">${item.brief!''}</a></p>
                </div>
                <div class="read_all"><a href="/item/${item.id?c}">阅读全文&nbsp;></a></div>
                <div class="comment">
                  <div class="com1"><a href="#"><img src="/client/images/comment1.png" /><span>${item.goodNumber!'0'}</span></a></div>
                  <div class="com2"><a href="#"><img src="/client/images/comment3.png" /><span>${item.collectNumber!'0'}</span></a></div>
                  <div class="com3"><a href="#"><img src="/client/images/comment2.png" /><span>${item.commentNumber!'0'}</span></a></div>
                  <#--
                  <div class="com4"><a href="#"><img src="/client/images/comment4.png" /><span>优惠卷领取</span></a></div>
                  -->
                  <div class="com5"><a href="${item.linkUrl!''}">直达链接</a></div>
                </div>
              </div>
            </li>
        </#list>
    </#if>
  </ul>
</div>
<div class="page"> 
    <#if index_recommend_article_page??>
        <#assign continueEnter=false>
        <#if index_recommend_article_page.number+1 == 1>
            <a href="javascript:;" class="last"></a> 
        <#else>
            <a href="${index_recommend_article_page.number-1}" class="last"></a>
        </#if>
        
        <#if index_recommend_article_page.totalPages gt 0>
            <#list 1..index_recommend_article_page.totalPages as page>
                <#if page <= 3 || (index_recommend_article_page.totalPages-page) < 3 || (index_recommend_article_page.number+1-page)?abs<3 >
                    <#if page == index_recommend_article_page.number+1>
                        <a class="one" href="javascript:;">${page}</a>
                    <#else>
                        <a href="/promotion/tuan?page=${page-1}<#if type??>&type=${type}</#if>">${page}</a>
                    </#if>
                    <#assign continueEnter=false>
                <#else>
                    <#if !continueEnter>
                        <a href="javascript:;" class="dian">...</a> 
                        <#assign continueEnter=true>
                    </#if>
                </#if>
            </#list>
        </#if>
        
        <#if index_recommend_article_page.number+1 == index_recommend_article_page.totalPages || index_recommend_article_page.totalPages==0>
            <a href="javascript:;" class="next"></a>
        <#else>
            <a href="/promotion/tuan?page=${index_recommend_article_page.number+1}" class="next"></a>
        </#if>
    </#if>
</div>

    