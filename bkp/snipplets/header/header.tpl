{# Site Overlay #}
<div class="js-overlay site-overlay" style="display: none;"></div>


{# Header #}

{% set show_transparent_head = template == 'home' and settings.head_transparent and settings.slider and not settings.slider is empty %}

<header class="js-head-main head-main head-{{ settings.head_background }} {% if settings.head_fix %}head-fix{% endif %} transition-soft" data-store="head">

    {# Topbar = Social + Advertising + Language #}

    {% set has_social_network = store.facebook or store.twitter or store.pinterest or store.instagram or store.tiktok or store.youtube %}
    {% set has_languages = languages | length > 1 %}
    {% set has_ad_bar = settings.ad_bar and settings.ad_text %}
    {% set show_topbar =  has_ad_bar or has_social_network or has_languages %}
    {% if show_topbar %}
        <section class="js-topbar section-topbar {% if not has_ad_bar %}d-none d-md-block{% endif %}">
            <div class="container-fluid">
                <div class="row">
                    <div class="col text-left d-none d-md-block">
                        {% include "snipplets/social/social-links.tpl" %}
                    </div>
                    {% if has_ad_bar %}
                        {% snipplet "header/header-advertising.tpl" %}
                    {% endif %}
                    <div class="col text-right d-none d-md-block">
                        {% include "snipplets/navigation/navigation-lang.tpl" %}
                    </div>
                </div>
            </div>
        </section>
    {% endif %}
	<div class="container-fluid {% if settings.head_utility == 'searchbox' %}pb-3 pb-md-0{% endif %}">
		<div class="{% if not settings.head_fix %}js-nav-logo-bar{% endif %} row no-gutters align-items-center">
            <div class="col-2 text-left d-block d-md-none">
               {% if settings.head_utility == 'searchbox' %}
                <a href="#" class="js-modal-open utilities-link utilities-item" data-toggle="#nav-hamburger" aria-label="{{ 'Menú' | translate }}">
                    {% include "snipplets/svg/bars.tpl" with {svg_custom_class: "icon-inline icon-2x"}%}
                </a>
                {% else %}
                <a href="#" class="js-modal-open utilities-link utilities-item" data-toggle="#nav-search" aria-label="{{ 'Buscador' | translate }}">
                    {% include "snipplets/svg/search.tpl" with {svg_custom_class: "icon-inline icon-2x"} %}
                </a>
                {% endif %}
            </div>
			<div class="col-8 col-md-4 col-md-3 col-lg-3 text-center text-md-left">{% snipplet "header/header-logo.tpl" %}</div>
            <div class="{% if settings.head_utility == 'searchbox' %}col-12 col-md-5 col-md-5 col-lg-6 order-last order-md-0 {% else %}col-6 d-none d-md-block{% endif %} text-center">
                {% snipplet "header/header-search.tpl" %}
            </div>
			<div class="col-2 col-md-3 col-md-4 col-lg-3 text-right ">
                {% snipplet "header/header-utilities.tpl" %}
                {% if settings.head_fix and settings.ajax_cart %}
                    <div class="d-none d-md-block">
                        {% include "snipplets/notification.tpl" with {add_to_cart: true} %}
                    </div>
                {% endif %}
            </div>
		</div>
        {% if settings.head_fix and settings.ajax_cart %}
            <div class="d-md-none">
                {% include "snipplets/notification.tpl" with {add_to_cart: true, add_to_cart_mobile: true} %}
            </div>
        {% endif %}
        <div class="row align-items-center nav-row {% if settings.head_utility == 'searchbox' %}d-none d-md-block{% endif %}">
            {% if settings.head_utility == 'categories' %}
            <div class="col-2 d-block d-md-none p-0 text-center">
                <a href="#" class="js-modal-open utilities-link utilities-item" data-toggle="#nav-hamburger" aria-label="{{ 'Menú' | translate }}">
                    {% include "snipplets/svg/bars.tpl" with {svg_custom_class: "icon-inline icon-2x"}%}
                </a>
            </div>
            <div class="col-10 nav-categories-container d-block d-md-none p-0">
                {% snipplet "navigation/navigation-categories.tpl" %}
            </div>
            {% endif %}
            <div class="col text-center p-0 d-none d-md-block">{% snipplet "navigation/navigation.tpl" %}</div>
        </div>

	</div>    
    {% include "snipplets/notification.tpl" with {order_notification: true} %}
</header>

{# Add notification for order cancellation #}

{% if store.country == 'AR' and template == 'home' and status_page_url %}
    {% include "snipplets/notification.tpl" with {show_order_cancellation: true} %}
{% endif %}

{# Add to cart notification for non fixed header #}

{% if not settings.head_fix and settings.ajax_cart %}
    {% include "snipplets/notification.tpl" with {add_to_cart: true, add_to_cart_fixed: true} %}
{% endif %}

{# Hamburger panel #}

{% embed "snipplets/modal.tpl" with {modal_id: 'nav-hamburger',modal_class: 'nav-hamburger head-'~ settings.head_background ~ ' modal-docked-small', modal_position: 'left', modal_transition: 'fade', modal_width: 'full', modal_topbar: true  } %}
    {% block modal_topbar %}
        {% snipplet "navigation/navigation-topbar.tpl" %}
    {% endblock %}
    {% block modal_body %}
        {% snipplet "navigation/navigation-panel.tpl" %}
    {% endblock %}
{% endembed %}
{# Notifications #}

{# Modal Search #}

{% embed "snipplets/modal.tpl" with{modal_id: 'nav-search',modal_class: 'nav-search', modal_position: 'left', modal_transition: 'slide', modal_width: 'docked-md', modal_header: true } %}
    {% block modal_head %}
            {% block page_header_text %}{{ "Buscar" | translate }}{% endblock page_header_text %}
    {% endblock %}
    {% block modal_body %}
        {% snipplet "header/header-search.tpl" %}
    {% endblock %}
{% endembed %}

{% if not store.is_catalog and settings.ajax_cart and template != 'cart' %}           

    {# Cart Ajax #}

    {% embed "snipplets/modal.tpl" with{modal_id: 'modal-cart', modal_position: 'right', modal_transition: 'slide', modal_width: 'docked-md', modal_form_action: store.cart_url, modal_form_class: 'js-ajax-cart-panel', modal_header: true, modal_mobile_full_screen: true, modal_form_hook: 'cart-form' } %}
        {% block modal_head %}
            {% block page_header_text %}{{ "Carrito de Compras" | translate }}{% endblock page_header_text %}
        {% endblock %}
        {% block modal_body %}
            {% snipplet "cart-panel.tpl" %}
        {% endblock %}
    {% endembed %}

{% endif %}