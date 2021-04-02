module Helper
  def set_institution(item)
    return {
      id: item.id,
      nome: item.name,
      CNPJ: item.document,
      tipo: Institution.institution_types[item.institution_type],
      dt_criacao: item.created_at.strftime("%F %T")
    }
  end

  def set_student(item)
    return {
      id: item.id,
      nome: item.name,
      CPF: item.document,
      data_nascimento: item.birth_date,
      telefone: item.telephone,
      genero: Student.genders[item.gender],
      pagamento: Student.payments[item.payment],
      dt_criacao: item.created_at.strftime("%F %T")
    }
  end

  def set_bill(item)
    return {
      id: item.id,
      valor: item.price,
      data_vencimento: item.due_date,
      status: Bill.statuses[item.status],
      matricula_id: item.registration_id,
      dt_criacao: item.created_at.strftime("%F %T")
    }
  end
end