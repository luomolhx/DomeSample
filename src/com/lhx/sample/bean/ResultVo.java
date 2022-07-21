package com.lhx.sample.bean;

import lombok.Data;

/**
 * @author luomo
 * @create 2022-07-21 1:36
 */
@Data
public class ResultVo {
    private boolean isOK;
    private String message;
    private String url;
}
