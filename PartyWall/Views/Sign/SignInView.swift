//
//  SignUpView.swift
//  practice
//
//  Created by Vitaliy Petrovskiy on 29.11.21.
//

import SwiftUI
import CoreData
import FirebaseAuth
import Firebase
import FirebaseFirestore
import simd



struct SignInView: View {
    @State private var editingEmailTextField: Bool = false
    @State private var editingPasswordTextField: Bool = false
    @State private var editingUserTextField: Bool = false
    @State private var editingCityTextField: Bool = false
    @State private var emailIconBounce:Bool = false
    @State private var passwordIconBounce:Bool = false
    @State private var cityIconBounce:Bool = false
    @State private var userIconBounce:Bool = false
    @State private var signUpToggle:Bool = true
    @State private var rotationAngle = 0.0
    @State private var fadeToggle:Bool = true
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var city = ""
    @State private var showContentView:Bool = false
    @State private var showAlertView:Bool = false
    @State private var alertTitle:String = ""
    @State private var alertMessage:String = ""
    @State var shouldShowImagePicker = false
    @State var image: UIImage?
    @State var isLoading = false
    @State var isSuccessful = false
    @StateObject var authenticationManager = AuthenticationManager()
    @EnvironmentObject var user: UserStore
    private let generator = UISelectionFeedbackGenerator()
  
    
    var body: some View {
        ZStack {
            VStack{
                VStack(alignment: .leading, spacing: 16){
                    Text(signUpToggle ? "Вход" : "Регистрация")
                        .font(Font.largeTitle.bold())
                    
                    Text(signUpToggle ? "Введите email и пароль для входа" : "Выберите изображение и заполните необходимые поля")
                        .font(.subheadline)
                    
                    if signUpToggle {
                        userlogin
                    }
                    
                    if !signUpToggle {
                       
                        imagebutton
                        userinfo
                    }
                   
                    
                    //Кнопка входа
                    Button(action: {
                        signUpToggle ? login() : registration()
                         
                    }
                           ,
                           label: {
                        GeometryReader() { proxy in
                            ZStack {
                                AngularGradient(gradient: Gradient(colors: [.black,Color("ShadowC")]), center: .center, angle: .degrees(0))
                                    .blendMode(.overlay)
                                    .blur(radius: 8.0)
                                    .mask(
                                        RoundedRectangle(cornerRadius: 16.0)
                                            .frame(height:50)
                                            .frame(maxWidth: proxy.size.width - 16)
                                            .blur(radius: 8.0)
                                    )
                                
                                Text(signUpToggle ? "Войти" : "Регистрация")
                                    .font(.headline)
                                    .frame(width: proxy.size.width - 16)
                                    .frame(height: 50)
                                    .gradientForeground(colors: [Color("Party"),.primary])
                                    .background(
                                        Color("ShadowB")
                                            .opacity(0.8)
                                    )
                                    .overlay(RoundedRectangle(cornerRadius: 16.0)
                                                .stroke(Color.primary, lineWidth: 1.9)
                                                .blendMode(.normal)
                                                .opacity(0.7)
                                    ).cornerRadius(16.0)
                                   
                                    
                            }
                            
                        }
                        .frame(height: 50)
                    })
                    if signUpToggle {
                        
                        VStack(spacing: 40) {
                            switch
                            authenticationManager.biometryType{
                            case .faceID:
                                PrimaryButton(image: "faceid", text: "Войти с FaceID")
                                    .onTapGesture {
                                        Task.init {
                                            await
                                            authenticationManager.authenticatedWithBiometrycs()
                                        }
                                     /*   if authenticationManager.isAuthenticated {
                                           
                                        }
                                        else {
                                            SignInView()
                                        }
                                      */
                                    }
                            case .touchID:
                                PrimaryButton(image: "touchid", text: "Войти с TouchID")
                                    .onTapGesture {
                                        Task.init {
                                            await
                                            authenticationManager.authenticatedWithBiometrycs()
                                        }
                                    }
                            default:
                                PrimaryButton(image: "person.fill", text: "Войти с учетными данными")
                                
                            }
                               
                        }
                        .frame(maxWidth: .infinity)
                        .alert(isPresented: $authenticationManager.showAlert){
                            Alert(title: Text("Ошибка"), dismissButton: .default(Text("Ладно")))
                        }
                    }
                    
                    if !signUpToggle{
                        Text("Тут типа согласие на права")
                            .frame(width:300, height: 1,alignment: .leading)
                            .font(.footnote)
                        Rectangle()
                            .frame(height:1)
                            .foregroundColor(.primary.opacity(0.7))
                        
                    }
                    VStack(alignment: .leading, spacing: 16,content: {
                        
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.7)){
                                signUpToggle.toggle()
                                self.rotationAngle += 180
                            }
                        }, label: {
                            HStack(spacing: 4){
                                Text(signUpToggle ? "Нет аккаунта?" : "Уже есть аккаунт?")
                                    .font(.footnote)
                                    .foregroundColor(Color.primary.opacity(0.7))
                                
                                Text(signUpToggle ? "Регистрация" : "Вход")
                                    .font(.footnote)
                                    .bold()
                                    .gradientForeground(colors: [Color("Party"),.primary])
                            }
                        })
                        if signUpToggle{
                            Button(action: {
                                sendPasswordResetEmail()
                            },
                                   label: {
                                HStack(spacing: 4){
                                    Text("Забыли пароль?")
                                        .font(.footnote)
                                        .foregroundColor(Color.primary.opacity(0.7))
                                    Text("Сброс пароля")
                                        .font(.footnote)
                                        .bold()
                                        .gradientForeground(colors: [Color("Party"),.primary])
                                    
                                }
                            })
                           
                            
                            Rectangle()
                                .frame(height:1)
                                .foregroundColor(.white.opacity(0.1))
                            
                            Button(action: {
                                print("sign in with apple")
                            }, label: {
                                AppleButton()
                                    .frame(height: 50)
                                    .cornerRadius(16)
                            })
                        }
                        
                    })
                    
                }
                .padding(20)
              
            }
           
            .rotation3DEffect(Angle(degrees: rotationAngle), axis: (x: 0.0, y: 0.1, z: 0.0))
                .background(.ultraThinMaterial, in:
                                RoundedRectangle(cornerRadius: 30,style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .stroke(.linearGradient(colors: [.primary.opacity(0.3), .black.opacity(0.1)], startPoint: .top, endPoint: .bottom))
                        .blendMode(.overlay)
                )
                .cornerRadius(30.0)
                .padding(20)
                .rotation3DEffect(Angle(degrees: rotationAngle), axis: (x: 0.0, y: 0.1, z: 0.0))
                .alert(isPresented: $showAlertView){
                    Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .cancel())
            }
            if isLoading {
                LoadingView()
                
            }
            if isSuccessful {
               SuccessView()
            }
               
        }
        .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
                    ImagePicker(image: $image)
                        .ignoresSafeArea()
                }
        .background(
            Image("PartyLogo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300, alignment: .top)
        )
        
       
            
    }
    
    
    
    
    var imagebutton: some View {
        HStack {
            Spacer()
            
            Button {
                shouldShowImagePicker.toggle()
                
            } label: {
                VStack {
                    if let image = self.image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 128, height: 128)
                            .cornerRadius(64)
                        
                    } else {
                        Image(systemName: "person.badge.plus")
                            .font(.system(size: 64))
                            .padding()
                            .foregroundColor(Color(.label))
                        
                    }
                    
                }
                .overlay(RoundedRectangle(cornerRadius: 64)
                                                    .stroke(Color.black, lineWidth: 3)
                )
                
            }
                              
         
            Spacer()
        }
    }
    
    var userlogin: some View {
        VStack(alignment: .leading, spacing: 16){
        HStack(spacing: 12.0) {
            TextFieldIcon(iconname: "envelope.open.fill", currentlyEditing: $editingEmailTextField)
                .scaleEffect(emailIconBounce ? 1.2 : 1.0)
                .padding(.horizontal,10)
            TextField("Email", text: $email){
                isEditing in
                editingEmailTextField = isEditing
                editingPasswordTextField = false
                generator.selectionChanged()
              
            }
            .autocapitalization(.none)
            .textContentType(.emailAddress)
            
            
        }
        .frame(height: 55)
        .overlay(RoundedRectangle(cornerRadius: 16.0)
                    .stroke(Color.primary, lineWidth: 1.9)
                    .blendMode(.normal)
                    .opacity(0.7))
        .background(Color("ShadowC")
                        .cornerRadius(16).opacity(0.7))
        .foregroundColor(.primary)
        
        HStack(spacing: 12.0) {
            TextFieldIcon(iconname: "key.fill", currentlyEditing: $editingPasswordTextField).padding(.horizontal,10)
             
            
            SecureField("Пароль", text: $password)
                .autocapitalization(.none)
                .textContentType(.password)
            
        }
        .frame(height: 55)
        .overlay(RoundedRectangle(cornerRadius: 16.0)
                    .stroke(Color.primary, lineWidth: 1.9)
                    .blendMode(.normal)
                    .opacity(0.7))
        .background(Color("ShadowC")
                        .cornerRadius(16).opacity(0.7))
        .foregroundColor(.primary)
      
    }
    }
    
    var userinfo: some View {
        VStack(alignment: .leading, spacing: 16){
            
            HStack(spacing: 12.0) {
                TextFieldIcon(iconname: "person.fill", currentlyEditing: $editingUserTextField)
                    .scaleEffect(userIconBounce ? 1.2 : 1.0)
                    .padding(.horizontal,10)
                TextField("Имя пользователя", text: $username){
                    isEditing in
                    editingUserTextField = isEditing
                    
                    generator.selectionChanged()
                   
                }
                .autocapitalization(.none)
            }
            .frame(height: 55)
            .overlay(RoundedRectangle(cornerRadius: 16.0)
                        .stroke(Color.primary, lineWidth: 1.9)
                        .blendMode(.normal)
                        .opacity(0.7))
            .background(Color("ShadowC")
                            .cornerRadius(16).opacity(0.7))
            .foregroundColor(.primary)
            
            HStack(spacing: 12.0) {
                TextFieldIcon(iconname: "envelope.open.fill", currentlyEditing: $editingEmailTextField)
                    .scaleEffect(emailIconBounce ? 1.2 : 1.0)
                    .padding(.horizontal,10)
                TextField("Email", text: $email){
                    isEditing in
                    editingEmailTextField = isEditing
                    
                   
                   
                }
                .autocapitalization(.none)
                .textContentType(.emailAddress)
                
                
            }
            .frame(height: 55)
            .overlay(RoundedRectangle(cornerRadius: 16.0)
                        .stroke(Color.primary, lineWidth: 1.9)
                        .blendMode(.normal)
                        .opacity(0.7))
            .background(Color("ShadowC")
                            .cornerRadius(16).opacity(0.7))
            .foregroundColor(.primary)
            
            HStack(spacing: 12.0) {
                TextFieldIcon(iconname: "key.fill", currentlyEditing: $editingPasswordTextField).padding(.horizontal,10)
                    .scaleEffect(passwordIconBounce ? 1.2 : 1.0)
                
                SecureField("Пароль", text: $password)
                    .autocapitalization(.none)
                    .textContentType(.password)
                
            }
            .frame(height: 55)
            .overlay(RoundedRectangle(cornerRadius: 16.0)
                        .stroke(Color.primary, lineWidth: 1.9)
                        .blendMode(.normal)
                        .opacity(0.7))
            .background(Color("ShadowC")
                            .cornerRadius(16).opacity(0.7))
            .foregroundColor(.primary)
         
            
            HStack(spacing: 12.0) {
                TextFieldIcon(iconname: "house.fill", currentlyEditing: $editingCityTextField).padding(.horizontal,10)
                    .scaleEffect(cityIconBounce ? 1.2 : 1.0)
                
                TextField("Город", text: $city)
                    .autocapitalization(.none)
                 
                
            }
            .frame(height: 55)
            .overlay(RoundedRectangle(cornerRadius: 16.0)
                        .stroke(Color.primary, lineWidth: 1.9)
                        .blendMode(.normal)
                        .opacity(0.7))
            .background(Color("ShadowC")
                            .cornerRadius(16).opacity(0.7))
            .foregroundColor(.primary)
          
            
        }
    }
    
    func login() {
        self.hideKeyboard()
        isLoading.toggle()
        
      
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password){
            (result,err) in
            isLoading.toggle()
            guard err == nil else {
                self.alertTitle = "Упс, не вышло"
                self.alertMessage = (err!.localizedDescription)
                self.showAlertView.toggle()
                return
            }
            self.isSuccessful.toggle()
           
            UserDefaults.standard.set(true, forKey: "isLogged")
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isSuccessful.toggle()
                self.email = ""
                self.password = ""
                self.user.showLogin = false
                self.user.isLogged = true
            }
        }
         
    }
    func registration() {
        self.hideKeyboard()
        isLoading.toggle()
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password){
            (result,err) in
            isLoading.toggle()
            guard err == nil else {
                self.alertTitle = "Упс, не вышло"
                self.alertMessage = (err!.localizedDescription)
                self.showAlertView.toggle()
                return
            }
            self.persistImageToStorage()
          
            isSuccessful.toggle()
           
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isSuccessful.toggle()
               
                self.user.showLogin = false
                self.user.isLogged = true
              
              
                    }
        }
         
    }
      
    func sendPasswordResetEmail(){
        
        FirebaseManager.shared.auth.sendPasswordReset(withEmail: email){
            err in
            guard err == nil else {
                self.alertTitle = "Упс, не вышло"
                self.alertMessage = (err!.localizedDescription)
                self.showAlertView.toggle()
                return
            }
                alertTitle = "Пароль выслан на указанный email"
                alertMessage = "Проверьте почтовый ящик с новым паролем"
                self.showAlertView.toggle()
        }
    }
   
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    private func persistImageToStorage() {
           guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
           let ref = FirebaseManager.shared.storage.reference(withPath: uid)
           guard let imageData = self.image?.jpegData(compressionQuality: 0.5) else { return }
           ref.putData(imageData, metadata: nil) { metadata, err in
               if let err = err {
                   self.alertTitle = "Упс, не вышло"
                   self.alertMessage = (err.localizedDescription)
                   self.showAlertView.toggle()
                   return
               }

               ref.downloadURL { url, err in
                   if let err = err {
                       self.alertTitle = "Упс, не вышло"
                       self.alertMessage = (err.localizedDescription)
                       self.showAlertView.toggle()
                       return
                   }
                   guard let url = url else {return}
                   storeUserInformation(imageProfileUrl: url)
               }
           }
       }
    
    
    
    
        private func storeUserInformation(imageProfileUrl: URL) {
            guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
            let userData = ["email": self.email, "uid": uid, "profileImageUrl": imageProfileUrl.absoluteString, "username": self.username, "city": self.city]
            FirebaseManager.shared.firestore.collection("users")
                .document(uid).setData(userData) { err in
                if let err = err {
                    self.alertTitle = "Упс, не вышло"
                    self.alertMessage = (err.localizedDescription)
                    self.showAlertView.toggle()
                    return
                }

                print("Success")
            }
    }
    
    
  
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portrait)
    }
}


extension View  {
    public func gradientForeground(colors:[Color]) -> some View {
        self.overlay(LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(self)
        
    }
}
