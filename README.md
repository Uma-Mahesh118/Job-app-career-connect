# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

by <%= article.user.username %>
                        <hr>
                                <h5> Categories: </h5>
                                <% if article.categories.any? %>
                                    <div class="mt-2"><%= render article.categories %></div> 
                                <% end %>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title"> <%= link_to article.title, article_path(article), {:class=>"text-success"} %></h5>
                                <p class="card-text"> <%= truncate(article.description, length: 50)%></p>
                                <%= link_to 'Show', article_path(article), {:class=>"btn btn-outline-success"} %>
                                <% if logged_in? && ( article.user == current_user || current_user.admin? ) %>
                                    <%= link_to 'Edit', edit_article_path(article), {:class=>"btn btn-outline-info"}%> 
                                    <%= button_to 'Delete', article_path(article), {method: :delete , :class=>"btn btn-outline-danger"}%>
                                <%end%>
                            </div> 
                            <div class="card-footer text-muted">
                                <small> Created <%=time_ago_in_words(article.created_at)%> ago, Edited <%=time_ago_in_words(article.updated_at)%> </small>
                            </div>
                        </div>
                    </div>
                </div>
            <% end %>