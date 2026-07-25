<?php

namespace App\Policies;

use App\Models\Article;
use App\Models\User;

class ArticlePolicy
{
    /**
     * Create a new policy instance.
     */
    public function __construct()
    {
}
          public function update(User $user, Article $article): bool
    {
        return $user->id === $article->user_id;
    }
    public function delete(User $user, Article $article)
{
    // Verifica che l'utente sia il proprietario dell'articolo
    return $user->id === $article->user_id;
   // return true;
}

    
}
