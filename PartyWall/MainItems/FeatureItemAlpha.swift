
import SwiftUI

struct FeatureItemAlpha: View {
    var posterAlpha:posterAlpha = posterAlphadata[0]
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0){
         
            Text(posterAlpha.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary, Color("Party").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            
            Text(posterAlpha.name.uppercased())
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
            
            Text(posterAlpha.date)
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.secondary)
           
            Text("@Party Wall")
                .font(.caption2)
                .foregroundStyle(.linearGradient(colors: [.primary, Color("Party").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(maxWidth: .infinity, alignment: .bottomTrailing)
        
        }
        .padding(.all, 20.0)
        .padding(.vertical, 20)
        .frame(height: 350.0)
        
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 30,
                                 style: .continuous))
       
       
       
        
    .padding(.horizontal, 20)
    }
}

struct FeatureItemAlpha_Previews: PreviewProvider {
    static var previews: some View {
        FeatureItemAlpha()
            .preferredColorScheme(.dark)
    }
}
