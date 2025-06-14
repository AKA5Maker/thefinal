# 使用官方 Node.js 基础镜像
FROM node:16-alpine

# 设置工作目录
WORKDIR /usr/src/app

# 复制 package.json 和 lock 文件（利用缓存机制）
COPY package*.json ./

# 安装依赖
RUN npm install

# 复制源代码
COPY . .

# 暴露3000端口
EXPOSE 3000

# 启动命令
CMD ["node", "app.js"]