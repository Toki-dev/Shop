{if isset($arr_product.hide) && $arr_product.hide != '2' && $arr_product.hide != '3'}
<!-- BEGIN Main Column -->
<div id="content" class="span9 sidebar-right">
	<!-- BEGIN Breadcrumbs -->
	<ul class="breadcrumb">
		<li>
			<a href="{$base_url}{$sess_single_par}">Home</a>
			<span class="divider">&gt;</span>
		</li>
		<li>
			<a href="{$base_url}category.php{$sess_single_par}">All Categories</a>
			<span class="divider">&gt;</span>
		</li>
		{if $arr_cat_topnav|@count > 0}
			{assign var="topnav_counter" value=1}
			{assign var="topnav_num" value=$arr_cat_topnav|@count}
			{foreach key=key item=item from=$arr_cat_topnav}
				{if $topnav_counter != $topnav_num}
					<li>
						<a href="{$item.url}">{$item.name}</a>
						<span class="divider">&gt;</span>
					</li>
				{else}
					<li>
						<a href="{$item.url}" class="active">{$item.name}</a><span class="divider">({$cat_prod_count})</span>
					</li>
					{assign var="current_cat_name" value=$item.name}
				{/if}
				{assign var="topnav_counter" value=$topnav_counter+1}
			{/foreach}
		{/if}
	</ul>

