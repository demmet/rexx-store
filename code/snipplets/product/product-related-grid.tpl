{# /*============================================================================
  #Product Related Grid
==============================================================================*/

#Properties

#Related Slider

#}

{% set related_slider = related_slider | default(false) %}
{% set related_products_ids = product.metafields.related_products.related_products_ids %}
{% if related_products_ids %}
    {% set related_products = related_products_ids | get_products %}
    {% set show = (related_products | length > 0) %}
{% endif %}
{% if not show %}
    {% set related_products = category.products | shuffle | take(8) %}
    {% set show = (related_products | length > 1) %}
{% endif %}

{% if show %}
    <div class="row">
        {% if settings.products_related_title %}
            <div class="col-12 text-center">
                <h3 class="h1{% if settings.theme_rounded %} text-primary{% endif %}">{{ settings.products_related_title }}</h3>
            </div>
        {% endif %}
        {% if related_slider %}
            <div class="col-12 p-0">
                <div class="js-swiper-related swiper-container p-md-1">
                    <div class="swiper-wrapper">
        {% endif %}

        {% for related in related_products %}
            {% if product.id != related.id %}
                {% if related_slider %}
                    {% include 'snipplets/grid/item.tpl' with {'product': related, 'slide_item': true} %}
                {% else %}
                    {% include 'snipplets/grid/item.tpl' with {'product': related} %}
                {% endif %}
            {% endif %}
        {% endfor %}

        {% if related_slider %}
                    </div>
                </div>
            </div>
            <div class="js-swiper-related-prev swiper-button-prev d-none d-md-block svg-circle svg-circle-big svg-icon-text{% if settings.icons_solid %} svg-solid{% endif %}">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-2x mr-1"} %}</div>
            <div class="js-swiper-related-next swiper-button-next d-none d-md-block svg-circle svg-circle-big svg-icon-text{% if settings.icons_solid %} svg-solid{% endif %}">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-2x ml-1"} %}</div>
        {% endif %}
    </div>
{% endif %}