import React, { Component } from 'react';
import Post from './Post'; // This path is correct because Post.js is now in the same 'src' directory as Posts.js

class Posts extends Component {
  constructor(props) {
    super(props);
    this.state = {
      posts: [],
      hasError: false,
      error: null,
      errorInfo: null
    };
  }

  loadPosts = async () => {
    try {
      const response = await fetch('https://jsonplaceholder.typicode.com/posts');
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const data = await response.json();
      this.setState({ posts: data });
    } catch (error) {
      console.error("Failed to fetch posts:", error);
    }
  }

  componentDidMount() {
    this.loadPosts();
  }

  static getDerivedStateFromError(error) {
    return { hasError: true };
  }

  componentDidCatch(error, errorInfo) {
    console.error("Error caught by componentDidCatch:", error, errorInfo);
    this.setState({
      error: error,
      errorInfo: errorInfo
    });
    alert("An error occurred in a component! Check console for details.");
  }

  render() {
    if (this.state.hasError) {
      return (
        <div style={{ color: 'red', border: '1px solid red', padding: '10px', margin: '20px', textAlign: 'center' }}>
          <h1>Something went wrong.</h1>
          <p>{this.state.error && this.state.error.toString()}</p>
        </div>
      );
    }

    const { posts } = this.state;
    return (
      <div style={{ padding: '20px', maxWidth: '800px', margin: '0 auto' }}>
        <h2>Blog Posts</h2>
        {posts.length > 0 ? (
          posts.map(post => (
            <Post key={post.id} title={post.title} body={post.body} />
          ))
        ) : (
          <p>Loading posts or no posts available...</p>
        )}
      </div>
    );
  }
}

export default Posts;