{if isset($display_adsense)}
	{if (isset($smarty.session.gproducts_ref) && $smarty.session.gproducts_ref == '1') || $arr_product.mc_past_due > 0}
	<div>
		<!-- adsense begin -->
		<script type="text/javascript"><!--
			google_ad_client = "pub-0559664827379296";
			/* 728x90, Product Middle, Mar, created 02/05/13 */
			google_ad_slot = "2980539278";
			google_ad_width = 728;
			google_ad_height = 90;
			{if isset($arr_adsense_channels[$arr_product.gcid_level1])}
				{assign var='google_ad_channel' value=$arr_adsense_channels[$arr_product.gcid_level1]}
			{else}
				{assign var='google_ad_channel' value=""}
			{/if}
			{if isset($arr_product.not_updated)}
				{if $google_ad_channel == ''}
					{assign var='google_ad_channel' value="7273926985"}
				{else}
					{assign var='google_ad_channel' value="`$google_ad_channel`,7273926985"}
				{/if}
			{/if}
			{if isset($smarty.session.nu12)}
				{if $google_ad_channel == ''}
					{assign var='google_ad_channel' value="7794771275"}
				{else}
					{assign var='google_ad_channel' value="`$google_ad_channel`,7794771275"}
				{/if}
			{/if}
			{if isset($smarty.session.nu24)}
				{if $google_ad_channel == ''}
					{assign var='google_ad_channel' value="7711569274"}
				{else}
					{assign var='google_ad_channel' value="`$google_ad_channel`,7711569274"}
				{/if}
			{/if}
			{if isset($smarty.get.gps) && $smarty.get.gps == '1'}
				{if $google_ad_channel == ''}
					{assign var='google_ad_channel' value="1678326087"}
				{else}
					{assign var='google_ad_channel' value="`$google_ad_channel`,1678326087"}
				{/if}
				{if $country_abbr == 'us'}
					{assign var='google_ad_channel' value="`$google_ad_channel`,0308737742"}
				{/if}
			{/if}
			{if isset($smarty.session.came_from) && $smarty.session.came_from == 'gps'}
				{if $google_ad_channel == ''}
					{assign var='google_ad_channel' value="3695975676"}
				{else}
					{assign var='google_ad_channel' value="`$google_ad_channel`,3695975676"}
				{/if}
				{if $country_abbr == 'us'}
					{assign var='google_ad_channel' value="`$google_ad_channel`,6649442074"}
				{/if}
				{if $arr_product.store_onhold == '1'}
					{assign var='google_ad_channel' value="`$google_ad_channel`,8530116878"}
				{/if}
			{/if}
			{if isset($smarty.get.bs) && $smarty.get.bs == '1'}
				{if $google_ad_channel == ''}
					{assign var='google_ad_channel' value="7207562238"}
				{else}
					{assign var='google_ad_channel' value="`$google_ad_channel`,7207562238"}
				{/if}
			{/if}
{if isset($arr_product.paying_type) && $arr_product.paying_type == 'paying'}
	{if $google_ad_channel == ''}
		{assign var='google_ad_channel' value="6003956078"}
	{else}
		{assign var='google_ad_channel' value="`$google_ad_channel`,6003956078"}
	{/if}
{/if}
{if isset($arr_product.paying_type) && $arr_product.paying_type == 'non_paying'}
	{if $google_ad_channel == ''}
		{assign var='google_ad_channel' value="7480689277"}
	{else}
		{assign var='google_ad_channel' value="`$google_ad_channel`,7480689277"}
	{/if}
{/if}
{if isset($arr_product.paying_type) && $arr_product.paying_type == 'unknown'}
	{if $google_ad_channel == ''}
		{assign var='google_ad_channel' value="8957422470"}
	{else}
		{assign var='google_ad_channel' value="`$google_ad_channel`,8957422470"}
	{/if}
{/if}
			{if $google_ad_channel != ''}
				google_ad_channel = "{$google_ad_channel}";
			{/if}
			//-->
		</script>
		<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
		</script>
		<!-- adsense end -->
		<br /><br />
	</div>
	{/if}
{/if}

	<!-- BEGIN Product Title -->
	<div id="product-title">
		<div id="product-title-actions">
			<span class="btn btn-inverse">{$currency_symbol}{$arr_product.price|number_format:2:".":","}{if $country_abbr == 'uk' && $arr_product.price != $arr_product.price_vat} ({$currency_symbol}{$arr_product.price_vat} with VAT){/if}</span>
			{if $arr_product.store_onhold == '1' || $arr_product.hide == '1'}
				<a href="#" class="btn btn-primary">On Hold</a>
			{else}
				<a href="/addtocart.php?pid={$arr_product.pid}{$sess_multi_par}" class="btn btn-primary">Add to Cart</a>
			{/if}
		</div>
		<h1><!-- google_ad_section_start -->{$arr_product.pname}<!-- google_ad_section_end --></h1>
	</div>
	<!-- END Product Title -->

	<div id="product-image-container" class="clearfix">
	{if isset($use_bigger_image)}
		<!-- BEGIN Product Images -->
		<div id="wBiggerImage">
			<a href="#image-zoom" id="product-image" data-toggle="modal" data-image="{$arr_product.pic_big}" data-width="{if $arr_product.pic_b_width > 1024}1024{else}{$arr_product.pic_b_width}{/if}" data-title="{$arr_product.pname_escaped}">
				{if $arr_product.pic_b_height > 500 || $arr_product.pic_b_width > 300}
				<span id="product-zoom"></span>
				{/if}
				<img src="{if $arr_product.pic != ''}{$arr_product.pic_normal}{else}{$static_url}img/no_photo.png{/if}" id="product-image-display" alt="{$arr_product.pname_escaped}" />
				{*<span class="icon-zoom"></span>*}
			</a>
	{else}
		<!-- BEGIN Product Images -->
		<a href="#image-zoom" id="product-image" data-toggle="modal" data-image="{$arr_product.pic_big}" data-width="{if $arr_product.pic_b_width > 1024}1024{else}{$arr_product.pic_b_width}{/if}" data-title="{$arr_product.pname_escaped}">
			{if $arr_product.pic_b_height > 500 || $arr_product.pic_b_width > 300}
			<span id="product-zoom"></span>
			{/if}
			<img src="{if $arr_product.pic != ''}{$arr_product.pic_normal}{else}{$static_url}img/no_photo.png{/if}" id="product-image-display" alt="{$arr_product.pname_escaped}" />
			{*<span class="icon-zoom"></span>*}
		</a>

		{if $arr_product.pic_total > 1}
		<div id="product-thumbs">
			{if $arr_product.pic_total > 4}
			<a href="#" id="product-thumbs-up"><span>Up</span></a>
			{/if}
			<ul>
				<li><a href="#" data-image="{$arr_product.pic_normal}" data-zoom="{$arr_product.pic_big}" data-width="{if $arr_product.pic_b_width > 1024}1024{else}{$arr_product.pic_b_width}{/if}" data-title="{$arr_product.pname_escaped}"><img src="{$arr_product.pic_small}" width="81" height="81" alt="{$arr_product.pname_escaped}" /></a></li>
				{foreach key=key item=item from=$arr_prpics}
				<li><a href="#" data-image="{$item.pic_n}" data-zoom="{$item.pic_b}" data-width="{if $item.pic_b_width > 1024}1024{else}{$item.pic_b_width}{/if}" data-title="{$arr_product.pname_escaped}"><img src="{$item.pic_s}" width="81" height="81" alt="{$arr_product.pname_escaped}" /></a></li>
				{/foreach}
				{*
				<li><a href="#" data-image="{$static_url}/img/product-large.png" data-zoom="{$static_url}/img/product-large.png" data-title="Canon EOS 600D Kit"><img src="{$static_url}/img/product-thumb-1.png" width="81" height="81" /></a></li>
				<li><a href="#" data-image="{$static_url}/img/product-large.png" data-zoom="{$static_url}/img/product-large.png" data-title="Canon EOS 600D Kit 2"><img src="{$static_url}/img/product-thumb-2.png" width="81" height="81" /></a></li>
				<li><a href="#" data-image="{$static_url}/img/product-large.png" data-zoom="{$static_url}/img/product-large.png" data-title="Canon EOS 600D Kit 3"><img src="{$static_url}/img/product-thumb-3.png" width="81" height="81" /></a></li>
				<li><a href="#" data-image="{$static_url}/img/product-large.png" data-zoom="{$static_url}/img/product-large.png" data-title="Canon EOS 600D Kit 4"><img src="{$static_url}/img/product-thumb-4.png" width="81" height="81" /></a></li>
				<li><a href="#" data-image="{$static_url}/img/product-large.png" data-zoom="{$static_url}/img/product-large.png" data-title="Canon EOS 600D Kit 5"><img src="{$static_url}/img/product-thumb-1.png" width="81" height="81" /></a></li>
				<li><a href="#" data-image="{$static_url}/img/product-large.png" data-zoom="{$static_url}/img/product-large.png" data-title="Canon EOS 600D Kit 6"><img src="{$static_url}/img/product-thumb-2.png" width="81" height="81" /></a></li>
				<li><a href="#" data-image="{$static_url}/img/product-large.png" data-zoom="{$static_url}/img/product-large.png" data-title="Canon EOS 600D Kit 7"><img src="{$static_url}/img/product-thumb-3.png" width="81" height="81" /></a></li>
				<li><a href="#" data-image="{$static_url}/img/product-large.png" data-zoom="{$static_url}/img/product-large.png" data-title="Canon EOS 600D Kit 8"><img src="{$static_url}/img/product-thumb-4.png" width="81" height="81" /></a></li>
				*}
			</ul>
			{if $arr_product.pic_total > 4}
			<a href="#" id="product-thumbs-down"><span>Down</span></a>
			{/if}
		</div>
		{/if}
		<!-- END Product Images -->
	{/if}

		<!-- BEGIN Product Details -->
		<div id="product-details">
			<p id="product-quantity">{if $arr_product.qty === '0' || $arr_product.qty < 0}0 available{elseif $arr_product.qty == 1}Only 1 available{elseif $arr_product.qty > 1 && $arr_product.qty <= 10}{$arr_product.qty} available{else}More than 10 available{/if}</p>

			<h4>Details</h4>

			<p>{$smarty.const.PRODUCT_TEXT29}
		{if $arr_product.usps_use == '1'}
			{$smarty.const.PRODUCT_TEXT30} - <a href="#shipping-rates" data-toggle="modal-ajax" data-url="/check-shipping.php?pid={$arr_product.pid}{$sess_multi_par}&version=new">check</a>
		{else}
			{assign var='domestic_sz_count' value=$arr_domestic_sz|@count}
			{assign var='sz_counter' value=0}
			{foreach key=key item=item from=$arr_domestic_sz}
				{assign var='sz_counter' value=$sz_counter+1}
				{if $sz_counter == 1}
					{if $item.shipping_rate == 0}
						{$item.zone_name}: <b>free</b>
					{else}
						{$item.zone_name}: {$currency_symbol}{$item.shipping_rate}
					{/if}
				{/if}
			{/foreach}
			{if domestic_sz_count == 1}
			{else}
				<a href="#shipping-rates" data-toggle="modal-ajax" data-url="/check-shipping.php?pid={$arr_product.pid}{$sess_multi_par}&version=new">(more destinations)</a>
			{/if}
		{/if}
			</p>
			
		{if $arr_product.taxable == '1'}
			{assign var='state_tax_count' value=$arr_state_tax|@count}
			{if $state_tax_count > 0}
				<p>{$smarty.const.PRODUCT_TEXT12}
				{assign var='st_counter' value=1}
				{foreach key=key item=item from=$arr_state_tax}
					{if $st_counter == $state_tax_count}
						{$item.state_name}: {$item.state_tax}%
					{else}
						{$item.state_name}: {$item.state_tax}%, 
					{/if}
					{assign var='st_counter' value=$st_counter+1}
				{/foreach}
				</p>
			{/if}
		{/if}
			<p>Condition: {if $arr_product.used == '1'}{$smarty.const.PRODUCT_TEXT16}{else}{$smarty.const.PRODUCT_TEXT15}{/if}</p>

			{if isset($arr_product.not_updated)}
			<p id="product-disclaimer">{$smarty.const.PRODUCT_TEXT42}</p>
			{/if}
		</div>
		<!-- END Product Details -->

	{if isset($use_bigger_image)}
		{if $arr_product.pic_total > 1}
		<div id="product-thumbs">
			{if $arr_product.pic_total > 4}
			<a href="#" id="product-thumbs-up"><span>Up</span></a>
			{/if}
			<ul class="scrolling-thumbnails">
				<li><a href="#" data-image="{$arr_product.pic_normal}" data-zoom="{$arr_product.pic_big}" data-width="{if $arr_product.pic_b_width > 1024}1024{else}{$arr_product.pic_b_width}{/if}" data-title="{$arr_product.pname_escaped}"><img src="{$arr_product.pic_small}" width="81" height="81" alt="{$arr_product.pname_escaped}" /></a></li>
				{foreach key=key item=item from=$arr_prpics}
				<li><a href="#" data-image="{$item.pic_n}" data-zoom="{$item.pic_b}" data-width="{if $item.pic_b_width > 1024}1024{else}{$item.pic_b_width}{/if}" data-title="{$arr_product.pname_escaped}"><img src="{$item.pic_s}" width="81" height="81" alt="{$arr_product.pname_escaped}" /></a></li>
				{/foreach}
				{*
				<li><a href="#" data-image="{$static_url}/img/product-large.png" data-zoom="{$static_url}/img/product-large.png" data-title="Canon EOS 600D Kit"><img src="{$static_url}/img/product-thumb-1.png" width="81" height="81" /></a></li>
				<li><a href="#" data-image="{$static_url}/img/product-large.png" data-zoom="{$static_url}/img/product-large.png" data-title="Canon EOS 600D Kit 2"><img src="{$static_url}/img/product-thumb-2.png" width="81" height="81" /></a></li>
				<li><a href="#" data-image="{$static_url}/img/product-large.png" data-zoom="{$static_url}/img/product-large.png" data-title="Canon EOS 600D Kit 3"><img src="{$static_url}/img/product-thumb-3.png" width="81" height="81" /></a></li>
				<li><a href="#" data-image="{$static_url}/img/product-large.png" data-zoom="{$static_url}/img/product-large.png" data-title="Canon EOS 600D Kit 4"><img src="{$static_url}/img/product-thumb-4.png" width="81" height="81" /></a></li>
				<li><a href="#" data-image="{$static_url}/img/product-large.png" data-zoom="{$static_url}/img/product-large.png" data-title="Canon EOS 600D Kit 5"><img src="{$static_url}/img/product-thumb-1.png" width="81" height="81" /></a></li>
				<li><a href="#" data-image="{$static_url}/img/product-large.png" data-zoom="{$static_url}/img/product-large.png" data-title="Canon EOS 600D Kit 6"><img src="{$static_url}/img/product-thumb-2.png" width="81" height="81" /></a></li>
				<li><a href="#" data-image="{$static_url}/img/product-large.png" data-zoom="{$static_url}/img/product-large.png" data-title="Canon EOS 600D Kit 7"><img src="{$static_url}/img/product-thumb-3.png" width="81" height="81" /></a></li>
				<li><a href="#" data-image="{$static_url}/img/product-large.png" data-zoom="{$static_url}/img/product-large.png" data-title="Canon EOS 600D Kit 8"><img src="{$static_url}/img/product-thumb-4.png" width="81" height="81" /></a></li>
				*}
			</ul>
			{if $arr_product.pic_total > 4}
			<a href="#" id="product-thumbs-down"><span>Down</span></a>
			{/if}
		</div>
		{/if}
	</div>
	{/if}
	</div>
{*
<div id="page-footer-ad">
	<img src="{$static_url}/img/default-ad.png" width="728" height="90" alt="Ad Placeholder" />
</div>
*}
	<!-- BEGIN Social Buttons -->
	<div id="product-social-buttons">
		<div style="float:right;width:75px!important">
			{*
			{if isset($arr_fb_page)}
				<div class="fb-like" data-href="{if $arr_fb_page.link != ''}{$arr_fb_page.link}{else}http://www.facebook.com/{$arr_fb_page.id}{/if}" data-send="false" data-layout="button_count" data-show-faces="false"></div>
			{else}
				<div class="fb-like" data-href="{if $seo_urls == '1'}{$base_url}{$seo_abbr_product}/{$smarty.get.pid}/{$arr_product.title_url}{else}{$base_url}product.php?pid={$smarty.get.pid}{/if}" data-send="false" data-layout="button_count" data-show-faces="false"></div>
			{/if}
			*}
			<div class="fb-like" data-href="{if $seo_urls == '1'}{$base_url}{$seo_abbr_product}/{$smarty.get.pid}/{$arr_product.title_url}{else}{$base_url}product.php?pid={$smarty.get.pid}{/if}" data-send="false" data-layout="button_count" data-show-faces="false"></div>
			{*<div class="fb-share-button" data-href="{if $seo_urls == '1'}{$base_url}{$seo_abbr_product}/{$smarty.get.pid}/{$arr_product.title_url}{else}{$base_url}product.php?pid={$smarty.get.pid}{/if}" data-type="button_count"></div>*}
			{*<div class="fb-like" data-href="http://www.facebook.com/Ecrater" data-send="false" data-layout="button_count" data-show-faces="false"></div>*}
		</div>

		<div style="float:right;margin-right:10px">
			<a href="{$arr_product.pinterest_url}" data-pin-do="buttonPin" data-pin-config="none"><img src="//assets.pinterest.com/images/pidgets/pin_it_button.png" /></a>
			{*{literal}
			<script type="text/javascript">
			(function(d){
			var f = d.getElementsByTagName('SCRIPT')[0], p = d.createElement('SCRIPT');
			p.type = 'text/javascript';
			p.async = true;
			p.src = '//assets.pinterest.com/js/pinit.js';
			f.parentNode.insertBefore(p, f);
			}(document));
			</script>
			{/literal}*}
		</div>

		<div style="float:right;margin-top:-2px;margin-right:-30px">
			<g:plusone count="false"></g:plusone>
			{literal}
			<script type="text/javascript">
			(function() {
				var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
				po.src = 'http://apis.google.com/js/plusone.js';
				var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
			})();
			</script>
			{/literal}
		</div>

		<div style="float:right;margin-right:-10px">
			<a href="https://twitter.com/share" class="twitter-share-button" data-count="none">Tweet</a>
			{literal}
			<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
			{/literal}
		</div>
	</div>
	<!-- END Social Buttons -->

	<!-- BEGIN Product Expanded Details -->
	<ul id="expandedDetails" class="nav nav-tabs">
		<li class="active"><a href="#description" data-toggle="tab">Description<i class="icon-active"></i></a></li>
		{*
		<li><a href="#feedback" data-toggle="tab">Feedback</a></li>
		<li><a href="#reviews" data-toggle="tab">Reviews</a></li>
		*}
	</ul>

	<div id="expandedDetailsContent" class="tab-content">
		<div class="tab-pane active" id="description" style="overflow: hidden; line-height: 1.6em;">
			<!-- google_ad_section_start -->{$arr_product.desc}<!-- google_ad_section_end -->{*<a href="#">[Full Description]</a>*}
		</div>
		<span id="show_more" style="display: none;" onclick="showMore('description',this)"><a href="#" onClick="return false;">... [Full Description]</a></span>
		{*
		<div class="tab-pane" id="feedback">
			<p>test</p>
		</div>
		<div class="tab-pane" id="reviews">
			<p>test2</p>
		</div>
		*}
	</div>
	<!-- END Product Expanded Details -->

	{if $arr_prandom|@count >= 5 || $arr_prelated|@count >= 5}
	<!-- BEGIN Related Products -->
	<div id="page-header" class="clearfix">
		{*
		<div id="page-header-ad">
			<img src="{$static_url}/img/default-ad.png" width="728" height="90" alt="Ad Placeholder" />
		</div>
		*}

		{*
		<div id="page-header-controls" class="pull-right" style="width:auto">
			<div class="btn-group view" data-toggle="buttons-radio">
				<button class="btn active" data-toggle="tooltip" title="Grid View"><i class="icon-th-xlarge"></i></button>
				<button class="btn" data-toggle="tooltip" title="List View"><i class="icon-list-xlarge"></i></button>
			</div>
		</div>
		*}
		
		<div id="page-header-title" class="pull-left">
			{if $arr_prandom|@count >= 5}
			<h1 style="padding-bottom:24px">{$smarty.const.PRODUCT_TEXT33}<span class="important">{$arr_product.store_name}</span> <a href="/filter.php?store_id={$arr_product.sid}&sort=date{$sess_multi_par}" class="view-all-link">(View All)</a></h1>
			{else}
			<h1 style="padding-bottom:24px">{$smarty.const.PRODUCT_TEXT41}</h1>
			{/if}
		</div>
	</div>

	<div id="page-content">
		<ul id="product-list-grid" class="clearfix">
			{if $arr_prandom|@count >= 5}
				{assign var="product_counter" value=1}
				{foreach key=key item=item from=$arr_prandom}
					<li class="product-item{if $product_counter % 5 == 0} last{/if}">
						<div>
							<span class="btn btn-inverse">{$currency_symbol}{$item.price}</span>
						</div>
						<a href="{if $seo_urls == '1'}/{$seo_abbr_product}/{$key}/{$item.title_url}{$sess_single_par}{else}/product.php?pid={$key}{$sess_multi_par}{/if}" class="product-image"><img src="{if $item.pic == ''}{$static_url}img/no_product_135x135.png{else}{$item.pic}{/if}" width="135" height="135" alt="{$item.name_escaped}" title="{$item.name_escaped}" /></a>
						<div class="product-details">
							<h2><a href="{if $seo_urls == '1'}/{$seo_abbr_product}/{$key}/{$item.title_url}{$sess_single_par}{else}/product.php?pid={$key}{$sess_multi_par}{/if}" title="{$item.name_escaped}">{$item.name_escaped}</a></h2>
							<a href="http://{$item.store_name}.{$domain}" class="product-category" target="_blank"{if isset($item.star_icon)} title="Feedback: {$item.feedback_score}, {$item.numof_sales} sales"{/if}>{$item.store_name}</a>
						</div>
					</li>
				{assign var="product_counter" value=$product_counter+1}
				{/foreach}
			{elseif $arr_prelated|@count >= 5}
				{assign var="product_counter" value=1}
				{foreach key=key item=item from=$arr_prelated}
					<li class="product-item{if $product_counter % 5 == 0} last{/if}">
						<div>
							<span class="btn btn-inverse">{$currency_symbol}{$item.price}</span>
						</div>
						<a href="{if $seo_urls == '1'}/{$seo_abbr_product}/{$key}/{$item.title_url}{if isset($keyword_value)}?keywords={$keyword_value}{$sess_multi_par}{else}{$sess_single_par}{/if}{else}/product.php?pid={$key}{if isset($keyword_value)}&keywords={$keyword_value}{/if}{$sess_multi_par}{/if}" class="product-image"><img src="{if $item.pic == ''}{$static_url}img/no_product_135x135.png{else}{$item.pic}{/if}" width="135" height="135"  alt="{$item.name_escaped}" title="{$item.name_escaped}" /></a>
						<div class="product-details">
							<h2><a href="{if $seo_urls == '1'}/{$seo_abbr_product}/{$key}/{$item.title_url}{if isset($keyword_value)}?keywords={$keyword_value}{$sess_multi_par}{else}{$sess_single_par}{/if}{else}/product.php?pid={$key}{if isset($keyword_value)}&keywords={$keyword_value}{/if}{$sess_multi_par}{/if}" title="{$item.name_escaped}">{$item.name_escaped}</a></h2>
							<a href="http://{$item.store_name}.{$domain}" class="product-category" target="_blank"{if isset($item.star_icon)} title="Feedback: {$item.feedback_score}, {$item.numof_sales} sales"{/if}>{$item.store_name}</a>
						</div>
					</li>
				{assign var="product_counter" value=$product_counter+1}
				{/foreach}
			{/if}

			{*
			<li class="product-item">
				<div>
					<span class="btn btn-inverse">$960.00 USD</span>
				</div>
				<a href="#" class="product-image"><img src="./img/no_product_135x135.png" width="135" height="135" alt="Product Image" /></a>
				<div class="product-details">
					<h2><a href="#">Canon D600</a></h2>
					<a href="#" class="product-category">Photostore</a>
				</div>
			</li>
			<li class="product-item">
				<div>
					<span class="btn btn-inverse">$960.00 USD</span>
				</div>
				<a href="#" class="product-image"><img src="./img/product_135x135.png" width="135" height="135" alt="Product Image" /></a>
				<div class="product-details">
					<h2><a href="#">Canon D600</a></h2>
					<a href="#" class="product-category">Photostore</a>
				</div>
			</li>
			*}
		</ul>
	</div>
	{/if}

	<div id="page-footer">
		{*
		<div id="page-footer-ad">
			<img src="{$static_url}/img/default-ad.png" width="728" height="90" alt="Ad Placeholder" />
		</div>
		*}

		{if isset($display_adsense)}
		<div id="page-footer-ad">
			<!-- adsense begin -->
			{if $arr_prandom|@count >= 5}
				<script type="text/javascript"><!--
					google_ad_client = "pub-0559664827379296";
					/* 728x90, Product Bottom, Mar, created 02/05/13 */
					google_ad_slot = "4505980404";
					google_ad_width = 728;
					google_ad_height = 90;
					{if isset($arr_adsense_channels[$arr_product.gcid_level1])}
						{assign var='google_ad_channel' value=$arr_adsense_channels[$arr_product.gcid_level1]}
					{else}
						{assign var='google_ad_channel' value=""}
					{/if}
					{if isset($api_afc_code) && $api_afc_code != ''}
						{if $google_ad_channel == ''}
							{assign var='google_ad_channel' value="4997931194"}
						{else}
							{assign var='google_ad_channel' value="`$google_ad_channel`,4997931194"}
						{/if}
					{/if}
					{if isset($arr_product.not_updated)}
						{if $google_ad_channel == ''}
							{assign var='google_ad_channel' value="7273926985"}
						{else}
							{assign var='google_ad_channel' value="`$google_ad_channel`,7273926985"}
						{/if}
					{/if}
					{if isset($smarty.session.nu12)}
						{if $google_ad_channel == ''}
							{assign var='google_ad_channel' value="7794771275"}
						{else}
							{assign var='google_ad_channel' value="`$google_ad_channel`,7794771275"}
						{/if}
					{/if}
					{if isset($smarty.session.nu24)}
						{if $google_ad_channel == ''}
							{assign var='google_ad_channel' value="7711569274"}
						{else}
							{assign var='google_ad_channel' value="`$google_ad_channel`,7711569274"}
						{/if}
					{/if}
					{if isset($smarty.get.gps) && $smarty.get.gps == '1'}
						{if $google_ad_channel == ''}
							{assign var='google_ad_channel' value="1678326087"}
						{else}
							{assign var='google_ad_channel' value="`$google_ad_channel`,1678326087"}
						{/if}
						{if $country_abbr == 'us'}
							{assign var='google_ad_channel' value="`$google_ad_channel`,0308737742"}
						{/if}
					{/if}
					{if isset($smarty.session.came_from) && $smarty.session.came_from == 'gps'}
						{if $google_ad_channel == ''}
							{assign var='google_ad_channel' value="3695975676"}
						{else}
							{assign var='google_ad_channel' value="`$google_ad_channel`,3695975676"}
						{/if}
						{if $country_abbr == 'us'}
							{assign var='google_ad_channel' value="`$google_ad_channel`,6649442074"}
						{/if}
						{if $arr_product.store_onhold == '1'}
							{assign var='google_ad_channel' value="`$google_ad_channel`,8530116878"}
						{/if}
					{/if}
					{if isset($smarty.get.bs) && $smarty.get.bs == '1'}
						{if $google_ad_channel == ''}
							{assign var='google_ad_channel' value="7207562238"}
						{else}
							{assign var='google_ad_channel' value="`$google_ad_channel`,7207562238"}
						{/if}
					{/if}
{if isset($arr_product.paying_type) && $arr_product.paying_type == 'paying'}
	{if $google_ad_channel == ''}
		{assign var='google_ad_channel' value="6003956078"}
	{else}
		{assign var='google_ad_channel' value="`$google_ad_channel`,6003956078"}
	{/if}
{/if}
{if isset($arr_product.paying_type) && $arr_product.paying_type == 'non_paying'}
	{if $google_ad_channel == ''}
		{assign var='google_ad_channel' value="7480689277"}
	{else}
		{assign var='google_ad_channel' value="`$google_ad_channel`,7480689277"}
	{/if}
{/if}
{if isset($arr_product.paying_type) && $arr_product.paying_type == 'unknown'}
	{if $google_ad_channel == ''}
		{assign var='google_ad_channel' value="8957422470"}
	{else}
		{assign var='google_ad_channel' value="`$google_ad_channel`,8957422470"}
	{/if}
{/if}
					{if $google_ad_channel != ''}
						google_ad_channel = "{$google_ad_channel}";
					{/if}
				//-->
				</script>
				<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
				</script>
			{elseif $arr_prelated|@count >= 5}
				<script type="text/javascript"><!--
					google_ad_client = "pub-0559664827379296";
					/* 728x90, Product Bottom, Mar, created 02/05/13 */
					google_ad_slot = "4505980404";
					google_ad_width = 728;
					google_ad_height = 90;
					{if isset($arr_adsense_channels[$arr_product.gcid_level1])}
						{assign var='google_ad_channel' value=$arr_adsense_channels[$arr_product.gcid_level1]}
					{else}
						{assign var='google_ad_channel' value=""}
					{/if}
					{if isset($api_afc_code) && $api_afc_code != ''}
						{if $google_ad_channel == ''}
							{assign var='google_ad_channel' value="4997931194"}
						{else}
							{assign var='google_ad_channel' value="`$google_ad_channel`,4997931194"}
						{/if}
					{/if}
					{if isset($arr_product.not_updated)}
						{if $google_ad_channel == ''}
							{assign var='google_ad_channel' value="7273926985"}
						{else}
							{assign var='google_ad_channel' value="`$google_ad_channel`,7273926985"}
						{/if}
					{/if}
					{if isset($smarty.session.nu12)}
						{if $google_ad_channel == ''}
							{assign var='google_ad_channel' value="7794771275"}
						{else}
							{assign var='google_ad_channel' value="`$google_ad_channel`,7794771275"}
						{/if}
					{/if}
					{if isset($smarty.session.nu24)}
						{if $google_ad_channel == ''}
							{assign var='google_ad_channel' value="7711569274"}
						{else}
							{assign var='google_ad_channel' value="`$google_ad_channel`,7711569274"}
						{/if}
					{/if}
					{if isset($smarty.get.gps) && $smarty.get.gps == '1'}
						{if $google_ad_channel == ''}
							{assign var='google_ad_channel' value="1678326087"}
						{else}
							{assign var='google_ad_channel' value="`$google_ad_channel`,1678326087"}
						{/if}
						{if $country_abbr == 'us'}
							{assign var='google_ad_channel' value="`$google_ad_channel`,0308737742"}
						{/if}
					{/if}
					{if isset($smarty.session.came_from) && $smarty.session.came_from == 'gps'}
						{if $google_ad_channel == ''}
							{assign var='google_ad_channel' value="3695975676"}
						{else}
							{assign var='google_ad_channel' value="`$google_ad_channel`,3695975676"}
						{/if}
						{if $country_abbr == 'us'}
							{assign var='google_ad_channel' value="`$google_ad_channel`,6649442074"}
						{/if}
						{if $arr_product.store_onhold == '1'}
							{assign var='google_ad_channel' value="`$google_ad_channel`,8530116878"}
						{/if}
					{/if}
					{if isset($smarty.get.bs) && $smarty.get.bs == '1'}
						{if $google_ad_channel == ''}
							{assign var='google_ad_channel' value="7207562238"}
						{else}
							{assign var='google_ad_channel' value="`$google_ad_channel`,7207562238"}
						{/if}
					{/if}
{if isset($arr_product.paying_type) && $arr_product.paying_type == 'paying'}
	{if $google_ad_channel == ''}
		{assign var='google_ad_channel' value="6003956078"}
	{else}
		{assign var='google_ad_channel' value="`$google_ad_channel`,6003956078"}
	{/if}
{/if}
{if isset($arr_product.paying_type) && $arr_product.paying_type == 'non_paying'}
	{if $google_ad_channel == ''}
		{assign var='google_ad_channel' value="7480689277"}
	{else}
		{assign var='google_ad_channel' value="`$google_ad_channel`,7480689277"}
	{/if}
{/if}
{if isset($arr_product.paying_type) && $arr_product.paying_type == 'unknown'}
	{if $google_ad_channel == ''}
		{assign var='google_ad_channel' value="8957422470"}
	{else}
		{assign var='google_ad_channel' value="`$google_ad_channel`,8957422470"}
	{/if}
{/if}
					{if $google_ad_channel != ''}
						google_ad_channel = "{$google_ad_channel}";
					{/if}
					//-->
				</script>
				<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
				</script>
			{else}
				<script type="text/javascript"><!--
					google_ad_client = "pub-0559664827379296";
					/* 728x90, Product Bottom, Mar, created 02/05/13 */
					google_ad_slot = "4505980404";
					google_ad_width = 728;
					google_ad_height = 90;
					{if isset($arr_adsense_channels[$arr_product.gcid_level1])}
						{assign var='google_ad_channel' value=$arr_adsense_channels[$arr_product.gcid_level1]}
					{else}
						{assign var='google_ad_channel' value=""}
					{/if}
					{if isset($api_afc_code) && $api_afc_code != ''}
						{if $google_ad_channel == ''}
							{assign var='google_ad_channel' value="4997931194"}
						{else}
							{assign var='google_ad_channel' value="`$google_ad_channel`,4997931194"}
						{/if}
					{/if}
					{if isset($arr_product.not_updated)}
						{if $google_ad_channel == ''}
							{assign var='google_ad_channel' value="7273926985"}
						{else}
							{assign var='google_ad_channel' value="`$google_ad_channel`,7273926985"}
						{/if}
					{/if}
					{if isset($smarty.session.nu12)}
						{if $google_ad_channel == ''}
							{assign var='google_ad_channel' value="7794771275"}
						{else}
							{assign var='google_ad_channel' value="`$google_ad_channel`,7794771275"}
						{/if}
					{/if}
					{if isset($smarty.session.nu24)}
						{if $google_ad_channel == ''}
							{assign var='google_ad_channel' value="7711569274"}
						{else}
							{assign var='google_ad_channel' value="`$google_ad_channel`,7711569274"}
						{/if}
					{/if}
					{if isset($smarty.get.gps) && $smarty.get.gps == '1'}
						{if $google_ad_channel == ''}
							{assign var='google_ad_channel' value="1678326087"}
						{else}
							{assign var='google_ad_channel' value="`$google_ad_channel`,1678326087"}
						{/if}
						{if $country_abbr == 'us'}
							{assign var='google_ad_channel' value="`$google_ad_channel`,0308737742"}
						{/if}
					{/if}
					{if isset($smarty.session.came_from) && $smarty.session.came_from == 'gps'}
						{if $google_ad_channel == ''}
							{assign var='google_ad_channel' value="3695975676"}
						{else}
							{assign var='google_ad_channel' value="`$google_ad_channel`,3695975676"}
						{/if}
						{if $country_abbr == 'us'}
							{assign var='google_ad_channel' value="`$google_ad_channel`,6649442074"}
						{/if}
						{if $arr_product.store_onhold == '1'}
							{assign var='google_ad_channel' value="`$google_ad_channel`,8530116878"}
						{/if}
					{/if}
					{if isset($smarty.get.bs) && $smarty.get.bs == '1'}
						{if $google_ad_channel == ''}
							{assign var='google_ad_channel' value="7207562238"}
						{else}
							{assign var='google_ad_channel' value="`$google_ad_channel`,7207562238"}
						{/if}
					{/if}
{if isset($arr_product.paying_type) && $arr_product.paying_type == 'paying'}
	{if $google_ad_channel == ''}
		{assign var='google_ad_channel' value="6003956078"}
	{else}
		{assign var='google_ad_channel' value="`$google_ad_channel`,6003956078"}
	{/if}
{/if}
{if isset($arr_product.paying_type) && $arr_product.paying_type == 'non_paying'}
	{if $google_ad_channel == ''}
		{assign var='google_ad_channel' value="7480689277"}
	{else}
		{assign var='google_ad_channel' value="`$google_ad_channel`,7480689277"}
	{/if}
{/if}
{if isset($arr_product.paying_type) && $arr_product.paying_type == 'unknown'}
	{if $google_ad_channel == ''}
		{assign var='google_ad_channel' value="8957422470"}
	{else}
		{assign var='google_ad_channel' value="`$google_ad_channel`,8957422470"}
	{/if}
{/if}
					{if $google_ad_channel != ''}
						google_ad_channel = "{$google_ad_channel}";
					{/if}
					//-->
				</script>
				<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
				</script>
			{/if}
			<!-- adsense end -->
		</div>
		{/if}

		{*
		<ul class="pagination-controls nav">
			<li><a href="#" data-toggle="tooltip" title="Previous Page"><i class="icon-pagination-prev"></i></a></li>
			<li><a href="#" data-toggle="tooltip" title="Next Page"><i class="icon-pagination-next"></i></a></li>
		</ul>

		<div class="pagination">
			<ul>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li class="active"><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">6</a></li>
				<li><a href="#">7</a></li>
				<li><a href="#">8</a></li>
				<li><a href="#">9</a></li>
				<li class="disabled"><a href="#">...</a></li>
				<li><a href="#">650</a></li>
			</ul>
		</div>
		*}
	</div>
	<!-- END Related Products -->
{*
	<!-- BEGIN Contact Seller -->
	<div id="contact-seller" class="modal hide">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><i class="icon-modal-close"></i></button>
			<h3>Ask Seller a Question</h3>
		</div>

		<form class="form-horizontal" style="margin-bottom:0">
		<div class="modal-body">
			<p>If you have any <span class="important">questions</span> this is the place you can ask the seller. Enter your name, email, and your message/question in the form below:</p>

			<div class="control-group" style="margin-top:20px">
				<label for="name">Name</label>
				<div class="controls">
					<input type="text" name="name" id="name" placeholder="example" />
				</div>
			</div>
			<div class="control-group">
				<label for="email">Email</label>
				<div class="controls">
					<input type="text" name="email" id="email" placeholder="example@gmail.com" />
				</div>
			</div>
			<div class="control-group">
				<label for="message">Message</label>
				<div class="controls">
					<textarea name="message" id="message" style="width:490px;height:200px" placeholder="Write your message here..."></textarea>
				</div>
			</div>
			<div class="control-group">
				<label for="captcha">Captcha Information</label>
				<div class="controls">
					<input type="text" name="captcha" height="captcha" placeholder="example" style="width:150px" />
					<span class="alert alert-inverse">7 A 2 Z</span>
				</div>
			</div>

			<button class="btn btn-light-orange">Send Message</button>
		</div>
		</form>
	</div>
	<!-- END Contact Seller -->

	<!-- BEGIN Check Shipping Rates -->
	<div id="shipping-rates" class="modal hide">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><i class="icon-modal-close"></i></button>
			<h3>Check the Shipping Rates</h3>
		</div>

		<form class="form-horizontal" style="margin-bottom:0" method="post" action="/check-shipping.php?pid={$smarty.get.pid}&version=new">
		<div class="modal-body">
			<div id="shipping-form">
				<p>Where do you want to <span class="important">ship</span> to?</p>

				<div class="control-group" style="margin-top: 20px">
					<label for="country">Country</label>
					<div class="controls">
						<select name="country" id="country">
							<option>United States</option>
						</select>
					</div>
				</div>

				<div class="control-group">
					<label for="zip">ZIP Code</label>
					<div class="controls">
						<input type="text" name="zip" id="zip" placeholder="example" />
					</div>
				</div>

				<p><span class="light small">* This merchant does not ship to countries others than the listed above.</span></p>

				<button id="shipping-check" class="btn btn-light-orange">Check</button>
			</div>
			<div id="shipping-results" style="display:none">
				<p>The merchant offers the following shipping options to <span class="important">12312</span>.</p>
				|{$smart.post.country}|
				<div class="well">
					USPS Priority Mail (1-3 days): <span class="important">$5.90</span><br />
					USPS Priority Mail Small Flat-Rate Box (1-3 days): <span class="important">$5.35</span><br />
					USPS Priority Mail Medium Flat-Rate Box (1-3 days): <span class="important">$11.35</span><br />
					USPS Priority Mail Large Flat-Rate Box (1-3 days): <span class="important">$15.45</span><br />
					USPS Parcel Post (2-9 days): <span class="important">$5.60</span>
				</div>

				<button id="shipping-recheck" class="btn btn-light-orange">Check the shipping rates to another destination</button>
			</div>
		</div>
		</form>
	</div>
	<!-- END Check Shipping Rates -->
*}
	<!-- Product Image Modal -->
	<div id="image-zoom" class="modal hide fade">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h3>Title of Image</h3>
		</div>
		<div class="modal-body" style="text-align:center;">
			<div class="progress progress-info progress-striped active" style="margin:0">
				<div class="bar" style="width:100%"></div>
			</div>
			{if $arr_product.pic_total > 1}
			<div class="modal-navigation">
				<div class="modal-navigation-inner">
					<a class="next" href="#"><span><i class="icon-chevron-right"></i></span></a>
					<a class="prev" href="#"><span><i class="icon-chevron-left"></i></span></a>
				</div>
			</div>
			{/if}
		</div>
	</div>
