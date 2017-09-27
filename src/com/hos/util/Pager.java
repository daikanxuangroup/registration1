package com.hos.util;

import java.util.List;

/**
 * 封装分页数据
 */
public class Pager<T> {
  private List<T> rows;
  private int total;

  public List<T> getRows() {
    return rows;
  }

  public void setRows(List<T> rows) {
    this.rows = rows;
  }

  public int getTotal() {
    return total;
  }

  public void setTotal(int total) {
    this.total = total;
  }
}
