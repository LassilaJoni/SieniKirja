//
//  TermsAndConditionsView.swift
//  SieniKirja
//
//  Created by Joni Lassila on 15.6.2022.
//

import SwiftUI

struct TermsAndConditionsView: View {
    @State private var showingContentView = false
    var body: some View {
        if showingContentView {
                        ContentView()
                    }
                
        

            
            VStack {
                
                Image("akansieni-1")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 479)
                    
                    .overlay(VStack(alignment: .trailing, spacing: 5) {
                        Text("Kiitos sovelluksen lataamisesta")
                            .font(Font.system(.title, design: .default).weight(.ultraLight))
                        Text("Ennenkuin voit jatkaa sinun pitää hyväksyä sovelluksen käyttöehdot ja tietosuojaseloste")
                            .font(Font.system(.headline, design: .default).weight(.regular))
                    }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .clipped()
                        .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                            
                            .fill(Color(.tertiarySystemBackground))
                            .shadow(color: Color(.sRGBLinear, red: 0/255, green: 0/255, blue: 0/255).opacity(0.9), radius: 18, x: 0, y: 40), alignment: .center)
                            .padding(.top), alignment: .top)

                


                        VStack {
                            HStack {
                                Text("Sovelluksen kuvat saattavat kestää hetken ladata, mutta kun ne on kerran ladannut ei niitä enään tarvitse odottaa")
                                    .font(Font.system(.headline, design: .default).weight(.semibold))
                                Spacer()
                                Image(systemName: "exclamationmark.square.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.accentColor)
                                
                            }
                            Divider()
                            VStack(alignment: .center, spacing: 5) {
                                Text("Painamalla nappia hyväksyt tietosuojaselosteen ja käyttöehdot")
                                    .font(.footnote)
                                    .foregroundColor(Color.secondary)
                                Button(action: {
                                    
                                    UserDefaults.standard.set(true, forKey: "FirstStart")
                                    showingContentView = true
                                }, label: {
                                    NavigationLink(destination: ContentView()) {
                                         Text("Hyväksy & Jatka")
                                        .fontWeight(.semibold)
                                        .font(.headline)
                                        .padding()
                                        .background(Color.blue)
                                        .cornerRadius(40)
                                        .foregroundColor(.white)
                                        .padding(10)
                                        .overlay(
                                        RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color.blue, lineWidth: 5)
                                        )
                                     }
                                })
                                
                                
                                Link("käyttöehdot", destination: URL(string: "https://example.com")!)
                                Link("Tietosuojaseloste", destination: URL(string: "https://example.com")!)
                                
                            }
                            Spacer()
                            VStack {
                                Text("Suomesta löytyy paljon tappavan myrkyllisiä sieniä. Syö vain varmasti tuntemiasi sieniä. Jos et ole varma sienen myrkyllisyydestä älä poimi sitä. Sienikirjan datassa on voinut käydä virhe, joten kehotamme tarkistamaan sienen syötävyyden useammasta eri lähteistä")
                                    .font(Font.system(.footnote, design: .default).weight(.regular))
                            }
                        }
                        .padding(.top)
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Color(.tertiarySystemBackground))
                        .shadow(color: Color(.sRGBLinear, red: 0/255, green: 0/255, blue: 0/255).opacity(0.07), radius: 8, x: 0, y: 4), alignment: .center)
                    .padding(.horizontal)
                .offset(x: 0, y: -50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.bottom)
            .clipped()
        }
        
        
    
    
}


struct TermsAndConditionsView_Previews: PreviewProvider {
    static var previews: some View {
        TermsAndConditionsView()
    }
}
struct VisualEffectView: UIViewRepresentable {
    let style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