</div>
		
<!-- BEGIN Sidebar -->
<div id="sidebar" class="span3">
			
	<!-- BEGIN Seller Information -->
	<div id="seller-information" class="well">
		<h3>Seller Information</h3>

		<div class="widget">
			<h4>Seller{if $arr_product.store_type == '2' || $arr_product.store_type == '3'} <a class="icon-user-mod" href="#"></a>{/if}</h4>

			<div id="seller-contact">
				<div id="seller-contact-user">
					<a href="http://{$arr_product.store_name}.{$domain}" id="seller-avatar" target="_blank">{if isset($arr_product.avatar_url_s)}<img src="{$arr_product.avatar_url_s}" />{/if}{*<span>{$arr_product.store_name}</span>*}</a>
					<a href="http://{$arr_product.store_name}.{$domain}" class="seller-username" target="_blank">{$arr_product.store_name}</a>
				{if $arr_product.feedback_score != 'n/a'}
					<span class="stars stars-{$arr_product.star_icon}"><span>{$arr_product.star_icon}/5 Stars</span></span>
				{/if}
				</div>

				<ul class="nav nav-list">
					<li><a data-toggle="modal-ajax" href="#contact-seller" data-url="/askseller.php?pid={$arr_product.pid}&version=new"><i class="icon-envelope-ecrater"></i> Contact Seller</a></li>
					<li><a href="{if $arr_product.feedback_score != 'n/a'}/view-feedback.php?storeid={$arr_product.sid}{$sess_multi_par}{else}#{/if}"><i class="icon-star-ecrater"></i> {if $arr_product.feedback_score != 'n/a'}{$arr_product.feedback_score}, {$arr_product.num_of_transactions}{$smarty.const.PRODUCT_TEXT28}{else}No Feedback Yet{/if}</a></li>
				</ul>

			{*if $arr_product.sid == '106106' || $arr_product.sid == '6'*}
			{if isset($show_carousel)}
				<div class="carousel" id="seller_info_thumbs">
					{include file='carousel.tpl'}
				</div>
			{/if}
			{*/if*}

				<a href="http://{$arr_product.store_name}.{$domain}" class="btn btn-light-orange" target="_blank">View Store</a>

				{*
				<div style="margin-top:20px;" class="clearfix">
					<div class="pull-left" style="width:46px;overflow:hidden;margin-right:10px">
						<script>(function(d, s, id) {
							var js, fjs = d.getElementsByTagName(s)[0];
							if (d.getElementById(id)) return;
							js = d.createElement(s); js.id = id;
							js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=181642591912272";
							fjs.parentNode.insertBefore(js, fjs);
							}(document, 'script', 'facebook-jssdk'));
						</script>
						<div class="fb-like" data-href="http://google.com" data-send="false" data-layout="button_count" data-width="65" data-show-faces="true" data-font="arial"></div>
					</div>

					<div class="pull-left" style="width:58px;overflow:hidden;">
						<a href="https://twitter.com/share" class="twitter-share-button" data-lang="en">Tweet</a>
						<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="https://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
					</div>
				</div>
				*}
			</div>
		</div>

		<div id="seller-location" class="widget">
			<h4>Location</h4>

			<ul class="nav nav-list">
				<li>{if $arr_product.country_abbr == 'us' || $arr_product.country_abbr == 'uk' || $arr_product.country_abbr == 'au' || $arr_product.country_abbr == 'de' || $arr_product.country_abbr == 'fr' || $arr_product.country_abbr == 'es' || $arr_product.country_abbr == 'pt' || $arr_product.country_abbr == 'nl' || $arr_product.country_abbr == 'it'}<i class="icon-country {$arr_product.country_abbr}" alt="{$arr_product.store_country}" title="{$arr_product.store_country}"></i>{else}<img src="{$static_url}img/flags/{$arr_product.store_country_abbr}.png" alt="{$arr_product.store_country}" title="{$arr_product.store_country}">{/if} {$arr_product.country_abbr|upper}, {if $arr_product.country_abbr == 'us' && $arr_product.hide_city == '0'}{$arr_product.city}, {/if}{$arr_product.state}</li>
			</ul>
		</div>

		<div id="seller-payment-methods" class="widget">
			<h4>Payment</h4>

			<ul class="nav nav-list">
				{if isset($arr_pmethods.paypal) || isset($arr_pmethods.google_checkout) || isset($arr_pmethods.cc_direct)}
				<li><i class="icon-credit-cards"><span>Credit Cards</span></i></li>
            {if !isset($arr_pmethods.cc_direct)}
				<li><span>Credit Cards accepted via:</span></i></li>
				{/if}
				{/if}
				{if isset($arr_pmethods.paypal)}
				<li><i class="icon-paypal"><span>PayPal</span></i></li>
				{/if}
				{if isset($arr_pmethods.google_checkout)}
				<li><i class="icon-google-wallet"><span>Google Wallet</span></i></li>
				{/if}
				{if isset($arr_pmethods.other)}
					{if $arr_pmethods.other|@count > 0}
						{foreach key=key item=item from=$arr_pmethods.other}
							<li>{$item}</li>
						{/foreach}
					{/if}
				{/if}
			</ul>
		</div>

		{if $arr_product.has_about == '1' || $arr_product.has_terms == '1' || $arr_product.has_contact == '1' || $arr_product.has_faq == '1'}
		<div id="seller-additional-info" class="widget">
			<h4>Additional Info</h4>

			<ul class="nav nav-list">
				{if $arr_product.has_about == '1'}
				<li><a href="http://{$arr_product.store_name}.{$domain}/about.php" target="_blank"><i class="icon-calendar-ecrater"></i> About</a></li>
				{/if}
				{if $arr_product.has_terms == '1'}
				<li><a href="http://{$arr_product.store_name}.{$domain}/terms.php" target="_blank"><i class="icon-flag-ecrater"></i> Terms and Policy</a></li>
				{/if}
				{if $arr_product.has_contact == '1'}
				<li><a href="http://{$arr_product.store_name}.{$domain}/contact.php" target="_blank"><i class="icon-envelope-ecrater"></i> Contact Info</a></li>
				{/if}
				{if $arr_product.has_faq == '1'}
				<li><a href="http://{$arr_product.store_name}.{$domain}/help.php" target="_blank"><i class="icon-microphone-ecrater"></i> FAQ</a></li>
				{/if}
			</ul>
		</div>
		{/if}
	</div>
	<!-- END Seller Information -->
	{*if isset($display_adsense) && isset($smarty.session.gproducts_ref) && $smarty.session.gproducts_ref == '1'*}
	{if isset($display_adsense)}
	<div class="sidebar-banner">
		<!-- adsense begin -->
		<script type="text/javascript"><!--
			google_ad_client = "pub-0559664827379296";
			/* 160x600, Product Right, Mar, created 02/19/13 */
			google_ad_slot = "3590498077";
			google_ad_width = 160;
			google_ad_height = 600;
			{if isset($arr_adsense_channels[$arr_product.gcid_level1])}
				{assign var='google_ad_channel' value=$arr_adsense_channels[$arr_product.gcid_level1]}
			{else}
				{assign var='google_ad_channel' value=""}
			{/if}
			{if isset($arr_product.not_updated)}
				{if $google_ad_channel == ''}
					{assign var='google_ad_channel' value="7273926985"}
				{else}
					{assign var='google_ad_channel' value="`$google_ad_channel`,7273926985"}
				{/if}
			{/if}
			{if isset($smarty.session.nu12)}
				{if $google_ad_channel == ''}
					{assign var='google_ad_channel' value="7794771275"}
				{else}
					{assign var='google_ad_channel' value="`$google_ad_channel`,7794771275"}
				{/if}
			{/if}
			{if isset($smarty.session.nu24)}
				{if $google_ad_channel == ''}
					{assign var='google_ad_channel' value="7711569274"}
				{else}
					{assign var='google_ad_channel' value="`$google_ad_channel`,7711569274"}
				{/if}
			{/if}
			{if isset($smarty.get.gps) && $smarty.get.gps == '1'}
				{if $google_ad_channel == ''}
					{assign var='google_ad_channel' value="1678326087"}
				{else}
					{assign var='google_ad_channel' value="`$google_ad_channel`,1678326087"}
				{/if}
				{if $country_abbr == 'us'}
					{assign var='google_ad_channel' value="`$google_ad_channel`,0308737742"}
				{/if}
			{/if}
			{if isset($smarty.session.came_from) && $smarty.session.came_from == 'gps'}
				{if $google_ad_channel == ''}
					{assign var='google_ad_channel' value="3695975676"}
				{else}
					{assign var='google_ad_channel' value="`$google_ad_channel`,3695975676"}
				{/if}
				{if $country_abbr == 'us'}
					{assign var='google_ad_channel' value="`$google_ad_channel`,6649442074"}
				{/if}
				{if $arr_product.store_onhold == '1'}
					{assign var='google_ad_channel' value="`$google_ad_channel`,8530116878"}
				{/if}
			{/if}
			{if isset($smarty.get.bs) && $smarty.get.bs == '1'}
				{if $google_ad_channel == ''}
					{assign var='google_ad_channel' value="7207562238"}
				{else}
					{assign var='google_ad_channel' value="`$google_ad_channel`,7207562238"}
				{/if}
			{/if}
{if isset($arr_product.paying_type) && $arr_product.paying_type == 'paying'}
	{if $google_ad_channel == ''}
		{assign var='google_ad_channel' value="6003956078"}
	{else}
		{assign var='google_ad_channel' value="`$google_ad_channel`,6003956078"}
	{/if}
{/if}
{if isset($arr_product.paying_type) && $arr_product.paying_type == 'non_paying'}
	{if $google_ad_channel == ''}
		{assign var='google_ad_channel' value="7480689277"}
	{else}
		{assign var='google_ad_channel' value="`$google_ad_channel`,7480689277"}
	{/if}
{/if}
{if isset($arr_product.paying_type) && $arr_product.paying_type == 'unknown'}
	{if $google_ad_channel == ''}
		{assign var='google_ad_channel' value="8957422470"}
	{else}
		{assign var='google_ad_channel' value="`$google_ad_channel`,8957422470"}
	{/if}
{/if}
			{if $google_ad_channel != ''}
				google_ad_channel = "{$google_ad_channel}";
			{/if}
			//-->
		</script>
		<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
		</script>
		<!-- adsense end -->
	</div>
	{/if}
