<div class="utilities-container">
	<div class="js-utilities-item utilities-item transition-soft d-none d-md-inline-block" data-store="account-links">
		<div class="utility-head text-center">
			{% if not customer %}
			<span class="utility-name transition-soft d-block{% if settings.icons_solid %} font-weight-bold{% endif %}">{{ 'Mi cuenta' | translate }}</span>
			{% else %}
			{% set customer_short_name = customer.name|split(' ')|slice(0, 1)|join %} 
				<span class="utility-name transition-soft d-block{% if settings.icons_solid %} font-weight-bold{% endif %}">{{ "¡Hola, {1}!" | t(customer_short_name) }}</span>
			{% endif %}
		</div>
		<ul class="js-subutility-list subutility-list">	
			{% if not customer %}
	            {% if 'mandatory' not in store.customer_accounts %}
	            <li class="subutility-list-item nav-accounts-item">{{ "Crear cuenta" | translate | a_tag(store.customer_register_url, '', 'nav-accounts-link') }}</li>
	            {% endif %}
	            <li class="subutility-list-item nav-accounts-item">{{ "Iniciar sesión" | translate | a_tag(store.customer_login_url, '', 'nav-accounts-link') }}</li>
	        {% else %}
	            <li class="subutility-list-item nav-accounts-item">{{ "Mi cuenta" | translate | a_tag(store.customer_home_url, '', 'nav-accounts-link') }}</li>
	            <li class="subutility-list-item nav-accounts-item">{{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url, '', 'nav-accounts-link') }}</li>
	        {% endif %}
		</ul>
	</div>	
	{% if not store.is_catalog %}    
	<div class="utilities-item">
		<div id="ajax-cart" class="cart-summary transition-soft utility-head text-center">
			<a {% if settings.ajax_cart and template != 'cart' %}href="#" class="js-modal-open js-toggle-cart js-fullscreen-modal-open" data-toggle="#modal-cart" data-modal-url="modal-fullscreen-cart"{% else %}href="{{ store.cart_url }}"{% endif %}>
				{% include "snipplets/svg/cart.tpl" with {svg_custom_class: "icon-inline icon-2x"} %}
				<span class="utility-name transition-soft d-none d-md-block{% if settings.icons_solid %} font-weight-bold{% endif %}">{{ 'Mi carrito' | translate }}</span>
		    	<span class="js-cart-widget-amount cart-widget-amount">{{ "{1}" | translate(cart.items_count ) }}</span>
		    </a>	
		</div>
	</div>
	{% endif %}
</div>