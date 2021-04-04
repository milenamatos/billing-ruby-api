  institution = Institution.create({ name: 'UNIFESP', document: '87107579000174', institution_type: :university })
  student = Student.create({ name: 'Milena', document: '54636199057', birth_date: '26/08/1999', gender: :fem, payment: :card })
  registration = Registration.create(total_price: 1000, bill_quantity: 5, due_date: 15, course_name: 'Curso Teste', institution: institution, student: student)

