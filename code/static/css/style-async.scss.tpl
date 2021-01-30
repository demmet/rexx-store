
/*============================================================================
style.css

    -This file contains all the theme non critical styles wich will be loaded asynchronously
    -Rest of styling can be found in:
        -static/css/style-colors.scss.tpl --> For color and font styles related to config/settings.txt
        -static/css/style-colors.critical.tpl --> For critical CSS rendered inline before the rest of the site

==============================================================================*/

/*============================================================================
  Table of Contents

  #Components
    // Margin and Padding
    // Mixins
    // Animations
    // Buttons
    // Chips
    // Forms
    // Alerts and notifications
    // Progress bar
    // Modals
    // Tables
    // Tabs
    // Cards
  #Header and nav
    // Header
    // Nav
    // Utilities
    // Search
  #Footer
    // Nav
    // Social
    // Legal
  #Home page
    // Instafeed
    // Banners
    // Brands
    // Newsletter
    // Placeholder
  #Product grid
    // Filters
  #Product detail
  	// Image
  	// Form and info
  #Cart detail
    // Table
    // Totals
  #Contact page
  #Media queries
    // Min width 768px
    //// Components
    //// Footer
  #Critical path utilities

==============================================================================*/
  

{# /* // Margin and Padding */ #}

%section-margin {
  margin-bottom: 70px;
}
%element-margin {
  margin-bottom: 35px;
}
%element-margin-small {
  margin-bottom: 20px;
}
%section-margin-invert {
  margin-top: -70px;
}

{# /* // Mixins */ #}

{# This mixin adds browser prefixes to a CSS property #}

@mixin prefix($property, $value, $prefixes: ()) {
  @each $prefix in $prefixes {
    #{'-' + $prefix + '-' + $property}: $value;
  }
  #{$property}: $value;
}

%border-radius-small {
  border-radius: 10px;
}


{# /* // Animations */ #}

.transition-soft {
  @include prefix(transition, all 0.3s ease, webkit ms moz o);
}

.transition-up {
    position: relative;
    top: -8px;
    @include prefix(transition, all 0.5s ease, webkit ms moz o);
    z-index: 10;
    pointer-events: none; 
    &-active {
      top: 0;
      opacity: 1; 
      z-index: 100;
      pointer-events: all; 
    }
}

.swing {
  @include prefix(animation-duration, 1s, webkit ms moz o);
  @include prefix(animation-fill-mode, both, webkit ms moz o);
  @include prefix(animation-iteration-count, 3, webkit ms moz o);   
  @include prefix(transform-origin, top center, webkit ms moz o);
  @include prefix(animation-name, swing, webkit ms moz o);
}

@-webkit-keyframes swing {
  20% {
    @include prefix(transform, rotate3d(0, 0, 1, 15deg), webkit ms moz o);
  }

  40% {
    @include prefix(transform, rotate3d(0, 0, 1, -10deg), webkit ms moz o);
  }

  60% {
    @include prefix(transform, rotate3d(0, 0, 1, 5deg), webkit ms moz o);
  }

  70% {
    @include prefix(transform, rotate3d(0, 0, 1, -5deg), webkit ms moz o);
  }

  80% {
    @include prefix(transform, rotate3d(0, 0, 1, 0deg), webkit ms moz o);
  }

  100% {
    @include prefix(transform, rotate3d(0, 0, 1, 0deg), webkit ms moz o);
  }
}

@keyframes swing {
  20% {
    @include prefix(transform, rotate3d(0, 0, 1, 15deg), webkit ms moz o);
  }

  40% {
    @include prefix(transform, rotate3d(0, 0, 1, -10deg), webkit ms moz o);
  }

  60% {
    @include prefix(transform, rotate3d(0, 0, 1, 5deg), webkit ms moz o);
  }

  70% {
    @include prefix(transform, rotate3d(0, 0, 1, -5deg), webkit ms moz o);
  }

  80% {
    @include prefix(transform, rotate3d(0, 0, 1, 0deg), webkit ms moz o);
  }

  100% {
    @include prefix(transform, rotate3d(0, 0, 1, 0deg), webkit ms moz o);
  }
}

{# /* // Buttons */ #}

.btn-transition {
  position: relative;
  overflow: hidden; 
  .transition-container {
    position: absolute;
    top: -100%;
    left: 0;
    width: 100%;
    text-align: center;
    @include prefix(transition, all 0.5s ease, webkit ms moz o);
    pointer-events: none;
    cursor: not-allowed;
    &.btn-transition-progress{
      height: 14px;
      margin-top: -20px;
    }
    &.btn-transition-success {
      margin-top: -11px;
      .btn-transition-success-icon {
        font-size: 24px;
      }
    }
    &.btn-transition-success-small {
      margin-top: -10px;
      .btn-transition-success-icon {
        font-size: 20px;
      }
    }
    &.active {
      top: 50%;
    }
  } 
} 

{# /* // Chips */ #}

.chip {
  position: relative;
  margin: 5px 10px 5px 0;
  padding: 10px 35px 10px 12px;
  font-size: 11px;
  font-weight: bold;
  white-space: normal;
  word-break: break-word;
  line-height: 18px;
  border: 0;
  border-radius: 20px;
  @include prefix(transition, all 0.4s ease, webkit ms moz o);
  &-remove-icon{
    position: absolute;
    top: 8px;
    right: 8px;
    display: inline-block;
    width: 20px;
    height: 20px;
    padding: 4px 6px 3px 6px;
    border-radius: 50%;
  }
  &:focus {
    outline: 0;
  }
  &:hover {
    opacity: 0.6;
  }
}

{# /* // Forms */ #}

.form-group{
  @extend %element-margin-small;
  .form-label{
    float: left;
    width: 100%;
    margin-bottom: 10px;
  }
  .alert{
    margin: 10px 0 0 0;
  }
}

.radio-button{
  width: 100%;
  float: left;
  clear: both;
  text-align: left;
  -webkit-tap-highlight-color: rgba(0,0,0,0);
  cursor: pointer;
  &.disabled{
    opacity: 0.6;
    cursor: not-allowed;
    input[type="radio"] {
      cursor: not-allowed;
    }
  }
  &-content{
    position: relative;
    padding: 20px;
  }
  &-icons-container{
    position: absolute;
    top: 0;
    left: 0;
    width: 36px;
    height: 100%;
  }
  &-icons{
    position: relative;
    float: left;
    display: table;
    width: 20px;
    margin: 17px 8px;
    overflow: hidden;
  }
  &-icon{
    border-radius: 50%;
    width: 20px;
    height: 20px;
  }
  input[type="radio"]{
    display: none;
    & +  .radio-button-content .unchecked{
      float: left;
    }
    & +  .radio-button-content .checked{
      position: absolute;
      top: 0;  
      left: 0;   
      @include prefix(transform, translate(-50%,-50%), webkit ms moz o);
      @include prefix(transform, scale(0), webkit ms moz o);
      @include prefix(transition, all 0.2s , webkit ms moz o);
    }
    &:checked + .radio-button-content .checked{
      top: 2px;
      left: 4px;
      @include prefix(transform, scale(1), webkit ms moz o);
    }
  }
  &-label{
    padding-left: 32px;
  }
}

.radio-buttons-group .list-unstyled{
  .radio-button-item:first-child{
    .radio-button-content{
      border-radius: 10px 10px 0 0;
    }
    .radio-button input[type="radio"]:checked + .radio-button-content .radio-button-icons-container{
      border-radius: 6px 0 0 0;
    }
  }
  .radio-button-item:last-child{
    .radio-button-content{
      margin-bottom: 0;
      border-radius: 0 0 10px 10px;
    }
    .radio-button input[type="radio"]:checked + .radio-button-content .radio-button-icons-container{
      border-radius: 0 0 0 6px;
    }
    .radio-button{
      margin-bottom: 0;
    }
  }
  .radio-button-item:only-child{
    .radio-button-content{
      border-radius: 10px;
    }
    .radio-button input[type="radio"]:checked + .radio-button-content{
      @extend %border-radius-small;
    }
    .radio-button input[type="radio"]:checked + .radio-button-content .radio-button-icons-container{
      border-radius: 6px 0 0 6px;
    }
  }
  &.with-other-options {
    .radio-button-item, .radio-button-item:last-child {
      .radio-button-content{
        border-radius: 0;
      }
      .radio-button input[type="radio"]:checked + .radio-button-content .radio-button-icons-container{
        border-radius: 0;
      }
    }
    .radio-button-item:only-child{
      .radio-button input[type="radio"]:checked + .radio-button-content{
        border-radius: 0;
      }
      .radio-button input[type="radio"]:checked + .radio-button-content .radio-button-icons-container{
        border-radius: 0;
      }
    }
    > .radio-button-item:first-child{
      .radio-button-content{
        border-radius: 10px 10px 0 0;
      }
      .radio-button input[type="radio"]:checked + .radio-button-content .radio-button-icons-container{
        border-radius: 6px 0 0 0;
      }
    }
  }
}

.checkbox-container{
  .checkbox {
    position: relative;
    display: block;
    margin-bottom: 15px;
    padding-left: 35px;
    font-weight: normal;
    text-decoration: none;
    @include prefix(transition, all 0.4s ease, webkit ms moz o);
    cursor: pointer;
    &-icon {
      position: absolute;
      left: 0;
      display: block;
      width: 20px;
      height: 20px;
      border-radius: 3px;
      &:after {
        position: absolute;
        top: 2px;
        left: 6px;
        display: none;
        width: 6px;
        height: 12px;
        content: '';
        @include prefix(transform, rotate(45deg), webkit ms moz o);
      }
    }
    &-text {
      display: inline-block;
      padding-top: 2px;
      &.with-color {
        padding-right: 30px;
      }
    }
    &-color {
      position: absolute;
      right: 0;
      display: inline-block;
      width: 18px;
      height: 18px;
      border-radius: 50%;
    }
  }
  input {
    display: none;
    &:checked ~ .checkbox {
      opacity: 1;
      .checkbox-icon:after {
        display: block;
      }
    }
  }
}

.form-select {
  padding: 13px 35px 12px 12px;
  
  &:focus{
    outline:0;
  }
  &::-ms-expand {
    display: none;
  }
}

{# /* Disabled controls */ #}

input,
select,
textarea{
  &[disabled],
  &[disabled]:hover,
  &[readonly],
  &[readonly]:hover{
    background-color: #DDD;
    cursor: not-allowed; 
  }
}

.list{
  .list-item-box{
    position: relative;
    width: 100%;
    padding: 20px;
  }
  .radio-button-icons-container{
    display: none;
  }
  .radio-button-label{
    padding-left: 0;
  }
  .list-item .radio-button-content{
    margin: 0;
    border-radius: 0;
  }
  .list-unstyled .radio-button-item:last-child .list-item,
  .list-item:last-child{
    margin-bottom: 0;
  }
}

{# /* // Alerts and notifications */ #}

.alert {
  clear: both;
  padding: 8px;
  border: 1px solid;
  text-align: center;
  @extend %element-margin;
}

.notification-hidden{
  transition: all .1s cubic-bezier(.16,.68,.43,.99);
  opacity: 0;
  @include prefix(transform, translate(0, -10%), webkit ms moz o);
  pointer-events: none;
}
.notification-visible{
  transition: all .5s cubic-bezier(.16,.68,.43,.99);
  opacity: 1;
  @include prefix(transform, translate(0, 0), webkit ms moz o);
}
.notification-floating {
  {% if settings.head_utility == 'searchbox' %}
    margin-top: -60px;
  {% else %}
    margin-top: -15px;
  {% endif %}
}
.notification-arrow-up{
  position: absolute;
  top: -8px;
  right: 5%;
  width: 0;
  height: 0;
  pointer-events: none;
}
.notification-img svg{
  position: absolute;
  top: -4px;
  right: -2px;
}
.notification-close {
  position: absolute;
  top: 5px;
  right: 10px;
  cursor: pointer;
  z-index: 1;
}

{# /* // Progress bar */ #}

.bar-progress {
  position: relative;
  height: 15px;
  border-radius: 15px;
  .bar-progress-active {
    height: 15px;
    width: 0%;
    border-radius: 15px;
  }
  .bar-progress-check {
    position: absolute;
    top: -10px;
    right: -3px;
    width: 32px;
    padding: 3px;
    line-height: 16px;
    text-align: center;
    border-radius: 50%;
    transform: scale(0.5);
    opacity: 0;
    &.active {
      transform: scale(1);
      opacity: 1;
    }
  }
}

.ship-free-rest-message {
  position: relative;
  height: 42px;
  margin: 10px 0;
  .ship-free-rest-text {
    position: absolute;
    top: -5px;
    width: 100%;
    text-align: center;  
    line-height: 36px;
    opacity: 0;
  }
  &.success .bar-progress-success {
    top: 0;
    opacity: 1;
  }
  &.amount .bar-progress-amount {
    top: 0;
    opacity: 1;
  }
  &.condition .bar-progress-condition {
    top: 0;
    opacity: 1;
  }
}



{# /* // Modals */ #}

.modal {
  position: fixed;
  top: 0;
  display: block;
  width: 80%;
  height: 100%;
  padding: 20px;
  -webkit-overflow-scrolling: touch;
  overflow-y: auto;
  @include prefix(transition, all .4s ease-in-out, webkit ms moz o);
  z-index: 20000;
  &-zindex-top{
    z-index: 20001;
  }
  &-img-full{
    width: calc(100% + 40px);
    margin: -20px 0 0 -20px;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
  }
  &-header{
    width: calc(100% + 40px);
    margin: -20px 0px 15px -20px;
    padding: 15px;
    font-size: 20px;
    cursor: pointer;
  }
  &-footer{
    padding: 10px;
    clear: both;
  }
  &-full {
    width: 100%;
  }
  &-docked-md{
    width: 100%;
  }
  &-docked-small{
    width: 80%;
  }
  &-top{
    top: -100%;
  }
  &-fade{
    top: initial;
    bottom: -5%;
    opacity: 0;
  }
  &-bottom{
    top: 100%;
    left: 0;
    opacity: 0;
  }
  &-left{
    left: -100%;
  }
  &-right{
    right: -100%;
    border-radius: 0;
  }
  &-centered{
    height: 100%;
    width: 100%;
    &-small{
      width: 80%;
      height: auto;
      left: 50%;
      @include prefix(transform, translate(-50%, -50%), webkit ms moz o);
      .modal-body{
        min-height: 150px;
        max-height: 400px;
      }
    }
  }
  &.modal-show{
    opacity: 1;
  }
  &-top.modal-show,
  &-bottom.modal-show {
    top: 0;
    &.modal-centered-small{
      top: 50%;
    }
  }
  &-left.modal-show,
  &-left-xs.modal-show {
    left: 0;
  }
  &-right.modal-show {
    right: 0;
  }
  &-fade.modal-show{
    bottom: 0;
    opacity: 1;
  }
  &-close { 
    margin-right: 10px;
    // Cursor pointer added to JS is triggered on IOS
    cursor: pointer;
  }
  .tab-group{
    margin:  0 -10px 15px 0;
  }
}

.modal-overlay{
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #00000047;
  z-index: 10000;
  // Cursor pointer added to JS is triggered on IOS
  cursor: pointer;
  &.modal-zindex-top{
    z-index: 20000;
  }
}

.fancybox-slide--html{
  .fancybox-content  {
    width: 100%;
    height: calc(100% - 70px) ;
    padding: 0;
    @include prefix(transform, translateY(20px), webkit ms moz o);
    background: transparent;
  }
  .fancybox-close-small {
    // Hardcoded neutral color to match non iframe fancybox modal
    color: #ccc!important;
  }
}

.fancybox-toolbar {
  opacity: 1!important;
  visibility: visible!important;
  .fancybox-button {
    display: none!important;
    &.fancybox-button--close{
      display: block!important;
    }
  }
}

.fancybox-close-small {
  display: none!important;
}

{# /* // Tables */ #}

.table{
  width: 100%;
  border-collapse: collapse;
  border-spacing: 0;
  thead{
    th{
      padding: 8px;
      &:first-of-type{
        padding-left: 0;
      }
    }
  }
  td{
    padding: 8px;
    text-align: left;
  }
}

{# /* // Tabs */ #}


.tab-group{
  width: 100vw;
  padding: 0;
  overflow-x: scroll;
  white-space: nowrap;
  .tab{
    display: inline-flex;
    float: none;
    &-link{
      float: left;
      padding: 10px;
      font-size: 12px;
      text-align: center;
      text-transform: uppercase;
    }
  }
}

.tab-panel:not(.active){
  display: none;
}
.tab-panel.active{
  display: block;
}

{# /* // Cards */ #}

.card {
	position: relative;
	display: -ms-flexbox;
	display: flex;
	margin-bottom: 20px;
	-ms-flex-direction: column;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-clip: border-box;
  &-collapse {
    height: 52px;
    padding: 0;
    overflow: hidden;
    border: none;
    @include prefix(transition, all 0.3s ease, webkit ms moz o);
    &-toggle {
      position: absolute;
      top: 6px;
      right: 8px;
      padding: 10px;
      @include prefix(transition, all 0.3s ease, webkit ms moz o);
      &.active {
        transform: rotate(90deg);
      }
    }
    &.active {
      height: calc(100% - 20px);
    }
  }
}

.card-body {
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
	padding: 15px;
}

.card-header {
	padding: 15px;
	margin-bottom: 0;
  &-collapse {
    padding-right: 50px;
    position: relative;
  }
}

.card-footer {
	padding: 15px;
}

/*============================================================================
  #Header and nav
==============================================================================*/

{# /* // Header */ #}

.head-main {
  &.compress {
    .logo-img {
        max-height: 35px;
    }
  }
}

{# /* // Nav */ #}

.modal-nav-hamburger {
  text-align: left;
  padding: 0;
  border-radius: 0;
  .modal-header {
      margin-top: 25px;
      .modal-close {
        margin: 0;
        padding: 5px;
      }
  }
  .modal-close {
    margin: 0 0 0 15px; 
  }
  .navigation-topbar {
    padding: 5px 0;
    margin: 0 0 15px 0;
    font-size: 16px;
  }
}

.nav-primary {
  padding: 0 0 80px;
  .nav-list {
    padding: 10px 0 10px 0;
    margin-top: 0;
    list-style: none;
    .nav-item {
      display: block;
      padding: 0;
      border-top-style: solid;
      border-top-width: 1px;
    }
    .item-with-subitems {
      position: relative;
    }
    .nav-list-link {
      position: relative;
      display: block;
      padding: 15px;
      font-size: 16px;
      font-weight: 500;
      line-height: 20px;
      border-bottom: 0;
    }
    &-arrow {
      position: absolute;
      top: 50%;
      right: 20px;
      margin-top: -10px;
      font-size: 14px;
      cursor: pointer;
    }
    .active .nav-list-arrow {
      transform: rotate(90deg);
    }
    .list-subitems {
      padding: 0;
      list-style: none;
      .nav-list-link {
        font-weight: 400;
      }
    }
  }

}

.nav-secondary {
  position: fixed;
  bottom: 0;
  width: 80%;
  margin-top: 0;
  overflow: hidden;
  .nav-account {
    display: flex;
    margin: 20px 0 0 0;
    padding: 7px 0;
    align-items: center;
    list-style: none;
    box-shadow: 0 9px 5px 9px rgba(0,0,0,0.4);
    .nav-accounts-item {
      display: inline-block;
      margin: 10px;
      font-size: 14px;
    } 
  }
}

.hamburger-panel{
    box-shadow: none;
    .btn-hamburger-close {
        right: 15px;
        top: 6px;
        font-size: 18px;
    }
    .list-items {
        padding: 45px 0 10px;
        .hamburger-panel-link {
            display: block;
            padding: 20px;
            letter-spacing: 1px;
            font-weight: 400;
            border-bottom: 0;
        }
        .list-subitems { 
            padding: 0;
        }
    }
    .hamburger-panel-arrow {
        font-size: 12px;
        &.selected {
            transform: rotate(90deg);
        }
    }
    .hamburger-panel-first-row {
        background: none;
        .mobile-accounts{
            padding: 0 12px;
            .mobile-accounts-item {
                width: auto;
                display: inline-block;
                .mobile-accounts-link {
                    padding: 10px 5px;
                    font-size: 12px;
                    opacity: 0.6;
                }
                &:first-child a:after {
                position: relative;
                right: -7px;
                content: "|";
                }
            }
        }
    }
  &-arrow{
    top: 15px;
    right: 10px;
    margin-top: -10px;
    &.selected i{
      transform-origin: center;
      transform: rotate(180deg);
      -webkit-transform: rotate(180deg);
      -moz-transform: rotate(180deg);
      -ms-transform: rotate(180deg);
      -o-transform: rotate(180deg);
    }
  }
}

.desktop-dropdown::-webkit-scrollbar {
  width: 10px;
}

.desktop-list-subitems {
  padding: 15px 25px 25px 25px;
  text-align: left;
  -webkit-column-count: 5;  
  -webkit-column-gap: 20px;   
  -moz-column-count: 5;   
  -moz-column-gap: 20px;
  column-count: 5;  
  column-gap: 20px;  
  .nav-item {
    display: block;
    margin: 0;
    padding: 0;
    -webkit-column-break-inside: avoid;
    break-inside: avoid;
    .nav-list-link {
      font-weight: 700;
    }
    .list-subitems {
      padding: 0;
      margin: 0 0 35px 0;
      .nav-item {
        .nav-list-link {
          font-weight: 400;
        }
        .list-subitems {
          margin: 0 0 0 8px;
          .nav-list-link {
            padding: 0px 0 0 10px;
            border-left-width: 1px;
            border-left-style: solid;
            line-height: 15px;
            font-size: 12px;
          }
        }
      }
    }
  }
  .nav-list-link {
    display: block;
    margin-bottom: 10px;
    line-height: 20px;
  }
}

.nav-categories-container {
  position: relative;
}
.nav-categories-container:after,
.nav-categories-container:before {
  position: absolute;
  display: block;
  height: 100%;
  width: 20px;
  left: 0;
  top: 0;
  content: "";
}
.nav-categories-container:after {
  right: 0;
  left: auto;
  transform: rotate(180deg);
}
    

{# /* // Utilities */ #}

.subutility-list {
  position: absolute;
  width: max-content;
  top: 70px;
  left: 50%;
  padding: 10px;
  margin: 0;
  list-style: none;
  border-radius: 4px;
  transform: translateX(-50%)!important;
  -webkit-transform: translateX(-50%)!important;
  -ms-transform: translateX(-50%)!important;
  text-align: left;
  z-index:9999;
}

.subutility-list-item {
  padding: 5px;
}

{# /* // Search */ #}

.search-input {
  padding-right: 30px;
}

.search-input[type="search"]::-webkit-search-cancel-button {
  -webkit-appearance:none
}

.search-suggest {
  position: absolute;
  z-index: 99999;
  width: 100%;
  max-height: calc(100vh - 140px);
  border-radius: 6px;
  overflow-y: auto;
  overflow-x: hidden;
  .search-suggest-list {
    margin: 0 0 10px 0;
    padding: 12px 12px 6px 12px;
    .search-suggest-item {
      padding: 10px 15px;
      text-align: left;
      list-style: none;
      .search-suggest-text,
      .search-suggest-name {
        margin-bottom: 5px;
        line-height: 18px;
      }
     .search-suggest-icon {
        margin: 0 10px;
        font-size: 14px;
      }
    }
  }
}

.modal-nav-search {
  border-radius: 0;
}

/*============================================================================
  #Footer
==============================================================================*/

footer {
  margin-top: 20px;
  padding-top: 50px;
  &.section-footer-home {
    @extend %section-margin-invert;
  }
}

{# /* // Nav */ #}

.footer-menu {
  margin: 0 0 35px;
  padding: 0;
  list-style: none;
  &-item{
    display: block;
    margin-bottom: 20px;
  }
  &-link{
    display: block;
  }
}

{# /* // Social */ #}

.social-icon-rounded {
  display: inline-block;
  width: 45px;
  height: 45px;
  margin: 0 10px 10px 0;
  line-height: 45px;
  text-align: center;
  border-radius: 50%;
  vertical-align: top;
  &:last-child {
    margin: 0;
  }
}

{# /* // Legal */ #}

.footer-payments-shipping-logos{
  img {
    max-height: 25px;
    margin: 2px;
  }
}

.powered-by-text {
  display: inline-block;
}

.powered-by-logo {
  display: inline-block;
  width: 125px;
}

.copyright {
  padding-top: 15px;
}

.footer-legal {
  padding: 20px 0;
  font-size: 12px;
}

.footer-logo {
  display: inline-block;
  margin-right: 15px;
  img {
    max-height: 100px;
  }
  &:last-child {
    margin: 0;
  }
}    
   
/*============================================================================
  #Home Page
==============================================================================*/

.section-video-home,
.section-featured-home,
.section-brands-home,
.section-newsletter-home,
.section-instafeed-home {
  @extend %section-margin;
}

.section-banners-home {
  @extend %element-margin;
}

{# /* // Instafeed */ #}

.instafeed-user {
  display: inline-block;
  margin-bottom: 40px;
  max-width: 100%;
  vertical-align: top;
  overflow: hidden;
  text-overflow: ellipsis;
}

.instafeed-link {
  position: relative;
  display: block;
  padding-top: 100%;
  overflow: hidden;
  &:hover,
  &:focus {
    .instafeed-img{
      @include prefix(transform, scale(1.03), webkit ms moz o);
    }
    .instafeed-info {
      opacity: 1;
    }
  }
  .instafeed-img {
    position: absolute;
    top: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
    @include prefix(transition, all 0.8s ease, webkit ms moz o);
  }
  .instafeed-info {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    padding: 0;
    text-align: center;
    opacity: 0;
    @include prefix(transition, all 0.8s ease, webkit ms moz o);
    .instafeed-info-item {
      display: inline-block;
      margin-top: 45%;
    }
  }
}


{# /* // Banners */ #}

.textbanner {
  .textbanner-image.overlay {
    @include prefix(transition, all 0.8s ease, webkit ms moz o);
  }
  &:hover .textbanner-image.overlay,
  &:focus .textbanner-image.overlay {
    @include prefix(transform, scale(1.03), webkit ms moz o);
  }
}

{# /* // Brands */ #}

.section-brands-home {
  position: relative;
  padding: 50px 0;
  text-align: center;
  line-height: 100px;
}

.brand-image {
  display: inline-block;
  max-width: 100%;
  max-height: 100px;
  vertical-align: middle;
  opacity: 0.5;
  @include prefix(transition, all 0.8s ease, webkit ms moz o);
  &:hover {
    opacity: 1;
  }
}

{# /* // Newsletter */ #}

.newsletter {
  form {
    position: relative;
    .newsletter-btn {
      position: absolute;
      top: 10px;
      right: 15px;
      width: 30px;
      height: 30px;
      text-indent: -99999px;
      &.btn {
        z-index: 9;
      }
    }
  } 
}

{# /* // Placeholder */ #}

.placeholder-overlay {
    position: absolute;
    top: 0;
    left: 0;
    z-index: 9;
    width: 100%;
    height: 100%;  
}

.placeholder-info {
  position: relative;
  top: 50%;
  left: 50%;
  width: 330px;
  padding: 30px 25px;
  text-align: center;
  line-height: 18px;
  transform: translate(-50%, -50%);
  box-sizing: border-box;
  .placeholder-description {
    margin: 20px 0;
  }
  .placeholder-button {
    padding: 8px 15px;
  }
}

/*============================================================================
  #Product Grid
==============================================================================*/

{# /* // Filters */ #}

.filters-overlay {
  position: fixed;
  top: 0;
  left: 0;
  z-index: 30000;
  width: 100%;
  height: 100%;
  .filters-updating-message {
    position: absolute;
    top: 50%;
    left: 50%;
    width: 80%;
    text-align: center;
    @include prefix(transform, translate(-50%, -50%), webkit ms moz o);
    * {
      font-size: 24px;
      font-weight: normal;
    }
  }
}

/*============================================================================
  #Product detail
==============================================================================*/

.section-single-product,
.section-fb-comments,
.section-products-related {
  @extend %section-margin;
}

{# /* // Image */ #}

body.compensate-for-scrollbar{overflow:hidden}.fancybox-active{height:auto}.fancybox-is-hidden{left:-9999px;margin:0;position:absolute!important;top:-9999px;visibility:hidden}.fancybox-container{-webkit-backface-visibility:hidden;height:100%;left:0;outline:none;position:fixed;-webkit-tap-highlight-color:transparent;top:0;-ms-touch-action:manipulation;touch-action:manipulation;-webkit-transform:translateZ(0);transform:translateZ(0);width:100%;z-index:99992}.fancybox-container *{box-sizing:border-box}.fancybox-bg,.fancybox-inner,.fancybox-outer,.fancybox-stage{bottom:0;left:0;position:absolute;right:0;top:0}.fancybox-outer{-webkit-overflow-scrolling:touch;overflow-y:auto}.fancybox-bg{background:#1e1e1e;opacity:0;transition-duration:inherit;transition-property:opacity;transition-timing-function:cubic-bezier(.47,0,.74,.71)}.fancybox-is-open .fancybox-bg{opacity:.9;transition-timing-function:cubic-bezier(.22,.61,.36,1)}.fancybox-caption,.fancybox-infobar,.fancybox-navigation .fancybox-button,.fancybox-toolbar{direction:ltr;opacity:0;position:absolute;transition:opacity .25s ease,visibility 0s ease .25s;visibility:hidden;z-index:99997}.fancybox-show-caption .fancybox-caption,.fancybox-show-infobar .fancybox-infobar,.fancybox-show-nav .fancybox-navigation .fancybox-button,.fancybox-show-toolbar .fancybox-toolbar{opacity:1;transition:opacity .25s ease 0s,visibility 0s ease 0s;visibility:visible}.fancybox-infobar{color:#ccc;font-size:13px;-webkit-font-smoothing:subpixel-antialiased;height:44px;left:0;line-height:44px;min-width:44px;mix-blend-mode:difference;padding:0 10px;pointer-events:none;top:0;-webkit-touch-callout:none;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none}.fancybox-toolbar{right:0;top:0}.fancybox-stage{direction:ltr;overflow:visible;-webkit-transform:translateZ(0);transform:translateZ(0);z-index:99994}.fancybox-is-open .fancybox-stage{overflow:hidden}.fancybox-slide{-webkit-backface-visibility:hidden;display:none;height:100%;left:0;outline:none;overflow:auto;-webkit-overflow-scrolling:touch;padding:44px;position:absolute;text-align:center;top:0;transition-property:opacity,-webkit-transform;transition-property:transform,opacity;transition-property:transform,opacity,-webkit-transform;white-space:normal;width:100%;z-index:99994}.fancybox-slide:before{content:"";display:inline-block;font-size:0;height:100%;vertical-align:middle;width:0}.fancybox-is-sliding .fancybox-slide,.fancybox-slide--current,.fancybox-slide--next,.fancybox-slide--previous{display:block}.fancybox-slide--image{overflow:hidden;padding:44px 0}.fancybox-slide--image:before{display:none}.fancybox-slide--html{padding:6px}.fancybox-content{background:#fff;display:inline-block;margin:0;max-width:100%;overflow:auto;-webkit-overflow-scrolling:touch;padding:44px;position:relative;text-align:left;vertical-align:middle}.fancybox-slide--image .fancybox-content{-webkit-animation-timing-function:cubic-bezier(.5,0,.14,1);animation-timing-function:cubic-bezier(.5,0,.14,1);-webkit-backface-visibility:hidden;background:transparent;background-repeat:no-repeat;background-size:100% 100%;left:0;max-width:none;overflow:visible;padding:0;position:absolute;top:0;-webkit-transform-origin:top left;transform-origin:top left;transition-property:opacity,-webkit-transform;transition-property:transform,opacity;transition-property:transform,opacity,-webkit-transform;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;z-index:99995}.fancybox-can-zoomOut .fancybox-content{cursor:zoom-out}.fancybox-can-zoomIn .fancybox-content{cursor:zoom-in}.fancybox-can-pan .fancybox-content,.fancybox-can-swipe .fancybox-content{cursor:-webkit-grab;cursor:grab}.fancybox-is-grabbing .fancybox-content{cursor:-webkit-grabbing;cursor:grabbing}.fancybox-container [data-selectable=true]{cursor:text}.fancybox-image,.fancybox-spaceball{background:transparent;border:0;height:100%;left:0;margin:0;max-height:none;max-width:none;padding:0;position:absolute;top:0;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;width:100%}.fancybox-spaceball{z-index:1}.fancybox-slide--iframe .fancybox-content,.fancybox-slide--map .fancybox-content,.fancybox-slide--pdf .fancybox-content,.fancybox-slide--video .fancybox-content{height:100%;overflow:visible;padding:0;width:100%}.fancybox-slide--video .fancybox-content{background:#000}.fancybox-slide--map .fancybox-content{background:#e5e3df}.fancybox-slide--iframe .fancybox-content{background:#fff}.fancybox-iframe,.fancybox-video{background:transparent;border:0;display:block;height:100%;margin:0;overflow:hidden;padding:0;width:100%}.fancybox-iframe{left:0;position:absolute;top:0}.fancybox-error{background:#fff;cursor:default;max-width:400px;padding:40px;width:100%}.fancybox-error p{color:#444;font-size:16px;line-height:20px;margin:0;padding:0}.fancybox-button{background:rgba(30,30,30,.6);border:0;border-radius:0;box-shadow:none;cursor:pointer;display:inline-block;height:44px;margin:0;padding:10px;position:relative;transition:color .2s;vertical-align:top;visibility:inherit;width:44px}.fancybox-button,.fancybox-button:link,.fancybox-button:visited{color:#ccc}.fancybox-button:hover{color:#fff}.fancybox-button:focus{outline:none}.fancybox-button.fancybox-focus{outline:1px dotted}.fancybox-button[disabled],.fancybox-button[disabled]:hover{color:#888;cursor:default;outline:none}.fancybox-button div{height:100%}.fancybox-button svg{display:block;height:100%;overflow:visible;position:relative;width:100%}.fancybox-button svg path{fill:currentColor;stroke-width:0}.fancybox-button--fsenter svg:nth-child(2),.fancybox-button--fsexit svg:nth-child(1),.fancybox-button--pause svg:nth-child(1),.fancybox-button--play svg:nth-child(2){display:none}.fancybox-progress{background:#ff5268;height:2px;left:0;position:absolute;right:0;top:0;-webkit-transform:scaleX(0);transform:scaleX(0);-webkit-transform-origin:0;transform-origin:0;transition-property:-webkit-transform;transition-property:transform;transition-property:transform,-webkit-transform;transition-timing-function:linear;z-index:99998}.fancybox-close-small{background:transparent;border:0;border-radius:0;color:#ccc;cursor:pointer;opacity:.8;padding:8px;position:absolute;right:-12px;top:-44px;z-index:401}.fancybox-close-small:hover{color:#fff;opacity:1}.fancybox-slide--html .fancybox-close-small{color:currentColor;padding:10px;right:0;top:0}.fancybox-slide--image.fancybox-is-scaling .fancybox-content{overflow:hidden}.fancybox-is-scaling .fancybox-close-small,.fancybox-is-zoomable.fancybox-can-pan .fancybox-close-small{display:none}.fancybox-navigation .fancybox-button{background-clip:content-box;height:100px;opacity:0;position:absolute;top:calc(50% - 50px);width:70px}.fancybox-navigation .fancybox-button div{padding:7px}.fancybox-navigation .fancybox-button--arrow_left{left:0;padding:31px 26px 31px 6px}.fancybox-navigation .fancybox-button--arrow_right{padding:31px 6px 31px 26px;right:0}.fancybox-caption{bottom:0;color:#eee;font-size:14px;font-weight:400;left:0;line-height:1.5;padding:25px 44px;right:0;text-align:center;z-index:99996}.fancybox-caption:before{background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAD6CAQAAADKSeXYAAAAYklEQVQoz42RwQ3AMAgDjfcfup8WoRykfBAK5mQHKSz5rbXJPis1hjiV3CIqgG0hLZPkVkA4p4x5oR1bVeDrdCLrW2Q0D5bcwY3TGMHbdw3mPRuOtaspYP1w//G1OIcW148H0DMCqI/3mMMAAAAASUVORK5CYII=);background-repeat:repeat-x;background-size:contain;bottom:0;content:"";display:block;left:0;pointer-events:none;position:absolute;right:0;top:-44px;z-index:-1}.fancybox-caption a,.fancybox-caption a:link,.fancybox-caption a:visited{color:#ccc;text-decoration:none}.fancybox-caption a:hover{color:#fff;text-decoration:underline}.fancybox-loading{-webkit-animation:a 1s linear infinite;animation:a 1s linear infinite;background:transparent;border:4px solid #888;border-bottom-color:#fff;border-radius:50%;height:50px;left:50%;margin:-25px 0 0 -25px;opacity:.7;padding:0;position:absolute;top:50%;width:50px;z-index:99999}@-webkit-keyframes a{to{-webkit-transform:rotate(1turn);transform:rotate(1turn)}}@keyframes a{to{-webkit-transform:rotate(1turn);transform:rotate(1turn)}}.fancybox-animated{transition-timing-function:cubic-bezier(0,0,.25,1)}.fancybox-fx-slide.fancybox-slide--previous{opacity:0;-webkit-transform:translate3d(-100%,0,0);transform:translate3d(-100%,0,0)}.fancybox-fx-slide.fancybox-slide--next{opacity:0;-webkit-transform:translate3d(100%,0,0);transform:translate3d(100%,0,0)}.fancybox-fx-slide.fancybox-slide--current{opacity:1;-webkit-transform:translateZ(0);transform:translateZ(0)}.fancybox-fx-fade.fancybox-slide--next,.fancybox-fx-fade.fancybox-slide--previous{opacity:0;transition-timing-function:cubic-bezier(.19,1,.22,1)}.fancybox-fx-fade.fancybox-slide--current{opacity:1}.fancybox-fx-zoom-in-out.fancybox-slide--previous{opacity:0;-webkit-transform:scale3d(1.5,1.5,1.5);transform:scale3d(1.5,1.5,1.5)}.fancybox-fx-zoom-in-out.fancybox-slide--next{opacity:0;-webkit-transform:scale3d(.5,.5,.5);transform:scale3d(.5,.5,.5)}.fancybox-fx-zoom-in-out.fancybox-slide--current{opacity:1;-webkit-transform:scaleX(1);transform:scaleX(1)}.fancybox-fx-rotate.fancybox-slide--previous{opacity:0;-webkit-transform:rotate(-1turn);transform:rotate(-1turn)}.fancybox-fx-rotate.fancybox-slide--next{opacity:0;-webkit-transform:rotate(1turn);transform:rotate(1turn)}.fancybox-fx-rotate.fancybox-slide--current{opacity:1;-webkit-transform:rotate(0deg);transform:rotate(0deg)}.fancybox-fx-circular.fancybox-slide--previous{opacity:0;-webkit-transform:scale3d(0,0,0) translate3d(-100%,0,0);transform:scale3d(0,0,0) translate3d(-100%,0,0)}.fancybox-fx-circular.fancybox-slide--next{opacity:0;-webkit-transform:scale3d(0,0,0) translate3d(100%,0,0);transform:scale3d(0,0,0) translate3d(100%,0,0)}.fancybox-fx-circular.fancybox-slide--current{opacity:1;-webkit-transform:scaleX(1) translateZ(0);transform:scaleX(1) translateZ(0)}.fancybox-fx-tube.fancybox-slide--previous{-webkit-transform:translate3d(-100%,0,0) scale(.1) skew(-10deg);transform:translate3d(-100%,0,0) scale(.1) skew(-10deg)}.fancybox-fx-tube.fancybox-slide--next{-webkit-transform:translate3d(100%,0,0) scale(.1) skew(10deg);transform:translate3d(100%,0,0) scale(.1) skew(10deg)}.fancybox-fx-tube.fancybox-slide--current{-webkit-transform:translateZ(0) scale(1);transform:translateZ(0) scale(1)}@media (max-height:576px){.fancybox-caption{padding:12px}.fancybox-slide{padding-left:6px;padding-right:6px}.fancybox-slide--image{padding:6px 0}.fancybox-close-small{right:-6px}.fancybox-slide--image .fancybox-close-small{background:#4e4e4e;color:#f2f4f6;height:36px;opacity:1;padding:6px;right:0;top:0;width:36px}}.fancybox-share{background:#f4f4f4;border-radius:3px;max-width:90%;padding:30px;text-align:center}.fancybox-share h1{color:#222;font-size:35px;font-weight:700;margin:0 0 20px}.fancybox-share p{margin:0;padding:0}.fancybox-share__button{border:0;border-radius:3px;display:inline-block;font-size:14px;font-weight:700;line-height:40px;margin:0 5px 10px;min-width:130px;padding:0 15px;text-decoration:none;transition:all .2s;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;white-space:nowrap}.fancybox-share__button:link,.fancybox-share__button:visited{color:#fff}.fancybox-share__button:hover{text-decoration:none}.fancybox-share__button--fb{background:#3b5998}.fancybox-share__button--fb:hover{background:#344e86}.fancybox-share__button--pt{background:#bd081d}.fancybox-share__button--pt:hover{background:#aa0719}.fancybox-share__button--tw{background:#1da1f2}.fancybox-share__button--tw:hover{background:#0d95e8}.fancybox-share__button svg{height:25px;margin-right:7px;position:relative;top:-1px;vertical-align:middle;width:25px}.fancybox-share__button svg path{fill:#fff}.fancybox-share__input{background:transparent;border:0;border-bottom:1px solid #d7d7d7;border-radius:0;color:#5d5b5b;font-size:14px;margin:10px 0 0;outline:none;padding:10px 15px;width:100%}.fancybox-thumbs{background:#ddd;bottom:0;display:none;margin:0;-webkit-overflow-scrolling:touch;-ms-overflow-style:-ms-autohiding-scrollbar;padding:2px 2px 4px;position:absolute;right:0;-webkit-tap-highlight-color:transparent;top:0;width:212px;z-index:99995}.fancybox-thumbs-x{overflow-x:auto;overflow-y:hidden}.fancybox-show-thumbs .fancybox-thumbs{display:block}.fancybox-show-thumbs .fancybox-inner{right:212px}.fancybox-thumbs__list{font-size:0;height:100%;list-style:none;margin:0;overflow-x:hidden;overflow-y:auto;padding:0;position:absolute;position:relative;white-space:nowrap;width:100%}.fancybox-thumbs-x .fancybox-thumbs__list{overflow:hidden}.fancybox-thumbs-y .fancybox-thumbs__list::-webkit-scrollbar{width:7px}.fancybox-thumbs-y .fancybox-thumbs__list::-webkit-scrollbar-track{background:#fff;border-radius:10px;box-shadow:inset 0 0 6px rgba(0,0,0,.3)}.fancybox-thumbs-y .fancybox-thumbs__list::-webkit-scrollbar-thumb{background:#2a2a2a;border-radius:10px}.fancybox-thumbs__list a{-webkit-backface-visibility:hidden;backface-visibility:hidden;background-color:rgba(0,0,0,.1);background-position:50%;background-repeat:no-repeat;background-size:cover;cursor:pointer;float:left;height:75px;margin:2px;max-height:calc(100% - 8px);max-width:calc(50% - 4px);outline:none;overflow:hidden;padding:0;position:relative;-webkit-tap-highlight-color:transparent;width:100px}.fancybox-thumbs__list a:before{border:6px solid #ff5268;bottom:0;content:"";left:0;opacity:0;position:absolute;right:0;top:0;transition:all .2s cubic-bezier(.25,.46,.45,.94);z-index:99991}.fancybox-thumbs__list a:focus:before{opacity:.5}.fancybox-thumbs__list a.fancybox-thumbs-active:before{opacity:1}@media (max-width:576px){.fancybox-thumbs{width:110px}.fancybox-show-thumbs .fancybox-inner{right:110px}.fancybox-thumbs__list a{max-width:calc(100% - 10px)}}

.user-content img {
	max-width: 100%;
	height: auto !important;
}

.social-share-button {
  margin: 5px;
  &:hover,
  &:focus{
    opacity: 0.8;
  }
}

/*============================================================================
  #Cart detail
==============================================================================*/


{# /* Table */ #}

.cart-table-row{
  padding: 10px 0;
}

.cart-item{
  position: relative;
  @extend %element-margin;
  &-name{
    float: left;
    width: 100%;
    margin-bottom: 5px;
    padding: 0 40px 10px 0;
    font-weight: normal;
  }
  &-subtotal{
    float: right;
    margin: 10px 0;
    text-align: right;
    font-weight: normal;
  }
  &-btn{
    padding: 6px;
    display: inline-block;
    background: transparent;
    font-size: 16px;
    opacity: 0.8;
    &:hover{
      opacity: 0.6;
    }
  }
  &-input{
    display: inline-block;
    width: 40px;
    height: 30px;
    font-size: 16px;
    text-align: center;
    -moz-appearance:textfield;
    &::-webkit-outer-spin-button,
    &::-webkit-inner-spin-button{
      -webkit-appearance: none;
    }
  }
  .fa-cog{
    display: none;
  }
  &-spinner{
    position: absolute;
    left: 50%;
    width: 40px;
    margin-left: -20px;
    text-align: center;
  }
  &-delete{
    position: absolute;
    right: 0;
    .btn{
      padding-right:0; 
    }
  }
}

.cart-quantity-input-container i{
  padding: 6px 14px;
}

.cart-unit-price{
  float: left;
  width: 100%;
  margin: 5px 0 2px 0;
}


{# /* // Totals */ #}

.cart-subtotal{
  float: right;
  clear: both;
  margin: 0 0 10px 0;
}
.total-promotions-row{
  display: flex;
  -ms-flex-wrap: wrap;
  flex-wrap: wrap;
  margin-right: -15px;
  margin-left: -15px;
}
.cart-total{
  clear: both;
  margin: 10px 0;
  font-weight: bold;
}

.cart-promotion-detail,
.cart-promotion-number{
  -ms-flex-preferred-size: 0;
  flex-basis: 0;
  -ms-flex-positive: 1;
  flex-grow: 1;
  max-width: 100%;
  position: relative;
  width: 100%;
  min-height: 1px;
  padding-right: 15px;
  padding-left: 15px;
}

.cart-promotion-number{
  text-align: right;
  font-weight: bold;
}

/*============================================================================
  #Contact page
==============================================================================*/

.contact-page {
  @extend %section-margin;
}

.contact-item {
  position: relative;
  padding-left: 30px;
  &-icon {
    position: absolute;
    left: 0;
  }
}

{#/*============================================================================
  #Media queries
==============================================================================*/ #}

{# /* // Min width 768px */ #}

@media (min-width: 768px) { 

  {# /* //// Components */ #}

  {# /* Modals */ #}

  .modal{
    &-centered{
      left: 10%;
      height: 80%;
      width: 80%;
      margin: 5% auto;
      &-small{
        left: 50%;
        width: 40%;
        height: auto;
        max-height: 80%;
        margin: 0;
      }
    }
    &-docked-md{
      width: 500px;
    }
    &-docked-small{
      width: 350px;
    }
    &-right{
      border-radius: 6px 0 0 6px;
    }
    &-bottom-md{
      top: 100%;
      left: 0;
      right: 0;
      border-radius: 10px;
      opacity: 0;
      &.modal-show{
        top: 0;
      }
    }
  }
  .modal-close { 
    position: absolute;
    top: 10px;
    right: 15px;
    width: 32px;
    height: 32px;
    padding: 0 9px;
    margin-right: 0;
    line-height: 30px;
    vertical-align: middle;
    cursor: pointer;
  }

  .fancybox-slide--html .fancybox-content{
    width: 85%;
    height: auto;
    padding: 44px;
  }

  {# /* Notifications */ #}

  .notification-floating {
    margin-top: -10px;
  }

  .notification-arrow-up{
    right: calc(32% / 2);
    margin-right: -30px;
  }

  {# /* Forms */ #}

  .checkbox-container .checkbox-text{
    padding-top: 3px;
  }

  {# /* Tabs */ #}

  .tab-group{
    width: calc(100% + 20px);
    overflow-x: auto;
    white-space: normal;
    .tab{
      float: left;
    }
  }

  .head-main {
    &.compress {
      .logo-img {
          max-height: 50px;
      }
    }
  }


  {# /* //// Footer */ #}

  .copyright {
    padding: 0;
  }
}

{#/*============================================================================
  #Critical path utilities
==============================================================================*/#}

.visible-when-content-ready{
  visibility: visible!important;
}
.display-when-content-ready{
  display: block!important;
}
