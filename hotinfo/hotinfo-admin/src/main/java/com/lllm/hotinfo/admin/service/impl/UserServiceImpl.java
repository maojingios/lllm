package com.lllm.hotinfo.admin.service.impl;

import com.lllm.hotinfo.admin.dao.UserDao;
import com.lllm.hotinfo.admin.service.UserService;
import com.lllm.hotinfo.common.util.PWDUtils;
import com.lllm.hotinfo.admin.util.RegexpUtils;
import com.lllm.hotinfo.admin.util.SystemConstants;
import com.lllm.hotinfo.domain.entity.HiUser;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl extends BaseServiceImpl<HiUser, UserDao> implements UserService {

    @Autowired
    protected UserDao userDao;

    /*验证自动登录的cookie*/
    public int checkACookie(HiUser hiUser){
        return userDao.checkACookie(hiUser);
    }

    /*验证登陆用户名和密码*/
    @Override
    public HiUser getByUserName(String userName, String plantPassword) {
        HiUser hiUser = userDao.getByUserName(userName);
        if (hiUser == null) {
            //TODO 登陆失败要做的事
        }
        //用户名有
        else {
            String password = PWDUtils.EncryptedPWD(plantPassword, 20);
            if (password.equals(hiUser.getPassWord())) {
                return hiUser;
            }
            //密码错误
            else {
                return null;
            }
        }
        return null;
    }

    /*登陆时cookie时用到*/
    @Override
    public HiUser getByUserName(String userName) {
        HiUser HiUser = userDao.getByUserName(userName);
        return HiUser;
    }

    /**
     * 验证
     * @param hiUser
     * @param action
     * @return
     */
    @Override
    public String validationInfo(HiUser hiUser, String action) {
        if (SystemConstants.ACTION_UPDATE.equals(action) && !StringUtils.isNotBlank(hiUser.getNewPWD()+hiUser.getVerificationPWD())) {
            System.out.println(hiUser.getId());
            HiUser user = userDao.getTById(hiUser.getId());
            hiUser.setNewPWD(user.getPassWord());
            hiUser.setVerificationPWD(user.getPassWord());
        }
        /*验证拿到错误信息并传给前端*/
            String val = validatorResults(hiUser,action);
        if (val != null) {
            return val;
        } else if (SystemConstants.ACTION_INSERT.equals(action)) {
            insert(hiUser);
            return "0";
        } else {
            update(hiUser);
            return "0";
        }
    }

    /**
     * 展示除管理员外的其他用户
     * @param admin
     * @return
     */
    @Override
    public List<HiUser> show(HiUser admin) {
        List<HiUser> HiUsers = userDao.selectUsers(admin);
        return HiUsers;
    }

    /**
     * 返回验证标示符
     * @param hiUser
     * @param action
     * @return
     */
    private String validatorResults(HiUser hiUser, String action) {
        if (!StringUtils.isNotBlank(hiUser.getUserName())) {
            return "1-1";
            //用户名为空
        } else if (hiUser.getUserName().trim().length() > 12 || hiUser.getUserName().trim().length() < 3) {
            return "1-2";
            //用户名长度不合规范
        } else if (userDao.uniqueUserName(hiUser) > 0) {
            return "1-3";
            //用户名存在
        } else if (!StringUtils.isNotBlank(hiUser.getPhone())) {
            return "5-1";
            //电话不能为空
        } else if (!RegexpUtils.checkPhone(hiUser.getPhone())) {
            return "5-2";
            //电话不合规格
        } else if (userDao.uniquePhone(hiUser) > 0) {
            return "5-3";
            //电话存在
        } else if (!StringUtils.isNotBlank(hiUser.getEmail())) {
            return "6-1";
            //邮箱不能为空
        } else if (!RegexpUtils.checkEmail(hiUser.getEmail())) {
            return "6-2";
            //邮箱不和规格
        } else if (userDao.uniqueEmail(hiUser) > 0) {
            return "6-3";
            //邮箱存在
        } else if (isAdminUpdate(action) && !StringUtils.isNotBlank(hiUser.getPassWord())) {
            return "2-1";
            //用户旧密码为空
        } else  if (!StringUtils.isNotBlank(hiUser.getNewPWD())) {
            return "3-1";
            //新密码不能为空
        } else if (!StringUtils.isNotBlank(hiUser.getVerificationPWD())) {
            return "4-1";
            //确认密码不能为空
        } else if (isAdminUpdate(action) && validatorOldPassword(hiUser)) {
            return "2-2";
            //原密码错误
        } else if (!hiUser.getVerificationPWD().equals(hiUser.getNewPWD())) {
            return "4-2";
            //确认密码与新密码不一致
        } else if (isAdminUpdate(action) && hiUser.getVerificationPWD().equals(hiUser.getPassWord())) {
            return "3-2";
            //新密码与原密码不能相同
        } else if (hiUser.getNewPWD().trim().length() < 5) {
            return "3-3";
            //新密码长度不足
        }
        return null;
    }

    @Override
    public void delete(long id) {
        userDao.delete(id);
    }

    /**
     * 做更新动作
     * @param hiUser
     * @return
     */
    @Override
    public void update(HiUser hiUser) {
        String passWord = null;
        HiUser user = userDao.getTById(hiUser.getId());
        if (user.getPassWord().equals(hiUser.getNewPWD())){
            passWord = hiUser.getNewPWD();
        }else {
            passWord = PWDUtils.EncryptedPWD(hiUser.getNewPWD(), 20);
        }
        hiUser.setPassWord(passWord);
        hiUser.setUpdated(new Date());
        userDao.update(hiUser);
    }

    /**
     * 做添加动作
     * @param hiUser
     * @return
     */
    @Override
    public void insert(HiUser hiUser) {
        String password = PWDUtils.EncryptedPWD(hiUser.getNewPWD(), 20);
        hiUser.setPassWord(password);
        hiUser.setDelFlag(1);
        hiUser.setRole(0);
        hiUser.setUpdated(new Date());
        hiUser.setCreated(new Date());
        userDao.insert(hiUser);
    }

    /**
     * 验证旧密码
     * @param hiUser
     * @return
     */
    private boolean validatorOldPassword(HiUser hiUser) {
        //从页面拿来的加密后的旧密码
        String password = PWDUtils.EncryptedPWD(hiUser.getPassWord(), 20);
        //拿到原本加密后的旧密码
        long id = hiUser.getId();
        HiUser hiUserById = userDao.getTById(id);
        String oldPassword = hiUserById.getPassWord();
        if (!password.equals(oldPassword)) {
            return true;
        }
        return false;
    }

    /**
     * 判断是否为管理员
     * @param action
     * @return
     */
    private boolean isAdminUpdate(String action){
        if (SystemConstants.ACTION_ADMIN_UPDATE.equals(action)){
            return true;
        }
        return false;
    }

    /**
     * 测试用
     * @param hiUser
     */
    @Override
    public void addUserTest(HiUser hiUser) {
        userDao.insert(hiUser);
    }
}

