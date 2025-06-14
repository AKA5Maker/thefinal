# 使用Nginx作为基础镜像
FROM nginx:1.21-alpine

# 删除默认的Nginx配置
RUN rm /etc/nginx/conf.d/default.conf

# 添加自定义Nginx配置（如果需要）
COPY nginx.conf /etc/nginx/conf.d/

# 将网站文件复制到Nginx默认目录
COPY . /usr/share/nginx/html

# 暴露80端口
EXPOSE 80

# 启动Nginx
CMD ["nginx", "-g", "daemon off;"]