//
//  SupabaseService.swift
//  SessionsPreparing3
//
//  Created by Евгений Михайлов on 23.12.2024.
//

import Foundation
import Supabase


class SupabaseService {
    
    var supabase = SupabaseClient(supabaseURL: URL(string: "https://smueyuadnkwfxxzkupej.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNtdWV5dWFkbmt3Znh4emt1cGVqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE3NDcxMTYsImV4cCI6MjA0NzMyMzExNn0.diZuAMATbCdbuvFeSQafXLHdLLIfJ_3bEA7FbuyWof8")
    
    static var instance: SupabaseService = SupabaseService()
    
    func login(email: String, password: String) async throws {
        try await supabase.auth.signIn(email: email, password: password)
        
    }
    
}


