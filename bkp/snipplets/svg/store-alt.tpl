{% if settings.icons_solid %}
	<svg class="{{ svg_custom_class }}" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512"><path d="M320 384H128V224H64v256c0 17.7 14.3 32 32 32h256c17.7 0 32-14.3 32-32V224h-64v160zm314.6-241.8l-85.3-128c-6-8.9-16-14.2-26.7-14.2H117.4c-10.7 0-20.7 5.3-26.6 14.2l-85.3 128c-14.2 21.3 1 49.8 26.6 49.8H608c25.5 0 40.7-28.5 26.6-49.8zM512 496c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V224h-64v272z"/></svg>
{% else %}
	<svg class="{{ svg_custom_class }}" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512"><path d="M635.7 176.1l-91.4-160C538.6 6.2 528 0 516.5 0h-393C112 0 101.4 6.2 95.7 16.1l-91.4 160C-7.9 197.5 7.4 224 32 224h32v254.5C64 497 78.3 512 96 512h256c17.7 0 32-15 32-33.5V224h160v280c0 4.4 3.6 8 8 8h16c4.4 0 8-3.6 8-8V224h32c24.6 0 39.9-26.5 27.7-47.9zM352 478.5c0 .9-.3 1.4-.2 1.5l-255.2.2s-.6-.5-.6-1.7V352h256v126.5zm0-158.5H96v-96h256v96zM32.1 192l91.4-160h393L608 192H32.1z"/></svg>
{% endif %}