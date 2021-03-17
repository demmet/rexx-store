{# /*============================================================================
  #Item grid
==============================================================================*/

#Properties

#Slide Item

#}

{% set slide_item = slide_item | default(false) %}
{% set columns = settings.grid_columns %}
{% set has_color_variant = false %}
{% if settings.product_color_variants %}
    {% for variation in product.variations if variation.name in ['Color', 'Cor'] and variation.options | length > 1 %}
        {% set has_color_variant = true %}
    {% endfor %}
{% endif %}

{% if slide_item %}
    <div class="swiper-slide{% if settings.theme_rounded %} p-3{% endif %}">
{% endif %}
{% if settings.theme_rounded %}
    <div class="js-item-product {% if not slide_item %} {% if columns == 1 %}col-12 col-md-6 col-lg-4{% else %}col-6 col-md-4 col-lg-3{% endif %}{% endif %}" data-product-type="list" data-product-id="{{ product.id }}" data-store="product-item-{{ product.id }}">
        <div class="item item-rounded item-product box-rounded p-0">
{% else %}
    <div class="js-item-product {% if not slide_item %} {% if columns == 1 %}col-12 col-md-6 col-lg-4{% else %}col-6 col-md-4 col-lg-3{% endif %}{% endif %} item item-product" data-product-type="list" data-product-id="{{ product.id }}" data-store="product-item-{{ product.id }}">
{% endif %}
        {% if settings.quick_shop or settings.product_color_variants %}
            <div id="quick{{ product.id }}{% if slide_item and section_name %}-{{ section_name }}{% endif %}" class="js-product-container js-quickshop-container position-relative {% if product.variations %}js-quickshop-has-variants{% endif %}" data-variants="{{ product.variants_object | json_encode }}">
        {% endif %}
        {% set product_url_with_selected_variant = has_filters ?  ( product.url | add_param('variant', product.selected_or_first_available_variant.id)) : product.url  %}

        {% if has_color_variant %}

            {# Item image will be the first avaiable variant #}

            {% set item_img_spacing = product.featured_variant_image.dimensions['height'] / product.featured_variant_image.dimensions['width'] * 100 %}
            {% set item_img_srcset = product.featured_variant_image %}
            {% set item_img_alt = product.featured_variant_image.alt %}
        {% else %}

            {# Item image will be the first image regardless the variant #}

            {% set item_img_spacing = product.featured_image.dimensions['height'] / product.featured_image.dimensions['width'] * 100 %}
            {% set item_img_srcset = product.featured_image %}
            {% set item_img_alt = product.featured_image.alt %}
        {% endif %}
        <div class="item-image{% if columns == 1 %} item-image-big{% endif %}">
            <div style="padding-bottom: {{ item_img_spacing }}%;" class="position-relative" data-store="product-item-image-{{ product.id }}">
                <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" aria-label="{{ product.name }}" >
                    <img alt="{{ item_img_alt }}" data-sizes="auto" data-expand="-10" src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset="{{ item_img_srcset | product_image_url('small')}} 240w, {{ item_img_srcset | product_image_url('medium')}} 320w, {{ item_img_srcset | product_image_url('large')}} 480w" class="js-item-image lazyautosizes lazyload img-absolute img-absolute-centered fade-in"/> 
                    <div class="placeholder-fade">
                    </div>
                </a>
            </div>
            {% if settings.product_color_variants %}
                {% include 'snipplets/labels.tpl' with {color: true} %}
                {% include 'snipplets/grid/item-colors.tpl' %}
            {% else %}
                {% include 'snipplets/labels.tpl' %}
            {% endif %}
            {% if (settings.quick_shop or settings.product_color_variants) and product.variations %}
                <div class="item-buy{% if settings.product_color_variants and not settings.quick_shop %} hidden{% endif %}">
                    <div class="js-item-variants item-buy-variants{% if settings.theme_rounded %} px-1 py-2 p-md-3{% endif %}">
                        <form class="js-product-form" method="post" action="{{ store.cart_url }}">
                            <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                            {% if product.variations %}
                                {% include "snipplets/product/product-variants.tpl" with {quickshop: true} %}
                            {% endif %}
                            {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                            {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}

                            {# Add to cart CTA #}

                            <input type="submit" class="js-addtocart js-prod-submit-form btn btn-primary btn-small w-100 mb-2 {{ state }}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} />

                            {# Fake add to cart CTA visible during add to cart event #}

                            <div class="js-addtocart js-addtocart-placeholder btn btn-primary btn-block btn-transition btn-small w-100 mb-2 disabled" style="display: none;">
                                <span class="js-addtocart-text">{{ 'Agregar al carrito' | translate }}</span>
                                <span class="js-addtocart-success transition-container btn-transition-success-small">
                                    {% include "snipplets/svg/check-circle.tpl" with {svg_custom_class: "icon-inline svg-icon-invert btn-transition-success-icon"} %}
                                </span>
                                <div class="js-addtocart-adding transition-container transition-soft btn-transition-progress">
                                    <div class="spinner-ellipsis invert">
                                        <div class="point"></div>
                                        <div class="point"></div>
                                        <div class="point"></div>
                                        <div class="point"></div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <a href="#" class="js-item-buy-close">
                            {% include "snipplets/svg/times.tpl" with {svg_custom_class: "icon-inline icon-lg svg-circle svg-icon-text"} %}
                        </a>
                    </div>
                </div>
            {% endif %}
        </div>
        <div class="item-description py-4{% if settings.theme_rounded %} px-3{% else %} px-1{% endif %}" data-store="product-item-info-{{ product.id }}">
            <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" aria-label="{{ product.name }}" class="item-link">
                <div class="js-item-name item-name mb-3" data-store="product-item-name-{{ product.id }}">{{ product.name }}</div>
                {% if product.display_price %}
                    <div class="item-price-container mb-1" data-store="product-item-price-{{ product.id }}">
                        <span class="js-compare-price-display price-compare" {% if not product.compare_at_price or not product.display_price %}style="display:none;"{% else %}style="display:inline-block;"{% endif %}>
                            {{ product.compare_at_price | money }}
                        </span>
                        <span class="js-price-display item-price">
                            {{ product.price | money }}
                        </span>
                    </div>
                {% endif %}
            </a>
            {% include 'snipplets/payments/installments.tpl' %}
        </div>
        {% if settings.quick_shop %}
            <div class="item-actions row justify-content-center{% if settings.theme_rounded %} m-0 mb-3{% endif %}">
                {% if product.available and product.display_price %}
                    <div class="col-6">
                        {% if product.variations %}
                            <a href="#" class="js-item-buy-open item-buy-open d-block btn btn-primary btn-small" title="{{ 'Compra rápida de' | translate }} {{ product.name }}" aria-label="{{ 'Compra rápida de' | translate }} {{ product.name }}" >{{ 'Comprar' | translate }}</a>
                        {% else %}
                            <form class="js-product-form" method="post" action="{{ store.cart_url }}">
                                <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                                {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                                {% set texts = {'cart': "Comprar", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}

                                <input type="submit" class="js-addtocart js-prod-submit-form btn btn-primary btn-small w-100 mb-2 {{ state }}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} />

                                {# Fake add to cart CTA visible during add to cart event #}

                                <div class="js-addtocart js-addtocart-placeholder btn btn-primary btn-block btn-transition btn-small w-100 mb-2 disabled" style="display: none;">
                                    <span class="js-addtocart-text">{{ 'Comprar' | translate }}</span>
                                    <span class="js-addtocart-success transition-container btn-transition-success-small">
                                        {% include "snipplets/svg/check-circle.tpl" with {svg_custom_class: "icon-inline svg-icon-invert btn-transition-success-icon"} %}
                                    </span>
                                    <div class="js-addtocart-adding transition-container transition-soft btn-transition-progress">
                                        <div class="spinner-ellipsis invert">
                                            <div class="point"></div>
                                            <div class="point"></div>
                                            <div class="point"></div>
                                            <div class="point"></div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        {% endif %}
                    </div>
                {% endif %}
            </div>
        {% endif %}
        {% if settings.quick_shop or settings.product_color_variants %}
            </div>{# This closes the quickshop tag #}
        {% endif %}

        {# Structured data to provide information for Google about the product content #}
        {% include 'snipplets/structured_data/item-structured-data.tpl' %}
    </div>
{% if settings.theme_rounded %}
    </div>
{% endif %}
{% if slide_item %}
    </div>
{% endif %}