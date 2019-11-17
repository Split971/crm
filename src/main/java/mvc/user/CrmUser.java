package mvc.user;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class CrmUser {

    @NotNull(message="is required")
    @Size(min=1, message="is required")
    private String userName;

    @NotNull(message="is required")
    @Size(min=1, message="is required")
    private String password;

    private String formRule;

    public CrmUser() {

    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFormRule() { return formRule; }

    public void setFormRule(String formRule) { this.formRule = formRule; }
}
