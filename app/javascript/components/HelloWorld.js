import React from "react"


export default class HelloWorld extends React.Component {
  render () {
    return (
      <h1>
        Greeting: {this.props.greeting}
      </h1>
    );
  }
}
