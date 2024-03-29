import Foundation

protocol LoginPresenterDelegate {
    func showMessage(title: String, message: String)
    func goHome()
}

final class LoginPresenter {
    var delegate: LoginPresenterDelegate?
    
    func login(userModel: UserModel) {
        let manager = UserManager(business: UserBusiness())
        manager.login(email: userModel.email, password: userModel.password) { model in
            self.delegate?.showMessage(title: "Sucesso", message: "Logado!")
            
        } failureHandler: { [weak self] error in
            self?.delegate?.showMessage(title: "Erro", message: "\(error.localizedDescription)")
        }
    }
    
    func goHome() {
        self.delegate?.goHome()
    }
}
