{% set has_filters = insta_colors|length > 0 or other_colors|length > 0 or size_properties_values|length > 0 or variants_properties|length > 0 %}
{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}
{% paginate by 12 %}

{% set show_filters = settings.product_filters and (filter_categories or insta_colors or other_colors or size_properties_values or variants_properties) %}
{% if not show_help %}

{% set category_banner = (category.images is not empty) or ("banner-products.jpg" | has_custom_image) %}
{% if category_banner %}
    {% include 'snipplets/category-banner.tpl' %}
{% endif %}
<section class="container {% if not category.description %}d-md-none{% endif %}">
	<div class="row">
		{% if category.description and category_banner %}
			<div class="category-banner-header background-main">
		{% endif %}
			<div class="col-12 d-md-none">
				{% include "snipplets/breadcrumbs.tpl" %}
			</div>
			<div class="col">
				{% embed "snipplets/page-header.tpl" %}
					{% block page_header_text %}{{ category.name }}{% endblock page_header_text %}
				{% endembed %}
			</div>
		{% if category.description and category_banner %}
			</div>
		{% endif %}
	</div>
</section>
<section class="js-category-controls-prev category-controls-sticky-detector"></section>
<section class="js-category-controls category-controls container visible-when-content-ready">
	<div class="row align-items-center mb-md-5">
		<div class="col-9 d-none d-md-block">
			<div class="row">
				<div class="col-auto align-self-center">
					{% include "snipplets/breadcrumbs.tpl" %}
				</div>
				<div class="visible-when-content-ready col text-right">
					{% include "snipplets/grid/filters.tpl" with {applied_filters: true} %}
				</div>
			</div>
		</div>
		<div class="visible-when-content-ready col-6 col-md-3 d-md-none">
		{% if show_filters %}
			<a href="#" class="js-modal-open js-fullscreen-modal-open btn-default" data-toggle="#nav-filters" data-modal-url="modal-fullscreen-filters">
				<div class="row align-items-center">
					<div class="col font-weight-bold">
						{{ 'Filtrar' | t }}
					</div>
					<div class="col text-right">
						{% include "snipplets/svg/filter.tpl" with { svg_custom_class: "icon-inline"} %}
					</div>
				</div>
			</a>
			{% embed "snipplets/modal.tpl" with{modal_id: 'nav-filters', modal_class: 'filters', modal_position: 'right', modal_transition: 'slide', modal_header: true, modal_width: 'full', modal_mobile_full_screen: 'true' } %}
				{% block modal_head %}
					{{'Filtros ' | translate }}
				{% endblock %}
				{% block modal_body %}
					{% include "snipplets/grid/categories.tpl" with {mobile: true} %}
				   	{% include "snipplets/grid/filters.tpl" with {mobile: true} %}
					<div class="js-filters-overlay filters-overlay" style="display: none;">
						<div class="filters-updating-message">
							<h3 class="js-applying-filter" style="display: none;">{{ 'Aplicando filtro...' | translate }}</h3>
							<h3 class="js-removing-filter" style="display: none;">{{ 'Borrando filtro...' | translate }}</h3>
						</div>
					</div>
				{% endblock %}
			{% endembed %}

		{% endif %}
		</div>
		<div class="{% if show_filters %}col-6{% else %}col-8 offset-2 offset-md-0{% endif %} col-md-3">
			{% if products %}
				{% include 'snipplets/grid/sort-by.tpl' %}
			{% endif %}
		</div> 
	</div>
</section>

<div class="container visible-when-content-ready d-md-none">
	{% include "snipplets/grid/filters.tpl" with {mobile: true, applied_filters: true} %}
</div>

<section class="category-body">
	<div class="container">
		<div class="row">
			{% if show_filters %} 
				<div class="col col-md-2 d-none d-md-block visible-when-content-ready">
					{% if products %}
						{% include "snipplets/grid/categories.tpl" %}
						{% if has_filters %}	   
							{% include "snipplets/grid/filters.tpl" %}
						{% endif %}
					{% endif %}
				</div>
			{% endif %}
			<div class="col" data-store="category-grid-{{ category.id }}">
				{% if products %}
					<div class="js-product-table row">
						{% include 'snipplets/product_grid.tpl' %}
					</div>
					{% if pages.current == 1 and not pages.is_last %}
						<div class="text-center mt-5 mb-5">
							<a class="js-load-more btn btn-primary">
								<span class="js-load-more-spinner pull-left m-right-quarter" style="display:none;">{% include "snipplets/svg/circle-notch.tpl" with {svg_custom_class: "icon-inline icon-spin"} %}</span>
								{{ 'Mostrar más productos' | t }}
							</a>
						</div>
						<div id="js-infinite-scroll-spinner" class="mt-5 mb-5 text-center w-100" style="display:none">
							{% include "snipplets/svg/circle-notch.tpl" with {svg_custom_class: "icon-inline icon-3x svg-icon-text icon-spin"} %} 
						</div>
					{% endif %}
				{% else %}
					<h6 class="text-center">
						{{(has_filters ? "No tenemos productos en esas variantes. Por favor, intentá con otros filtros." : "Próximamente") | translate}}
					</h6>
				{% endif %}
			</div>
		</div>
	</div>
</section>
{% elseif show_help %}
	{# Category Placeholder #}
	{% include 'snipplets/defaults/show_help_category.tpl' %}
{% endif %}