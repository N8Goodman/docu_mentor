user1 = User.create!(
  user_name: "nate_admin",
  email: "nmg214@gmail.com",
  password: "password",
  password_confirmation: "password",
  admin: true
)

Icon.create!(name: 'ppt', icon_img: '/assets/Document-Microsoft-PowerPoint-icon.png')
Icon.create!(name: 'doc', icon_img: '/assets/Document-Microsoft-Word-icon.png')
Icon.create!(name: 'excel', icon_img: '/assets/Document-Microsoft-Excel-icon.png')
Icon.create!(name: 'pdf', icon_img: '/assets/Adobe-PDF-Document-icon.png')
Icon.create!(name: 'empty', icon_img: '/assets/Document-Blank-icon.png')
Icon.create!(name: 'unknown', icon_img: '/assets/Document-Help-icon.png')
Icon.create!(name: 'zip', icon_img: '/assets/Folder-Compressed-icon.png')
Icon.create!(name: 'rar', icon_img: '/assets/Folder-RAR-icon.png')
Icon.create!(name: 'png', icon_img: '/assets/Image-PNG-icon.png')
Icon.create!(name: 'jpeg', icon_img: '/assets/Image-JPEG-icon.png')


Document.create!(document_name: "Driver's License", description: "A valid driver's license")
Document.create!(document_name: "Business License", description: "Document showing that a legal business has been registered with the state")
Document.create!(document_name: "Invoice", description: "An itemized list of equipment for purchase")
Document.create!(document_name: "Common Application", description: "The standard application form. Accepted by most colleges")
Document.create!(document_name: "Loan Application", description: "Application, completed by the borrower, detailing how much money is being loaned, and what it will be user for")
Document.create!(document_name: "Campus Housing Form", description: "The form needed to register for on-campus housing")
Document.create!(document_name: "Meal Plan Form", description: "The form needed to register for on-campus dining")
Document.create!(document_name: "Lease Contract", description: "The contract between lessee and lessor, stipulating the conditions of the deal")
Document.create!(document_name: "Health Insurance Proof", description: "Document showing that customer has health insurance")
Document.create!(document_name: "Recommendation", description: "A written reccommendation from a prior employer or professor")
Document.create!(document_name: "References", description: "A list of contacts who can be reached for references")
Document.create!(document_name: "Letter of Intent", description: "Letter indicating interest in becoming an employee of a company")
Document.create!(document_name: "Signed Offer Letter", description: "A signed copy of the offer letter extended by the future employer")
Document.create!(document_name: "Bank Statement", description: "A copy of the borrower's monthly statement from their primary account")
