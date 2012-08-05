<%@ page session="false" %><%
Throwable t = (Throwable) request.getAttribute("javax.servlet.error.exception");
String msgHeader = "__MSG__EMAIL_VERIFY_ERROR_SYSTEM_ERROR_HEADER__";
String msg = "__MSG__EMAIL_VERIFY_ERROR_SYSTEM_ERROR_MSG__";

int errorCode = 500;

boolean resend = false;

if (com.rsmart.oae.user.api.emailverify.InvalidLinkEmailVerificationException.class.isAssignableFrom(t.getClass())) {
  msgHeader = "__MSG__EMAIL_VERIFY_ERROR_INVALID_URL_HEADER__";
  msg = "__MSG__EMAIL_VERIFY_ERROR_INVALID_URL_MSG__";
  resend = true;
}
else if (com.rsmart.oae.user.api.emailverify.NotLoggedInEmailVerificationException.class.isAssignableFrom(t.getClass())) {
  msgHeader = "__MSG__EMAIL_VERIFY_ERROR_NOT_LOGGED_IN_HEADER__";
  msg = "__MSG__EMAIL_VERIFY_ERROR_NOT_LOGGED_IN_MSG__";
  errorCode = 403;
}
else if (com.rsmart.oae.user.api.emailverify.WrongUserEmailVerificationException.class.isAssignableFrom(t.getClass())) {
  msgHeader = "__MSG__EMAIL_VERIFY_ERROR_WRONG_USER_HEADER__";
  msg = "__MSG__EMAIL_VERIFY_ERROR_WRONG_USER_MSG__";
  errorCode = 403;
}

