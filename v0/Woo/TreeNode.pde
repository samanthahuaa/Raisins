class TreeNode {
  // inst vars
  Pokemon cargo;
  TreeNode _lt;
  TreeNode _rt;

  //constructors
  TreeNode( Pokemon initValue )
  {
    cargo = initValue;
  }

  TreeNode( Pokemon initValue, TreeNode initLeft, TreeNode initRight )
  {
    cargo = initValue;
    _lt = initLeft;
    _rt = initRight;
  }

  TreeNode getLeft() {
    return _lt;
  }

  TreeNode getRight() {
    return _rt;
  }

  Pokemon getValue() {
    return cargo;
  }

  void setLeft(TreeNode newVal) {
    _lt = newVal;
  }

  void setRight(TreeNode newVal) {
    _rt = newVal;
  }

}
