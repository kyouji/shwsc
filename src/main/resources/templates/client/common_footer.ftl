<div class="foot_back" style="min-width:1200px;">
  <div class="foot">
    <div class="foot1">
      <ul>
        <#if article_category_list??>
            <#list article_category_list as item>
                <li><a href="#">${item.title!''}</a></li>
            </#list>
        </#if>
      </ul>
    </div>
    <div class="foot2">友情链接</div>
    <div class="foot3">
      <ul>
        <#if site_link_list??>
    		<#list site_link_list as item>
    			<li><a href="${item.linkUri!''}" target="_blank">${item.title!''}</a></li>
    		</#list>
	    </#if>
      </ul>
    </div>
    <div class="foot4"><#if setting??>${setting.copyright!''}</#if></div>
  </div>
</div>