</div>
<!-- END Sidebar -->
{else}
<div id="content" class="span9 sidebar-right">
	<div id="page-header" class="clearfix">
		<div id="page-header-title" class="pull-left">
			{if $arr_prelated|@count >= 5}
			<h1 style="padding-bottom:24px">Oops! This item could not be found. Here are some similar products</h1>
			{else}
			<h1 style="padding-bottom:24px">No such product</h1>
			{/if}
		</div>
	</div>

	{if $arr_prelated|@count >= 5}
		<!-- BEGIN Related Products -->
		
		<div id="page-content">
			<ul id="product-list-grid" class="clearfix">
				{assign var="product_counter" value=1}
				{foreach key=key item=item from=$arr_prelated}
					<li class="product-item{if $product_counter % 5 == 0} last{/if}">
						<div>
							<span class="btn btn-inverse">{$currency_symbol}{$item.price}</span>
						</div>
						<a href="{if $seo_urls == '1'}/{$seo_abbr_product}/{$key}/{$item.title_url}{if isset($keyword_value)}?keywords={$keyword_value}{$sess_multi_par}{else}{$sess_single_par}{/if}{else}/product.php?pid={$key}{if isset($keyword_value)}&keywords={$keyword_value}{/if}{$sess_multi_par}{/if}" class="product-image"><img src="{if $item.pic == ''}{$static_url}img/no_product_135x135.png{else}{$item.pic}{/if}" width="135" height="135"  alt="{$item.name_escaped}" title="{$item.name_escaped}" /></a>
						<div class="product-details">
							<h2><a href="{if $seo_urls == '1'}/{$seo_abbr_product}/{$key}/{$item.title_url}{if isset($keyword_value)}?keywords={$keyword_value}{$sess_multi_par}{else}{$sess_single_par}{/if}{else}/product.php?pid={$key}{if isset($keyword_value)}&keywords={$keyword_value}{/if}{$sess_multi_par}{/if}" title="{$item.name_escaped}">{$item.name_escaped}</a></h2>
							<a href="http://{$item.store_name}.{$domain}" class="product-category" target="_blank"{if isset($item.star_icon)} title="Feedback: {$item.feedback_score}, {$item.numof_sales} sales"{/if}>{$item.store_name}</a>
						</div>
					</li>
				{assign var="product_counter" value=$product_counter+1}
				{/foreach}
			</ul>
		</div>
	{/if}

	{if isset($display_adsense)}
		<br /><br />
		<div>Sponsored Links</div>
		<div>
			<!-- adsense begin -->
			<script type="text/javascript"><!--
				google_ad_client = "pub-0559664827379296";
				/* 728x90, Product Bottom Only, Mar, created 07/07/14 */
				google_ad_slot = "4458408874";
				google_ad_width = 728;
				google_ad_height = 90;
				{if isset($arr_adsense_channels[$arr_product.gcid_level1])}
					{assign var='google_ad_channel' value=$arr_adsense_channels[$arr_product.gcid_level1]}
				{else}
					{assign var='google_ad_channel' value=""}
				{/if}
				{if isset($api_afc_code) && $api_afc_code != ''}
					{if $google_ad_channel == ''}
						{assign var='google_ad_channel' value="4997931194"}
					{else}
						{assign var='google_ad_channel' value="`$google_ad_channel`,4997931194"}
					{/if}
				{/if}
				{if isset($arr_product.not_updated)}
					{if $google_ad_channel == ''}
						{assign var='google_ad_channel' value="7273926985"}
					{else}
						{assign var='google_ad_channel' value="`$google_ad_channel`,7273926985"}
					{/if}
				{/if}
				{if isset($smarty.session.nu12)}
					{if $google_ad_channel == ''}
						{assign var='google_ad_channel' value="7794771275"}
					{else}
						{assign var='google_ad_channel' value="`$google_ad_channel`,7794771275"}
					{/if}
				{/if}
				{if isset($smarty.session.nu24)}
					{if $google_ad_channel == ''}
						{assign var='google_ad_channel' value="7711569274"}
					{else}
						{assign var='google_ad_channel' value="`$google_ad_channel`,7711569274"}
					{/if}
				{/if}
				{if isset($smarty.get.gps) && $smarty.get.gps == '1'}
					{if $google_ad_channel == ''}
						{assign var='google_ad_channel' value="1678326087,5874397880"}
					{else}
						{assign var='google_ad_channel' value="`$google_ad_channel`,1678326087,5874397880"}
					{/if}
					{if $country_abbr == 'us'}
						{assign var='google_ad_channel' value="`$google_ad_channel`,0308737742,6256889091"}
					{/if}
				{/if}
				{if isset($smarty.session.came_from) && $smarty.session.came_from == 'gps'}
					{if $google_ad_channel == ''}
						{assign var='google_ad_channel' value="3695975676,5172708878"}
					{else}
						{assign var='google_ad_channel' value="`$google_ad_channel`,3695975676,5172708878"}
					{/if}
					{if $country_abbr == 'us'}
						{assign var='google_ad_channel' value="`$google_ad_channel`,6649442074,8126175272"}
					{/if}
					{if $arr_product.store_onhold == '1'}
						{assign var='google_ad_channel' value="`$google_ad_channel`,8530116878"}
					{/if}
				{/if}
				{if isset($smarty.get.bs) && $smarty.get.bs == '1'}
					{if $google_ad_channel == ''}
						{assign var='google_ad_channel' value="7207562238"}
					{else}
						{assign var='google_ad_channel' value="`$google_ad_channel`,7207562238"}
					{/if}
				{/if}
{if isset($arr_product.paying_type) && $arr_product.paying_type == 'paying'}
	{if $google_ad_channel == ''}
		{assign var='google_ad_channel' value="6003956078"}
	{else}
		{assign var='google_ad_channel' value="`$google_ad_channel`,6003956078"}
	{/if}
{/if}
{if isset($arr_product.paying_type) && $arr_product.paying_type == 'non_paying'}
	{if $google_ad_channel == ''}
		{assign var='google_ad_channel' value="7480689277"}
	{else}
		{assign var='google_ad_channel' value="`$google_ad_channel`,7480689277"}
	{/if}
{/if}
{if isset($arr_product.paying_type) && $arr_product.paying_type == 'unknown'}
	{if $google_ad_channel == ''}
		{assign var='google_ad_channel' value="8957422470"}
	{else}
		{assign var='google_ad_channel' value="`$google_ad_channel`,8957422470"}
	{/if}
{/if}
				{if $google_ad_channel != ''}
					google_ad_channel = "{$google_ad_channel}";
				{/if}
				//-->
			</script>
			<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
			</script>
			<!-- adsense end -->
		</div>
	{/if}
</div>

	<br /><br /><br /><br /><br /><br /><br /><br />
	<br /><br /><br /><br /><br /><br /><br /><br />
	<br /><br /><br /><br /><br /><br /><br /><br />
{/if}