# 构建阶段：用于复制文件，避免直接在最终镜像中操作
FROM alpine:latest as builder

WORKDIR /app

# 复制网站源文件
COPY . .

# 可选：验证文件是否存在（调试用）
RUN ls -la

# 第二阶段：最终运行的Nginx镜像
FROM nginx:1.21-alpine

# 删除默认配置文件
RUN rm -rf /etc/nginx/conf.d/default.conf

# 从构建阶段复制网站文件到Nginx静态资源目录
COPY --from=builder /app /usr/share/nginx/html

# 添加自定义Nginx配置文件（替换默认配置）
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 暴露80端口
EXPOSE 80

# 启动Nginx前台模式运行
CMD ["nginx", "-g", "daemon off;"]