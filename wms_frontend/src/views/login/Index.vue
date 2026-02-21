<template>
  <div class="login-container">
    <div class="login-left">
      <div class="left-decorations">
        <div class="circle circle-lg"></div>
        <div class="circle circle-md"></div>
        <div class="circle circle-sm"></div>
      </div>

      <div class="left-content">
        <div class="logo-box">
          <el-icon class="logo-icon"><Box /></el-icon>
          <span class="logo-text">WMS Pro</span>
        </div>
        <h2 class="welcome-title">智能仓储控制平台</h2>
        <p class="welcome-desc">数字化 / 智能化 / 可视化的一站式仓储管理解决方案</p>
      </div>
    </div>

    <div class="login-right">
      <div class="login-form-box">
        <div class="form-header">
          <h2>欢迎回来 👋</h2>
          <p>请在此输入您的账号信息登录系统</p>
        </div>

        <el-form
          ref="loginFormRef"
          :model="loginForm"
          :rules="loginRules"
          size="large"
          @keyup.enter="handleLogin"
          class="login-form"
        >
          <el-form-item prop="username">
            <el-input
              v-model="loginForm.username"
              placeholder="请输入账号 (测试如: admin)"
              clearable
              :prefix-icon="User"
              class="custom-input"
            />
          </el-form-item>

          <el-form-item prop="password">
            <el-input
              v-model="loginForm.password"
              type="password"
              placeholder="请输入密码"
              show-password
              clearable
              :prefix-icon="Lock"
              class="custom-input"
            />
          </el-form-item>

          <div class="form-options">
            <el-checkbox v-model="rememberMe">记住密码</el-checkbox>
            <el-link type="primary" :underline="false">忘记密码？</el-link>
          </div>

          <el-form-item>
            <el-button
              type="primary"
              class="submit-btn"
              :loading="loading"
              @click="handleLogin"
            >
              {{ loading ? '身份验证中...' : '立即登录' }}
            </el-button>
          </el-form-item>
        </el-form>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive } from 'vue'
import { useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import { User, Lock, Box } from '@element-plus/icons-vue'
import axios from 'axios'

const router = useRouter()
const loginFormRef = ref(null)
const loading = ref(false)
const rememberMe = ref(false)

const loginForm = reactive({
  username: '',
  password: ''
})

const loginRules = reactive({
  username: [{ required: true, message: '账号不能为空', trigger: 'blur' }],
  password: [{ required: true, message: '密码不能为空', trigger: 'blur' }]
})

const handleLogin = () => {
  if (!loginFormRef.value) return

  loginFormRef.value.validate((valid) => {
    if (valid) {
      loading.value = true

      // 发起真实的登录请求
      axios.post('http://127.0.0.1:8000/api/login/', {
        username: loginForm.username,
        password: loginForm.password
      })
      .then(res => {
        const { access, role, username } = res.data

        // 存储凭证
        localStorage.setItem('token', access)
        localStorage.setItem('role', role)
        localStorage.setItem('username', username)

        ElMessage.success(`登录成功，欢迎回来：${username}`)

        // 智能角色路由分发
        if (role === 'admin') {
          router.push('/admin')
        } else if (role === 'supervisor') {
          router.push('/supervisor')
        } else {
          router.push('/operator')
        }
      })
      .catch(err => {
        console.error(err)
        ElMessage.error('账号或密码错误，请检查！')
      })
      .finally(() => {
        loading.value = false
      })
    }
  })
}
</script>

<style scoped>
/* 整体容器：左右分栏满屏 */
.login-container {
  display: flex;
  width: 100vw;
  height: 100vh;
  background-color: #f0f2f5;
  overflow: hidden;
}

/* ================= 左侧区域 ================= */
.login-left {
  position: relative;
  flex: 1;
  background: linear-gradient(135deg, #1d2b64 0%, #f8cdda 100%); /* 现代深蓝到柔和紫粉的渐变 */
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: 0 80px;
  color: #fff;
  overflow: hidden;
}

/* 装饰性光晕与圆环（增加科技感和层次感） */
.left-decorations .circle {
  position: absolute;
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(8px);
}
.circle-lg { width: 500px; height: 500px; top: -150px; left: -150px; }
.circle-md { width: 300px; height: 300px; bottom: 100px; right: -50px; }
.circle-sm { width: 100px; height: 100px; top: 40%; left: 60%; background: rgba(255, 255, 255, 0.2) !important; }

/* 左侧文字内容 */
.left-content {
  position: relative;
  z-index: 2;
}
.logo-box {
  display: flex;
  align-items: center;
  gap: 12px;
  margin-bottom: 40px;
}
.logo-icon {
  font-size: 42px;
}
.logo-text {
  font-size: 36px;
  font-weight: 700;
  letter-spacing: 2px;
}
.welcome-title {
  font-size: 48px;
  font-weight: 600;
  margin-bottom: 16px;
  line-height: 1.2;
}
.welcome-desc {
  font-size: 18px;
  opacity: 0.85;
  letter-spacing: 1px;
}

/* ================= 右侧区域 ================= */
.login-right {
  width: 500px;
  background-color: #fff;
  display: flex;
  align-items: center;
  justify-content: center;
  box-shadow: -10px 0 30px rgba(0, 0, 0, 0.05);
  z-index: 10;
}

.login-form-box {
  width: 100%;
  max-width: 360px;
  padding: 20px;
}

.form-header {
  margin-bottom: 40px;
}
.form-header h2 {
  font-size: 28px;
  color: #1f2937;
  margin-bottom: 8px;
  font-weight: 600;
}
.form-header p {
  color: #6b7280;
  font-size: 14px;
}

/* 表单定制样式 */
.custom-input :deep(.el-input__wrapper) {
  background-color: #f9fafb;
  box-shadow: none;
  border: 1px solid #e5e7eb;
  border-radius: 8px;
  padding: 4px 12px;
  transition: all 0.3s;
}
.custom-input :deep(.el-input__wrapper.is-focus) {
  background-color: #fff;
  border-color: #409eff;
  box-shadow: 0 0 0 1px #409eff;
}

.form-options {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 24px;
}

.submit-btn {
  width: 100%;
  height: 48px;
  font-size: 16px;
  font-weight: 600;
  border-radius: 8px;
  letter-spacing: 2px;
  background: #2563eb;
  border: none;
  transition: all 0.3s;
}
.submit-btn:hover {
  background: #1d4ed8;
  transform: translateY(-1px);
  box-shadow: 0 4px 12px rgba(37, 99, 235, 0.3);
}

/* 响应式适配：在小屏幕上隐藏左侧，变成居中卡片 */
@media screen and (max-width: 900px) {
  .login-left { display: none; }
  .login-right { width: 100vw; justify-content: center; }
  .login-form-box { max-width: 400px; padding: 40px; box-shadow: 0 10px 25px rgba(0,0,0,0.1); border-radius: 12px; }
}
</style>