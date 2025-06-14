# 使用Nginx作为基础镜像
FROM nginx:1.21-alpine

# 删除默认的Nginx配置
RUN rm /etc/nginx/conf.d/default.conf

# 添加自定义Nginx配置
COPY nginx.conf /etc/nginx/conf.d/

# 构建 personal-site 镜像并将其内容复制到 Nginx 默认目录
COPY --from=personal-site /usr/share/nginx/html /usr/share/nginx/html/personal-site

# 构建 todo-app 镜像并将其内容复制到 Nginx 默认目录
COPY --from=todo-app /usr/src/app /usr/share/nginx/html/todo-app

# 暴露80端口
EXPOSE 80

# 启动Nginx
CMD ["nginx", "-g", "daemon off;"]