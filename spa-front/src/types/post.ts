export type Post = {
    title: string;
    body: string;
    userName: string;
    createdAt: string;
  }
  
export type PostForRequest = Pick<Post, 'title' | 'body'>