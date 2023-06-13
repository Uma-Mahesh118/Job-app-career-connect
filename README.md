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


<h3 class="text-center">Your Job Posts</h3>
<div class="text-center">
    <%= link_to 'Create a Job Post', new_post_path, { :class => "btn btn-primary"}%>
</div>

<div class="container p-3">
    
    <table class="table table-bordered border-primary table-hover">
        <thead class="table-dark"> 
            <tr>
            <th scope="col"> Job Name </th>
            <th scope="col"> Description </th>
            <th scope="col"> Skills </th>
            <th scope="col"> Candidates Matched </th>
            <th scope="col"> Actions </th>
            </tr>
        </thead>
        <tbody>
            <% @posts.each do |post| %>
                <tr>
                    <td > <%= post.name%> </th>
                    <td > <%= truncate(post.description, length: 15)%>...</th>
                    <td >
                        <% if post.skills.any? %>
                            <%= post.skills.first%>
                        <% else %>
                            <strong>No skills Required </strong>
                        <% end %>
                    </td>
                    <td > n Candidates Matched</td>
                    <td> 
                        <%= link_to 'Show', post_path(post), {:class=>"btn btn-success btn-sm"} %>
                        <% if logged_in? && ( post.company == current_user ) %>
                            <%= link_to 'Edit', edit_post_path(post), {:class=>"btn btn-sm btn-info"}%> 
                            <%= button_to 'Delete', post_path(post), {method: :delete , :class=>"btn btn-sm btn-danger"}%>
                        <%end%>
                    </td>
                </tr>
            <% end %>
        </tbody>
        </table>


    
</div>