response.setStatus(errorCode);
%><!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
<!--  <%= t.toString() %> -->
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <!-- Sakai 3 R&amp;D - Access denied -->
        <title></title>

        <!-- Sakai Core CSS -->
        <link rel="stylesheet" type="text/css" href="/dev/css/sakai/main.css" />
        <link rel="stylesheet" type="text/css" href="/dev/css/sakai/sakai.corev1.css" />

        <!-- Sakai Error CSS -->
        <link rel="stylesheet" type="text/css" href="/dev/css/sakai/sakai.error.css" />

    </head>

    <body class="fl-centered error<%= errorCode %> i18nable">
    
        <div class="fl-container-flex header s3d-header">
            <div class="s3d-navigation-container">
                <div id="widget_topnavigation" class="widget_inline"></div>
            </div>
            <div class="fl-fix fl-centered fixed-container s3d-fixed-container">
                <div class="s3d-container-shadow-left"><!----></div>
                <div class="s3d-container-shadow-right"><!----></div>
                <div class="s3d-page-header">
                    <div id="widget_institutionalskinning" class="widget_inline"></div>
                </div>
            </div>
        </div>
        <div class="fl-fix fl-centered fixed-container s3d-main-container">
            <div id="error_content">
                <div id="error_content_second_column">
                    <div id="error_sign_in_button">
                        <p class="error_signin_button"><button>__MSG__SIGN_IN__</button></p>
                        <p>__MSG__NO_ACCOUNT__ <a class="s3d-regular-links s3d-bold" href="/register">__MSG__SIGN_UP__</a></p>
                    </div>
                    <div class="error_content_second_column_box">
                        <div class="s3d-contentpage-title">__MSG__ARE_YOU_LOOKING_FOR__</div>
                        <div id="error_content_second_column_box_container">
                            <div class="error_content_second_column_box_item_container">
                                <div class="error_content_second_column_box_item_content">
                                    <a class="s3d-regular-links s3d-bold" href="/search#l=content">__MSG__CONTENT__</a>
                                </div>
                            </div>
                            <hr class="s3d-split-line fl-push" />
                            <div class="error_content_second_column_box_item_container">
                                <div class="error_content_second_column_box_item_content">
                                    <a class="s3d-regular-links s3d-bold" href="/search#l=people">__MSG__PEOPLE__</a>
                                </div>
                            </div>
                            <hr class="s3d-split-line fl-push" />
                            <div id="error_second_column_links_template" style="display:none"><!--
                            {for w in worlds}
                                <div class="error_content_second_column_box_item_container">
                                    <div class="error_content_second_column_box_item_content">
                                        <a class="s3d-regular-links s3d-bold" href="/search#l=\${w.id}">\${w.label}</a>
                                    </div>
                                </div>
                                {if !w.last}
                                    <hr class="s3d-split-line fl-push" />
                                {/if}
                            {/for}
                            <div class="error_content_second_column_box_footer"></div>
                            --></div>
                        </div>
                    </div>

                    <div class="error_content_second_column_box browse_cats">
                        <div class="s3d-contentpage-title">__MSG__BROWSE_CATEGORIES__</div>
                        <div id="error_content_second_column_box_browse_container">
                            <div class="error_content_second_column_box_item_container">
                                <div class="error_content_second_column_box_item_content">
                                    <p>__MSG__YOU_CAN_BROWSE_THIS_INSTITUTION__ <a href="/categories"><span class="error_browse_cats"><span id="error_browse_category_number"></span> __MSG__CATEGORIES_LC__</span></a> __MSG__WHERE_YOU_CAN_CONNECT_WITH_PEOPLE_VIEW_COURSE_DETAILS_SEARCH_FOR_CONTENT_AND_JOIN_GROUPS__</p>
                                </div>
                            </div>
                         <div class="error_content_second_column_box_footer">
                            <a href="/categories" id="error_browse_categories_button">
                                <button class="s3d-button s3d-overlay-button">__MSG__BROWSE_CATEGORIES__</button>
                            </a>
                         </div>
                        </div>
                    </div>
                </div>
                <div id="error_content_first_column">
                    <img src="/dev/images/<%= errorCode %>_sinking.png" alt="<%= errorCode %> sinking" />
                    <div id="error_content_first_column_content">
                        <h1><%= msgHeader %></h1>
                        <h3 class="first"><%= msg %></h3>

                        <h3>__MSG__WHAT_TO_DO_NOW_HERE_ARE_SOME_SUGGESTIONS__</h3>
                        <div>
                            <input type="text" title="__MSG__SEARCH__" value="" class="input" id="errorsearch_text" placeholder="__MSG__SEARCH__" maxlength="255">
                        </div>

                        <div id="error_page_links_container"></div>
                        <div id="error_page_links_template" style="display:none"><!--
                            <ul>
                                {for w in links.whatToDo}
                                    <li><a class="s3d-regular-links s3d-bold" href="\${w.url}">\${sakai.api.i18n.General.getValueForKey(w.title)}</a></li>
                                {/for}
                                <li><a href="{if document.referrer === ""}/{else}\${document.referrer}{/if}" class="s3d-regular-links s3d-bold">__MSG__GO_BACK_BY_USING_YOUR_BROWSER_BACK_BUTTON__</a></li>
                            </ul>

                            {if links.getInTouch && links.getInTouch.length > 0}
                                <h3>__MSG__GET_IN_TOUCH__</h3>
                                <ul>
                                    {for g in links.getInTouch}
                                        <li><a class="s3d-regular-links s3d-bold" href="\${g.url}">\${sakai.api.i18n.General.getValueForKey(g.title)}</a></li>
                                    {/for}
                                </ul>
                            {/if}
                        --></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- FOOTER WIDGET -->
        <div id="widget_footer" class="widget_inline footercontainer"></div>

        <!-- Dependency JS -->
        <script data-main="/dev/lib/sakai/sakai.dependencies.js" src="/dev/lib/jquery/require.js"></script>

        <!-- 403 JS -->
        <script>require(["/dev/javascript/sakai.403.js"]);</script>
        <!-- JAVASCRIPT -->

    </body>
</html>