import React from "react";
import { configure } from "enzyme";
import Adapter from "@wojtekmaj/enzyme-adapter-react-17";
configure({ adapter: new Adapter() });
import { mount, render, shallow } from "enzyme";
import Todos from "./Todos";

describe("Test TODO app", () => {
  test("renders without crashing", () => {
    shallow(<Todos />);
  });

  test("renders add button", () => {
    const wrapper = shallow(<Todos />);
    expect(wrapper.contains("Add")).toEqual(true);
  });
});
