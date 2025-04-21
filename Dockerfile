FROM python:3.10-slim

# 环境变量配置
ENV PYTHONUNBUFFERED=1 \
    LABEL_STUDIO_BASE_DATA_DIR=/data \
    PORT=8080

# 安装依赖
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

# 创建工作目录
WORKDIR /app

# 安装 label-studio
RUN pip install label-studio

# 暴露端口（Render 会自动识别）
EXPOSE 8080

# 运行 Label Studio
CMD ["label-studio", "start", "--host", "0.0.0.0", "--port", "8080"]
