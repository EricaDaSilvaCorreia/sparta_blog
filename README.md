# Sparta_Blog

**By : Erica P da Silva Correia**

#### Work description :

1. Adding/Updating/Connecting User to Comments
2. Add Styling.
3. Add Validations.
4. **Bonus** : Add another column to a resource & add the relevant links.
5. **Bonus** : Turn the new comments page into a modal or form on the blog page.


#### Tech Used :
**Ruby, Rails, Bootstrap, SCSS**

-----
##### how to download :


1. go to the github page [**https://github.com/EricaDaSilvaCorreia**](https://github.com/EricaDaSilvaCorreia)
2. Click repositories and select the repository [**sparta_blog**](https://github.com/EricaDaSilvaCorreia/sparta_blog)
3. Click 'Clone or Download'
4. Choose between **Open in Desktop**, **Download ZIP**, **Clone with SSH**, **Clone with HTTPs**

-----

##### how to seed the data :


1. If rails is not installed then start terminal and input: gem install rails
2. Open file in Atom
3. Open terminal in Atom and enter: rake db:create
4. Enter: rake db:seed

-----

##### Challenges :

This assignment felt like I was playing operation but whenever I tried to remove the toilet from the stomach the frog in the heart would buzz. Linking the comments and the user was fairly okay but then I decided to do some more linking and fell into a mini linking rabbit hole...? 

I know I didn't need to. Well, I know now that I didn't need to, but essentially after I linked the comments to the user page, and to the edit form, I decided why not link the comments on the user page to the blog and vice versa.

ha ha.

So I started at the user page:

~~~
<p>
  <strong>Comments:</strong>
  <% @user.blogs.each do |blog|%>
    <ul class="list-group">
      <%= link_to blog_url do %>
          <li class="list-group-item"><%= blog.comments %></li>
      <% end %>
    </ul>
  <% end %>
</p>

~~~

The problem with this was that it wasn't giving me the body of the comment but it was giving me the comment number(the active record, not sure what the right term is). So I changed it around a few times, added .body to the blog.comments but it still wouldn't work the way I wanted it to. So I decided to try what I have on the user show page (see app/views/users/show.html.erb line 30 to line 43) and that worked. But it was like closing that door opened a window and the errors just kept coming from all over the place. at one point it wouldn't even recognise the .fullname. 

Then I realised that I was trying to make rails make sense according to what I thought was the logicall way forward instead of reading through every single line as well as everything the angry red page was telling me.

**Contrariwise, if it was so, it might be; and if it were so it would be; but as it isn't, it ain't. That's logic. Thanks Lewis Caroll, rails makes a lot more sense now.**

Another challenge I had (more curioustiy than a challenge really) was the redirect_to in the edit form. I got a bit curious about how it worked and if I could make it take me back to the previous url after editting as opposed to how in the previous MAAK (12) it seemed to redirect me to the blog regardless of where I was previously (user or blog) so I made a little test branch (honestly did not want to ruin the delicate balance I had going on in dev. And yaay git work-flow right?) and after trying some stuff out (if statements quickly proved to be the wrong way to go about things, so I started thinking arrays) and googling around I found a way to store the previous url in an array while editing comment and and return to it + delete from array + see updated comment after saving. Happy to report it works at the moment and I really hope it still works when you're trying it out.

I also tried the modal task but didn't quite get it.

-----

##### Take-Aways :

I'm pretty happy with my progress. Wasn't as happy with my other assignments this week but I think it had more to do with the fact that I understood what I was doing but I was still confused at the same time. It is an overwhelming subject but I feel like this assignment really helped make some of the innerworkings a bit clearer and going through everything from the beginning, step by step was also a huge help in terms of making a mental map for rails. But as always I still think I need tons of practice before I get the hang of it. According to the northern-line the first step is to take one.

I give it a 7/10. 

-----
