module PostsHelper
    
   def user_is_authorized_for_post?(post)
        current_user && (current_user == post.user || current_user.admin? or current_user.moderator? )
   end   
    
end
